;; Miscellaneous useful pieces of code that are not big enough
;; for justifying a separate module

;; create a new symbol by pre and postfixing an existing symbol. Use
;; like this:
;; (define-syntax wrap
;;   (lambda (x)
;;     (syntax-case x ()
;;       ((_ name)
;;        (with-syntax ([nname (wrap-symbol "<" (syntax name) ">")])
;;          (syntax nname))))))
;; (define <foo> 1)
;; (wrap foo) ;=> 1
(define (wrap-symbol pre symb app)
  (datum->syntax-object
   symb
   (string->symbol
    (string-append pre
                   (symbol->string
                    (syntax-object->datum symb))
                   app))))

;; Al Petrofsky's dynamic-freeze.
;; dynamic-freeze returns a procedure whose body is always evaluated
;; in the dynamic context of the procedure's creation, rather than
;; that of its application. I.e., when it is applied, it restores the
;; dynamic context of the call to dynamic-freeze and passes its
;; arguments to proc. The dynamic context of the call to the frozen
;; procedure is then restored and the result(s) of the call to proc
;; are returned.
(define (dynamic-freeze proc)
  ((call-with-current-continuation
       (lambda (freeze-k)
         (lambda ()
           (lambda args
             (call-with-current-continuation
                 (lambda (call-k)
                   (freeze-k
                    (lambda ()
                      (call-with-values (lambda () (apply proc args))
                        call-k)))))))))))
