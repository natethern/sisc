(define (annotated? obj)
  (not (null? (annotation-keys obj))))

(define-syntax show
  (lambda (e)
    (syntax-case e ()
      ((_ expr)
       (syntax
        (let ([source (sc-expand (quote expr))])
          (pretty-print source)
          (newline)
          (display "=>")
          (newline)
          (let ([optimized ((current-optimizer) source)])
            (pretty-print optimized)
            (newline)
            (display "=>")
            (newline)
            (let ([compiled (compile optimized)])
              (pretty-print (express compiled))
              (newline)
              (display "=>")
              (newline)
              (compiled)))))))))
  
(define trace-depth (parameterize -1))

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

(define (trace . procs)
  (define (make-traced procedure-name procedure)
    (lambda args
      (trace-call (lambda () (cons procedure-name args))
                  (lambda () (apply procedure args)))))
  (let ([traced-procedures (cond [(getprop 'traced-procedures '*debug*) => 
                                  (lambda (x) x)]
                                 [else '()])])
    (if (null? procs)
        (display (format "{currently traced procedures: ~a}~%" 
                         (map car traced-procedures)))
        (begin
          (for-each 
           (lambda (procedure-symbol)
             (let ([proc (getprop procedure-symbol '*toplevel*)])
               (cond [(not (procedure? proc))
                      (error 'trace "'~s' is not bound to a procedure." 
                             procedure-symbol)]
                     [(not (assq procedure-symbol traced-procedures))
                      (begin
                        (set! traced-procedures 
                              (cons (cons procedure-symbol proc)
                                    traced-procedures))
                        (putprop procedure-symbol '*toplevel*
                                 (make-traced procedure-symbol proc)))])))
           procs)
          (putprop 'traced-procedures '*debug* traced-procedures)))))


(define (remove-from-assoc procedure-name assoc)
  (cond [(null? assoc) '()]
        [(eq? (caar assoc) procedure-name)
         (cdr assoc)]
        [else (cons (car assoc) 
                    (remove-from-assoc procedure-name (cdr assoc)))]))

(define (untrace proc1 . procs)
  (let ([traced-procedures (cond [(getprop 'traced-procedures '*debug*) => 
                                  (lambda (x) x)]
                                 [else '()])])
    (for-each 
     (lambda (procedure-symbol)
       (let ([proc (assq procedure-symbol traced-procedures)])
         (if proc
             (begin
               (putprop procedure-symbol '*toplevel* (cdr proc))
               (set! traced-procedures 
                     (remove-from-assoc procedure-symbol traced-procedures))))))
     (cons proc1 procs))
    (putprop 'traced-procedures '*debug* traced-procedures)))

(define (set-breakpoint! function-id)
  (define (make-breakpoint proc)
    (lambda args
      (call/cc (lambda (k)
                 (display (format "{break: ~s}~%" 
                                  (cons function-id args)))
                 (putprop 'continue-point '*debug* 
                          (delay (k (apply proc args))))
                 (((getprop 'repl '*debug*)))))))
  (let ([breakpoints (cond [(getprop 'breakpoints '*debug*) => 
                            (lambda (x) x)]
                           [else '()])])
    (if (not (assq function-id breakpoints))
        (let* ([function (getprop function-id '*toplevel*)]
               [breakpointed-function (make-breakpoint function)])
          (if function 
              (begin
                (putprop 'breakpoints '*debug* 
                         (cons (cons function-id function) breakpoints))
                (putprop function-id '*toplevel* breakpointed-function))
              (error 'set-breakpoint! "no such function."))))))

(define (clear-breakpoint! function-id) 
  (let ([breakpoints (cond [(getprop 'breakpoints '*debug*) => 
                            (lambda (x) x)]
                           [else '()])])
    (cond [(assq function-id breakpoints) =>
           (lambda (v)
             (putprop function-id '*toplevel* (cdr v))
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
          
(define (annotations-to-assoc expr)
  (let loop ([x ()] [keys (annotation-keys expr)])
    (if (null? keys) x
        (loop
         (cons (cons (car keys) (annotation expr (car keys)))
               x)
         (cdr keys)))))

(define (stack-trace k)
  (cond
    [(null? k) '()]
    [(annotation k 'unsafe-cont) => stack-trace]
    [else
      (let ([nxp (continuation-nxp k)]
            [stk (stack-trace (continuation-stk k))])
        (if (null? nxp)
            stk
            (cons (cons nxp 
                        (let ([nxp-annot (annotations-to-assoc nxp)])
                          (map (lambda (v)
                                 (cons v (cond [(assoc v nxp-annot)
                                                => cdr]
                                               [else '?])))
                               '(line-number
                                 column-number
                                 source-file))))
                  stk))))))

(define (print-stack-trace k)
  (for-each
   (lambda (entry)
     (let ([expr (car entry)]
           [data (cdr entry)])
       (let ([line (cdr (assoc 'line-number data))]
             [column (cdr (assoc 'column-number data))]
             [sourcefile (cdr (assoc 'source-file data))])
         (if (and (_fill-rib? expr)
                  (_free-reference-exp? 
                   (_fill-rib-exp expr)))
             (display 
              (format "~a:~a:~a: <called from ~a>~%" 
                      sourcefile
                      line column
                      (_free-reference-symbol
                       (_fill-rib-exp expr))))
             (display 
              (format "~a:~a:~a: <indeterminate call>~%" 
                      sourcefile
                      line column))))))
   (stack-trace k)))

(define (make-error-message location message)
  (if location
      (if message
          (format "Error in ~a: ~a" location message)
          (format "Error in ~a." location))
      (if message
          (format "Error: ~a" message)
          "Error.")))

(define (display-error e)
  (display (if (or (null? e) (pair? e))
               (make-error-message (error-location e)
                                   (error-message e))
               (make-error-message #f e)))
  (newline))

(define (print-exception e . st)
  (let ([error (exception-error e)])
    (display-error error)
    (if (or (null? st) (car st))
        (print-stack-trace (exception-continuation e)))
    (let ([p (and (pair? error) (error-parent error))])
      (if p 
          (begin (display "Caused by ")
                 (apply print-exception p st))))))
