(import debug-module)

(define (get-last-error)
  (getprop 'last-error '*sisc*))

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
	       (write (list 'name formal ...))
	       (newline)
	       (let ([result (begin body ...)])
		 (if (> depth 20)
		     (begin 
		       (for-each (lambda (n) (display #\space)) (iota 40))
		       (display (format "[~s]" depth)))
		     (for-each (lambda (n) (display #\space)) (iota (* depth 2))))		 (write result)
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
	       (write (list 'name var ...))
	       (newline)
	       (let ([result (begin body ...)])
		 (if (> depth 20)
		     (begin 
		       (for-each (lambda (n) (display #\space)) (iota 40))
		       (display (format "[~s]" depth)))
		     (for-each (lambda (n) (display #\space)) (iota (* depth 2))))		 (write result)
		     (newline)
		     result)))
	   (lambda () (putprop 'trace-depth '*sisc* 
			       (- (getprop 'trace-depth '*sisc*) 1))))))))

(define stack-trace 
  (letrec ([annotations-to-assoc
            (lambda (expr)
              (let loop ([x ()] [keys (annotation-keys expr)])
                (if (null? keys) x
                    (loop
                     (cons (cons (car keys) (annotation expr (car keys)))
                           x)
                     (cdr keys)))))])
    (lambda (e)
      (let* ([k (cdr (assoc 'cont e))]
             [m (cdr (assoc 'value e))]
             [st
              (let loop ((k k))
                (cond [(null? k) '()]
                      [(null? (continuation-nxp k)) 
                       (loop (continuation-stk k))]
                      [else 
                       (let ([nxp (continuation-nxp k)])
                         (cons nxp 
                               (loop (continuation-stk k))))]))]
             [annots 
              (let loop ((st st) (last-st #f))
                (if (null? st) '()
                    (let ([asc (annotations-to-assoc (car st))])
                      (if (null? asc)
                          (begin
                            (if last-st
                                (set-cdr! last-st (cdr st)))
                            (loop (cdr st) st))
                          (cons asc (loop (cdr st) st))))))])
        (if (not (null? annots))
            (begin
              (let ([data (car annots)])
                (let ([line (cdr (assoc 'line-number data))]
                      [column (cdr (assoc 'column-number data))]
                      [sourcefile (cdr (assoc 'source-file data))])
                      (display 
                       (format "~a:~a:~a:~a:~a: ~a~%" 
                               sourcefile
                               line column
                               line column
                               m))))
              (for-each
               (lambda (data expr)
                 (if data
                     (let ([line (cdr (assoc 'line-number data))]
                           [column (cdr (assoc 'column-number data))]
                           [sourcefile (cdr (assoc 'source-file data))])
                       (if (and (_fill-rib? expr)
                                (_free-reference-exp? (_fill-rib-exp expr)))
                           (display 
                            (format "~a:~a:~a:~a:~a: <called from ~a>~%" 
                                    sourcefile
                                    line column
                                    line column
                                    (_free-reference-symbol
                                     (_fill-rib-exp expr))))
                           (display 
                            (format "~a:~a:~a:~a:~a: <called from>~%" 
                                    sourcefile
                                    line column
                                    line column))))))
               (cdr annots) (cdr st)))
              (display (format "{No stack trace available.}~%")))))))

