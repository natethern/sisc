(define-struct promise (expr eager?))

(define-simple-syntax (lazy exp)
  (make-promise (lambda () exp) #f))

(define (eager x)
  (make-promise x #t))

(define-simple-syntax (delay exp)
  (lazy (eager exp)))

(define (force promise)
  (if (promise? promise)
      (if (promise-eager? promise)
          (promise-expr promise)
          (let ((new-promise ((promise-expr promise))))
            (set-promise-expr! promise (promise-expr new-promise))
            (set-promise-eager?! promise (promise-eager? new-promise))
            (force promise)))
      promise))
