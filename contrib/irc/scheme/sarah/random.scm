(define random 
  (let ((inf (open-input-file "/dev/urandom")))
    (lambda (n)
      (if (zero? n) 0
          (modulo (+ (ashl (char->integer (read-char inf)) 24)
                     (ashl (char->integer (read-char inf)) 16)
                     (ashl (char->integer (read-char inf)) 8)
                     (char->integer (read-char inf)))
                  n)))))

(define (random-elem ls)
  (list-ref ls (random (length ls))))