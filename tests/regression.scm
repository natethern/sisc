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
