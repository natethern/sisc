(for-each 
 (lambda (n) 
   (call/fc (lambda ()
	      (load (string-append "gabriel-scheme/" (symbol->string n))))
	    (lambda (m e c)
	      (void))))
 '(runbenchmark.sch tprint.sch dderiv.sch fft.sch puzzle.sch takr.sch 
		    fprint.sch fread.sch deriv.sch cpstack.sch 
		    destruct.sch tak.sch ctak.sch div.sch takl.sch))

(pretty-print benchmark-results)
(newline)
(define repl (lambda args (void)))