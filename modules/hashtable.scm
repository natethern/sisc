(define (hashtable/get! ht key thunk . rest)
  (let ([res (apply hashtable/get ht key rest)])
    (if (eqv? res (if (null? rest) #f (car rest)))
        (let ([res (thunk)])
          (hashtable/put! ht key res)
          res)
        res)))

;;The following are quite inefficient. To get around that we'd have
;;to expose java collection iterators.
(define (hashtable/for-each proc ht)
  (for-each (lambda (x) (proc (car x) (cdr x))) (hashtable->alist ht)))
(define (hashtable/map proc ht)
  (map (lambda (x) (proc (car x) (cdr x))) (hashtable->alist ht)))
