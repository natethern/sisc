(define-syntax define-primitive-java-type
  (lambda (x)
    (syntax-case x ()
      ((_ name)
       (with-syntax ((sname (wrap-symbol "<j" (syntax name) ">")))
         (syntax (define sname (java/class 'name))))))))
(define-syntax define-primitive-java-types
  (syntax-rules ()
    ((_ name ...)
     (begin (define-primitive-java-type name) ...))))

(define-syntax define-java-lang-type
  (lambda (x)
    (syntax-case x ()
      ((_ name jname)
       (with-syntax ([sname (wrap-symbol "<j" (syntax name) ">")]
                     [jname (wrap-symbol "java.lang." (syntax jname) "")])
         (syntax (define sname (java/class 'jname))))))))
(define-syntax define-java-lang-types
  (syntax-rules ()
    ((_ (name jname) ...)
     (begin (define-java-lang-type name jname) ...))))

(define-syntax define-scheme-type
  (lambda (x)
    (syntax-case x ()
      ((_ name jname)
       (with-syntax ([sname (wrap-symbol "<" (syntax name) ">")]
                     [jname (wrap-symbol "sisc.data." (syntax jname) "")])
         (syntax (define sname (java/class 'jname))))))))
(define-syntax define-scheme-types
  (syntax-rules ()
    ((_ (name jname) ...)
     (begin (define-scheme-type name jname) ...))))

(define-primitive-java-types
  void boolean char byte short int long float double)

(define-java-lang-types
  (class        |Class|)
  (math         |Math|)
  (object       |Object|)
  (process      |Process|)
  (runtime      |Runtime|)
  (string       |String|)
  (stringbuffer	|StringBuffer|)
  (system       |System|)
  (thread       |Thread|)
  (throwable	|Throwable|)
  (exception	|Exception|))

(define-scheme-types
  (expression   |Expression|)
  (input-port   |SchemeInputPort|)
  (output-port  |OutputPort|)
  (list         |Pair|)
  (procedure    |Procedure|)
  (number       |Quantity|)
  (boolean      |SchemeBoolean|)
  (character    |SchemeCharacter|)
  (string       |SchemeString|)
  (vector       |SchemeVector|)
  (void         |SchemeVoid|)
  (symbol       |Symbol|)
  (object       |Value|))

(define ih (java/class '|java.lang.reflect.InvocationHandler|))
(define (make-proxy-helper constr methods . meths)
  (let ((methods (map (lambda (x y) (cons x y)) methods meths)))
    (constr (java/invocation-handler
             (lambda (p m a)
               (let ((m (assoc m methods)))
                 (if m
                     (apply (cdr m) p a)
                     (error "no such method"))))))))
(define (find-exact-method classes name . param-types)
  (let ([jname (java/mangle-method-name name)])
    (let loop ([classes classes])
      (if (null? classes)
          (error "no matching method")
          (or (apply java/method (car classes) jname param-types)
              (loop (cdr classes)))))))
(define (java-proxy-helper interfaces sigs proc)
  (let* ([proxy-class (apply java/proxy interfaces)]
         [methods (map (lambda (x) (apply find-exact-method interfaces x))
                       sigs)]
         [constr (java/constructor proxy-class ih)])
    (lambda args
      (apply make-proxy-helper constr methods (apply proc args)))))
(define-syntax java-proxy
  (syntax-rules (self method)
    ((_ ?args ?intf	(method (?name (?type ?arg) ...) . ?body) ...)
     (java-proxy-helper ?intf
                        `((?name ,?type ...) ...)
                        (lambda ?args
                          (list (lambda (self ?arg ...) . ?body) ...))))))
(define-syntax define-java-proxy
  (syntax-rules ()
    ((_ (?pname . ?args) (?intf ...) ?rest ...)
     (define ?pname (java-proxy ?args (list ?intf ...) ?rest ...)))
    ((_ (?pname . ?args) ?intf ?rest ...)
     (define ?pname (java-proxy ?args (list ?intf) ?rest ...)))))
