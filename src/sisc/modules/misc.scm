;; Miscellaneous useful pieces of code that are not big enough
;; for justifying a separate module

;; create a new symbol by pre and postfixing an existing symbol. Use
;; like this:
;; (define-syntax wrap
;;   (lambda (x)
;;     (syntax-case x ()
;;       ((_ name)
;;        (with-syntax ([nname (wrap-symbol "<" (syntax name) ">")])
;;          (syntax nname))))))
;; (define <foo> 1)
;; (wrap foo) ;=> 1
(define (wrap-symbol pre symb app)
  (datum->syntax-object
   symb
   (string->symbol
    (string-append pre
                   (symbol->string
                    (syntax-object->datum symb))
                   app))))

;; Al Petrofsky's dynamic-freeze.
;; dynamic-freeze returns a procedure whose body is always evaluated
;; in the dynamic context of the procedure's creation, rather than
;; that of its application. I.e., when it is applied, it restores the
;; dynamic context of the call to dynamic-freeze and passes its
;; arguments to proc. The dynamic context of the call to the frozen
;; procedure is then restored and the result(s) of the call to proc
;; are returned.
(define (dynamic-freeze proc)
  ((call-with-current-continuation
       (lambda (freeze-k)
         (lambda ()
           (lambda args
             (call-with-current-continuation
                 (lambda (call-k)
                   (freeze-k
                    (lambda ()
                      (call-with-values (lambda () (apply proc args))
                        call-k)))))))))))

;; Nice macro to make the other macros look like simple function defines.
;; e.g.
;; (define-simple-syntax (when condition body ...)
;;   (if condition
;;       (begin body ...)))
(define-syntax define-simple-syntax
  (syntax-rules ()
    ((_ (name . args) body ...)
     (define-syntax name
       (syntax-rules ()
         ((name . args)
          body ...))))))

;; This computes a total order from a set of partial orders, e.g.
;; (total-order '((a d) (b c) (c d))) ;=> '(a b c d)
;; #f is returned if no such total order exists
(define (any pred l)
  (and (pair? l) (or (pred (car l)) (any pred (cdr l)))))
(define (filter pred l)
  (if (pair? l)
      (if (pred (car l))
          (cons (car l) (filter pred (cdr l)))
          (filter pred (cdr l)))
      l))
(define (remove pred l) (filter (lambda (x) (not (pred x))) l))
(define (total-order partial-orders)
  (define (merge result remaining)
    (define (find-next l)
      (let ([c (car l)])
        (and (not (any (lambda (l) (memv c (cdr l))) remaining))
             c)))
    (set! remaining (remove null? remaining))
    (if (null? remaining)
        (reverse result)
        (let ([next (any find-next remaining)])
          (and next
               (merge (cons next result)
                      (map (lambda (l)
                             (if (eqv? (car l) next) (cdr l) l))
                           remaining))))))
  (merge '() partial-orders))
