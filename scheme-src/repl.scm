(define repl
  (letrec ([repl-loop
	    (lambda (console-in console-out writer)
	      (display "> " console-out)
	      (let ([exp (read console-in)])
		(let ([val (eval exp)])
		  (cond [(void? val) (repl-loop console-in console-out writer)]
			[(eof-object? val) (void)]
			[else 
			 (begin 
			   (writer val console-out)
			   (newline console-out)
			   (repl-loop console-in console-out writer))]))))])
    (lambda args
      (set! _separator (getprop 'file.separator '*environment-variables*))
      (current-directory (getprop 'user.dir '*environment-variables*))
      (letrec ([console-in (if (null? args) (current-input-port)
			    (car args))]
	       [console-out (if (null? args) (current-output-port)
				(cadr args))]
	       [error-handler
		(lambda (message error-cont failure-cont)
		  (display message console-out)
		  (newline console-out))])
	(let loop ()
	  (call/fc
	   (lambda ()
	     (repl-loop console-in console-out (current-writer))
	     (void))
	   (lambda (m e f)
	     (error-handler m e f)
	     (loop))))))))

