;; Datastructure support for the optimizer
(define-syntax new-state
  (syntax-rules ()
    ((_) (vector '() '() '() '() '()))))
(define make-state vector)

(define cpc 0)
(define lexv 1)
(define freev 2)
(define refv 3)
(define setv 4)

(define state-get vector-ref)
(define state-set! vector-set!)
(define (state-clone state)
  (let ([ns (new-state)])
    (for-each (lambda (i) (state-set! ns i (state-get state i)))
              '(0 1 2 3 4))
    ns))
(define (state-replace state type val)
  (state-set! (state-clone state) type val))
(define (state-union-ls state type val)
  (let ([cloned (state-clone state)])
    (state-set! cloned type (union val (state-get state type)))
    cloned))
(define (state-union-varlist state type val)
  (let ([cloned (state-clone state)])
    (state-set! cloned type (merge-varlist val (state-get state type)))
    cloned))

(define (reference-count var ls)
  (cond [(assq var ls) => cdr]
        [else 0]))

(define (trim ls)
  (cond [(null? ls) '()]
        [(zero? (cdar ls))
         (trim (cdr ls))]
        [else (cons (car ls) (trim (cdr ls)))]))

(define (varcount-decr! state type var)
  (let ([v (assq var (state-get state type))])
    (and v (set-cdr! v (- (cdr v) 1)))))

(define (list-copy ls) (apply list ls))

(define (merge-varlist v1 v2)
  (let loop ([ls v1] [acc (list-copy v2)])
    (cond [(null? ls) acc]
          [(assq (caar ls) acc) =>
           (lambda (p)
             (set-cdr! p (+ (cdr p) (cdar ls)))
             (loop (cdr ls) acc))]
          [else (loop (cdr v1) (cons (car v1) acc))])))

(define (distinct ls)
  (cond [(null? ls) '()]
        [(memq (car ls) (cdr ls))
         (distinct (cdr ls))]
        [else (cons (car ls) (distinct (cdr ls)))]))
