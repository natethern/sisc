(define-syntax self-evaluating?
  (syntax-rules ()
    ((_ e)
     (let ((x e))
       (not (or (pair? x) (vector? x) (and (null? x)
                                           (strict-r5rs-compliance))))))))
(define (opt:optimize e)
  (opt e (new-state)))

(define opt
  (lambda (e state)
    (match e
      (,x
       (guard (symbol? x))
       (opt:ref x state))
      (,x
       (guard (constant? x))
       x)
      ((#%quote ,x) 
       `(#%quote ,x))
      ((,?program ,refv ,setv ,freev ,expr)
       (guard (core-form-eq? ?program 'program #%program))
       (let ([rv (opt expr (make-state (state-get state cpc)
                                       (state-get state lexv)
                                       freev refv setv))])
         `(#%program ,(trim refv) ,(trim setv) ,freev ,rv)))
      ((,?begin ,[exp1] ,[exps*] ...)
       (guard (core-form-eq? ?begin 'begin #%begin))
       (opt:begin exp1 exps* state))
      ((,?if ,[test] ,[conseq] ,[altern])
       (guard (core-form-eq? ?if 'if #%if))
       (opt:if ?if test conseq altern state))
      ;; Lets
      (((,?lambda #t ,formals ,lexv 
                  ,body) ,[values*] ...)
       (guard (and (core-form-eq? ?lambda 'lambda #%lambda)                    
                   (list? formals)))
       (if (= (length formals) (length values*))
           (opt:let ?lambda formals lexv values* body state)
           `(,(opt:lambda ?lambda formals lexv body state)
             ,@values*)))
      ((,?lambda #t ,formals ,lexicals ,body)
       (guard (core-form-eq? ?lambda 'lambda #%lambda))
       (opt:lambda ?lambda formals lexicals body state))
      ((,?letrec #t ((,lhs* ,[rhs*]) ...) ,lexv ,body)
       (guard (core-form-eq? ?letrec 'letrec #%letrec))
       (opt:letrec ?letrec lhs* rhs* lexv body state))
      ((,?define ,lhs ,[rhs])
       (guard (core-form-eq? ?define 'define #%define))
       `(,?define ,lhs ,rhs))
      ((,?set! ,formal ,[value])
       (guard (core-form-eq? ?set! 'set! #%set!))
       (opt:set! ?set! formal value state))
      ((,?annotate ,[expr] ,annotation)
       (guard (core-form-eq? ?annotate 'annotate #%annotate))
       `(,?annotate ,expr ,annotation))
      ((,[rator] ,[rands*] ...)
       (opt:application rator rands* state))
      (,other (error 'optimizer "Unrecognized s-expression: ~a" other)))))
      
(define (inline-usual-primitives)
  (inline-primitives 
    '(* + - / < <= = > >= abs acos angle asin assoc assq assv atan boolean?
      car cdr caar cadr cdar cddr ceiling char-alphabetic? char-ci<=? 
      char-ci<? char-ci=? char-ci>=? char-ci>? char-lower-case? 
      char-numeric? char-ready? char-upcase char-upper-case? char-whitespace? 
      char<=? char<? char=? char>=? char>? char? complex? cos denominator 
      eof-object? eq? equal? eqv? even? exact? exp expt floor gcd imag-part
	  inexact? input-port? integer?	lcm length list-ref list? log magnitude
	  max member memq memv min modulo negative? not null? number? numerator 
	  odd? output-port? pair? positive? procedure? quotient rational? real-part 
	  real? remainder round sin sqrt string-ci<=? string-ci<? string-ci=?
	  string-ci>=? string-ci>? string-length string<=? string<? string=? 
	  string>=? string>? string? symbol? tan truncate vector-length vector? 
	  zero?)))