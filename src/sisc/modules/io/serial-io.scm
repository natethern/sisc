(define open-serial-input-file (make-io-proc _open-serial-input-file))
(define open-serial-output-file (make-io-proc _open-serial-output-file))

(define (call-with-serial-input-file file proc)
  (let ([port (open-serial-input-file file)])
    (call-with-values
        (lambda () (proc port))
      (lambda returns
        (close-input-port port)
        (apply values returns)))))

(define (call-with-serial-output-file file proc)
  (let ([port (open-serial-output-file file)])
    (call-with-values
        (lambda () (proc port))
      (lambda returns
        (close-output-port port)
        (apply values returns)))))

(define (with-serial-input-from-file file thunk)
  (call-with-serial-input-file file 
    (lambda (port) (with-input-from-port port thunk))))

(define (with-serial-output-to-file file thunk)
  (call-with-serial-output-file file 
    (lambda (port) (with-output-to-port port thunk))))
        
