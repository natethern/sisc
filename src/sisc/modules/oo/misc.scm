(define <object>)

(define-generic initialize)

(define (initialize-classes)
  (set! <object> (make-class-helper '<object> 'sisc.oo.object-type '() '()))
  (add-method initialize (method ((<object> _)) (void))))

(define (make class . args)
  (let ([obj ((class-constructor class))])
    (apply initialize obj args)
    obj))

;;we don't need a type-of-hook because objects are records and hence
;;the existing record hook is sufficient

(define (oo-type<=-hook next x y)
  (cond [(class? x)
         (if (class? y)
             (if (memq y (class-precedence-list x)) #t #f)
             (type<= <value> y))]
        [(class? y) #f]
        [else (next x y)]))

(define (oo-compare-types-hook next x y c)
  (if (or (class? x) (class? y) (class? c))
      (if (and (class? x) (class? y) (class? c))
          ;;find first occurrence of x or y in c's cpl
          (let loop ([cpl (class-precedence-list c)])
            (if (null? cpl)
                (error 'compare-types
                       (string-append
                        "~a and ~a do not appear in the "
                        "class precedence list of ~a")
                       (class-name x)
                       (class-name y)
                       (class-name c))
                (let ([p (car cpl)])
                  (cond [(eq? p x) 'more-specific]
                        [(eq? p y) 'less-specific]
                        [else (loop (cdr cpl))]))))
          (error 'compare-types
                 "~s or ~s is not a sub-type of ~s"
                 x y c))
      (next x y c)))
