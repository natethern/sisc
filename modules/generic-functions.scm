;;METHOD OBJECTS
;;we could be using srfi-9's structures here, but I do want to keep
;;this code clean of any srfi dependencies.

;;a method is a function. It is associated with a generic function,
;;has an arity and a signature (a list of parameter types)
(define (make-method f genf arity sig)
  (vector f genf arity sig))
(define (method-function m)	(vector-ref m 0))
(define (method-generic m)	(vector-ref m 1))
(define (method-arity m)	(vector-ref m 2))
(define (method-sig m)		(vector-ref m 3))

;;we cannot use EVERY from srfi-1 because it returns #t when the lists
;;are of unequal length.
(define (every2 pred x y)
  (if (null? x)
      (null? y)
      (if (null? y)
	  #f
	  (and (pred (car x) (car y)) (every2 pred (cdr x) (cdr y))))))

(define (types<= x y) (every2 java/assignable? y x))
(define (instances? x y) (every2 java/instance? y x))

;;Generic functions are mapped to names which in turn are the main key
;;by which methods are stored / looked up. We do this so that all
;;generic functions share the same pool of methods that gets
;;constructed incrementally as we learn about java classes.
(define *FUNCTIONS* '())
(define (add-generic-function f name)
  (set! *FUNCTIONS* (cons (cons f name) *FUNCTIONS*)))
(define (generic-function-name f)
  (let ([n (assq f *FUNCTIONS*)])
    (if n
        (cdr n)
        (error "~a is not a generic function" f))))
;;we keep track of all the classes whose methods we have already
;;incorporated into the *METHODS* table below
(define *CLASSES* '())
;;This is an association list. The CARs are method names and the CDRs
;;are lists of methods, ordered by their "specificity", i.e. methods
;;appearing earlier in the list are almost more specific or
;;incomparable (i.e. neither less or more specific) than methods
;;appearing later.
;;Methods are represented by a pair with the CAR containing the method
;;object and the CDR containing the type signature, i.e. a list of
;;types (one for each parameter).
(define *METHODS* '())
(define (get-methods name)
  (let ([m (assq name *METHODS*)])
    (or m (let ([m (cons name '())])
            (set! *METHODS* (cons m *METHODS*))
            m))))
;;This is an association list. The CARs are classes and the CDRs are
;;lists of constructors ordered by their "specificity".
;;Constructors are represented by a pair with the CAR containing the
;;constructor object and the CDR containing the type signature, i.e. a
;;list of types (one for each parameter);
(define *CONSTRUCTORS* '())
(define (get-constructors class)
  (let ([c (assq class *CONSTRUCTORS*)])
    (or c (let ([c (cons class '())])
            (set! *CONSTRUCTORS* (cons c *CONSTRUCTORS*))
            c))))
;;mangle java method names so they look a bit more like scheme
;;function names
(define (mangle-name name)
  ((compose string->symbol
            mangle-name-phase3
            list->string
            mangle-name-phase2
            string->list
            mangle-name-phase1
            symbol->string)
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
  (and (= (method-arity m1) (method-arity m2))
       (let ([sig1	(method-sig m1)]
             [sig2	(method-sig m2)])
         (and (types<= sig1 sig2)
              (or (not (types<= sig2 sig1))
                  (let ([fun1	(method-function m1)]
                        [fun2	(method-function m2)])
                    ;;scheme methods take precedence over java methods
                    (or (java/method? fun2)
                        (java/constructor? fun2)
                        (not (or (java/method? fun1)
                                 (java/constructor? fun1))))))))))
(define (add-method-helper m methods)
  (let ([meths (cdr methods)])
    (if (null? meths)
        ;;append
        (set-cdr! methods (cons m meths))
        (let ([current	(car meths)])
          (if (method<= m current)
              (if (and (method<= current m)
                       (eq? (method-generic m)
                            (method-generic current)))
                  ;;replace
                  (set-cdr! methods (cons m (cdr meths)))
                  ;;insert
                  (set-cdr! methods (cons m meths)))
              (add-method-helper m meths))))))
(define (add-method genf name types m)
  (add-method-helper (make-method m genf (length types) types)
                     (get-methods name)))
(define (add-constructor genf class types c)
  (add-method-helper (make-method c genf (length types) types)
                     (get-constructors class)))
(define (add-class class)
  (if (and (not (java/null? class))
           (not (memq class *CLASSES*)))
      (begin
        (set! *CLASSES* (cons class *CLASSES*))
        (add-class (java/superclass class))
        (for-each add-class (vector->list (java/interfaces class)))
        (for-each (lambda (c)
                    (add-constructor #f
                                     class
                                     (vector->list
                                      (java/parameter-types c))
                                     c))
                  (vector->list (java/decl-constructors class)))
        (for-each (lambda (m)
                    (add-method #f
                                (mangle-name (java/name m))
                                (cons (java/declaring-class m)
                                      (vector->list
                                       (java/parameter-types m)))
                                m))
                  (vector->list (java/decl-methods class))))))
(define (find-method genf args methods)
  (or (find-normal-method genf args methods)
      (find-static-method genf args methods)))
(define (find-method-helper pred next-fn genf args methods)
  (if (null? methods)
      #f
      (let* ([current	(car methods)]
             [cgenf	(method-generic current)])
        (if (and (or (not cgenf) (eq? genf cgenf))
                 (pred args current))
            (cons (method-function current)
                  (lambda newargs
                    (let ([args (if (null? newargs) args newargs)])
                      (call-method-helper
                       (next-fn genf args methods)
                       args))))
            (find-method-helper pred next-fn genf args (cdr methods))))))
(define (call-method-helper m args)
  (if m
      (let ([meth (car m)]
            [next (cdr m)])
        (if (or (java/method? meth) (java/constructor? meth))
            (apply meth args)
            (apply meth next args)))
      (error (format "no matching method for ~s" args))))
(define (find-constructor genf args constr)
  (find-method-helper (lambda (args m)
                        (and (= (method-arity m) (length args))
                             (instances? args (method-sig m))))
                      find-constructor
                      genf
                      args
                      (cdr constr)))
(define (find-normal-method genf args methods)
  (add-class (java/class-of (car args)))
  (find-method-helper (lambda (args m)
                        (and (= (method-arity m) (length args))
                             (instances? args (method-sig m))))
                      find-normal-method
                      genf
                      args
                      (cdr methods)))
(define (find-static-method genf args methods)
  (let ([class (car args)])
    (and (java/class? class)
         (begin
           (add-class class)
           (find-method-helper
            (lambda (args m)
              (and (= (method-arity m) (length args))
                   (java/assignable? (car (method-sig m)) class)
                   (instances? (cdr args) (cdr (method-sig m)))))
            find-static-method
            genf
            args
            (cdr methods))))))
(define (generic-function name)
  (let ([methods (get-methods name)])
    (define (genf . args)
      (call-method-helper (find-method genf args methods) args))
    (add-generic-function genf name)
    genf))
(define (generic-constructor)
  (define (genf class . args)
    (add-class class)
    (let ([constr (get-constructors class)])
      (call-method-helper (find-constructor genf args constr) args)))
  genf)
(define-syntax define-generic
  (syntax-rules ()
    ((_ ?name ?fname)
     (define ?name (generic-function '?fname)))
    ((_ ?name)
     (define-generic ?name ?name))))
(define-syntax define-method
  (syntax-rules (next:)
    ((_ (?name (next: ?next-method) (?type ?arg) ...) . ?body)
     (add-method ?name
                 (generic-function-name ?name)
                 (list ?type ...)
                 (lambda (?next-method ?arg ...) . ?body)))
    ((_ (?name (?type ?arg) ...) . ?body)
     (define-method (?name (next: dummy) (?type ?arg) ...) . ?body))))
(define make (generic-constructor))
(define-syntax define-constructor
  (syntax-rules (next:)
    ((_ (?class (next: ?next-method) (?type ?arg) ...) . ?body)
     (add-constructor make ?class (list ?type ...)
                      (lambda (?next-method ?arg ...) . ?body)))
    ((_ (?class (?type ?arg) ...) . ?body)
     (define-constructor (?class (next: dummy) (?type ?arg) ...) . ?body))))
