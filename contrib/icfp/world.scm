; World Representation

(define world-width)
(define world-height)
(define world-scale)
(define world-map)
(define world)

(define bases '())
(define (add-home-base! x y)
  (set! bases (cons (list x y) bases)))

(define (make-world! width height)
  (let ((world (make-hashtable)))
    (set! world-width width)
    (set! world-height height)
    (set! world-scale (+ width height))
    (set! world-map (make-string (* width height) #\.))))


(define-syntax define-alias
  (syntax-rules ()
    ((_ name (args ...) body ...)
     (define-syntax name
       (syntax-rules ()
	 ((_ args ...)
	  body ...))))))

(define-alias define-world-attribute (name attr) 
  (define-alias name (wrl) (hashtable/get wrl attr)))

(define weight hashtable/get)
(define weight! hashtable/put!)

(define-alias world-idx (x y)
  (+ -1 x (* (- y 1) world-width)))

(define-alias world-ref (x y)
  (string-ref world-map (world-idx x y)))

(define-alias world-set! (wrl x y v)
  (string-set! world-map (world-idx x y) v))

(define (do-nothing . args) (void))

(define (world-iterator proc-row
			proc-col-pre proc-col-post)
  (lambda (world)
    (do ((y world-height (- y 1)))
	((zero? y))
      (proc-col-pre y)
      (do ((x 1 (+ x 1)))
	  ((> x world-width))
	(proc-row x y))
      (proc-col-post y))))

    
(define (render-world id)
  ((world-iterator (lambda (x y)
		     (if (equal? (list x y) (robot-position id))
			 (display #\*)
			 (display (world-ref x y))))
		   do-nothing
		   (lambda (y) (newline))) world))

(define (water? x y)
  (eq? (world-ref x y) WATER))

(define (wall? x y)
  (eq? (world-ref x y) WALL))

(define (opponent? id x y)
  (let ((rob (reverse-robot-lookup x y)))
    (and rob (not (= rob id)))))

