(define opt:lambda
  (lambda (formals body state)
    (mvlet ([(rv state)
             (opt body (union-state-entry* state 'vars formals))])
      (values `(lambda ,formals ,rv) state))))


;;Constant Propogation (always safe)
(define (cp-candidates formals values* state)
  (let ((set-vars (get-state-entry state 'set-vars))
        (nf '())
        (nv '()))
    (let ((cpc
           (let loop ((x formals)
                      (y values*))
             (cond [(null? x) '()]
                   [(and set-vars (memq (car x) set-vars))
                    (set! nf (cons (car x) nf))
                    (set! nv (cons (car y) nv))
                    (loop (cdr x) (cdr y))]
                   [(immediate? (car y))
                    (cons (cons (car x) (car y))
                          (loop (cdr x) (cdr y)))]
                   [else 
                     (set! nf (cons (car x) nf))
                     (set! nv (cons (car y) nv))
                     (loop (cdr x) (cdr y))]))))
      (values nf nv cpc))))

(define opt:letrec
  (lambda (formals values* body state)
    (mvlet ([(nf nv cpc) 
             (cp-candidates formals values* state)])
      (mvlet ([(rv state)
               (opt body (if (null? cpc)
                             state
                             (union-state-entry* state 'constant-prop 
                                                 cpc)))])
             (values
              (if (null? nf)
                  rv
                  `(letrec ,(map list nf nv) ,rv))
              state)))))

(define opt:let
  (lambda (formals values* body state)
    (mvlet ([(nf nv cpc) 
             (cp-candidates formals values* state)])
      (mvlet ([(rv state)
               (opt body (if (null? cpc)
                             state
                             (union-state-entry* state 'constant-prop 
                                                 cpc)))])
         (values
          (if (null? nf)
              rv
              `((lambda ,nf ,rv) ,@nv))
          state)))))

(define opt:ref
  (lambda (ref state)
    (let ((cp (get-state-entry state 'constant-prop)))
      (cond [(and cp (assq ref cp)) =>
             (lambda (v)
               (values (cdr v) (new-state)))]
            [else (values ref (new-state))]))))

(define opt:if
  (lambda (test conseq altern state)
    (match test
      ;;Branch elimination (always safe)
      ((quote ,x)
       (values 
        (if x conseq altern)
        (new-state)))
      ;Various lookahead opts
      ((if ,B '#f '#f)
       (values 
        `(begin ,B ,altern)
        (new-state)))
      ((if ,B '#f (quote ,x))
       (values 
        `(if ,B ,altern ,conseq)
        (new-state)))
      ((if ,B (quote ,x) '#f)
       (values 
        `(if ,B ,conseq ,altern)
        (new-state)))
      ((if ,B (quote ,x) (quote ,y))
       (values 
        `(begin ,B ,conseq)
        (new-state)))
      ;Begin lifting (possibly unsafe)
      ((begin ,e* ... ,el)
;       (guard (not-redefined? 'begin))
       (values `(begin ,@e* (if ,el ,conseq ,altern))
               '((new-assumptions begin))))
      ;branch swap (possibly unsafe)
      ((not ,x)
       (guard (not-redefined? 'not))
       (values 
        `(if ,x ,altern ,conseq)
        '((new-assumptions not))))
      (,other (values `(if ,other ,conseq ,altern) (new-state))))))

(define constant-fold-candidates '(+ - / * not))

;; Applications and constant folding (possibly unsafe)
(define (opt:application rator rands state)
  (if (and (symbol? rator)
           (memq rator (getprop 'assumptive-procedures '*opt*))
          (andmap immediate? rands))
      (values (list 'quote (eval `(,rator ,@rands))) 
              (merge-states state `((new-assumptions ,rator))))
      (match rator
        ((lambda () ,E)
         (values E (new-state)))
        (,else 
          (values `(,else ,@rands) (new-state))))))

;; begin flattening, constant elimination, and collapse
(define make-begin 
  (letrec ((mb-helper
            (lambda (exp1 . exps*)
              (if (null? exps*)
                  (match exp1
                    ((begin ,exps* ...)
                     (apply mb-helper exps*))
                    (,other (list other)))
                  (match exp1
                    ; Eliminate constants in command context
                    ((quote ,x) 
                     (apply mb-helper exps*))
                    ; Eliminate variable references in command context
                    (,x
                     (guard (symbol? x))
                     (apply mb-helper xps*))
                    ; Eliminate procedures in command context
                    ((lambda ,formals ,body)
                     (apply mb-helper exps*))
                    ; Flatten nested begins
                    ((begin ,sexps* ...)
                     (let ((sub-begin (apply mb-helper sexps*)))
                       (append sub-begin 
                               (apply mb-helper exps*))))
                    (,other (cons other (apply mb-helper exps*))))))))
  (lambda (exp1 . exps*)
    (if (null? exps*) 
        exp1
        (let ((result (apply mb-helper exp1 exps*)))
          (if (and (pair? result)
                   (= (length result) 1))
              (car result)
              (cons 'begin result)))))))
                   

(define (opt:begin exp1 exps* state)
  (values (apply make-begin (cons exp1 exps*)) (new-state)))

(define (opt:set! lhs rhs state)
  (match rhs
    ; Begin lifting
    ((begin e* ... el)
;     (guard (not-redefined? 'begin))
     (values
      `(begin e* (set! ,lhs el))
      '((new-assumptions 'begin))))
    (,else
      (values
       `(set! ,lhs ,else)
       (new-state)))))


