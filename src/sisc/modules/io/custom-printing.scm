(import type-system)

(define (new-custom-printer-map proc-name old type proc)
  (if (not (procedure? proc))
      (error proc-name "expected procedure, got '~s'." proc))
  (let loop ([ls old])
    (cond [(null? ls) (list (cons type proc))]
          [(null? (cdr ls))
           (cons (car ls) (loop (cdr ls)))]
          [(equal? (caar ls) type)
           (cons (cons type proc)
                 (cdr ls))]
          [else (loop (cdr ls))])))

(define (add-custom-display-for-type! type proc)
  (custom-display-type-map
   (new-custom-printer-map 'add-custom-display-for-type!
                           (custom-display-type-map) type proc)))

(define (add-custom-write-for-type! type proc)
  (custom-write-type-map
   (new-custom-printer-map 'add-custom-write-for-type!
                           (custom-write-type-map) type proc)))

(define (with-custom-write-for-type type proc thunk)
  (parameterize ((custom-write-type-map
                  (new-custom-printer-map 'with-custom-write-for-type
                                          (custom-write-type-map) type proc)))
    (thunk)))

(define (with-custom-display-for-type type proc thunk)
  (parameterize ((custom-display-type-map
                  (new-custom-printer-map 'with-custom-display-for-type
                                          (custom-display-type-map) type proc)))
    (thunk)))
      