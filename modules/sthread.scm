(load-module "sisc.modules.SThread")
(current-exit-handler
 (lambda ()
   (let ([thread-count (_active-thread-count)])
   (if (> thread-count 0)
       (error 'exit "cannot exit while ~a other scheme thread~a running"
	      thread-count (if (> thread-count 1) "s are" " is"))
       #t))))

(define (parallel thunk1 thunk2 . thunks)
  (let* ([all-thunks (cons thunk1 (cons thunk2 thunks))]
	 [threads (map thread/new all-thunks)])
    (for-each thread/start threads)
    (for-each (lambda (t)
		(let loop ([rv (thread/join t)])
		  (if (not rv) (loop (thread/join t)))))
	      threads)
    (apply values (map thread/result threads))))

    