; Derived buffer code

(define (buffer . args)
  (let ((nb (make-buffer (length args))))
    (do ((i 0 (+ i 1))
         (a args (cdr args)))
        ((= i (buffer-length nb)) nb)
      (buffer-set! nb i (car a)))))

