; Various Scheme evaluating/printing plugins
(import threading)

(define (pprint channel message ignore term)
  (with-input-from-string term
    (lambda ()
      (let loop ([x (read)] [l #f])
        (if (eof-object? x)
            (and l (safe-pp-to-string l))
            (loop (read) x))))))

(define (expand channel message ignore expr)
  (with-input-from-string expr
    (lambda ()
      (safe-pp-to-string (sc-expand (read-code) '(e) '(e))))))

(define (stateless-eval channel message ignore term)
  (with/fc (lambda (m e)
             (error-message m))
    (lambda ()
      (let* ([expr 'didnt-read]
             [expr-text 
              (with-output-to-string 
                (lambda ()
                  (set! expr (with-input-from-string term read-code))))])
        (cond [(eq? expr 'didnt-read) expr-text]
              [(void? expr) "{No expression.  Were the parenthesis closed properly?}"]
              [else
               (strict-r5rs-compliance #t)
               (let ([env (scheme-report-environment 5)])
                 (for-each (lambda (k v) (putprop k env v))
                           '(call/cc $sc-put-cte fold error)
                           (list call/cc $sc-put-cte fold error))
                 (eval-within-n-ms expr 5000 env))])))))

(define (safe-pp-to-string value)
  (if (circular? value)
      (with-output-to-string (lambda () (write value)))
      (pretty-print-to-string value)))

(define (eval-within-n-ms datum ms env)
  (let* ([os (open-output-string)]
         [evaluation-thread
          (thread/new 
           (lambda ()
             (with-output-to-port os
               (lambda () (eval datum env)))))]
         [watchdog-thread
          (thread/new
           (lambda ()
             (thread/join evaluation-thread ms)
             (with-output-to-port os
               (lambda () 
                 (with-failure-continuation
                  (lambda (m e)
                    ; An error?  Egads!
                    (if (eqv? (thread/state evaluation-thread) 'running)
                        (begin 
                          (thread/interrupt evaluation-thread)
                          (display 
                           "Sorry, I couldn't evaluate your expression in the given time."))
                        (print-exception (make-exception m e) #f)))
                  (lambda ()
                    (let ([result (thread/result evaluation-thread)])
                      (if (circular? result) 
                          (write result)
                          (pretty-print result))
                      (unless (void? result) 
                        (putprop '! env result)))))))))])
    ;Start the threads
    (thread/start evaluation-thread)
    (thread/start watchdog-thread)
    (let loop () (unless (thread/join watchdog-thread) (loop)))
    (get-output-string os)))


