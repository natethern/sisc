(define (assert-proc proc thunk safe?)
  (if (procedure? proc)
      ((if safe? synchronized synchronized-unsafe) proc thunk)
      (error "expected procedure")))

(define (procedure-property proc key . rest)
  (assert-proc proc
               (lambda ()
                 (apply annotation proc key rest))
               #f))

(define (set-procedure-property! proc key val . rest)
  (assert-proc proc
               (lambda ()
                 (apply set-annotation! proc key val rest))
               #f))

(define (procedure-property! proc key thunk . rest)
  (assert-proc proc
               (lambda ()
                 (let* ([def (list #f)]
                        [res (annotation proc key def)])
                   (if (eq? res def)
                       (let ([res (thunk)])
                         (set-annotation! proc key res)
                         res)
                       res)))
               (or (null? rest) (car rest))))
