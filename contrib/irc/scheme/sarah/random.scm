(import s2j)
(import generic-procedures)
(define-generic-java-method next-int)

(define random 
  (let ((rand-source (java-new (java-class '|java.util.Random|))))
    (lambda (n)
      (modulo (abs (->number (next-int rand-source))) n))))

(define (random-elem ls)
  (list-ref ls (random (length ls))))