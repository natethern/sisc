(define (expand-file from to)
  (let ([inf (open-source-input-file from)]
        [outf (open-output-file to)])
    (with-current-url from
      (lambda ()
        (let loop ([e (read-code inf)])
          (if (not (eof-object? e))
              (begin
                (pretty-print (sc-expand e) outf)
                (newline outf)
                (loop (read inf)))))))
    (close-output-port outf)
    (close-input-port inf)))
      
