(module streams ((stream-cons) (stream-cdr))
  (define-syntax stream-cons
    (syntax-rules ()
      ((_ car cdr)
       (cons car (delay cdr)))))
  (define-syntax stream-cdr
    (syntax-rules ()
      ((_ kons)
       (force (cdr kons))))))

