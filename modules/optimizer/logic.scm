(define opt:lambda
  (lambda (formals body state)
    (mvlet ([(rv state)
             (opt body ((if (list? formals)
                            union-state-entry*
                            union-state-entry)
                        state 'vars formals))])
      (values `(lambda ,formals ,rv) state))))


;;Constant Propogation (always safe)
; This function is complicatedly thorough
(define (cp-candidates formals values* state rec)
  (let ((set-vars (get-state-entry state 'set-vars))
        (nf '())
        (nv '()))
    (let ((cpc
           (let loop ((x formals)
                            (y values*)
                            (acc '()))
             (cond [(null? x) acc]
                   ; If this var is bound to another var ref,
                   ; see if it too is bound to a cp-candidate,
                   ; and use that value instead of the var.
                   [(and rec
                         (symbol? (car y))
                         (assq (car y) acc)) =>
                    (lambda (vref)
                      (let vloop ((v (cdr vref)))
                              ;Watch that we never have a chain leading
                              ;to an existing var
                        (cond [(eq? v (car x))
                               (error 'optimizer "optimizer detected circular variable assignment")]
                              ; Reached an immediate or non-var
                              [(not (symbol? v)) 
                               (loop (cdr x) (cdr y)
                                     (cons (cons (car x) v) acc))]
                              [(assq v acc) =>
                               (lambda (vref2)
                                 (vloop (cdr vref2)))]
                              [else (loop (cdr x) (cdr y)
                                          (cons (cons (car x) v) acc))])))]
                   [(symbol? (car y))
                    (loop (cdr x) (cdr y) 
                          (cons (cons (car x) (car y)) acc))]
                   [(or (not (immediate? (car y)))
                        (and set-vars (memq (car x) set-vars)))
                    (set! nf (cons (car x) nf))
                    (set! nv (cons (car y) nv))
                    (loop (cdr x) (cdr y) acc)]
                   [else 
                     (if rec
                         (let vloop ((v acc))
                           (unless (null? v) 
                             (if (eq? (cdr v) (car x))
                                 (set-cdr! v (car y))))))
                     (loop (cdr x) (cdr y) 
                           (cons (cons (car x) (car y)) acc))]))))
      (values nf nv cpc))))

(define opt:letrec
  (lambda (formals values* body state)
    (mvlet ([(nf nv state)
             (let loop ((formals formals)
                        (values* values*)
                        (state state))
                (mvlet ([(nf nvo cpc) 
                         (cp-candidates formals values* state '#t)])
                  (let ([state (if (null? cpc)
                                   state
                                   (union-state-entry* state 'constant-prop 
                                                       cpc))])
                    (mvlet ([(nv fstate*)
                             (let ([x (map (lambda (e)
                                             (mvlet ([(rv state)
                                                      (opt e state)])
                                                    (cons rv state)))
                                           nvo)])
                               (values (map car x)
                                       (map cdr x)))])
                      (if (= (length nv) (length values*))
                          (values nf nv state)
                          (loop nf nv (merge-states 
                                       state 
                                       (apply merge-states fstate*))))))))])
        (mvlet ([(newbody bstate)
                 (opt body state)])
          (values
           (if (null? nf)
               newbody
               `(letrec ,(map list nf nv) ,newbody))
           (merge-states state bstate))))))

(define opt:let
  (lambda (formals values* body state)
    (mvlet ([(nf nv cpc) 
             (cp-candidates formals values* state '#f)])
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
               (opt (cdr v) state))]
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
      (,other (values `(if ,other ,conseq ,altern) (new-state))))))

;; Applications and constant folding (possibly unsafe)
(define (opt:application rator rands state)
  (match rator
    (not
     (guard (and (not-redefined? 'not)
                 (= (length rands) 1)))
     (values `(if ,@rands '#f '#t) '((new-assumptions not))))
    (,x
     (guard (and (symbol? x)
                 (not-redefined? x)
                 (andmap immediate? rands)))
     (values `',(eval `("noexpand" (,x ,@rands)))
             `((new-assumptions ,x))))
    ((lambda () ,E)
     (values E (new-state)))
    (,else
      (values `(,else ,@rands) (new-state)))))

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
    ((begin ,e* ... ,el)
;     (guard (not-redefined? 'begin))
     (values
      `(begin ,@e* (set! ,lhs ,el))
      '((new-assumptions 'begin))))
    (,else
      (values
       `(set! ,lhs ,else)
       (new-state)))))


