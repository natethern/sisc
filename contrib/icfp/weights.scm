;; Builds up a floating point value summing a given weight
;; divided by distance for each cell that satisfies a provided 
;; predicate.
(define 2xmap
	 '((-2 -2 4) (-1 -2 3) (0 -2 2) (1 -2 3) (2 -2 4)
	   (-2 -1 3) (-1 -1 2) (0 -1 1) (1 -1 2) (2 -1 3)
	   (-2 0 2)  (-1 0 1)    #;x    (1 0 1)  (2 0 2)
	   (-2 1 3)  (-1 1 2)  (0 1 1)  (1 1 2)  (2 1 3)
	   (-2 2 4)  (-1 2 3)  (0 2 2)  (1 2 3)  (2 2 4)))

(define 1xmap 
  '(         (0 -1 1) 
    (-1 0 1)    #;x    (1 0 1)  
              (0 1 1)  ))

(define neighbor-search
  (lambda (dmap id x y pred? value)
    (apply + (map (lambda (d)
		    (let ((nx (+ (car d) x))
			  (ny (+ (cadr d) y)))
		      (if (and (<= 1 nx world-width)
			       (<= 1 ny world-height)
			       (pred? id nx ny))
			  (/ value (caddr d))
			  0)))
		  dmap))))

(define weights (make-hashtable))
(define (set-weight! id type val)
  (hashtable/put! (hashtable/get! weights id 
				  (lambda () (make-hashtable)))
		  type val))

(define initial-weights
  '((return-to-base . 10)
    (danger . 2)
    (crowd . 1)
    (delivery . 3)
    (search . 1)
    (revisit . -3)
    (visit . 1)
    (pickup . 5)
    (go-nowhere . -30)))

(define (weight id type)
  (hashtable/get (hashtable/get! weights id make-hashtable)
		  type (cdr (assq type initial-weights))))

(define (danger-weight id x y)
  (- (neighbor-search 2xmap id x y (lambda (id x y) (water? x y)) 
		   (weight id 'danger))))

(define (crowd-weight id x y)
  (- (neighbor-search 2xmap id x y opponent? (weight id 'crowd))))

#;(define (revisit-weight id x y)
  (- (neighbor-search 2xmap id x y (lambda (id x y)
                                     (not (zero? (seen? id x y))))
                      (weight id 'revisit))))

(define (delivery-distance-weight id x y)
  (let ((delivery-weight (weight id 'delivery)))
    (let loop ((packages (robots-packages id)) (acc 0.0))
      (if (null? packages) acc
	  (loop (cdr packages)
		(+ (/ delivery-weight 
		      (apply dist `(,x ,y ,@(package-destination (car packages)))))
		   acc))))))

(define (all-unclaimed-packages)
  (hashtable/map (lambda (key val) val) unclaimed-packages))

(define (pickup-distance-weight id x y)
  (let ((pickup-weight (weight id 'pickup))
	(search-weight (weight id 'search)))
    (let loop ((packages (all-unclaimed-packages)) (acc 0.0))
      (if (null? packages) acc
	  (loop (cdr packages)
		(+ (/ pickup-weight 
		      (apply dist `(,x ,y ,@(package-location (car packages)))))
		   acc))))))

(define (base-weight id x y)
  (apply + (map (lambda (base)
		  (let ((rp (robots-packages id)))
		    (/ (/ (weight id 'return-to-base)
			  (let ([x (apply dist `(,x ,y ,@base))])
			    (if (zero? x) 1 x)))
		       (+ 1 (length rp))
                       (if (apply visible? `(,x ,y ,@base #t))
                           0.5
                           2))))
		bases)))

(define (search-weight id x y)
  (* (weight id 'revisit)
     (if (null? (robots-packages id))
         (seen? id x y)
         0)))

(define (barrier-weight id x y)
  (if (wall? x y)
      (weight id 'go-nowhere)
      0))

(define (visible? x1 y1 x2 y2 f)
  (cond [(wall? x1 y1) #f]
        [(water? x1 y1) #f]
        [(and f (= x1 x2))
         (cond [(= y1 y2) #t]
               [else (visible? x1 (+ y1 (- y2 y1)) x2 y2 (not f))])]
        [(= y1 y2)
         (cond [(= x1 x2) #t]
               [else (visible? (+ x1 (- x2 x1)) y1 x2 y2 (not f))])]))

(define (all-weights id x y . move)
  (apply + (let ((result
		  (map (lambda (v)
			 (v id x y)) 
		       (list danger-weight crowd-weight 
			     pickup-distance-weight delivery-distance-weight
			     search-weight base-weight
			     barrier-weight))))
#;	     (debug "Resulting weights for move ~a to ~a: ~a [~a]" 
                    move (list x y) result (apply + result))
	     result)))