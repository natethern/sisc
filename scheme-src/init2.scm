(define modulo
  (lambda (x y)
    (let ([r (remainder x y)])
       (if (if (negative? y) (positive? r) (negative? r))
           (+ r y)
           r))))

(define dynamic-wind 
  (lambda args
    (eval '(let ()
	     (define *here* (list #f))
	     
	     (define original-cwcc call-with-current-continuation)
	     
	     (define (reroot! there)
	       (if (not (eq? *here* there))
		   (begin
		     (reroot! (cdr there))
		     (let ((before (caar there)) (after (cdar there)))
		       (set-car! *here* (cons after before))
		       (set-cdr! *here* there)
		       (set-car! there #f)
		       (set-cdr! there '())
		       (set! *here* there)
		       (before)))))                                   
	     
	     (set! dynwind-call/cc
		   (lambda (proc)
		     (let ((here *here*))
		       (original-cwcc
			(lambda (cont)
			  (proc (lambda results
				  (reroot! here)
				  (apply cont results))))))))
	     
	     (set! dynamic-wind
		   (lambda (before during after)
		     (let ((here *here*))
		       (reroot! (cons (cons before after) here))
		       (call-with-values
			   during
			 (lambda results
			   (reroot! here)
			   (apply values results))))))
	     
	     (set! call/cc dynwind-call/cc)
	     (set! call-with-current-continuation dynwind-call/cc)))
    (apply (getprop 'dynamic-wind) args)))
  
;;;; "ratize.scm" Convert number to rational number (ported from SLIB)

(define rationalize #f)
(letrec ([rational:simplest 
	  (lambda (x y)
	    (cond ((< y x) (rational:simplest y x))
		  ((not (< x y)) (if (rational? x) x 
				     (error 'rationalize 
					    "~s weirdness" x)))
		  ((positive? x) (sr x y))
		  ((negative? y) (- (sr (- y) (- x))))
		  (else (if (and (exact? x) (exact? y)) 0 0.0))))]
	 [sr 
	  (lambda (x y) 
	    (let ((fx (floor x)) (fy (floor y)))
	      (cond ((not (< fx x)) fx)
		    ((= fx fy) (+ fx (/ (sr (/ (- y fy)) (/ (- x fx))))))
		    (else (+ 1 fx)))))])
  (set! rationalize 
	(lambda (x e)
	  (rational:simplest (- x e) (+ x e)))))

(define list-tail (lambda (x k) (if (zero? k) x (list-tail (cdr x) (- k 1)))))
(define call/fc call-with-failure-continuation)
(define call/cc call-with-current-continuation)

(define (values . args)
  (call/cc (lambda (k) (apply k args))))

(define make-polar
  (lambda (x y)
    (make-rectangular (* x (cos y))
		      (* x (sin y)))))

(define magnitude
  (lambda (x)
    (cond [(real? x) (abs x)]
	  [else (let ([r (real-part x)]
		      [i (imag-part x)])
		  (sqrt (+ (* r r) (* i i))))])))

(define angle 
  (lambda (x)
    (cond [(integer? x) (if (>= x 0)
			    (atan 0 1)
			    (atan 0 -1))]
	  [(real? x) (atan 0 x)]
	  [else (atan (imag-part x) (real-part x))])))

(define (string-copy x)
  (letrec ([newstr (make-string (string-length x))]
	   [string-loop (lambda (sl n)
			  (if (null? sl) newstr
			      (begin
				(string-set! newstr n (car sl))
				(string-loop (cdr sl) (+ n 1)))))])
    (string-loop (string->list x) 0)))
	  
(define (file-exists? x)
  (not (eq? (file-type x) 'no-file)))

(define (unquote x)
  (error 'unquote "expression ~s not valid outside of a quasiquote."
	 x))

(define (unquote-splicing x)
  (error 'unquote-splicing "expression ~s valid outside of a quasiquote."
	 x))
