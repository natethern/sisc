;; Miscellaneous useful pieces of code that are not big enough
;; for justifying a separate module

;;create a new symbol by pre and postfixing an existing symbol
(define (wrap-symbol pre symb app)
  (datum->syntax-object
   symb
   (string->symbol
    (string-append pre
                   (symbol->string
                    (syntax-object->datum symb))
                   app))))

;; Al Petrofsky's dynamic-lambda.
;; Dynamic-lambda creates a procedure whose body is always evaluated
;; in the dynamic context of the procedure's creation, rather than
;; that of its application.
(define-syntax dynamic-lambda
  (syntax-rules ()
    ((_ vars . body)
     ((call-with-current-continuation
          (lambda (creation-k)
            (lambda ()
              (lambda vars
                (call-with-current-continuation
                    (lambda (application-k)
                      (creation-k (lambda ()
                                    (call-with-values (lambda () . body)
                                      application-k)))))))))))))
