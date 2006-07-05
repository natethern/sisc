; Buffer-IO support functions

(define (call-with-input-buffer buffer proc)
  (let* ([port (open-input-buffer buffer)]
         [result (proc port)])
    (close-input-port port)
    result))

(define (call-with-output-buffer proc)
  (let ([outsp (open-output-buffer)])
    (proc outsp)
    (let ([s (get-output-buffer outsp)])
      (close-output-port outsp)
      s)))

(define (with-input-from-buffer str thunk)
  (call-with-input-buffer str
    (lambda (port) (with-input-from-port port thunk))))

(define (with-output-to-buffer thunk)
  (call-with-output-buffer
    (lambda (port) (with-output-to-port port thunk))))
#|
(define (buffer-input-port? v)
  (instance-of? v <buffer-input-port>))

(define (buffer-output-port? v)
  (instance-of? v <buffer-output-port>))
|#