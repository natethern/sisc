(load-module "sisc.modules.SDebug")

(define-syntax show
  (lambda (e)
    (syntax-case e ()
      ((_ expr)
       (syntax
	(let ([source (sc-expand (quote expr))])
	  (pretty-print source)
            (newline)
            (display "=>")
            (newline)
            (let ([compiled (compile source)])
              (pretty-print (express compiled))
              (newline)
              (display "=>")
              (newline)
              (compiled))))))))

(putprop 'trace-depth '*sisc* -1)

(define-syntax trace-lambda
  (syntax-rules ()
    ((trace-lambda name (formal ...) body ...)
     (lambda (formal ...)
       (dynamic-wind
	   (lambda () (putprop 'trace-depth '*sisc* 
			       (+ (getprop 'trace-depth '*sisc*) 1)))
	   (lambda ()
	     (let ([depth (getprop 'trace-depth '*sisc*)])
	       (if (> depth 20)
		   (begin 
		     (for-each (lambda (n) (display #\space)) (iota 40))
		     (display (format "[~s]" depth)))
		   (for-each (lambda (n) (display #\space)) (iota (* depth 2))))
	       (display (list 'name formal ...))
	       (newline)
	       (let ([result (begin body ...)])
		 (if (> depth 20)
		     (begin 
		       (for-each (lambda (n) (display #\space)) (iota 40))
		       (display (format "[~s]" depth)))
		     (for-each (lambda (n) (display #\space)) (iota (* depth 2))))		 (display result)
		     (newline)
		     result)))
	   (lambda () (putprop 'trace-depth '*sisc* 
			       (- (getprop 'trace-depth '*sisc*) 1))))))))


(define-syntax trace-let
  (syntax-rules ()
    ((trace-let name ([var val] ...) body ...)
     (let name ([var val] ...)
       (dynamic-wind
	   (lambda () (putprop 'trace-depth '*sisc* 
			       (+ (getprop 'trace-depth '*sisc*) 1)))
	   (lambda ()
	     (let ([depth (getprop 'trace-depth '*sisc*)])
	       (if (> depth 20)
		   (begin 
		     (for-each (lambda (n) (display #\space)) (iota 40))
		     (display (format "[~s]" depth)))
		   (for-each (lambda (n) (display #\space)) (iota (* depth 2))))
	       (display (list 'name val ...))
	       (newline)
	       (let ([result (begin body ...)])
		 (if (> depth 20)
		     (begin 
		       (for-each (lambda (n) (display #\space)) (iota 40))
		       (display (format "[~s]" depth)))
		     (for-each (lambda (n) (display #\space)) (iota (* depth 2))))		 (display result)
		     (newline)
		     result)))
	   (lambda () (putprop 'trace-depth '*sisc* 
			       (- (getprop 'trace-depth '*sisc*) 1))))))))


