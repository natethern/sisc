(define (procedure-property proc key . rest)
  (apply annotation proc key rest))

(define (set-procedure-property! proc key val . rest)
  (apply set-annotation! proc key val rest))

(define (procedure-property! proc key thunk . rest)
  (if (procedure? proc)
      ((if (or (null? rest) (car rest))
           synchronized
           synchronized-unsafe)
       proc
       (lambda ()
         (let* ([def (list #f)]
                [res (annotation proc key def)])
           (if (eq? res def)
               (let ([res (thunk)])
                 (set-annotation! proc key res)
                 res)
               res))))
      (error 'procedure-property! "expected procedure")))
