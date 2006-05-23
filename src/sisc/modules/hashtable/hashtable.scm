(define *VOID-MARKER* (list #f))

(define *HASH-PROCS* `((,eq?         . ,hash-by-eq)
                       (,eqv?        . ,hash-by-eqv)
                       (,equal?      . ,hash-by-equal)
                       (,string=?    . ,hash-by-string=)
                       (,string-ci=? . ,hash-by-string-ci=)))

;;(make-hashtable [eq-proc [hash-proc]] [safe? [weak?]])
(define (make-hashtable . rest)
  (define (process-opt-args)
    (let ([eq-proc equal?]
          [hash-proc hash-by-equal]
          [safe? #t]
          [weak? #f])
      (if (not (null? rest))
          (begin
            (if (procedure? (car rest))
                (begin (set! eq-proc (car rest))
                       (set! hash-proc
                         (cond [(assq eq-proc *HASH-PROCS*) => cdr]
                               [else hash-by-equal]))
                       (set! rest (cdr rest))))
            (if (not (null? rest))
                (begin
                  (if (procedure? (car rest))
                      (begin (set! hash-proc (car rest))
                             (set! rest (cdr rest))))
                  (if (not (null? rest))
                      (begin
                        (set! safe? (car rest))
                        (set! rest (cdr rest))
                        (if (not (null? rest))
                            (begin
                              (set! weak? (car rest))
                              (set! rest (cdr rest))
                              (if (not (null? rest))
                                  (error 'make-hashtable
                                         "expected 0-4 args"))))))))))
      (values eq-proc hash-proc safe? weak?)))
  (call-with-values process-opt-args hashtable/make))

(define (alist->hashtable alist . rest)
  (hashtable/add-alist! (apply make-hashtable rest) alist))

(define (hashtable/get! ht key thunk . rest)
  (define (helper)
    (let* ([def (list #f)]
           [res (hashtable/get ht key def)])
      (if (eq? res def)
          (let ([res (thunk)])
            (hashtable/put! ht key res)
            res)
          res)))
  (if (hashtable/thread-safe? ht)
      ((if (or (null? rest) (car rest))
           synchronized
           synchronized-unsafe)
       ht
       helper)
      (helper)))

(define (hashtable/contains? ht key)
  (not (eq? (hashtable/get ht key *VOID-MARKER*) *VOID-MARKER*)))

;;The following are quite inefficient. To get around that we'd have
;;to expose java collection iterators.
(define (hashtable/for-each proc ht)
  (for-each (lambda (x) (proc (car x) (cdr x))) (hashtable->alist ht)))
(define (hashtable/map proc ht)
  (map (lambda (x) (proc (car x) (cdr x))) (hashtable->alist ht)))


(define <hashtable> (make-type '|sisc.modules.hashtable.HashtableBase|))
