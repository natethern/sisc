(load-module "sisc.debug.SDebug")

(define annotated?
  (lambda (obj)
    (not (null? (annotation-keys obj)))))

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
	       (display (list 'name var ...))
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

(emit-annotations #t)

(define (stack-trace k)
  (let loop ((k k))
    (cond [(null? k) '()]
	  [(null? (continuation-nxp k)) (loop (continuation-stk k))]
	  [else 
	   (let ([nxp (continuation-nxp k)])
	     (cons nxp 
		   (loop (continuation-stk k))))])))

(define (emacs-stack-trace e) 
  (let* ([k (cdr (assoc 'cont e))]
	 [m (cdr (assoc 'message e))]
	 [st 
	 (let loop ((x (map annotation-source (stack-trace k))))
	   (cond [(null? x) '()]
		 [(not (car x)) (loop (cdr x))]
		 [else (cons (car x) (loop (cdr x)))]))])
    (if (not (null? st))
	(begin
	  (let ([data (car st)])
	    (let ([line (cdr (assoc 'line-number data))]
		  [column (cdr (assoc 'column-number data))]
		  [sourcefile (cdr (assoc 'source-file data))])
	      (display (format "~a:~a:~a:~a:~a: ~a~%"
			       sourcefile
			       line column
			       line column
			       m)))
	    (set! st (cdr st)))
	  (for-each
	   (lambda (data)
	     (if data
		 (let ([line (cdr (assoc 'line-number data))]
		       [column (cdr (assoc 'column-number data))]
		       [sourcefile (cdr (assoc 'source-file data))])
		   (display (format "~a:~a:~a:~a:~a: <called from>~%" 
				    sourcefile
				    line column
				    line column)))))
	   st)))))

