;Procedural (non-syntactic) amb
(define amb-fail)

(define (initialize-amb-fail)
  (set! amb-fail
    (lambda ()
      (error "amb tree exhausted"))))

(initialize-amb-fail)

(define (amb . choices)
  (let ([last-amb amb-fail])
    (call/cc
     (lambda (sk)
       (for-each (lambda (arg)
                   (call/cc 
                    (lambda (fk)
                      (set! amb-fail
                        (lambda () 
                          (set! amb-fail last-amb)
                          (fk 'fail)))
                      (sk arg))))
                 choices)
       (last-amb)))))

