; buffer type
(define <buffer> (make-type '|sisc.modules.io.Buffer|))

; Derived buffer code

(define (buffer . args)
  (let ((nb (make-buffer (length args))))
    (do ((i 0 (+ i 1))
         (a args (cdr a)))
        ((= i (buffer-length nb)) nb)
      (buffer-set! nb i (car a)))))

