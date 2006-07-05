(define (call-with-serial-input-port port proc)
  (proc (open-serial-input-port port)))

(define (call-with-serial-output-port port proc)
  (let ([port (open-serial-output-port port)])
    (call-with-values
        (lambda () (proc port))
      (lambda returns
        (flush-output-port port)
        (apply values returns)))))

(define (with-serial-input-from-port port thunk)
  (call-with-serial-input-port port 
    (lambda (port) (with-input-from-port port thunk))))

(define (with-serial-output-to-port port thunk)
  (call-with-serial-output-port port 
    (lambda (port) (with-output-to-port port thunk))))

(define (call-with-serial-input-file url proc)
  (call-with-binary-input-file url
    (lambda (in)
      (call-with-serial-input-port in proc))))

(define (call-with-serial-output-file url proc)
  (call-with-binary-output-file url
    (lambda (out)
      (call-with-serial-output-port out proc))))

(define (with-serial-output-to-file url thunk)
  (call-with-serial-output-file url
   (lambda (out)
     (with-output-to-port out thunk))))

(define (with-serial-input-from-file url thunk)
  (call-with-serial-input-file url
   (lambda (in)
     (with-input-from-port in thunk))))

(define (serialize v . portarg)
  (_serialize v (if (null? portarg) (current-input-port) (car portarg))))

(define (deserialize . portarg)
  (_deserialize (if (null? portarg) (current-input-port) (car portarg))))
