; SISC implementation of SRFI 55: require-extension
; Currently only supports srfis.  In the future it may support
; SLIB as well

(define-syntax require-extension
  (syntax-rules ()
    ((_)
     #!void)
    ((_ (identifier arguments ...) clauses ...)
     (let ()
       ((srfi-55-clause-handler (quote identifier))
        (quote (arguments ...)))
       (require-extension clauses ...)))))

(define (srfi-55-clause-handler id)
  (case id
    ((srfi)
     (lambda (nums)
       (for-each (lambda (num)
                   (let ((srfi (string-append "srfi-"
                                              (number->string num))))
                     (require-library (string->symbol
                                       (string-append "sisc/libs/srfi/"
                                                      srfi)))
                     (eval `(import ,(string->symbol srfi))
                           (interaction-environment))))
                 nums)))
    (else (error 'require-extension
                 "unknown extension identifier: ~a"
                 id))))

