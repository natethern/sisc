(define-nongenerative-class (<string-input-port> <native-character-input-port>)
  sisc.io.string-input-port-type)
(define-nongenerative-class (<string-output-port> <native-character-output-port>)
  sisc.io.string-output-port-type)

(define (open-output-string)
  (make <string-output-port> (_open-output-string)))

(define (get-output-string os)
  (_get-output-string (unwrap-native-output-port os)))

(define (open-input-string str)
  (make <string-input-port> (_open-input-string str)))

(define (open-source-input-string str)
  (make <string-input-port> (_open-source-input-string str)))

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

(define (string-input-port? v)
  (instance-of? v <string-input-port>))

(define (string-output-port? v)
  (instance-of? v <string-output-port>))
