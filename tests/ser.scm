(import s2j)

;;example data: a Java object that refers to a k that refers to a Java
;;object that refers to a Scheme object.

(define-java-class <java.util.vector>)
(define-generic-java-methods add element-at)

(define v (java-new <java.util.vector>))
(let ([d (java-new <java.util.vector>)])
  (add d (java-wrap '(1 2)))
  (call/cc (lambda (k) (add v (java-wrap k))))
  (java-unwrap (element-at d (->jint 0))))

;;serialization

(define-java-classes
  <java.io.file-output-stream>
  <java.io.object-output-stream>)
(define-generic-java-methods write-object flush close)

(define p (java-new <java.io.object-output-stream>
                    (java-new <java.io.file-output-stream>
                              (->jstring "sisck.ser"))))
(define-generic-java-method print-stack-trace)

(with/fc (lambda (m e) (print-stack-trace m) #f)
  (lambda () (write-object p v)))

(flush p)
(close p)

;;deserialization

(define-java-classes
  <java.io.file-input-stream>
  <java.io.object-input-stream>)
(define-generic-java-methods read-object close)

(define p (java-new <java.io.object-input-stream>
                    (java-new <java.io.file-input-stream>
                              (->jstring "sisck.ser"))))
(define vv #f)
(with/fc (lambda (m e) (print-stack-trace m) #f)
  (lambda () (set! vv (read-object p))))
(close p)
(define kk (java-unwrap (element-at vv (->jint 0))))
(kk)


;;serialisation using new framework

(import serial-io)
(define (foo x)
  (+ x (call/cc (lambda (k)
                  (call-with-serial-output-file "/tmp/rade/foo.ser"
                    (lambda (port) (serialize k port)))
                  1))))
(foo 10) ;=> 11
(exit)
;;restart
(import serial-io)
(define k (call-with-serial-input-file "/tmp/rade/foo.ser" deserialize))
(k 2) ;=> 12

(define ser-file "/tmp/rade/foo.ser")
(import record)
(import serial-io)
(define-struct test-struct (f1 f2 f3))
(define a (make-test-struct 1 2 3))
(test-struct-f1 a) ;;(A)
(call-with-serial-output-file ser-file
  (lambda (port) (serialize a port)))
(define b (call-with-serial-input-file ser-file deserialize))
(test-struct-f1 b) ;;(B) FAILS!

(define l (let ((foo (list 1)))
            (list foo (lambda () foo))))
(eq? (car l) ((cadr l))) ;=> #t
(call-with-serial-output-file ser-file
  (lambda (port) (serialize (cadr l) port)))
(define ll (call-with-serial-input-file ser-file deserialize))
(eq? (car l) (ll)) ;=> #f
