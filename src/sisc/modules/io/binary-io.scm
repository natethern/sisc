(define (call-with-binary-input-file file proc)
  (let* ([port (open-binary-input-file file)]
         [result (proc port)])
    (close-input-port port)
    result))

(define (call-with-binary-output-file file proc)
  (let* ([port (open-binary-output-file file)]
         [result (proc port)])
    (close-output-port port)
    result))        

(define (with-binary-input-from-file file thunk)
  (call-with-binary-input-file file 
    (lambda (port) (with-input-from-port port thunk))))

(define (with-binary-output-to-file file thunk)
  (call-with-binary-output-file file 
    (lambda (port) (with-output-to-port port thunk))))
