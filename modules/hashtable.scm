(define (hashtable/get! ht key . rest)
  (or (hashtable/get ht key)
      (and (not (null? rest))
           (let ([res ((car rest))])
             (hashtable/put! ht key res)
             res))))

;;The following are quite inefficient. To get around that we'd have
;;to expose java collection iterators.
(define (hashtable/for-each proc ht)
  (for-each (lambda (x) (proc (car x) (cdr x))) (hashtable->alist ht)))
(define (hashtable/map proc ht)
  (map (lambda (x) (proc (car x) (cdr x))) (hashtable->alist ht)))
