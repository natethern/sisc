(define (remove-unreferenced vars refed)
  (cond [(null? vars) '()]
        [(assq (car vars) refed) =>
         (lambda (count)
           (if (> (cdr count) 0)
               (cons (car vars) (remove-unreferenced (cdr vars) refed))
               (remove-unreferenced (cdr vars) refed)))]
        [else (cons (car vars) (remove-unreferenced (cdr vars) refed))]))
  
(define (opt:lambda keyword formals lexicals body state)
  (let* ([rv (opt body state)]
         [newlexicals (remove-unreferenced lexicals (state-get state refv))])
    (list keyword #t formals newlexicals rv)))

;;Constant Propogation (always safe)
; This function is complicatedly thorough
(define cp-candidates
  (lambda (formals values* rec state)
    (let ((nf '())
          (nv '())
          (sec '())
          (refv (state-get state refv))
          (setv (state-get state setv))
          (lexv (state-get state lexv))
          (freev (state-get state freev)))
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
                    [(not (assq cx refv))
                     (set! sec (cons cy sec))
                     (cp-helper (cdr x) (cdr y) acc)]
                    ;; If this var gets set!'ed, or its right-hand side
                    ;; is non-immediate, or is the same var in a letrec,
		    ;; skip it
                    [(or (not (immediate? cy))
                         (if rec
                             (> (reference-count cx setv) 1)
                             (assq cx setv))
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
                          (or  (if rec
                                   (> (reference-count cy setv) 1)
                                   (assq cy setv))
                               (memq cy freev)))
                     (set! nf (cons cx nf))
                     (set! nv (cons cy nv))
                     (cp-helper (cdr x) (cdr y) acc)]
                    ;; If the right-hand-side is a var-ref and 
                    ;; that var is not set! in the body, we can
                    ;; do a simple variable renaming.
                    [(and (symbol? cy) 
                          (or (and rec (memq cy formals))
                              (memq cy lexv)))
                     (cp-helper (cdr x)
                                (cdr y) 
                                (cons (cons cx cy) acc))]
                    [else 
                      (if rec
                          (begin
                            (let vloop ((v acc))
                              (unless (null? v) 
                                (if (eq? (cdar v) cx)
                                    (set-cdr! (car v) cy))))
                            (set! nf (cons cx nf))
                            (set! nv (cons cy nv))))
                      (cp-helper (cdr x)
                                 (cdr y) 
                                 (cons (cons cx cy) acc))])))])
      (let ((cpc (cp-helper formals values* '())))
        (if (and (null? cpc) (null? sec))
            (values formals values* cpc sec)
            (values nf nv cpc sec))))))

(define (opt:letrec-helper formals values* state)
  (let ((state (state-union-ls state lexv formals)))
    (let-values ([(nf nvo cpcs sec)
                  (cp-candidates formals values* #t state)])
      (let ([state (if (null? cpcs)
                       state
                       (state-union-ls state cpc cpcs))])
        (if (null? cpcs)
            (values nf nvo sec state)
            (let ([nv (map (lambda (e) (opt e state)) nvo)])
              (if (= (length nv) (length values*))
                  (values nf nvo sec state)
                  (opt:letrec-helper
                   nf nv (merge-states 
                          state 
                          (apply merge-states fstate*))))))))))

(define (opt:letrec keyword formals values* lexicals body state)
  (let-values ([(nf nv sec state) (opt:letrec-helper formals values* state)])
    (let ([newbody (opt body state)])
      (varcount-clear-all! state refv (map car (state-get state cpc)))
      (apply make-begin 
             (append sec 
                     (list
                      (if (null? nf)
                          newbody
                           `(,keyword #t ,(map list nf nv)
                                      ,(remove-unreferenced lexicals (state-get state refv))
                                      ,newbody))))))))

(define (varcount-clear-all! state type vars)
  (state-set! state type
              (let loop ([ls (state-get state type)])
                (cond [(null? ls) '()]
                      [(memq (caar ls) vars)
                       (loop (cdr ls))]
                      [else (cons (car ls) (loop (cdr ls)))]))))

(define (opt:let keyword formals lexicals values* body state)
  (let ((state (state-union-ls state lexv formals)))
    (let-values ([(nf nv cpcs sec) (cp-candidates formals values* #f state)])
      (let ([rv (opt body (if (null? cpcs)
                              state
                              (state-union-ls state cpc cpcs)))]
            [nrefv (varcount-clear-all! state refv (map car cpcs))])
        (apply make-begin 
               (append sec
                       (list
                        (if (null? nf)
                            rv
                            `(,(opt:lambda keyword nf lexicals rv state)
                              ,@nv)))))))))

(define (opt:ref ref state)
  (let ((cp (state-get state cpc)))
    (cond [(and cp (assq ref cp)) =>
           (lambda (v)
             (varcount-decr! state refv ref)
             (opt (cdr v) state))]
          [else ref])))

(define (opt:if keyword test conseq altern state)
  (match test
    ;;Branch elimination (always safe)
    (,x
     (guard (constant? x))
      (if x conseq altern))
    ;;Various lookahead opts
    ((,?if ,B #f #f)     
     (guard (core-form-eq? ?if 'if #%if))
     (make-begin B altern))
    ((,?if ,B #f ,x)
     (guard (and (constant? x)
                 (core-form-eq? ?if 'if #%if)))
     (opt:if keyword B altern conseq state))
    ((,?if ,B ,x #f)
     (guard (and (constant? x) (core-form-eq? ?if 'if #%if)))
     (opt:if keyword B conseq altern state))
    ((,?if ,B ,x ,y)
     (guard (and (constant? x) (constant? y) (core-form-eq? ?if 'if #%if)))
     (make-begin B conseq))
    ;;Or optimization
    (((,?lambda (,var) (,?if ,itest ,iconseq ,ialtern))
      ,val)
     (guard (and (core-form-eq? ?if 'if #%if) 
                 (core-form-eq? ?lambda 'lambda #%lambda)
                 (eq? itest var)
                 (eq? iconseq itest)))
      (opt:if #%if `(#%if ,val #t ,ialtern)
              conseq altern state))
    ;;Begin lifting (possibly unsafe)
    ((,?begin ,e* ... ,el)
     (guard (core-form-eq? ?begin 'begin #%begin))
     (let-values ([(rv state) (opt:if keyword el conseq altern state)])
       (apply make-begin (append e* `(,rv)))))
    (,other `(,keyword ,other ,conseq ,altern))))

;; Applications and constant folding (possibly unsafe)
(define opt:application 
  (lambda (rator rands state)
    (cond [(and (eq? rator 'not)
                (not-redefined? 'not)
                (= (length rands) 1))
           (opt:if '#%if (car rands) #f #t state)]
          [(and (symbol? rator)
                (not-redefined? rator)
                (andmap constant? rands))
           (eval `("noexpand" (,rator ,@rands)))]
          [(and (pair? rator)
                (eq? (car rator) 'lambda)
                (pair? (cdr rator))
                (null? (cadr rator))
                (pair? (cddr rator))
                (null? (cdddr rator)))
           E]
          [else 
           `(,rator ,@rands)])))

;; begin flattening, constant elimination, and collapse
(define (mb-helper exp1 . exps*)
  (if (null? exps*)
      (if (and (pair? exp1)
               (core-form-eq? (car exp1) 'begin '#%begin))
          (apply mb-helper (cdr exp1))
          (list exp1))
      (match exp1
        ;; Eliminate constants and variable references
        ;; in command context.
        (,x
         (guard (or (constant? x) (symbol? x)))
         (apply mb-helper exps*))
        ;; Eliminate procedures in command context
        ((lambda ,formals ,body)
         (apply mb-helper exps*))
        ;; Flatten nested begins
        ((,?begin ,sexps* ...)
         (guard (core-form-eq? ?begin 'begin #%begin))
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
            (cons #%begin result)))))
                   

(define (opt:begin exp1 exps* state)
  (apply make-begin exp1 exps*))

(define (opt:set! keyword lhs rhs state)
  (match rhs
    ;; Begin lifting
    ((begin ,e* ... ,el)
;     (guard (core-form-not-redefined? 'begin))
     (apply make-begin (append e* `((,keyword ,lhs ,el)))))
    (,else
     `(,keyword ,lhs ,else))))
