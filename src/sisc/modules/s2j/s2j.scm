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
  (stringbuffer |StringBuffer|)
  (system       |System|)
  (thread       |Thread|)
  (throwable    |Throwable|)
  (exception    |Exception|))

(define-scheme-types
  (expression   |Expression|)
  (input-port   |SchemeInputPort|)
  (output-port  |SchemeOutputPort|)
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

;;;;;;;;;; exception handling ;;;;;;;;;;

(define-generic print-stack-trace)
(define-generic to-string)
(define-generic close)

(define (display-java-stack-trace java-exception)
  (let* ([sw (make (java-class "java.io.StringWriter"))]
         [pw (make (java-class "java.io.PrintWriter") sw)])
    (print-stack-trace java-exception pw)
    (close pw)
    (display (->string (to-string sw)))))
