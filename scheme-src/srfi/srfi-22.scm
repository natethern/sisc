(define (srfi-22-prepare environment source-file)
  (case environment
    ((scheme-srfi-0)
     (eval '(import srfi-0))))
  (call-with-input-file source-file
    (lambda (in)
      (do ((c (read-char in) (read-char in)))
	  ((or (eq? c #\newline)
	       (eof-object? c))))
      (let loop ((e (read-code in)))
	(unless (eof-object? e)
	  (eval e)
	  (loop (read-code in)))))))



	