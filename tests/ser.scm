(import generic-procedures)
(import s2j)

;;example data: a Java object that refers to a k that refers to a Java
;;object that refers to a Scheme object.

(define <java.util.Vector>
  (java-class "java.util.Vector"))
(define-generic add)
(define-generic element-at)

(define v (make <java.util.Vector>))
(let ([d (make <java.util.Vector>)])
  (add d (java-wrap '(1 2)))
  (call/cc (lambda (k) (add v (java-wrap k))))
  (java-unwrap (element-at d (->jint 0))))

;;serialization

(define <java.io.FileOutputStream>
  (java-class "java.io.FileOutputStream"))
(define <java.io.ObjectOutputStream>
  (java-class "java.io.ObjectOutputStream"))
(define-generic write-object)
(define-generic flush)
(define-generic close)

(define p (make <java.io.ObjectOutputStream>
                (make <java.io.FileOutputStream>
                      (->jstring "sisck.ser"))))
(define-generic print-stack-trace)
(with/fc (lambda (m e) (print-stack-trace m) #f)
  (lambda () (write-object p v)))

(flush p)
(close p)

;;deserialization

(define <java.io.FileInputStream>
  (java-class "java.io.FileInputStream"))
(define <java.io.ObjectInputStream>
  (java-class "java.io.ObjectInputStream"))
(define-generic read-object)

(define p (make <java.io.ObjectInputStream>
                (make <java.io.FileInputStream>
                      (->jstring "sisck.ser"))))
(define vv #f)
(with/fc (lambda (m e) (print-stack-trace m) #f)
  (lambda () (set! vv (read-object p))))
(close p)
(define kk (java-unwrap (element-at vv (->jint 0))))
(kk)
