;; Datastructure support for the optimizer
(define-syntax new-state
  (syntax-rules ()
    ((_) '())))
     
(define (get-state-entry state key)
  (cond [(assq key state) => cdr]
        [else #f]))

(define (set-state-entry state key value)
  (cond [(null? state) (list (cons key value))]
        [(eq? (caar state) key) 
         (cons (cons key value) (cdr state))]
        [else (cons (car state) (set-state-entry (cdr state) key value))]))

(define (generic-modify-state-entry addproc)
  (lambda (state key value)
    (let ((entry (get-state-entry state key)))
      (set-state-entry state key
                       (if entry 
                           (addproc entry value)
                           (list value))))))

(define (generic-modify-state-entry* addproc)
  (lambda (state key value*)
    (let ((entry (get-state-entry state key)))
      (set-state-entry state key
                       (if entry 
                           (addproc entry value*)
                           value*)))))

(define union-state-entry*)
(define union-state-entry)

(define (distinct ls)
  (cond [(null? ls) '()]
        [(memq (car ls) (cdr ls))
         (distinct (cdr ls))]
        [else (cons (car ls) (distinct (cdr ls)))]))

(define (union-assoc . a*)
  (if (null? a*) 
      '()
      (let ((keys (distinct (map car (apply append a*)))))
        (let loop ((x keys))
          (if (null? x) 
              '()
              (cons (cons (car x)
                          (apply union (map (lambda (v)
                                              (cond [(assoc (car x) v) => cdr]
                                                    [else '()]))
                                            a*)))
                    (loop (cdr x))))))))

(define merge-states)

(define (initialize)
  (set! union-state-entry*
    (generic-modify-state-entry*
    (lambda (entry value*)
       (union value* entry))))
  (set! union-state-entry
    (generic-modify-state-entry 
     (lambda (entry value)
       (if (not (memq value entry))
           (cons value entry)
           entry))))
  (set! merge-states union-assoc))
