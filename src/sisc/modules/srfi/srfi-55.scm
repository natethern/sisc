; SISC implementation of SRFI 55: require-extension

(define-syntax require-srfi
  (lambda (ctx)
    (syntax-case ctx ()
      [(_ id)
       (let* ([srfi-name-symb
               (string->symbol
                (string-append "srfi-"
                               (number->string
                                (syntax-object->datum
                                 (syntax id)))))]
              [lib-name-symb
               (string->symbol
                (string-append "sisc/libs/srfi/"
                               (symbol->string srfi-name-symb)))])
         (with-syntax ([srfi-name
                        (datum->syntax-object
                         (syntax ctx) srfi-name-symb)]
                       [lib-name
                        (datum->syntax-object
                         (syntax ctx) lib-name-symb)])
           (require-library lib-name-symb)
           (syntax (begin (require-library 'lib-name)
                          (import srfi-name)))))])))

(define-syntax require-lib
  (lambda (ctx)
    (syntax-case ctx ()
      [(_ id)
       (let ([lib-name-symb (syntax-object->datum (syntax id))])
         (with-syntax ([lib-name
                        (datum->syntax-object
                         (syntax ctx) lib-name-symb)])
           (require-library lib-name-symb)
           (syntax (begin (require-library 'lib-name)
                          (import lib-name)))))])))


(define-syntax require-extension
  (syntax-rules (srfi lib)
    [(_)
     #!void]
    [(_ (srfi) clause ...)
     (require-extension clause ...)]
    [(_ (lib) clause ...)
     (require-extension clause ...)]
    [(_ (srfi id0 id ...) clause ...)
     (begin (require-srfi id0)
            (require-extension (srfi id ...) clause ...))]
    [(_ (lib id0 id ...) clause ...)
     (begin (require-lib id0)
            (require-extension (lib id ...) clause ...))]))
