(module streams ((stream-cons) (stream-cdr) ordered-stream-map)
  (define-syntax stream-cons
    (syntax-rules ()
      ((_ car cdr)
       (cons car (delay cdr)))))
  (define-syntax stream-cdr
    (syntax-rules ()
      ((_ kons)
       (force (cdr kons)))))
  (define (ordered-stream-map proc ls)
    (if (null? ls) '()
        (let ([res (proc (car ls))])
          (cons res (ordered-stream-map proc (stream-cdr ls)))))))


