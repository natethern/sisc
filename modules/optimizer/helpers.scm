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
      (apply union (cons (union-2 ls1 (car lses)) (cdr lses)))))

(define (atom? x)
  (and (not (pair? x))
       (not (vector? x))
       (not (box? x))))

(define (immediate? e)
  (and (pair? e) (= (length e) 2) (eq? (car e) 'quote)))

(define (not-redefined? proc)
  (memq proc (getprop 'assumptive-procedures '*opt*)))
