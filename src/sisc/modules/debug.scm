(define (annotated? obj)
  (not (null? (annotation-keys obj))))

(define (compile x . env)
  (apply _compile
         (_analyze! ((current-optimizer) (sc-expand x))
                    (if (null? env) (interaction-environment) (car env)))
         env))

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
            (let ([analyzed (_analyze! optimized (interaction-environment))])
              (pretty-print analyzed)
              (newline)
              (display "=>")
              (newline)              
              (let ([compiled (_compile analyzed)])
                (pretty-print (express compiled))
                (newline)
                (display "=>")
                (newline)
                (compiled))))))))))
  
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

(define (verify-traced proclist)
  (let loop ((x proclist))
    (if (null? x) 
        '()
        (let ([traced-procedure (car x)])
          (if (eq? (cdr traced-procedure)
                   (getprop (car traced-procedure)))
              (loop (cdr x))
              (cons traced-procedure (loop (cdr x))))))))
              
(define (trace . procs)
  (define (make-traced procedure-name procedure)
    (lambda args
      (trace-call (lambda () (cons procedure-name args))
                  (lambda () (apply procedure args)))))
  (let ([traced-procedures (verify-traced
                            (cond [(getprop 'traced-procedures '*debug*) => 
                                   (lambda (x) x)]
                                  [else '()]))])
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
                          (cons (cons real-ps (list proc traced-proc)) 
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
  (let ([traced-procedures (cond [(getprop 'traced-procedures '*debug*) => 
                                  (lambda (x) x)]
                                 [else '()])])
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
          
(define (annotations-to-assoc expr)
  (let loop ([x ()] [keys (annotation-keys expr)])
    (if (null? keys) x
        (loop
         (cons (cons (car keys) (annotation expr (car keys)))
               x)
         (cdr keys)))))

(define (stack-trace k . base)
  (cond
    [(or (null? k) 
	 (and (not (null? base))
	      (eq? k (car base))))
     '()]
    [(annotation k 'unsafe-cont) => (lambda (nk)
				      (apply stack-trace nk base))]
    [else
      (let ([nxp (continuation-nxp k)]
            [stk (apply stack-trace (continuation-stk k) base)])
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
                                 source-file
                                 proc-name))))
                  stk))))))

(define (format-stack-trace-entry entry)
  (let ([expr (car entry)]
        [data (cdr entry)])
    (let ([line (cdr (assoc 'line-number data))]
          [column (cdr (assoc 'column-number data))]
          [sourcefile (cdr (assoc 'source-file data))]
          [procname (if (eq? (cdr (assoc 'proc-name data)) '?)
                        #f
                        (cdr (assoc 'proc-name data)))])
      (cond [procname
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

(define (print-stack-trace k . base)
  (for-each (lambda (entry)
              (display (format-stack-trace-entry entry))
              (newline))
            (apply stack-trace k base)))

(print-exception-stack-trace-hook
 'debug
 (lambda (next e . base)
   (if (exception? e)
       (apply print-stack-trace (exception-continuation e) base)
       (next e))))
