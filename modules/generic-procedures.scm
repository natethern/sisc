;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;; GENERIC PROCEDURES ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;; HELPER FUNCTIONS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;same as in srfi-1
(define (every2 pred x y)
  (or (null? x)
      (null? y)
      (and (pred (car x) (car y)) (every2 pred (cdr x) (cdr y)))))

;;simplified from srfi-1
(define (any pred l)
  (and (pair? l) (or (pred (car l)) (any pred (cdr l)))))
(define (filter pred l)
  (if (pair? l)
      (if (pred (car l))
          (cons (car l) (filter pred (cdr l)))
          (filter pred (cdr l)))
      l))
(define (remove pred l) (filter (lambda (x) (not (pred x))) l))


;;;;;;;;;;;;;;;;;;;;;;;;;; TYPE SYSTEM ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;meta types
(define (meta x) (cons 'meta x))
(define (meta-type m) (cdr m))
(define (meta? x) (and (pair? x) (eq? (car x) 'meta)))

(define (type-of o)
  (cond ((java/class? o) (meta o))
        ((java/object? o) (java/class-of o))
        (else
          ;;hack
          (java/class-of (java/wrap o)))))

  ;;this will need to change once we support non-java types
(define (type<= x y)
  (cond ((and (meta? x) (meta? y))
         (type<= (meta-type x) (meta-type y)))
        ((meta? x) #f)
        ((meta? y) #f)
        (else (java/assignable? y x))))
(define (instance-of? x y)
  (type<= (type-of x) y))

(define (types<= x y) (every2 type<= x y))
(define (instances-of? x y) (every2 instance-of? x y))

(define (class-direct-superclasses class)
  (let ([sc (java/superclass class)]
        [intfs (vector->list (java/interfaces class))])
    (if (java/null? sc)
        intfs
        (cons sc intfs))))
(define (class-direct-slot-names class)
  (map java/name (filter (lambda (f) (memq 'public (java/modifiers f)))
                         (vector->list (java/decl-fields class)))))

;;The class precedence list of a class is a total ordering on the
;;class and its superclasses/interfaces that is consistent with the
;;local precedence orders specified in the class definitions.
;;The algorithm used here is the same as the one employed by Goo
;;(http://www.googoogaga.org/), Dylan and others.
;;
;;ATM the cpl isn't used for anything, but in future it will serve as
;;a tie breaker when sorting applicable methods by specificity during
;;the invocation of generic procedures.
;;
;;Because computing the cpl is expensive we cache the results.
(define *CLASS-PRECEDENCE-LISTS* (make-hashtable))
(define (class-precedence-list class)
  (hashtable/get! *CLASS-PRECEDENCE-LISTS* class
                  (lambda () (compute-class-precedence-list class))))
(define (compute-class-precedence-list class)
  (define (merge-lists partial-cpl remaining-lists)
    (set! remaining-lists (remove null? remaining-lists))
    (if (null? remaining-lists)
        (reverse partial-cpl)
        (let* ([candidate
                (lambda (c)
                  (and (not (any (lambda (l) (memq c (cdr l)))
                                 remaining-lists))
                       c))]
               [next (any (lambda (l) (candidate (car l)))
                          remaining-lists)])
          (if next
              (merge-lists
               (cons next partial-cpl)
               (map (lambda (l) (if (eq? (car l) next) (cdr l) l))
                    remaining-lists))
              (error "inconsistent class precedence graph for ~a"
                     class)))))
  (merge-lists (list class)
               (let ([parents (class-direct-superclasses class)])
                 (append (map class-precedence-list parents)
                         (list parents)))))

;;compares two types taking into account the cpl of c
;;NB: c must be a sub-type of both types
(define (compare-types x y c)
  (cond ((and (meta? x) (meta? y))
         (compare-types (meta-type x) (meta-type y) (meta-type c)))
        ((or (meta? x) (meta? y))
         'ambiguous)
        (else
          (let ([x<y? (java/assignable? y x)]
                [y<x? (java/assignable? x y)])
            (cond ((and x<y? y<x?) 'equal)
                  (x<y? 'more-specific)
                  (y<x? 'less-specific)
                  (else
                    ;;find first occurrence of x or y in c's cpl
                    (let loop ([cpl (class-precedence-list c)])
                      (if (null? cpl)
                          'ambiguous;;shouldn't happen
                          (let ([p (car cpl)])
                            (cond ((eq? p x) 'more-specific)
                                  ((eq? p y) 'less-specific)
                                  (else (loop (cdr cpl)))))))))))))


;;;;;;;;;;;;;;;;;;;;;;;; METHOD OBJECTS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;we could be using srfi-9's structures here, but I do want to keep
;;this code clean of any srfi dependencies.

;;a method is a procedure. It has an arity and a signature (a list of
;;parameter types) and flag indicating whether it can take rest
;;parameters
(define (make-method f types rest?)
  (vector f (length types) types rest?))
(define (method-procedure m)    (vector-ref m 0))
(define (method-arity m)        (vector-ref m 1))
(define (method-types m)        (vector-ref m 2))
(define (method-rest? m)        (vector-ref m 3))

(define (method= m1 m2)
  (and (= (method-arity m1) (method-arity m2))
       (eq? (method-rest? m1) (method-rest? m2))
       (every2 eq? (method-types m1) (method-types m2))))

;;Checks whether a method can be called with arguments of specific
;;types. This will eventually replace the preceeding procedure
(define (method-applicable? m otypes)
  (let ([l (length otypes)]
        [a (method-arity m)])
    (and (or (= a l) (and (< a l) (method-rest? m)))
         (types<= otypes (method-types m)))))

;;compares two methods m1, taking into account the cpls of otypes
;;NB: we assume that both methods are applicable, i.e. otypes matches
;;both their signature.
(define (compare-methods m1 m2 otypes)
  (let loop ([m1-t (method-types m1)]
             [m2-t (method-types m2)]
             [o-t  otypes]
             [res 'equal])
    (cond ((and (null? m1-t) (null? m2-t))
           res)
          ((null? m1-t)
           (if (eq? res 'more-specific)
               'ambiguous
               'less-specific))
          ((null? m2-t)
           (if (eq? res 'less-specific)
               'ambiguous
               'more-specific))
          (else
            (let ([m1-tn (cdr m1-t)]
                  [m2-tn (cdr m2-t)]
                  [o-tn  (cdr o-t)])
              (case (compare-types (car m1-t) (car m2-t) (car o-t))
                ((equal)
                 (loop m1-tn m2-tn o-tn res))
                ((ambiguous)
                 (loop m1-tn m2-tn o-tn
                       (if (or (eq? res 'less-specific)
                               (eq? res 'more-specific))
                           res
                           'ambiguous)))
                ((more-specific)
                 (if (eq? res 'less-specific)
                     'ambiguous
                     (loop m1-tn m2-tn o-tn 'more-specific)))
                ((less-specific)
                 (if (eq? res 'more-specific)
                     'ambiguous
                     (loop m1-tn m2-tn o-tn 'less-specific)))))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;; MAIN ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;This maps procedure to lists of methods ordered by their
;;"specificity", i.e. methods appearing earlier in the list are always
;;more specific or incomparable (i.e. neither less or more specific)
;;than methods appearing later.
(define (get-methods proc)
  (procedure-property proc 'methods))

(define (generic-procedure-methods proc)
  (cdr (get-methods proc)))

(define (generic-procedure-next proc)
  (procedure-property proc 'next))

(define (make-method-list) (list (monitor/new)))
(define (constructor-methods class) (make-method-list))

;;we keep track of all the classes whose methods we have already
;;learned about
(define *CLASSES* (make-hashtable))
;;for each Java method name we maintain a method list which is shared
;;by all the generic procedures representing java methods of that name
(define *JAVA-METHODS* (make-hashtable))
(define (java-methods name)
  (hashtable/get! *JAVA-METHODS* name make-method-list))
;;Java constructors are stored in per-class method lists
(define *JAVA-CONSTRUCTORS* (make-hashtable))
(define (java-constructor-methods class)
  (hashtable/get! *JAVA-CONSTRUCTORS* class make-method-list))

;;constructors are chained by chaining their contained generic
;;procedures, which get created lazily on a per-class basis
(define (constructor proc class)
  (hashtable/get!
   (procedure-property proc 'generic-constructors)
   class
   (lambda ()
     (apply _make-generic-procedure
            ((procedure-property proc 'constructor-methods) class)
            (let ([next (procedure-property proc 'next)])
              (if next
                  (list (constructor next class))
                  '()))))))

(define (add-method proc m)
  (add-method-to-list (get-methods proc) m))
(define (add-method-to-list methods m)
  (monitor/synchronize-unsafe
   (car methods)
   (lambda () (add-method-helper m methods))))

(define (add-method-helper m methods)
  (let ([meths (cdr methods)])
    (if (null? meths)
        ;;append
        (set-cdr! methods (cons m meths))
        (let ([current	(car meths)])
          (if (method= m current)
              (set-cdr! methods (cons m (cdr meths)))
              (add-method-helper m meths))))))

(define (add-java-constructors constructors new-constructors)
  (for-each (lambda (c)
              (if (memq 'public (java/modifiers c))
                  (add-method-to-list
                   constructors
                   (make-method
                    c
                    (vector->list (java/parameter-types c))
                    #f))))
            new-constructors))
(define (add-java-methods methods new-methods)
  (for-each (lambda (m)
              (if (memq 'public (java/modifiers m))
                  (add-method-to-list
                   methods
                   (make-method
                    m
                    (cons (if (memq 'static (java/modifiers m))
                              (meta (java/declaring-class m))
                              (java/declaring-class m))
                          (vector->list (java/parameter-types m)))
                    #f))))
            new-methods))
(define (add-class class)
  (if (and (not (java/null? class))
           (not (hashtable/put! *CLASSES* class #t)))
      (begin
        (add-class (java/superclass class))
        (for-each add-class (vector->list (java/interfaces class)))
        (if (memq 'public (java/modifiers class))
            (let ([methods (make-hashtable)])
              (add-java-constructors
               (java-constructor-methods class)
               (vector->list (java/decl-constructors class)))
              (for-each (lambda (m)
                          (let ([name (java/name m)])
                            (hashtable/put!
                             methods name
                             (cons m (hashtable/get methods name
                                                    '())))))
                        (vector->list (java/decl-methods class)))
              (hashtable/for-each
               (lambda (name meths)
                 (add-java-methods (java-methods name) meths))
               methods))))))

;;returns a list of applicable methods and ambiguous methods. The
;;applicable methods are returned in a total order based on their
;;specificity with respect to otypes. Ambiguous methods are methods
;;for which there is at least one other (consequently also ambiguous)
;;method that could inhabit the same place in the total order.
;;
;;The algorithm used here is the same as the one employed by Goo
;;(http://www.googoogaga.org/), Dylan and others.
(define (applicable-methods proc otypes)
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
  ;;make sure we know about all relevant methods
  ;;we really only need/ought to do this when proc is a
  ;;generic-java-procedure
  (if (not (null? otypes))
      (let ([first (car otypes)])
        (if (meta? first)
            (set! first (meta-type first)))
        (if (java/class? first)
            (add-class first))))
  ;;optimization opportunity: turn otypes into a vector so that
  ;;method-applicable can do a fast size test. Not much point doing
  ;;this though if we are going to cache the result of this entire
  ;;operation anyway.
  (let loop ([methods    (generic-procedure-methods proc)]
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

(define (call-method-helper applicable args next)
  (if (null? applicable)
      (if next
          (apply next args)
          (error (format "no matching method for ~s" args)))
      (let ([meth (method-procedure (car applicable))])
        (apply meth
               (if (or (java/method? meth) (java/constructor? meth))
                   args
                   (cons (lambda args
                           (call-method-helper (cdr applicable)
                                               args
                                               next))
                         args))))))

(define (_make-generic-procedure methods . rest)
  (define (proc . args)
    (call-with-values
        (lambda () (applicable-methods proc (map type-of args)))
      (lambda (applicable ambiguous)
        (call-method-helper applicable args
                            (procedure-property proc 'next)))))
  (set-procedure-property! proc 'methods methods)
  (if (not (null? rest))
      (set-procedure-property! proc 'next (car rest)))
  proc)
(define (_make-generic-constructor cproc . rest)
  (define (proc class . args)
    (if (java/class? class) (add-class class))
    (apply (constructor proc class) args))
  ;;A constructor procedure maintains a hashtable of
  ;;generic procedures, one for each class, that contain methods for
  ;;each of the constructors defined for that class
  (set-procedure-property! proc 'generic-constructors (make-hashtable))
  (set-procedure-property! proc 'constructor-methods cproc)
  (if (not (null? rest))
      (set-procedure-property! proc 'next (car rest)))
  proc)

(define (generic-java-procedure name . rest)
  (apply _make-generic-procedure (java-methods name) rest))
(define (generic-java-constructor . rest)
  (apply _make-generic-constructor java-constructor-methods rest))
;;The global generic constructor chains the generic java constructor
(define make (_make-generic-constructor constructor-methods
                                        (generic-java-constructor)))

(define (make-generic-procedure . rest)
  (apply _make-generic-procedure (make-method-list) rest))
(define (make-generic-constructor . rest)
  (apply _make-generic-constructor constructor-methods rest))

(define-syntax define-generic
  (syntax-rules ()
    ((_ ?name ?next)
     (define ?name (make-generic-procedure ?next)))
    ((_ ?name)
     (define ?name (make-generic-procedure
                    (generic-java-procedure (java/mangle-name '?name)))))))
(define-syntax define-method
  (syntax-rules (next:)
    ((_ (?name (next: ?next) (?type ?arg) ...) . ?body)
     (add-method ?name
                 (make-method (lambda (?next ?arg ...) . ?body)
                              (list ?type ...)
                              #f)))
    ((_ (?name (next: ?next) . ?rest) . ?body)
     (define-method "rest" ?name ?next () ?rest ?body))
    ((_ "rest" ?name ?next (?param ...) (?head . ?rest) ?body)
     (define-method "rest" ?name ?next (?param ... ?head) ?rest ?body))
    ((_ "rest" ?name ?next ((?type ?arg) ...) ?rest ?body)
     (add-method ?name
                 (make-method (lambda (?next ?arg ... . ?rest) . ?body)
                              (list ?type ...)
                              #t)))
    ((_ (?name ?param ...) . ?body)
     (define-method (?name (next: dummy) ?param ...) . ?body))
    ((_ (?name . ?rest) . ?body)
     (define-method (?name (next: dummy) . ?rest) . ?body))))
(define-syntax define-constructor
  (syntax-rules ()
    ((_ (?class . ?rest) . ?body)
     (define-method ((constructor make ?class) . ?rest) . ?body))))
