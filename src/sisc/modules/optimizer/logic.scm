(define (opt:lambda formals body state)
  (let-values ([(rv state)
                (opt body
                     (union-state-entry*
                      state
                      'lvars
                      (cond [(list? formals)
                             formals]
                            [(pair? formals)
                             (make-proper formals)]
                            [else (list formals)])))])
    (values `(lambda ,formals ,rv) state)))

;;Constant Propogation (always safe)
; This function is complicatedly thorough

(define cp-candidates 
  (lambda (formals values* state rec)
    (let ((set-vars (or (get-state-entry state 'set-vars) '()))
          (refed-vars (or (get-state-entry state 'refed-vars) '()))
          (free-vars (or (get-state-entry state 'free-vars) '()))
          (nf '())
          (nv '())
          (sec '()))
      (define (cp-helper x y acc)
        ;Watch for null? x but not null? y, or vice versa, indicating
        ;argument count mismatch.  If we find one, don't optimize
        (cond [(null? x) (if (null? y) acc '())]
              [(null? y) '()] 
              [else 
                (let ((cx (car x))
                      (cy (car y)))
                  (cond 
                    ;; If this var is never referenced, add its rhs to 
                    ;; the side-effect-only list
                    [(not (memq cx refed-vars))
                     (set! sec (cons cy sec))
                     (cp-helper (cdr x) (cdr y) acc)]
                    ;; If this var gets set!'ed, or its right-hand side
                    ;; is non-immediate, or is the same var in a letrec,
		    ;; skip it
                    [(or (not (immediate? cy))
                         (and set-vars (memq cx set-vars))
			 (and rec (eq? cx cy)))
                     (set! nf (cons cx nf))
                     (set! nv (cons cy nv))
                     (cp-helper (cdr x) (cdr y) acc)]
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
                    ;; If the right hand side is a var-ref, 
                    ;; but its set!'ed or a free variable, skip it.
                    [(and (symbol? cy) 
                          (or (memq cy set-vars)
                              (memq cy free-vars)))
                     (set! nf (cons cx nf))
                     (set! nv (cons cy nv))
                     (cp-helper (cdr x) (cdr y) acc)]
                    ;; If the right-hand-side is a var-ref and 
                    ;; that var is not set! in the body, we can
                    ;; do a simple variable renaming.
                    [(and (symbol? cy) 
                          (or (and rec (memq cy formals))
                              (memq cy (or (get-state-entry state 'lvars)
                                           '()))))
                     (cp-helper (cdr x)
                                (cdr y) 
                                (cons (cons cx cy) acc))]
                    [else 
                      (if rec
                          (begin
                            (let vloop ((v acc))
                              (unless (null? v) 
                                (if (eq? (cdr v) cx)
                                    (set-cdr! v cy))))
                            (set! nf (cons cx nf))
                            (set! nv (cons cy nv))))
                      (cp-helper (cdr x)
                                 (cdr y) 
                                 (cons (cons cx cy) acc))]))]))
      (let ((cpc (cp-helper formals values* '())))
        (if (and (null? cpc) (null? sec))
            (values formals values* cpc sec)
            (values nf nv cpc sec))))))
  
(define (opt:letrec-helper formals values* state)
  (let ((state (union-state-entry* state 'lvars formals)))
    (let-values ([(nf nvo cpc sec)
                  (cp-candidates formals values* state '#t)])
      (let ([state (if (null? cpc)
                       state
                       (union-state-entry* state 'constant-prop cpc))])
;      (let-values ([(nv fstate*)
;                    (let ([x (map (lambda (e)
;                                    (let-values ([(rv state) (opt e state)])
;                                      (cons rv state)))
;                                  nvo)])
;                      (values (map car x) (map cdr x)))])
;        (if (= (length nv) (length values*))
            (values nf nvo sec state)
;            (opt:letrec-helper
;             nf nv (merge-states 
;                    state 
;                    (apply merge-states fstate*)))))
))))

(define (opt:letrec formals values* body state)
  (let-values ([(nf nv sec state) (opt:letrec-helper formals values* state)])
    (let-values ([(newbody bstate) (opt body state)])
      (values
       (apply make-begin 
              (append sec 
                      (list
                       (if (null? nf)
                           newbody
                           `(letrec ,(map list nf nv) ,newbody)))))
       (merge-states state bstate)))))

(define (opt:let formals values* body state)
  (let ((state (union-state-entry* state 'lvars formals)))
    (let-values ([(nf nv cpc sec) (cp-candidates formals values* state '#f)])
      (let-values ([(rv state)
                    (opt body (if (null? cpc)
                                  state
                                  (union-state-entry* state 'constant-prop
                                                      cpc)))])
        (values
         (apply make-begin 
                (append sec
                        (list
                         (if (null? nf)
                             rv
                             `((lambda ,nf ,rv) ,@nv)))))
;                              `(let ,(map list nf nv) ,rv)))))
         state)))))

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
      (make-begin B altern)
      (new-state)))
    ((if ,B '#f (quote ,x))
     (opt:if B altern conseq state))
    ((if ,B (quote ,x) '#f)
     (opt:if B conseq altern))
    ((if ,B (quote ,x) (quote ,y))
     (values 
      (make-begin B conseq)
      (new-state)))
    ;;Begin lifting (possibly unsafe)
    ((begin ,e* ... ,el)
;       (guard (core-form-not-redefined? 'begin))
     (let-values ([(rv state) (opt:if el conseq altern state)])
       (values (apply make-begin (append e* `(,rv)))
               (merge-states state '((new-assumptions begin))))))
    (,other (values `(if ,other ,conseq ,altern) (new-state)))))

;; Applications and constant folding (possibly unsafe)
(define opt:application 
  (lambda (rator rands state)
    (cond [(and (eq? rator 'not)
                (not-redefined? 'not)
                (= (length rands) 1))
           (let-values ([(rv state) (opt:if (car rands) ''#f ''#t state)])
             (values rv (merge-states state '((new-assumptions not)))))]
          [(and (symbol? rator)
                (not-redefined? rator)
                (andmap constant? rands))
           (values `',(eval `("noexpand" (,rator ,@rands)))
                   `((new-assumptions ,rator)))]
          [(and (pair? rator)
                (eq? (car rator) 'lambda)
                (pair? (cdr rator))
                (null? (cadr rator))
                (pair? (cddr rator))
                (null? (cdddr rator)))
           (values E (new-state))]
          [else 
            (values `(,rator ,@rands) (new-state))))))

;; begin flattening, constant elimination, and collapse
(define (mb-helper exp1 . exps*)
  (if (null? exps*)
      (if (and (pair? exp1)
               (eq? (car exp1) 'begin))
          (apply mb-helper (cdr exp1))
          (list exp1))
      (match exp1
        ;; Eliminate constants in command context
        ((quote ,x) 
         (apply mb-helper exps*))
        ;; Eliminate variable references in command context
        (,x
         (guard (symbol? x))
         (apply mb-helper exps*))
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
  (values
   (apply make-begin exp1 exps*)
   (new-state)))

(define (opt:set! lhs rhs state)
  (match rhs
    ;; Begin lifting
    ((begin ,e* ... ,el)
;     (guard (core-form-not-redefined? 'begin))
     (values
      (apply make-begin (append e* `((set! ,lhs ,el))))
      '((new-assumptions 'begin))))
    (,else
      (values
       `(set! ,lhs ,else)
       (new-state)))))


