;;METHOD OBJECTS
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

;;same as in srfi-1
(define (every2 pred x y)
  (or (null? x)
      (null? y)
      (and (pred (car x) (car y)) (every2 pred (cdr x) (cdr y)))))

;;meta types
(define (meta x) (cons 'meta x))
(define (meta-type m) (cdr m))
(define (meta? x) (and (pair? x) (eq? (car x) 'meta)))

;;this will need to change once we support non-java types
(define (type<= x y)
  (cond ((and (meta? x) (meta? y))
         (type<= (meta-type x) (meta-type y)))
        ((meta? x) #f)
        ((meta? y) #f)
        (else (java/assignable? y x))))
(define (instance-of? x y)
  (cond ((meta? y) (type<= x (meta-type y)))
        (else (java/instance? y x))))

(define (types<= x y) (every2 type<= x y))
(define (instances-of? x y) (every2 instance-of? x y))

;;we need synchronized hashtables in a few places
(define (make-synchronized-hashtable)
  (cons (monitor/new) (make-hashtable)))
(define (synchronized-hashtable/get ht key . def)
  (monitor/synchronize-unsafe
   (car ht)
   (lambda () (apply hashtable/get (cdr ht) key def))))
(define (synchronized-hashtable/put! ht key val . def)
  (monitor/synchronize-unsafe
   (car ht)
   (lambda () (apply hashtable/put! (cdr ht) key val def))))
(define (synchronized-hashtable/get! ht key def-proc)
  (monitor/synchronize-unsafe
   (car ht)
   (lambda ()
     (let ([res ((cdr ht) key)])
       (or res (let ([res (def-proc)]) ((cdr ht) key res) res))))))

(define (assert-proc proc thunk)
  (if (procedure? proc)
      (thunk)
      (error "expected procedure")))
(define (procedure-property proc key . rest)
  (assert-proc proc
               (lambda ()
                 (or (annotation proc key)
                     (if (null? rest) #f (car rest))))))
(define (set-procedure-property! proc key val . rest)
  (assert-proc proc
               (lambda ()
                 (let ([res (annotation proc key)])
                   (set-annotation! proc key val)
                   (or res (if (null? rest) #f (car rest)))))))
(define (procedure-property! proc key . rest)
  (assert-proc proc
               (lambda ()
                 (or (annotation proc key)
                     (if (null? rest)
                         #f
                         (begin
                           (set-annotation! proc key ((car rest)))
                           (annotation proc key)))))))

;;This maps procedure to lists of methods ordered by their
;;"specificity", i.e. methods appearing earlier in the list are always
;;more specific or incomparable (i.e. neither less or more specific)
;;than methods appearing later.
(define (get-methods proc)
  (procedure-property! proc 'methods
                       (lambda () (cons (monitor/new) '()))))
(define (generic-procedure-methods proc)
  (cdr (get-methods proc)))

(define (generic-procedure-next proc)
  (procedure-property proc 'next))

;;This maps classes to lists of constructors ordered by their
;;"specificity". A constructor procedure maintains a hashtable of
;;generic procedures, one for each class. The generic procedures can be
;;chained to a generic procedure that is part of another constructor.
(define (constructor proc class)
  (let ([constr (procedure-property! proc 'generic-constructors
                                     make-synchronized-hashtable)]
        [next   (procedure-property proc 'next)])
    (synchronized-hashtable/get!
     constr
     class
     (lambda ()
       (if next
           (make-generic-procedure (constructor next class))
           (make-generic-procedure))))))
    
;;mangle java method names so they look a bit more like scheme
;;procedure names
(define (mangle-name name)
  ((compose string->symbol mangle-name-phase3
            list->string mangle-name-phase2 string->list
            mangle-name-phase1 symbol->string)
   name))
;;turn "isFoo" into "Foo?" and "setFoo" into "setFoo!"
(define (mangle-name-phase1 name)
  (let ([l (string-length name)])
    (cond ((and (> l 2)
                (string=? (substring name 0 2) "is")
                (char-upper-case? (string-ref name 2)))
           (string-append (substring name 2 l) "?"))
          ((and (> l 3)
                (string=? (substring name 0 3) "set")
                (char-upper-case? (string-ref name 3)))
           (string-append name "!"))
          (else name))))
;;inserts a '-' between upper case and lower case
;;characters and downcases everything
(define (mangle-name-phase2 name)
  (let loop ([res '()]
             [name name]
             [lower? #f])
    (if (null? name)
        (reverse res)
        (let ([c (car name)]
              [r (cdr name)])
          (if (and (char-alphabetic? c) (char-upper-case? c))
              (loop (cons (char-downcase c)
                          (if lower? (cons #\- res) res))
                    r
                    #f)
              (loop (cons c res) r #t))))))
(define (mangle-name-phase3 name)
  name)

(define (method<= m1 m2)
  (cond ((> (method-arity m1) (method-arity m2)) #t)
        ((> (method-arity m2) (method-arity m1)) #f)
        ;;same arity
        ((and (not (method-rest? m1)) (method-rest? m2)) #t)
        ((and (not (method-rest? m2)) (method-rest? m1)) #f)
        ;;both or neither have rest arg
        (else (types<= (method-types m1) (method-types m2)))))

(define (add-method proc m)
  (let ([methods (get-methods proc)])
    (monitor/synchronize-unsafe
     (car methods)
     (lambda () (add-method-helper m methods)))))
(define (add-method-helper m methods)
  (let ([meths (cdr methods)])
    (if (null? meths)
        ;;append
        (set-cdr! methods (cons m meths))
        (let ([current	(car meths)])
          (if (method<= m current)
              (if (method<= current m)
                  ;;replace
                  (set-cdr! methods (cons m (cdr meths)))
                  ;;insert
                  (set-cdr! methods (cons m meths)))
              (add-method-helper m meths))))))

(define (add-class class)
  (if (and (not (java/null? class))
           (not (synchronized-hashtable/put! *CLASSES* class #t)))
      (begin
        (add-class (java/superclass class))
        (for-each add-class (vector->list (java/interfaces class)))
        (if (memq 'public (java/modifiers class))
            (begin
              (for-each
               (lambda (c)
                 (if (memq 'public (java/modifiers c))
                     (add-method
                      (constructor (generic-java-constructor) class)
                      (make-method
                       c
                       (vector->list (java/parameter-types c))
                       #f))))
               (vector->list (java/decl-constructors class)))
              (for-each
               (lambda (m)
                 (if (memq 'public (java/modifiers m))
                     (add-method
                      (generic-java-procedure (mangle-name
                                              (java/name m)))
                      (make-method
                       m
                       (cons (if (memq 'static (java/modifiers m))
                                 (meta (java/declaring-class m))
                                 (java/declaring-class m))
                             (vector->list
                              (java/parameter-types m)))
                       #f))))
               (vector->list (java/decl-methods class))))))))

;;SYNC: we don't care if methods gets modified while we do this
(define (find-method-helper pred proc args methods)
  (if (null? methods)
      #f
      (let ([current (car methods)])
        (if (and ((if (method-rest? current) >= =)
                  (length args)
                  (method-arity current))
                 (pred args current))
            (cons (method-procedure current)
                  (lambda newargs (find-and-call proc newargs methods)))
            (find-method-helper pred proc args (cdr methods))))))
(define (find-method args methods proc)
  (if (not (null? args))
      (let ([first (car args)])
        (if (java/class? first)
            (add-class first))
        (if (java/object? first)
            (add-class (java/class-of first)))))
  (find-method-helper (lambda (args m)
                        (instances-of? args (method-types m)))
                      proc args (cdr methods)))
(define (call-method-helper m args next)
  (if m
      (let ([meth (car m)]
            [next (cdr m)])
        (apply meth
               (if (or (java/method? meth) (java/constructor? meth))
                   args
                   (cons next args))))
      (if next
          (apply next args)
          (error (format "no matching method for ~s" args)))))
(define (find-and-call proc args methods)
  (call-method-helper (find-method args methods proc)
                      args
                      (procedure-property proc 'next)))

(define (_make-generic-procedure . rest)
  (letrec ([proc    (lambda args (find-and-call proc args methods))]
           [methods (get-methods proc)])
    (if (not (null? rest))
        (set-procedure-property! proc ' next (car rest)))
    proc))
(define (_make-generic-constructor . rest)
  (letrec ([proc (lambda (class . args)
                   (if (java/class? class) (add-class class))
                   (apply (constructor proc class) args))])
    (if (not (null? rest))
        (set-procedure-property! proc 'next (car rest)))
    proc))

;;for each java method name there is a corresponding generic
;;procedure.
(define *JAVA-METHODS* (make-synchronized-hashtable))
(define (generic-java-procedure name)
  (synchronized-hashtable/get! *JAVA-METHODS* name
                               _make-generic-procedure))
;;There is *one* generic java constructor
(define *JAVA-CONSTRUCTOR* (_make-generic-constructor))
(define (generic-java-constructor) *JAVA-CONSTRUCTOR*)
;;we keep track of all the classes whose methods we have already
;;learned about
(define *CLASSES* (make-synchronized-hashtable))
;;The global generic constructor chains the generic java constructor
(define make (_make-generic-constructor (generic-java-constructor)))

(define make-generic-procedure _make-generic-procedure)
(define make-generic-constructor _make-generic-constructor)

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
