;;create a new symbol by pre and postfixing an existing symbol
(define (wrap-symbol pre symb app)
  (datum->syntax-object
   symb
   (string->symbol
    (string-append pre
                   (symbol->string
                    (syntax-object->datum symb))
                   app))))
