;;SISC-specific regression tests

(define-syntax should-be
  (syntax-rules ()
    ((_ test-id value expression)
     (with/fc (lambda (m e)
                (display (format "Failed: ~a, expected '~a', got exception ~a\n"
                                 test-id value (error-message m))))
       (lambda ()
         (let ([return-value expression])
           (if (not (equal? return-value value))
               (display (format "Failed: ~a, expected '~a', got '~a'\n"
                                test-id value return-value))
               (display (format "Passed: ~a\n" test-id)))))))))

;;used to cause an NPE
(should-be 807474 #f
           (let ((k #f))
             (dynamic-wind
              void 
              (lambda () (call/cc (lambda (x) (set! k x))) (list))
              void)
             (and k (let ((kk k)) (set! k #f) (kk)))))

;;Used to be an infinite loop
(should-be 812557 'okay (dynamic-wind void (lambda () 'okay) void))

;;Used to corrupt the global environment, resulting in identity being undefined.
(should-be 812537 3
           (begin (putprop 'identity (lambda (x) x))
                  (with/fc (lambda (m e) (void))
                    (lambda () 
                      (eval '(import foobarbaz) 
                            (scheme-report-environment 5))))
                  (eval '(identity 3))))

;; (Partially fixed) References to helper functions from macros in report-env
;; will generate code incapable of resolving the helper                        
(define test-env (scheme-report-environment 5))
(should-be 818786 '(3 okay #t)
           (let ([test-env (scheme-report-environment 5)])
             (eval '(define-syntax foo 
                      (syntax-rules ()
                        ((_ x)
                         (car x))
                        ((_ x y)
                         (car y)))) test-env)
             (list
              (with/fc (lambda (m e) 'error)
                       (lambda () (eval '(force (delay 3)) test-env)))
              (eval '(foo a '(okay)) test-env)
              (with/fc (lambda (m e) (equal? (error-message m)
                                             "invalid syntax (foo a b c)"))
                       (lambda () (eval '(foo a b c) test-env))))))
                            
;; Used to cause an out of memory error (Interrupts must be enabled to pass)
(should-be 820401 'okay
           (let ()
             (import threading)
             (let loop ([x 200])
               (if (zero? x)
                   'okay
                   (let ([t (thread/new (lambda () (force (let loop () 
                                                           (delay (force (loop)))))))])
                     (thread/start t)
                     (sleep 100)
                     (thread/interrupt t)
                     (loop (- x 1)))))))

;; Used to trigger any number of serialization bugs related to ports when
;; run from the repl
(should-be 856491 22
           (let ()
             (import serial-io)
             (define (foo x)
               (+ x (call/cc
                     (lambda (k)
                       (call-with-serial-output-file
                           "test.ser"
                         (lambda (port) (serialize k port)))
                       1))))
             (let ([rv (foo 10)])
               (if (= rv 11)
                   ((call-with-serial-input-file
                     "test.ser"
                     deserialize)
                    12)
                   rv))))

;;Used to cause an error trying to resolve CharSequence
(should-be 830507 'ok
           (let ()
             (import s2j)
             ((generic-java-method '|matcher|)
              ((generic-java-method '|compile|)
               (java-null (java-class '|java.util.regex.Pattern|))
               (->jstring "([0-9])"))
              (->jstring "a3b"))
             'ok))

;;Used to cause a stack overflow error
(should-be 864792 2000
           (let ([x (iota 2000)])
             (import serial-io)
             (call-with-serial-output-file "test.ser"
               (lambda (out)
                 (serialize x out)))
             (length (call-with-serial-input-file "test.ser"
                       (lambda (in)
                         (deserialize in))))))

;; Used to cause an error (couldn't serialize)
(should-be 870468 "Hello, World!"
           (let ()
             (import serial-io)
             (import s2j)
             (let ([x (->jstring "Hello, World!")])
               (call-with-serial-output-file "test.ser"
                 (lambda (out) (serialize x out)))
               (->string (call-with-serial-input-file "test.ser"
                          (lambda (in) (deserialize in)))))))

;;Used to be true
(should-be 870845 #f (char>? #\c #\a #\b))

;;Used to return (1 2)
(should-be 878707 '(2 2)
           (let ([entrances 0]
                 [exits 0])
             (with/fc
              (lambda (a b) (b 5))
              (lambda () (dynamic-wind
                             (lambda () (set! entrances (+ entrances 1)))
                             (lambda () (/ 1 0))
                             (lambda () (set! exits (+ exits 1))))))
             (list entrances exits)))

;Used to cause an undefined variable error
(should-be 886733 4
           (let ([x (car '(2))])
             (letrec ([y x]
                      [g (lambda (i)
                           (+ y x))])
               (g y))))

(should-be 937722 #t
           (andmap (lambda (p)
                     (with/fc (lambda (m e) #t)
                              (lambda () (p '()) (p '(a)) #f)))
                   (list caar cadr cdar cddr)))

;;interfaces and classes that inherit from Object must have Object
;;last in their declared-superclasses list
(should-be 953043 '(#t #t #t)
           (let ()
             (import s2j)
             (define-java-classes
               <java.lang.object>
               <java.io.file>
               <java.io.serializable>
               (<int*> |int[]|))
             (map (lambda (c)
                    (eqv? (car
                           (reverse
                            (java-class-declared-superclasses c)))
                          <java.lang.object>))
                  (list <java.io.file>
                        <java.io.serializable>
                        <int*>))))

;; equal? was insensitive to exactness of numbers
(should-be 987271 #f (equal? 3 3.0))

;; Should cause an error
(should-be 994759 #f
  (with/fc (lambda (m e) #f)
           (lambda () (and (set-cdr! `(3) 3) #t))))
