;;;
;;; You need to write a procedure named "run-benchmark" that takes
;;; two arguments.  The first is a string identifying the particular
;;; benchmark being run.  The second is a thunk, a procedure of no
;;; arguments, that will actually run the benchmark.
;;;

;(define get (lambda args ;(display (format "(get ~s)~%" args)) 
;                   (apply getprop args)))

(define (sub1 x) (- x 1))
(define (add1 x) (+ x 1))
(define 1- sub1)
(define 1+ add1)

(define-syntax get
  (lambda (x)
   (syntax-case x ()
    ((_ x y) 
     (syntax (getprop x y))))))

(define-syntax put
  (lambda (x)
   (syntax-case x ()
    ((_ x y z) 
     (syntax (putprop x y z))))))

;(define (put x y z)  
;       (display (format "(put ~s ~s ~s)~%" x y z))
;       (putprop x y z))

(define benchmark-results (if (getprop 'benchmark-results) 
                              benchmark-results
                              '()))

(define run-benchmark 
  (lambda (benchmark-name benchmark-thunk)
    (display benchmark-name) (display "...")
    (let ([benchresult (cons benchmark-name 
			     (call/fc (lambda ()
					(cdr (time (benchmark-thunk))))
				      (lambda (m e f)
					'failed)))])
      (set! benchmark-results (cons benchresult benchmark-results)))
    (newline)))


