; Helper functions

(define (make-proper p)
  (cond [(null? p) '()]
        [(not (pair? p)) (list p)]
        [else (cons (car p) (make-proper (cdr p)))]))
        
      
(define (union-2 ls1 ls2)
  (cond [(null? ls1) ls2]
        [(memq (car ls1) ls2)
         (union-2 (cdr ls1) ls2)]
        [else (cons (car ls1) (union-2 (cdr ls1) ls2))]))

(define (union ls1 . lses)
  (if (null? lses) ls1
      (apply union (union-2 ls1 (car lses)) (cdr lses))))

(define (constant? e)
  (or (atom? e) 
      (and (pair? e) (= (length e) 2) (eq? (car e) #%quote))))

(define (immediate? e)
  (or (symbol? e)
      (constant? e)))

(define (not-redefined? proc)
  (and (memq proc (inline-primitives))
       (eq? (getprop proc) 
            (getprop proc (sisc-initial-environment)))))

(define-syntax core-form-eq? 
  (syntax-rules ()
    ((_ proc name syntoken)
     (or (eq? proc syntoken)
     	 (and (eq? proc name)
              (eq? (getprop proc (get-symbolic-environment '*sisc-specific*))
                   (getprop proc)))))))

