(define (call-with-serial-input-file file proc)
  (let* ([port (open-serial-input-file file)]
         [result (proc port)])
    (close-input-port port)
    result))

(define (call-with-serial-output-file file proc)
  (let* ([port (open-serial-output-file file)]
         [result (proc port)])
    (close-output-port port)
    result))        

(define (with-serial-input-from-file file thunk)
  (call-with-serial-input-file file 
    (lambda (port) (with-input-from-port port thunk))))

(define (with-serial-output-to-file file thunk)
  (call-with-serial-output-file file 
    (lambda (port) (with-output-to-port port thunk))))
        
