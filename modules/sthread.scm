(load-module "sisc.modules.SThread")
(current-exit-handler
 (lambda ()
   (let ([thread-count (_active-thread-count)])
   (if (> thread-count 0)
       (error 'exit "cannot exit while ~a other scheme thread~a running"
	      thread-count (if (> thread-count 1) "s are" " is"))
       #t))))


  