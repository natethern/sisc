;;; compat.ss
;;; Robert Hieb & Kent Dybvig
;;; 92/06/18

;;; This file contains nonstandard help procedures.
;;; They are all present in Chez Scheme, but are easily defined
;;; in any standard Scheme system.
;;; These versions do no error checking.

; In Chez Scheme "(void)" returns an object that is ignored by the
; REP loop.  It is returned whenever a "nonspecified" value is specified
; by the standard.  The following should pick up an appropriate value.

;(define void
;   (let ((void-object (if #f #f)))
;      (lambda () void-object)))

; "andmap" is like "map" except instead of "consing" the results it
; "ands" them, quitting early if #f" is obtained.
; The following does no error checking.

(define andmap
   (lambda (f first . rest)
     (if (null? rest)
	 ((lambda (mapf)
	    (begin 
	      (set! mapf (lambda (l)
			   (if (null? l) #t
			       (if (f (car l)) (mapf (cdr l)) #f))))
	      (mapf first))) #f)
	 (if (null? (cdr rest))
	     ((lambda (mapf)
		(begin 
		  (set! mapf (lambda (l1 l2)
			       (if (null? l1) #t
				   (if (f (car l1) (car l2)) 
				       (mapf (cdr l1) (cdr l2)) #f))))
		  (mapf first (car rest)))) #f)
	     ((lambda (mapf)
		(begin
		  (set! mapf (lambda (first rest)
			       (if (null? first) #t
				   (if (apply f (car first) (map car rest))
				       (mapf (cdr first) (map cdr rest)) #f))))
		  (mapf first rest))) #f)))))

(define gen-sym
  ((lambda (symcounter)
     (lambda (base) 
       (set! symcounter (+ symcounter 1))
       (string->symbol (format "~s_~s" base symcounter))))
   0))
  
(define gensym
  (lambda ()
    (gen-sym '%)))

(define list*
  (lambda args
    (if (null? args) '()
        (if (null? (cdr args)) 
	    (car args)
	    (cons (car args) (apply list* (cdr args)))))))

(define top-level-bound?
  (lambda (x)
    (getprop 'x '*toplevel*)))

(define ormap
  (lambda (proc list1)
    (if (not (null? list1))
      ((lambda (t) (if t t (ormap proc (cdr list1))))
       (proc (car list1)))
      '#f)))
 
(define remprop
  (lambda (symbol key)
    (putprop symbol key #f)))

(define sc-expand (lambda (x) x))

(define $old-eval (current-evaluator))

(define eval 
  ((lambda (old-eval)
     (lambda (x)	
       (if (if (pair? x) (eq? (car x) "noexpand") #f)
  	   (old-eval (cadr x)) 
           ((lambda (e) 
	      (begin 
;		(display e)
;		(newline)
		(old-eval e)))
	    (sc-expand x))
           (old-eval (sc-expand x)))))
   (current-evaluator)))


  