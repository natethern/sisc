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

(define (trace . procs)
  (define (make-traced procedure-name procedure)
    (lambda args
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
	       (write (cons procedure-name args))
	       (newline)
	       (let ([result (apply procedure args)])
		 (if (> depth 20)
		     (begin 
		       (for-each (lambda (n) (display #\space)) (iota 40))
		       (display (format "[~s]" depth)))
		     (for-each (lambda (n) (display #\space)) (iota (* depth 2))))		 (write result)
		     (newline)
		     result)))
	   (lambda () (putprop 'trace-depth '*sisc* 
			       (- (getprop 'trace-depth '*sisc*) 1))))))
  (let ([traced-procedures (cond [(getprop 'traced-procedures '*sisc*) => 
                                  (lambda (x) x)]
                                 [else '()])])
    (if (null? procs)
        (display (format "{currently traced procedures: ~a}~%" 
                         (map car traced-procedures)))
        (begin
          (for-each 
           (lambda (procedure-symbol)
             (cond [(not (procedure? (getprop procedure-symbol))) 
                    (error 'trace "'~s' is not bound to a procedure." 
                           procedure-symbol)]
                   [(not (assq procedure-symbol traced-procedures))
                    (begin
                      (set! traced-procedures 
                            (cons (cons procedure-symbol
                                        (getprop procedure-symbol))
                                  traced-procedures))
                      (putprop procedure-symbol '*toplevel*
                               (make-traced procedure-symbol 
                                            (getprop procedure-symbol))))]))
           procs)
          (putprop 'traced-procedures '*sisc* traced-procedures)))))

(define (untrace proc1 . procs)
  (define (remove-from-assoc procedure-name assoc)
    (cond [(null? assoc) '()]
          [(eq? (caar assoc) procedure-name)
           (cdr assoc)]
          [else (cons (car assoc) 
                      (remove-from-assoc procedure-name (cdr assoc)))]))
  (let ([traced-procedures (cond [(getprop 'traced-procedures '*sisc*) => 
                                  (lambda (x) x)]
                                 [else '()])])
    (for-each 
     (lambda (procedure-symbol)
       (let ([proc (assq procedure-symbol traced-procedures)])
         (if proc
             (begin
               (putprop procedure-symbol '*toplevel* (cdr proc))
               (set! traced-procedures 
                     (remove-from-assoc procedure-symbol traced-procedures))))))
     (cons proc1 procs))
    (putprop 'traced-procedures '*sisc* traced-procedures)))


(define _k-stack 
  (lambda (e)
    (let* ([k (cdr (assoc 'cont e))]
           [st (let loop ((k k))
                 (cond [(null? k) (values '() '())]
                       [(null? (continuation-nxp k)) 
                        (loop (continuation-stk k))]
                       [else 
                        (let ([nxp (continuation-nxp k)])
                          (cons nxp (loop (continuation-stk k))))]))])
      st)))
           
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
             [st #f]
             [annots #f])
        (call-with-values 
            (lambda ()
              (let loop ((k k))
                (cond [(null? k) (values '() '())]
                      [(null? (continuation-nxp k)) 
                       (loop (continuation-stk k))]
                      [else 
                       (let* ([nxp (continuation-nxp k)]
                              [nxp-annot (annotations-to-assoc nxp)])
                         (call-with-values 
                           (lambda () (loop (continuation-stk k)))
                           (lambda (exprs annots)
                             (values 
                              (cons nxp exprs)
                              (cons 
                               (if (null? nxp-annot)
                                   '((line-number . ?)
                                     (column-number . ?)
                                     (source-file . ?))
                                   nxp-annot)
                               annots)))))])))
          (lambda (exprs ants)
            (set! st exprs)
            (set! annots ants)))
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
                            (format "~a:~a:~a:~a:~a: <indeterminate call>~%" 
                                    sourcefile
                                    line column
                                    line column))))))
               (cdr annots) (cdr st)))
              (display (format "{No stack trace available.}~%")))))))

