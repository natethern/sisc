(define (call-with-input-string str proc)
  (let* ([port (open-input-string str)]
         [result (proc port)])
    (close-input-port port)
    result))

(define (call-with-output-string proc)
  (let ([outsp (open-output-string)])
    (proc outsp)
    (let ([s (get-output-string outsp)])
      (close-output-port outsp)
      s)))

(define (with-input-from-string str thunk)
  (call-with-input-string str
    (lambda (port) (with-input-from-port port thunk))))

(define (with-output-to-string thunk)
  (call-with-output-string
    (lambda (port) (with-output-to-port port thunk))))

        