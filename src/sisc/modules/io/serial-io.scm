(define-class (<serial-input-port> <filter-input-port>))
(define-class (<serial-output-port> <filter-output-port>))

(define (open-serial-input-port port)
  (make <serial-input-port>
    (_open-serial-input-port (unwrap-native-input-port port))))

(define (open-serial-output-port port)
  (make <serial-output-port>
    (_open-serial-output-port (unwrap-native-output-port port))))

(define (call-with-serial-input-port port proc)
  (proc (open-serial-input-port file)))

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

(define (serialize v . portarg)
  (_serialize v (unwrap-native-output-port
                 (if (null? portarg) (current-input-port) (car portarg)))))

(define (deserialize . portarg)
  (_deserialize (unwrap-native-input-port
                 (if (null? portarg) (current-input-port) (car portarg)))))

(define (serial-input-port? v)
  (instance-of? v <serial-input-port>))

(define (serial-output-port? v)
  (instance-of? v <serial-output-port>))