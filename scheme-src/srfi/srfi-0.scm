; SRFI-0 and SRFI-5

(if (not (getprop '*features* '*toplevel*))
    (putprop '*features* '*toplevel* ()))
    
(define (add-feature feature)
  (if (not (memq feature *features*))
      (begin 
	(set! *features* 
	      (cons feature *features*))
	(reload-srfi-0))))

(define (reload-srfi-0)
  (let ([ce
   `(define-syntax cond-expand
      (syntax-rules (and or not else ,@*features*)
	((cond-expand) (syntax-error "Unfulfilled cond-expand"))
	((cond-expand (else body ...))
	 (begin body ...))
	((cond-expand ((and) body ...) more-clauses ...)
	 (begin body ...))
	((cond-expand ((and req1 req2 ...) body ...) more-clauses ...)
	 (cond-expand
	  (req1
	   (cond-expand
	    ((and req2 ...) body ...)
	    more-clauses ...))
	  more-clauses ...))
	((cond-expand ((or) body ...) more-clauses ...)
	 (cond-expand more-clauses ...))
	((cond-expand ((or req1 req2 ...) body ...) more-clauses ...)
	 (cond-expand
	  (req1
	   (begin body ...))
	  (else
	   (cond-expand
	    ((or req2 ...) body ...)
	    more-clauses ...))))
	((cond-expand ((not req) body ...) more-clauses ...)
	 (cond-expand
	  (req
	   (cond-expand more-clauses ...))
	  (else body ...)))
	,@(map (lambda (feature)
		 `((cond-expand (,feature body ...) more-clauses ...)
		   (begin body ...)))
	       *features*)
	((cond-expand (feature-id body ...) more-clauses ...)
	 (cond-expand more-clauses ...))))])
    (eval ce)))

(add-feature 'srfi-0)
(add-feature 'srfi-6)
