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

;;constructors are chained by chaining their contained generic
;;procedures
(define (constructor proc class)
  (hashtable/get!
   (procedure-property proc 'generic-constructors)
   class
   (lambda ()
     (let ([next (procedure-property proc 'next)])
       (if next
           (make-generic-procedure (constructor next class))
           (make-generic-procedure))))))

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

(define (add-java-constructors proc constructors)
  (for-each (lambda (c)
              (if (memq 'public (java/modifiers c))
                  (add-method
                   proc
                   (make-method
                    c
                    (vector->list (java/parameter-types c))
                    #f))))
            constructors))
(define (add-java-methods proc methods)
  (for-each (lambda (m)
              (if (memq 'public (java/modifiers m))
                  (add-method
                   proc
                   (make-method
                    m
                    (cons (if (memq 'static (java/modifiers m))
                              (meta (java/declaring-class m))
                              (java/declaring-class m))
                          (vector->list (java/parameter-types m)))
                    #f))))
            methods))
(define (add-class class)
  (if (and (not (java/null? class))
           (not (hashtable/put! *CLASSES* class #t)))
      (begin
        (add-class (java/superclass class))
        (for-each add-class (vector->list (java/interfaces class)))
        (if (memq 'public (java/modifiers class))
            (let ([methods (make-hashtable)])
              (add-java-constructors
               (constructor (generic-java-constructor) class)
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
                 (add-java-methods
                  (generic-java-procedure name)
                  meths))
               methods))))))

;;SYNC: we don't care if methods gets modified while we do this
(define (find-method-helper proc args methods)
  (if (null? methods)
      #f
      (let ([current (car methods)])
        (if (and ((if (method-rest? current) >= =)
                  (length args)
                  (method-arity current))
                 (instances-of? args (method-types current)))
            (cons (method-procedure current)
                  (lambda newargs (find-and-call proc newargs methods)))
            (find-method-helper proc args (cdr methods))))))
(define (find-method args methods proc)
  (if (not (null? args))
      (let ([first (car args)])
        (if (java/class? first)
            (add-class first))
        (if (java/object? first)
            (add-class (java/class-of first)))))
  (find-method-helper proc args (cdr methods)))
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
  (letrec ([methods   (cons (monitor/new) '())]
           [proc      (lambda args (find-and-call proc args methods))])
    (set-procedure-property! proc 'methods methods)
    (if (not (null? rest))
        (set-procedure-property! proc 'next (car rest)))
    proc))
(define (_make-generic-constructor . rest)
  (letrec ([proc (lambda (class . args)
                   (if (java/class? class) (add-class class))
                   (apply (constructor proc class) args))])
    ;;A constructor procedure maintains a hashtable of
    ;;generic procedures, one for each class, that contain methods for
    ;;each of the constructors defined for that class
    (set-procedure-property! proc 'generic-constructors (make-hashtable))
    (if (not (null? rest))
        (set-procedure-property! proc 'next (car rest)))
    proc))

;;for each java method name there is a corresponding generic
;;procedure.
(define *JAVA-METHODS* (make-hashtable))
(define (generic-java-procedure name)
  (hashtable/get! *JAVA-METHODS* name _make-generic-procedure #f))
;;There is *one* generic java constructor
(define *JAVA-CONSTRUCTOR* (_make-generic-constructor))
(define (generic-java-constructor) *JAVA-CONSTRUCTOR*)
;;we keep track of all the classes whose methods we have already
;;learned about
(define *CLASSES* (make-hashtable))
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
