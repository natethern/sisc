;;SISC-specific regression tests

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

;;Used to corrupt the global environment
(should-be 812537 3
           (begin (putprop 'identity (lambda (x) x))
                    (with/fc (lambda (m e)
                               (void))
                      (lambda () 
                        (eval '(import foobarbaz) 
                               (scheme-report-environment 5))))
                   (with/fc (lambda (m e) 'failed)
                      (lambda () 
                        (eval '(identity 3))))))
                        
