(define-syntax should-be
  (syntax-rules ()
    ((_ test-id value expression)
     (let ((return-value expression))
         (if (not (equal? return-value value))
           (for-each (lambda (v) (display v))
                     `("Failure: " test-id ", expected '"
                     value "', got '" ,return-value "'." #\newline))
           (for-each (lambda (v) (display v))
                     '("Passed: " test-id #\newline)))))))

(define call/cc call-with-current-continuation)

;;Credits to Al Petrofsky
(should-be 1.1 0
 (let ((cont #f))
   (letrec ((x (call-with-current-continuation (lambda (c) (set! cont c) 0)))
            (y (call-with-current-continuation (lambda (c) (set! cont c) 0))))
     (if cont
         (let ((c cont))
           (set! cont #f)
           (set! x 1)
           (set! y 1)
           (c 0))
         (+ x y)))))

;;Credits to Al Petrofsky
(should-be 1.2 #t
  (letrec ((x (call/cc list)) (y (call/cc list)))
    (cond ((procedure? x) (x (pair? y)))
	  ((procedure? y) (y (pair? x))))
    (let ((x (car x)) (y (car y)))
      (and (call/cc x) (call/cc y) (call/cc x)))))

;;Credits to Alan Bawden
(should-be 1.3 #t
  (letrec ((x (call-with-current-continuation
		  (lambda (c)
		    (list #T c)))))
      (if (car x)
	  ((cadr x) (list #F (lambda () x)))
	  (eq? x ((cadr x))))))

;;Credits to ???, (and a wink to Matthias Blume)
(should-be 2.1 1
 (call/cc (lambda (c) (0 (c 1)))))

;;(Brian M. Moore)
(should-be 4.1 '(x)
 ((lambda lambda lambda) 'x))

(should-be 4.2 '(1 2 3)
 ((lambda (begin) (begin 1 2 3)) (lambda lambda lambda)))

;; Eli Barzilay 
(should-be 4.3 4
  (let-syntax ((foo
                (syntax-rules ()
                  ((foo expr) (+ expr 1)))))
    (let ((+ *))
      (foo 3))))

;; Al Petrofsky again
(should-be 5.1 2
 (let-syntax ((foo (syntax-rules ()
                       ((_ var) (define var 1)))))
     (let ((x 2))
       (begin (define foo +))
       (cond (else (foo x))) 
       x)))

;; Scott Miller
(should-be 6.1 #f
  (eq? #f '()))
(should-be 6.2 #f
  (eqv? #f '()))
(should-be 6.3 #f
  (equal? #f '()))

;; Jens Axel S?gaard
(should-be 7.1 #f
  (eq? (string->symbol "f") (string->symbol "F")))

;; Scott Miller
(define r #f)
(define a #f)
(define b #f)
(define c #f)
(define i 0)
(should-be 8.1 28
  (let () 
    (set! r (+ 1 (+ 2 (+ 3 (call/cc (lambda (k) (set! a k) 4))))
               (+ 5 (+ 6 (call/cc (lambda (k) (set! b k) 7))))))
    (if (not c) 
        (set! c a))
    (set! i (+ i 1))
    (case i
      ((1) (a 5))
      ((2) (b 8))
      ((3) (a 6))
      ((4) (c 4)))
    r))


;;Not really an error to fail this (Matthias Radestock)
;;If this returns (0 1 0), your map isn't call/cc safe, but is probably
;;tail-recursive.  If its (0 0 0), the opposite is true.
(should-be 'optional.1 '(0 0 0)
  (let ()
   (define executed-k #f)
   (define cont #f)
   (define res1 #f)
   (define res2 #f)
   (set! res1 (map (lambda (x)
                     (if (= x 0)
                         (call/cc (lambda (k) (set! cont k) 0))
                        0))
                   '(1 0 2)))
   (if (not executed-k)           
       (begin (set! executed-k #t) 
              (set! res2 res1)
              (cont 1)))
   res2))

