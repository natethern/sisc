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
(should-be 856491 11
           (let ()
             (import serial-io)
             (define (foo x)
               (+ x (call/cc
                     (lambda (k)
                       (call-with-serial-output-file
                           "test.ser"
                         (lambda (port) (serialize k port)))
                       1))))
             (if (= (foo 10) 11)
                 ((call-with-serial-input-file
                      "test.ser"
                    deserialize)
                  12))))

