(define pretty-print display)

(for-each 
 (lambda (n) 
     (load (string-append "gabriel-scheme/" (symbol->string n))))
 '(runbenchmark.sch tprint.sch dderiv.sch fft.sch puzzle.sch takr.sch 
		    fprint.sch fread.sch deriv.sch cpstack.sch 
		    destruct.sch tak.sch ctak.sch div.sch takl.sch))

(pretty-print benchmark-results)
(pretty-print (list 'total (apply + (map caadr benchmark-results)) 'ms))
(newline)
(define repl (lambda args (void)))