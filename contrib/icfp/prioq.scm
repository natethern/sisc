(define (pq-create) (cons 'priority-queue '()))
(define (pq-add! pq item value)
  (set-cdr! pq (pq-add-h (cdr pq) item value)))
(define (pq-add-h pq item value)
  (cond [(null? pq) (list (cons value item))]
	[(> (caar pq) value)
	 (cons (car pq) (pq-add-h (cdr pq) item value))]
	[else (cons (cons value item) pq)]))
(define (pq-remove-max! pq)
  (let ((v (cdadr pq)))
    (set-cdr! pq (cddr pq))
    v))
(define (pq-delete! pq item)
  (set-cdr! pq (pq-delete-h! (cdr pq) item)))
(define (pq-delete-h! pq item)
;  (unless (null? pq)
;    (display (cdadar pq)) (newline))
  (cond [(null? pq) '()]
	[(equal? (cdadar pq) (cdar item))
	 (cdr pq)]
	[else (cons (car pq) (pq-delete-h! (cdr pq) item))]))
(define (pq-empty? pq)
  (null? (cdr pq)))