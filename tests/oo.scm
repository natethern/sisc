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

(baz '(c) bar)
(bar '(z) foo)
(baz '(c z x) 2) ;=> 1
(baz '(c z x)) ;=> 2
(foo 'x) ;=> 2

;;performance test

(define-class (<a>))
(define-class (<b>))
(define-class (<c> <a> <b>))
(define-class (<d> <b> <a>))

(define-generic m)
(define-method (m (<a> x) (<a> y)) 'aa)
(define-method (m (<a> x) (<b> y)) 'ab)
(define-method (m (<a> x) (<c> y)) 'ac)
(define-method (m (<a> x) (<d> y)) 'ad)
(define-method (m (<b> x) (<a> y)) 'ba)
(define-method (m (<b> x) (<b> y)) 'bb)
(define-method (m (<b> x) (<c> y)) 'bc)
(define-method (m (<b> x) (<d> y)) 'bd)
(define-method (m (<c> x) (<a> y)) 'ca)
(define-method (m (<c> x) (<b> y)) 'cb)
(define-method (m (<c> x) (<c> y)) 'cc)
(define-method (m (<c> x) (<d> y)) 'cd)
(define-method (m (<d> x) (<a> y)) 'da)
(define-method (m (<d> x) (<b> y)) 'db)
(define-method (m (<d> x) (<c> y)) 'dc)
(define-method (m (<d> x) (<d> y)) 'dd)
(define-method (m . rest) 'rr)

(define a (make <a>))
(define b (make <b>))
(define c (make <c>))
(define d (make <d>))

(time
 100
 (cons (m a b c d)
       (map m
            (list a a a a b b b b c c c c d d d d)
            (list a b c d a b c d a b c d a b c d))))
