(load-module "sisc.modules.SThread")

(define-syntax monitor/synchronize
  (lambda (e)
    (syntax-case e ()
     ((_ monitor expr)
      (syntax 
       (dynamic-wind
	   (lambda () (monitor/lock monitor))
	   (lambda () expr)
	   (lambda () (monitor/unlock monitor))))))))
