;; Datastructure support for the optimizer
(define-syntax new-state
  (syntax-rules ()
    ((_) (vector '() '() '() '()))))
(define make-state vector)

(define cpc 0)
(define freev 1)
(define refv 2)
(define setv 3)

(define state-get vector-ref)
(define state-set! vector-set!)
(define (state-clone state)
  (let ([ns (new-state)])
    (for-each (lambda (i) (state-set! ns i (state-get state i)))
              '(0 1 2 3))
    ns))
(define (state-union-ls state type val)
  (state-set! state type (union val (state-get state type)))
  state)

(define varcount-clear-all!
  (lambda (state type vars)
    (let ([sls (state-get state type)])
      (let loop ([v vars])
        (cond [(null? v) state]
              [(assq (car v) sls) =>
               (lambda (ve)
                 (set-cdr! ve 0)
                 (loop (cdr v)))]
              [else (loop (cdr v))])))))

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

(define (varcount-incr! state type var)
  (let ([v (assq var (state-get state type))])
    (and v (set-cdr! v (+ (cdr v) 1)))))

(define (list-copy ls) (apply list ls))


