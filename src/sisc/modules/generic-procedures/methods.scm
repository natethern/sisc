;;a method is a procedure. It has an arity and a signature (a list of
;;parameter types) and flag indicating whether it can take rest
;;parameters
(define-record-type <method> (_make-method procedure
                                           arity
                                           types
                                           rest?)
  method?
  (procedure    method-procedure        set-method-procedure!)
  (arity        method-arity            set-method-arity!)
  (types        method-types            set-method-types!)
  (rest?        method-rest?            set-method-rest!))

(define (make-method f types rest?)
  (_make-method f (length types) types rest?))

(define (method= m1 m2)
  (and (= (method-arity m1) (method-arity m2))
       (eq? (method-rest? m1) (method-rest? m2))
       (types= (method-types m1) (method-types m2))))

;;Checks whether a method can be called with arguments of specific
;;types.
(define (method-applicable? m otypes)
  (let ([l (length otypes)]
        [a (method-arity m)])
    (and (or (= a l) (and (< a l) (method-rest? m)))
         (types<= otypes (method-types m)))))

;;compares two methods m1, m2, taking into account the cpls of otypes
;;NB: we assume that both methods are applicable, i.e. otypes matches
;;both their signature.
(define (compare-methods m1 m2 otypes)
  (let loop ([m1-t (method-types m1)]
             [m2-t (method-types m2)]
             [o-t  otypes]
             [res 'equal])
    (cond [(and (null? m1-t) (null? m2-t))
           res]
          [(null? m1-t) 'less-specific]
          [(null? m2-t) 'more-specific]
          [else
            (let ([m1-tn (cdr m1-t)]
                  [m2-tn (cdr m2-t)]
                  [o-tn  (cdr o-t)])
              (case (compare-types (car m1-t) (car m2-t) (car o-t))
                [(equal) (loop m1-tn m2-tn o-tn res)]
                [(ambiguous) (loop m1-tn m2-tn o-tn 'ambiguous)]
                [(more-specific) 'more-specific]
                [(less-specific) 'less-specific]))])))

(define-syntax method
  (syntax-rules (next:)
    [(_ ((next: ?next) (?type ?arg) ...) . ?body)
     (make-method (lambda (?next ?arg ...) . ?body)
                  (list ?type ...)
                  #f)]
    [(_ ((next: ?next) (?type ?arg) ... . ?rest) . ?body)
     (make-method (lambda (?next ?arg ... . ?rest) . ?body)
                  (list ?type ...)
                  #t)]
    [(_ ((next: ?next) . ?rest) . ?body)
     (error "parameters must be typed")]
    [(_ ?rest . ?body)
     (method ((next: dummy) . ?rest) . ?body)]))
