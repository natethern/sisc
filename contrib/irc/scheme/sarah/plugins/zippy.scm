(define (yow channel message ignore term)
  (or (and (equal? ignore "") (equal? term "") (random-elem zippy))
      'continue))

(define (read-to-null in)
  (with-output-to-string 
    (lambda ()
       (let loop ([c (read-char in)])
         (unless (or (eof-object? c) (eqv? c #\nul))
           (display c)
           (loop (read-char in)))))))

(define zippy)

(define (init-zippy)
  (set! zippy
        (let ([inf (open-input-file "plugins/yow.lines")])
          (read-to-null inf)
          (let loop ([line (read-to-null inf)] [acc '()])
            (if (equal? "" line) acc
                (loop (read-to-null inf) (cons (trim line) acc)))))))

  