(define (call-with-binary-input-file file proc)
  (call-with-input-port&close (open-binary-input-file file) proc))
 
(define (call-with-binary-output-file file proc)
  (call-with-output-port&close (open-binary-output-file file) proc))

(define (with-binary-input-from-file file thunk)
  (call-with-binary-input-file file 
    (lambda (port) (with-input-from-port port thunk))))

(define (with-binary-output-to-file file thunk)
  (call-with-binary-output-file file 
    (lambda (port) (with-output-to-port port thunk))))
