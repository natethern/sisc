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
(should-be 818786.0 3 (eval '(force (delay 3)) (scheme-report-environment 5)))
(define test-env (scheme-report-environment 5))
(should-be 818786.1 '#t
           (with/fc (lambda (m e) 'error)
             (lambda ()
               (eval '(procedure? (delay 'okay)) (scheme-report-environment 5)))))
(should-be 818786.2 'okay
           (begin (eval '(define-syntax foo 
                           (syntax-rules ()
                             ((_ x)
                              (car x))
                             ((_ x y)
                              (car y)))) test-env)
                  (eval '(foo 'a '(okay)) test-env)))
(should-be 818786.3 '"invalid syntax (foo a b c)"
           (begin (eval '(define-syntax foo 
                           (syntax-rules ()
                             ((_ x)
                              (car x)))) test-env)
                  (with/fc (lambda (m e) (error-message m))
                   (lambda () (eval '(foo a b c) test-env)))))
                            
;; Used to cause an out of memory error (Interrupts must be enabled to pass)
(should-be 820401 'okay
           (let ()
             (import threading)
             (let loop ([x 20])
               (if (zero? x)
                   'okay
                   (let ([t (thread/new (lambda () (force (let loop () 
                                                           (delay (force (loop)))))))])
                     (thread/start t)
                     (sleep 1000)
                     (thread/interrupt t)
                     (loop (- x 1)))))))
