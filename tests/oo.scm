(import generic-procedures)
(define-class (<foo>) (x #f) (y 1))
(define-class (<bar>) (y 2)  (z #f))
(define-class (<baz> <foo> <bar>) (a 1) (b 2) (c #f))
(type<= <baz> <foo>) ;=> #t
(type<= <baz> <bar>) ;=> #t
(type<= <foo> <bar>) ;=> #f

(define-method (initialize (<foo> o) (<top> v))
  (o 'x v))
(define-method (initialize (<bar> o) (<top> v))
  (o 'z v))
(define-method (initialize (<baz> o) (<top> v))
  (o 'c v))

(define foo (make <foo> 1))
(define bar (make <bar> 2))
(define baz (make <baz> 3))
(map foo '(x y)) ;=> (1 1)
(map bar '(y z)) ;=> (2 2)
(map baz '(x y z a b c)) ;=> (#f 1 #f 1 2 3)

