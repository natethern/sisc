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
(define (take lis k)
  (let recur ((lis lis) (k k))
    (if (or (zero? k) (null? lis)) ;;added null check here
        '()
        (cons (car lis)
              (recur (cdr lis) (- k 1))))))


;;;;;;;;;;;;;;;;;;;;;;;;;; TYPE SYSTEM ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define <bot> (void))
(define <top> (void))
(define <java.lang.Class> (java/class '|java.lang.Class|))
(define <java.lang.Object> (java/class '|java.lang.Object|))

;;meta types
;;There is a special hack to make java.lang.Class a meta type
(define (meta x) (cons 'meta x))
(define (meta-type m)
  (if (eqv? m <java.lang.Class>)
      <java.lang.Object>
      (cdr m)))
(define (meta? x)
  (or (eqv? x <java.lang.Class>)
      (and (pair? x) (eq? (car x) 'meta))))

;;special types
(define (special-type kind) (cons 'special kind))
(define (special-type-kind t) (cdr t))
(define (special-type? x) (and (pair? x) (eq? (car x) 'special)))

(define (type-of o)
  (cond ((class? o) (meta o))
        ((java/object? o) (java/class-of o))
        ((scheme-object? o) (procedure-property o 'class))
        (else
          ;;hack
          (java/class-of (java/wrap o)))))

(define (type<= x y)
  (cond ((eq? x <bot>) #t)
        ((eq? y <top>) #t)
        ((or (meta? x) (meta? y))
         (and (meta? x) (meta? y)
              (type<= (meta-type x) (meta-type y))))
        ((or (java/class? x) (java/class? y))
         ;;we need this special case because the cpl of primitive
         ;;types does not contain their corresponding java.lang
         ;;classes
         (and (java/class? x) (java/class? y)
              (java/assignable? y x)))
        ((or (class? x) (class? y))
         (and (class? x) (class? y)
              (memv y (class-precedence-list x))))
        (else #f)))

(define (instance-of? x y)
  (type<= (type-of x) y))

(define (types<= x y) (every2 type<= x y))
(define (types= x y) (and (types<= x y) (types<= y x)))
(define (instances-of? x y) (every2 instance-of? x y))


;;;;;;;;;;;;;;;;;;;;;;;;;; OBJECT SYSTEM ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;classes - this is still VERY incomplete
;;Scheme objects (incl classes) are not a distinct type from
;;procedures. We put no heroic effort into distinguishing between the
;;two.
(define <class> (void))
(define (scheme-object? o)
  (and (procedure? o)
       (procedure-property o 'class))) 
(define (scheme-class? o)
  (and (scheme-object? o)
       (o 'superclasses)
       (o 'slots)))
(define (class? o)
  (or (java/class? o) (scheme-class? o)))
(define (object? o)
  (or (java/object? o) (scheme-object? o)))

(define (make-object class slots)
  (let ([slots (alist->hashtable slots eq? #f)])
    (define (res keys . rest)
      (let ([key      (if (pair? keys) (car keys) keys)]
            [keys     (if (pair? keys) (cdr keys) '())])
        (if (null? rest)
            (if (null? keys)
                (hashtable/get slots key)
                ((hashtable/get slots key) keys))
            (if (null? keys)
                (hashtable/put! slots key (car rest))
                ((hashtable/get slots key) keys (car rest))))))
    (set-procedure-property! res 'class class)
    res))
(define (make-class superclasses slots)
  (let ([res (make-object <class>
                          `((superclasses . ,superclasses)
                            (slots . ,(alist->hashtable slots
                                                        eq?
                                                        #f))))])
    (add-method-to-list
     *CONSTRUCTORS*
     (make-method (object-initializer res) (list (meta res)) #t))
    res))
(define (object-initializer class)
  (let ([slots (make-hashtable eq? #f)])
    (for-each (lambda (c)
                (if (scheme-class? c)
                    (hashtable/for-each
                     (lambda (k v) (hashtable/put! slots k v))
                     (c 'slots))))
              (reverse (class-precedence-list class)))
    (let ([slots (hashtable->alist slots)])
      (lambda res (make-object class slots)))))

(define (class-direct-superclasses class)
  (cond ((java/class? class)
         (let ([sc (java/superclass class)]
               [intfs (vector->list (java/interfaces class))])
           (if (java/null? sc)
               intfs
               (cons sc intfs))))
        ((scheme-class? class)
         (class 'superclasses))
        (else
          (error "~a is not a class" class))))

(define (class-direct-slot-names class)
  (cond ((java/class? class)
         (map java/name
              (filter (lambda (f)
                        (memq 'public (java/modifiers f)))
                      (vector->list (java/decl-fields class)))))
        ((scheme-class? class)
         (class 'slots))
        (else
          (error "~a is not a class" class))))

;;The class precedence list of a class is a total ordering on the
;;class and its superclasses/interfaces that is consistent with the
;;local precedence orders specified in the class definitions.
;;The algorithm used here is the same as the one employed by Goo
;;(http://www.googoogaga.org/), Dylan and others.
;;
;;Because computing the cpl is expensive we cache the results.
(define *CLASS-PRECEDENCE-LISTS* (make-hashtable eqv?))
(define (class-precedence-list class)
  (hashtable/get! *CLASS-PRECEDENCE-LISTS*
                  class
                  (lambda ()
                    (compute-class-precedence-list class))))
(define (compute-class-precedence-list class)
  (define (merge-lists partial-cpl remaining-lists)
    (set! remaining-lists (remove null? remaining-lists))
    (if (null? remaining-lists)
        (reverse partial-cpl)
        (let* ([candidate
                (lambda (c)
                  (and (not (any (lambda (l) (memv c (cdr l)))
                                 remaining-lists))
                       c))]
               [next (any (lambda (l) (candidate (car l)))
                          remaining-lists)])
          (if next
              (merge-lists
               (cons next partial-cpl)
               (map (lambda (l) (if (eqv? (car l) next) (cdr l) l))
                    remaining-lists))
              (error "inconsistent class precedence graph for ~a"
                     class)))))
  (merge-lists (list class)
               (let ([parents (class-direct-superclasses class)])
                 (append (map class-precedence-list parents)
                         (list parents)))))

;;compare two types taking into account the cpl of c
;;NB: c must be a sub-type of both types
(define (compare-types x y c)
  (let ([x<y? (type<= x y)]
        [y<x? (type<= y x)])
    (cond ((and x<y? y<x?) 'equal)
          (x<y? 'more-specific)
          (y<x? 'less-specific)
          ((or (eq? c <bot>) (eq? c <top>)) 'ambiguous)
          ((and (meta? x) (meta? y))
           (compare-types (meta-type x) (meta-type y) (meta-type c)))
          ((or (meta? x) (meta? y))
           'ambiguous)
          (else
            ;;find first occurrence of x or y in c's cpl
            (let loop ([cpl (class-precedence-list c)])
              (if (null? cpl)
                  'ambiguous;;shouldn't happen
                  (let ([p (car cpl)])
                    (cond ((eqv? p x) 'more-specific)
                          ((eqv? p y) 'less-specific)
                          (else (loop (cdr cpl)))))))))))


;;;;;;;;;;;;;;;;;;;;;;;; METHOD OBJECTS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;a method is a procedure. It has an arity and a signature (a list of
;;parameter types) and flag indicating whether it can take rest
;;parameters
(define-record-type method (_make-method procedure arity types rest?)
  method?
  (procedure    method-procedure        set-method-procedure!)
  (arity        method-arity            set-method-arity!)
  (types        method-types            set-method-types!)
  (rest?        method-rest?            set-method-rest!))

(define (make-method f types rest?)
  (_make-method f (length types) types rest?))

(define (method= m1 m2)
  (and (= (method-arity m1) (method-arity m2))
       (eq? (method-rest? m1) (method-rest? m2))
       (types= (method-types m1) (method-types m2))))

;;Checks whether a method can be called with arguments of specific
;;types.
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

(define (get-methods proc)
  (procedure-property proc 'methods))

(define-struct method-list (methods arity cache))
(define (make-protected-method-list)
  ;;(monitor . mlist)
  (cons (mutex/new) (make-method-list '() 0 #f)))

(define (generic-procedure-methods proc)
  (method-list-methods (cdr (get-methods proc))))

(define (generic-procedure-next proc)
  (procedure-property proc 'next))

;;we keep track of all the classes whose methods we have already
;;learned about
(define *JAVA-CLASSES* (make-hashtable eqv?))
;;for each Java method name we maintain a method list which is shared
;;by all the generic procedures representing java methods of that name
(define *JAVA-METHODS* (make-hashtable eq?))
(define (java-methods name)
  (hashtable/get! *JAVA-METHODS* name make-protected-method-list))
;;Constructors are stored in a global list which is shared by all
;;the generic procedures representing constructors
(define *CONSTRUCTORS* #f)
;;mapping of Java method names to generic procedures that handle
;;invocation of Scheme code from Java via a proxy
(define *GENERIC-JAVA-PROXY-PROCEDURES* (make-hashtable eq?))

(define (java-proxy-method-dispatcher v)
  (java/invocation-handler
   (lambda (p m a)
     (apply (generic-java-proxy-procedure (java/name m)) v p a))))

(define (add-method proc m)
  (add-method-to-list (get-methods proc) m))
(define (add-method-to-list methods m)
  (mutex/synchronize-unsafe
   (car methods)
   (lambda ()
     (set-cdr! methods
               (make-method-list (add-method-helper
                                  (method-list-methods (cdr methods))
                                  m)
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

(define (add-java-constructor c)
  (and (memq 'public (java/modifiers c))
       (add-method-to-list
        *CONSTRUCTORS*
        (make-method (lambda (next class . args) (apply c args))
                     (cons (meta (java/declaring-class c))
                           (vector->list (java/parameter-types c)))
                     #f))))
(define (add-java-method m)
  (and (memq 'public (java/modifiers m))
       (add-method-to-list
        (java-methods (java/name m))
        (make-method (lambda (next . args) (apply m args))
                     (cons (if (memq 'static (java/modifiers m))
                               (meta (java/declaring-class m))
                               (java/declaring-class m))
                           (vector->list (java/parameter-types m)))
                     #f))))
(define (add-class class)
  (if (and (not (java/null? class))
           (not (hashtable/put! *JAVA-CLASSES* class #t)))
      (begin
        (add-class (java/superclass class))
        (for-each add-class (vector->list (java/interfaces class)))
        (if (memq 'public (java/modifiers class))
            (begin
              (for-each add-java-constructor
                        (vector->list (java/decl-constructors class)))
              (for-each add-java-method 
                        (vector->list (java/decl-methods class))))))))

;;returns a list of applicable methods and ambiguous methods. The
;;applicable methods are returned in a total order based on their
;;specificity with respect to otypes. Ambiguous methods are methods
;;for which there is at least one other (consequently also ambiguous)
;;method that could inhabit the same place in the total order.
;;
;;The algorithm used here is the same as the one employed by Goo
;;(http://www.googoogaga.org/), Dylan and others.
(define (applicable-methods proc otypes)
  ;;make sure we know about all relevant methods
  ;;we really only need/ought to do this when proc is a
  ;;generic-java-procedure
  (if (not (null? otypes))
      (let ([first (car otypes)])
        (if (meta? first)
            (set! first (meta-type first)))
        (if (java/class? first)
            (add-class first))))
  (let ([methods       (get-methods proc)])
    (mutex/synchronize-unsafe
     (car methods)
     (lambda ()
       (let ([mlist (cdr methods)])
         (if (not (method-list-cache mlist))
             (let ([meths (method-list-methods mlist)])
               (set! mlist (make-method-list
                            meths
                            (+ (apply max 0 (map method-arity meths))
                               1)
                            (make-hashtable equal? #f)))
               (set-cdr! methods mlist)))
         (set! otypes (take otypes (method-list-arity mlist)))
         (let* ([cache (method-list-cache mlist)]
                [res (hashtable/get cache otypes)])
           (if res
               (values (car res) (cdr res))
               (call-with-values
                   (lambda () (applicable-methods-helper
                               (method-list-methods mlist)
                               otypes))
                 (lambda (applicable ambiguous)
                   (hashtable/put! cache
                                   otypes
                                   (cons applicable ambiguous))
                   (values applicable ambiguous))))))))))
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

(define (call-method-helper applicable args next)
  (if (null? applicable)
      (if next
          (apply next args)
          (error (format "no matching method for ~s" args)))
      (apply (method-procedure (car applicable))
             (lambda args
               (call-method-helper (cdr applicable)
                                   args
                                   next))
             args)))

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

(define (generic-java-procedure name . rest)
  (apply _make-generic-procedure
         (java-methods (java/mangle-method-name name))
         rest))
(define (generic-builtin-constructor . rest)
  (apply _make-generic-procedure *CONSTRUCTORS* rest))
(define (make-generic-procedure . rest)
  (apply _make-generic-procedure (make-protected-method-list) rest))
(define <java.lang.UnsupportedOperationException>
  (java/class '|java.lang.UnsupportedOperationException|))
(define (generic-java-proxy-procedure name)
  (let ([mangled-name (java/mangle-method-name name)])
    (hashtable/get!
     *GENERIC-JAVA-PROXY-PROCEDURES*
     mangled-name
     (lambda ()
       (make-generic-procedure
        (lambda args
          (error (make <java.lang.UnsupportedOperationException>
                       (->jstring
                        (format "proxy procedure ~a, args ~a"
                                mangled-name
                                args))))))))))

(define-syntax define-generic
  (syntax-rules ()
    ((_ ?name ?next)
     (define ?name (make-generic-procedure ?next)))
    ((_ ?name)
     (define ?name (make-generic-procedure
                    (generic-java-procedure '?name))))))
(define-syntax define-method
  (syntax-rules (next:)
    ((_ (?name (next: ?next) (?type ?arg) ...) . ?body)
     (add-method ?name (make-method (lambda (?next ?arg ...) . ?body)
                                    (list ?type ...)
                                    #f)))
    ((_ (?name (next: ?next) . ?rest) . ?body)
     (define-method "rest" ?name ?next () ?rest ?body))
    ((_ "rest" ?name ?next (?param ...) (?head . ?rest) ?body)
     (define-method "rest" ?name ?next (?param ... ?head) ?rest ?body))
    ((_ "rest" ?name ?next ((?type ?arg) ...) ?rest ?body)
     (add-method ?name (make-method (lambda (?next ?arg ... . ?rest)
                                      . ?body)
                                    (list ?type ...)
                                    #t)))
    ((_ (?name ?param ...) . ?body)
     (define-method (?name (next: dummy) ?param ...) . ?body))
    ((_ (?name . ?rest) . ?body)
     (define-method (?name (next: dummy) . ?rest) . ?body))))
(define-syntax define-methods
  (syntax-rules ()
    ((_ ?name (?signature . ?body) ...)
     (begin
       (define-method (?name . ?signature) . ?body)
       ...))))
(define-syntax define-java-proxy-method
  (syntax-rules ()
    ((_ (?name . ?rest) . ?body)
     (define-method ((generic-java-proxy-procedure '?name) . ?rest)
       . ?body))))
(define-syntax define-class
  (syntax-rules ()
    ((_ (?name . ?superclasses) (?key ?val) ...)
     (define ?name (make-class (list . ?superclasses)
                               (list (cons '?key ?val) ...))))))

(define create (void))
(define initialize (void))
(define (make class . args)
  (let ([res (apply create class args)])
    (apply initialize res args)
    res))
(set! *CONSTRUCTORS* (make-protected-method-list))
(set! create (make-generic-procedure (generic-builtin-constructor)))
(set! initialize (make-generic-procedure (lambda args (void))))

(set! <bot> (special-type '<bot>))
(set! <top> (special-type '<top>))
(set! <class>
  (let ([res (make-object <class>
                          '((superclasses)
                            (slots . ,(alist->hashtable
                                       `((superclasses)
                                         (slots . ,(make-hashtable eq?
                                                                   #f)))
                                       eq?
                                       #f))))])
    (set-procedure-property! res 'class res)
    res))
