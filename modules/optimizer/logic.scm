(define (opt:lambda formals body state)
  (let-values ([(rv state)
                (opt body
                     (union-state-entry*
                      state
                      'vars
                      (match formals
                        ((,formal* ... . ,lastf)
                         (guard (symbol? lastf))
                         `(,lastf ,@formal*))
                        ((,formal* ...)
                         formal*)
                        (,formal
                         (list formal)))))])
    (values `(lambda ,formals ,rv) state)))

;;Constant Propogation (always safe)
; This function is complicatedly thorough

(define (cp-candidates formals values* state rec)
  (let ((set-vars (get-state-entry state 'set-vars))
        (nf '())
        (nv '()))
    (define (cp-helper x y acc)
      (if (null? x) acc
          (let ((cx (car x))
                (cy (car y)))
            (cond [(null? x) acc]
                  ;; If this var is bound to another var ref,
                  ;; see if it too is bound to a cp-candidate,
                  ;; and use that value instead of the var.
                  [(and rec
                        (symbol? cy)
                        (assq cy acc)) =>
                        (lambda (vref)
                          (let vloop ((v (cdr vref)))
                            ;;Watch that we never have a chain leading
                            ;;to an existing var
                            (cond [(eq? v cx)
                                   (error 'optimizer "optimizer detected circular variable assignment")]
                                  ;; Reached an immediate or non-var
                                  [(not (symbol? v)) 
                                   (cp-helper (cdr x)
                                              (cdr y)
                                              (cons (cons cx v) acc))]
                                  [(assq v acc) =>
                                   (lambda (vref2)
                                     (vloop (cdr vref2)))]
                                  [else (cp-helper (cdr x)
                                                   (cdr y)
                                                   (cons (cons cx v) acc))])))]
                  [(and (symbol? cy)
                        (memq cy formals))
                   (cp-helper (cdr x)
                              (cdr y) 
                              (cons (cons cx cy) acc))]
                  [(or (not (immediate? cy))
                       (and set-vars (memq cx set-vars)))
                   (set! nf (cons cx nf))
                   (set! nv (cons cy nv))
                   (cp-helper (cdr x) (cdr y) acc)]
                  [else 
                    (if rec
                        (let vloop ((v acc))
                          (unless (null? v) 
                            (if (eq? (cdr v) cx)
                                (set-cdr! v cy)))))
                    (cp-helper (cdr x)
                               (cdr y) 
                               (cons (cons cx cy) acc))]))))
    (let ((cpc (cp-helper formals values* '())))
      (values nf nv cpc))))

(define (opt:letrec-helper formals values* state)
  (let-values ([(nf nvo cpc)
                (cp-candidates formals values* state '#t)])
    (let ([state (if (null? cpc)
                     state
                     (union-state-entry* state 'constant-prop cpc))])
      (let-values ([(nv fstate*)
                    (let ([x (map (lambda (e)
                                    (let-values ([(rv state) (opt e state)])
                                      (cons rv state)))
                                  nvo)])
                      (values (map car x) (map cdr x)))])
        (if (= (length nv) (length values*))
            (values nf nv state)
            (opt:letrec-helper
             nf nv (merge-states 
                    state 
                    (apply merge-states fstate*))))))))

(define (opt:letrec formals values* body state)
  (let-values ([(nf nv state) (opt:letrec-helper formals values* state)])
    (let-values ([(newbody bstate) (opt body state)])
      (values
       (if (null? nf)
           newbody
           `(letrec ,(map list nf nv) ,newbody))
       (merge-states state bstate)))))

(define (opt:let formals values* body state)
  (let-values ([(nf nv cpc) (cp-candidates formals values* state '#f)])
    (let-values ([(rv state)
                  (opt body (if (null? cpc)
                                state
                                (union-state-entry* state 'constant-prop
                                                    cpc)))])
      (values
       (if (null? nf)
           rv
           `((lambda ,nf ,rv) ,@nv))
       state))))

(define (opt:ref ref state)
  (let ((cp (get-state-entry state 'constant-prop)))
    (cond [(and cp (assq ref cp)) =>
           (lambda (v)
             (opt (cdr v) state))]
          [else (values ref (new-state))])))

(define (opt:if test conseq altern state)
  (match test
    ;;Branch elimination (always safe)
    ((quote ,x)
     (values 
      (if x conseq altern)
      (new-state)))
    ;;Various lookahead opts
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
    ;;Begin lifting (possibly unsafe)
    ((begin ,e* ... ,el)
;       (guard (not-redefined? 'begin))
     (values `(begin ,@e* (if ,el ,conseq ,altern))
             '((new-assumptions begin))))
    (,other (values `(if ,other ,conseq ,altern) (new-state)))))

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
(define (mb-helper exp1 . exps*)
  (if (null? exps*)
      (match exp1
        ((begin ,exps* ...)
         (apply mb-helper exps*))
        (,other (list other)))
      (match exp1
        ;; Eliminate constants in command context
        ((quote ,x) 
         (apply mb-helper exps*))
        ;; Eliminate variable references in command context
        (,x
         (guard (symbol? x))
         (apply mb-helper xps*))
        ;; Eliminate procedures in command context
        ((lambda ,formals ,body)
         (apply mb-helper exps*))
        ;; Flatten nested begins
        ((begin ,sexps* ...)
         (let ((sub-begin (apply mb-helper sexps*)))
           (append sub-begin 
                   (apply mb-helper exps*))))
        (,other (cons other (apply mb-helper exps*))))))
(define (make-begin exp1 . exps*)
  (if (null? exps*) 
      exp1
      (let ((result (apply mb-helper exp1 exps*)))
        (if (and (pair? result)
                 (= (length result) 1))
            (car result)
            (cons 'begin result)))))
                   

(define (opt:begin exp1 exps* state)
  (values (apply make-begin (cons exp1 exps*)) (new-state)))

(define (opt:set! lhs rhs state)
  (match rhs
    ;; Begin lifting
    ((begin ,e* ... ,el)
;     (guard (not-redefined? 'begin))
     (values
      `(begin ,@e* (set! ,lhs ,el))
      '((new-assumptions 'begin))))
    (,else
      (values
       `(set! ,lhs ,else)
       (new-state)))))
