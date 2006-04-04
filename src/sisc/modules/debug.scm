(define (annotated? obj)
  (not (null? (annotation-keys obj))))

(define (show-expr expr)
  (define (print expr)
    (pretty-print (if (procedure? expr) (express expr) expr))
    (newline)
    (display "=>")
    (newline))
  (let ([source (sc-expand expr)])
    (print source)
    (let ([optimized ((current-optimizer) source)])
      (print optimized)
      (let ([analyzed (_analyze! optimized (interaction-environment))])
        (print analyzed)
        (let ([compiled (compile-with-flags analyzed
                                            'compile
                                            '((l) (l))
                                            (interaction-environment))])
          (print compiled)
          (compiled))))))

(define-simple-syntax (show expr) (show-expr (quote expr)))
  
(define trace-depth (make-parameter -1))

(define (indent n)
  (for-each (lambda (n) (display #\space)) (iota n)))

(define (trace-call before call)
  (dynamic-wind
   (lambda () (trace-depth (+ (trace-depth) 1)))
   (lambda ()
     (let ([depth (trace-depth)])
       (if (> depth 20)
           (begin 
             (indent 40)
             (display (format "[~s]" depth)))
           (indent (* depth 2)))
       (write (before))
       (newline)
       (let ([result (call)])
         (if (> depth 20)
             (begin 
               (indent 40)
               (display (format "[~s]" depth)))
             (indent (* depth 2)))
         (write result)
         (newline)
         result)))
   (lambda () (trace-depth (- (trace-depth) 1)))))

(define-syntax trace-lambda
  (syntax-rules ()
    ((trace-lambda name (formal ...) body ...)
     (lambda (formal ...)
       (trace-call (lambda () (list 'name formal ...))
                   (lambda () (begin body ...)))))
    ((trace-lambda name (formal ... . rest) body ...)
     (lambda (formal ... . rest)
       (trace-call (lambda () (list 'name formal ... rest))
                   (lambda () (begin body ...)))))
    ((trace-lambda name formal body ...)
     (lambda formal
       (trace-call (lambda () (list 'name formal))
                   (lambda () (begin body ...)))))))

(define-syntax trace-let
  (syntax-rules ()
    ((trace-let name ([var val] ...) body ...)
     (let name ([var val] ...)
       (trace-call (lambda () (list 'name var ...))
                   (lambda () (begin body ...)))))))

(define (make-traced procedure-name procedure)
  (lambda args
    (trace-call (lambda () (cons procedure-name args))
                (lambda () (apply procedure args)))))

(define (verify-traced! proclist)
  (let loop ((x proclist))
    (if (null? x) 
        '()
        (let ([traced-procedure (car x)])
          (if (eq? (caddr traced-procedure)
                   (getprop (car traced-procedure)))
              (cons traced-procedure (loop (cdr x)))
              (let* ([real-ps (sc-expand (car traced-procedure))]
                     [proc (getprop real-ps)]
                     [traced-proc (make-traced real-ps proc)])
                (putprop real-ps traced-proc)
                (cons (list real-ps proc traced-proc) (loop (cdr x)))))))))
              
(define (trace . procs)
  (let ([traced-procedures (verify-traced!
                            (getprop 'traced-procedures '*debug* '()))])
    (if (null? procs)
        (display (format "{currently traced procedures: ~a}~%" 
                         (map car traced-procedures)))
        (begin
          (for-each 
           (lambda (procedure-symbol)
             (let* ([real-ps (sc-expand procedure-symbol)]
                    [proc (getprop real-ps)])
               (cond [(not (procedure? proc))
                      (error 'trace "'~s' is not bound to a procedure." 
                             procedure-symbol)]
                     [(not (assq real-ps traced-procedures))
                      (let ([traced-proc (make-traced real-ps proc)])
                        (set! traced-procedures 
                              (cons (list real-ps proc traced-proc)
                                    traced-procedures))
                        (putprop real-ps traced-proc))])))
           procs)))
    (putprop 'traced-procedures '*debug* traced-procedures)))


(define (remove-from-assoc procedure-name assoc)
  (cond [(null? assoc) '()]
        [(eq? (caar assoc) procedure-name)
         (cdr assoc)]
        [else (cons (car assoc) 
                    (remove-from-assoc procedure-name (cdr assoc)))]))

(define (untrace proc1 . procs)
  (let ([traced-procedures (getprop 'traced-procedures '*debug* '())])
    (for-each 
     (lambda (procedure-symbol)
       (let* ([real-ps (sc-expand procedure-symbol)]
              [proc (assq real-ps traced-procedures)])
         (if proc
             (begin
               (when (eq? (caddr proc) (getprop real-ps))
                 (putprop real-ps (cadr proc)))
               (set! traced-procedures 
                 (remove-from-assoc real-ps traced-procedures))))))
     (cons proc1 procs))
    (putprop 'traced-procedures '*debug* traced-procedures)))

(define (set-breakpoint! function-id)
  (define (make-breakpoint proc)
    (lambda args
      (call/cc (lambda (k)
                 (display (format "{break: ~s~% ~a}~%" 
                                  (cons function-id args)
                                  (format-stack-trace-entry
                                   (car (stack-trace k)))))
                 (putprop 'continue-point '*debug* 
                          (delay (k (apply proc args))))
                 (((getprop 'repl '*debug*)))))))
  (let* ([function-id (sc-expand function-id)]
         [breakpoints (cond [(getprop 'breakpoints '*debug*) => 
                            (lambda (x) x)]
                           [else '()])])
    (if (not (assq function-id breakpoints))
        (let* ([function (getprop function-id)]
               [breakpointed-function (make-breakpoint function)])
          (if function 
              (begin
                (putprop 'breakpoints '*debug* 
                         (cons (cons function-id function) breakpoints))
                (putprop function-id breakpointed-function))
              (error 'set-breakpoint! "no such function."))))))

(define (clear-breakpoint! function-id) 
  (let* ([function-id (sc-expand function-id)]
         [breakpoints (cond [(getprop 'breakpoints '*debug*) => 
                             (lambda (x) x)]
                            [else '()])])
    (cond [(assq function-id breakpoints) =>
           (lambda (v)
             (putprop function-id (cdr v))
             (putprop 'breakpoints '*debug* 
                      (remove-from-assoc function-id breakpoints)))]
          [else (error 'clear-breakpoint! "no such function or function is not a breakpoint.")])))

(define (continue)
  (cond [(getprop 'continue-point '*debug*) =>
         (lambda (c)
           (putprop 'continue-point '*debug* #f)
           (c))]
        [else (error 'continue "nowhere to continue to.")]))

;;;;;;;;;;;;;; exception display ;;;;;;;;;;;;;;;;;;;;
          
(define stack-trace-stop-at-mark? (make-parameter #t))

(define (stack-trace k)
  (cond
    [(not k)
     '()]
    [(annotation k 'unsafe-cont) => stack-trace]
    [else
      (let ([nxp  (continuation-nxp k)]
            [st   (continuation-stack-trace k)]
            [stk  (continuation-stk k)])
        (if (or nxp (not (stack-trace-stop-at-mark?)))
            (cons (if st (cons nxp st) nxp)
                  (stack-trace stk))
            '()))]))

(define (format-expression-location expr)
  (define (source-annotations)
    (apply values (map (lambda (v)
                         (cond [(annotation expr v) => (lambda (x) x)]
                               [else '?]))
                       '(source-file
                         line-number
                         column-number
                         proc-name))))
  (call-with-values source-annotations
    (lambda (sourcefile line column procname)
      (cond [(not (eq? procname '?))
             (format "~a:~a:~a: <from call to ~a>"
                     sourcefile line column procname)]
            [(and (_fill-rib? expr)
                  (_free-reference-exp? 
                   (_fill-rib-exp expr)))
             (format "~a:~a:~a: <from call to/argument of ~a>" 
                     sourcefile
                     line column
                     (_free-reference-symbol
                      (_fill-rib-exp expr)))]
            [else
             (format "~a:~a:~a: <indeterminate call>" 
                     sourcefile
                     line column)]))))

(define (format-k-stack l level)
  (let ([prefix (apply string (map (lambda (x) '#\ ) (iota (* 2 level))))])
    (apply string-append
           (map (lambda (x)
                  (string-append
                   prefix
                   (if (pair? x)
                       (string-append
                        (format "~a repetitions of ...\n" (car x))
                        (format-k-stack (cdr x) (+ level 1)))
                       (string-append
                        (format-expression-location x)
                        "\n"))))
                l))))

(define (format-stack-trace-entry entry)
  (if (pair? entry)
      (let ([expr       (car entry)]
            [overflown? (cadr entry)]
            [stack      (cddr entry)])
        (string-append (format-k-stack stack 0)
                       (if overflown? "...\n" "")))
      (string-append (format-expression-location entry) "\n")))

(define (stack-trace-entry-has-data? entry)
  (if entry
      (if (pair? entry)
          (not (null? (cddr entry)))
          #t)
      #f))

(define (print-stack-trace k)
  (define (print-single-entry entry count)
    (if (> (max-stack-trace-depth) 0)
        (display "---------------------------\n"))
    (display entry)
    (when (> count 1)
      (display (format "[previous ~a repeated~a]\n"
                       (if (> (max-stack-trace-depth) 0)
                           "entries"
                           "entry")
                       (case count
                         ((1) " once")
                         ((2) " twice")
                         (else (format " ~a times" count)))))))
  ;;; Bunch up multiple lines and add a repeat count
  (let loop ([entries (stack-trace k)]
             [last #f]
             [count 1])
    (if (null? entries)
        (if last (print-single-entry last count))
        (let ([current (car entries)]
              [rest    (cdr entries)])
          (if (stack-trace-entry-has-data? current)
              (let ([print-rep (format-stack-trace-entry current)])
                (if (equal? print-rep last)
                    (loop rest last (+ count 1))
                    (begin
                      (if last (print-single-entry last count))
                      (loop rest print-rep 1))))
              (loop rest last count))))))

(print-exception-stack-trace-hook
 'debug
 (lambda (next e)
   (if (exception? e)
       (print-stack-trace (exception-continuation e))
       (next e))))

