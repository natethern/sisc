;;; output.ss
;;; Robert Hieb & Kent Dybvig
;;; 92/06/18

; The output routines can be tailored to feed a specific system or compiler.
; They are set up here to generate the following subset of standard Scheme:

;  <expression> :== <application>
;                |  <variable>
;                |  (set! <variable> <expression>)
;                |  (define <variable> <expression>)
;                |  (lambda (<variable>*) <expression>)
;                |  (lambda <variable> <expression>)
;                |  (lambda (<variable>+ . <variable>) <expression>)
;                |  (letrec (<binding>+) <expression>)
;                |  (if <expression> <expression> <expression>)
;                |  (begin <expression> <expression>)
;                |  (quote <datum>)
; <application> :== (<expression>+)
;     <binding> :== (<variable> <expression>)
;    <variable> :== <symbol>

; Definitions are generated only at top level.

(define build-application
   (lambda (fun-exp arg-exps)
     (cons fun-exp arg-exps)))


(define build-conditional
  (lambda (test-exp then-exp else-exp)
    (list 'if test-exp then-exp else-exp)))


(define build-lexical-reference (lambda (var) var))

(define build-lexical-assignment
   (lambda (var exp)
     (list 'set! var exp)))

(define build-global-reference (lambda (var) var))

(define build-global-assignment
   (lambda (var exp)
     (list 'set! var exp)))

(define build-lambda
   (lambda (vars exp)
     (list 'lambda vars exp)))

(define build-improper-lambda
   (lambda (vars var exp)
     (list 'lambda (apply list* (append vars (list var))) exp)))

(define build-data
   (lambda (exp) 
     (list 'quote exp)))


(define build-identifier
   (lambda (id)
     (list 'quote id)))

(define build-sequence
   (lambda (exps)
      (if (null? (cdr exps))
          (car exps)
;	  (list 'begin (car exps) (build-sequence (cdr exps))))))
          (cons 'begin exps))))


(define make-false	
  (lambda (x) #f))

(define build-letrec
   (lambda (vars val-exps body-exp)
      (if (null? vars)
          body-exp
	  (cons (list 'lambda vars 
		      (append (cons 'begin (map build-global-assignment 
					vars val-exps)) (list body-exp)))
		  (map make-false vars)))))


(define build-global-definition
   (lambda (var val)
     (list 'define var val)))
