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
(define (add-method-helper methods types m)
  (let ([meths (cdr methods)]
        [entry (cons m types)])
    (if (null? meths)
        ;;add to end
        (set-cdr! methods (cons (cons m types) meths))
        (let ([ctypes (cdar meths)])
          (if (types<= types ctypes)
              (if (types<= ctypes types)
                  ;;If the current method is a Java method we insert
                  ;;the new method before it rather than overwriting
                  ;;it.
                  ;;Likewise, if the new method is a Java method we
                  ;;insert it after the current method
                  (cond ((or (java/method? (caar meths))
                             (java/constructor? (caar meths)))
                         (set-cdr! methods (cons entry meths)))
                        ((or (java/method? m)
                             (java/constructor? m))
                         (set-cdr! methods
                                   (cons (car meths)
                                         (cons entry (cdr meths)))))
                        (else
                         ;;replace existing method
                         (set-cdr! methods (cons entry (cdr meths)))))
                  ;;insert method
                  (set-cdr! methods (cons entry meths)))
              (add-method-helper meths types m))))))
(define (add-method name types m)
  (add-method-helper (get-methods name) types m))
(define (add-constructor class types c)
  (add-method-helper (get-constructors class) types c))
(define (add-class class)
  (if (and (not (java/null? class))
           (not (memq class *CLASSES*)))
      (begin
        (set! *CLASSES* (cons class *CLASSES*))
        (add-class (java/superclass class))
        (for-each add-class (vector->list (java/interfaces class)))
        (for-each (lambda (c)
                    (add-constructor class
                                     (vector->list
                                      (java/parameter-types c))
                                     c))
                  (vector->list (java/decl-constructors class)))
        (for-each (lambda (m)
                    (add-method (mangle-name (java/name m))
                                (cons (java/declaring-class m)
                                      (vector->list
                                       (java/parameter-types m)))
                                m))
                  (vector->list (java/decl-methods class))))))
(define (find-method args methods)
  (or (find-normal-method args methods)
      (find-static-method args methods)))
(define (find-method-helper pred next-fn args methods)
  (if (null? methods)
      #f
      (let ([current (car methods)])
        (if (pred args (cdr current))
            (cons (car current)
                  (lambda newargs
                    (let ([args (if (null? newargs) args newargs)])
                      (call-method-helper
                       (next-fn args methods)
                       args))))
            (find-method-helper pred next-fn args (cdr methods))))))
(define (call-method-helper m args)
  (if m
      (let ([meth (car m)]
            [next (cdr m)])
        (if (or (java/method? meth) (java/constructor? meth))
            (apply meth args)
            (apply meth next args)))
      (error (format "no matching method for ~s" args))))
(define (find-constructor args constr)
  (find-method-helper (lambda (args types)
                        (instances? args types))
                      find-constructor
                      args
                      (cdr constr)))
(define (find-normal-method args methods)
  (add-class (java/class-of (car args)))
  (find-method-helper (lambda (args types)
                        (instances? args types))
                      find-normal-method
                      args
                      (cdr methods)))
(define (find-static-method args methods)
  (let ([class (car args)])
    (and (java/class? class)
         (begin
           (add-class class)
           (find-method-helper
            (lambda (args types)
              (and (java/assignable? (car types) class)
                   (instances? (cdr args) (cdr types))))
            find-static-method
            args
            (cdr methods))))))
(define (generic-method name)
  (let ([methods (get-methods name)])
    (lambda args
      (call-method-helper (find-method args methods) args))))
(define (generic-constructor)
  (lambda (class . args)
    (add-class class)
    (let ([constr (get-constructors class)])
      (call-method-helper (find-constructor args constr) args))))
(define-syntax define-generic
  (syntax-rules ()
    ((_ ?name)
     (define ?name (generic-method '?name)))))
(define-syntax define-method
  (syntax-rules (next:)
    ((_ (?name (next: ?next-method) (?type ?arg) ...) . ?body)
     (add-method '?name (list ?type ...)
                 (lambda (?next-method ?arg ...) . ?body)))
    ((_ (?name (?type ?arg) ...) . ?body)
     (define-method (?name (next: dummy) (?type ?arg) ...) . ?body))))
(define make (generic-constructor))
(define-syntax define-constructor
  (syntax-rules (next:)
    ((_ (?class (next: ?next-method) (?type ?arg) ...) . ?body)
     (add-constructor ?class (list ?type ...)
                      (lambda (?next-method ?arg ...) . ?body)))
    ((_ (?class (?type ?arg) ...) . ?body)
     (define-constructor (?class (next: dummy) (?type ?arg) ...) . ?body))))
