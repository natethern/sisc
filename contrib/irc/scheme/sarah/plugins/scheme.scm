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

(define (do-optimize channel message ignore expr)
  (with-input-from-string expr
    (lambda ()
      (safe-pp-to-string (optimize (sc-expand (read-code) '(e) '(e)))))))

(define (do-express channel message ignore expr)
  (with-input-from-string expr
    (lambda ()
      (safe-pp-to-string (express (compile (optimize (sc-expand (read-code) '(e) '(e)))))))))


(define (forbidden-procedure name)
  (lambda args
    (error name "use is forbidden in this environment.")))

(define forbidden-bindings 
   '(open-input-file open-output-file 
    interaction-environment
    with-output-to-file
    with-input-from-file
    call-with-input-file
    call-with-output-file
    open-source-input-file))

(define (my-load url env)
  (when (and (> (string-length (normalize-url (current-url) url))
                5)
             (string=? "file:" (substring (normalize-url (current-url) url)
                                          0 5)))
    (error 'load "Not allowed to load from local urls"))
  (call-with-input-file url
    (lambda (in)
     (let loop ([expr (read-code in)])
       (unless (eof-object? expr)
         (eval expr env)
         (loop (read-code in)))))))

(define (sandbox env)
  (putprop 'eval env (lambda (expr env)
                       (eval expr (sandbox env))))
  (putprop 'load env (lambda (url) (my-load url env)))
  
  (for-each (lambda (binding)
              (putprop binding env (forbidden-procedure binding)))
            forbidden-bindings)
  env)

(define (stateless-eval channel message ignore term)
  (with/fc (lambda (m e)
             (error-message m))
    (lambda ()
      (let* ([expr 'didnt-read]
             [text ""]
             [expr-text 
              (with-output-to-string 
                (lambda ()
                  (with-input-from-string term
                    (lambda ()
                      (set! expr (read-code))
                      (do ([c (read-char) (read-char)]
                           [ls '() (cons c ls)])
                          [(eof-object? c)
                           (set! text (apply string (reverse ls)))])))))])
        (display text) (newline)
        (cond [(eq? expr 'didnt-read) expr-text]
              [(void? expr) "{No expression.  Were the parenthesis closed properly?}"]
              [else
               (strict-r5rs-compliance #t)
               (let ([env (sandbox (scheme-report-environment 5))])
                 (for-each (lambda (k v) (putprop k env v))
                           '(call/cc $sc-put-cte fold error
                             with-failure-continuation with/fc
                             |@optimizer::optimize| sc-expand)
                           (list call/cc $sc-put-cte fold error
                            with/fc with/fc optimize sc-expand))
                 (eval-within-n-ms expr 5000 env text))])))))

(define (safe-pp-to-string value)
  (if (circular? value)
      (with-output-to-string (lambda () (write value)))
      (pretty-print-to-string value)))

(define (make-resume k)
  (let ([system-time system-time]
        [deadline (+ (system-time) 15000)]
        [error error])
    (lambda ()
      (if (> (system-time) deadline)
          (k)
          (error 'resume "You aren't allowed to resume for ~a more seconds."
                 (quotient (- deadline (system-time)) 1000))))))

(define (eval-within-n-ms datum ms env . iostr)
  (let* ([os (open-output-string)]
         [evaluation-thread
          (thread/new 
           (lambda ()
             (with-input-from-string (if (null? iostr) "" (car iostr))
               (lambda () 
                 (with-output-to-port os
                   (lambda () (eval datum env)))))))]
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
                          (thread/join evaluation-thread)
                          (with/fc (lambda (m e)
                                     (putprop 'resume env (make-resume e)))
                                   (lambda ()
                                     (thread/result evaluation-thread)))
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
    (let ([outstr (get-output-string os)])
      (if (or (> (string-length outstr) (* 80 25 2))
              (> (count-newlines outstr) 50))
          "Output is excessive for this environment.  Not printing."
          outstr))))

(define (count-newlines outstr)
  (let loop ([ls (string->list outstr)] [n 0])
    (cond [(null? ls) n]
          [(char=? #\newline (car ls)) (loop (cdr ls) (+ n 1))]
          [else (loop (cdr ls) n)])))


