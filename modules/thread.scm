;;
; monitor/synchronize-unsafe will synchronize a set of expressions
; on a given monitor, but will *not* safely unlock the monitor when
; any of the expressions raise an error or escape the synchronized
; block by invoking a continuation.
;
; The only advantage over monitor/synchronize is a profound 
; difference in speed.
;;
(define-syntax monitor/synchronize-unsafe
  (lambda (e)
    (syntax-case e ()
     ((_ monitor expr ...)
      (syntax 
       (begin (monitor/lock monitor)
	      (let ([result (begin expr ...)])
		(monitor/unlock monitor)
		result)))))))

;;
; monitor/synchronize will synchronize a set of expressions
; on a given monitor, and will safely unlock the monitor if
; the synchronized code block is left due to error or a non-local
; exit.
;;
(define-syntax monitor/synchronize
  (lambda (e)
    (syntax-case e ()
     ((_ monitor expr ...)
      (syntax 
       (dynamic-wind
	   (lambda () (monitor/lock monitor))
	   (lambda () expr ...)
	   (lambda () (monitor/unlock monitor))))))))
