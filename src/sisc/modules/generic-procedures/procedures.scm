;;;;;;;;;; HELPERS ;;;;;;;;;;

(define (take lis k)
  (let recur ((lis lis) (k k))
    (if (or (zero? k) (null? lis)) ;;added null check here
        '()
        (cons (car lis)
              (recur (cdr lis) (- k 1))))))


;;;;;;;;;; TYPES ;;;;;;;;;;

(define (get-methods proc)
  (procedure-property proc 'methods))

(define (set-methods! proc methods)
  (set-procedure-property! proc 'methods methods))

(define-struct method-list (methods arity cache))

(define (generic-procedure-methods proc)
  (method-list-methods (cdr (get-methods proc))))

(define (set-generic-procedure-methods! proc methods)
  (set-methods! proc (cons (mutex/new)
                           (make-method-list methods 0 #f))))

(define (add-method proc method)
  (add-methods proc (list method)))

(define (add-methods proc methods)
  (add-methods-to-list (get-methods proc) methods))

(define (add-methods-to-list methods new-methods)
  (mutex/synchronize-unsafe
   (car methods)
   (lambda ()
     (set-cdr! methods
               (make-method-list
                (let loop ([meths (method-list-methods
                                   (cdr methods))]
                           [new-methods new-methods])
                  (if (null? new-methods)
                      meths
                      (loop (add-method-helper meths
                                               (car new-methods))
                            (cdr new-methods))))
                0
                #f)))))

(define (add-method-helper methods m)
  (let loop ([meths methods])
    (if (null? meths)
        (cons m methods)
        (if (method= m (car meths))
            (begin
              (set-car! meths m)
              methods)
            (loop (cdr meths))))))


;;;;;;;;;; METHOD CACHE ;;;;;;;;;;

;;What we really want is a hashtable whose keys are lists which are
;;compared element-by-element using eqv?
;;Instead we are using a nested hashtable

(define (make-method-cache)
  (make-hashtable eqv? #f))

(define (method-cache-get cache otypes)
  (if (null? otypes)
      (hashtable/get cache otypes)
      (let ([cache (hashtable/get cache (car otypes))])
        (and cache (method-cache-get cache (cdr otypes))))))

(define (method-cache-put! cache otypes val)
  (if (null? otypes)
      (hashtable/put! cache otypes val)
      (method-cache-put! (hashtable/get! cache
                                         (car otypes)
                                         make-method-cache)
                         (cdr otypes)
                         val)))
        

;;;;;;;;;; DISPATCH ;;;;;;;;;;

;;returns a list of applicable methods and ambiguous methods. The
;;applicable methods are returned in a total order based on their
;;specificity with respect to otypes. Ambiguous methods are methods
;;for which there is at least one other (consequently also ambiguous)
;;method that could inhabit the same place in the total order.
;;
;;The algorithm used here is the same as the one employed by Goo
;;(http://www.googoogaga.org/), Dylan and others.
(define (applicable-methods proc otypes)
  (applicable-methods-wrapper (get-methods proc) otypes take))
(define (applicable-methods-wrapper methods args get-types)
  (mutex/synchronize-unsafe
   (car methods)
   (lambda ()
     (let* ([mlist (cdr methods)]
            [cache (method-list-cache mlist)])
       (if (not cache)
           (let ([meths (method-list-methods mlist)])
             (set! cache (make-method-cache))
             (set! mlist (make-method-list
                          meths
                          (+ (apply max 0 (map method-arity meths))
                             1)
                          cache))
             (set-cdr! methods mlist)))
       (let* ([otypes (get-types args (method-list-arity mlist))]
              [res (method-cache-get cache otypes)])
         (if res
             (values (car res) (cdr res))
             (call-with-values
                 (lambda () (applicable-methods-helper
                             (method-list-methods mlist)
                             otypes))
               (lambda (applicable ambiguous)
                 (method-cache-put! cache
                                    otypes
                                    (cons applicable ambiguous))
                 (values applicable ambiguous)))))))))
(define (applicable-methods-helper methods otypes)
  (define (insert applicable ambiguous m)
    (if (null? applicable)
        (values (list m) ambiguous)
        (let ([other (car applicable)])
          (case (compare-methods m other otypes)
            ((more-specific)
             (values (cons m applicable) ambiguous))
            ((less-specific)
             (call-with-values (lambda () (insert (cdr applicable)
                                                  ambiguous
                                                  m))
               (lambda (applicable ambiguous)
                 (values (cons other applicable) ambiguous))))
            (else
              (values '() (cons m applicable)))))))
  ;;optimization opportunity: turn otypes into a vector so that
  ;;method-applicable can do a fast size test. Not much point doing
  ;;this though if we are going to cache the result of this entire
  ;;operation anyway.
  (let loop ([methods    methods]
             [applicable '()]
             [ambiguous  '()])
    (if (null? methods)
        (values applicable ambiguous)
        (let ([m (car methods)])
          (if (method-applicable? m otypes)
              (call-with-values (lambda () (insert applicable
                                                   ambiguous
                                                   m))
                (lambda (applicable ambiguous)
                  (loop (cdr methods) applicable ambiguous)))
              (loop (cdr methods) applicable ambiguous))))))

(define (call-method-helper applicable args)
  (apply (method-procedure (car applicable))
         (let ([applicable (cdr applicable)])
           (and (not (null? applicable))
                (lambda args (call-method-helper applicable args))))
         args))

(define (limited-type-of args count)
  (map type-of (take args count)))

(define (invoke-generic-procedure proc args)
  (call-with-values
      (lambda () (applicable-methods-wrapper (get-methods proc)
                                             args
                                             limited-type-of))
    (lambda (applicable ambiguous)
      (if (null? applicable)
          (error (string-append "no applicable method for args ~s "
                                "in generic procedure ~s")
                 args proc))
      (call-method-helper applicable args))))


;;;;;;;;;; CONSTRUCTORS ;;;;;;;;;;

(define (make-generic-procedure . procs)
  (define (proc . args) (invoke-generic-procedure proc args))
  (set-generic-procedure-methods! proc '())
  (add-methods proc (apply append
                           (map generic-procedure-methods procs)))
  (let ([methods (get-methods proc)])
    (for-each (lambda (p) (set-methods! p methods)) procs))
  proc)

(define-simple-syntax (define-generic ?name . ?rest)
  (define ?name (make-generic-procedure . ?rest)))

(define-syntax define-generics
  (syntax-rules ()
    [(_ (?name . ?procs) . ?rest)
     (begin (define-generic ?name . ?procs)
            (define-generics . ?rest))]
    [(_ ?name . ?rest)
     (begin (define-generic ?name)
            (define-generics . ?rest))]
    [(_)
     (begin)]))

(define-simple-syntax (define-method (?name . ?signature) . ?body)
  (add-method ?name (method ?signature . ?body)))

(define-simple-syntax (define-methods ?name (?signature . ?body) ...)
  (add-methods ?name (list (method ?signature . ?body) ...)))
