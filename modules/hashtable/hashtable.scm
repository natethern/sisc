(define (make-hashtable . rest)
  (cond ((null? rest) (make-eq-hashtable))
        ((eq? (car rest) eq?) (make-eq-hashtable))
        ((eq? (car rest) equal?) (make-equal-hashtable))
        (else (error "hashtables only work with eq? and equal?"))))

(define (alist->hashtable alist . rest)
  (cond ((null? rest) (alist->eq-hashtable alist))
        ((eq? (car rest) eq?) (alist->eq-hashtable alist))
        ((eq? (car rest) equal?) (alist->equal-hashtable alist))
        (else (error "hashtables only work with eq? and equal?"))))

(define (hashtable/get! ht key thunk . rest)
  ((if (or (null? rest) (car rest)) synchronized synchronized-unsafe)
   ht
   (lambda ()
     (let* ([def (list #f)]
            [res (hashtable/get ht key def)])
       (if (eqv? res def)
           (let ([res (thunk)])
             (hashtable/put! ht key res)
             res)
           res)))))

;;The following are quite inefficient. To get around that we'd have
;;to expose java collection iterators.
(define (hashtable/for-each proc ht)
  (for-each (lambda (x) (proc (car x) (cdr x))) (hashtable->alist ht)))
(define (hashtable/map proc ht)
  (map (lambda (x) (proc (car x) (cdr x))) (hashtable->alist ht)))
