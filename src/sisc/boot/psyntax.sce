(letrec ((lambda-var-list_es
           (lambda (vars_1ug)
             ((letrec ((lvl_1uh
                         (lambda (vars_1ui ls_1uj w_1uk)
                           (if (pair? vars_1ui)
                             (lvl_1uh
                               (cdr vars_1ui)
                               (cons (wrap_cu (car vars_1ui) w_1uk) ls_1uj)
                               w_1uk)
                             (if (id?_9k vars_1ui)
                               (cons (wrap_cu vars_1ui w_1uk) ls_1uj)
                               (if (null? vars_1ui)
                                 ls_1uj
                                 (if (syntax-object?_7r vars_1ui)
                                   (lvl_1uh
                                     (syntax-object-expression_7s vars_1ui)
                                     ls_1uj
                                     (join-wraps_cb
                                       w_1uk
                                       (syntax-object-wrap_7t vars_1ui)))
                                   (if (annotation? vars_1ui)
                                     (lvl_1uh
                                       (annotation-expression vars_1ui)
                                       ls_1uj
                                       w_1uk)
                                     (cons vars_1ui ls_1uj)))))))))
                lvl_1uh)
              vars_1ug
              '()
              '(()))))
         (gen-var_er
           (lambda (id_1ue)
             ((lambda (id_1uf)
                (if (annotation? id_1uf)
                  (if (annotation-source id_1uf)
                    (list 'compile-in-annotation
                          (gen-sym (annotation-expression id_1uf))
                          (annotation-source id_1uf))
                    (gen-sym (annotation-expression id_1uf)))
                  (gen-sym id_1uf)))
              (if (syntax-object?_7r id_1ue)
                (syntax-object-expression_7s id_1ue)
                id_1ue))))
         (strip_eq
           (lambda (x_1u9 w_1ua)
             (strip*_ep
               x_1u9
               w_1ua
               (lambda (x_1ub)
                 (if ((lambda (t_1uc)
                        (if t_1uc
                          t_1uc
                          ((lambda (t_1ud)
                             (if t_1ud
                               t_1ud
                               (if (box? x_1ub)
                                 (annotation? (unbox x_1ub))
                                 '#f)))
                           (if (pair? x_1ub) (annotation? (car x_1ub)) '#f))))
                      (annotation? x_1ub))
                   (strip-annotation_eo x_1ub '#f)
                   x_1ub)))))
         (strip*_ep
           (lambda (x_1u0 w_1u1 fn_1u2)
             (if (memq 'top (wrap-marks_9s w_1u1))
               (fn_1u2 x_1u0)
               ((letrec ((f_1u3 (lambda (x_1u4)
                                  (if (syntax-object?_7r x_1u4)
                                    (strip*_ep
                                      (syntax-object-expression_7s x_1u4)
                                      (syntax-object-wrap_7t x_1u4)
                                      fn_1u2)
                                    (if (pair? x_1u4)
                                      ((lambda (a_1u7 d_1u8)
                                         (if (if (eq? a_1u7 (car x_1u4))
                                               (eq? d_1u8 (cdr x_1u4))
                                               '#f)
                                           x_1u4
                                           (cons a_1u7 d_1u8)))
                                       (f_1u3 (car x_1u4))
                                       (f_1u3 (cdr x_1u4)))
                                      (if (vector? x_1u4)
                                        ((lambda (old_1u5)
                                           ((lambda (new_1u6)
                                              (if (andmap eq? old_1u5 new_1u6)
                                                x_1u4
                                                (list->vector new_1u6)))
                                            (map f_1u3 old_1u5)))
                                         (vector->list x_1u4))
                                        x_1u4))))))
                  f_1u3)
                x_1u0))))
         (strip-annotation_eo
           (lambda (x_1tp parent_1tq)
             (if (pair? x_1tp)
               ((lambda (new_1tv)
                  (begin
                    (if parent_1tq
                      (set-annotation-stripped! parent_1tq new_1tv)
                      (void))
                    (set-car!
                      new_1tv
                      (strip-annotation_eo (car x_1tp) '#f))
                    (set-cdr!
                      new_1tv
                      (strip-annotation_eo (cdr x_1tp) '#f))
                    new_1tv))
                (cons '#f '#f))
               (if (annotation? x_1tp)
                 ((lambda (t_1tu)
                    (if t_1tu
                      t_1tu
                      (strip-annotation_eo
                        (annotation-expression x_1tp)
                        x_1tp)))
                  (annotation-stripped x_1tp))
                 (if (vector? x_1tp)
                   ((lambda (new_1tr)
                      (begin
                        (if parent_1tq
                          (set-annotation-stripped! parent_1tq new_1tr)
                          (void))
                        ((letrec ((loop_1ts
                                    (lambda (i_1tt)
                                      (if (< i_1tt '0)
                                        (void)
                                        (begin
                                          (vector-set!
                                            new_1tr
                                            i_1tt
                                            (strip-annotation_eo
                                              (vector-ref x_1tp i_1tt)
                                              '#f))
                                          (loop_1ts (- i_1tt '1)))))))
                           loop_1ts)
                         (- (vector-length x_1tp) '1))
                        new_1tr))
                    (make-vector (vector-length x_1tp)))
                   (if (box? x_1tp)
                     (box (strip-annotation_eo (unbox x_1tp) '#f))
                     x_1tp))))))
         (ellipsis?_en
           (lambda (x_1to)
             (if (nonsymbol-id?_9e x_1to)
               (literal-id=?_cj
                 x_1to
                 '#(syntax-object
                    ...
                    ((top)
                     #(ribcage () () ())
                     #(ribcage #(x) #((top)) #("i"))
                     #(ribcage
                       (lambda-var-list
                         gen-var
                         strip
                         strip*
                         strip-annotation
                         ellipsis?
                         chi-void
                         chi-local-syntax
                         chi-lambda-clause
                         parse-define-syntax
                         parse-define
                         parse-import
                         parse-module
                         do-import!
                         chi-internal
                         chi-body
                         chi-macro
                         chi-set!
                         chi-application
                         chi-expr
                         chi
                         ct-eval/residualize
                         rt-eval/residualize
                         initial-mode-set
                         update-mode-set
                         do-top-import
                         vfor-each
                         vmap
                         chi-external
                         check-defined-ids
                         check-module-exports
                         extend-store!
                         id-set-diff
                         chi-top-module
                         set-module-binding-val!
                         set-module-binding-imps!
                         set-module-binding-label!
                         set-module-binding-id!
                         set-module-binding-type!
                         module-binding-val
                         module-binding-imps
                         module-binding-label
                         module-binding-id
                         module-binding-type
                         module-binding?
                         make-module-binding
                         make-resolved-interface
                         make-trimmed-interface
                         set-interface-token!
                         set-interface-exports!
                         interface-token
                         interface-exports
                         interface?
                         make-interface
                         flatten-exports
                         chi-top
                         chi-top-expr
                         syntax-type
                         chi-when-list
                         chi-top-sequence
                         chi-sequence
                         source-wrap
                         wrap
                         bound-id-member?
                         invalid-ids-error
                         distinct-bound-ids?
                         valid-bound-vars?
                         valid-bound-ids?
                         bound-id=?
                         literal-id=?
                         free-id=?
                         id-var-name
                         id-var-name-loc
                         id-var-name&marks
                         id-var-name-loc&marks
                         same-marks?
                         join-marks
                         join-wraps
                         smart-append
                         make-trimmed-syntax-object
                         make-binding-wrap
                         lookup-import-binding-name
                         extend-ribcage-subst!
                         extend-ribcage-barrier-help!
                         extend-ribcage-barrier!
                         extend-ribcage!
                         make-empty-ribcage
                         set-import-token-key!
                         import-token-key
                         import-token?
                         make-import-token
                         barrier-marker
                         new-mark
                         anti-mark
                         the-anti-mark
                         set-ribcage-labels!
                         set-ribcage-marks!
                         set-ribcage-symnames!
                         ribcage-labels
                         ribcage-marks
                         ribcage-symnames
                         ribcage?
                         make-ribcage
                         gen-labels
                         label?
                         gen-label
                         set-indirect-label!
                         get-indirect-label
                         indirect-label?
                         gen-indirect-label
                         only-top-marked?
                         top-marked?
                         top-wrap
                         empty-wrap
                         wrap-subst
                         wrap-marks
                         make-wrap
                         id-sym-name&marks
                         id-sym-name
                         id?
                         var?
                         nonsymbol-id?
                         global-extend
                         lookup
                         sanitize-binding
                         lookup*
                         displaced-lexical-error
                         transformer-env
                         extend-var-env*
                         extend-env*
                         extend-env
                         null-env
                         binding?
                         set-binding-value!
                         set-binding-type!
                         binding-value
                         binding-type
                         make-binding
                         arg-check
                         source-annotation
                         no-source
                         unannotate
                         set-syntax-object-wrap!
                         set-syntax-object-expression!
                         syntax-object-wrap
                         syntax-object-expression
                         syntax-object?
                         make-syntax-object
                         self-evaluating?
                         build-lexical-var
                         build-body
                         build-letrec
                         build-sequence
                         build-data
                         build-primref
                         build-lambda
                         build-revisit-only
                         build-visit-only
                         build-cte-install
                         build-module-definition
                         build-global-definition
                         build-global-assignment
                         build-global-reference
                         build-lexical-assignment
                         build-lexical-reference
                         build-conditional
                         build-application
                         generate-module-id
                         generate-id
                         get-import-binding
                         get-global-definition-hook
                         put-global-definition-hook
                         gensym-hook
                         error-hook
                         local-eval-hook
                         top-level-eval-hook
                         fx>=
                         fx<=
                         fx>
                         fx<
                         fx=
                         fx-
                         fx+
                         noexpand
                         let-values
                         define-structure
                         unless
                         when)
                       ((top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top)
                        (top))
                       ("i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"
                        "i"))
                     #(ribcage (#(import-token *top*)) () ()))))
               '#f)))
         (chi-void_em (lambda () '(quote #!void)))
         (chi-local-syntax_el
           (lambda (rec?_1t0 e_1t1 r_1t2 w_1t3 s_1t4 k_1t5)
             ((lambda (tmp_1t7)
                (if tmp_1t7
                  (apply (lambda (__1t9 id_1ta val_1tb e1_1tc e2_1td)
                           (if (valid-bound-ids?_cl id_1ta)
                             ((lambda (labels_1tf)
                                ((lambda (new-w_1tg)
                                   (k_1t5 (cons e1_1tc e2_1td)
                                          (extend-env*_96
                                            labels_1tf
                                            ((lambda (w_1ti trans-r_1tj)
                                               (map (lambda (x_1tk)
                                                      (make-binding_8m
                                                        'deferred
                                                        (chi_e8
                                                          x_1tk
                                                          trans-r_1tj
                                                          w_1ti)))
                                                    val_1tb))
                                             (if rec?_1t0 new-w_1tg w_1t3)
                                             (transformer-env_98 r_1t2))
                                            r_1t2)
                                          new-w_1tg
                                          s_1t4))
                                 (make-binding-wrap_c8
                                   id_1ta
                                   labels_1tf
                                   w_1t3)))
                              (gen-labels_b3 id_1ta))
                             (invalid-ids-error_cs
                               (map (lambda (x_1tm) (wrap_cu x_1tm w_1t3))
                                    id_1ta)
                               (source-wrap_cv e_1t1 w_1t3 s_1t4)
                               '"keyword")))
                         tmp_1t7)
                  (syntax-error (source-wrap_cv e_1t1 w_1t3 s_1t4))))
              ($syntax-dispatch
                (compile-in-annotation e_1t1 value)
                '(any #(each (any any)) any . each-any)))))
         (chi-lambda-clause_ek
           (lambda (e_1s5 c_1s6 r_1s7 w_1s8 k_1s9)
             ((lambda (tmp_1sb)
                (if tmp_1sb
                  (apply (lambda (id_1so e1_1sp e2_1sq)
                           (if (valid-bound-ids?_cl id_1so)
                             ((lambda (labels_1ss new-vars_1st)
                                (k_1s9 new-vars_1st
                                       (chi-body_ed
                                         (cons e1_1sp e2_1sq)
                                         e_1s5
                                         (extend-var-env*_97
                                           labels_1ss
                                           new-vars_1st
                                           r_1s7)
                                         (make-binding-wrap_c8
                                           id_1so
                                           labels_1ss
                                           w_1s8))))
                              (gen-labels_b3 id_1so)
                              (map gen-var_er id_1so))
                             (syntax-error
                               e_1s5
                               '"invalid parameter list in")))
                         tmp_1sb)
                  ((lambda (tmp_1sc)
                     (if tmp_1sc
                       (apply (lambda (ids_1se e1_1sf e2_1sg)
                                ((lambda (old-ids_1sh)
                                   (if (valid-bound-ids?_cl old-ids_1sh)
                                     ((lambda (labels_1si new-vars_1sj)
                                        (k_1s9 ((letrec ((f_1sk (lambda (ls1_1sl
                                                                         ls2_1sm)
                                                                  (if (null? ls1_1sl)
                                                                    ls2_1sm
                                                                    (f_1sk (cdr ls1_1sl)
                                                                           (cons (car ls1_1sl)
                                                                                 ls2_1sm))))))
                                                  f_1sk)
                                                (cdr new-vars_1sj)
                                                (car new-vars_1sj))
                                               (chi-body_ed
                                                 (cons e1_1sf e2_1sg)
                                                 e_1s5
                                                 (extend-var-env*_97
                                                   labels_1si
                                                   new-vars_1sj
                                                   r_1s7)
                                                 (make-binding-wrap_c8
                                                   old-ids_1sh
                                                   labels_1si
                                                   w_1s8))))
                                      (gen-labels_b3 old-ids_1sh)
                                      (map gen-var_er old-ids_1sh))
                                     (syntax-error
                                       e_1s5
                                       '"invalid parameter list in")))
                                 (lambda-var-list_es ids_1se)))
                              tmp_1sc)
                       (syntax-error e_1s5)))
                   ($syntax-dispatch
                     (compile-in-annotation c_1s6 value)
                     '(any any . each-any)))))
              ($syntax-dispatch
                (compile-in-annotation c_1s6 value)
                '(each-any any . each-any)))))
         (parse-define-syntax_ej
           (lambda (e_1ro w_1rp s_1rq k_1rr)
             ((lambda (tmp_1rt)
                (if (if tmp_1rt
                      (apply (lambda (__1s2 name_1s3 val_1s4)
                               (id?_9k name_1s3))
                             tmp_1rt)
                      '#f)
                  (apply (lambda (__1rv name_1s0 val_1s1)
                           (k_1rr name_1s0 val_1s1 w_1rp))
                         tmp_1rt)
                  (syntax-error (source-wrap_cv e_1ro w_1rp s_1rq))))
              ($syntax-dispatch
                (compile-in-annotation e_1ro value)
                '(any any any)))))
         (parse-define_ei
           (lambda (e_1qq w_1qr s_1qs k_1qt)
             ((lambda (tmp_1qv)
                (if (if tmp_1qv
                      (apply (lambda (__1rl name_1rm val_1rn)
                               (id?_9k name_1rm))
                             tmp_1qv)
                      '#f)
                  (apply (lambda (__1ri name_1rj val_1rk)
                           (k_1qt name_1rj val_1rk w_1qr))
                         tmp_1qv)
                  ((lambda (tmp_1r0)
                     (if (if tmp_1r0
                           (apply (lambda (__1rd
                                           name_1re
                                           args_1rf
                                           e1_1rg
                                           e2_1rh)
                                    (if (id?_9k name_1re)
                                      (valid-bound-ids?_cl
                                        (lambda-var-list_es args_1rf))
                                      '#f))
                                  tmp_1r0)
                           '#f)
                       (apply (lambda (__1r7 name_1r8 args_1r9 e1_1ra e2_1rb)
                                (k_1qt (wrap_cu name_1r8 w_1qr)
                                       (cons '#(syntax-object
                                                lambda
                                                ((top)
                                                 #(ribcage
                                                   #(_ name args e1 e2)
                                                   #((top)
                                                     (top)
                                                     (top)
                                                     (top)
                                                     (top))
                                                   #("i" "i" "i" "i" "i"))
                                                 #(ribcage () () ())
                                                 #(ribcage
                                                   #(e w s k)
                                                   #((top) (top) (top) (top))
                                                   #("i" "i" "i" "i"))
                                                 #(ribcage
                                                   (lambda-var-list
                                                     gen-var
                                                     strip
                                                     strip*
                                                     strip-annotation
                                                     ellipsis?
                                                     chi-void
                                                     chi-local-syntax
                                                     chi-lambda-clause
                                                     parse-define-syntax
                                                     parse-define
                                                     parse-import
                                                     parse-module
                                                     do-import!
                                                     chi-internal
                                                     chi-body
                                                     chi-macro
                                                     chi-set!
                                                     chi-application
                                                     chi-expr
                                                     chi
                                                     ct-eval/residualize
                                                     rt-eval/residualize
                                                     initial-mode-set
                                                     update-mode-set
                                                     do-top-import
                                                     vfor-each
                                                     vmap
                                                     chi-external
                                                     check-defined-ids
                                                     check-module-exports
                                                     extend-store!
                                                     id-set-diff
                                                     chi-top-module
                                                     set-module-binding-val!
                                                     set-module-binding-imps!
                                                     set-module-binding-label!
                                                     set-module-binding-id!
                                                     set-module-binding-type!
                                                     module-binding-val
                                                     module-binding-imps
                                                     module-binding-label
                                                     module-binding-id
                                                     module-binding-type
                                                     module-binding?
                                                     make-module-binding
                                                     make-resolved-interface
                                                     make-trimmed-interface
                                                     set-interface-token!
                                                     set-interface-exports!
                                                     interface-token
                                                     interface-exports
                                                     interface?
                                                     make-interface
                                                     flatten-exports
                                                     chi-top
                                                     chi-top-expr
                                                     syntax-type
                                                     chi-when-list
                                                     chi-top-sequence
                                                     chi-sequence
                                                     source-wrap
                                                     wrap
                                                     bound-id-member?
                                                     invalid-ids-error
                                                     distinct-bound-ids?
                                                     valid-bound-vars?
                                                     valid-bound-ids?
                                                     bound-id=?
                                                     literal-id=?
                                                     free-id=?
                                                     id-var-name
                                                     id-var-name-loc
                                                     id-var-name&marks
                                                     id-var-name-loc&marks
                                                     same-marks?
                                                     join-marks
                                                     join-wraps
                                                     smart-append
                                                     make-trimmed-syntax-object
                                                     make-binding-wrap
                                                     lookup-import-binding-name
                                                     extend-ribcage-subst!
                                                     extend-ribcage-barrier-help!
                                                     extend-ribcage-barrier!
                                                     extend-ribcage!
                                                     make-empty-ribcage
                                                     set-import-token-key!
                                                     import-token-key
                                                     import-token?
                                                     make-import-token
                                                     barrier-marker
                                                     new-mark
                                                     anti-mark
                                                     the-anti-mark
                                                     set-ribcage-labels!
                                                     set-ribcage-marks!
                                                     set-ribcage-symnames!
                                                     ribcage-labels
                                                     ribcage-marks
                                                     ribcage-symnames
                                                     ribcage?
                                                     make-ribcage
                                                     gen-labels
                                                     label?
                                                     gen-label
                                                     set-indirect-label!
                                                     get-indirect-label
                                                     indirect-label?
                                                     gen-indirect-label
                                                     only-top-marked?
                                                     top-marked?
                                                     top-wrap
                                                     empty-wrap
                                                     wrap-subst
                                                     wrap-marks
                                                     make-wrap
                                                     id-sym-name&marks
                                                     id-sym-name
                                                     id?
                                                     var?
                                                     nonsymbol-id?
                                                     global-extend
                                                     lookup
                                                     sanitize-binding
                                                     lookup*
                                                     displaced-lexical-error
                                                     transformer-env
                                                     extend-var-env*
                                                     extend-env*
                                                     extend-env
                                                     null-env
                                                     binding?
                                                     set-binding-value!
                                                     set-binding-type!
                                                     binding-value
                                                     binding-type
                                                     make-binding
                                                     arg-check
                                                     source-annotation
                                                     no-source
                                                     unannotate
                                                     set-syntax-object-wrap!
                                                     set-syntax-object-expression!
                                                     syntax-object-wrap
                                                     syntax-object-expression
                                                     syntax-object?
                                                     make-syntax-object
                                                     self-evaluating?
                                                     build-lexical-var
                                                     build-body
                                                     build-letrec
                                                     build-sequence
                                                     build-data
                                                     build-primref
                                                     build-lambda
                                                     build-revisit-only
                                                     build-visit-only
                                                     build-cte-install
                                                     build-module-definition
                                                     build-global-definition
                                                     build-global-assignment
                                                     build-global-reference
                                                     build-lexical-assignment
                                                     build-lexical-reference
                                                     build-conditional
                                                     build-application
                                                     generate-module-id
                                                     generate-id
                                                     get-import-binding
                                                     get-global-definition-hook
                                                     put-global-definition-hook
                                                     gensym-hook
                                                     error-hook
                                                     local-eval-hook
                                                     top-level-eval-hook
                                                     fx>=
                                                     fx<=
                                                     fx>
                                                     fx<
                                                     fx=
                                                     fx-
                                                     fx+
                                                     noexpand
                                                     let-values
                                                     define-structure
                                                     unless
                                                     when)
                                                   ((top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top))
                                                   ("i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"))
                                                 #(ribcage
                                                   (#(import-token *top*))
                                                   ()
                                                   ())))
                                             (wrap_cu
                                               (cons args_1r9
                                                     (cons e1_1ra e2_1rb))
                                               w_1qr))
                                       '(())))
                              tmp_1r0)
                       ((lambda (tmp_1r1)
                          (if (if tmp_1r1
                                (apply (lambda (__1r5 name_1r6)
                                         (id?_9k name_1r6))
                                       tmp_1r1)
                                '#f)
                            (apply (lambda (__1r3 name_1r4)
                                     (k_1qt (wrap_cu name_1r4 w_1qr)
                                            '#(syntax-object
                                               (void)
                                               ((top)
                                                #(ribcage
                                                  #(_ name)
                                                  #((top) (top))
                                                  #("i" "i"))
                                                #(ribcage () () ())
                                                #(ribcage
                                                  #(e w s k)
                                                  #((top) (top) (top) (top))
                                                  #("i" "i" "i" "i"))
                                                #(ribcage
                                                  (lambda-var-list
                                                    gen-var
                                                    strip
                                                    strip*
                                                    strip-annotation
                                                    ellipsis?
                                                    chi-void
                                                    chi-local-syntax
                                                    chi-lambda-clause
                                                    parse-define-syntax
                                                    parse-define
                                                    parse-import
                                                    parse-module
                                                    do-import!
                                                    chi-internal
                                                    chi-body
                                                    chi-macro
                                                    chi-set!
                                                    chi-application
                                                    chi-expr
                                                    chi
                                                    ct-eval/residualize
                                                    rt-eval/residualize
                                                    initial-mode-set
                                                    update-mode-set
                                                    do-top-import
                                                    vfor-each
                                                    vmap
                                                    chi-external
                                                    check-defined-ids
                                                    check-module-exports
                                                    extend-store!
                                                    id-set-diff
                                                    chi-top-module
                                                    set-module-binding-val!
                                                    set-module-binding-imps!
                                                    set-module-binding-label!
                                                    set-module-binding-id!
                                                    set-module-binding-type!
                                                    module-binding-val
                                                    module-binding-imps
                                                    module-binding-label
                                                    module-binding-id
                                                    module-binding-type
                                                    module-binding?
                                                    make-module-binding
                                                    make-resolved-interface
                                                    make-trimmed-interface
                                                    set-interface-token!
                                                    set-interface-exports!
                                                    interface-token
                                                    interface-exports
                                                    interface?
                                                    make-interface
                                                    flatten-exports
                                                    chi-top
                                                    chi-top-expr
                                                    syntax-type
                                                    chi-when-list
                                                    chi-top-sequence
                                                    chi-sequence
                                                    source-wrap
                                                    wrap
                                                    bound-id-member?
                                                    invalid-ids-error
                                                    distinct-bound-ids?
                                                    valid-bound-vars?
                                                    valid-bound-ids?
                                                    bound-id=?
                                                    literal-id=?
                                                    free-id=?
                                                    id-var-name
                                                    id-var-name-loc
                                                    id-var-name&marks
                                                    id-var-name-loc&marks
                                                    same-marks?
                                                    join-marks
                                                    join-wraps
                                                    smart-append
                                                    make-trimmed-syntax-object
                                                    make-binding-wrap
                                                    lookup-import-binding-name
                                                    extend-ribcage-subst!
                                                    extend-ribcage-barrier-help!
                                                    extend-ribcage-barrier!
                                                    extend-ribcage!
                                                    make-empty-ribcage
                                                    set-import-token-key!
                                                    import-token-key
                                                    import-token?
                                                    make-import-token
                                                    barrier-marker
                                                    new-mark
                                                    anti-mark
                                                    the-anti-mark
                                                    set-ribcage-labels!
                                                    set-ribcage-marks!
                                                    set-ribcage-symnames!
                                                    ribcage-labels
                                                    ribcage-marks
                                                    ribcage-symnames
                                                    ribcage?
                                                    make-ribcage
                                                    gen-labels
                                                    label?
                                                    gen-label
                                                    set-indirect-label!
                                                    get-indirect-label
                                                    indirect-label?
                                                    gen-indirect-label
                                                    only-top-marked?
                                                    top-marked?
                                                    top-wrap
                                                    empty-wrap
                                                    wrap-subst
                                                    wrap-marks
                                                    make-wrap
                                                    id-sym-name&marks
                                                    id-sym-name
                                                    id?
                                                    var?
                                                    nonsymbol-id?
                                                    global-extend
                                                    lookup
                                                    sanitize-binding
                                                    lookup*
                                                    displaced-lexical-error
                                                    transformer-env
                                                    extend-var-env*
                                                    extend-env*
                                                    extend-env
                                                    null-env
                                                    binding?
                                                    set-binding-value!
                                                    set-binding-type!
                                                    binding-value
                                                    binding-type
                                                    make-binding
                                                    arg-check
                                                    source-annotation
                                                    no-source
                                                    unannotate
                                                    set-syntax-object-wrap!
                                                    set-syntax-object-expression!
                                                    syntax-object-wrap
                                                    syntax-object-expression
                                                    syntax-object?
                                                    make-syntax-object
                                                    self-evaluating?
                                                    build-lexical-var
                                                    build-body
                                                    build-letrec
                                                    build-sequence
                                                    build-data
                                                    build-primref
                                                    build-lambda
                                                    build-revisit-only
                                                    build-visit-only
                                                    build-cte-install
                                                    build-module-definition
                                                    build-global-definition
                                                    build-global-assignment
                                                    build-global-reference
                                                    build-lexical-assignment
                                                    build-lexical-reference
                                                    build-conditional
                                                    build-application
                                                    generate-module-id
                                                    generate-id
                                                    get-import-binding
                                                    get-global-definition-hook
                                                    put-global-definition-hook
                                                    gensym-hook
                                                    error-hook
                                                    local-eval-hook
                                                    top-level-eval-hook
                                                    fx>=
                                                    fx<=
                                                    fx>
                                                    fx<
                                                    fx=
                                                    fx-
                                                    fx+
                                                    noexpand
                                                    let-values
                                                    define-structure
                                                    unless
                                                    when)
                                                  ((top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top))
                                                  ("i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"))
                                                #(ribcage
                                                  (#(import-token *top*))
                                                  ()
                                                  ())))
                                            '(())))
                                   tmp_1r1)
                            (syntax-error (source-wrap_cv e_1qq w_1qr s_1qs))))
                        ($syntax-dispatch
                          (compile-in-annotation e_1qq value)
                          '(any any)))))
                   ($syntax-dispatch
                     (compile-in-annotation e_1qq value)
                     '(any (any . any) any . each-any)))))
              ($syntax-dispatch
                (compile-in-annotation e_1qq value)
                '(any any any)))))
         (parse-import_eh
           (lambda (e_1qf w_1qg s_1qh k_1qi)
             ((lambda (tmp_1qk)
                (if (if tmp_1qk
                      (apply (lambda (__1qo mid_1qp) (id?_9k mid_1qp))
                             tmp_1qk)
                      '#f)
                  (apply (lambda (__1qm mid_1qn)
                           (k_1qi (wrap_cu mid_1qn w_1qg)))
                         tmp_1qk)
                  (syntax-error (source-wrap_cv e_1qf w_1qg s_1qh))))
              ($syntax-dispatch
                (compile-in-annotation e_1qf value)
                '(any any)))))
         (parse-module_eg
           (lambda (e_1pb w_1pc s_1pd *w_1pe k_1pf)
             (letrec ((listify_1pg
                        (lambda (exports_1q5)
                          (if (null? exports_1q5)
                            '()
                            (cons ((lambda (tmp_1q6)
                                     ((lambda (tmp_1q7)
                                        (if tmp_1q7
                                          (apply (lambda (ex_1q9)
                                                   (listify_1pg ex_1q9))
                                                 tmp_1q7)
                                          (if (id?_9k tmp_1q6)
                                            (wrap_cu tmp_1q6 *w_1pe)
                                            (syntax-error
                                              (source-wrap_cv
                                                e_1pb
                                                w_1pc
                                                s_1pd)
                                              '"invalid exports list in"))))
                                      ($syntax-dispatch
                                        (compile-in-annotation tmp_1q6 value)
                                        'each-any)))
                                   (car exports_1q5))
                                  (listify_1pg (cdr exports_1q5))))))
                      (return_1ph
                        (lambda (id_1qb exports_1qc forms_1qd)
                          (k_1pf id_1qb
                                 (listify_1pg exports_1qc)
                                 (map (lambda (x_1qe) (wrap_cu x_1qe *w_1pe))
                                      forms_1qd)))))
               ((lambda (tmp_1pj)
                  (if tmp_1pj
                    (apply (lambda (__1q0 ex_1q1 form_1q2)
                             (return_1ph '#f ex_1q1 form_1q2))
                           tmp_1pj)
                    ((lambda (tmp_1pk)
                       (if (if tmp_1pk
                             (apply (lambda (__1ps mid_1pt ex_1pu form_1pv)
                                      (id?_9k mid_1pt))
                                    tmp_1pk)
                             '#f)
                         (apply (lambda (__1pm mid_1pn ex_1po form_1pp)
                                  (return_1ph
                                    (wrap_cu mid_1pn w_1pc)
                                    ex_1po
                                    form_1pp))
                                tmp_1pk)
                         (syntax-error (source-wrap_cv e_1pb w_1pc s_1pd))))
                     ($syntax-dispatch
                       (compile-in-annotation e_1pb value)
                       '(any any each-any . each-any)))))
                ($syntax-dispatch
                  (compile-in-annotation e_1pb value)
                  '(any each-any . each-any))))))
         (do-import!_ef
           (lambda (interface_1p6 ribcage_1p7)
             ((lambda (token_1p8)
                (if token_1p8
                  (extend-ribcage-subst!_c6 ribcage_1p7 token_1p8)
                  (vfor-each_e2
                    (lambda (id_1p9)
                      ((lambda (label1_1pa)
                         (begin
                           (if label1_1pa
                             (void)
                             (syntax-error
                               id_1p9
                               '"exported identifier not visible"))
                           (extend-ribcage!_c3
                             ribcage_1p7
                             id_1p9
                             label1_1pa)))
                       (id-var-name-loc_cg id_1p9 '(()))))
                    (interface-exports_d9 interface_1p6))))
              (interface-token_da interface_1p6))))
         (chi-internal_ee
           (lambda (ribcage_1mm source-exp_1mn body_1mo r_1mp k_1mq)
             (letrec ((return_1mr
                        (lambda (exprs_1p1 ids_1p2 vars_1p3 vals_1p4 inits_1p5)
                          (begin
                            (check-defined-ids_dv source-exp_1mn ids_1p2)
                            (k_1mq exprs_1p1
                                   ids_1p2
                                   (reverse vars_1p3)
                                   (reverse vals_1p4)
                                   inits_1p5)))))
               ((letrec ((parse_1ms
                           (lambda (body_1mt
                                    ids_1mu
                                    vars_1mv
                                    vals_1n0
                                    inits_1n1)
                             (if (null? body_1mt)
                               (return_1mr
                                 body_1mt
                                 ids_1mu
                                 vars_1mv
                                 vals_1n0
                                 inits_1n1)
                               ((lambda (e_1n2 er_1n3)
                                  (call-with-values
                                    (lambda ()
                                      (syntax-type_d3
                                        e_1n2
                                        er_1n3
                                        '(())
                                        '#f
                                        ribcage_1mm))
                                    (lambda (type_1n4
                                             value_1n5
                                             e_1n6
                                             w_1n7
                                             s_1n8)
                                      (if (eqv? type_1n4 'define-form)
                                        (parse-define_ei
                                          e_1n6
                                          w_1n7
                                          s_1n8
                                          (lambda (id_1or rhs_1os w_1ot)
                                            ((lambda (id_1ou label_1ov)
                                               ((lambda (var_1p0)
                                                  (begin
                                                    (extend-ribcage!_c3
                                                      ribcage_1mm
                                                      id_1ou
                                                      label_1ov)
                                                    (extend-store!_dt
                                                      r_1mp
                                                      label_1ov
                                                      (make-binding_8m
                                                        'lexical
                                                        var_1p0))
                                                    (parse_1ms
                                                      (cdr body_1mt)
                                                      (cons id_1ou ids_1mu)
                                                      (cons var_1p0 vars_1mv)
                                                      (cons (cons er_1n3
                                                                  (wrap_cu
                                                                    rhs_1os
                                                                    w_1ot))
                                                            vals_1n0)
                                                      inits_1n1)))
                                                (gen-var_er id_1ou)))
                                             (wrap_cu id_1or w_1ot)
                                             (gen-label_b1))))
                                        (if (eqv? type_1n4 'define-syntax-form)
                                          (parse-define-syntax_ej
                                            e_1n6
                                            w_1n7
                                            s_1n8
                                            (lambda (id_1ol rhs_1om w_1on)
                                              ((lambda (id_1oo
                                                        label_1op
                                                        exp_1oq)
                                                 (begin
                                                   (extend-ribcage!_c3
                                                     ribcage_1mm
                                                     id_1oo
                                                     label_1op)
                                                   (extend-store!_dt
                                                     r_1mp
                                                     label_1op
                                                     (make-binding_8m
                                                       'deferred
                                                       exp_1oq))
                                                   (parse_1ms
                                                     (cdr body_1mt)
                                                     (cons id_1oo ids_1mu)
                                                     vars_1mv
                                                     vals_1n0
                                                     inits_1n1)))
                                               (wrap_cu id_1ol w_1on)
                                               (gen-label_b1)
                                               (chi_e8
                                                 rhs_1om
                                                 (transformer-env_98 er_1n3)
                                                 w_1on))))
                                          (if (eqv? type_1n4 'module-form)
                                            ((lambda (*ribcage_1o5)
                                               ((lambda (*w_1o6)
                                                  (parse-module_eg
                                                    e_1n6
                                                    w_1n7
                                                    s_1n8
                                                    *w_1o6
                                                    (lambda (id_1o7
                                                             exports_1o8
                                                             forms_1o9)
                                                      (chi-internal_ee
                                                        *ribcage_1o5
                                                        (source-wrap_cv
                                                          e_1n6
                                                          w_1n7
                                                          s_1n8)
                                                        (map (lambda (d_1oa)
                                                               (cons er_1n3
                                                                     d_1oa))
                                                             forms_1o9)
                                                        r_1mp
                                                        (lambda (*body_1ob
                                                                 *ids_1oc
                                                                 *vars_1od
                                                                 *vals_1oe
                                                                 *inits_1of)
                                                          (begin
                                                            (check-module-exports_du
                                                              source-exp_1mn
                                                              (flatten-exports_d6
                                                                exports_1o8)
                                                              *ids_1oc)
                                                            ((lambda (iface_1og
                                                                      vars_1oh
                                                                      vals_1oi
                                                                      inits_1oj)
                                                               (if id_1o7
                                                                 ((lambda (label_1ok)
                                                                    (begin
                                                                      (extend-ribcage!_c3
                                                                        ribcage_1mm
                                                                        id_1o7
                                                                        label_1ok)
                                                                      (extend-store!_dt
                                                                        r_1mp
                                                                        label_1ok
                                                                        (make-binding_8m
                                                                          'module
                                                                          iface_1og))
                                                                      (parse_1ms
                                                                        (cdr body_1mt)
                                                                        (cons id_1o7
                                                                              ids_1mu)
                                                                        vars_1oh
                                                                        vals_1oi
                                                                        inits_1oj)))
                                                                  (gen-label_b1))
                                                                 (begin
                                                                   (do-import!_ef
                                                                     iface_1og
                                                                     ribcage_1mm)
                                                                   (parse_1ms
                                                                     (cdr body_1mt)
                                                                     (cons iface_1og
                                                                           ids_1mu)
                                                                     vars_1oh
                                                                     vals_1oi
                                                                     inits_1oj))))
                                                             (make-trimmed-interface_dd
                                                               exports_1o8)
                                                             (append
                                                               *vars_1od
                                                               vars_1mv)
                                                             (append
                                                               *vals_1oe
                                                               vals_1n0)
                                                             (append
                                                               inits_1n1
                                                               *inits_1of
                                                               *body_1ob))))))))
                                                (make-wrap_9r
                                                  (wrap-marks_9s w_1n7)
                                                  (cons *ribcage_1o5
                                                        (wrap-subst_9t
                                                          w_1n7)))))
                                             (make-ribcage_b4 '() '() '()))
                                            (if (eqv? type_1n4 'import-form)
                                              (parse-import_eh
                                                e_1n6
                                                w_1n7
                                                s_1n8
                                                (lambda (mid_1o0)
                                                  ((lambda (mlabel_1o1)
                                                     ((lambda (binding_1o2)
                                                        ((lambda (t_1o3)
                                                           (if (eqv? t_1o3
                                                                     'module)
                                                             ((lambda (iface_1o4)
                                                                (begin
                                                                  (if value_1n5
                                                                    (extend-ribcage-barrier!_c4
                                                                      ribcage_1mm
                                                                      value_1n5)
                                                                    (void))
                                                                  (do-import!_ef
                                                                    iface_1o4
                                                                    ribcage_1mm)
                                                                  (parse_1ms
                                                                    (cdr body_1mt)
                                                                    (cons iface_1o4
                                                                          ids_1mu)
                                                                    vars_1mv
                                                                    vals_1n0
                                                                    inits_1n1)))
                                                              (cdr binding_1o2))
                                                             (if (eqv? t_1o3
                                                                       'displaced-lexical)
                                                               (displaced-lexical-error_99
                                                                 mid_1o0)
                                                               (syntax-error
                                                                 mid_1o0
                                                                 '"import from unknown module"))))
                                                         (car binding_1o2)))
                                                      (lookup_9c
                                                        mlabel_1o1
                                                        r_1mp)))
                                                   (id-var-name_ch
                                                     mid_1o0
                                                     '(())))))
                                              (if (eqv? type_1n4 'begin-form)
                                                ((lambda (tmp_1nq)
                                                   (if tmp_1nq
                                                     (apply (lambda (__1nr
                                                                     e1_1ns)
                                                              (parse_1ms
                                                                ((letrec ((f_1nt (lambda (forms_1nu)
                                                                                   (if (null? forms_1nu)
                                                                                     (cdr body_1mt)
                                                                                     (cons (cons er_1n3
                                                                                                 (wrap_cu
                                                                                                   (car forms_1nu)
                                                                                                   w_1n7))
                                                                                           (f_1nt (cdr forms_1nu)))))))
                                                                   f_1nt)
                                                                 e1_1ns)
                                                                ids_1mu
                                                                vars_1mv
                                                                vals_1n0
                                                                inits_1n1))
                                                            tmp_1nq)
                                                     (syntax-error e_1n6)))
                                                 ($syntax-dispatch
                                                   (compile-in-annotation
                                                     e_1n6
                                                     value)
                                                   '(any . each-any)))
                                                (if (eqv? type_1n4
                                                          'eval-when-form)
                                                  ((lambda (tmp_1nh)
                                                     (if tmp_1nh
                                                       (apply (lambda (__1ni
                                                                       x_1nj
                                                                       e1_1nk)
                                                                (parse_1ms
                                                                  (if (memq 'eval
                                                                            (chi-when-list_d2
                                                                              x_1nj
                                                                              w_1n7))
                                                                    ((letrec ((f_1nl (lambda (forms_1nm)
                                                                                       (if (null? forms_1nm)
                                                                                         (cdr body_1mt)
                                                                                         (cons (cons er_1n3
                                                                                                     (wrap_cu
                                                                                                       (car forms_1nm)
                                                                                                       w_1n7))
                                                                                               (f_1nl (cdr forms_1nm)))))))
                                                                       f_1nl)
                                                                     e1_1nk)
                                                                    (cdr body_1mt))
                                                                  ids_1mu
                                                                  vars_1mv
                                                                  vals_1n0
                                                                  inits_1n1))
                                                              tmp_1nh)
                                                       (syntax-error e_1n6)))
                                                   ($syntax-dispatch
                                                     (compile-in-annotation
                                                       e_1n6
                                                       value)
                                                     '(any each-any
                                                           .
                                                           each-any)))
                                                  (if (eqv? type_1n4
                                                            'local-syntax-form)
                                                    (chi-local-syntax_el
                                                      value_1n5
                                                      e_1n6
                                                      er_1n3
                                                      w_1n7
                                                      s_1n8
                                                      (lambda (forms_1na
                                                               er_1nb
                                                               w_1nc
                                                               s_1nd)
                                                        (parse_1ms
                                                          ((letrec ((f_1ne (lambda (forms_1nf)
                                                                             (if (null? forms_1nf)
                                                                               (cdr body_1mt)
                                                                               (cons (cons er_1nb
                                                                                           (wrap_cu
                                                                                             (car forms_1nf)
                                                                                             w_1nc))
                                                                                     (f_1ne (cdr forms_1nf)))))))
                                                             f_1ne)
                                                           forms_1na)
                                                          ids_1mu
                                                          vars_1mv
                                                          vals_1n0
                                                          inits_1n1)))
                                                    (return_1mr
                                                      (cons (cons er_1n3
                                                                  (source-wrap_cv
                                                                    e_1n6
                                                                    w_1n7
                                                                    s_1n8))
                                                            (cdr body_1mt))
                                                      ids_1mu
                                                      vars_1mv
                                                      vals_1n0
                                                      inits_1n1)))))))))))
                                (cdar body_1mt)
                                (caar body_1mt))))))
                  parse_1ms)
                body_1mo
                '()
                '()
                '()
                '()))))
         (chi-body_ed
           (lambda (body_1m6 outer-form_1m7 r_1m8 w_1m9)
             ((lambda (r_1ma)
                ((lambda (ribcage_1mb)
                   ((lambda (w_1mc)
                      ((lambda (body_1md)
                         (chi-internal_ee
                           ribcage_1mb
                           outer-form_1m7
                           body_1md
                           r_1ma
                           (lambda (exprs_1me
                                    ids_1mf
                                    vars_1mg
                                    vals_1mh
                                    inits_1mi)
                             (begin
                               (if (null? exprs_1me)
                                 (syntax-error
                                   outer-form_1m7
                                   '"no expressions in body")
                                 (void))
                               (build-body_7e
                                 '#f
                                 vars_1mg
                                 (map (lambda (x_1mj)
                                        (chi_e8 (cdr x_1mj) (car x_1mj) '(())))
                                      vals_1mh)
                                 (build-sequence_7c
                                   '#f
                                   (map (lambda (x_1mk)
                                          (chi_e8
                                            (cdr x_1mk)
                                            (car x_1mk)
                                            '(())))
                                        (append inits_1mi exprs_1me))))))))
                       (map (lambda (x_1ml)
                              (cons r_1ma (wrap_cu x_1ml w_1mc)))
                            body_1m6)))
                    (make-wrap_9r
                      (wrap-marks_9s w_1m9)
                      (cons ribcage_1mb (wrap-subst_9t w_1m9)))))
                 (make-ribcage_b4 '() '() '())))
              (cons '("placeholder" placeholder) r_1m8))))
         (chi-macro_ec
           (lambda (p_1lk e_1ll r_1lm w_1ln s_1lo rib_1lp)
             (letrec ((rebuild-macro-output_1lq
                        (lambda (x_1lt m_1lu)
                          (if (pair? x_1lt)
                            (cons (rebuild-macro-output_1lq (car x_1lt) m_1lu)
                                  (rebuild-macro-output_1lq (cdr x_1lt) m_1lu))
                            (if (syntax-object?_7r x_1lt)
                              ((lambda (w_1m3)
                                 ((lambda (ms_1m4 s_1m5)
                                    (make-syntax-object_7q
                                      (syntax-object-expression_7s x_1lt)
                                      (if (if (pair? ms_1m4)
                                            (eq? (car ms_1m4) '#f)
                                            '#f)
                                        (make-wrap_9r (cdr ms_1m4) (cdr s_1m5))
                                        (make-wrap_9r
                                          (cons m_1lu ms_1m4)
                                          (if rib_1lp
                                            (cons rib_1lp (cons 'shift s_1m5))
                                            (cons 'shift s_1m5))))))
                                  (wrap-marks_9s w_1m3)
                                  (wrap-subst_9t w_1m3)))
                               (syntax-object-wrap_7t x_1lt))
                              (if (vector? x_1lt)
                                ((lambda (n_1lv)
                                   ((lambda (v_1m0)
                                      ((letrec ((doloop_1m1
                                                  (lambda (i_1m2)
                                                    (if (= i_1m2 n_1lv)
                                                      v_1m0
                                                      (begin
                                                        (vector-set!
                                                          v_1m0
                                                          i_1m2
                                                          (rebuild-macro-output_1lq
                                                            (vector-ref
                                                              x_1lt
                                                              i_1m2)
                                                            m_1lu))
                                                        (doloop_1m1
                                                          (+ i_1m2 '1)))))))
                                         doloop_1m1)
                                       '0))
                                    (make-vector n_1lv)))
                                 (vector-length x_1lt))
                                (if (symbol? x_1lt)
                                  (syntax-error
                                    (source-wrap_cv e_1ll w_1ln s_1lo)
                                    '"encountered raw symbol '"
                                    (symbol->string x_llt)
                                    '" in output of macro")
                                  x_1lt)))))))
               (rebuild-macro-output_1lq
                 ((lambda (out_1lr)
                    (if (procedure? out_1lr)
                      (out_1lr
                        (lambda (id_1ls)
                          (begin
                            (if (identifier? id_1ls)
                              (void)
                              (syntax-error
                                id_1ls
                                '"environment argument is not an identifier"))
                            (lookup_9c (id-var-name_ch id_1ls '(())) r_1lm))))
                      out_1lr))
                  (p_1lk (source-wrap_cv e_1ll (anti-mark_bl w_1ln) s_1lo)))
                 (string '#\m)))))
         (chi-set!_eb
           (lambda (e_1kp r_1kq w_1kr s_1ks rib_1kt)
             ((lambda (tmp_1kv)
                (if (if tmp_1kv
                      (apply (lambda (__1lh id_1li val_1lj) (id?_9k id_1li))
                             tmp_1kv)
                      '#f)
                  (apply (lambda (__1l1 id_1l2 val_1l3)
                           ((lambda (n_1l4)
                              ((lambda (b_1l5)
                                 ((lambda (t_1l6)
                                    (if (eqv? t_1l6 'macro!)
                                      ((lambda (id_1lf val_1lg)
                                         (syntax-type_d3
                                           (chi-macro_ec
                                             (binding-value_8o b_1l5)
                                             (list '#(syntax-object
                                                      set!
                                                      ((top)
                                                       #(ribcage () () ())
                                                       #(ribcage
                                                         #(id val)
                                                         #((top) (top))
                                                         #("i" "i"))
                                                       #(ribcage () () ())
                                                       #(ribcage
                                                         #(t)
                                                         #(("m" top))
                                                         #("i"))
                                                       #(ribcage () () ())
                                                       #(ribcage
                                                         #(b)
                                                         #((top))
                                                         #("i"))
                                                       #(ribcage () () ())
                                                       #(ribcage
                                                         #(n)
                                                         #((top))
                                                         #("i"))
                                                       #(ribcage
                                                         #(_ id val)
                                                         #((top) (top) (top))
                                                         #("i" "i" "i"))
                                                       #(ribcage () () ())
                                                       #(ribcage
                                                         #(e r w s rib)
                                                         #((top)
                                                           (top)
                                                           (top)
                                                           (top)
                                                           (top))
                                                         #("i"
                                                           "i"
                                                           "i"
                                                           "i"
                                                           "i"))
                                                       #(ribcage
                                                         (lambda-var-list
                                                           gen-var
                                                           strip
                                                           strip*
                                                           strip-annotation
                                                           ellipsis?
                                                           chi-void
                                                           chi-local-syntax
                                                           chi-lambda-clause
                                                           parse-define-syntax
                                                           parse-define
                                                           parse-import
                                                           parse-module
                                                           do-import!
                                                           chi-internal
                                                           chi-body
                                                           chi-macro
                                                           chi-set!
                                                           chi-application
                                                           chi-expr
                                                           chi
                                                           ct-eval/residualize
                                                           rt-eval/residualize
                                                           initial-mode-set
                                                           update-mode-set
                                                           do-top-import
                                                           vfor-each
                                                           vmap
                                                           chi-external
                                                           check-defined-ids
                                                           check-module-exports
                                                           extend-store!
                                                           id-set-diff
                                                           chi-top-module
                                                           set-module-binding-val!
                                                           set-module-binding-imps!
                                                           set-module-binding-label!
                                                           set-module-binding-id!
                                                           set-module-binding-type!
                                                           module-binding-val
                                                           module-binding-imps
                                                           module-binding-label
                                                           module-binding-id
                                                           module-binding-type
                                                           module-binding?
                                                           make-module-binding
                                                           make-resolved-interface
                                                           make-trimmed-interface
                                                           set-interface-token!
                                                           set-interface-exports!
                                                           interface-token
                                                           interface-exports
                                                           interface?
                                                           make-interface
                                                           flatten-exports
                                                           chi-top
                                                           chi-top-expr
                                                           syntax-type
                                                           chi-when-list
                                                           chi-top-sequence
                                                           chi-sequence
                                                           source-wrap
                                                           wrap
                                                           bound-id-member?
                                                           invalid-ids-error
                                                           distinct-bound-ids?
                                                           valid-bound-vars?
                                                           valid-bound-ids?
                                                           bound-id=?
                                                           literal-id=?
                                                           free-id=?
                                                           id-var-name
                                                           id-var-name-loc
                                                           id-var-name&marks
                                                           id-var-name-loc&marks
                                                           same-marks?
                                                           join-marks
                                                           join-wraps
                                                           smart-append
                                                           make-trimmed-syntax-object
                                                           make-binding-wrap
                                                           lookup-import-binding-name
                                                           extend-ribcage-subst!
                                                           extend-ribcage-barrier-help!
                                                           extend-ribcage-barrier!
                                                           extend-ribcage!
                                                           make-empty-ribcage
                                                           set-import-token-key!
                                                           import-token-key
                                                           import-token?
                                                           make-import-token
                                                           barrier-marker
                                                           new-mark
                                                           anti-mark
                                                           the-anti-mark
                                                           set-ribcage-labels!
                                                           set-ribcage-marks!
                                                           set-ribcage-symnames!
                                                           ribcage-labels
                                                           ribcage-marks
                                                           ribcage-symnames
                                                           ribcage?
                                                           make-ribcage
                                                           gen-labels
                                                           label?
                                                           gen-label
                                                           set-indirect-label!
                                                           get-indirect-label
                                                           indirect-label?
                                                           gen-indirect-label
                                                           only-top-marked?
                                                           top-marked?
                                                           top-wrap
                                                           empty-wrap
                                                           wrap-subst
                                                           wrap-marks
                                                           make-wrap
                                                           id-sym-name&marks
                                                           id-sym-name
                                                           id?
                                                           var?
                                                           nonsymbol-id?
                                                           global-extend
                                                           lookup
                                                           sanitize-binding
                                                           lookup*
                                                           displaced-lexical-error
                                                           transformer-env
                                                           extend-var-env*
                                                           extend-env*
                                                           extend-env
                                                           null-env
                                                           binding?
                                                           set-binding-value!
                                                           set-binding-type!
                                                           binding-value
                                                           binding-type
                                                           make-binding
                                                           arg-check
                                                           source-annotation
                                                           no-source
                                                           unannotate
                                                           set-syntax-object-wrap!
                                                           set-syntax-object-expression!
                                                           syntax-object-wrap
                                                           syntax-object-expression
                                                           syntax-object?
                                                           make-syntax-object
                                                           self-evaluating?
                                                           build-lexical-var
                                                           build-body
                                                           build-letrec
                                                           build-sequence
                                                           build-data
                                                           build-primref
                                                           build-lambda
                                                           build-revisit-only
                                                           build-visit-only
                                                           build-cte-install
                                                           build-module-definition
                                                           build-global-definition
                                                           build-global-assignment
                                                           build-global-reference
                                                           build-lexical-assignment
                                                           build-lexical-reference
                                                           build-conditional
                                                           build-application
                                                           generate-module-id
                                                           generate-id
                                                           get-import-binding
                                                           get-global-definition-hook
                                                           put-global-definition-hook
                                                           gensym-hook
                                                           error-hook
                                                           local-eval-hook
                                                           top-level-eval-hook
                                                           fx>=
                                                           fx<=
                                                           fx>
                                                           fx<
                                                           fx=
                                                           fx-
                                                           fx+
                                                           noexpand
                                                           let-values
                                                           define-structure
                                                           unless
                                                           when)
                                                         ((top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top)
                                                          (top))
                                                         ("i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"
                                                          "i"))
                                                       #(ribcage
                                                         (#(import-token
                                                            *top*))
                                                         ()
                                                         ())))
                                                   id_1lf
                                                   val_1lg)
                                             r_1kq
                                             '(())
                                             s_1ks
                                             rib_1kt)
                                           r_1kq
                                           '(())
                                           s_1ks
                                           rib_1kt))
                                       (wrap_cu id_1l2 w_1kr)
                                       (wrap_cu val_1l3 w_1kr))
                                      (values
                                        'core
                                        (lambda (e_1l7 r_1l8 w_1l9 s_1la)
                                          ((lambda (val_1lb n_1lc)
                                             ((lambda (b_1ld)
                                                ((lambda (t_1le)
                                                   (if (eqv? t_1le 'lexical)
                                                     (if s_1la
                                                       (list 'compile-in-annotation
                                                             (list 'set!
                                                                   (binding-value_8o
                                                                     b_1ld)
                                                                   val_1lb)
                                                             s_1la)
                                                       (list 'set!
                                                             (binding-value_8o
                                                               b_1ld)
                                                             val_1lb))
                                                     (if (eqv? t_1le 'global)
                                                       (if s_1la
                                                         (list 'compile-in-annotation
                                                               (list 'set!
                                                                     (binding-value_8o
                                                                       b_1ld)
                                                                     val_1lb)
                                                               s_1la)
                                                         (list 'set!
                                                               (binding-value_8o
                                                                 b_1ld)
                                                               val_1lb))
                                                       (if (eqv? t_1le
                                                                 'displaced-lexical)
                                                         (syntax-error
                                                           (wrap_cu
                                                             id_1l2
                                                             w_1l9)
                                                           '"identifier out of context")
                                                         (syntax-error
                                                           (source-wrap_cv
                                                             e_1l7
                                                             w_1l9
                                                             s_1la))))))
                                                 (binding-type_8n b_1ld)))
                                              (lookup_9c n_1lc r_1l8)))
                                           (chi_e8 val_1l3 r_1l8 w_1l9)
                                           (id-var-name_ch id_1l2 w_1l9)))
                                        e_1kp
                                        w_1kr
                                        s_1ks)))
                                  (binding-type_8n b_1l5)))
                               (lookup_9c n_1l4 r_1kq)))
                            (id-var-name_ch id_1l2 w_1kr)))
                         tmp_1kv)
                  (syntax-error (source-wrap_cv e_1kp w_1kr s_1ks))))
              ($syntax-dispatch
                (compile-in-annotation e_1kp value)
                '(any any any)))))
         (chi-application_ea
           (lambda (x_1kb e_1kc r_1kd w_1ke s_1kf)
             ((lambda (tmp_1kh)
                (if tmp_1kh
                  (apply (lambda (e0_1kj e1_1kk)
                           (if s_1kf
                             (list 'compile-in-annotation
                                   (cons x_1kb
                                         (map (lambda (e_1kn)
                                                (chi_e8 e_1kn r_1kd w_1ke))
                                              e1_1kk))
                                   s_1kf)
                             (cons x_1kb
                                   (map (lambda (e_1kl)
                                          (chi_e8 e_1kl r_1kd w_1ke))
                                        e1_1kk))))
                         tmp_1kh)
                  (syntax-error (source-wrap_cv e_1kc w_1ke s_1kf))))
              ($syntax-dispatch
                (compile-in-annotation e_1kc value)
                '(any . each-any)))))
         (chi-expr_e9
           (lambda (type_1jm value_1jn e_1jo r_1jp w_1jq s_1jr)
             (if (eqv? type_1jm 'lexical)
               (if s_1jr
                 (list 'compile-in-annotation value_1jn s_1jr)
                 value_1jn)
               (if (eqv? type_1jm 'core)
                 (value_1jn e_1jo r_1jp w_1jq s_1jr)
                 (if (eqv? type_1jm 'lexical-call)
                   (chi-application_ea
                     (if (source-annotation_8e (car e_1jo))
                       (list 'compile-in-annotation
                             value_1jn
                             (source-annotation_8e (car e_1jo)))
                       value_1jn)
                     e_1jo
                     r_1jp
                     w_1jq
                     s_1jr)
                   (if (eqv? type_1jm 'constant)
                     (if s_1jr
                       (list 'compile-in-annotation
                             (list 'quote
                                   (strip_eq
                                     (source-wrap_cv e_1jo w_1jq s_1jr)
                                     '(())))
                             s_1jr)
                       (list 'quote
                             (strip_eq
                               (source-wrap_cv e_1jo w_1jq s_1jr)
                               '(()))))
                     (if (eqv? type_1jm 'global)
                       (if s_1jr
                         (list 'compile-in-annotation value_1jn s_1jr)
                         value_1jn)
                       (if (eqv? type_1jm 'call)
                         (chi-application_ea
                           (chi_e8 (car e_1jo) r_1jp w_1jq)
                           e_1jo
                           r_1jp
                           w_1jq
                           s_1jr)
                         (if (eqv? type_1jm 'begin-form)
                           ((lambda (tmp_1k6)
                              (if tmp_1k6
                                (apply (lambda (__1k7 e1_1k8 e2_1k9)
                                         (chi-sequence_d0
                                           (cons e1_1k8 e2_1k9)
                                           r_1jp
                                           w_1jq
                                           s_1jr))
                                       tmp_1k6)
                                (syntax-error e_1jo)))
                            ($syntax-dispatch
                              (compile-in-annotation e_1jo value)
                              '(any any . each-any)))
                           (if (eqv? type_1jm 'local-syntax-form)
                             (chi-local-syntax_el
                               value_1jn
                               e_1jo
                               r_1jp
                               w_1jq
                               s_1jr
                               chi-sequence_d0)
                             (if (eqv? type_1jm 'eval-when-form)
                               ((lambda (tmp_1ju)
                                  (if tmp_1ju
                                    (apply (lambda (__1jv x_1k0 e1_1k1 e2_1k2)
                                             (if (memq 'eval
                                                       (chi-when-list_d2
                                                         x_1k0
                                                         w_1jq))
                                               (chi-sequence_d0
                                                 (cons e1_1k1 e2_1k2)
                                                 r_1jp
                                                 w_1jq
                                                 s_1jr)
                                               (chi-void_em)))
                                           tmp_1ju)
                                    (syntax-error e_1jo)))
                                ($syntax-dispatch
                                  (compile-in-annotation e_1jo value)
                                  '(any each-any any . each-any)))
                               (if (memv type_1jm
                                         '(define-form
                                            define-syntax-form
                                            module-form
                                            import-form))
                                 (syntax-error
                                   (source-wrap_cv e_1jo w_1jq s_1jr)
                                   '"invalid context for definition")
                                 (if (eqv? type_1jm 'syntax)
                                   (syntax-error
                                     (source-wrap_cv e_1jo w_1jq s_1jr)
                                     '"reference to pattern variable outside syntax form")
                                   (if (eqv? type_1jm 'displaced-lexical)
                                     (displaced-lexical-error_99
                                       (source-wrap_cv e_1jo w_1jq s_1jr))
                                     (syntax-error
                                       (source-wrap_cv
                                         e_1jo
                                         w_1jq
                                         s_1jr))))))))))))))))
         (chi_e8
           (lambda (e_1je r_1jf w_1jg)
             (call-with-values
               (lambda ()
                 (syntax-type_d3 e_1je r_1jf w_1jg '#f '#f))
               (lambda (type_1jh value_1ji e_1jj w_1jk s_1jl)
                 (chi-expr_e9
                   type_1jh
                   value_1ji
                   e_1jj
                   r_1jf
                   w_1jk
                   s_1jl)))))
         (ct-eval/residualize_e7
           (lambda (ctem_1j8 thunk_1j9)
             (if (memq 'e ctem_1j8)
               (begin
                 (top-level-eval-hook_3u (thunk_1j9))
                 (chi-void_em))
               ((lambda (thunk_1ja)
                  (if (memq 'r ctem_1j8)
                    (if ((lambda (t_1jc)
                           (if t_1jc t_1jc (memq 'v ctem_1j8)))
                         (memq 'l ctem_1j8))
                      (thunk_1ja)
                      (thunk_1ja))
                    (if ((lambda (t_1jb)
                           (if t_1jb t_1jb (memq 'v ctem_1j8)))
                         (memq 'l ctem_1j8))
                      (thunk_1ja)
                      (chi-void_em))))
                (if (memq 'c ctem_1j8)
                  ((lambda (x_1jd)
                     (begin
                       (top-level-eval-hook_3u x_1jd)
                       (lambda () x_1jd)))
                   (thunk_1j9))
                  thunk_1j9)))))
         (rt-eval/residualize_e6
           (lambda (rtem_1j2 thunk_1j3)
             (if (memq 'e rtem_1j2)
               (thunk_1j3)
               ((lambda (thunk_1j4)
                  (if (memq 'v rtem_1j2)
                    (if ((lambda (t_1j6)
                           (if t_1j6 t_1j6 (memq 'r rtem_1j2)))
                         (memq 'l rtem_1j2))
                      (thunk_1j4)
                      (thunk_1j4))
                    (if ((lambda (t_1j5)
                           (if t_1j5 t_1j5 (memq 'r rtem_1j2)))
                         (memq 'l rtem_1j2))
                      (thunk_1j4)
                      (chi-void_em))))
                (if (memq 'c rtem_1j2)
                  ((lambda (x_1j7)
                     (begin
                       (top-level-eval-hook_3u x_1j7)
                       (lambda () x_1j7)))
                   (thunk_1j3))
                  thunk_1j3)))))
         (update-mode-set_e4
           (lambda (when-list_1io mode-set_1ip)
             (remq '-
                   (apply append
                          (map (lambda (m_1iq)
                                 ((lambda (row_1ir)
                                    (map (lambda (s_1is)
                                           (cdr (assq s_1is row_1ir)))
                                         when-list_1io))
                                  (cdr (assq m_1iq
                                             '((l (load . l)
                                                  (compile . c)
                                                  (visit . v)
                                                  (revisit . r)
                                                  (eval . -))
                                               (c (load . -)
                                                  (compile . -)
                                                  (visit . -)
                                                  (revisit . -)
                                                  (eval . c))
                                               (v (load . v)
                                                  (compile . c)
                                                  (visit . v)
                                                  (revisit . -)
                                                  (eval . -))
                                               (r (load . r)
                                                  (compile . c)
                                                  (visit . -)
                                                  (revisit . r)
                                                  (eval . -))
                                               (e (load . -)
                                                  (compile . -)
                                                  (visit . -)
                                                  (revisit . -)
                                                  (eval . e)))))))
                               mode-set_1ip)))))
         (do-top-import_e3
           (lambda (mid_1il token_1im)
             (list '$sc-put-cte
                   (list 'quote mid_1il)
                   (list 'quote
                         (make-binding_8m 'do-import token_1im)))))
         (vfor-each_e2
           (lambda (fn_1ig v_1ih)
             ((lambda (len_1ii)
                ((letrec ((doloop_1ij
                            (lambda (i_1ik)
                              (if (= i_1ik len_1ii)
                                (void)
                                (begin
                                  (fn_1ig (vector-ref v_1ih i_1ik))
                                  (doloop_1ij (+ i_1ik '1)))))))
                   doloop_1ij)
                 '0))
              (vector-length v_1ih))))
         (chi-external_e0
           (lambda (ribcage_1fi
                    source-exp_1fj
                    body_1fk
                    r_1fl
                    exports_1fm
                    fexports_1fn
                    ctem_1fo
                    k_1fp)
             (letrec ((return_1fq
                        (lambda (bindings_1hv ids_1i0 inits_1i1)
                          (begin
                            (check-defined-ids_dv source-exp_1fj ids_1i0)
                            (check-module-exports_du
                              source-exp_1fj
                              fexports_1fn
                              ids_1i0)
                            (k_1fp bindings_1hv inits_1i1))))
                      (get-implicit-exports_1fr
                        (lambda (id_1i2)
                          ((letrec ((f_1i3 (lambda (exports_1i4)
                                             (if (null? exports_1i4)
                                               '()
                                               (if (if (pair? (car exports_1i4))
                                                     (bound-id=?_ck
                                                       id_1i2
                                                       (caar exports_1i4))
                                                     '#f)
                                                 (flatten-exports_d6
                                                   (cdar exports_1i4))
                                                 (f_1i3 (cdr exports_1i4)))))))
                             f_1i3)
                           exports_1fm)))
                      (update-imp-exports_1fs
                        (lambda (bindings_1i5 exports_1i6)
                          ((lambda (exports_1i7)
                             (map (lambda (b_1i8)
                                    ((lambda (id_1i9)
                                       (if (bound-id-member?_ct
                                             id_1i9
                                             exports_1i7)
                                         (make-module-binding_df
                                           (module-binding-type_dh b_1i8)
                                           id_1i9
                                           (module-binding-label_dj b_1i8)
                                           (append
                                             (get-implicit-exports_1fr id_1i9)
                                             (module-binding-imps_dk b_1i8))
                                           (module-binding-val_dl b_1i8))
                                         b_1i8))
                                     (module-binding-id_di b_1i8)))
                                  bindings_1i5))
                           (map (lambda (x_1ia)
                                  (if (pair? x_1ia) (car x_1ia) x_1ia))
                                exports_1i6)))))
               ((letrec ((parse_1ft
                           (lambda (body_1fu ids_1fv bindings_1g0 inits_1g1)
                             (if (null? body_1fu)
                               (return_1fq bindings_1g0 ids_1fv inits_1g1)
                               ((lambda (e_1g2 er_1g3)
                                  (call-with-values
                                    (lambda ()
                                      (syntax-type_d3
                                        e_1g2
                                        er_1g3
                                        '(())
                                        '#f
                                        ribcage_1fi))
                                    (lambda (type_1g4
                                             value_1g5
                                             e_1g6
                                             w_1g7
                                             s_1g8)
                                      (if (eqv? type_1g4 'define-form)
                                        (parse-define_ei
                                          e_1g6
                                          w_1g7
                                          s_1g8
                                          (lambda (id_1hp rhs_1hq w_1hr)
                                            ((lambda (id_1hs)
                                               ((lambda (label_1ht)
                                                  ((lambda (imps_1hu)
                                                     (begin
                                                       (extend-ribcage!_c3
                                                         ribcage_1fi
                                                         id_1hs
                                                         label_1ht)
                                                       (parse_1ft
                                                         (cdr body_1fu)
                                                         (cons id_1hs ids_1fv)
                                                         (cons (make-module-binding_df
                                                                 type_1g4
                                                                 id_1hs
                                                                 label_1ht
                                                                 imps_1hu
                                                                 (cons er_1g3
                                                                       (wrap_cu
                                                                         rhs_1hq
                                                                         w_1hr)))
                                                               bindings_1g0)
                                                         inits_1g1)))
                                                   (get-implicit-exports_1fr
                                                     id_1hs)))
                                                (gen-indirect-label_au)))
                                             (wrap_cu id_1hp w_1hr))))
                                        (if (eqv? type_1g4 'define-syntax-form)
                                          (parse-define-syntax_ej
                                            e_1g6
                                            w_1g7
                                            s_1g8
                                            (lambda (id_1hi rhs_1hj w_1hk)
                                              ((lambda (id_1hl)
                                                 ((lambda (label_1hm)
                                                    ((lambda (imps_1hn)
                                                       ((lambda (exp_1ho)
                                                          (begin
                                                            (extend-store!_dt
                                                              r_1fl
                                                              (get-indirect-label_av
                                                                label_1hm)
                                                              (cons 'deferred
                                                                    exp_1ho))
                                                            (extend-ribcage!_c3
                                                              ribcage_1fi
                                                              id_1hl
                                                              label_1hm)
                                                            (parse_1ft
                                                              (cdr body_1fu)
                                                              (cons id_1hl
                                                                    ids_1fv)
                                                              (cons (make-module-binding_df
                                                                      type_1g4
                                                                      id_1hl
                                                                      label_1hm
                                                                      imps_1hn
                                                                      exp_1ho)
                                                                    bindings_1g0)
                                                              inits_1g1)))
                                                        (chi_e8
                                                          rhs_1hj
                                                          (transformer-env_98
                                                            er_1g3)
                                                          w_1hk)))
                                                     (get-implicit-exports_1fr
                                                       id_1hl)))
                                                  (gen-indirect-label_au)))
                                               (wrap_cu id_1hi w_1hk))))
                                          (if (eqv? type_1g4 'module-form)
                                            ((lambda (*ribcage_1h5)
                                               ((lambda (*w_1h6)
                                                  (parse-module_eg
                                                    e_1g6
                                                    w_1g7
                                                    s_1g8
                                                    *w_1h6
                                                    (lambda (id_1h7
                                                             *exports_1h8
                                                             forms_1h9)
                                                      (chi-external_e0
                                                        *ribcage_1h5
                                                        (source-wrap_cv
                                                          e_1g6
                                                          w_1g7
                                                          s_1g8)
                                                        (map (lambda (d_1ha)
                                                               (cons er_1g3
                                                                     d_1ha))
                                                             forms_1h9)
                                                        r_1fl
                                                        *exports_1h8
                                                        (flatten-exports_d6
                                                          *exports_1h8)
                                                        ctem_1fo
                                                        (lambda (*bindings_1hb
                                                                 *inits_1hc)
                                                          ((lambda (iface_1hd)
                                                             ((lambda (bindings_1he)
                                                                ((lambda (inits_1hf)
                                                                   (if id_1h7
                                                                     ((lambda (label_1hg
                                                                               imps_1hh)
                                                                        (begin
                                                                          (extend-store!_dt
                                                                            r_1fl
                                                                            (get-indirect-label_av
                                                                              label_1hg)
                                                                            (make-binding_8m
                                                                              'module
                                                                              iface_1hd))
                                                                          (extend-ribcage!_c3
                                                                            ribcage_1fi
                                                                            id_1h7
                                                                            label_1hg)
                                                                          (parse_1ft
                                                                            (cdr body_1fu)
                                                                            (cons id_1h7
                                                                                  ids_1fv)
                                                                            (cons (make-module-binding_df
                                                                                    type_1g4
                                                                                    id_1h7
                                                                                    label_1hg
                                                                                    imps_1hh
                                                                                    *exports_1h8)
                                                                                  bindings_1he)
                                                                            inits_1hf)))
                                                                      (gen-indirect-label_au)
                                                                      (get-implicit-exports_1fr
                                                                        id_1h7))
                                                                     (begin
                                                                       (do-import!_ef
                                                                         iface_1hd
                                                                         ribcage_1fi)
                                                                       (parse_1ft
                                                                         (cdr body_1fu)
                                                                         (cons iface_1hd
                                                                               ids_1fv)
                                                                         bindings_1he
                                                                         inits_1hf))))
                                                                 (append
                                                                   inits_1g1
                                                                   *inits_1hc)))
                                                              (append
                                                                (if id_1h7
                                                                  *bindings_1hb
                                                                  (update-imp-exports_1fs
                                                                    *bindings_1hb
                                                                    *exports_1h8))
                                                                bindings_1g0)))
                                                           (make-trimmed-interface_dd
                                                             *exports_1h8)))))))
                                                (make-wrap_9r
                                                  (wrap-marks_9s w_1g7)
                                                  (cons *ribcage_1h5
                                                        (wrap-subst_9t
                                                          w_1g7)))))
                                             (make-ribcage_b4 '() '() '()))
                                            (if (eqv? type_1g4 'import-form)
                                              (parse-import_eh
                                                e_1g6
                                                w_1g7
                                                s_1g8
                                                (lambda (mid_1h0)
                                                  ((lambda (mlabel_1h1)
                                                     ((lambda (binding_1h2)
                                                        ((lambda (t_1h3)
                                                           (if (eqv? t_1h3
                                                                     'module)
                                                             ((lambda (iface_1h4)
                                                                (begin
                                                                  (if value_1g5
                                                                    (extend-ribcage-barrier!_c4
                                                                      ribcage_1fi
                                                                      value_1g5)
                                                                    (void))
                                                                  (do-import!_ef
                                                                    iface_1h4
                                                                    ribcage_1fi)
                                                                  (parse_1ft
                                                                    (cdr body_1fu)
                                                                    (cons iface_1h4
                                                                          ids_1fv)
                                                                    (update-imp-exports_1fs
                                                                      bindings_1g0
                                                                      (vector->list
                                                                        (interface-exports_d9
                                                                          iface_1h4)))
                                                                    inits_1g1)))
                                                              (binding-value_8o
                                                                binding_1h2))
                                                             (if (eqv? t_1h3
                                                                       'displaced-lexical)
                                                               (displaced-lexical-error_99
                                                                 mid_1h0)
                                                               (syntax-error
                                                                 mid_1h0
                                                                 '"import from unknown module"))))
                                                         (binding-type_8n
                                                           binding_1h2)))
                                                      (lookup_9c
                                                        mlabel_1h1
                                                        r_1fl)))
                                                   (id-var-name_ch
                                                     mid_1h0
                                                     '(())))))
                                              (if (eqv? type_1g4 'begin-form)
                                                ((lambda (tmp_1gq)
                                                   (if tmp_1gq
                                                     (apply (lambda (__1gr
                                                                     e1_1gs)
                                                              (parse_1ft
                                                                ((letrec ((f_1gt (lambda (forms_1gu)
                                                                                   (if (null? forms_1gu)
                                                                                     (cdr body_1fu)
                                                                                     (cons (cons er_1g3
                                                                                                 (wrap_cu
                                                                                                   (car forms_1gu)
                                                                                                   w_1g7))
                                                                                           (f_1gt (cdr forms_1gu)))))))
                                                                   f_1gt)
                                                                 e1_1gs)
                                                                ids_1fv
                                                                bindings_1g0
                                                                inits_1g1))
                                                            tmp_1gq)
                                                     (syntax-error e_1g6)))
                                                 ($syntax-dispatch
                                                   (compile-in-annotation
                                                     e_1g6
                                                     value)
                                                   '(any . each-any)))
                                                (if (eqv? type_1g4
                                                          'eval-when-form)
                                                  ((lambda (tmp_1gh)
                                                     (if tmp_1gh
                                                       (apply (lambda (__1gi
                                                                       x_1gj
                                                                       e1_1gk)
                                                                (parse_1ft
                                                                  (if (memq 'eval
                                                                            (chi-when-list_d2
                                                                              x_1gj
                                                                              w_1g7))
                                                                    ((letrec ((f_1gl (lambda (forms_1gm)
                                                                                       (if (null? forms_1gm)
                                                                                         (cdr body_1fu)
                                                                                         (cons (cons er_1g3
                                                                                                     (wrap_cu
                                                                                                       (car forms_1gm)
                                                                                                       w_1g7))
                                                                                               (f_1gl (cdr forms_1gm)))))))
                                                                       f_1gl)
                                                                     e1_1gk)
                                                                    (cdr body_1fu))
                                                                  ids_1fv
                                                                  bindings_1g0
                                                                  inits_1g1))
                                                              tmp_1gh)
                                                       (syntax-error e_1g6)))
                                                   ($syntax-dispatch
                                                     (compile-in-annotation
                                                       e_1g6
                                                       value)
                                                     '(any each-any
                                                           .
                                                           each-any)))
                                                  (if (eqv? type_1g4
                                                            'local-syntax-form)
                                                    (chi-local-syntax_el
                                                      value_1g5
                                                      e_1g6
                                                      er_1g3
                                                      w_1g7
                                                      s_1g8
                                                      (lambda (forms_1ga
                                                               er_1gb
                                                               w_1gc
                                                               s_1gd)
                                                        (parse_1ft
                                                          ((letrec ((f_1ge (lambda (forms_1gf)
                                                                             (if (null? forms_1gf)
                                                                               (cdr body_1fu)
                                                                               (cons (cons er_1gb
                                                                                           (wrap_cu
                                                                                             (car forms_1gf)
                                                                                             w_1gc))
                                                                                     (f_1ge (cdr forms_1gf)))))))
                                                             f_1ge)
                                                           forms_1ga)
                                                          ids_1fv
                                                          bindings_1g0
                                                          inits_1g1)))
                                                    (return_1fq
                                                      bindings_1g0
                                                      ids_1fv
                                                      (append
                                                        inits_1g1
                                                        (cons (cons er_1g3
                                                                    (source-wrap_cv
                                                                      e_1g6
                                                                      w_1g7
                                                                      s_1g8))
                                                              (cdr body_1fu))))))))))))))
                                (cdar body_1fu)
                                (caar body_1fu))))))
                  parse_1ft)
                body_1fk
                '()
                '()
                '()))))
         (check-defined-ids_dv
           (lambda (source-exp_1e6 ls_1e7)
             (letrec ((b-i=?_1e8
                        (lambda (x_1ek y_1el)
                          (if (symbol? x_1ek)
                            (if (symbol? y_1el)
                              (eq? x_1ek y_1el)
                              (if (eq? x_1ek
                                       ((lambda (e_1ep)
                                          (if (annotation? e_1ep)
                                            (annotation-expression e_1ep)
                                            e_1ep))
                                        (if (syntax-object?_7r y_1el)
                                          (syntax-object-expression_7s y_1el)
                                          y_1el)))
                                (same-marks?_cd
                                  (wrap-marks_9s (syntax-object-wrap_7t y_1el))
                                  (wrap-marks_9s '((top))))
                                '#f))
                            (if (symbol? y_1el)
                              (if (eq? y_1el
                                       ((lambda (e_1en)
                                          (if (annotation? e_1en)
                                            (annotation-expression e_1en)
                                            e_1en))
                                        (if (syntax-object?_7r x_1ek)
                                          (syntax-object-expression_7s x_1ek)
                                          x_1ek)))
                                (same-marks?_cd
                                  (wrap-marks_9s (syntax-object-wrap_7t x_1ek))
                                  (wrap-marks_9s '((top))))
                                '#f)
                              (bound-id=?_ck x_1ek y_1el)))))
                      (vfold_1e9
                        (lambda (v_1eq p_1er cls_1es)
                          ((lambda (len_1et)
                             ((letrec ((lp_1eu
                                         (lambda (i_1ev cls_1f0)
                                           (if (= i_1ev len_1et)
                                             cls_1f0
                                             (lp_1eu
                                               (+ i_1ev '1)
                                               (p_1er (vector-ref v_1eq i_1ev)
                                                      cls_1f0))))))
                                lp_1eu)
                              '0
                              cls_1es))
                           (vector-length v_1eq))))
                      (conflicts_1ea
                        (lambda (x_1f1 y_1f2 cls_1f3)
                          (if (interface?_d8 x_1f1)
                            (if (interface?_d8 y_1f2)
                              (call-with-values
                                (lambda ()
                                  ((lambda (xe_1f4 ye_1f5)
                                     (if (> (vector-length xe_1f4)
                                            (vector-length ye_1f5))
                                       (values x_1f1 ye_1f5)
                                       (values y_1f2 xe_1f4)))
                                   (interface-exports_d9 x_1f1)
                                   (interface-exports_d9 y_1f2)))
                                (lambda (iface_1f6 exports_1f7)
                                  (vfold_1e9
                                    exports_1f7
                                    (lambda (id_1f8 cls_1f9)
                                      (id-iface-conflicts_1eb
                                        id_1f8
                                        iface_1f6
                                        cls_1f9))
                                    cls_1f3)))
                              (id-iface-conflicts_1eb y_1f2 x_1f1 cls_1f3))
                            (if (interface?_d8 y_1f2)
                              (id-iface-conflicts_1eb x_1f1 y_1f2 cls_1f3)
                              (if (b-i=?_1e8 x_1f1 y_1f2)
                                (cons x_1f1 cls_1f3)
                                cls_1f3)))))
                      (id-iface-conflicts_1eb
                        (lambda (id_1fa iface_1fb cls_1fc)
                          ((lambda (token_1fd)
                             (if token_1fd
                               (if (lookup-import-binding-name_c7
                                     ((lambda (e_1fh)
                                        (if (annotation? e_1fh)
                                          (annotation-expression e_1fh)
                                          e_1fh))
                                      (if (syntax-object?_7r id_1fa)
                                        (syntax-object-expression_7s id_1fa)
                                        id_1fa))
                                     token_1fd
                                     (if (symbol? id_1fa)
                                       (wrap-marks_9s '((top)))
                                       (wrap-marks_9s
                                         (syntax-object-wrap_7t id_1fa))))
                                 (cons id_1fa cls_1fc)
                                 cls_1fc)
                               (vfold_1e9
                                 (interface-exports_d9 iface_1fb)
                                 (lambda (*id_1fe cls_1ff)
                                   (if (b-i=?_1e8 *id_1fe id_1fa)
                                     (cons *id_1fe cls_1ff)
                                     cls_1ff))
                                 cls_1fc)))
                           (interface-token_da iface_1fb)))))
               (if (null? ls_1e7)
                 (void)
                 ((letrec ((lp_1ec
                             (lambda (x_1ed ls_1ee cls_1ef)
                               (if (null? ls_1ee)
                                 (if (null? cls_1ef)
                                   (void)
                                   ((lambda (cls_1ej)
                                      (syntax-error
                                        source-exp_1e6
                                        '"duplicate definition for "
                                        (symbol->string (car cls_1ej))
                                        '" in"))
                                    (syntax-object->datum cls_1ef)))
                                 ((letrec ((lp2_1eg
                                             (lambda (ls2_1eh cls_1ei)
                                               (if (null? ls2_1eh)
                                                 (lp_1ec
                                                   (car ls_1ee)
                                                   (cdr ls_1ee)
                                                   cls_1ei)
                                                 (lp2_1eg
                                                   (cdr ls2_1eh)
                                                   (conflicts_1ea
                                                     x_1ed
                                                     (car ls2_1eh)
                                                     cls_1ei))))))
                                    lp2_1eg)
                                  ls_1ee
                                  cls_1ef)))))
                    lp_1ec)
                  (car ls_1e7)
                  (cdr ls_1e7)
                  '())))))
         (check-module-exports_du
           (lambda (source-exp_1dj fexports_1dk ids_1dl)
             (letrec ((defined?_1dm
                        (lambda (e_1ds ids_1dt)
                          (ormap (lambda (x_1du)
                                   (if (interface?_d8 x_1du)
                                     ((lambda (token_1dv)
                                        (if token_1dv
                                          (lookup-import-binding-name_c7
                                            ((lambda (e_1e5)
                                               (if (annotation? e_1e5)
                                                 (annotation-expression e_1e5)
                                                 e_1e5))
                                             (if (syntax-object?_7r e_1ds)
                                               (syntax-object-expression_7s
                                                 e_1ds)
                                               e_1ds))
                                            token_1dv
                                            (wrap-marks_9s
                                              (syntax-object-wrap_7t e_1ds)))
                                          ((lambda (v_1e0)
                                             ((letrec ((lp_1e1
                                                         (lambda (i_1e2)
                                                           (if (>= i_1e2 '0)
                                                             ((lambda (t_1e3)
                                                                (if t_1e3
                                                                  t_1e3
                                                                  (lp_1e1
                                                                    (- i_1e2
                                                                       '1))))
                                                              (bound-id=?_ck
                                                                e_1ds
                                                                (vector-ref
                                                                  v_1e0
                                                                  i_1e2)))
                                                             '#f))))
                                                lp_1e1)
                                              (- (vector-length v_1e0) '1)))
                                           (interface-exports_d9 x_1du))))
                                      (interface-token_da x_1du))
                                     (bound-id=?_ck e_1ds x_1du)))
                                 ids_1dt))))
               ((letrec ((loop_1dn
                           (lambda (fexports_1do missing_1dp)
                             (if (null? fexports_1do)
                               (if (null? missing_1dp)
                                 (void)
                                 (syntax-error
                                   missing_1dp
                                   '"missing definition for export(s)"))
                               ((lambda (e_1dq fexports_1dr)
                                  (if (defined?_1dm e_1dq ids_1dl)
                                    (loop_1dn fexports_1dr missing_1dp)
                                    (loop_1dn
                                      fexports_1dr
                                      (cons e_1dq missing_1dp))))
                                (car fexports_1do)
                                (cdr fexports_1do))))))
                  loop_1dn)
                fexports_1dk
                '()))))
         (extend-store!_dt
           (lambda (r_1dg label_1dh binding_1di)
             (set-cdr!
               r_1dg
               (extend-env_95 label_1dh binding_1di (cdr r_1dg)))))
         (id-set-diff_ds
           (lambda (exports_1de defs_1df)
             (if (null? exports_1de)
               '()
               (if (bound-id-member?_ct (car exports_1de) defs_1df)
                 (id-set-diff_ds (cdr exports_1de) defs_1df)
                 (cons (car exports_1de)
                       (id-set-diff_ds (cdr exports_1de) defs_1df))))))
         (chi-top-module_dr
           (lambda (e_1b1
                    r_1b2
                    ribcage_1b3
                    w_1b4
                    s_1b5
                    ctem_1b6
                    rtem_1b7
                    id_1b8
                    exports_1b9
                    forms_1ba)
             ((lambda (fexports_1bb)
                (chi-external_e0
                  ribcage_1b3
                  (source-wrap_cv e_1b1 w_1b4 s_1b5)
                  (map (lambda (d_1bc) (cons r_1b2 d_1bc))
                       forms_1ba)
                  r_1b2
                  exports_1b9
                  fexports_1bb
                  ctem_1b6
                  (lambda (bindings_1bd inits_1be)
                    ((letrec ((partition_1bf
                                (lambda (fexports_1bg
                                         bs_1bh
                                         svs_1bi
                                         ses_1bj
                                         ctdefs_1bk)
                                  (if (null? fexports_1bg)
                                    ((letrec ((partition_1cd
                                                (lambda (bs_1ce
                                                         dvs_1cf
                                                         des_1cg)
                                                  (if (null? bs_1ce)
                                                    ((lambda (ses_1ck
                                                              des_1cl
                                                              inits_1cm)
                                                       (begin
                                                         (for-each
                                                           (lambda (x_1cn)
                                                             (apply (lambda (t_1co
                                                                             label_1cp
                                                                             sym_1cq
                                                                             val_1cr)
                                                                      (if label_1cp
                                                                        (set-indirect-label!_b0
                                                                          label_1cp
                                                                          sym_1cq)
                                                                        (void)))
                                                                    x_1cn))
                                                           ctdefs_1bk)
                                                         (build-sequence_7c
                                                           '#f
                                                           (list (ct-eval/residualize_e7
                                                                   ctem_1b6
                                                                   (lambda ()
                                                                     (if (null? ctdefs_1bk)
                                                                       (chi-void_em)
                                                                       (build-sequence_7c
                                                                         '#f
                                                                         (map (lambda (x_1cs)
                                                                                (apply (lambda (t_1ct
                                                                                                label_1cu
                                                                                                sym_1cv
                                                                                                val_1d0)
                                                                                         (list '$sc-put-cte
                                                                                               (list 'quote
                                                                                                     sym_1cv)
                                                                                               (if (eq? t_1ct
                                                                                                        'define-syntax-form)
                                                                                                 val_1d0
                                                                                                 (list 'quote
                                                                                                       (make-binding_8m
                                                                                                         'module
                                                                                                         (make-resolved-interface_de
                                                                                                           val_1d0
                                                                                                           sym_1cv))))))
                                                                                       x_1cs))
                                                                              ctdefs_1bk)))))
                                                                 (ct-eval/residualize_e7
                                                                   ctem_1b6
                                                                   (lambda ()
                                                                     ((lambda (n_1d1)
                                                                        ((lambda (token_1d2)
                                                                           ((lambda (b_1d3)
                                                                              (if n_1d1
                                                                                (list '$sc-put-cte
                                                                                      (list 'quote
                                                                                            (if (same-marks?_cd
                                                                                                  (wrap-marks_9s
                                                                                                    (syntax-object-wrap_7t
                                                                                                      id_1b8))
                                                                                                  (wrap-marks_9s
                                                                                                    '((top))))
                                                                                              n_1d1
                                                                                              ((lambda (marks_1d5)
                                                                                                 (make-syntax-object_7q
                                                                                                   n_1d1
                                                                                                   (make-wrap_9r
                                                                                                     marks_1d5
                                                                                                     (list (make-ribcage_b4
                                                                                                             (vector
                                                                                                               n_1d1)
                                                                                                             (vector
                                                                                                               marks_1d5)
                                                                                                             (vector
                                                                                                               (generate-module-id_49
                                                                                                                 n_1d1)))))))
                                                                                               (wrap-marks_9s
                                                                                                 (syntax-object-wrap_7t
                                                                                                   id_1b8)))))
                                                                                      b_1d3)
                                                                                ((lambda (n_1d4)
                                                                                   (build-sequence_7c
                                                                                     '#f
                                                                                     (list (list '$sc-put-cte
                                                                                                 (list 'quote
                                                                                                       n_1d4)
                                                                                                 b_1d3)
                                                                                           (do-top-import_e3
                                                                                             n_1d4
                                                                                             token_1d2))))
                                                                                 (generate-id_48
                                                                                   'tmp))))
                                                                            (list 'quote
                                                                                  (make-binding_8m
                                                                                    'module
                                                                                    (make-resolved-interface_de
                                                                                      exports_1b9
                                                                                      token_1d2)))))
                                                                         (generate-module-id_49
                                                                           n_1d1)))
                                                                      (if id_1b8
                                                                        ((lambda (e_1d7)
                                                                           (if (annotation?
                                                                                 e_1d7)
                                                                             (annotation-expression
                                                                               e_1d7)
                                                                             e_1d7))
                                                                         (if (syntax-object?_7r
                                                                               id_1b8)
                                                                           (syntax-object-expression_7s
                                                                             id_1b8)
                                                                           id_1b8))
                                                                        '#f))))
                                                                 (if (null? svs_1bi)
                                                                   (chi-void_em)
                                                                   (build-sequence_7c
                                                                     '#f
                                                                     (map (lambda (v_1d8)
                                                                            (list 'define
                                                                                  v_1d8
                                                                                  (chi-void_em)))
                                                                          svs_1bi)))
                                                                 (rt-eval/residualize_e6
                                                                   rtem_1b7
                                                                   (lambda ()
                                                                     (build-body_7e
                                                                       '#f
                                                                       dvs_1cf
                                                                       des_1cl
                                                                       (build-sequence_7c
                                                                         '#f
                                                                         (list (if (null? svs_1bi)
                                                                                 (chi-void_em)
                                                                                 (build-sequence_7c
                                                                                   '#f
                                                                                   (map (lambda (v_1d9
                                                                                                 e_1da)
                                                                                          (list 'set!
                                                                                                v_1d9
                                                                                                e_1da))
                                                                                        svs_1bi
                                                                                        ses_1ck)))
                                                                               (if (null? inits_1cm)
                                                                                 (chi-void_em)
                                                                                 (build-sequence_7c
                                                                                   '#f
                                                                                   inits_1cm)))))))
                                                                 (chi-void_em)))))
                                                     (map (lambda (x_1db)
                                                            (chi_e8
                                                              (cdr x_1db)
                                                              (car x_1db)
                                                              '(())))
                                                          ses_1bj)
                                                     (map (lambda (x_1dc)
                                                            (chi_e8
                                                              (cdr x_1dc)
                                                              (car x_1dc)
                                                              '(())))
                                                          des_1cg)
                                                     (map (lambda (x_1dd)
                                                            (chi_e8
                                                              (cdr x_1dd)
                                                              (car x_1dd)
                                                              '(())))
                                                          inits_1be))
                                                    ((lambda (b_1ch)
                                                       ((lambda (t_1ci)
                                                          (if (eqv? t_1ci
                                                                    'define-form)
                                                            ((lambda (var_1cj)
                                                               (begin
                                                                 (extend-store!_dt
                                                                   r_1b2
                                                                   (get-indirect-label_av
                                                                     (module-binding-label_dj
                                                                       b_1ch))
                                                                   (make-binding_8m
                                                                     'lexical
                                                                     var_1cj))
                                                                 (partition_1cd
                                                                   (cdr bs_1ce)
                                                                   (cons var_1cj
                                                                         dvs_1cf)
                                                                   (cons (module-binding-val_dl
                                                                           b_1ch)
                                                                         des_1cg))))
                                                             (gen-var_er
                                                               (module-binding-id_di
                                                                 b_1ch)))
                                                            (if (memv t_1ci
                                                                      '(define-syntax-form
                                                                         module-form))
                                                              (partition_1cd
                                                                (cdr bs_1ce)
                                                                dvs_1cf
                                                                des_1cg)
                                                              (error 'sc-expand-internal
                                                                     '"unexpected module binding type"))))
                                                        (module-binding-type_dh
                                                          b_1ch)))
                                                     (car bs_1ce))))))
                                       partition_1cd)
                                     bs_1bh
                                     '()
                                     '())
                                    ((lambda (module-id_1bl
                                              id_1bm
                                              fexports_1bn)
                                       (letrec ((pluck-binding_1bo
                                                  (lambda (id_1c4
                                                           bs_1c5
                                                           succ_1c6
                                                           fail_1c7)
                                                    ((letrec ((loop_1c8
                                                                (lambda (bs_1c9
                                                                         new-bs_1ca)
                                                                  (if (null? bs_1c9)
                                                                    (fail_1c7)
                                                                    (if (free-id=?_ci
                                                                          (module-binding-id_di
                                                                            (car bs_1c9))
                                                                          id_1c4)
                                                                      (succ_1c6
                                                                        (car bs_1c9)
                                                                        (smart-append_ca
                                                                          (reverse
                                                                            new-bs_1ca)
                                                                          (cdr bs_1c9)))
                                                                      (loop_1c8
                                                                        (cdr bs_1c9)
                                                                        (cons (car bs_1c9)
                                                                              new-bs_1ca)))))))
                                                       loop_1c8)
                                                     bs_1c5
                                                     '()))))
                                         (pluck-binding_1bo
                                           id_1bm
                                           bs_1bh
                                           (lambda (b_1bp bs_1bq)
                                             ((lambda (t_1br
                                                       label_1bs
                                                       imps_1bt)
                                                ((lambda (fexports_1bu sym_1bv)
                                                   (if (eqv? t_1br
                                                             'define-form)
                                                     (begin
                                                       (set-indirect-label!_b0
                                                         label_1bs
                                                         sym_1bv)
                                                       (partition_1bf
                                                         fexports_1bu
                                                         bs_1bq
                                                         (cons sym_1bv svs_1bi)
                                                         (cons (module-binding-val_dl
                                                                 b_1bp)
                                                               ses_1bj)
                                                         ctdefs_1bk))
                                                     (if (eqv? t_1br
                                                               'define-syntax-form)
                                                       (partition_1bf
                                                         fexports_1bu
                                                         bs_1bq
                                                         svs_1bi
                                                         ses_1bj
                                                         (cons (list t_1br
                                                                     label_1bs
                                                                     sym_1bv
                                                                     (module-binding-val_dl
                                                                       b_1bp))
                                                               ctdefs_1bk))
                                                       (if (eqv? t_1br
                                                                 'module-form)
                                                         ((lambda (exports_1c1)
                                                            (partition_1bf
                                                              (append
                                                                (flatten-exports_d6
                                                                  exports_1c1)
                                                                fexports_1bu)
                                                              bs_1bq
                                                              svs_1bi
                                                              ses_1bj
                                                              (cons (list t_1br
                                                                          label_1bs
                                                                          sym_1bv
                                                                          exports_1c1)
                                                                    ctdefs_1bk)))
                                                          (module-binding-val_dl
                                                            b_1bp))
                                                         (error 'sc-expand-internal
                                                                '"unexpected module binding type")))))
                                                 (append imps_1bt fexports_1bn)
                                                 (generate-module-id_49
                                                   module-id_1bl
                                                   ((lambda (e_1c3)
                                                      (if (annotation? e_1c3)
                                                        (annotation-expression
                                                          e_1c3)
                                                        e_1c3))
                                                    (if (syntax-object?_7r
                                                          id_1bm)
                                                      (syntax-object-expression_7s
                                                        id_1bm)
                                                      id_1bm)))))
                                              (module-binding-type_dh b_1bp)
                                              (module-binding-label_dj b_1bp)
                                              (module-binding-imps_dk b_1bp)))
                                           (lambda ()
                                             (partition_1bf
                                               fexports_1bn
                                               bs_1bh
                                               svs_1bi
                                               ses_1bj
                                               ctdefs_1bk)))))
                                     (if id_1b8
                                       ((lambda (e_1cc)
                                          (if (annotation? e_1cc)
                                            (annotation-expression e_1cc)
                                            e_1cc))
                                        (if (syntax-object?_7r id_1b8)
                                          (syntax-object-expression_7s id_1b8)
                                          id_1b8))
                                       '#f)
                                     (car fexports_1bg)
                                     (cdr fexports_1bg))))))
                       partition_1bf)
                     fexports_1bb
                     bindings_1bd
                     '()
                     '()
                     '()))))
              (flatten-exports_d6 exports_1b9))))
         (module-binding-val_dl
           (lambda (x_1am) (vector-ref x_1am '5)))
         (module-binding-imps_dk
           (lambda (x_1al) (vector-ref x_1al '4)))
         (module-binding-label_dj
           (lambda (x_1ak) (vector-ref x_1ak '3)))
         (module-binding-id_di
           (lambda (x_1aj) (vector-ref x_1aj '2)))
         (module-binding-type_dh
           (lambda (x_1ai) (vector-ref x_1ai '1)))
         (make-module-binding_df
           (lambda (type_1ac id_1ad label_1ae imps_1af val_1ag)
             (vector
               'module-binding
               type_1ac
               id_1ad
               label_1ae
               imps_1af
               val_1ag)))
         (make-resolved-interface_de
           (lambda (exports_1a9 import-token_1aa)
             (make-interface_d7
               (list->vector
                 (map (lambda (x_1ab)
                        (make-trimmed-syntax-object_c9
                          (if (pair? x_1ab) (car x_1ab) x_1ab)))
                      exports_1a9))
               import-token_1aa)))
         (make-trimmed-interface_dd
           (lambda (exports_1a7)
             (make-interface_d7
               (list->vector
                 (map (lambda (x_1a8)
                        (if (pair? x_1a8) (car x_1a8) x_1a8))
                      exports_1a7))
               '#f)))
         (interface-token_da
           (lambda (x_1a2) (vector-ref x_1a2 '2)))
         (interface-exports_d9
           (lambda (x_1a1) (vector-ref x_1a1 '1)))
         (interface?_d8
           (lambda (x_1a0)
             (if (vector? x_1a0)
               (if (= (vector-length x_1a0) '3)
                 (eq? (vector-ref x_1a0 '0) 'interface)
                 '#f)
               '#f)))
         (make-interface_d7
           (lambda (exports_19u token_19v)
             (vector 'interface exports_19u token_19v)))
         (flatten-exports_d6
           (lambda (exports_19q)
             ((letrec ((loop_19r
                         (lambda (exports_19s ls_19t)
                           (if (null? exports_19s)
                             ls_19t
                             (loop_19r
                               (cdr exports_19s)
                               (if (pair? (car exports_19s))
                                 (loop_19r (car exports_19s) ls_19t)
                                 (cons (car exports_19s) ls_19t)))))))
                loop_19r)
              exports_19q
              '())))
         (chi-top_d5
           (lambda (e_17k
                    r_17l
                    w_17m
                    ctem_17n
                    rtem_17o
                    top-ribcage_17p)
             (call-with-values
               (lambda ()
                 (syntax-type_d3
                   e_17k
                   r_17l
                   w_17m
                   '#f
                   top-ribcage_17p))
               (lambda (type_17q value_17r e_17s w_17t s_17u)
                 (if (eqv? type_17q 'begin-form)
                   ((lambda (tmp_19j)
                      (if tmp_19j
                        (apply (lambda (__19p) (chi-void_em)) tmp_19j)
                        ((lambda (tmp_19k)
                           (if tmp_19k
                             (apply (lambda (__19l e1_19m e2_19n)
                                      (chi-top-sequence_d1
                                        (cons e1_19m e2_19n)
                                        r_17l
                                        w_17t
                                        s_17u
                                        ctem_17n
                                        rtem_17o
                                        top-ribcage_17p))
                                    tmp_19k)
                             (syntax-error e_17s)))
                         ($syntax-dispatch
                           (compile-in-annotation e_17s value)
                           '(any any . each-any)))))
                    ($syntax-dispatch
                      (compile-in-annotation e_17s value)
                      '(any)))
                   (if (eqv? type_17q 'local-syntax-form)
                     (chi-local-syntax_el
                       value_17r
                       e_17s
                       r_17l
                       w_17t
                       s_17u
                       (lambda (body_19e r_19f w_19g s_19h)
                         (chi-top-sequence_d1
                           body_19e
                           r_19f
                           w_19g
                           s_19h
                           ctem_17n
                           rtem_17o
                           top-ribcage_17p)))
                     (if (eqv? type_17q 'eval-when-form)
                       ((lambda (tmp_193)
                          (if tmp_193
                            (apply (lambda (__194 x_195 e1_196 e2_197)
                                     ((lambda (when-list_198 body_199)
                                        ((lambda (ctem_19a rtem_19b)
                                           (if (if (null? ctem_19a)
                                                 (null? rtem_19b)
                                                 '#f)
                                             (chi-void_em)
                                             (chi-top-sequence_d1
                                               body_199
                                               r_17l
                                               w_17t
                                               s_17u
                                               ctem_19a
                                               rtem_19b
                                               top-ribcage_17p)))
                                         (update-mode-set_e4
                                           when-list_198
                                           ctem_17n)
                                         (update-mode-set_e4
                                           when-list_198
                                           rtem_17o)))
                                      (chi-when-list_d2 x_195 w_17t)
                                      (cons e1_196 e2_197)))
                                   tmp_193)
                            (syntax-error e_17s)))
                        ($syntax-dispatch
                          (compile-in-annotation e_17s value)
                          '(any each-any any . each-any)))
                       (if (eqv? type_17q 'define-syntax-form)
                         (parse-define-syntax_ej
                           e_17s
                           w_17t
                           s_17u
                           (lambda (id_18n rhs_18o w_18p)
                             ((lambda (id_18q)
                                (begin
                                  ((lambda (n_18r)
                                     ((lambda (b_18s)
                                        ((lambda (t_18t)
                                           (if (memv t_18t
                                                     '(displaced-lexical))
                                             (displaced-lexical-error_99
                                               id_18q)
                                             (void)))
                                         (binding-type_8n b_18s)))
                                      (lookup_9c n_18r r_17l)))
                                   (id-var-name_ch id_18q '(())))
                                  (ct-eval/residualize_e7
                                    ctem_17n
                                    (lambda ()
                                      (list '$sc-put-cte
                                            (list 'quote
                                                  ((lambda (sym_18u)
                                                     (if (same-marks?_cd
                                                           (wrap-marks_9s
                                                             (syntax-object-wrap_7t
                                                               id_18q))
                                                           (wrap-marks_9s
                                                             '((top))))
                                                       sym_18u
                                                       ((lambda (marks_18v)
                                                          (make-syntax-object_7q
                                                            sym_18u
                                                            (make-wrap_9r
                                                              marks_18v
                                                              (list (make-ribcage_b4
                                                                      (vector
                                                                        sym_18u)
                                                                      (vector
                                                                        marks_18v)
                                                                      (vector
                                                                        (generate-id_48
                                                                          sym_18u)))))))
                                                        (wrap-marks_9s
                                                          (syntax-object-wrap_7t
                                                            id_18q)))))
                                                   ((lambda (e_191)
                                                      (if (annotation? e_191)
                                                        (annotation-expression
                                                          e_191)
                                                        e_191))
                                                    (if (syntax-object?_7r
                                                          id_18q)
                                                      (syntax-object-expression_7s
                                                        id_18q)
                                                      id_18q))))
                                            (chi_e8
                                              rhs_18o
                                              (transformer-env_98 r_17l)
                                              w_18p))))))
                              (wrap_cu id_18n w_18p))))
                         (if (eqv? type_17q 'define-form)
                           (parse-define_ei
                             e_17s
                             w_17t
                             s_17u
                             (lambda (id_18b rhs_18c w_18d)
                               ((lambda (id_18e)
                                  (begin
                                    ((lambda (n_18f)
                                       ((lambda (b_18g)
                                          ((lambda (t_18h)
                                             (if (memv t_18h
                                                       '(displaced-lexical))
                                               (displaced-lexical-error_99
                                                 id_18e)
                                               (void)))
                                           (binding-type_8n b_18g)))
                                        (lookup_9c n_18f r_17l)))
                                     (id-var-name_ch id_18e '(())))
                                    ((lambda (sym_18i)
                                       ((lambda (valsym_18j)
                                          (build-sequence_7c
                                            '#f
                                            (list (ct-eval/residualize_e7
                                                    ctem_17n
                                                    (lambda ()
                                                      (list '$sc-put-cte
                                                            (list 'quote
                                                                  (if (eq? sym_18i
                                                                           valsym_18j)
                                                                    sym_18i
                                                                    ((lambda (marks_18k)
                                                                       (make-syntax-object_7q
                                                                         sym_18i
                                                                         (make-wrap_9r
                                                                           marks_18k
                                                                           (list (make-ribcage_b4
                                                                                   (vector
                                                                                     sym_18i)
                                                                                   (vector
                                                                                     marks_18k)
                                                                                   (vector
                                                                                     valsym_18j))))))
                                                                     (wrap-marks_9s
                                                                       (syntax-object-wrap_7t
                                                                         id_18e)))))
                                                            (list 'quote
                                                                  (make-binding_8m
                                                                    'global
                                                                    valsym_18j)))))
                                                  (rt-eval/residualize_e6
                                                    rtem_17o
                                                    (lambda ()
                                                      (if s_17u
                                                        (list 'compile-in-annotation
                                                              (list 'define
                                                                    valsym_18j
                                                                    (chi_e8
                                                                      rhs_18c
                                                                      r_17l
                                                                      w_18d))
                                                              s_17u)
                                                        (list 'define
                                                              valsym_18j
                                                              (chi_e8
                                                                rhs_18c
                                                                r_17l
                                                                w_18d))))))))
                                        (if (same-marks?_cd
                                              (wrap-marks_9s
                                                (syntax-object-wrap_7t id_18e))
                                              (wrap-marks_9s '((top))))
                                          sym_18i
                                          (generate-id_48 sym_18i))))
                                     ((lambda (e_18m)
                                        (if (annotation? e_18m)
                                          (annotation-expression e_18m)
                                          e_18m))
                                      (if (syntax-object?_7r id_18e)
                                        (syntax-object-expression_7s id_18e)
                                        id_18e)))))
                                (wrap_cu id_18b w_18d))))
                           (if (eqv? type_17q 'module-form)
                             ((lambda (r_183 ribcage_184)
                                (parse-module_eg
                                  e_17s
                                  w_17t
                                  s_17u
                                  (make-wrap_9r
                                    (wrap-marks_9s w_17t)
                                    (cons ribcage_184 (wrap-subst_9t w_17t)))
                                  (lambda (id_185 exports_186 forms_187)
                                    (if id_185
                                      (begin
                                        ((lambda (n_188)
                                           ((lambda (b_189)
                                              ((lambda (t_18a)
                                                 (if (memv t_18a
                                                           '(displaced-lexical))
                                                   (displaced-lexical-error_99
                                                     (wrap_cu id_185 w_17t))
                                                   (void)))
                                               (binding-type_8n b_189)))
                                            (lookup_9c n_188 r_183)))
                                         (id-var-name_ch id_185 '(())))
                                        (chi-top-module_dr
                                          e_17s
                                          r_183
                                          ribcage_184
                                          w_17t
                                          s_17u
                                          ctem_17n
                                          rtem_17o
                                          id_185
                                          exports_186
                                          forms_187))
                                      (chi-top-module_dr
                                        e_17s
                                        r_183
                                        ribcage_184
                                        w_17t
                                        s_17u
                                        ctem_17n
                                        rtem_17o
                                        '#f
                                        exports_186
                                        forms_187)))))
                              (cons '("top-level module placeholder"
                                      placeholder)
                                    r_17l)
                              (make-ribcage_b4 '() '() '()))
                             (if (eqv? type_17q 'import-form)
                               (parse-import_eh
                                 e_17s
                                 w_17t
                                 s_17u
                                 (lambda (mid_180)
                                   (ct-eval/residualize_e7
                                     ctem_17n
                                     (lambda ()
                                       (begin
                                         (if value_17r
                                           (syntax-error
                                             (source-wrap_cv e_17s w_17t s_17u)
                                             '"not valid at top-level")
                                           (void))
                                         ((lambda (binding_181)
                                            ((lambda (t_182)
                                               (if (eqv? t_182 'module)
                                                 (do-top-import_e3
                                                   mid_180
                                                   (interface-token_da
                                                     (binding-value_8o
                                                       binding_181)))
                                                 (if (eqv? t_182
                                                           'displaced-lexical)
                                                   (displaced-lexical-error_99
                                                     mid_180)
                                                   (syntax-error
                                                     mid_180
                                                     '"import from unknown module"))))
                                             (binding-type_8n binding_181)))
                                          (lookup_9c
                                            (id-var-name_ch mid_180 '(()))
                                            '())))))))
                               (rt-eval/residualize_e6
                                 rtem_17o
                                 (lambda ()
                                   (chi-expr_e9
                                     type_17q
                                     value_17r
                                     e_17s
                                     r_17l
                                     w_17t
                                     s_17u))))))))))))))
         (syntax-type_d3
           (lambda (e_16q r_16r w_16s s_16t rib_16u)
             (if (symbol? e_16q)
               ((lambda (n_177)
                  ((lambda (b_178)
                     ((lambda (type_179)
                        (if (eqv? type_179 'lexical)
                          (values
                            type_179
                            (binding-value_8o b_178)
                            e_16q
                            w_16s
                            s_16t)
                          (if (eqv? type_179 'global)
                            (values
                              type_179
                              (binding-value_8o b_178)
                              e_16q
                              w_16s
                              s_16t)
                            (if (memv type_179 '(macro macro!))
                              (syntax-type_d3
                                (chi-macro_ec
                                  (binding-value_8o b_178)
                                  e_16q
                                  r_16r
                                  w_16s
                                  s_16t
                                  rib_16u)
                                r_16r
                                '(())
                                '#f
                                rib_16u)
                              (values
                                type_179
                                (binding-value_8o b_178)
                                e_16q
                                w_16s
                                s_16t)))))
                      (binding-type_8n b_178)))
                   (lookup_9c n_177 r_16r)))
                (id-var-name_ch e_16q w_16s))
               (if (pair? e_16q)
                 ((lambda (first_172)
                    (if (id?_9k first_172)
                      ((lambda (n_173)
                         ((lambda (b_174)
                            ((lambda (type_175)
                               (if (eqv? type_175 'lexical)
                                 (values
                                   'lexical-call
                                   (binding-value_8o b_174)
                                   e_16q
                                   w_16s
                                   s_16t)
                                 (if (memv type_175 '(macro macro!))
                                   (syntax-type_d3
                                     (chi-macro_ec
                                       (binding-value_8o b_174)
                                       e_16q
                                       r_16r
                                       w_16s
                                       s_16t
                                       rib_16u)
                                     r_16r
                                     '(())
                                     '#f
                                     rib_16u)
                                   (if (eqv? type_175 'core)
                                     (values
                                       type_175
                                       (binding-value_8o b_174)
                                       e_16q
                                       w_16s
                                       s_16t)
                                     (if (eqv? type_175 'local-syntax)
                                       (values
                                         'local-syntax-form
                                         (binding-value_8o b_174)
                                         e_16q
                                         w_16s
                                         s_16t)
                                       (if (eqv? type_175 'begin)
                                         (values
                                           'begin-form
                                           '#f
                                           e_16q
                                           w_16s
                                           s_16t)
                                         (if (eqv? type_175 'eval-when)
                                           (values
                                             'eval-when-form
                                             '#f
                                             e_16q
                                             w_16s
                                             s_16t)
                                           (if (eqv? type_175 'define)
                                             (values
                                               'define-form
                                               '#f
                                               e_16q
                                               w_16s
                                               s_16t)
                                             (if (eqv? type_175 'define-syntax)
                                               (values
                                                 'define-syntax-form
                                                 '#f
                                                 e_16q
                                                 w_16s
                                                 s_16t)
                                               (if (eqv? type_175 'module-key)
                                                 (values
                                                   'module-form
                                                   '#f
                                                   e_16q
                                                   w_16s
                                                   s_16t)
                                                 (if (eqv? type_175 'import)
                                                   (values
                                                     'import-form
                                                     (if (binding-value_8o
                                                           b_174)
                                                       (wrap_cu
                                                         first_172
                                                         w_16s)
                                                       '#f)
                                                     e_16q
                                                     w_16s
                                                     s_16t)
                                                   (if (eqv? type_175 'set!)
                                                     (chi-set!_eb
                                                       e_16q
                                                       r_16r
                                                       w_16s
                                                       s_16t
                                                       rib_16u)
                                                     (values
                                                       'call
                                                       '#f
                                                       e_16q
                                                       w_16s
                                                       s_16t)))))))))))))
                             (binding-type_8n b_174)))
                          (lookup_9c n_173 r_16r)))
                       (id-var-name_ch first_172 w_16s))
                      (values 'call '#f e_16q w_16s s_16t)))
                  (car e_16q))
                 (if (syntax-object?_7r e_16q)
                   (syntax-type_d3
                     (syntax-object-expression_7s e_16q)
                     r_16r
                     (join-wraps_cb
                       w_16s
                       (syntax-object-wrap_7t e_16q))
                     '#f
                     rib_16u)
                   (if (annotation? e_16q)
                     (syntax-type_d3
                       (annotation-expression e_16q)
                       r_16r
                       w_16s
                       (annotation-source e_16q)
                       rib_16u)
                     (if ((lambda (t_170)
                            (if t_170
                              t_170
                              ((lambda (t_171)
                                 (if t_171
                                   t_171
                                   (if (null? e_16q)
                                     (strict-r5rs-compliance)
                                     '#f)))
                               (vector? e_16q))))
                          (pair? e_16q))
                       (values 'other '#f e_16q w_16s s_16t)
                       (values 'constant '#f e_16q w_16s s_16t))))))))
         (chi-when-list_d2
           (lambda (when-list_16n w_16o)
             (map (lambda (x_16p)
                    (if (literal-id=?_cj
                          x_16p
                          '#(syntax-object
                             compile
                             ((top)
                              #(ribcage () () ())
                              #(ribcage #(x) #((top)) #("i"))
                              #(ribcage () () ())
                              #(ribcage
                                #(when-list w)
                                #((top) (top))
                                #("i" "i"))
                              #(ribcage
                                (lambda-var-list
                                  gen-var
                                  strip
                                  strip*
                                  strip-annotation
                                  ellipsis?
                                  chi-void
                                  chi-local-syntax
                                  chi-lambda-clause
                                  parse-define-syntax
                                  parse-define
                                  parse-import
                                  parse-module
                                  do-import!
                                  chi-internal
                                  chi-body
                                  chi-macro
                                  chi-set!
                                  chi-application
                                  chi-expr
                                  chi
                                  ct-eval/residualize
                                  rt-eval/residualize
                                  initial-mode-set
                                  update-mode-set
                                  do-top-import
                                  vfor-each
                                  vmap
                                  chi-external
                                  check-defined-ids
                                  check-module-exports
                                  extend-store!
                                  id-set-diff
                                  chi-top-module
                                  set-module-binding-val!
                                  set-module-binding-imps!
                                  set-module-binding-label!
                                  set-module-binding-id!
                                  set-module-binding-type!
                                  module-binding-val
                                  module-binding-imps
                                  module-binding-label
                                  module-binding-id
                                  module-binding-type
                                  module-binding?
                                  make-module-binding
                                  make-resolved-interface
                                  make-trimmed-interface
                                  set-interface-token!
                                  set-interface-exports!
                                  interface-token
                                  interface-exports
                                  interface?
                                  make-interface
                                  flatten-exports
                                  chi-top
                                  chi-top-expr
                                  syntax-type
                                  chi-when-list
                                  chi-top-sequence
                                  chi-sequence
                                  source-wrap
                                  wrap
                                  bound-id-member?
                                  invalid-ids-error
                                  distinct-bound-ids?
                                  valid-bound-vars?
                                  valid-bound-ids?
                                  bound-id=?
                                  literal-id=?
                                  free-id=?
                                  id-var-name
                                  id-var-name-loc
                                  id-var-name&marks
                                  id-var-name-loc&marks
                                  same-marks?
                                  join-marks
                                  join-wraps
                                  smart-append
                                  make-trimmed-syntax-object
                                  make-binding-wrap
                                  lookup-import-binding-name
                                  extend-ribcage-subst!
                                  extend-ribcage-barrier-help!
                                  extend-ribcage-barrier!
                                  extend-ribcage!
                                  make-empty-ribcage
                                  set-import-token-key!
                                  import-token-key
                                  import-token?
                                  make-import-token
                                  barrier-marker
                                  new-mark
                                  anti-mark
                                  the-anti-mark
                                  set-ribcage-labels!
                                  set-ribcage-marks!
                                  set-ribcage-symnames!
                                  ribcage-labels
                                  ribcage-marks
                                  ribcage-symnames
                                  ribcage?
                                  make-ribcage
                                  gen-labels
                                  label?
                                  gen-label
                                  set-indirect-label!
                                  get-indirect-label
                                  indirect-label?
                                  gen-indirect-label
                                  only-top-marked?
                                  top-marked?
                                  top-wrap
                                  empty-wrap
                                  wrap-subst
                                  wrap-marks
                                  make-wrap
                                  id-sym-name&marks
                                  id-sym-name
                                  id?
                                  var?
                                  nonsymbol-id?
                                  global-extend
                                  lookup
                                  sanitize-binding
                                  lookup*
                                  displaced-lexical-error
                                  transformer-env
                                  extend-var-env*
                                  extend-env*
                                  extend-env
                                  null-env
                                  binding?
                                  set-binding-value!
                                  set-binding-type!
                                  binding-value
                                  binding-type
                                  make-binding
                                  arg-check
                                  source-annotation
                                  no-source
                                  unannotate
                                  set-syntax-object-wrap!
                                  set-syntax-object-expression!
                                  syntax-object-wrap
                                  syntax-object-expression
                                  syntax-object?
                                  make-syntax-object
                                  self-evaluating?
                                  build-lexical-var
                                  build-body
                                  build-letrec
                                  build-sequence
                                  build-data
                                  build-primref
                                  build-lambda
                                  build-revisit-only
                                  build-visit-only
                                  build-cte-install
                                  build-module-definition
                                  build-global-definition
                                  build-global-assignment
                                  build-global-reference
                                  build-lexical-assignment
                                  build-lexical-reference
                                  build-conditional
                                  build-application
                                  generate-module-id
                                  generate-id
                                  get-import-binding
                                  get-global-definition-hook
                                  put-global-definition-hook
                                  gensym-hook
                                  error-hook
                                  local-eval-hook
                                  top-level-eval-hook
                                  fx>=
                                  fx<=
                                  fx>
                                  fx<
                                  fx=
                                  fx-
                                  fx+
                                  noexpand
                                  let-values
                                  define-structure
                                  unless
                                  when)
                                ((top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top)
                                 (top))
                                ("i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"
                                 "i"))
                              #(ribcage (#(import-token *top*)) () ()))))
                      'compile
                      (if (literal-id=?_cj
                            x_16p
                            '#(syntax-object
                               load
                               ((top)
                                #(ribcage () () ())
                                #(ribcage #(x) #((top)) #("i"))
                                #(ribcage () () ())
                                #(ribcage
                                  #(when-list w)
                                  #((top) (top))
                                  #("i" "i"))
                                #(ribcage
                                  (lambda-var-list
                                    gen-var
                                    strip
                                    strip*
                                    strip-annotation
                                    ellipsis?
                                    chi-void
                                    chi-local-syntax
                                    chi-lambda-clause
                                    parse-define-syntax
                                    parse-define
                                    parse-import
                                    parse-module
                                    do-import!
                                    chi-internal
                                    chi-body
                                    chi-macro
                                    chi-set!
                                    chi-application
                                    chi-expr
                                    chi
                                    ct-eval/residualize
                                    rt-eval/residualize
                                    initial-mode-set
                                    update-mode-set
                                    do-top-import
                                    vfor-each
                                    vmap
                                    chi-external
                                    check-defined-ids
                                    check-module-exports
                                    extend-store!
                                    id-set-diff
                                    chi-top-module
                                    set-module-binding-val!
                                    set-module-binding-imps!
                                    set-module-binding-label!
                                    set-module-binding-id!
                                    set-module-binding-type!
                                    module-binding-val
                                    module-binding-imps
                                    module-binding-label
                                    module-binding-id
                                    module-binding-type
                                    module-binding?
                                    make-module-binding
                                    make-resolved-interface
                                    make-trimmed-interface
                                    set-interface-token!
                                    set-interface-exports!
                                    interface-token
                                    interface-exports
                                    interface?
                                    make-interface
                                    flatten-exports
                                    chi-top
                                    chi-top-expr
                                    syntax-type
                                    chi-when-list
                                    chi-top-sequence
                                    chi-sequence
                                    source-wrap
                                    wrap
                                    bound-id-member?
                                    invalid-ids-error
                                    distinct-bound-ids?
                                    valid-bound-vars?
                                    valid-bound-ids?
                                    bound-id=?
                                    literal-id=?
                                    free-id=?
                                    id-var-name
                                    id-var-name-loc
                                    id-var-name&marks
                                    id-var-name-loc&marks
                                    same-marks?
                                    join-marks
                                    join-wraps
                                    smart-append
                                    make-trimmed-syntax-object
                                    make-binding-wrap
                                    lookup-import-binding-name
                                    extend-ribcage-subst!
                                    extend-ribcage-barrier-help!
                                    extend-ribcage-barrier!
                                    extend-ribcage!
                                    make-empty-ribcage
                                    set-import-token-key!
                                    import-token-key
                                    import-token?
                                    make-import-token
                                    barrier-marker
                                    new-mark
                                    anti-mark
                                    the-anti-mark
                                    set-ribcage-labels!
                                    set-ribcage-marks!
                                    set-ribcage-symnames!
                                    ribcage-labels
                                    ribcage-marks
                                    ribcage-symnames
                                    ribcage?
                                    make-ribcage
                                    gen-labels
                                    label?
                                    gen-label
                                    set-indirect-label!
                                    get-indirect-label
                                    indirect-label?
                                    gen-indirect-label
                                    only-top-marked?
                                    top-marked?
                                    top-wrap
                                    empty-wrap
                                    wrap-subst
                                    wrap-marks
                                    make-wrap
                                    id-sym-name&marks
                                    id-sym-name
                                    id?
                                    var?
                                    nonsymbol-id?
                                    global-extend
                                    lookup
                                    sanitize-binding
                                    lookup*
                                    displaced-lexical-error
                                    transformer-env
                                    extend-var-env*
                                    extend-env*
                                    extend-env
                                    null-env
                                    binding?
                                    set-binding-value!
                                    set-binding-type!
                                    binding-value
                                    binding-type
                                    make-binding
                                    arg-check
                                    source-annotation
                                    no-source
                                    unannotate
                                    set-syntax-object-wrap!
                                    set-syntax-object-expression!
                                    syntax-object-wrap
                                    syntax-object-expression
                                    syntax-object?
                                    make-syntax-object
                                    self-evaluating?
                                    build-lexical-var
                                    build-body
                                    build-letrec
                                    build-sequence
                                    build-data
                                    build-primref
                                    build-lambda
                                    build-revisit-only
                                    build-visit-only
                                    build-cte-install
                                    build-module-definition
                                    build-global-definition
                                    build-global-assignment
                                    build-global-reference
                                    build-lexical-assignment
                                    build-lexical-reference
                                    build-conditional
                                    build-application
                                    generate-module-id
                                    generate-id
                                    get-import-binding
                                    get-global-definition-hook
                                    put-global-definition-hook
                                    gensym-hook
                                    error-hook
                                    local-eval-hook
                                    top-level-eval-hook
                                    fx>=
                                    fx<=
                                    fx>
                                    fx<
                                    fx=
                                    fx-
                                    fx+
                                    noexpand
                                    let-values
                                    define-structure
                                    unless
                                    when)
                                  ((top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top))
                                  ("i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"
                                   "i"))
                                #(ribcage (#(import-token *top*)) () ()))))
                        'load
                        (if (literal-id=?_cj
                              x_16p
                              '#(syntax-object
                                 visit
                                 ((top)
                                  #(ribcage () () ())
                                  #(ribcage #(x) #((top)) #("i"))
                                  #(ribcage () () ())
                                  #(ribcage
                                    #(when-list w)
                                    #((top) (top))
                                    #("i" "i"))
                                  #(ribcage
                                    (lambda-var-list
                                      gen-var
                                      strip
                                      strip*
                                      strip-annotation
                                      ellipsis?
                                      chi-void
                                      chi-local-syntax
                                      chi-lambda-clause
                                      parse-define-syntax
                                      parse-define
                                      parse-import
                                      parse-module
                                      do-import!
                                      chi-internal
                                      chi-body
                                      chi-macro
                                      chi-set!
                                      chi-application
                                      chi-expr
                                      chi
                                      ct-eval/residualize
                                      rt-eval/residualize
                                      initial-mode-set
                                      update-mode-set
                                      do-top-import
                                      vfor-each
                                      vmap
                                      chi-external
                                      check-defined-ids
                                      check-module-exports
                                      extend-store!
                                      id-set-diff
                                      chi-top-module
                                      set-module-binding-val!
                                      set-module-binding-imps!
                                      set-module-binding-label!
                                      set-module-binding-id!
                                      set-module-binding-type!
                                      module-binding-val
                                      module-binding-imps
                                      module-binding-label
                                      module-binding-id
                                      module-binding-type
                                      module-binding?
                                      make-module-binding
                                      make-resolved-interface
                                      make-trimmed-interface
                                      set-interface-token!
                                      set-interface-exports!
                                      interface-token
                                      interface-exports
                                      interface?
                                      make-interface
                                      flatten-exports
                                      chi-top
                                      chi-top-expr
                                      syntax-type
                                      chi-when-list
                                      chi-top-sequence
                                      chi-sequence
                                      source-wrap
                                      wrap
                                      bound-id-member?
                                      invalid-ids-error
                                      distinct-bound-ids?
                                      valid-bound-vars?
                                      valid-bound-ids?
                                      bound-id=?
                                      literal-id=?
                                      free-id=?
                                      id-var-name
                                      id-var-name-loc
                                      id-var-name&marks
                                      id-var-name-loc&marks
                                      same-marks?
                                      join-marks
                                      join-wraps
                                      smart-append
                                      make-trimmed-syntax-object
                                      make-binding-wrap
                                      lookup-import-binding-name
                                      extend-ribcage-subst!
                                      extend-ribcage-barrier-help!
                                      extend-ribcage-barrier!
                                      extend-ribcage!
                                      make-empty-ribcage
                                      set-import-token-key!
                                      import-token-key
                                      import-token?
                                      make-import-token
                                      barrier-marker
                                      new-mark
                                      anti-mark
                                      the-anti-mark
                                      set-ribcage-labels!
                                      set-ribcage-marks!
                                      set-ribcage-symnames!
                                      ribcage-labels
                                      ribcage-marks
                                      ribcage-symnames
                                      ribcage?
                                      make-ribcage
                                      gen-labels
                                      label?
                                      gen-label
                                      set-indirect-label!
                                      get-indirect-label
                                      indirect-label?
                                      gen-indirect-label
                                      only-top-marked?
                                      top-marked?
                                      top-wrap
                                      empty-wrap
                                      wrap-subst
                                      wrap-marks
                                      make-wrap
                                      id-sym-name&marks
                                      id-sym-name
                                      id?
                                      var?
                                      nonsymbol-id?
                                      global-extend
                                      lookup
                                      sanitize-binding
                                      lookup*
                                      displaced-lexical-error
                                      transformer-env
                                      extend-var-env*
                                      extend-env*
                                      extend-env
                                      null-env
                                      binding?
                                      set-binding-value!
                                      set-binding-type!
                                      binding-value
                                      binding-type
                                      make-binding
                                      arg-check
                                      source-annotation
                                      no-source
                                      unannotate
                                      set-syntax-object-wrap!
                                      set-syntax-object-expression!
                                      syntax-object-wrap
                                      syntax-object-expression
                                      syntax-object?
                                      make-syntax-object
                                      self-evaluating?
                                      build-lexical-var
                                      build-body
                                      build-letrec
                                      build-sequence
                                      build-data
                                      build-primref
                                      build-lambda
                                      build-revisit-only
                                      build-visit-only
                                      build-cte-install
                                      build-module-definition
                                      build-global-definition
                                      build-global-assignment
                                      build-global-reference
                                      build-lexical-assignment
                                      build-lexical-reference
                                      build-conditional
                                      build-application
                                      generate-module-id
                                      generate-id
                                      get-import-binding
                                      get-global-definition-hook
                                      put-global-definition-hook
                                      gensym-hook
                                      error-hook
                                      local-eval-hook
                                      top-level-eval-hook
                                      fx>=
                                      fx<=
                                      fx>
                                      fx<
                                      fx=
                                      fx-
                                      fx+
                                      noexpand
                                      let-values
                                      define-structure
                                      unless
                                      when)
                                    ((top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top))
                                    ("i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"
                                     "i"))
                                  #(ribcage (#(import-token *top*)) () ()))))
                          'visit
                          (if (literal-id=?_cj
                                x_16p
                                '#(syntax-object
                                   revisit
                                   ((top)
                                    #(ribcage () () ())
                                    #(ribcage #(x) #((top)) #("i"))
                                    #(ribcage () () ())
                                    #(ribcage
                                      #(when-list w)
                                      #((top) (top))
                                      #("i" "i"))
                                    #(ribcage
                                      (lambda-var-list
                                        gen-var
                                        strip
                                        strip*
                                        strip-annotation
                                        ellipsis?
                                        chi-void
                                        chi-local-syntax
                                        chi-lambda-clause
                                        parse-define-syntax
                                        parse-define
                                        parse-import
                                        parse-module
                                        do-import!
                                        chi-internal
                                        chi-body
                                        chi-macro
                                        chi-set!
                                        chi-application
                                        chi-expr
                                        chi
                                        ct-eval/residualize
                                        rt-eval/residualize
                                        initial-mode-set
                                        update-mode-set
                                        do-top-import
                                        vfor-each
                                        vmap
                                        chi-external
                                        check-defined-ids
                                        check-module-exports
                                        extend-store!
                                        id-set-diff
                                        chi-top-module
                                        set-module-binding-val!
                                        set-module-binding-imps!
                                        set-module-binding-label!
                                        set-module-binding-id!
                                        set-module-binding-type!
                                        module-binding-val
                                        module-binding-imps
                                        module-binding-label
                                        module-binding-id
                                        module-binding-type
                                        module-binding?
                                        make-module-binding
                                        make-resolved-interface
                                        make-trimmed-interface
                                        set-interface-token!
                                        set-interface-exports!
                                        interface-token
                                        interface-exports
                                        interface?
                                        make-interface
                                        flatten-exports
                                        chi-top
                                        chi-top-expr
                                        syntax-type
                                        chi-when-list
                                        chi-top-sequence
                                        chi-sequence
                                        source-wrap
                                        wrap
                                        bound-id-member?
                                        invalid-ids-error
                                        distinct-bound-ids?
                                        valid-bound-vars?
                                        valid-bound-ids?
                                        bound-id=?
                                        literal-id=?
                                        free-id=?
                                        id-var-name
                                        id-var-name-loc
                                        id-var-name&marks
                                        id-var-name-loc&marks
                                        same-marks?
                                        join-marks
                                        join-wraps
                                        smart-append
                                        make-trimmed-syntax-object
                                        make-binding-wrap
                                        lookup-import-binding-name
                                        extend-ribcage-subst!
                                        extend-ribcage-barrier-help!
                                        extend-ribcage-barrier!
                                        extend-ribcage!
                                        make-empty-ribcage
                                        set-import-token-key!
                                        import-token-key
                                        import-token?
                                        make-import-token
                                        barrier-marker
                                        new-mark
                                        anti-mark
                                        the-anti-mark
                                        set-ribcage-labels!
                                        set-ribcage-marks!
                                        set-ribcage-symnames!
                                        ribcage-labels
                                        ribcage-marks
                                        ribcage-symnames
                                        ribcage?
                                        make-ribcage
                                        gen-labels
                                        label?
                                        gen-label
                                        set-indirect-label!
                                        get-indirect-label
                                        indirect-label?
                                        gen-indirect-label
                                        only-top-marked?
                                        top-marked?
                                        top-wrap
                                        empty-wrap
                                        wrap-subst
                                        wrap-marks
                                        make-wrap
                                        id-sym-name&marks
                                        id-sym-name
                                        id?
                                        var?
                                        nonsymbol-id?
                                        global-extend
                                        lookup
                                        sanitize-binding
                                        lookup*
                                        displaced-lexical-error
                                        transformer-env
                                        extend-var-env*
                                        extend-env*
                                        extend-env
                                        null-env
                                        binding?
                                        set-binding-value!
                                        set-binding-type!
                                        binding-value
                                        binding-type
                                        make-binding
                                        arg-check
                                        source-annotation
                                        no-source
                                        unannotate
                                        set-syntax-object-wrap!
                                        set-syntax-object-expression!
                                        syntax-object-wrap
                                        syntax-object-expression
                                        syntax-object?
                                        make-syntax-object
                                        self-evaluating?
                                        build-lexical-var
                                        build-body
                                        build-letrec
                                        build-sequence
                                        build-data
                                        build-primref
                                        build-lambda
                                        build-revisit-only
                                        build-visit-only
                                        build-cte-install
                                        build-module-definition
                                        build-global-definition
                                        build-global-assignment
                                        build-global-reference
                                        build-lexical-assignment
                                        build-lexical-reference
                                        build-conditional
                                        build-application
                                        generate-module-id
                                        generate-id
                                        get-import-binding
                                        get-global-definition-hook
                                        put-global-definition-hook
                                        gensym-hook
                                        error-hook
                                        local-eval-hook
                                        top-level-eval-hook
                                        fx>=
                                        fx<=
                                        fx>
                                        fx<
                                        fx=
                                        fx-
                                        fx+
                                        noexpand
                                        let-values
                                        define-structure
                                        unless
                                        when)
                                      ((top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top))
                                      ("i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"))
                                    #(ribcage (#(import-token *top*)) () ()))))
                            'revisit
                            (if (literal-id=?_cj
                                  x_16p
                                  '#(syntax-object
                                     eval
                                     ((top)
                                      #(ribcage () () ())
                                      #(ribcage #(x) #((top)) #("i"))
                                      #(ribcage () () ())
                                      #(ribcage
                                        #(when-list w)
                                        #((top) (top))
                                        #("i" "i"))
                                      #(ribcage
                                        (lambda-var-list
                                          gen-var
                                          strip
                                          strip*
                                          strip-annotation
                                          ellipsis?
                                          chi-void
                                          chi-local-syntax
                                          chi-lambda-clause
                                          parse-define-syntax
                                          parse-define
                                          parse-import
                                          parse-module
                                          do-import!
                                          chi-internal
                                          chi-body
                                          chi-macro
                                          chi-set!
                                          chi-application
                                          chi-expr
                                          chi
                                          ct-eval/residualize
                                          rt-eval/residualize
                                          initial-mode-set
                                          update-mode-set
                                          do-top-import
                                          vfor-each
                                          vmap
                                          chi-external
                                          check-defined-ids
                                          check-module-exports
                                          extend-store!
                                          id-set-diff
                                          chi-top-module
                                          set-module-binding-val!
                                          set-module-binding-imps!
                                          set-module-binding-label!
                                          set-module-binding-id!
                                          set-module-binding-type!
                                          module-binding-val
                                          module-binding-imps
                                          module-binding-label
                                          module-binding-id
                                          module-binding-type
                                          module-binding?
                                          make-module-binding
                                          make-resolved-interface
                                          make-trimmed-interface
                                          set-interface-token!
                                          set-interface-exports!
                                          interface-token
                                          interface-exports
                                          interface?
                                          make-interface
                                          flatten-exports
                                          chi-top
                                          chi-top-expr
                                          syntax-type
                                          chi-when-list
                                          chi-top-sequence
                                          chi-sequence
                                          source-wrap
                                          wrap
                                          bound-id-member?
                                          invalid-ids-error
                                          distinct-bound-ids?
                                          valid-bound-vars?
                                          valid-bound-ids?
                                          bound-id=?
                                          literal-id=?
                                          free-id=?
                                          id-var-name
                                          id-var-name-loc
                                          id-var-name&marks
                                          id-var-name-loc&marks
                                          same-marks?
                                          join-marks
                                          join-wraps
                                          smart-append
                                          make-trimmed-syntax-object
                                          make-binding-wrap
                                          lookup-import-binding-name
                                          extend-ribcage-subst!
                                          extend-ribcage-barrier-help!
                                          extend-ribcage-barrier!
                                          extend-ribcage!
                                          make-empty-ribcage
                                          set-import-token-key!
                                          import-token-key
                                          import-token?
                                          make-import-token
                                          barrier-marker
                                          new-mark
                                          anti-mark
                                          the-anti-mark
                                          set-ribcage-labels!
                                          set-ribcage-marks!
                                          set-ribcage-symnames!
                                          ribcage-labels
                                          ribcage-marks
                                          ribcage-symnames
                                          ribcage?
                                          make-ribcage
                                          gen-labels
                                          label?
                                          gen-label
                                          set-indirect-label!
                                          get-indirect-label
                                          indirect-label?
                                          gen-indirect-label
                                          only-top-marked?
                                          top-marked?
                                          top-wrap
                                          empty-wrap
                                          wrap-subst
                                          wrap-marks
                                          make-wrap
                                          id-sym-name&marks
                                          id-sym-name
                                          id?
                                          var?
                                          nonsymbol-id?
                                          global-extend
                                          lookup
                                          sanitize-binding
                                          lookup*
                                          displaced-lexical-error
                                          transformer-env
                                          extend-var-env*
                                          extend-env*
                                          extend-env
                                          null-env
                                          binding?
                                          set-binding-value!
                                          set-binding-type!
                                          binding-value
                                          binding-type
                                          make-binding
                                          arg-check
                                          source-annotation
                                          no-source
                                          unannotate
                                          set-syntax-object-wrap!
                                          set-syntax-object-expression!
                                          syntax-object-wrap
                                          syntax-object-expression
                                          syntax-object?
                                          make-syntax-object
                                          self-evaluating?
                                          build-lexical-var
                                          build-body
                                          build-letrec
                                          build-sequence
                                          build-data
                                          build-primref
                                          build-lambda
                                          build-revisit-only
                                          build-visit-only
                                          build-cte-install
                                          build-module-definition
                                          build-global-definition
                                          build-global-assignment
                                          build-global-reference
                                          build-lexical-assignment
                                          build-lexical-reference
                                          build-conditional
                                          build-application
                                          generate-module-id
                                          generate-id
                                          get-import-binding
                                          get-global-definition-hook
                                          put-global-definition-hook
                                          gensym-hook
                                          error-hook
                                          local-eval-hook
                                          top-level-eval-hook
                                          fx>=
                                          fx<=
                                          fx>
                                          fx<
                                          fx=
                                          fx-
                                          fx+
                                          noexpand
                                          let-values
                                          define-structure
                                          unless
                                          when)
                                        ((top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top))
                                        ("i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"))
                                      #(ribcage
                                        (#(import-token *top*))
                                        ()
                                        ()))))
                              'eval
                              (syntax-error
                                (wrap_cu x_16p w_16o)
                                '"invalid eval-when situation")))))))
                  when-list_16n)))
         (chi-top-sequence_d1
           (lambda (body_169
                    r_16a
                    w_16b
                    s_16c
                    ctem_16d
                    rtem_16e
                    ribcage_16f)
             (build-sequence_7c
               s_16c
               ((letrec ((dobody_16g
                           (lambda (body_16h r_16i w_16j ctem_16k rtem_16l)
                             (if (null? body_16h)
                               '()
                               ((lambda (first_16m)
                                  (cons first_16m
                                        (dobody_16g
                                          (cdr body_16h)
                                          r_16i
                                          w_16j
                                          ctem_16k
                                          rtem_16l)))
                                (chi-top_d5
                                  (car body_16h)
                                  r_16i
                                  w_16j
                                  ctem_16k
                                  rtem_16l
                                  ribcage_16f))))))
                  dobody_16g)
                body_169
                r_16a
                w_16b
                ctem_16d
                rtem_16e))))
         (chi-sequence_d0
           (lambda (body_160 r_161 w_162 s_163)
             (build-sequence_7c
               s_163
               ((letrec ((dobody_164
                           (lambda (body_165 r_166 w_167)
                             (if (null? body_165)
                               '()
                               ((lambda (first_168)
                                  (cons first_168
                                        (dobody_164
                                          (cdr body_165)
                                          r_166
                                          w_167)))
                                (chi_e8 (car body_165) r_166 w_167))))))
                  dobody_164)
                body_160
                r_161
                w_162))))
         (source-wrap_cv
           (lambda (x_15t w_15u s_15v)
             (wrap_cu
               (if s_15v
                 (make-annotation x_15t s_15v '#f)
                 x_15t)
               w_15u)))
         (wrap_cu
           (lambda (x_15r w_15s)
             (if (if (null? (wrap-marks_9s w_15s))
                   (null? (wrap-subst_9t w_15s))
                   '#f)
               x_15r
               (if (syntax-object?_7r x_15r)
                 (make-syntax-object_7q
                   (syntax-object-expression_7s x_15r)
                   (join-wraps_cb
                     w_15s
                     (syntax-object-wrap_7t x_15r)))
                 (if (null? x_15r)
                   x_15r
                   (make-syntax-object_7q x_15r w_15s))))))
         (bound-id-member?_ct
           (lambda (x_15o list_15p)
             (if (null? list_15p)
               '#f
               ((lambda (t_15q)
                  (if t_15q
                    t_15q
                    (bound-id-member?_ct x_15o (cdr list_15p))))
                (bound-id=?_ck x_15o (car list_15p))))))
         (invalid-ids-error_cs
           (lambda (ids_15i exp_15j class_15k)
             ((letrec ((find_15l
                         (lambda (ids_15m gooduns_15n)
                           (if (null? ids_15m)
                             (syntax-error exp_15j)
                             (if (id?_9k (car ids_15m))
                               (if (bound-id-member?_ct
                                     (car ids_15m)
                                     gooduns_15n)
                                 (syntax-error
                                   (car ids_15m)
                                   '"duplicate "
                                   class_15k)
                                 (find_15l
                                   (cdr ids_15m)
                                   (cons (car ids_15m) gooduns_15n)))
                               (syntax-error
                                 (car ids_15m)
                                 '"invalid "
                                 class_15k))))))
                find_15l)
              ids_15i
              '())))
         (distinct-bound-ids?_cr
           (lambda (ids_15e)
             ((letrec ((distinct?_15f
                         (lambda (ids_15g)
                           ((lambda (t_15h)
                              (if t_15h
                                t_15h
                                (if (bound-id-member?_ct
                                      (car ids_15g)
                                      (cdr ids_15g))
                                  '#f
                                  (distinct?_15f (cdr ids_15g)))))
                            (null? ids_15g)))))
                distinct?_15f)
              ids_15e)))
         (valid-bound-ids?_cl
           (lambda (ids_15a)
             (if ((letrec ((all-ids?_15b
                             (lambda (ids_15c)
                               ((lambda (t_15d)
                                  (if t_15d
                                    t_15d
                                    (if (id?_9k (car ids_15c))
                                      (all-ids?_15b (cdr ids_15c))
                                      '#f)))
                                (null? ids_15c)))))
                    all-ids?_15b)
                  ids_15a)
               (distinct-bound-ids?_cr ids_15a)
               '#f)))
         (bound-id=?_ck
           (lambda (i_154 j_155)
             (if (if (syntax-object?_7r i_154)
                   (syntax-object?_7r j_155)
                   '#f)
               (if (eq? ((lambda (e_158)
                           (if (annotation? e_158)
                             (annotation-expression e_158)
                             e_158))
                         (syntax-object-expression_7s i_154))
                        ((lambda (e_159)
                           (if (annotation? e_159)
                             (annotation-expression e_159)
                             e_159))
                         (syntax-object-expression_7s j_155)))
                 (same-marks?_cd
                   (wrap-marks_9s (syntax-object-wrap_7t i_154))
                   (wrap-marks_9s (syntax-object-wrap_7t j_155)))
                 '#f)
               (eq? (if (annotation? i_154)
                      (annotation-expression i_154)
                      i_154)
                    (if (annotation? j_155)
                      (annotation-expression j_155)
                      j_155)))))
         (literal-id=?_cj
           (lambda (id_14p literal_14q)
             (if (eq? ((lambda (e_151)
                         (if (annotation? e_151)
                           (annotation-expression e_151)
                           e_151))
                       (if (syntax-object?_7r id_14p)
                         (syntax-object-expression_7s id_14p)
                         id_14p))
                      ((lambda (e_153)
                         (if (annotation? e_153)
                           (annotation-expression e_153)
                           e_153))
                       (if (syntax-object?_7r literal_14q)
                         (syntax-object-expression_7s literal_14q)
                         literal_14q)))
               ((lambda (n-id_14r n-literal_14s)
                  ((lambda (t_14t)
                     (if t_14t
                       t_14t
                       (if ((lambda (t_14v)
                              (if t_14v t_14v (symbol? n-id_14r)))
                            (if n-id_14r '#f '#t))
                         ((lambda (t_14u)
                            (if t_14u t_14u (symbol? n-literal_14s)))
                          (if n-literal_14s '#f '#t))
                         '#f)))
                   (eq? n-id_14r n-literal_14s)))
                (id-var-name_ch id_14p '(()))
                (id-var-name_ch literal_14q '(())))
               '#f)))
         (free-id=?_ci
           (lambda (i_14j j_14k)
             (if (eq? ((lambda (e_14m)
                         (if (annotation? e_14m)
                           (annotation-expression e_14m)
                           e_14m))
                       (if (syntax-object?_7r i_14j)
                         (syntax-object-expression_7s i_14j)
                         i_14j))
                      ((lambda (e_14o)
                         (if (annotation? e_14o)
                           (annotation-expression e_14o)
                           e_14o))
                       (if (syntax-object?_7r j_14k)
                         (syntax-object-expression_7s j_14k)
                         j_14k)))
               (eq? (id-var-name_ch i_14j '(()))
                    (id-var-name_ch j_14k '(())))
               '#f)))
         (id-var-name_ch
           (lambda (id_14f w_14g)
             (call-with-values
               (lambda ()
                 (id-var-name-loc&marks_ce id_14f w_14g))
               (lambda (label_14h marks_14i)
                 (if (indirect-label?_ar label_14h)
                   (get-indirect-label_av label_14h)
                   label_14h)))))
         (id-var-name-loc_cg
           (lambda (id_14b w_14c)
             (call-with-values
               (lambda ()
                 (id-var-name-loc&marks_ce id_14b w_14c))
               (lambda (label_14d marks_14e) label_14d))))
         (id-var-name&marks_cf
           (lambda (id_147 w_148)
             (call-with-values
               (lambda ()
                 (id-var-name-loc&marks_ce id_147 w_148))
               (lambda (label_149 marks_14a)
                 (values
                   (if (indirect-label?_ar label_149)
                     (get-indirect-label_av label_149)
                     label_149)
                   marks_14a)))))
         (id-var-name-loc&marks_ce
           (lambda (id_134 w_135)
             (letrec ((search_136
                        (lambda (sym_13g subst_13h marks_13i)
                          (if (null? subst_13h)
                            (values sym_13g marks_13i)
                            ((lambda (fst_13j)
                               (if (eq? fst_13j 'shift)
                                 (search_136
                                   sym_13g
                                   (cdr subst_13h)
                                   (cdr marks_13i))
                                 ((lambda (symnames_13k)
                                    (if (vector? symnames_13k)
                                      (search-vector-rib_138
                                        sym_13g
                                        subst_13h
                                        marks_13i
                                        symnames_13k
                                        fst_13j)
                                      (search-list-rib_137
                                        sym_13g
                                        subst_13h
                                        marks_13i
                                        symnames_13k
                                        fst_13j)))
                                  (ribcage-symnames_b6 fst_13j))))
                             (car subst_13h)))))
                      (search-list-rib_137
                        (lambda (sym_13l
                                 subst_13m
                                 marks_13n
                                 symnames_13o
                                 ribcage_13p)
                          ((letrec ((f_13q (lambda (symnames_13r i_13s)
                                             (if (null? symnames_13r)
                                               (search_136
                                                 sym_13l
                                                 (cdr subst_13m)
                                                 marks_13n)
                                               (if (if (eq? (car symnames_13r)
                                                            sym_13l)
                                                     (same-marks?_cd
                                                       marks_13n
                                                       (list-ref
                                                         (ribcage-marks_b7
                                                           ribcage_13p)
                                                         i_13s))
                                                     '#f)
                                                 (values
                                                   (list-ref
                                                     (ribcage-labels_b8
                                                       ribcage_13p)
                                                     i_13s)
                                                   marks_13n)
                                                 (if (import-token?_bs
                                                       (car symnames_13r))
                                                   ((lambda (t_13t)
                                                      (if t_13t
                                                        (if (symbol? t_13t)
                                                          (values
                                                            t_13t
                                                            marks_13n)
                                                          (id-var-name&marks_cf
                                                            t_13t
                                                            '(())))
                                                        (f_13q (cdr symnames_13r)
                                                               i_13s)))
                                                    (lookup-import-binding-name_c7
                                                      sym_13l
                                                      (import-token-key_bt
                                                        (car symnames_13r))
                                                      marks_13n))
                                                   (if (if (eq? (car symnames_13r)
                                                                barrier-marker_bq)
                                                         (same-marks?_cd
                                                           marks_13n
                                                           (list-ref
                                                             (ribcage-marks_b7
                                                               ribcage_13p)
                                                             i_13s))
                                                         '#f)
                                                     (values '#f marks_13n)
                                                     (f_13q (cdr symnames_13r)
                                                            (+ i_13s
                                                               '1)))))))))
                             f_13q)
                           symnames_13o
                           '0)))
                      (search-vector-rib_138
                        (lambda (sym_13v
                                 subst_140
                                 marks_141
                                 symnames_142
                                 ribcage_143)
                          ((lambda (n_144)
                             ((letrec ((f_145 (lambda (i_146)
                                                (if (= i_146 n_144)
                                                  (search_136
                                                    sym_13v
                                                    (cdr subst_140)
                                                    marks_141)
                                                  (if (if (eq? (vector-ref
                                                                 symnames_142
                                                                 i_146)
                                                               sym_13v)
                                                        (same-marks?_cd
                                                          marks_141
                                                          (vector-ref
                                                            (ribcage-marks_b7
                                                              ribcage_143)
                                                            i_146))
                                                        '#f)
                                                    (values
                                                      (vector-ref
                                                        (ribcage-labels_b8
                                                          ribcage_143)
                                                        i_146)
                                                      marks_141)
                                                    (f_145 (+ i_146 '1)))))))
                                f_145)
                              '0))
                           (vector-length symnames_142)))))
               (if (symbol? id_134)
                 (search_136
                   id_134
                   (wrap-subst_9t w_135)
                   (wrap-marks_9s w_135))
                 (if (syntax-object?_7r id_134)
                   ((lambda (sym_13a w1_13b)
                      ((lambda (marks_13c)
                         (call-with-values
                           (lambda ()
                             (search_136
                               sym_13a
                               (wrap-subst_9t w_135)
                               marks_13c))
                           (lambda (new-id_13d marks_13e)
                             (if (eq? new-id_13d sym_13a)
                               (search_136
                                 sym_13a
                                 (wrap-subst_9t w1_13b)
                                 marks_13e)
                               (values new-id_13d marks_13e)))))
                       (join-marks_cc
                         (wrap-marks_9s w_135)
                         (wrap-marks_9s w1_13b))))
                    ((lambda (e_13f)
                       (if (annotation? e_13f)
                         (annotation-expression e_13f)
                         e_13f))
                     (syntax-object-expression_7s id_134))
                    (syntax-object-wrap_7t id_134))
                   (if (annotation? id_134)
                     (search_136
                       (if (annotation? id_134)
                         (annotation-expression id_134)
                         id_134)
                       (wrap-subst_9t w_135)
                       (wrap-marks_9s w_135))
                     (error-hook_40 'id-var-name '"invalid id" id_134)))))))
         (same-marks?_cd
           (lambda (x_131 y_132)
             ((lambda (t_133)
                (if t_133
                  t_133
                  (if (null? x_131)
                    '#f
                    (if (null? y_132)
                      '#f
                      (if (eq? (car x_131) (car y_132))
                        (same-marks?_cd (cdr x_131) (cdr y_132))
                        '#f)))))
              (eq? x_131 y_132))))
         (join-marks_cc
           (lambda (m1_12v m2_130)
             (smart-append_ca m1_12v m2_130)))
         (join-wraps_cb
           (lambda (w1_12r w2_12s)
             ((lambda (m1_12t s1_12u)
                (if (null? m1_12t)
                  (if (null? s1_12u)
                    w2_12s
                    (make-wrap_9r
                      (wrap-marks_9s w2_12s)
                      (smart-append_ca s1_12u (wrap-subst_9t w2_12s))))
                  (make-wrap_9r
                    (smart-append_ca m1_12t (wrap-marks_9s w2_12s))
                    (smart-append_ca s1_12u (wrap-subst_9t w2_12s)))))
              (wrap-marks_9s w1_12r)
              (wrap-subst_9t w1_12r))))
         (smart-append_ca
           (lambda (m1_12p m2_12q)
             (if (null? m2_12q) m1_12p (append m1_12p m2_12q))))
         (make-trimmed-syntax-object_c9
           (lambda (id_12j)
             (call-with-values
               (lambda () (id-var-name&marks_cf id_12j '(())))
               (lambda (tosym_12k marks_12l)
                 (begin
                   (if tosym_12k
                     (void)
                     (syntax-error
                       id_12j
                       '"identifier not visible for export"))
                   ((lambda (fromsym_12m)
                      (make-syntax-object_7q
                        fromsym_12m
                        (make-wrap_9r
                          marks_12l
                          (list (make-ribcage_b4
                                  (vector fromsym_12m)
                                  (vector marks_12l)
                                  (vector tosym_12k))))))
                    ((lambda (e_12o)
                       (if (annotation? e_12o)
                         (annotation-expression e_12o)
                         e_12o))
                     (if (syntax-object?_7r id_12j)
                       (syntax-object-expression_7s id_12j)
                       id_12j))))))))
         (make-binding-wrap_c8
           (lambda (ids_127 labels_128 w_129)
             (if (null? ids_127)
               w_129
               (make-wrap_9r
                 (wrap-marks_9s w_129)
                 (cons ((lambda (labelvec_12a)
                          ((lambda (n_12b)
                             ((lambda (symnamevec_12c marksvec_12d)
                                (begin
                                  ((letrec ((f_12e (lambda (ids_12f i_12g)
                                                     (if (null? ids_12f)
                                                       (void)
                                                       (call-with-values
                                                         (lambda ()
                                                           (id-sym-name&marks_9q
                                                             (car ids_12f)
                                                             w_129))
                                                         (lambda (symname_12h
                                                                  marks_12i)
                                                           (begin
                                                             (vector-set!
                                                               symnamevec_12c
                                                               i_12g
                                                               symname_12h)
                                                             (vector-set!
                                                               marksvec_12d
                                                               i_12g
                                                               marks_12i)
                                                             (f_12e (cdr ids_12f)
                                                                    (+ i_12g
                                                                       '1)))))))))
                                     f_12e)
                                   ids_127
                                   '0)
                                  (make-ribcage_b4
                                    symnamevec_12c
                                    marksvec_12d
                                    labelvec_12a)))
                              (make-vector n_12b)
                              (make-vector n_12b)))
                           (vector-length labelvec_12a)))
                        (list->vector labels_128))
                       (wrap-subst_9t w_129))))))
         (lookup-import-binding-name_c7
           (lambda (sym_120 key_121 marks_122)
             ((lambda (new_123)
                (if new_123
                  ((letrec ((f_124 (lambda (new_125)
                                     (if (pair? new_125)
                                       ((lambda (t_126)
                                          (if t_126
                                            t_126
                                            (f_124 (cdr new_125))))
                                        (f_124 (car new_125)))
                                       (if (symbol? new_125)
                                         (if (same-marks?_cd
                                               marks_122
                                               (wrap-marks_9s '((top))))
                                           new_125
                                           '#f)
                                         (if (same-marks?_cd
                                               marks_122
                                               (wrap-marks_9s
                                                 (syntax-object-wrap_7t
                                                   new_125)))
                                           new_125
                                           '#f))))))
                     f_124)
                   new_123)
                  '#f))
              (get-import-binding_47 sym_120 key_121))))
         (extend-ribcage-subst!_c6
           (lambda (ribcage_11u token_11v)
             (set-ribcage-symnames!_b9
               ribcage_11u
               (cons (make-import-token_br token_11v)
                     (ribcage-symnames_b6 ribcage_11u)))))
         (extend-ribcage-barrier-help!_c5
           (lambda (ribcage_11s wrap_11t)
             (begin
               (set-ribcage-symnames!_b9
                 ribcage_11s
                 (cons barrier-marker_bq
                       (ribcage-symnames_b6 ribcage_11s)))
               (set-ribcage-marks!_ba
                 ribcage_11s
                 (cons (wrap-marks_9s wrap_11t)
                       (ribcage-marks_b7 ribcage_11s))))))
         (extend-ribcage-barrier!_c4
           (lambda (ribcage_11q killer-id_11r)
             (extend-ribcage-barrier-help!_c5
               ribcage_11q
               (syntax-object-wrap_7t killer-id_11r))))
         (extend-ribcage!_c3
           (lambda (ribcage_11m id_11n label_11o)
             (begin
               (set-ribcage-symnames!_b9
                 ribcage_11m
                 (cons ((lambda (e_11p)
                          (if (annotation? e_11p)
                            (annotation-expression e_11p)
                            e_11p))
                        (syntax-object-expression_7s id_11n))
                       (ribcage-symnames_b6 ribcage_11m)))
               (set-ribcage-marks!_ba
                 ribcage_11m
                 (cons (wrap-marks_9s (syntax-object-wrap_7t id_11n))
                       (ribcage-marks_b7 ribcage_11m)))
               (set-ribcage-labels!_bb
                 ribcage_11m
                 (cons label_11o (ribcage-labels_b8 ribcage_11m))))))
         (import-token-key_bt
           (lambda (x_11j) (vector-ref x_11j '1)))
         (import-token?_bs
           (lambda (x_11i)
             (if (vector? x_11i)
               (if (= (vector-length x_11i) '2)
                 (eq? (vector-ref x_11i '0) 'import-token)
                 '#f)
               '#f)))
         (make-import-token_br
           (lambda (key_11h) (vector 'import-token key_11h)))
         (barrier-marker_bq '#f)
         (anti-mark_bl
           (lambda (w_11g)
             (make-wrap_9r
               (cons '#f (wrap-marks_9s w_11g))
               (cons 'shift (wrap-subst_9t w_11g)))))
         (set-ribcage-labels!_bb
           (lambda (x_11e update_11f)
             (vector-set! x_11e '3 update_11f)))
         (set-ribcage-marks!_ba
           (lambda (x_11c update_11d)
             (vector-set! x_11c '2 update_11d)))
         (set-ribcage-symnames!_b9
           (lambda (x_11a update_11b)
             (vector-set! x_11a '1 update_11b)))
         (ribcage-labels_b8
           (lambda (x_119) (vector-ref x_119 '3)))
         (ribcage-marks_b7
           (lambda (x_118) (vector-ref x_118 '2)))
         (ribcage-symnames_b6
           (lambda (x_117) (vector-ref x_117 '1)))
         (make-ribcage_b4
           (lambda (symnames_113 marks_114 labels_115)
             (vector
               'ribcage
               symnames_113
               marks_114
               labels_115)))
         (gen-labels_b3
           (lambda (ls_112)
             (if (null? ls_112)
               '()
               (cons (gen-label_b1)
                     (gen-labels_b3 (cdr ls_112))))))
         (gen-label_b1 (lambda () (string '#\i)))
         (make-indirect-label_aq
           (lambda (label_10u)
             (vector 'indirect-label label_10u)))
         (indirect-label?_ar
           (lambda (x_10t)
             (if (vector? x_10t)
               (if (= (vector-length x_10t) '2)
                 (eq? (vector-ref x_10t '0) 'indirect-label)
                 '#f)
               '#f)))
         (indirect-label-label_as
           (lambda (x_10s) (vector-ref x_10s '1)))
         (set-indirect-label-label!_at
           (lambda (x_10q update_10r)
             (vector-set! x_10q '1 update_10r)))
         (gen-indirect-label_au
           (lambda ()
             (make-indirect-label_aq (gen-label_b1))))
         (get-indirect-label_av
           (lambda (x_10p) (indirect-label-label_as x_10p)))
         (set-indirect-label!_b0
           (lambda (x_10n v_10o)
             (set-indirect-label-label!_at x_10n v_10o)))
         (wrap-subst_9t cdr)
         (wrap-marks_9s car)
         (make-wrap_9r cons)
         (id-sym-name&marks_9q
           (lambda (x_10j w_10k)
             (if (syntax-object?_7r x_10j)
               (values
                 ((lambda (e_10m)
                    (if (annotation? e_10m)
                      (annotation-expression e_10m)
                      e_10m))
                  (syntax-object-expression_7s x_10j))
                 (join-marks_cc
                   (wrap-marks_9s w_10k)
                   (wrap-marks_9s (syntax-object-wrap_7t x_10j))))
               (values
                 (if (annotation? x_10j)
                   (annotation-expression x_10j)
                   x_10j)
                 (wrap-marks_9s w_10k)))))
         (id?_9k
           (lambda (x_10h)
             (if (symbol? x_10h)
               '#t
               (if (syntax-object?_7r x_10h)
                 (symbol?
                   ((lambda (e_10i)
                      (if (annotation? e_10i)
                        (annotation-expression e_10i)
                        e_10i))
                    (syntax-object-expression_7s x_10h)))
                 (if (annotation? x_10h)
                   (symbol? (annotation-expression x_10h))
                   '#f)))))
         (nonsymbol-id?_9e
           (lambda (x_10f)
             (if (syntax-object?_7r x_10f)
               (symbol?
                 ((lambda (e_10g)
                    (if (annotation? e_10g)
                      (annotation-expression e_10g)
                      e_10g))
                  (syntax-object-expression_7s x_10f)))
               '#f)))
         (global-extend_9d
           (lambda (type_10c sym_10d val_10e)
             (put-global-definition-hook_45
               sym_10d
               (make-binding_8m type_10c val_10e))))
         (lookup_9c
           (lambda (x_102 r_103)
             (letrec ((whack-binding!_104
                        (lambda (b_10a *b_10b)
                          (begin
                            (set-binding-type!_8p
                              b_10a
                              (binding-type_8n *b_10b))
                            (set-binding-value!_8q
                              b_10a
                              (binding-value_8o *b_10b))))))
               ((lambda (b_105)
                  ((lambda (t_106)
                     (if (eqv? t_106 'deferred)
                       (begin
                         (whack-binding!_104
                           b_105
                           ((lambda (*b_107)
                              ((lambda (t_108)
                                 (if t_108
                                   t_108
                                   (syntax-error
                                     *b_107
                                     '"invalid transformer")))
                               (sanitize-binding_9b *b_107)))
                            (local-eval-hook_3v (binding-value_8o b_105))))
                         (binding-type_8n b_105)
                         b_105)
                       b_105))
                   (binding-type_8n b_105)))
                (lookup*_9a x_102 r_103)))))
         (sanitize-binding_9b
           (lambda (b_100)
             (if (procedure? b_100)
               (make-binding_8m 'macro b_100)
               (if (binding?_8r b_100)
                 ((lambda (t_101)
                    (if (memv t_101 '(core macro macro!))
                      (if (procedure? (binding-value_8o b_100))
                        b_100
                        '#f)
                      (if (eqv? t_101 'module)
                        (if (interface?_d8 (binding-value_8o b_100))
                          b_100
                          '#f)
                        b_100)))
                  (binding-type_8n b_100))
                 '#f))))
         (lookup*_9a
           (lambda (x_vs r_vt)
             ((lambda (t_vu)
                (if t_vu
                  (cdr t_vu)
                  (if (symbol? x_vs)
                    ((lambda (t_vv)
                       (if t_vv t_vv (make-binding_8m 'global x_vs)))
                     (get-global-definition-hook_46 x_vs))
                    (make-binding_8m 'displaced-lexical '#f))))
              (assq x_vs r_vt))))
         (displaced-lexical-error_99
           (lambda (id_vr)
             (syntax-error
               id_vr
               (if (id-var-name_ch id_vr '(()))
                 '"identifier out of context"
                 '"identifier not visible"))))
         (transformer-env_98
           (lambda (r_vp)
             (if (null? r_vp)
               '()
               ((lambda (a_vq)
                  (if (eq? (cadr a_vq) 'lexical)
                    (transformer-env_98 (cdr r_vp))
                    (cons a_vq (transformer-env_98 (cdr r_vp)))))
                (car r_vp)))))
         (extend-var-env*_97
           (lambda (labels_vm vars_vn r_vo)
             (if (null? labels_vm)
               r_vo
               (extend-var-env*_97
                 (cdr labels_vm)
                 (cdr vars_vn)
                 (extend-env_95
                   (car labels_vm)
                   (make-binding_8m 'lexical (car vars_vn))
                   r_vo)))))
         (extend-env*_96
           (lambda (labels_vj bindings_vk r_vl)
             (if (null? labels_vj)
               r_vl
               (extend-env*_96
                 (cdr labels_vj)
                 (cdr bindings_vk)
                 (extend-env_95
                   (car labels_vj)
                   (car bindings_vk)
                   r_vl)))))
         (extend-env_95
           (lambda (label_vg binding_vh r_vi)
             (cons (cons label_vg binding_vh) r_vi)))
         (binding?_8r
           (lambda (x_vf)
             (if (pair? x_vf) (symbol? (car x_vf)) '#f)))
         (set-binding-value!_8q set-cdr!)
         (set-binding-type!_8p set-car!)
         (binding-value_8o cdr)
         (binding-type_8n car)
         (make-binding_8m
           (lambda (x_vd y_ve) (cons x_vd y_ve)))
         (source-annotation_8e
           (lambda (x_vc)
             (if (annotation? x_vc)
               (annotation-source x_vc)
               (if (syntax-object?_7r x_vc)
                 (source-annotation_8e
                   (syntax-object-expression_7s x_vc))
                 '#f))))
         (syntax-object-wrap_7t
           (lambda (x_v7) (vector-ref x_v7 '2)))
         (syntax-object-expression_7s
           (lambda (x_v6) (vector-ref x_v6 '1)))
         (syntax-object?_7r
           (lambda (x_v5)
             (if (vector? x_v5)
               (if (= (vector-length x_v5) '3)
                 (eq? (vector-ref x_v5 '0) 'syntax-object)
                 '#f)
               '#f)))
         (make-syntax-object_7q
           (lambda (expression_v3 wrap_v4)
             (vector 'syntax-object expression_v3 wrap_v4)))
         (build-body_7e
           (lambda (src_uv vars_v0 val-exps_v1 body-exp_v2)
             (build-letrec_7d
               src_uv
               vars_v0
               val-exps_v1
               body-exp_v2)))
         (build-letrec_7d
           (lambda (src_ur vars_us val-exps_ut body-exp_uu)
             (if (null? vars_us)
               (if src_ur
                 (list 'compile-in-annotation body-exp_uu src_ur)
                 body-exp_uu)
               (if src_ur
                 (list 'compile-in-annotation
                       (list 'letrec
                             (map list vars_us val-exps_ut)
                             body-exp_uu)
                       src_ur)
                 (list 'letrec
                       (map list vars_us val-exps_ut)
                       body-exp_uu)))))
         (build-sequence_7c
           (lambda (src_up exps_uq)
             (if (null? exps_uq)
               '(if '#f '#f)
               (if (equal? '(void) (car exps_uq))
                 (build-sequence_7c src_up (cdr exps_uq))
                 (if (null? (cdr exps_uq))
                   (if src_up
                     (list 'compile-in-annotation
                           (car exps_uq)
                           src_up)
                     (car exps_uq))
                   (if src_up
                     (list 'compile-in-annotation
                           (cons 'begin exps_uq)
                           src_up)
                     (cons 'begin exps_uq)))))))
         (generate-module-id_49
           (lambda (id1_un . id2_um)
             ((lambda (t_uo)
                (if t_uo t_uo (generate-id_48 id1_un)))
              (if id1_un
                (string->symbol
                  (if (if (null? id2_um) '#f (car id2_um))
                    (string-append "@"
                                   (symbol->string id1_un)
                                   "::"
                                   (symbol->string (car id2_um)))
                    (string-append "@"
                                   (symbol->string id1_un))))
                '#f))))
         (generate-id_48 gen-sym)
         (get-import-binding_47
           (lambda (symbol_uk token_ul)
             (getprop symbol_uk token_ul)))
         (get-global-definition-hook_46
           (lambda (symbol_uj)
             (getprop symbol_uj '*sc-expander*)))
         (put-global-definition-hook_45
           (lambda (symbol_uh val_ui)
             ($sc-put-cte symbol_uh val_ui)))
         (error-hook_40
           (lambda (who_ue why_uf what_ug)
             (error who_ue '"~a ~s" why_uf what_ug)))
         (local-eval-hook_3v
           (lambda (x_ud) (eval (list noexpand_1u x_ud))))
         (top-level-eval-hook_3u
           (lambda (x_uc) (eval (list noexpand_1u x_uc))))
         (noexpand_1u '"noexpand"))
  (begin
    (set! $sc-put-cte
      (lambda (id_et b_eu)
        (letrec ((put-token_ev
                   (lambda (id_fa token_fb)
                     (letrec ((cons-id_fc
                                (lambda (id_fi x_fj)
                                  (if x_fj (cons id_fi x_fj) id_fi)))
                              (weed_fd
                                (lambda (id_fk x_fl)
                                  (if (pair? x_fl)
                                    (if (bound-id=?_ck (car x_fl) id_fk)
                                      (weed_fd id_fk (cdr x_fl))
                                      (cons-id_fc
                                        (car x_fl)
                                        (weed_fd id_fk (cdr x_fl))))
                                    (if ((lambda (t_fm)
                                           (if t_fm
                                             t_fm
                                             (bound-id=?_ck x_fl id_fk)))
                                         (if x_fl '#f '#t))
                                      '#f
                                      x_fl)))))
                       ((lambda (sym_fe)
                          ((lambda (x_ff)
                             (if (if x_ff '#f (symbol? id_fa))
                               (remprop sym_fe token_fb)
                               (putprop
                                 sym_fe
                                 token_fb
                                 (cons-id_fc id_fa x_ff))))
                           (weed_fd id_fa (getprop sym_fe token_fb))))
                        ((lambda (e_fh)
                           (if (annotation? e_fh)
                             (annotation-expression e_fh)
                             e_fh))
                         (if (syntax-object?_7r id_fa)
                           (syntax-object-expression_7s id_fa)
                           id_fa))))))
                 (sc-put-module_f0
                   (lambda (exports_fn token_fo)
                     (vfor-each_e2
                       (lambda (id_fp) (put-token_ev id_fp token_fo))
                       exports_fn)))
                 (put-cte_f1
                   (lambda (id_fq binding_fr)
                     (begin
                       (put-token_ev id_fq '*top*)
                       ((lambda (sym_fs)
                          (putprop sym_fs '*sc-expander* binding_fr))
                        (if (symbol? id_fq)
                          id_fq
                          (id-var-name_ch id_fq '(()))))))))
          ((lambda (binding_f2)
             ((lambda (t_f3)
                (if (eqv? t_f3 'module)
                  (begin
                    ((lambda (iface_f8)
                       (sc-put-module_f0
                         (interface-exports_d9 iface_f8)
                         (interface-token_da iface_f8)))
                     (cdr binding_f2))
                    (put-cte_f1 id_et binding_f2))
                  (if (eqv? t_f3 'do-import)
                    ((lambda (token_f4)
                       ((lambda (b_f5)
                          ((lambda (t_f6)
                             (if (eqv? t_f6 'module)
                               ((lambda (iface_f7)
                                  (begin
                                    (if (eq? (interface-token_da iface_f7)
                                             token_f4)
                                      (void)
                                      (syntax-error
                                        id_et
                                        '"import mismatch for module"))
                                    (sc-put-module_f0
                                      (interface-exports_d9 iface_f7)
                                      '*top*)))
                                (cdr b_f5))
                               (syntax-error
                                 id_et
                                 '"import from unknown module")))
                           (car b_f5)))
                        (lookup_9c (id-var-name_ch id_et '(())) '())))
                     (cdr b_eu))
                    (put-cte_f1 id_et binding_f2))))
              (car binding_f2)))
           ((lambda (t_f9)
              (if t_f9
                t_f9
                (error 'define-syntax
                       '"invalid transformer ~s"
                       b_eu)))
            (sanitize-binding_9b b_eu))))))
    (global-extend_9d
      'local-syntax
      'letrec-syntax
      '#t)
    (global-extend_9d 'local-syntax 'let-syntax '#f)
    (global-extend_9d
      'core
      'fluid-let-syntax
      (lambda (e_ft r_fu w_fv s_g0)
        ((lambda (tmp_g2)
           (if (if tmp_g2
                 (apply (lambda (__gk var_gl val_gm e1_gn e2_go)
                          (valid-bound-ids?_cl var_gl))
                        tmp_g2)
                 '#f)
             (apply (lambda (__g4 var_g5 val_g6 e1_g7 e2_g8)
                      ((lambda (names_g9)
                         (begin
                           (for-each
                             (lambda (id_ga n_gb)
                               ((lambda (t_gc)
                                  (if (memv t_gc '(displaced-lexical))
                                    (displaced-lexical-error_99
                                      (wrap_cu id_ga w_fv))
                                    (void)))
                                (car (lookup_9c n_gb r_fu))))
                             var_g5
                             names_g9)
                           (chi-body_ed
                             (cons e1_g7 e2_g8)
                             (source-wrap_cv e_ft w_fv s_g0)
                             (extend-env*_96
                               names_g9
                               ((lambda (trans-r_gf)
                                  (map (lambda (x_gg)
                                         (make-binding_8m
                                           'deferred
                                           (chi_e8 x_gg trans-r_gf w_fv)))
                                       val_g6))
                                (transformer-env_98 r_fu))
                               r_fu)
                             w_fv)))
                       (map (lambda (x_gi) (id-var-name_ch x_gi w_fv))
                            var_g5)))
                    tmp_g2)
             (syntax-error (source-wrap_cv e_ft w_fv s_g0))))
         ($syntax-dispatch
           (compile-in-annotation e_ft value)
           '(any #(each (any any)) any . each-any)))))
    (global-extend_9d
      'core
      'quote
      (lambda (e_gq r_gr w_gs s_gt)
        ((lambda (tmp_gv)
           (if tmp_gv
             (apply (lambda (__h1 e_h2)
                      (if s_gt
                        (list 'compile-in-annotation
                              (list 'quote (strip_eq e_h2 w_gs))
                              s_gt)
                        (list 'quote (strip_eq e_h2 w_gs))))
                    tmp_gv)
             (syntax-error (source-wrap_cv e_gq w_gs s_gt))))
         ($syntax-dispatch
           (compile-in-annotation e_gq value)
           '(any any)))))
    (global-extend_9d
      'core
      'syntax
      (letrec ((gen-syntax_h3
                 (lambda (src_hn e_ho r_hp maps_hq ellipsis?_hr)
                   (if (id?_9k e_ho)
                     ((lambda (label_jd)
                        ((lambda (b_je)
                           (if (eq? (car b_je) 'syntax)
                             (call-with-values
                               (lambda ()
                                 ((lambda (var.lev_jf)
                                    (gen-ref_h4
                                      src_hn
                                      (car var.lev_jf)
                                      (cdr var.lev_jf)
                                      maps_hq))
                                  (cdr b_je)))
                               (lambda (var_jg maps_jh)
                                 (values (list 'ref var_jg) maps_jh)))
                             (if (ellipsis?_hr e_ho)
                               (syntax-error
                                 src_hn
                                 '"misplaced ellipsis in syntax form")
                               (values (list 'quote e_ho) maps_hq))))
                         (lookup_9c label_jd r_hp)))
                      (id-var-name_ch e_ho '(())))
                     ((lambda (tmp_ht)
                        (if (if tmp_ht
                              (apply (lambda (dots_jb e_jc)
                                       (ellipsis?_hr dots_jb))
                                     tmp_ht)
                              '#f)
                          (apply (lambda (dots_j8 e_j9)
                                   (gen-syntax_h3
                                     src_hn
                                     e_j9
                                     r_hp
                                     maps_hq
                                     (lambda (x_ja) '#f)))
                                 tmp_ht)
                          ((lambda (tmp_hu)
                             (if (if tmp_hu
                                   (apply (lambda (x_j5 dots_j6 y_j7)
                                            (ellipsis?_hr dots_j6))
                                          tmp_hu)
                                   '#f)
                               (apply (lambda (x_ie dots_if y_ig)
                                        ((letrec ((f_ih (lambda (y_ii k_ij)
                                                          ((lambda (tmp_il)
                                                             (if (if tmp_il
                                                                   (apply (lambda (dots_j0
                                                                                   y_j1)
                                                                            (ellipsis?_hr
                                                                              dots_j0))
                                                                          tmp_il)
                                                                   '#f)
                                                               (apply (lambda (dots_ir
                                                                               y_is)
                                                                        (f_ih y_is
                                                                              (lambda (maps_it)
                                                                                (call-with-values
                                                                                  (lambda ()
                                                                                    (k_ij (cons '()
                                                                                                maps_it)))
                                                                                  (lambda (x_iu
                                                                                           maps_iv)
                                                                                    (if (null? (car maps_iv))
                                                                                      (syntax-error
                                                                                        src_hn
                                                                                        '"extra ellipsis in syntax form")
                                                                                      (values
                                                                                        (gen-mappend_h6
                                                                                          x_iu
                                                                                          (car maps_iv))
                                                                                        (cdr maps_iv))))))))
                                                                      tmp_il)
                                                               (call-with-values
                                                                 (lambda ()
                                                                   (gen-syntax_h3
                                                                     src_hn
                                                                     y_ii
                                                                     r_hp
                                                                     maps_hq
                                                                     ellipsis?_hr))
                                                                 (lambda (y_in
                                                                          maps_io)
                                                                   (call-with-values
                                                                     (lambda ()
                                                                       (k_ij maps_io))
                                                                     (lambda (x_ip
                                                                              maps_iq)
                                                                       (values
                                                                         (gen-append_h5
                                                                           x_ip
                                                                           y_in)
                                                                         maps_iq)))))))
                                                           ($syntax-dispatch
                                                             (compile-in-annotation
                                                               y_ii
                                                               value)
                                                             '(any . any))))))
                                           f_ih)
                                         y_ig
                                         (lambda (maps_j2)
                                           (call-with-values
                                             (lambda ()
                                               (gen-syntax_h3
                                                 src_hn
                                                 x_ie
                                                 r_hp
                                                 (cons '() maps_j2)
                                                 ellipsis?_hr))
                                             (lambda (x_j3 maps_j4)
                                               (if (null? (car maps_j4))
                                                 (syntax-error
                                                   src_hn
                                                   '"extra ellipsis in syntax form")
                                                 (values
                                                   (gen-map_h7
                                                     x_j3
                                                     (car maps_j4))
                                                   (cdr maps_j4))))))))
                                      tmp_hu)
                               ((lambda (tmp_hv)
                                  (if tmp_hv
                                    (apply (lambda (x_i8 y_i9)
                                             (call-with-values
                                               (lambda ()
                                                 (gen-syntax_h3
                                                   src_hn
                                                   x_i8
                                                   r_hp
                                                   maps_hq
                                                   ellipsis?_hr))
                                               (lambda (xnew_ia maps_ib)
                                                 (call-with-values
                                                   (lambda ()
                                                     (gen-syntax_h3
                                                       src_hn
                                                       y_i9
                                                       r_hp
                                                       maps_ib
                                                       ellipsis?_hr))
                                                   (lambda (ynew_ic maps_id)
                                                     (values
                                                       (gen-cons_h8
                                                         e_ho
                                                         x_i8
                                                         y_i9
                                                         xnew_ia
                                                         ynew_ic)
                                                       maps_id))))))
                                           tmp_hv)
                                    ((lambda (tmp_i0)
                                       (if tmp_i0
                                         (apply (lambda (x1_i2 x2_i3)
                                                  ((lambda (ls_i4)
                                                     (call-with-values
                                                       (lambda ()
                                                         (gen-syntax_h3
                                                           src_hn
                                                           ls_i4
                                                           r_hp
                                                           maps_hq
                                                           ellipsis?_hr))
                                                       (lambda (lsnew_i5
                                                                maps_i6)
                                                         (values
                                                           (gen-vector_h9
                                                             e_ho
                                                             ls_i4
                                                             lsnew_i5)
                                                           maps_i6))))
                                                   (cons x1_i2 x2_i3)))
                                                tmp_i0)
                                         (values (list 'quote e_ho) maps_hq)))
                                     ($syntax-dispatch
                                       (compile-in-annotation e_ho value)
                                       '#(vector (any . each-any))))))
                                ($syntax-dispatch
                                  (compile-in-annotation e_ho value)
                                  '(any . any)))))
                           ($syntax-dispatch
                             (compile-in-annotation e_ho value)
                             '(any any . any)))))
                      ($syntax-dispatch
                        (compile-in-annotation e_ho value)
                        '(any any))))))
               (gen-ref_h4
                 (lambda (src_ji var_jj level_jk maps_jl)
                   (if (= level_jk '0)
                     (values var_jj maps_jl)
                     (if (null? maps_jl)
                       (syntax-error
                         src_ji
                         '"missing ellipsis in syntax form")
                       (call-with-values
                         (lambda ()
                           (gen-ref_h4
                             src_ji
                             var_jj
                             (- level_jk '1)
                             (cdr maps_jl)))
                         (lambda (outer-var_jm outer-maps_jn)
                           ((lambda (b_jo)
                              (if b_jo
                                (values (cdr b_jo) maps_jl)
                                ((lambda (inner-var_jp)
                                   (values
                                     inner-var_jp
                                     (cons (cons (cons outer-var_jm
                                                       inner-var_jp)
                                                 (car maps_jl))
                                           outer-maps_jn)))
                                 (gen-var_er 'tmp))))
                            (assq outer-var_jm (car maps_jl)))))))))
               (gen-append_h5
                 (lambda (x_jq y_jr)
                   (if (equal? y_jr ''())
                     x_jq
                     (list 'append x_jq y_jr))))
               (gen-mappend_h6
                 (lambda (e_js map-env_jt)
                   (list 'apply
                         '(primitive append)
                         (gen-map_h7 e_js map-env_jt))))
               (gen-map_h7
                 (lambda (e_ju map-env_jv)
                   ((lambda (formals_k0 actuals_k1)
                      (if (eq? (car e_ju) 'ref)
                        (car actuals_k1)
                        (if (andmap
                              (lambda (x_k4)
                                (if (eq? (car x_k4) 'ref)
                                  (memq (cadr x_k4) formals_k0)
                                  '#f))
                              (cdr e_ju))
                          (cons 'map
                                (cons (list 'primitive (car e_ju))
                                      (map ((lambda (r_k2)
                                              (lambda (x_k3)
                                                (cdr (assq (cadr x_k3) r_k2))))
                                            (map cons formals_k0 actuals_k1))
                                           (cdr e_ju))))
                          (cons 'map
                                (cons (list 'lambda formals_k0 e_ju)
                                      actuals_k1)))))
                    (map-cdr map-env_jv)
                    (map (lambda (x_k5) (list 'ref (car x_k5)))
                         map-env_jv))))
               (gen-cons_h8
                 (lambda (e_k6 x_k7 y_k8 xnew_k9 ynew_ka)
                   ((lambda (t_kb)
                      (if (eqv? t_kb 'quote)
                        (if (eq? (car xnew_k9) 'quote)
                          ((lambda (xnew_kc ynew_kd)
                             (if (if (eq? xnew_kc x_k7) (eq? ynew_kd y_k8) '#f)
                               (list 'quote e_k6)
                               (list 'quote (cons xnew_kc ynew_kd))))
                           (cadr xnew_k9)
                           (cadr ynew_ka))
                          (if (eq? (cadr ynew_ka) '())
                            (list 'list xnew_k9)
                            (list 'cons xnew_k9 ynew_ka)))
                        (if (eqv? t_kb 'list)
                          (cons 'list (cons xnew_k9 (cdr ynew_ka)))
                          (list 'cons xnew_k9 ynew_ka))))
                    (car ynew_ka))))
               (gen-vector_h9
                 (lambda (e_ke ls_kf lsnew_kg)
                   (if (eq? (car lsnew_kg) 'quote)
                     (if (eq? (cadr lsnew_kg) ls_kf)
                       (list 'quote e_ke)
                       (list 'quote (list->vector (cadr lsnew_kg))))
                     (if (eq? (car lsnew_kg) 'list)
                       (cons 'vector (cdr lsnew_kg))
                       (list 'list->vector lsnew_kg)))))
               (regen_ha
                 (lambda (x_kh)
                   ((lambda (t_ki)
                      (if (eqv? t_ki 'ref)
                        (cadr x_kh)
                        (if (eqv? t_ki 'primitive)
                          (cadr x_kh)
                          (if (eqv? t_ki 'quote)
                            (list 'quote (cadr x_kh))
                            (if (eqv? t_ki 'lambda)
                              (list 'lambda
                                    (cadr x_kh)
                                    (regen_ha (caddr x_kh)))
                              (if (eqv? t_ki 'map)
                                ((lambda (ls_kj)
                                   (cons (if (= (length ls_kj) '2) 'map 'map)
                                         ls_kj))
                                 (map regen_ha (cdr x_kh)))
                                (cons (car x_kh)
                                      (map regen_ha (cdr x_kh)))))))))
                    (car x_kh)))))
        (lambda (e_hb r_hc w_hd s_he)
          ((lambda (e_hf)
             ((lambda (tmp_hh)
                (if tmp_hh
                  (apply (lambda (__hj x_hk)
                           (call-with-values
                             (lambda ()
                               (gen-syntax_h3 e_hf x_hk r_hc '() ellipsis?_en))
                             (lambda (e_hl maps_hm) (regen_ha e_hl))))
                         tmp_hh)
                  (syntax-error e_hf)))
              ($syntax-dispatch
                (compile-in-annotation e_hf value)
                '(any any))))
           (source-wrap_cv e_hb w_hd s_he)))))
    (global-extend_9d
      'core
      'lambda
      (lambda (e_kk r_kl w_km s_kn)
        ((lambda (tmp_kp)
           (if tmp_kp
             (apply (lambda (__kq c_kr)
                      (chi-lambda-clause_ek
                        (source-wrap_cv e_kk w_km s_kn)
                        c_kr
                        r_kl
                        w_km
                        (lambda (vars_ks body_kt)
                          (if s_kn
                            (list 'compile-in-annotation
                                  (list 'lambda vars_ks body_kt)
                                  s_kn)
                            (list 'lambda vars_ks body_kt)))))
                    tmp_kp)
             (syntax-error e_kk)))
         ($syntax-dispatch
           (compile-in-annotation e_kk value)
           '(any . any)))))
    (global-extend_9d
      'core
      'letrec
      (lambda (e_ku r_kv w_l0 s_l1)
        ((lambda (tmp_l3)
           (if tmp_l3
             (apply (lambda (__l5 id_l6 val_l7 e1_l8 e2_l9)
                      (if (valid-bound-ids?_cl id_l6)
                        ((lambda (labels_lb new-vars_lc)
                           ((lambda (w_ld r_le)
                              (build-letrec_7d
                                s_l1
                                new-vars_lc
                                (map (lambda (x_lf) (chi_e8 x_lf r_le w_ld))
                                     val_l7)
                                (chi-body_ed
                                  (cons e1_l8 e2_l9)
                                  (source-wrap_cv e_ku w_ld s_l1)
                                  r_le
                                  w_ld)))
                            (make-binding-wrap_c8 id_l6 labels_lb w_l0)
                            (extend-var-env*_97 labels_lb new-vars_lc r_kv)))
                         (gen-labels_b3 id_l6)
                         (map gen-var_er id_l6))
                        (invalid-ids-error_cs
                          (map (lambda (x_li) (wrap_cu x_li w_l0)) id_l6)
                          (source-wrap_cv e_ku w_l0 s_l1)
                          '"bound variable")))
                    tmp_l3)
             (syntax-error (source-wrap_cv e_ku w_l0 s_l1))))
         ($syntax-dispatch
           (compile-in-annotation e_ku value)
           '(any #(each (any any)) any . each-any)))))
    (global-extend_9d
      'core
      'if
      (lambda (e_lk r_ll w_lm s_ln)
        ((lambda (tmp_lp)
           (if tmp_lp
             (apply (lambda (__m0 test_m1 then_m2)
                      (if s_ln
                        (list 'compile-in-annotation
                              (list 'if
                                    (chi_e8 test_m1 r_ll w_lm)
                                    (chi_e8 then_m2 r_ll w_lm)
                                    (chi-void_em))
                              s_ln)
                        (list 'if
                              (chi_e8 test_m1 r_ll w_lm)
                              (chi_e8 then_m2 r_ll w_lm)
                              (chi-void_em))))
                    tmp_lp)
             ((lambda (tmp_lq)
                (if tmp_lq
                  (apply (lambda (__ls test_lt then_lu else_lv)
                           (if s_ln
                             (list 'compile-in-annotation
                                   (list 'if
                                         (chi_e8 test_lt r_ll w_lm)
                                         (chi_e8 then_lu r_ll w_lm)
                                         (chi_e8 else_lv r_ll w_lm))
                                   s_ln)
                             (list 'if
                                   (chi_e8 test_lt r_ll w_lm)
                                   (chi_e8 then_lu r_ll w_lm)
                                   (chi_e8 else_lv r_ll w_lm))))
                         tmp_lq)
                  (syntax-error (source-wrap_cv e_lk w_lm s_ln))))
              ($syntax-dispatch
                (compile-in-annotation e_lk value)
                '(any any any any)))))
         ($syntax-dispatch
           (compile-in-annotation e_lk value)
           '(any any any)))))
    (global-extend_9d 'set! 'set! '())
    (global-extend_9d 'begin 'begin '())
    (global-extend_9d 'module-key 'module '())
    (global-extend_9d 'import 'import '#f)
    (global-extend_9d 'import 'import-only '#t)
    (global-extend_9d 'define 'define '())
    (global-extend_9d
      'define-syntax
      'define-syntax
      '())
    (global-extend_9d 'eval-when 'eval-when '())
    (global-extend_9d
      'core
      'syntax-case
      (letrec ((convert-pattern_m3
                 (lambda (pattern_mt keys_mu)
                   (letrec ((cvt*_mv
                              (lambda (p*_n1 n_n2 ids_n3)
                                (if (null? p*_n1)
                                  (values '() ids_n3)
                                  (call-with-values
                                    (lambda ()
                                      (cvt*_mv (cdr p*_n1) n_n2 ids_n3))
                                    (lambda (y_n4 ids_n5)
                                      (call-with-values
                                        (lambda ()
                                          (cvt_n0 (car p*_n1) n_n2 ids_n5))
                                        (lambda (x_n6 ids_n7)
                                          (values
                                            (cons x_n6 y_n4)
                                            ids_n7))))))))
                            (cvt_n0
                              (lambda (p_n8 n_n9 ids_na)
                                (if (id?_9k p_n8)
                                  (if (bound-id-member?_ct p_n8 keys_mu)
                                    (values (vector 'free-id p_n8) ids_na)
                                    (values
                                      'any
                                      (cons (cons p_n8 n_n9) ids_na)))
                                  ((lambda (tmp_nc)
                                     (if (if tmp_nc
                                           (apply (lambda (x_of dots_og)
                                                    (ellipsis?_en dots_og))
                                                  tmp_nc)
                                           '#f)
                                       (apply (lambda (x_ob dots_oc)
                                                (call-with-values
                                                  (lambda ()
                                                    (cvt_n0
                                                      x_ob
                                                      (+ n_n9 '1)
                                                      ids_na))
                                                  (lambda (p_od ids_oe)
                                                    (values
                                                      (if (eq? p_od 'any)
                                                        'each-any
                                                        (vector 'each p_od))
                                                      ids_oe))))
                                              tmp_nc)
                                       ((lambda (tmp_nd)
                                          (if (if tmp_nd
                                                (apply (lambda (x_o7
                                                                dots_o8
                                                                y_o9
                                                                z_oa)
                                                         (ellipsis?_en
                                                           dots_o8))
                                                       tmp_nd)
                                                '#f)
                                            (apply (lambda (x_ns
                                                            dots_nt
                                                            y_nu
                                                            z_nv)
                                                     (call-with-values
                                                       (lambda ()
                                                         (cvt_n0
                                                           z_nv
                                                           n_n9
                                                           ids_na))
                                                       (lambda (z_o0 ids_o1)
                                                         (call-with-values
                                                           (lambda ()
                                                             (cvt*_mv
                                                               y_nu
                                                               n_n9
                                                               ids_o1))
                                                           (lambda (y_o3
                                                                    ids_o4)
                                                             (call-with-values
                                                               (lambda ()
                                                                 (cvt_n0
                                                                   x_ns
                                                                   (+ n_n9 '1)
                                                                   ids_o4))
                                                               (lambda (x_o5
                                                                        ids_o6)
                                                                 (values
                                                                   (vector
                                                                     'each+
                                                                     x_o5
                                                                     (reverse
                                                                       y_o3)
                                                                     z_o0)
                                                                   ids_o6))))))))
                                                   tmp_nd)
                                            ((lambda (tmp_ne)
                                               (if tmp_ne
                                                 (apply (lambda (x_nm y_nn)
                                                          (call-with-values
                                                            (lambda ()
                                                              (cvt_n0
                                                                y_nn
                                                                n_n9
                                                                ids_na))
                                                            (lambda (y_no
                                                                     ids_np)
                                                              (call-with-values
                                                                (lambda ()
                                                                  (cvt_n0
                                                                    x_nm
                                                                    n_n9
                                                                    ids_np))
                                                                (lambda (x_nq
                                                                         ids_nr)
                                                                  (values
                                                                    (cons x_nq
                                                                          y_no)
                                                                    ids_nr))))))
                                                        tmp_ne)
                                                 ((lambda (tmp_nf)
                                                    (if tmp_nf
                                                      (apply (lambda ()
                                                               (values
                                                                 '()
                                                                 ids_na))
                                                             tmp_nf)
                                                      ((lambda (tmp_ng)
                                                         (if tmp_ng
                                                           (apply (lambda (x_ni)
                                                                    (call-with-values
                                                                      (lambda ()
                                                                        (cvt_n0
                                                                          x_ni
                                                                          n_n9
                                                                          ids_na))
                                                                      (lambda (p_nk
                                                                               ids_nl)
                                                                        (values
                                                                          (vector
                                                                            'vector
                                                                            p_nk)
                                                                          ids_nl))))
                                                                  tmp_ng)
                                                           (values
                                                             (vector
                                                               'atom
                                                               (strip_eq
                                                                 p_n8
                                                                 '(())))
                                                             ids_na)))
                                                       ($syntax-dispatch
                                                         (compile-in-annotation
                                                           p_n8
                                                           value)
                                                         '#(vector
                                                            each-any)))))
                                                  ($syntax-dispatch
                                                    (compile-in-annotation
                                                      p_n8
                                                      value)
                                                    '()))))
                                             ($syntax-dispatch
                                               (compile-in-annotation
                                                 p_n8
                                                 value)
                                               '(any . any)))))
                                        ($syntax-dispatch
                                          (compile-in-annotation p_n8 value)
                                          '(any any . #(each+ any () any))))))
                                   ($syntax-dispatch
                                     (compile-in-annotation p_n8 value)
                                     '(any any)))))))
                     (cvt_n0 pattern_mt '0 '()))))
               (build-dispatch-call_m4
                 (lambda (pvars_oh exp_oi y_oj r_ok)
                   (begin
                     (map-cdr pvars_oh)
                     ((lambda (ids_ol)
                        ((lambda (labels_on new-vars_oo)
                           (list 'apply
                                 (list 'lambda
                                       new-vars_oo
                                       (chi_e8
                                         exp_oi
                                         (extend-env*_96
                                           labels_on
                                           (map (lambda (var_op level_oq)
                                                  (make-binding_8m
                                                    'syntax
                                                    (cons var_op level_oq)))
                                                new-vars_oo
                                                (map-cdr pvars_oh))
                                           r_ok)
                                         (make-binding-wrap_c8
                                           ids_ol
                                           labels_on
                                           '(()))))
                                 y_oj))
                         (gen-labels_b3 ids_ol)
                         (map gen-var_er ids_ol)))
                      (map-car pvars_oh)))))
               (gen-clause_m5
                 (lambda (x_p1
                          keys_p2
                          clauses_p3
                          r_p4
                          pat_p5
                          fender_p6
                          exp_p7)
                   (call-with-values
                     (lambda () (convert-pattern_m3 pat_p5 keys_p2))
                     (lambda (p_p8 pvars_p9)
                       (if (distinct-bound-ids?_cr (map-car pvars_p9))
                         (if (andmap
                               (lambda (x_r7)
                                 (if (ellipsis?_en (car x_r7)) '#f '#t))
                               pvars_p9)
                           ((lambda (y_pa)
                              (list (list 'lambda
                                          (list y_pa)
                                          (list 'if
                                                ((lambda (tmp_pl)
                                                   (if tmp_pl
                                                     (apply (lambda () y_pa)
                                                            tmp_pl)
                                                     (list 'if
                                                           y_pa
                                                           (build-dispatch-call_m4
                                                             pvars_p9
                                                             fender_p6
                                                             y_pa
                                                             r_p4)
                                                           (list 'quote '#f))))
                                                 ($syntax-dispatch
                                                   (compile-in-annotation
                                                     fender_p6
                                                     value)
                                                   '#(atom #t)))
                                                (build-dispatch-call_m4
                                                  pvars_p9
                                                  exp_p7
                                                  y_pa
                                                  r_p4)
                                                (gen-syntax-case_m6
                                                  x_p1
                                                  keys_p2
                                                  clauses_p3
                                                  r_p4)))
                                    (if (eq? p_p8 'any)
                                      (list 'list
                                            (cons 'compile-in-annotation
                                                  (cons x_p1 '(value))))
                                      (list '$syntax-dispatch
                                            (cons 'compile-in-annotation
                                                  (cons x_p1 '(value)))
                                            (list 'quote p_p8)))))
                            (gen-var_er 'tmp))
                           (syntax-error
                             pat_p5
                             '"misplaced ellipsis in syntax-case pattern"))
                         (invalid-ids-error_cs
                           (map-car pvars_p9)
                           pat_p5
                           '"pattern variable"))))))
               (gen-syntax-case_m6
                 (lambda (x_r8 keys_r9 clauses_ra r_rb)
                   (if (null? clauses_ra)
                     (list 'syntax-error x_r8)
                     ((lambda (tmp_rc)
                        ((lambda (tmp_rd)
                           (if tmp_rd
                             (apply (lambda (pat_rj exp_rk)
                                      (if (if (id?_9k pat_rj)
                                            (if (bound-id-member?_ct
                                                  pat_rj
                                                  keys_r9)
                                              '#f
                                              (if (ellipsis?_en pat_rj)
                                                '#f
                                                '#t))
                                            '#f)
                                        ((lambda (label_rl var_rm)
                                           (list (list 'lambda
                                                       (list var_rm)
                                                       (chi_e8
                                                         exp_rk
                                                         (extend-env_95
                                                           label_rl
                                                           (make-binding_8m
                                                             'syntax
                                                             (cons var_rm '0))
                                                           r_rb)
                                                         (make-binding-wrap_c8
                                                           (list pat_rj)
                                                           (list label_rl)
                                                           '(()))))
                                                 x_r8))
                                         (gen-label_b1)
                                         (gen-var_er pat_rj))
                                        (gen-clause_m5
                                          x_r8
                                          keys_r9
                                          (cdr clauses_ra)
                                          r_rb
                                          pat_rj
                                          '#t
                                          exp_rk)))
                                    tmp_rd)
                             ((lambda (tmp_re)
                                (if tmp_re
                                  (apply (lambda (pat_rg fender_rh exp_ri)
                                           (gen-clause_m5
                                             x_r8
                                             keys_r9
                                             (cdr clauses_ra)
                                             r_rb
                                             pat_rg
                                             fender_rh
                                             exp_ri))
                                         tmp_re)
                                  (syntax-error
                                    (car clauses_ra)
                                    '"invalid syntax-case clause")))
                              ($syntax-dispatch
                                (compile-in-annotation tmp_rc value)
                                '(any any any)))))
                         ($syntax-dispatch
                           (compile-in-annotation tmp_rc value)
                           '(any any))))
                      (car clauses_ra))))))
        (lambda (e_m7 r_m8 w_m9 s_ma)
          ((lambda (e_mb)
             ((lambda (tmp_md)
                (if tmp_md
                  (apply (lambda (__me val_mf key_mg m_mh)
                           (if (andmap
                                 (lambda (x_mr)
                                   (if (id?_9k x_mr)
                                     (if (ellipsis?_en x_mr) '#f '#t)
                                     '#f))
                                 key_mg)
                             ((lambda (x_mi)
                                (if s_ma
                                  (list 'compile-in-annotation
                                        (list (list 'lambda
                                                    (list x_mi)
                                                    (gen-syntax-case_m6
                                                      x_mi
                                                      key_mg
                                                      m_mh
                                                      r_m8))
                                              (chi_e8 val_mf r_m8 '(())))
                                        s_ma)
                                  (list (list 'lambda
                                              (list x_mi)
                                              (gen-syntax-case_m6
                                                x_mi
                                                key_mg
                                                m_mh
                                                r_m8))
                                        (chi_e8 val_mf r_m8 '(())))))
                              (gen-var_er 'tmp))
                             (syntax-error e_mb '"invalid literals list in")))
                         tmp_md)
                  (syntax-error e_mb)))
              ($syntax-dispatch
                (compile-in-annotation e_mb value)
                '(any any each-any . each-any))))
           (source-wrap_cv e_m7 w_m9 s_ma)))))
    (set! sc-expand
      ((lambda (user-ribcage_rp)
         ((lambda (user-top-wrap_rq)
            (lambda (x_rs . c/rtem_rr)
              (if (if (pair? x_rs)
                    (equal? (car x_rs) '"noexpand")
                    '#f)
                (cadr x_rs)
                (if (null? c/rtem_rr)
                  (chi-top_d5
                    x_rs
                    '()
                    user-top-wrap_rq
                    '(l c)
                    '(l)
                    user-ribcage_rp)
                  (chi-top_d5
                    x_rs
                    '()
                    user-top-wrap_rq
                    (car c/rtem_rr)
                    (cadr c/rtem_rr)
                    user-ribcage_rp)))))
          (cons '(top) (cons user-ribcage_rp '()))))
       ((lambda (ribcage_rt)
          (begin
            (extend-ribcage-subst!_c6 ribcage_rt '*top*)
            ribcage_rt))
        (make-ribcage_b4 '() '() '()))))
    (set! identifier?
      (lambda (x_ru) (nonsymbol-id?_9e x_ru)))
    (set! datum->syntax-object
      (lambda (id_rv datum_s0)
        (begin
          (if (nonsymbol-id?_9e id_rv)
            (void)
            (error-hook_40
              'datum->syntax-object
              '"invalid argument"
              id_rv))
          (make-syntax-object_7q
            datum_s0
            (syntax-object-wrap_7t id_rv)))))
    (set! syntax-object->datum
      (lambda (x_s2) (strip_eq x_s2 '(()))))
    (set! generate-temporaries
      (lambda (ls_s3)
        (begin
          (if (list? ls_s3)
            (void)
            (error-hook_40
              'generate-temporaries
              '"invalid argument"
              ls_s3))
          (map (lambda (x_s5) (wrap_cu (gensym) '((top))))
               ls_s3))))
    (set! free-identifier=?
      (lambda (x_s6 y_s7)
        (begin
          (if (nonsymbol-id?_9e x_s6)
            (void)
            (error-hook_40
              'free-identifier=?
              '"invalid argument"
              x_s6))
          (if (nonsymbol-id?_9e y_s7)
            (void)
            (error-hook_40
              'free-identifier=?
              '"invalid argument"
              y_s7))
          (free-id=?_ci x_s6 y_s7))))
    (set! bound-identifier=?
      (lambda (x_sa y_sb)
        (begin
          (if (nonsymbol-id?_9e x_sa)
            (void)
            (error-hook_40
              'bound-identifier=?
              '"invalid argument"
              x_sa))
          (if (nonsymbol-id?_9e y_sb)
            (void)
            (error-hook_40
              'bound-identifier=?
              '"invalid argument"
              y_sb))
          (bound-id=?_ck x_sa y_sb))))
    (set! literal-identifier=?
      (lambda (x_se y_sf)
        (begin
          (if (nonsymbol-id?_9e x_se)
            (void)
            (error-hook_40
              'literal-identifier=?
              '"invalid argument"
              x_se))
          (if (nonsymbol-id?_9e y_sf)
            (void)
            (error-hook_40
              'literal-identifier=?
              '"invalid argument"
              y_sf))
          (literal-id=?_cj x_se y_sf))))
    (set! syntax-error
      (lambda (object_sj . messages_si)
        (begin
          (for-each
            (lambda (x_sk)
              (if (string? x_sk)
                (void)
                (error-hook_40
                  'syntax-error
                  '"invalid argument"
                  x_sk)))
            messages_si)
          ((lambda (message_sm)
             (error-hook_40
               '#f
               message_sm
               (strip_eq object_sj '(()))))
           (if (null? messages_si)
             '"invalid syntax"
             (apply string-append messages_si))))))
    (letrec ((match-each_sn
               (lambda (e_t2 p_t3 w_t4)
                 (if (annotation? e_t2)
                   (match-each_sn
                     (annotation-expression e_t2)
                     p_t3
                     w_t4)
                   (if (pair? e_t2)
                     ((lambda (first_t5)
                        (if first_t5
                          ((lambda (rest_t6)
                             (if rest_t6 (cons first_t5 rest_t6) '#f))
                           (match-each_sn (cdr e_t2) p_t3 w_t4))
                          '#f))
                      (match_st (car e_t2) p_t3 w_t4 '()))
                     (if (null? e_t2)
                       '()
                       (if (syntax-object?_7r e_t2)
                         (match-each_sn
                           (syntax-object-expression_7s e_t2)
                           p_t3
                           (join-wraps_cb w_t4 (syntax-object-wrap_7t e_t2)))
                         '#f))))))
             (match-each+_so
               (lambda (e_t7 x-pat_t8 y-pat_t9 z-pat_ta w_tb r_tc)
                 ((letrec ((f_td (lambda (e_te w_tf)
                                   (if (pair? e_te)
                                     (call-with-values
                                       (lambda () (f_td (cdr e_te) w_tf))
                                       (lambda (xr*_tg y-pat_th r_ti)
                                         (if r_ti
                                           (if (null? y-pat_th)
                                             ((lambda (xr_tj)
                                                (if xr_tj
                                                  (values
                                                    (cons xr_tj xr*_tg)
                                                    y-pat_th
                                                    r_ti)
                                                  (values '#f '#f '#f)))
                                              (match_st
                                                (car e_te)
                                                x-pat_t8
                                                w_tf
                                                '()))
                                             (values
                                               '()
                                               (cdr y-pat_th)
                                               (match_st
                                                 (car e_te)
                                                 (car y-pat_th)
                                                 w_tf
                                                 r_ti)))
                                           (values '#f '#f '#f))))
                                     (if (annotation? e_te)
                                       (f_td (annotation-expression e_te) w_tf)
                                       (if (syntax-object?_7r e_te)
                                         (f_td (syntax-object-expression_7s
                                                 e_te)
                                               (join-wraps_cb
                                                 w_tf
                                                 (syntax-object-wrap_7t e_te)))
                                         (values
                                           '()
                                           y-pat_t9
                                           (match_st
                                             e_te
                                             z-pat_ta
                                             w_tf
                                             r_tc))))))))
                    f_td)
                  e_t7
                  w_tb)))
             (match-each-any_sp
               (lambda (e_tk w_tl)
                 (if (annotation? e_tk)
                   (match-each-any_sp
                     (annotation-expression e_tk)
                     w_tl)
                   (if (pair? e_tk)
                     ((lambda (l_tm)
                        (if l_tm
                          (cons (wrap_cu (car e_tk) w_tl) l_tm)
                          '#f))
                      (match-each-any_sp (cdr e_tk) w_tl))
                     (if (null? e_tk)
                       '()
                       (if (syntax-object?_7r e_tk)
                         (match-each-any_sp
                           (syntax-object-expression_7s e_tk)
                           (join-wraps_cb w_tl (syntax-object-wrap_7t e_tk)))
                         '#f))))))
             (match-empty_sq
               (lambda (p_tn r_to)
                 (if (null? p_tn)
                   r_to
                   (if (eq? p_tn 'any)
                     (cons '() r_to)
                     (if (pair? p_tn)
                       (match-empty_sq
                         (car p_tn)
                         (match-empty_sq (cdr p_tn) r_to))
                       (if (eq? p_tn 'each-any)
                         (cons '() r_to)
                         ((lambda (t_tp)
                            (if (eqv? t_tp 'each)
                              (match-empty_sq (vector-ref p_tn '1) r_to)
                              (if (eqv? t_tp 'each+)
                                (match-empty_sq
                                  (vector-ref p_tn '1)
                                  (match-empty_sq
                                    (reverse (vector-ref p_tn '2))
                                    (match-empty_sq
                                      (vector-ref p_tn '3)
                                      r_to)))
                                (if (memv t_tp '(free-id atom))
                                  r_to
                                  (if (memv t_tp '(vector))
                                    (match-empty_sq (vector-ref p_tn '1) r_to)
                                    (void))))))
                          (vector-ref p_tn '0))))))))
             (combine_sr
               (lambda (r*_tq r_tr)
                 (if (null? (car r*_tq))
                   r_tr
                   (cons (map-car r*_tq)
                         (combine_sr (map-cdr r*_tq) r_tr)))))
             (match*_ss
               (lambda (e_ts p_tt w_tu r_tv)
                 (if (null? p_tt)
                   (if (null? e_ts) r_tv '#f)
                   (if (pair? p_tt)
                     (if (pair? e_ts)
                       (match_st
                         (car e_ts)
                         (car p_tt)
                         w_tu
                         (match_st (cdr e_ts) (cdr p_tt) w_tu r_tv))
                       '#f)
                     (if (eq? p_tt 'each-any)
                       ((lambda (l_u5) (if l_u5 (cons l_u5 r_tv) '#f))
                        (match-each-any_sp e_ts w_tu))
                       ((lambda (t_u0)
                          (if (eqv? t_u0 'each)
                            (if (null? e_ts)
                              (match-empty_sq (vector-ref p_tt '1) r_tv)
                              ((lambda (r*_u4)
                                 (if r*_u4 (combine_sr r*_u4 r_tv) '#f))
                               (match-each_sn e_ts (vector-ref p_tt '1) w_tu)))
                            (if (eqv? t_u0 'free-id)
                              (if (id?_9k e_ts)
                                (if (literal-id=?_cj
                                      (wrap_cu e_ts w_tu)
                                      (vector-ref p_tt '1))
                                  r_tv
                                  '#f)
                                '#f)
                              (if (eqv? t_u0 'each+)
                                (call-with-values
                                  (lambda ()
                                    (match-each+_so
                                      e_ts
                                      (vector-ref p_tt '1)
                                      (vector-ref p_tt '2)
                                      (vector-ref p_tt '3)
                                      w_tu
                                      r_tv))
                                  (lambda (xr*_u1 y-pat_u2 r_u3)
                                    (if r_u3
                                      (if (null? y-pat_u2)
                                        (if (null? xr*_u1)
                                          (match-empty_sq
                                            (vector-ref p_tt '1)
                                            r_u3)
                                          (combine_sr xr*_u1 r_u3))
                                        '#f)
                                      '#f)))
                                (if (eqv? t_u0 'atom)
                                  (if (equal?
                                        (vector-ref p_tt '1)
                                        (strip_eq e_ts w_tu))
                                    r_tv
                                    '#f)
                                  (if (memv t_u0 '(vector))
                                    (if (vector? e_ts)
                                      (match_st
                                        (vector->list e_ts)
                                        (vector-ref p_tt '1)
                                        w_tu
                                        r_tv)
                                      '#f)
                                    (void)))))))
                        (vector-ref p_tt '0)))))))
             (match_st
               (lambda (e_u6 p_u7 w_u8 r_u9)
                 (if r_u9
                   (if (eq? p_u7 'any)
                     (cons (wrap_cu e_u6 w_u8) r_u9)
                     (if (syntax-object?_7r e_u6)
                       (match*_ss
                         ((lambda (e_ub)
                            (if (annotation? e_ub)
                              (annotation-expression e_ub)
                              e_ub))
                          (syntax-object-expression_7s e_u6))
                         p_u7
                         (join-wraps_cb w_u8 (syntax-object-wrap_7t e_u6))
                         r_u9)
                       (match*_ss
                         (if (annotation? e_u6)
                           (annotation-expression e_u6)
                           e_u6)
                         p_u7
                         w_u8
                         r_u9)))
                   '#f))))
      (set! $syntax-dispatch
        (lambda (e_su p_sv)
          (if (eq? p_sv 'any)
            (list e_su)
            (if (syntax-object?_7r e_su)
              (match*_ss
                ((lambda (e_t1)
                   (if (annotation? e_t1)
                     (annotation-expression e_t1)
                     e_t1))
                 (syntax-object-expression_7s e_su))
                p_sv
                (syntax-object-wrap_7t e_su)
                '())
              (match*_ss
                (if (annotation? e_su)
                  (annotation-expression e_su)
                  e_su)
                p_sv
                '(())
                '()))))))))
($sc-put-cte
  'with-syntax
  (lambda (x_1ul)
    ((lambda (tmp_1un)
       (if tmp_1un
         (apply (lambda (__1v8 e1_1v9 e2_1va)
                  (cons '#(syntax-object
                           begin
                           ((top)
                            #(ribcage
                              #(_ e1 e2)
                              #((top) (top) (top))
                              #("i" "i" "i"))
                            #(ribcage () () ())
                            #(ribcage #(x) #((top)) #("i"))
                            #(ribcage (#(import-token *top*)) () ())))
                        (cons e1_1v9 e2_1va)))
                tmp_1un)
         ((lambda (tmp_1uo)
            (if tmp_1uo
              (apply (lambda (__1v2 out_1v3 in_1v4 e1_1v5 e2_1v6)
                       (list '#(syntax-object
                                syntax-case
                                ((top)
                                 #(ribcage
                                   #(_ out in e1 e2)
                                   #((top) (top) (top) (top) (top))
                                   #("i" "i" "i" "i" "i"))
                                 #(ribcage () () ())
                                 #(ribcage #(x) #((top)) #("i"))
                                 #(ribcage (#(import-token *top*)) () ())))
                             in_1v4
                             '()
                             (list out_1v3
                                   (cons '#(syntax-object
                                            begin
                                            ((top)
                                             #(ribcage
                                               #(_ out in e1 e2)
                                               #((top) (top) (top) (top) (top))
                                               #("i" "i" "i" "i" "i"))
                                             #(ribcage () () ())
                                             #(ribcage #(x) #((top)) #("i"))
                                             #(ribcage
                                               (#(import-token *top*))
                                               ()
                                               ())))
                                         (cons e1_1v5 e2_1v6)))))
                     tmp_1uo)
              ((lambda (tmp_1up)
                 (if tmp_1up
                   (apply (lambda (__1uq out_1ur in_1us e1_1ut e2_1uu)
                            (list '#(syntax-object
                                     syntax-case
                                     ((top)
                                      #(ribcage
                                        #(_ out in e1 e2)
                                        #((top) (top) (top) (top) (top))
                                        #("i" "i" "i" "i" "i"))
                                      #(ribcage () () ())
                                      #(ribcage #(x) #((top)) #("i"))
                                      #(ribcage
                                        (#(import-token *top*))
                                        ()
                                        ())))
                                  (cons '#(syntax-object
                                           list
                                           ((top)
                                            #(ribcage
                                              #(_ out in e1 e2)
                                              #((top) (top) (top) (top) (top))
                                              #("i" "i" "i" "i" "i"))
                                            #(ribcage () () ())
                                            #(ribcage #(x) #((top)) #("i"))
                                            #(ribcage
                                              (#(import-token *top*))
                                              ()
                                              ())))
                                        in_1us)
                                  '()
                                  (list out_1ur
                                        (cons '#(syntax-object
                                                 begin
                                                 ((top)
                                                  #(ribcage
                                                    #(_ out in e1 e2)
                                                    #((top)
                                                      (top)
                                                      (top)
                                                      (top)
                                                      (top))
                                                    #("i" "i" "i" "i" "i"))
                                                  #(ribcage () () ())
                                                  #(ribcage
                                                    #(x)
                                                    #((top))
                                                    #("i"))
                                                  #(ribcage
                                                    (#(import-token *top*))
                                                    ()
                                                    ())))
                                              (cons e1_1ut e2_1uu)))))
                          tmp_1up)
                   (syntax-error x_1ul)))
               ($syntax-dispatch
                 (compile-in-annotation x_1ul value)
                 '(any #(each (any any)) any . each-any)))))
          ($syntax-dispatch
            (compile-in-annotation x_1ul value)
            '(any ((any any)) any . each-any)))))
     ($syntax-dispatch
       (compile-in-annotation x_1ul value)
       '(any () any . each-any)))))
($sc-put-cte
  'syntax-rules
  (lambda (x_1vc)
    ((lambda (tmp_1ve)
       (if tmp_1ve
         (apply (lambda (__1vf
                         k_1vg
                         keyword_1vh
                         pattern_1vi
                         template_1vj)
                  (list '#(syntax-object
                           lambda
                           ((top)
                            #(ribcage
                              #(_ k keyword pattern template)
                              #((top) (top) (top) (top) (top))
                              #("i" "i" "i" "i" "i"))
                            #(ribcage () () ())
                            #(ribcage #(x) #((top)) #("i"))
                            #(ribcage (#(import-token *top*)) () ())))
                        '#(syntax-object
                           (x)
                           ((top)
                            #(ribcage
                              #(_ k keyword pattern template)
                              #((top) (top) (top) (top) (top))
                              #("i" "i" "i" "i" "i"))
                            #(ribcage () () ())
                            #(ribcage #(x) #((top)) #("i"))
                            #(ribcage (#(import-token *top*)) () ())))
                        (cons '#(syntax-object
                                 syntax-case
                                 ((top)
                                  #(ribcage
                                    #(_ k keyword pattern template)
                                    #((top) (top) (top) (top) (top))
                                    #("i" "i" "i" "i" "i"))
                                  #(ribcage () () ())
                                  #(ribcage #(x) #((top)) #("i"))
                                  #(ribcage (#(import-token *top*)) () ())))
                              (cons '#(syntax-object
                                       x
                                       ((top)
                                        #(ribcage
                                          #(_ k keyword pattern template)
                                          #((top) (top) (top) (top) (top))
                                          #("i" "i" "i" "i" "i"))
                                        #(ribcage () () ())
                                        #(ribcage #(x) #((top)) #("i"))
                                        #(ribcage
                                          (#(import-token *top*))
                                          ()
                                          ())))
                                    (cons k_1vg
                                          (map (lambda (tmp_1vm tmp_1vl)
                                                 (list (cons '#(syntax-object
                                                                dummy
                                                                ((top)
                                                                 #(ribcage
                                                                   #(_
                                                                     k
                                                                     keyword
                                                                     pattern
                                                                     template)
                                                                   #((top)
                                                                     (top)
                                                                     (top)
                                                                     (top)
                                                                     (top))
                                                                   #("i"
                                                                     "i"
                                                                     "i"
                                                                     "i"
                                                                     "i"))
                                                                 #(ribcage
                                                                   ()
                                                                   ()
                                                                   ())
                                                                 #(ribcage
                                                                   #(x)
                                                                   #((top))
                                                                   #("i"))
                                                                 #(ribcage
                                                                   (#(import-token
                                                                      *top*))
                                                                   ()
                                                                   ())))
                                                             tmp_1vl)
                                                       (list '#(syntax-object
                                                                syntax
                                                                ((top)
                                                                 #(ribcage
                                                                   #(_
                                                                     k
                                                                     keyword
                                                                     pattern
                                                                     template)
                                                                   #((top)
                                                                     (top)
                                                                     (top)
                                                                     (top)
                                                                     (top))
                                                                   #("i"
                                                                     "i"
                                                                     "i"
                                                                     "i"
                                                                     "i"))
                                                                 #(ribcage
                                                                   ()
                                                                   ()
                                                                   ())
                                                                 #(ribcage
                                                                   #(x)
                                                                   #((top))
                                                                   #("i"))
                                                                 #(ribcage
                                                                   (#(import-token
                                                                      *top*))
                                                                   ()
                                                                   ())))
                                                             tmp_1vm)))
                                               template_1vj
                                               pattern_1vi))))))
                tmp_1ve)
         (syntax-error x_1vc)))
     ($syntax-dispatch
       (compile-in-annotation x_1vc value)
       '(any each-any . #(each ((any . any) any)))))))
($sc-put-cte
  'or
  (lambda (x_1vn)
    ((lambda (tmp_1vp)
       (if tmp_1vp
         (apply (lambda (__203)
                  '#(syntax-object
                     #f
                     ((top)
                      #(ribcage #(_) #((top)) #("i"))
                      #(ribcage () () ())
                      #(ribcage #(x) #((top)) #("i"))
                      #(ribcage (#(import-token *top*)) () ()))))
                tmp_1vp)
         ((lambda (tmp_1vq)
            (if tmp_1vq
              (apply (lambda (__201 e_202) e_202) tmp_1vq)
              ((lambda (tmp_1vr)
                 (if tmp_1vr
                   (apply (lambda (__1vs e1_1vt e2_1vu e3_1vv)
                            (list '#(syntax-object
                                     let
                                     ((top)
                                      #(ribcage
                                        #(_ e1 e2 e3)
                                        #((top) (top) (top) (top))
                                        #("i" "i" "i" "i"))
                                      #(ribcage () () ())
                                      #(ribcage #(x) #((top)) #("i"))
                                      #(ribcage
                                        (#(import-token *top*))
                                        ()
                                        ())))
                                  (list (list '#(syntax-object
                                                 t
                                                 ((top)
                                                  #(ribcage
                                                    #(_ e1 e2 e3)
                                                    #((top) (top) (top) (top))
                                                    #("i" "i" "i" "i"))
                                                  #(ribcage () () ())
                                                  #(ribcage
                                                    #(x)
                                                    #((top))
                                                    #("i"))
                                                  #(ribcage
                                                    (#(import-token *top*))
                                                    ()
                                                    ())))
                                              e1_1vt))
                                  (list '#(syntax-object
                                           if
                                           ((top)
                                            #(ribcage
                                              #(_ e1 e2 e3)
                                              #((top) (top) (top) (top))
                                              #("i" "i" "i" "i"))
                                            #(ribcage () () ())
                                            #(ribcage #(x) #((top)) #("i"))
                                            #(ribcage
                                              (#(import-token *top*))
                                              ()
                                              ())))
                                        '#(syntax-object
                                           t
                                           ((top)
                                            #(ribcage
                                              #(_ e1 e2 e3)
                                              #((top) (top) (top) (top))
                                              #("i" "i" "i" "i"))
                                            #(ribcage () () ())
                                            #(ribcage #(x) #((top)) #("i"))
                                            #(ribcage
                                              (#(import-token *top*))
                                              ()
                                              ())))
                                        '#(syntax-object
                                           t
                                           ((top)
                                            #(ribcage
                                              #(_ e1 e2 e3)
                                              #((top) (top) (top) (top))
                                              #("i" "i" "i" "i"))
                                            #(ribcage () () ())
                                            #(ribcage #(x) #((top)) #("i"))
                                            #(ribcage
                                              (#(import-token *top*))
                                              ()
                                              ())))
                                        (cons '#(syntax-object
                                                 or
                                                 ((top)
                                                  #(ribcage
                                                    #(_ e1 e2 e3)
                                                    #((top) (top) (top) (top))
                                                    #("i" "i" "i" "i"))
                                                  #(ribcage () () ())
                                                  #(ribcage
                                                    #(x)
                                                    #((top))
                                                    #("i"))
                                                  #(ribcage
                                                    (#(import-token *top*))
                                                    ()
                                                    ())))
                                              (cons e2_1vu e3_1vv)))))
                          tmp_1vr)
                   (syntax-error x_1vn)))
               ($syntax-dispatch
                 (compile-in-annotation x_1vn value)
                 '(any any any . each-any)))))
          ($syntax-dispatch
            (compile-in-annotation x_1vn value)
            '(any any)))))
     ($syntax-dispatch
       (compile-in-annotation x_1vn value)
       '(any)))))
($sc-put-cte
  'and
  (lambda (x_204)
    ((lambda (tmp_206)
       (if tmp_206
         (apply (lambda (__20c e1_20d e2_20e e3_20f)
                  (cons '#(syntax-object
                           if
                           ((top)
                            #(ribcage
                              #(_ e1 e2 e3)
                              #((top) (top) (top) (top))
                              #("i" "i" "i" "i"))
                            #(ribcage () () ())
                            #(ribcage #(x) #((top)) #("i"))
                            #(ribcage (#(import-token *top*)) () ())))
                        (cons e1_20d
                              (cons (cons '#(syntax-object
                                             and
                                             ((top)
                                              #(ribcage
                                                #(_ e1 e2 e3)
                                                #((top) (top) (top) (top))
                                                #("i" "i" "i" "i"))
                                              #(ribcage () () ())
                                              #(ribcage #(x) #((top)) #("i"))
                                              #(ribcage
                                                (#(import-token *top*))
                                                ()
                                                ())))
                                          (cons e2_20e e3_20f))
                                    '#(syntax-object
                                       (#f)
                                       ((top)
                                        #(ribcage
                                          #(_ e1 e2 e3)
                                          #((top) (top) (top) (top))
                                          #("i" "i" "i" "i"))
                                        #(ribcage () () ())
                                        #(ribcage #(x) #((top)) #("i"))
                                        #(ribcage
                                          (#(import-token *top*))
                                          ()
                                          ())))))))
                tmp_206)
         ((lambda (tmp_207)
            (if tmp_207
              (apply (lambda (__20a e_20b) e_20b) tmp_207)
              ((lambda (tmp_208)
                 (if tmp_208
                   (apply (lambda (__209)
                            '#(syntax-object
                               #t
                               ((top)
                                #(ribcage #(_) #((top)) #("i"))
                                #(ribcage () () ())
                                #(ribcage #(x) #((top)) #("i"))
                                #(ribcage (#(import-token *top*)) () ()))))
                          tmp_208)
                   (syntax-error x_204)))
               ($syntax-dispatch
                 (compile-in-annotation x_204 value)
                 '(any)))))
          ($syntax-dispatch
            (compile-in-annotation x_204 value)
            '(any any)))))
     ($syntax-dispatch
       (compile-in-annotation x_204 value)
       '(any any any . each-any)))))
($sc-put-cte
  'let
  (lambda (x_20h)
    ((lambda (tmp_20j)
       (if (if tmp_20j
             (apply (lambda (__21d x_21e v_21f e1_21g e2_21h)
                      (andmap identifier? x_21e))
                    tmp_20j)
             '#f)
         (apply (lambda (__215 x_216 v_217 e1_218 e2_219)
                  (cons (cons '#(syntax-object
                                 lambda
                                 ((top)
                                  #(ribcage
                                    #(_ x v e1 e2)
                                    #((top) (top) (top) (top) (top))
                                    #("i" "i" "i" "i" "i"))
                                  #(ribcage () () ())
                                  #(ribcage #(x) #((top)) #("i"))
                                  #(ribcage (#(import-token *top*)) () ())))
                              (cons x_216 (cons e1_218 e2_219)))
                        v_217))
                tmp_20j)
         ((lambda (tmp_20k)
            (if (if tmp_20k
                  (apply (lambda (__20u f_20v x_210 v_211 e1_212 e2_213)
                           (andmap identifier? (cons f_20v x_210)))
                         tmp_20k)
                  '#f)
              (apply (lambda (__20l f_20m x_20n v_20o e1_20p e2_20q)
                       (cons (list '#(syntax-object
                                      letrec
                                      ((top)
                                       #(ribcage
                                         #(_ f x v e1 e2)
                                         #((top) (top) (top) (top) (top) (top))
                                         #("i" "i" "i" "i" "i" "i"))
                                       #(ribcage () () ())
                                       #(ribcage #(x) #((top)) #("i"))
                                       #(ribcage
                                         (#(import-token *top*))
                                         ()
                                         ())))
                                   (list (list f_20m
                                               (cons '#(syntax-object
                                                        lambda
                                                        ((top)
                                                         #(ribcage
                                                           #(_ f x v e1 e2)
                                                           #((top)
                                                             (top)
                                                             (top)
                                                             (top)
                                                             (top)
                                                             (top))
                                                           #("i"
                                                             "i"
                                                             "i"
                                                             "i"
                                                             "i"
                                                             "i"))
                                                         #(ribcage () () ())
                                                         #(ribcage
                                                           #(x)
                                                           #((top))
                                                           #("i"))
                                                         #(ribcage
                                                           (#(import-token
                                                              *top*))
                                                           ()
                                                           ())))
                                                     (cons x_20n
                                                           (cons e1_20p
                                                                 e2_20q)))))
                                   f_20m)
                             v_20o))
                     tmp_20k)
              (syntax-error x_20h)))
          ($syntax-dispatch
            (compile-in-annotation x_20h value)
            '(any any #(each (any any)) any . each-any)))))
     ($syntax-dispatch
       (compile-in-annotation x_20h value)
       '(any #(each (any any)) any . each-any)))))
($sc-put-cte
  'let*
  (lambda (x_21j)
    ((lambda (tmp_21l)
       (if (if tmp_21l
             (apply (lambda (let*_224 x_225 v_226 e1_227 e2_228)
                      (andmap identifier? x_225))
                    tmp_21l)
             '#f)
         (apply (lambda (let*_21m x_21n v_21o e1_21p e2_21q)
                  ((letrec ((f_21r (lambda (bindings_21s)
                                     (if (null? bindings_21s)
                                       (cons '#(syntax-object
                                                let
                                                ((top)
                                                 #(ribcage () () ())
                                                 #(ribcage
                                                   #(bindings)
                                                   #((top))
                                                   #("i"))
                                                 #(ribcage
                                                   #(f)
                                                   #((top))
                                                   #("i"))
                                                 #(ribcage
                                                   #(let* x v e1 e2)
                                                   #((top)
                                                     (top)
                                                     (top)
                                                     (top)
                                                     (top))
                                                   #("i" "i" "i" "i" "i"))
                                                 #(ribcage () () ())
                                                 #(ribcage
                                                   #(x)
                                                   #((top))
                                                   #("i"))
                                                 #(ribcage
                                                   (#(import-token *top*))
                                                   ()
                                                   ())))
                                             (cons '() (cons e1_21p e2_21q)))
                                       ((lambda (tmp_21t)
                                          ((lambda (tmp_21u)
                                             (if tmp_21u
                                               (apply (lambda (body_21v
                                                               binding_220)
                                                        (list '#(syntax-object
                                                                 let
                                                                 ((top)
                                                                  #(ribcage
                                                                    #(body
                                                                      binding)
                                                                    #((top)
                                                                      (top))
                                                                    #("i" "i"))
                                                                  #(ribcage
                                                                    ()
                                                                    ()
                                                                    ())
                                                                  #(ribcage
                                                                    #(bindings)
                                                                    #((top))
                                                                    #("i"))
                                                                  #(ribcage
                                                                    #(f)
                                                                    #((top))
                                                                    #("i"))
                                                                  #(ribcage
                                                                    #(let*
                                                                      x
                                                                      v
                                                                      e1
                                                                      e2)
                                                                    #((top)
                                                                      (top)
                                                                      (top)
                                                                      (top)
                                                                      (top))
                                                                    #("i"
                                                                      "i"
                                                                      "i"
                                                                      "i"
                                                                      "i"))
                                                                  #(ribcage
                                                                    ()
                                                                    ()
                                                                    ())
                                                                  #(ribcage
                                                                    #(x)
                                                                    #((top))
                                                                    #("i"))
                                                                  #(ribcage
                                                                    (#(import-token
                                                                       *top*))
                                                                    ()
                                                                    ())))
                                                              (list binding_220)
                                                              body_21v))
                                                      tmp_21u)
                                               (syntax-error tmp_21t)))
                                           ($syntax-dispatch
                                             (compile-in-annotation
                                               tmp_21t
                                               value)
                                             '(any any))))
                                        (list (f_21r (cdr bindings_21s))
                                              (car bindings_21s)))))))
                     f_21r)
                   (map list x_21n v_21o)))
                tmp_21l)
         (syntax-error x_21j)))
     ($syntax-dispatch
       (compile-in-annotation x_21j value)
       '(any #(each (any any)) any . each-any)))))
($sc-put-cte
  'cond
  (lambda (x_22a)
    ((lambda (tmp_22c)
       (if tmp_22c
         (apply (lambda (__22d m1_22e m2_22f)
                  ((letrec ((f_22g (lambda (clause_22h clauses_22i)
                                     (if (null? clauses_22i)
                                       ((lambda (tmp_232)
                                          (if tmp_232
                                            (apply (lambda (e1_23e e2_23f)
                                                     (cons '#(syntax-object
                                                              begin
                                                              ((top)
                                                               #(ribcage
                                                                 #(e1 e2)
                                                                 #((top) (top))
                                                                 #("i" "i"))
                                                               #(ribcage
                                                                 ()
                                                                 ()
                                                                 ())
                                                               #(ribcage
                                                                 #(clause
                                                                   clauses)
                                                                 #((top) (top))
                                                                 #("i" "i"))
                                                               #(ribcage
                                                                 #(f)
                                                                 #((top))
                                                                 #("i"))
                                                               #(ribcage
                                                                 #(_ m1 m2)
                                                                 #((top)
                                                                   (top)
                                                                   (top))
                                                                 #("i"
                                                                   "i"
                                                                   "i"))
                                                               #(ribcage
                                                                 ()
                                                                 ()
                                                                 ())
                                                               #(ribcage
                                                                 #(x)
                                                                 #((top))
                                                                 #("i"))
                                                               #(ribcage
                                                                 (#(import-token
                                                                    *top*))
                                                                 ()
                                                                 ())))
                                                           (cons '#(syntax-object
                                                                    '#t
                                                                    ((top)
                                                                     #(ribcage
                                                                       #(e1 e2)
                                                                       #((top)
                                                                         (top))
                                                                       #("i"
                                                                         "i"))
                                                                     #(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                     #(ribcage
                                                                       #(clause
                                                                         clauses)
                                                                       #((top)
                                                                         (top))
                                                                       #("i"
                                                                         "i"))
                                                                     #(ribcage
                                                                       #(f)
                                                                       #((top))
                                                                       #("i"))
                                                                     #(ribcage
                                                                       #(_
                                                                         m1
                                                                         m2)
                                                                       #((top)
                                                                         (top)
                                                                         (top))
                                                                       #("i"
                                                                         "i"
                                                                         "i"))
                                                                     #(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                     #(ribcage
                                                                       #(x)
                                                                       #((top))
                                                                       #("i"))
                                                                     #(ribcage
                                                                       (#(import-token
                                                                          *top*))
                                                                       ()
                                                                       ())))
                                                                 (cons e1_23e
                                                                       e2_23f))))
                                                   tmp_232)
                                            ((lambda (tmp_233)
                                               (if tmp_233
                                                 (apply (lambda (e0_23d)
                                                          (cons '#(syntax-object
                                                                   let
                                                                   ((top)
                                                                    #(ribcage
                                                                      #(e0)
                                                                      #((top))
                                                                      #("i"))
                                                                    #(ribcage
                                                                      ()
                                                                      ()
                                                                      ())
                                                                    #(ribcage
                                                                      #(clause
                                                                        clauses)
                                                                      #((top)
                                                                        (top))
                                                                      #("i"
                                                                        "i"))
                                                                    #(ribcage
                                                                      #(f)
                                                                      #((top))
                                                                      #("i"))
                                                                    #(ribcage
                                                                      #(_
                                                                        m1
                                                                        m2)
                                                                      #((top)
                                                                        (top)
                                                                        (top))
                                                                      #("i"
                                                                        "i"
                                                                        "i"))
                                                                    #(ribcage
                                                                      ()
                                                                      ()
                                                                      ())
                                                                    #(ribcage
                                                                      #(x)
                                                                      #((top))
                                                                      #("i"))
                                                                    #(ribcage
                                                                      (#(import-token
                                                                         *top*))
                                                                      ()
                                                                      ())))
                                                                (cons (list (list '#(syntax-object
                                                                                     t
                                                                                     ((top)
                                                                                      #(ribcage
                                                                                        #(e0)
                                                                                        #((top))
                                                                                        #("i"))
                                                                                      #(ribcage
                                                                                        ()
                                                                                        ()
                                                                                        ())
                                                                                      #(ribcage
                                                                                        #(clause
                                                                                          clauses)
                                                                                        #((top)
                                                                                          (top))
                                                                                        #("i"
                                                                                          "i"))
                                                                                      #(ribcage
                                                                                        #(f)
                                                                                        #((top))
                                                                                        #("i"))
                                                                                      #(ribcage
                                                                                        #(_
                                                                                          m1
                                                                                          m2)
                                                                                        #((top)
                                                                                          (top)
                                                                                          (top))
                                                                                        #("i"
                                                                                          "i"
                                                                                          "i"))
                                                                                      #(ribcage
                                                                                        ()
                                                                                        ()
                                                                                        ())
                                                                                      #(ribcage
                                                                                        #(x)
                                                                                        #((top))
                                                                                        #("i"))
                                                                                      #(ribcage
                                                                                        (#(import-token
                                                                                           *top*))
                                                                                        ()
                                                                                        ())))
                                                                                  e0_23d))
                                                                      '#(syntax-object
                                                                         ((if t
                                                                            t))
                                                                         ((top)
                                                                          #(ribcage
                                                                            #(e0)
                                                                            #((top))
                                                                            #("i"))
                                                                          #(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                          #(ribcage
                                                                            #(clause
                                                                              clauses)
                                                                            #((top)
                                                                              (top))
                                                                            #("i"
                                                                              "i"))
                                                                          #(ribcage
                                                                            #(f)
                                                                            #((top))
                                                                            #("i"))
                                                                          #(ribcage
                                                                            #(_
                                                                              m1
                                                                              m2)
                                                                            #((top)
                                                                              (top)
                                                                              (top))
                                                                            #("i"
                                                                              "i"
                                                                              "i"))
                                                                          #(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                          #(ribcage
                                                                            #(x)
                                                                            #((top))
                                                                            #("i"))
                                                                          #(ribcage
                                                                            (#(import-token
                                                                               *top*))
                                                                            ()
                                                                            ()))))))
                                                        tmp_233)
                                                 ((lambda (tmp_234)
                                                    (if tmp_234
                                                      (apply (lambda (e0_23b
                                                                      e1_23c)
                                                               (list '#(syntax-object
                                                                        let
                                                                        ((top)
                                                                         #(ribcage
                                                                           #(e0
                                                                             e1)
                                                                           #((top)
                                                                             (top))
                                                                           #("i"
                                                                             "i"))
                                                                         #(ribcage
                                                                           ()
                                                                           ()
                                                                           ())
                                                                         #(ribcage
                                                                           #(clause
                                                                             clauses)
                                                                           #((top)
                                                                             (top))
                                                                           #("i"
                                                                             "i"))
                                                                         #(ribcage
                                                                           #(f)
                                                                           #((top))
                                                                           #("i"))
                                                                         #(ribcage
                                                                           #(_
                                                                             m1
                                                                             m2)
                                                                           #((top)
                                                                             (top)
                                                                             (top))
                                                                           #("i"
                                                                             "i"
                                                                             "i"))
                                                                         #(ribcage
                                                                           ()
                                                                           ()
                                                                           ())
                                                                         #(ribcage
                                                                           #(x)
                                                                           #((top))
                                                                           #("i"))
                                                                         #(ribcage
                                                                           (#(import-token
                                                                              *top*))
                                                                           ()
                                                                           ())))
                                                                     (list (list '#(syntax-object
                                                                                    t
                                                                                    ((top)
                                                                                     #(ribcage
                                                                                       #(e0
                                                                                         e1)
                                                                                       #((top)
                                                                                         (top))
                                                                                       #("i"
                                                                                         "i"))
                                                                                     #(ribcage
                                                                                       ()
                                                                                       ()
                                                                                       ())
                                                                                     #(ribcage
                                                                                       #(clause
                                                                                         clauses)
                                                                                       #((top)
                                                                                         (top))
                                                                                       #("i"
                                                                                         "i"))
                                                                                     #(ribcage
                                                                                       #(f)
                                                                                       #((top))
                                                                                       #("i"))
                                                                                     #(ribcage
                                                                                       #(_
                                                                                         m1
                                                                                         m2)
                                                                                       #((top)
                                                                                         (top)
                                                                                         (top))
                                                                                       #("i"
                                                                                         "i"
                                                                                         "i"))
                                                                                     #(ribcage
                                                                                       ()
                                                                                       ()
                                                                                       ())
                                                                                     #(ribcage
                                                                                       #(x)
                                                                                       #((top))
                                                                                       #("i"))
                                                                                     #(ribcage
                                                                                       (#(import-token
                                                                                          *top*))
                                                                                       ()
                                                                                       ())))
                                                                                 e0_23b))
                                                                     (list '#(syntax-object
                                                                              if
                                                                              ((top)
                                                                               #(ribcage
                                                                                 #(e0
                                                                                   e1)
                                                                                 #((top)
                                                                                   (top))
                                                                                 #("i"
                                                                                   "i"))
                                                                               #(ribcage
                                                                                 ()
                                                                                 ()
                                                                                 ())
                                                                               #(ribcage
                                                                                 #(clause
                                                                                   clauses)
                                                                                 #((top)
                                                                                   (top))
                                                                                 #("i"
                                                                                   "i"))
                                                                               #(ribcage
                                                                                 #(f)
                                                                                 #((top))
                                                                                 #("i"))
                                                                               #(ribcage
                                                                                 #(_
                                                                                   m1
                                                                                   m2)
                                                                                 #((top)
                                                                                   (top)
                                                                                   (top))
                                                                                 #("i"
                                                                                   "i"
                                                                                   "i"))
                                                                               #(ribcage
                                                                                 ()
                                                                                 ()
                                                                                 ())
                                                                               #(ribcage
                                                                                 #(x)
                                                                                 #((top))
                                                                                 #("i"))
                                                                               #(ribcage
                                                                                 (#(import-token
                                                                                    *top*))
                                                                                 ()
                                                                                 ())))
                                                                           '#(syntax-object
                                                                              t
                                                                              ((top)
                                                                               #(ribcage
                                                                                 #(e0
                                                                                   e1)
                                                                                 #((top)
                                                                                   (top))
                                                                                 #("i"
                                                                                   "i"))
                                                                               #(ribcage
                                                                                 ()
                                                                                 ()
                                                                                 ())
                                                                               #(ribcage
                                                                                 #(clause
                                                                                   clauses)
                                                                                 #((top)
                                                                                   (top))
                                                                                 #("i"
                                                                                   "i"))
                                                                               #(ribcage
                                                                                 #(f)
                                                                                 #((top))
                                                                                 #("i"))
                                                                               #(ribcage
                                                                                 #(_
                                                                                   m1
                                                                                   m2)
                                                                                 #((top)
                                                                                   (top)
                                                                                   (top))
                                                                                 #("i"
                                                                                   "i"
                                                                                   "i"))
                                                                               #(ribcage
                                                                                 ()
                                                                                 ()
                                                                                 ())
                                                                               #(ribcage
                                                                                 #(x)
                                                                                 #((top))
                                                                                 #("i"))
                                                                               #(ribcage
                                                                                 (#(import-token
                                                                                    *top*))
                                                                                 ()
                                                                                 ())))
                                                                           (cons e1_23c
                                                                                 '#(syntax-object
                                                                                    (t)
                                                                                    ((top)
                                                                                     #(ribcage
                                                                                       #(e0
                                                                                         e1)
                                                                                       #((top)
                                                                                         (top))
                                                                                       #("i"
                                                                                         "i"))
                                                                                     #(ribcage
                                                                                       ()
                                                                                       ()
                                                                                       ())
                                                                                     #(ribcage
                                                                                       #(clause
                                                                                         clauses)
                                                                                       #((top)
                                                                                         (top))
                                                                                       #("i"
                                                                                         "i"))
                                                                                     #(ribcage
                                                                                       #(f)
                                                                                       #((top))
                                                                                       #("i"))
                                                                                     #(ribcage
                                                                                       #(_
                                                                                         m1
                                                                                         m2)
                                                                                       #((top)
                                                                                         (top)
                                                                                         (top))
                                                                                       #("i"
                                                                                         "i"
                                                                                         "i"))
                                                                                     #(ribcage
                                                                                       ()
                                                                                       ()
                                                                                       ())
                                                                                     #(ribcage
                                                                                       #(x)
                                                                                       #((top))
                                                                                       #("i"))
                                                                                     #(ribcage
                                                                                       (#(import-token
                                                                                          *top*))
                                                                                       ()
                                                                                       ())))))))
                                                             tmp_234)
                                                      ((lambda (tmp_235)
                                                         (if tmp_235
                                                           (apply (lambda (e0_237
                                                                           e1_238
                                                                           e2_239)
                                                                    (list '#(syntax-object
                                                                             if
                                                                             ((top)
                                                                              #(ribcage
                                                                                #(e0
                                                                                  e1
                                                                                  e2)
                                                                                #((top)
                                                                                  (top)
                                                                                  (top))
                                                                                #("i"
                                                                                  "i"
                                                                                  "i"))
                                                                              #(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                              #(ribcage
                                                                                #(clause
                                                                                  clauses)
                                                                                #((top)
                                                                                  (top))
                                                                                #("i"
                                                                                  "i"))
                                                                              #(ribcage
                                                                                #(f)
                                                                                #((top))
                                                                                #("i"))
                                                                              #(ribcage
                                                                                #(_
                                                                                  m1
                                                                                  m2)
                                                                                #((top)
                                                                                  (top)
                                                                                  (top))
                                                                                #("i"
                                                                                  "i"
                                                                                  "i"))
                                                                              #(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                              #(ribcage
                                                                                #(x)
                                                                                #((top))
                                                                                #("i"))
                                                                              #(ribcage
                                                                                (#(import-token
                                                                                   *top*))
                                                                                ()
                                                                                ())))
                                                                          e0_237
                                                                          (cons '#(syntax-object
                                                                                   begin
                                                                                   ((top)
                                                                                    #(ribcage
                                                                                      #(e0
                                                                                        e1
                                                                                        e2)
                                                                                      #((top)
                                                                                        (top)
                                                                                        (top))
                                                                                      #("i"
                                                                                        "i"
                                                                                        "i"))
                                                                                    #(ribcage
                                                                                      ()
                                                                                      ()
                                                                                      ())
                                                                                    #(ribcage
                                                                                      #(clause
                                                                                        clauses)
                                                                                      #((top)
                                                                                        (top))
                                                                                      #("i"
                                                                                        "i"))
                                                                                    #(ribcage
                                                                                      #(f)
                                                                                      #((top))
                                                                                      #("i"))
                                                                                    #(ribcage
                                                                                      #(_
                                                                                        m1
                                                                                        m2)
                                                                                      #((top)
                                                                                        (top)
                                                                                        (top))
                                                                                      #("i"
                                                                                        "i"
                                                                                        "i"))
                                                                                    #(ribcage
                                                                                      ()
                                                                                      ()
                                                                                      ())
                                                                                    #(ribcage
                                                                                      #(x)
                                                                                      #((top))
                                                                                      #("i"))
                                                                                    #(ribcage
                                                                                      (#(import-token
                                                                                         *top*))
                                                                                      ()
                                                                                      ())))
                                                                                (cons e1_238
                                                                                      e2_239))))
                                                                  tmp_235)
                                                           (syntax-error
                                                             x_22a)))
                                                       ($syntax-dispatch
                                                         (compile-in-annotation
                                                           clause_22h
                                                           value)
                                                         '(any any
                                                               .
                                                               each-any)))))
                                                  ($syntax-dispatch
                                                    (compile-in-annotation
                                                      clause_22h
                                                      value)
                                                    '(any #(free-id
                                                            #(syntax-object
                                                              =>
                                                              ((top)
                                                               #(ribcage
                                                                 ()
                                                                 ()
                                                                 ())
                                                               #(ribcage
                                                                 #(clause
                                                                   clauses)
                                                                 #((top) (top))
                                                                 #("i" "i"))
                                                               #(ribcage
                                                                 #(f)
                                                                 #((top))
                                                                 #("i"))
                                                               #(ribcage
                                                                 #(_ m1 m2)
                                                                 #((top)
                                                                   (top)
                                                                   (top))
                                                                 #("i"
                                                                   "i"
                                                                   "i"))
                                                               #(ribcage
                                                                 ()
                                                                 ()
                                                                 ())
                                                               #(ribcage
                                                                 #(x)
                                                                 #((top))
                                                                 #("i"))
                                                               #(ribcage
                                                                 (#(import-token
                                                                    *top*))
                                                                 ()
                                                                 ()))))
                                                          any)))))
                                             ($syntax-dispatch
                                               (compile-in-annotation
                                                 clause_22h
                                                 value)
                                               '(any)))))
                                        ($syntax-dispatch
                                          (compile-in-annotation
                                            clause_22h
                                            value)
                                          '(#(free-id
                                              #(syntax-object
                                                else
                                                ((top)
                                                 #(ribcage () () ())
                                                 #(ribcage
                                                   #(clause clauses)
                                                   #((top) (top))
                                                   #("i" "i"))
                                                 #(ribcage
                                                   #(f)
                                                   #((top))
                                                   #("i"))
                                                 #(ribcage
                                                   #(_ m1 m2)
                                                   #((top) (top) (top))
                                                   #("i" "i" "i"))
                                                 #(ribcage () () ())
                                                 #(ribcage
                                                   #(x)
                                                   #((top))
                                                   #("i"))
                                                 #(ribcage
                                                   (#(import-token *top*))
                                                   ()
                                                   ()))))
                                            any
                                            .
                                            each-any)))
                                       ((lambda (tmp_22j)
                                          ((lambda (tmp_22m)
                                             (if tmp_22m
                                               (apply (lambda (e0_230)
                                                        (list '#(syntax-object
                                                                 let
                                                                 ((top)
                                                                  #(ribcage
                                                                    #(e0)
                                                                    #((top))
                                                                    #("i"))
                                                                  #(ribcage
                                                                    #(rest)
                                                                    #((top))
                                                                    #("i"))
                                                                  #(ribcage
                                                                    ()
                                                                    ()
                                                                    ())
                                                                  #(ribcage
                                                                    #(clause
                                                                      clauses)
                                                                    #((top)
                                                                      (top))
                                                                    #("i" "i"))
                                                                  #(ribcage
                                                                    #(f)
                                                                    #((top))
                                                                    #("i"))
                                                                  #(ribcage
                                                                    #(_ m1 m2)
                                                                    #((top)
                                                                      (top)
                                                                      (top))
                                                                    #("i"
                                                                      "i"
                                                                      "i"))
                                                                  #(ribcage
                                                                    ()
                                                                    ()
                                                                    ())
                                                                  #(ribcage
                                                                    #(x)
                                                                    #((top))
                                                                    #("i"))
                                                                  #(ribcage
                                                                    (#(import-token
                                                                       *top*))
                                                                    ()
                                                                    ())))
                                                              (list (list '#(syntax-object
                                                                             t
                                                                             ((top)
                                                                              #(ribcage
                                                                                #(e0)
                                                                                #((top))
                                                                                #("i"))
                                                                              #(ribcage
                                                                                #(rest)
                                                                                #((top))
                                                                                #("i"))
                                                                              #(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                              #(ribcage
                                                                                #(clause
                                                                                  clauses)
                                                                                #((top)
                                                                                  (top))
                                                                                #("i"
                                                                                  "i"))
                                                                              #(ribcage
                                                                                #(f)
                                                                                #((top))
                                                                                #("i"))
                                                                              #(ribcage
                                                                                #(_
                                                                                  m1
                                                                                  m2)
                                                                                #((top)
                                                                                  (top)
                                                                                  (top))
                                                                                #("i"
                                                                                  "i"
                                                                                  "i"))
                                                                              #(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                              #(ribcage
                                                                                #(x)
                                                                                #((top))
                                                                                #("i"))
                                                                              #(ribcage
                                                                                (#(import-token
                                                                                   *top*))
                                                                                ()
                                                                                ())))
                                                                          e0_230))
                                                              (list '#(syntax-object
                                                                       if
                                                                       ((top)
                                                                        #(ribcage
                                                                          #(e0)
                                                                          #((top))
                                                                          #("i"))
                                                                        #(ribcage
                                                                          #(rest)
                                                                          #((top))
                                                                          #("i"))
                                                                        #(ribcage
                                                                          ()
                                                                          ()
                                                                          ())
                                                                        #(ribcage
                                                                          #(clause
                                                                            clauses)
                                                                          #((top)
                                                                            (top))
                                                                          #("i"
                                                                            "i"))
                                                                        #(ribcage
                                                                          #(f)
                                                                          #((top))
                                                                          #("i"))
                                                                        #(ribcage
                                                                          #(_
                                                                            m1
                                                                            m2)
                                                                          #((top)
                                                                            (top)
                                                                            (top))
                                                                          #("i"
                                                                            "i"
                                                                            "i"))
                                                                        #(ribcage
                                                                          ()
                                                                          ()
                                                                          ())
                                                                        #(ribcage
                                                                          #(x)
                                                                          #((top))
                                                                          #("i"))
                                                                        #(ribcage
                                                                          (#(import-token
                                                                             *top*))
                                                                          ()
                                                                          ())))
                                                                    '#(syntax-object
                                                                       t
                                                                       ((top)
                                                                        #(ribcage
                                                                          #(e0)
                                                                          #((top))
                                                                          #("i"))
                                                                        #(ribcage
                                                                          #(rest)
                                                                          #((top))
                                                                          #("i"))
                                                                        #(ribcage
                                                                          ()
                                                                          ()
                                                                          ())
                                                                        #(ribcage
                                                                          #(clause
                                                                            clauses)
                                                                          #((top)
                                                                            (top))
                                                                          #("i"
                                                                            "i"))
                                                                        #(ribcage
                                                                          #(f)
                                                                          #((top))
                                                                          #("i"))
                                                                        #(ribcage
                                                                          #(_
                                                                            m1
                                                                            m2)
                                                                          #((top)
                                                                            (top)
                                                                            (top))
                                                                          #("i"
                                                                            "i"
                                                                            "i"))
                                                                        #(ribcage
                                                                          ()
                                                                          ()
                                                                          ())
                                                                        #(ribcage
                                                                          #(x)
                                                                          #((top))
                                                                          #("i"))
                                                                        #(ribcage
                                                                          (#(import-token
                                                                             *top*))
                                                                          ()
                                                                          ())))
                                                                    '#(syntax-object
                                                                       t
                                                                       ((top)
                                                                        #(ribcage
                                                                          #(e0)
                                                                          #((top))
                                                                          #("i"))
                                                                        #(ribcage
                                                                          #(rest)
                                                                          #((top))
                                                                          #("i"))
                                                                        #(ribcage
                                                                          ()
                                                                          ()
                                                                          ())
                                                                        #(ribcage
                                                                          #(clause
                                                                            clauses)
                                                                          #((top)
                                                                            (top))
                                                                          #("i"
                                                                            "i"))
                                                                        #(ribcage
                                                                          #(f)
                                                                          #((top))
                                                                          #("i"))
                                                                        #(ribcage
                                                                          #(_
                                                                            m1
                                                                            m2)
                                                                          #((top)
                                                                            (top)
                                                                            (top))
                                                                          #("i"
                                                                            "i"
                                                                            "i"))
                                                                        #(ribcage
                                                                          ()
                                                                          ()
                                                                          ())
                                                                        #(ribcage
                                                                          #(x)
                                                                          #((top))
                                                                          #("i"))
                                                                        #(ribcage
                                                                          (#(import-token
                                                                             *top*))
                                                                          ()
                                                                          ())))
                                                                    tmp_22j)))
                                                      tmp_22m)
                                               ((lambda (tmp_22n)
                                                  (if tmp_22n
                                                    (apply (lambda (e0_22u
                                                                    e1_22v)
                                                             (list '#(syntax-object
                                                                      let
                                                                      ((top)
                                                                       #(ribcage
                                                                         #(e0
                                                                           e1)
                                                                         #((top)
                                                                           (top))
                                                                         #("i"
                                                                           "i"))
                                                                       #(ribcage
                                                                         #(rest)
                                                                         #((top))
                                                                         #("i"))
                                                                       #(ribcage
                                                                         ()
                                                                         ()
                                                                         ())
                                                                       #(ribcage
                                                                         #(clause
                                                                           clauses)
                                                                         #((top)
                                                                           (top))
                                                                         #("i"
                                                                           "i"))
                                                                       #(ribcage
                                                                         #(f)
                                                                         #((top))
                                                                         #("i"))
                                                                       #(ribcage
                                                                         #(_
                                                                           m1
                                                                           m2)
                                                                         #((top)
                                                                           (top)
                                                                           (top))
                                                                         #("i"
                                                                           "i"
                                                                           "i"))
                                                                       #(ribcage
                                                                         ()
                                                                         ()
                                                                         ())
                                                                       #(ribcage
                                                                         #(x)
                                                                         #((top))
                                                                         #("i"))
                                                                       #(ribcage
                                                                         (#(import-token
                                                                            *top*))
                                                                         ()
                                                                         ())))
                                                                   (list (list '#(syntax-object
                                                                                  t
                                                                                  ((top)
                                                                                   #(ribcage
                                                                                     #(e0
                                                                                       e1)
                                                                                     #((top)
                                                                                       (top))
                                                                                     #("i"
                                                                                       "i"))
                                                                                   #(ribcage
                                                                                     #(rest)
                                                                                     #((top))
                                                                                     #("i"))
                                                                                   #(ribcage
                                                                                     ()
                                                                                     ()
                                                                                     ())
                                                                                   #(ribcage
                                                                                     #(clause
                                                                                       clauses)
                                                                                     #((top)
                                                                                       (top))
                                                                                     #("i"
                                                                                       "i"))
                                                                                   #(ribcage
                                                                                     #(f)
                                                                                     #((top))
                                                                                     #("i"))
                                                                                   #(ribcage
                                                                                     #(_
                                                                                       m1
                                                                                       m2)
                                                                                     #((top)
                                                                                       (top)
                                                                                       (top))
                                                                                     #("i"
                                                                                       "i"
                                                                                       "i"))
                                                                                   #(ribcage
                                                                                     ()
                                                                                     ()
                                                                                     ())
                                                                                   #(ribcage
                                                                                     #(x)
                                                                                     #((top))
                                                                                     #("i"))
                                                                                   #(ribcage
                                                                                     (#(import-token
                                                                                        *top*))
                                                                                     ()
                                                                                     ())))
                                                                               e0_22u))
                                                                   (list '#(syntax-object
                                                                            if
                                                                            ((top)
                                                                             #(ribcage
                                                                               #(e0
                                                                                 e1)
                                                                               #((top)
                                                                                 (top))
                                                                               #("i"
                                                                                 "i"))
                                                                             #(ribcage
                                                                               #(rest)
                                                                               #((top))
                                                                               #("i"))
                                                                             #(ribcage
                                                                               ()
                                                                               ()
                                                                               ())
                                                                             #(ribcage
                                                                               #(clause
                                                                                 clauses)
                                                                               #((top)
                                                                                 (top))
                                                                               #("i"
                                                                                 "i"))
                                                                             #(ribcage
                                                                               #(f)
                                                                               #((top))
                                                                               #("i"))
                                                                             #(ribcage
                                                                               #(_
                                                                                 m1
                                                                                 m2)
                                                                               #((top)
                                                                                 (top)
                                                                                 (top))
                                                                               #("i"
                                                                                 "i"
                                                                                 "i"))
                                                                             #(ribcage
                                                                               ()
                                                                               ()
                                                                               ())
                                                                             #(ribcage
                                                                               #(x)
                                                                               #((top))
                                                                               #("i"))
                                                                             #(ribcage
                                                                               (#(import-token
                                                                                  *top*))
                                                                               ()
                                                                               ())))
                                                                         '#(syntax-object
                                                                            t
                                                                            ((top)
                                                                             #(ribcage
                                                                               #(e0
                                                                                 e1)
                                                                               #((top)
                                                                                 (top))
                                                                               #("i"
                                                                                 "i"))
                                                                             #(ribcage
                                                                               #(rest)
                                                                               #((top))
                                                                               #("i"))
                                                                             #(ribcage
                                                                               ()
                                                                               ()
                                                                               ())
                                                                             #(ribcage
                                                                               #(clause
                                                                                 clauses)
                                                                               #((top)
                                                                                 (top))
                                                                               #("i"
                                                                                 "i"))
                                                                             #(ribcage
                                                                               #(f)
                                                                               #((top))
                                                                               #("i"))
                                                                             #(ribcage
                                                                               #(_
                                                                                 m1
                                                                                 m2)
                                                                               #((top)
                                                                                 (top)
                                                                                 (top))
                                                                               #("i"
                                                                                 "i"
                                                                                 "i"))
                                                                             #(ribcage
                                                                               ()
                                                                               ()
                                                                               ())
                                                                             #(ribcage
                                                                               #(x)
                                                                               #((top))
                                                                               #("i"))
                                                                             #(ribcage
                                                                               (#(import-token
                                                                                  *top*))
                                                                               ()
                                                                               ())))
                                                                         (cons e1_22v
                                                                               '#(syntax-object
                                                                                  (t)
                                                                                  ((top)
                                                                                   #(ribcage
                                                                                     #(e0
                                                                                       e1)
                                                                                     #((top)
                                                                                       (top))
                                                                                     #("i"
                                                                                       "i"))
                                                                                   #(ribcage
                                                                                     #(rest)
                                                                                     #((top))
                                                                                     #("i"))
                                                                                   #(ribcage
                                                                                     ()
                                                                                     ()
                                                                                     ())
                                                                                   #(ribcage
                                                                                     #(clause
                                                                                       clauses)
                                                                                     #((top)
                                                                                       (top))
                                                                                     #("i"
                                                                                       "i"))
                                                                                   #(ribcage
                                                                                     #(f)
                                                                                     #((top))
                                                                                     #("i"))
                                                                                   #(ribcage
                                                                                     #(_
                                                                                       m1
                                                                                       m2)
                                                                                     #((top)
                                                                                       (top)
                                                                                       (top))
                                                                                     #("i"
                                                                                       "i"
                                                                                       "i"))
                                                                                   #(ribcage
                                                                                     ()
                                                                                     ()
                                                                                     ())
                                                                                   #(ribcage
                                                                                     #(x)
                                                                                     #((top))
                                                                                     #("i"))
                                                                                   #(ribcage
                                                                                     (#(import-token
                                                                                        *top*))
                                                                                     ()
                                                                                     ()))))
                                                                         tmp_22j)))
                                                           tmp_22n)
                                                    ((lambda (tmp_22o)
                                                       (if tmp_22o
                                                         (apply (lambda (e0_22q
                                                                         e1_22r
                                                                         e2_22s)
                                                                  (list '#(syntax-object
                                                                           if
                                                                           ((top)
                                                                            #(ribcage
                                                                              #(e0
                                                                                e1
                                                                                e2)
                                                                              #((top)
                                                                                (top)
                                                                                (top))
                                                                              #("i"
                                                                                "i"
                                                                                "i"))
                                                                            #(ribcage
                                                                              #(rest)
                                                                              #((top))
                                                                              #("i"))
                                                                            #(ribcage
                                                                              ()
                                                                              ()
                                                                              ())
                                                                            #(ribcage
                                                                              #(clause
                                                                                clauses)
                                                                              #((top)
                                                                                (top))
                                                                              #("i"
                                                                                "i"))
                                                                            #(ribcage
                                                                              #(f)
                                                                              #((top))
                                                                              #("i"))
                                                                            #(ribcage
                                                                              #(_
                                                                                m1
                                                                                m2)
                                                                              #((top)
                                                                                (top)
                                                                                (top))
                                                                              #("i"
                                                                                "i"
                                                                                "i"))
                                                                            #(ribcage
                                                                              ()
                                                                              ()
                                                                              ())
                                                                            #(ribcage
                                                                              #(x)
                                                                              #((top))
                                                                              #("i"))
                                                                            #(ribcage
                                                                              (#(import-token
                                                                                 *top*))
                                                                              ()
                                                                              ())))
                                                                        e0_22q
                                                                        (cons '#(syntax-object
                                                                                 begin
                                                                                 ((top)
                                                                                  #(ribcage
                                                                                    #(e0
                                                                                      e1
                                                                                      e2)
                                                                                    #((top)
                                                                                      (top)
                                                                                      (top))
                                                                                    #("i"
                                                                                      "i"
                                                                                      "i"))
                                                                                  #(ribcage
                                                                                    #(rest)
                                                                                    #((top))
                                                                                    #("i"))
                                                                                  #(ribcage
                                                                                    ()
                                                                                    ()
                                                                                    ())
                                                                                  #(ribcage
                                                                                    #(clause
                                                                                      clauses)
                                                                                    #((top)
                                                                                      (top))
                                                                                    #("i"
                                                                                      "i"))
                                                                                  #(ribcage
                                                                                    #(f)
                                                                                    #((top))
                                                                                    #("i"))
                                                                                  #(ribcage
                                                                                    #(_
                                                                                      m1
                                                                                      m2)
                                                                                    #((top)
                                                                                      (top)
                                                                                      (top))
                                                                                    #("i"
                                                                                      "i"
                                                                                      "i"))
                                                                                  #(ribcage
                                                                                    ()
                                                                                    ()
                                                                                    ())
                                                                                  #(ribcage
                                                                                    #(x)
                                                                                    #((top))
                                                                                    #("i"))
                                                                                  #(ribcage
                                                                                    (#(import-token
                                                                                       *top*))
                                                                                    ()
                                                                                    ())))
                                                                              (cons e1_22r
                                                                                    e2_22s))
                                                                        tmp_22j))
                                                                tmp_22o)
                                                         (syntax-error x_22a)))
                                                     ($syntax-dispatch
                                                       (compile-in-annotation
                                                         clause_22h
                                                         value)
                                                       '(any any
                                                             .
                                                             each-any)))))
                                                ($syntax-dispatch
                                                  (compile-in-annotation
                                                    clause_22h
                                                    value)
                                                  '(any #(free-id
                                                          #(syntax-object
                                                            =>
                                                            ((top)
                                                             #(ribcage
                                                               #(rest)
                                                               #((top))
                                                               #("i"))
                                                             #(ribcage
                                                               ()
                                                               ()
                                                               ())
                                                             #(ribcage
                                                               #(clause
                                                                 clauses)
                                                               #((top) (top))
                                                               #("i" "i"))
                                                             #(ribcage
                                                               #(f)
                                                               #((top))
                                                               #("i"))
                                                             #(ribcage
                                                               #(_ m1 m2)
                                                               #((top)
                                                                 (top)
                                                                 (top))
                                                               #("i" "i" "i"))
                                                             #(ribcage
                                                               ()
                                                               ()
                                                               ())
                                                             #(ribcage
                                                               #(x)
                                                               #((top))
                                                               #("i"))
                                                             #(ribcage
                                                               (#(import-token
                                                                  *top*))
                                                               ()
                                                               ()))))
                                                        any)))))
                                           ($syntax-dispatch
                                             (compile-in-annotation
                                               clause_22h
                                               value)
                                             '(any))))
                                        (f_22g (car clauses_22i)
                                               (cdr clauses_22i)))))))
                     f_22g)
                   m1_22e
                   m2_22f))
                tmp_22c)
         (syntax-error x_22a)))
     ($syntax-dispatch
       (compile-in-annotation x_22a value)
       '(any any . each-any)))))
($sc-put-cte
  'do
  (lambda (orig-x_23i)
    ((lambda (tmp_23k)
       (if tmp_23k
         (apply (lambda (__23l
                         var_23m
                         init_23n
                         step_23o
                         e0_23p
                         e1_23q
                         c_23r)
                  ((lambda (tmp_23s)
                     ((lambda (tmp_246)
                        (if tmp_246
                          (apply (lambda (step_247)
                                   ((lambda (tmp_24a)
                                      (if tmp_24a
                                        (apply (lambda ()
                                                 (list '#(syntax-object
                                                          let
                                                          ((top)
                                                           #(ribcage
                                                             #(step)
                                                             #((top))
                                                             #("i"))
                                                           #(ribcage
                                                             #(_
                                                               var
                                                               init
                                                               step
                                                               e0
                                                               e1
                                                               c)
                                                             #((top)
                                                               (top)
                                                               (top)
                                                               (top)
                                                               (top)
                                                               (top)
                                                               (top))
                                                             #("i"
                                                               "i"
                                                               "i"
                                                               "i"
                                                               "i"
                                                               "i"
                                                               "i"))
                                                           #(ribcage () () ())
                                                           #(ribcage
                                                             #(orig-x)
                                                             #((top))
                                                             #("i"))
                                                           #(ribcage
                                                             (#(import-token
                                                                *top*))
                                                             ()
                                                             ())))
                                                       '#(syntax-object
                                                          doloop
                                                          ((top)
                                                           #(ribcage
                                                             #(step)
                                                             #((top))
                                                             #("i"))
                                                           #(ribcage
                                                             #(_
                                                               var
                                                               init
                                                               step
                                                               e0
                                                               e1
                                                               c)
                                                             #((top)
                                                               (top)
                                                               (top)
                                                               (top)
                                                               (top)
                                                               (top)
                                                               (top))
                                                             #("i"
                                                               "i"
                                                               "i"
                                                               "i"
                                                               "i"
                                                               "i"
                                                               "i"))
                                                           #(ribcage () () ())
                                                           #(ribcage
                                                             #(orig-x)
                                                             #((top))
                                                             #("i"))
                                                           #(ribcage
                                                             (#(import-token
                                                                *top*))
                                                             ()
                                                             ())))
                                                       (map list
                                                            var_23m
                                                            init_23n)
                                                       (list '#(syntax-object
                                                                if
                                                                ((top)
                                                                 #(ribcage
                                                                   #(step)
                                                                   #((top))
                                                                   #("i"))
                                                                 #(ribcage
                                                                   #(_
                                                                     var
                                                                     init
                                                                     step
                                                                     e0
                                                                     e1
                                                                     c)
                                                                   #((top)
                                                                     (top)
                                                                     (top)
                                                                     (top)
                                                                     (top)
                                                                     (top)
                                                                     (top))
                                                                   #("i"
                                                                     "i"
                                                                     "i"
                                                                     "i"
                                                                     "i"
                                                                     "i"
                                                                     "i"))
                                                                 #(ribcage
                                                                   ()
                                                                   ()
                                                                   ())
                                                                 #(ribcage
                                                                   #(orig-x)
                                                                   #((top))
                                                                   #("i"))
                                                                 #(ribcage
                                                                   (#(import-token
                                                                      *top*))
                                                                   ()
                                                                   ())))
                                                             (list '#(syntax-object
                                                                      not
                                                                      ((top)
                                                                       #(ribcage
                                                                         #(step)
                                                                         #((top))
                                                                         #("i"))
                                                                       #(ribcage
                                                                         #(_
                                                                           var
                                                                           init
                                                                           step
                                                                           e0
                                                                           e1
                                                                           c)
                                                                         #((top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top))
                                                                         #("i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"))
                                                                       #(ribcage
                                                                         ()
                                                                         ()
                                                                         ())
                                                                       #(ribcage
                                                                         #(orig-x)
                                                                         #((top))
                                                                         #("i"))
                                                                       #(ribcage
                                                                         (#(import-token
                                                                            *top*))
                                                                         ()
                                                                         ())))
                                                                   e0_23p)
                                                             (cons '#(syntax-object
                                                                      begin
                                                                      ((top)
                                                                       #(ribcage
                                                                         #(step)
                                                                         #((top))
                                                                         #("i"))
                                                                       #(ribcage
                                                                         #(_
                                                                           var
                                                                           init
                                                                           step
                                                                           e0
                                                                           e1
                                                                           c)
                                                                         #((top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top))
                                                                         #("i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"))
                                                                       #(ribcage
                                                                         ()
                                                                         ()
                                                                         ())
                                                                       #(ribcage
                                                                         #(orig-x)
                                                                         #((top))
                                                                         #("i"))
                                                                       #(ribcage
                                                                         (#(import-token
                                                                            *top*))
                                                                         ()
                                                                         ())))
                                                                   (append
                                                                     c_23r
                                                                     (list (cons '#(syntax-object
                                                                                    doloop
                                                                                    ((top)
                                                                                     #(ribcage
                                                                                       #(step)
                                                                                       #((top))
                                                                                       #("i"))
                                                                                     #(ribcage
                                                                                       #(_
                                                                                         var
                                                                                         init
                                                                                         step
                                                                                         e0
                                                                                         e1
                                                                                         c)
                                                                                       #((top)
                                                                                         (top)
                                                                                         (top)
                                                                                         (top)
                                                                                         (top)
                                                                                         (top)
                                                                                         (top))
                                                                                       #("i"
                                                                                         "i"
                                                                                         "i"
                                                                                         "i"
                                                                                         "i"
                                                                                         "i"
                                                                                         "i"))
                                                                                     #(ribcage
                                                                                       ()
                                                                                       ()
                                                                                       ())
                                                                                     #(ribcage
                                                                                       #(orig-x)
                                                                                       #((top))
                                                                                       #("i"))
                                                                                     #(ribcage
                                                                                       (#(import-token
                                                                                          *top*))
                                                                                       ()
                                                                                       ())))
                                                                                 step_247)))))))
                                               tmp_24a)
                                        ((lambda (tmp_24b)
                                           (if tmp_24b
                                             (apply (lambda (e1_24c e2_24d)
                                                      (list '#(syntax-object
                                                               let
                                                               ((top)
                                                                #(ribcage
                                                                  #(e1 e2)
                                                                  #((top)
                                                                    (top))
                                                                  #("i" "i"))
                                                                #(ribcage
                                                                  #(step)
                                                                  #((top))
                                                                  #("i"))
                                                                #(ribcage
                                                                  #(_
                                                                    var
                                                                    init
                                                                    step
                                                                    e0
                                                                    e1
                                                                    c)
                                                                  #((top)
                                                                    (top)
                                                                    (top)
                                                                    (top)
                                                                    (top)
                                                                    (top)
                                                                    (top))
                                                                  #("i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"))
                                                                #(ribcage
                                                                  ()
                                                                  ()
                                                                  ())
                                                                #(ribcage
                                                                  #(orig-x)
                                                                  #((top))
                                                                  #("i"))
                                                                #(ribcage
                                                                  (#(import-token
                                                                     *top*))
                                                                  ()
                                                                  ())))
                                                            '#(syntax-object
                                                               doloop
                                                               ((top)
                                                                #(ribcage
                                                                  #(e1 e2)
                                                                  #((top)
                                                                    (top))
                                                                  #("i" "i"))
                                                                #(ribcage
                                                                  #(step)
                                                                  #((top))
                                                                  #("i"))
                                                                #(ribcage
                                                                  #(_
                                                                    var
                                                                    init
                                                                    step
                                                                    e0
                                                                    e1
                                                                    c)
                                                                  #((top)
                                                                    (top)
                                                                    (top)
                                                                    (top)
                                                                    (top)
                                                                    (top)
                                                                    (top))
                                                                  #("i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"))
                                                                #(ribcage
                                                                  ()
                                                                  ()
                                                                  ())
                                                                #(ribcage
                                                                  #(orig-x)
                                                                  #((top))
                                                                  #("i"))
                                                                #(ribcage
                                                                  (#(import-token
                                                                     *top*))
                                                                  ()
                                                                  ())))
                                                            (map list
                                                                 var_23m
                                                                 init_23n)
                                                            (list '#(syntax-object
                                                                     if
                                                                     ((top)
                                                                      #(ribcage
                                                                        #(e1
                                                                          e2)
                                                                        #((top)
                                                                          (top))
                                                                        #("i"
                                                                          "i"))
                                                                      #(ribcage
                                                                        #(step)
                                                                        #((top))
                                                                        #("i"))
                                                                      #(ribcage
                                                                        #(_
                                                                          var
                                                                          init
                                                                          step
                                                                          e0
                                                                          e1
                                                                          c)
                                                                        #((top)
                                                                          (top)
                                                                          (top)
                                                                          (top)
                                                                          (top)
                                                                          (top)
                                                                          (top))
                                                                        #("i"
                                                                          "i"
                                                                          "i"
                                                                          "i"
                                                                          "i"
                                                                          "i"
                                                                          "i"))
                                                                      #(ribcage
                                                                        ()
                                                                        ()
                                                                        ())
                                                                      #(ribcage
                                                                        #(orig-x)
                                                                        #((top))
                                                                        #("i"))
                                                                      #(ribcage
                                                                        (#(import-token
                                                                           *top*))
                                                                        ()
                                                                        ())))
                                                                  e0_23p
                                                                  (cons '#(syntax-object
                                                                           begin
                                                                           ((top)
                                                                            #(ribcage
                                                                              #(e1
                                                                                e2)
                                                                              #((top)
                                                                                (top))
                                                                              #("i"
                                                                                "i"))
                                                                            #(ribcage
                                                                              #(step)
                                                                              #((top))
                                                                              #("i"))
                                                                            #(ribcage
                                                                              #(_
                                                                                var
                                                                                init
                                                                                step
                                                                                e0
                                                                                e1
                                                                                c)
                                                                              #((top)
                                                                                (top)
                                                                                (top)
                                                                                (top)
                                                                                (top)
                                                                                (top)
                                                                                (top))
                                                                              #("i"
                                                                                "i"
                                                                                "i"
                                                                                "i"
                                                                                "i"
                                                                                "i"
                                                                                "i"))
                                                                            #(ribcage
                                                                              ()
                                                                              ()
                                                                              ())
                                                                            #(ribcage
                                                                              #(orig-x)
                                                                              #((top))
                                                                              #("i"))
                                                                            #(ribcage
                                                                              (#(import-token
                                                                                 *top*))
                                                                              ()
                                                                              ())))
                                                                        (cons e1_24c
                                                                              e2_24d))
                                                                  (cons '#(syntax-object
                                                                           begin
                                                                           ((top)
                                                                            #(ribcage
                                                                              #(e1
                                                                                e2)
                                                                              #((top)
                                                                                (top))
                                                                              #("i"
                                                                                "i"))
                                                                            #(ribcage
                                                                              #(step)
                                                                              #((top))
                                                                              #("i"))
                                                                            #(ribcage
                                                                              #(_
                                                                                var
                                                                                init
                                                                                step
                                                                                e0
                                                                                e1
                                                                                c)
                                                                              #((top)
                                                                                (top)
                                                                                (top)
                                                                                (top)
                                                                                (top)
                                                                                (top)
                                                                                (top))
                                                                              #("i"
                                                                                "i"
                                                                                "i"
                                                                                "i"
                                                                                "i"
                                                                                "i"
                                                                                "i"))
                                                                            #(ribcage
                                                                              ()
                                                                              ()
                                                                              ())
                                                                            #(ribcage
                                                                              #(orig-x)
                                                                              #((top))
                                                                              #("i"))
                                                                            #(ribcage
                                                                              (#(import-token
                                                                                 *top*))
                                                                              ()
                                                                              ())))
                                                                        (append
                                                                          c_23r
                                                                          (list (cons '#(syntax-object
                                                                                         doloop
                                                                                         ((top)
                                                                                          #(ribcage
                                                                                            #(e1
                                                                                              e2)
                                                                                            #((top)
                                                                                              (top))
                                                                                            #("i"
                                                                                              "i"))
                                                                                          #(ribcage
                                                                                            #(step)
                                                                                            #((top))
                                                                                            #("i"))
                                                                                          #(ribcage
                                                                                            #(_
                                                                                              var
                                                                                              init
                                                                                              step
                                                                                              e0
                                                                                              e1
                                                                                              c)
                                                                                            #((top)
                                                                                              (top)
                                                                                              (top)
                                                                                              (top)
                                                                                              (top)
                                                                                              (top)
                                                                                              (top))
                                                                                            #("i"
                                                                                              "i"
                                                                                              "i"
                                                                                              "i"
                                                                                              "i"
                                                                                              "i"
                                                                                              "i"))
                                                                                          #(ribcage
                                                                                            ()
                                                                                            ()
                                                                                            ())
                                                                                          #(ribcage
                                                                                            #(orig-x)
                                                                                            #((top))
                                                                                            #("i"))
                                                                                          #(ribcage
                                                                                            (#(import-token
                                                                                               *top*))
                                                                                            ()
                                                                                            ())))
                                                                                      step_247)))))))
                                                    tmp_24b)
                                             (syntax-error e1_23q)))
                                         ($syntax-dispatch
                                           (compile-in-annotation e1_23q value)
                                           '(any . each-any)))))
                                    ($syntax-dispatch
                                      (compile-in-annotation e1_23q value)
                                      '())))
                                 tmp_246)
                          (syntax-error tmp_23s)))
                      ($syntax-dispatch
                        (compile-in-annotation tmp_23s value)
                        'each-any)))
                   (map (lambda (v_23t s_23u)
                          ((lambda (tmp_240)
                             (if tmp_240
                               (apply (lambda () v_23t) tmp_240)
                               ((lambda (tmp_241)
                                  (if tmp_241
                                    (apply (lambda (e_243) e_243) tmp_241)
                                    (syntax-error orig-x_23i)))
                                ($syntax-dispatch
                                  (compile-in-annotation s_23u value)
                                  '(any)))))
                           ($syntax-dispatch
                             (compile-in-annotation s_23u value)
                             '())))
                        var_23m
                        step_23o)))
                tmp_23k)
         (syntax-error orig-x_23i)))
     ($syntax-dispatch
       (compile-in-annotation orig-x_23i value)
       '(any #(each (any any . any))
             (any . each-any)
             .
             each-any)))))
($sc-put-cte
  'quasiquote
  (letrec ((isquote?_24n
             (lambda (x_255)
               (if (identifier? x_255)
                 (free-identifier=?
                   x_255
                   '#(syntax-object
                      quote
                      ((top)
                       #(ribcage () () ())
                       #(ribcage #(x) #((top)) #("i"))
                       #(ribcage
                         #(isquote?
                           islist?
                           iscons?
                           quote-nil?
                           quasilist*
                           quasicons
                           quasiappend
                           quasivector
                           quasi)
                         #((top)
                           (top)
                           (top)
                           (top)
                           (top)
                           (top)
                           (top)
                           (top)
                           (top))
                         #("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                       #(ribcage (#(import-token *top*)) () ()))))
                 '#f)))
           (islist?_24o
             (lambda (x_256)
               (if (identifier? x_256)
                 (free-identifier=?
                   x_256
                   '#(syntax-object
                      list
                      ((top)
                       #(ribcage () () ())
                       #(ribcage #(x) #((top)) #("i"))
                       #(ribcage
                         #(isquote?
                           islist?
                           iscons?
                           quote-nil?
                           quasilist*
                           quasicons
                           quasiappend
                           quasivector
                           quasi)
                         #((top)
                           (top)
                           (top)
                           (top)
                           (top)
                           (top)
                           (top)
                           (top)
                           (top))
                         #("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                       #(ribcage (#(import-token *top*)) () ()))))
                 '#f)))
           (iscons?_24p
             (lambda (x_257)
               (if (identifier? x_257)
                 (free-identifier=?
                   x_257
                   '#(syntax-object
                      cons
                      ((top)
                       #(ribcage () () ())
                       #(ribcage #(x) #((top)) #("i"))
                       #(ribcage
                         #(isquote?
                           islist?
                           iscons?
                           quote-nil?
                           quasilist*
                           quasicons
                           quasiappend
                           quasivector
                           quasi)
                         #((top)
                           (top)
                           (top)
                           (top)
                           (top)
                           (top)
                           (top)
                           (top)
                           (top))
                         #("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                       #(ribcage (#(import-token *top*)) () ()))))
                 '#f)))
           (quote-nil?_24q
             (lambda (x_258)
               ((lambda (tmp_25a)
                  (if tmp_25a
                    (apply (lambda (quote?_25c) (isquote?_24n quote?_25c))
                           tmp_25a)
                    '#f))
                ($syntax-dispatch
                  (compile-in-annotation x_258 value)
                  '(any ())))))
           (quasilist*_24r
             (lambda (x_25d y_25e)
               ((letrec ((f_25f (lambda (x_25g)
                                  (if (null? x_25g)
                                    y_25e
                                    (quasicons_24s
                                      (car x_25g)
                                      (f_25f (cdr x_25g)))))))
                  f_25f)
                x_25d)))
           (quasicons_24s
             (lambda (x_25h y_25i)
               ((lambda (tmp_25j)
                  ((lambda (tmp_25k)
                     (if tmp_25k
                       (apply (lambda (x_25l y_25m)
                                ((lambda (tmp_25o)
                                   (if (if tmp_25o
                                         (apply (lambda (quote?_268 dy_269)
                                                  (isquote?_24n quote?_268))
                                                tmp_25o)
                                         '#f)
                                     (apply (lambda (quote?_25v dy_260)
                                              ((lambda (tmp_262)
                                                 (if (if tmp_262
                                                       (apply (lambda (quote?_266
                                                                       dx_267)
                                                                (isquote?_24n
                                                                  quote?_266))
                                                              tmp_262)
                                                       '#f)
                                                   (apply (lambda (quote?_264
                                                                   dx_265)
                                                            (list '#(syntax-object
                                                                     quote
                                                                     ((top)
                                                                      #(ribcage
                                                                        #(quote?
                                                                          dx)
                                                                        #((top)
                                                                          (top))
                                                                        #("i"
                                                                          "i"))
                                                                      #(ribcage
                                                                        #(quote?
                                                                          dy)
                                                                        #((top)
                                                                          (top))
                                                                        #("i"
                                                                          "i"))
                                                                      #(ribcage
                                                                        #(x y)
                                                                        #((top)
                                                                          (top))
                                                                        #("i"
                                                                          "i"))
                                                                      #(ribcage
                                                                        ()
                                                                        ()
                                                                        ())
                                                                      #(ribcage
                                                                        #(x y)
                                                                        #((top)
                                                                          (top))
                                                                        #("i"
                                                                          "i"))
                                                                      #(ribcage
                                                                        #(isquote?
                                                                          islist?
                                                                          iscons?
                                                                          quote-nil?
                                                                          quasilist*
                                                                          quasicons
                                                                          quasiappend
                                                                          quasivector
                                                                          quasi)
                                                                        #((top)
                                                                          (top)
                                                                          (top)
                                                                          (top)
                                                                          (top)
                                                                          (top)
                                                                          (top)
                                                                          (top)
                                                                          (top))
                                                                        #("i"
                                                                          "i"
                                                                          "i"
                                                                          "i"
                                                                          "i"
                                                                          "i"
                                                                          "i"
                                                                          "i"
                                                                          "i"))
                                                                      #(ribcage
                                                                        (#(import-token
                                                                           *top*))
                                                                        ()
                                                                        ())))
                                                                  (cons dx_265
                                                                        dy_260)))
                                                          tmp_262)
                                                   (if (null? dy_260)
                                                     (list '#(syntax-object
                                                              list
                                                              ((top)
                                                               #(ribcage
                                                                 #(_)
                                                                 #((top))
                                                                 #("i"))
                                                               #(ribcage
                                                                 #(quote? dy)
                                                                 #((top) (top))
                                                                 #("i" "i"))
                                                               #(ribcage
                                                                 #(x y)
                                                                 #((top) (top))
                                                                 #("i" "i"))
                                                               #(ribcage
                                                                 ()
                                                                 ()
                                                                 ())
                                                               #(ribcage
                                                                 #(x y)
                                                                 #((top) (top))
                                                                 #("i" "i"))
                                                               #(ribcage
                                                                 #(isquote?
                                                                   islist?
                                                                   iscons?
                                                                   quote-nil?
                                                                   quasilist*
                                                                   quasicons
                                                                   quasiappend
                                                                   quasivector
                                                                   quasi)
                                                                 #((top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top))
                                                                 #("i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"))
                                                               #(ribcage
                                                                 (#(import-token
                                                                    *top*))
                                                                 ()
                                                                 ())))
                                                           x_25l)
                                                     (list '#(syntax-object
                                                              cons
                                                              ((top)
                                                               #(ribcage
                                                                 #(_)
                                                                 #((top))
                                                                 #("i"))
                                                               #(ribcage
                                                                 #(quote? dy)
                                                                 #((top) (top))
                                                                 #("i" "i"))
                                                               #(ribcage
                                                                 #(x y)
                                                                 #((top) (top))
                                                                 #("i" "i"))
                                                               #(ribcage
                                                                 ()
                                                                 ()
                                                                 ())
                                                               #(ribcage
                                                                 #(x y)
                                                                 #((top) (top))
                                                                 #("i" "i"))
                                                               #(ribcage
                                                                 #(isquote?
                                                                   islist?
                                                                   iscons?
                                                                   quote-nil?
                                                                   quasilist*
                                                                   quasicons
                                                                   quasiappend
                                                                   quasivector
                                                                   quasi)
                                                                 #((top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top))
                                                                 #("i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"))
                                                               #(ribcage
                                                                 (#(import-token
                                                                    *top*))
                                                                 ()
                                                                 ())))
                                                           x_25l
                                                           y_25m))))
                                               ($syntax-dispatch
                                                 (compile-in-annotation
                                                   x_25l
                                                   value)
                                                 '(any any))))
                                            tmp_25o)
                                     ((lambda (tmp_25p)
                                        (if (if tmp_25p
                                              (apply (lambda (listp_25t
                                                              stuff_25u)
                                                       (islist?_24o listp_25t))
                                                     tmp_25p)
                                              '#f)
                                          (apply (lambda (listp_25r stuff_25s)
                                                   (cons '#(syntax-object
                                                            list
                                                            ((top)
                                                             #(ribcage
                                                               #(listp stuff)
                                                               #((top) (top))
                                                               #("i" "i"))
                                                             #(ribcage
                                                               #(x y)
                                                               #((top) (top))
                                                               #("i" "i"))
                                                             #(ribcage
                                                               ()
                                                               ()
                                                               ())
                                                             #(ribcage
                                                               #(x y)
                                                               #((top) (top))
                                                               #("i" "i"))
                                                             #(ribcage
                                                               #(isquote?
                                                                 islist?
                                                                 iscons?
                                                                 quote-nil?
                                                                 quasilist*
                                                                 quasicons
                                                                 quasiappend
                                                                 quasivector
                                                                 quasi)
                                                               #((top)
                                                                 (top)
                                                                 (top)
                                                                 (top)
                                                                 (top)
                                                                 (top)
                                                                 (top)
                                                                 (top)
                                                                 (top))
                                                               #("i"
                                                                 "i"
                                                                 "i"
                                                                 "i"
                                                                 "i"
                                                                 "i"
                                                                 "i"
                                                                 "i"
                                                                 "i"))
                                                             #(ribcage
                                                               (#(import-token
                                                                  *top*))
                                                               ()
                                                               ())))
                                                         (cons x_25l
                                                               stuff_25s)))
                                                 tmp_25p)
                                          (list '#(syntax-object
                                                   cons
                                                   ((top)
                                                    #(ribcage
                                                      #(else)
                                                      #((top))
                                                      #("i"))
                                                    #(ribcage
                                                      #(x y)
                                                      #((top) (top))
                                                      #("i" "i"))
                                                    #(ribcage () () ())
                                                    #(ribcage
                                                      #(x y)
                                                      #((top) (top))
                                                      #("i" "i"))
                                                    #(ribcage
                                                      #(isquote?
                                                        islist?
                                                        iscons?
                                                        quote-nil?
                                                        quasilist*
                                                        quasicons
                                                        quasiappend
                                                        quasivector
                                                        quasi)
                                                      #((top)
                                                        (top)
                                                        (top)
                                                        (top)
                                                        (top)
                                                        (top)
                                                        (top)
                                                        (top)
                                                        (top))
                                                      #("i"
                                                        "i"
                                                        "i"
                                                        "i"
                                                        "i"
                                                        "i"
                                                        "i"
                                                        "i"
                                                        "i"))
                                                    #(ribcage
                                                      (#(import-token *top*))
                                                      ()
                                                      ())))
                                                x_25l
                                                y_25m)))
                                      ($syntax-dispatch
                                        (compile-in-annotation y_25m value)
                                        '(any . any)))))
                                 ($syntax-dispatch
                                   (compile-in-annotation y_25m value)
                                   '(any any))))
                              tmp_25k)
                       (syntax-error tmp_25j)))
                   ($syntax-dispatch
                     (compile-in-annotation tmp_25j value)
                     '(any any))))
                (list x_25h y_25i))))
           (quasiappend_24t
             (lambda (x_26a y_26b)
               ((lambda (ls_26c)
                  (if (null? ls_26c)
                    '#(syntax-object
                       '()
                       ((top)
                        #(ribcage () () ())
                        #(ribcage #(ls) #((top)) #("i"))
                        #(ribcage () () ())
                        #(ribcage #(x y) #((top) (top)) #("i" "i"))
                        #(ribcage
                          #(isquote?
                            islist?
                            iscons?
                            quote-nil?
                            quasilist*
                            quasicons
                            quasiappend
                            quasivector
                            quasi)
                          #((top)
                            (top)
                            (top)
                            (top)
                            (top)
                            (top)
                            (top)
                            (top)
                            (top))
                          #("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                        #(ribcage (#(import-token *top*)) () ())))
                    (if (null? (cdr ls_26c))
                      (car ls_26c)
                      ((lambda (tmp_26e)
                         (if tmp_26e
                           (apply (lambda (p_26f)
                                    (cons '#(syntax-object
                                             append
                                             ((top)
                                              #(ribcage #(p) #((top)) #("i"))
                                              #(ribcage () () ())
                                              #(ribcage #(ls) #((top)) #("i"))
                                              #(ribcage () () ())
                                              #(ribcage
                                                #(x y)
                                                #((top) (top))
                                                #("i" "i"))
                                              #(ribcage
                                                #(isquote?
                                                  islist?
                                                  iscons?
                                                  quote-nil?
                                                  quasilist*
                                                  quasicons
                                                  quasiappend
                                                  quasivector
                                                  quasi)
                                                #((top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top))
                                                #("i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"))
                                              #(ribcage
                                                (#(import-token *top*))
                                                ()
                                                ())))
                                          p_26f))
                                  tmp_26e)
                           (syntax-error ls_26c)))
                       ($syntax-dispatch
                         (compile-in-annotation ls_26c value)
                         'each-any)))))
                ((letrec ((f_26h (lambda (x_26i)
                                   (if (null? x_26i)
                                     (if (quote-nil?_24q y_26b)
                                       '()
                                       (list y_26b))
                                     (if (quote-nil?_24q (car x_26i))
                                       (f_26h (cdr x_26i))
                                       (cons (car x_26i)
                                             (f_26h (cdr x_26i))))))))
                   f_26h)
                 x_26a))))
           (quasivector_24u
             (lambda (x_26j)
               ((lambda (tmp_26n)
                  (if (if tmp_26n
                        (apply (lambda (quote?_27m x_27n)
                                 (isquote?_24n quote?_27m))
                               tmp_26n)
                        '#f)
                    (apply (lambda (quote?_27j x_27k)
                             (list '#(syntax-object
                                      quote
                                      ((top)
                                       #(ribcage
                                         #(quote? x)
                                         #((top) (top))
                                         #("i" "i"))
                                       #(ribcage #(pat-x) #((top)) #("i"))
                                       #(ribcage () () ())
                                       #(ribcage #(x) #((top)) #("i"))
                                       #(ribcage
                                         #(isquote?
                                           islist?
                                           iscons?
                                           quote-nil?
                                           quasilist*
                                           quasicons
                                           quasiappend
                                           quasivector
                                           quasi)
                                         #((top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top))
                                         #("i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"))
                                       #(ribcage
                                         (#(import-token *top*))
                                         ()
                                         ())))
                                   (list->vector x_27k)))
                           tmp_26n)
                    ((letrec ((f_26p (lambda (x_26q k_26r)
                                       ((lambda (tmp_26t)
                                          (if (if tmp_26t
                                                (apply (lambda (quote?_27g
                                                                x_27h)
                                                         (isquote?_24n
                                                           quote?_27g))
                                                       tmp_26t)
                                                '#f)
                                            (apply (lambda (quote?_27d x_27e)
                                                     (k_26r (map (lambda (tmp_27f)
                                                                   (list '#(syntax-object
                                                                            quote
                                                                            ((top)
                                                                             #(ribcage
                                                                               #(quote?
                                                                                 x)
                                                                               #((top)
                                                                                 (top))
                                                                               #("i"
                                                                                 "i"))
                                                                             #(ribcage
                                                                               ()
                                                                               ()
                                                                               ())
                                                                             #(ribcage
                                                                               #(x
                                                                                 k)
                                                                               #((top)
                                                                                 (top))
                                                                               #("i"
                                                                                 "i"))
                                                                             #(ribcage
                                                                               #(f)
                                                                               #((top))
                                                                               #("i"))
                                                                             #(ribcage
                                                                               #(_)
                                                                               #((top))
                                                                               #("i"))
                                                                             #(ribcage
                                                                               #(pat-x)
                                                                               #((top))
                                                                               #("i"))
                                                                             #(ribcage
                                                                               ()
                                                                               ()
                                                                               ())
                                                                             #(ribcage
                                                                               #(x)
                                                                               #((top))
                                                                               #("i"))
                                                                             #(ribcage
                                                                               #(isquote?
                                                                                 islist?
                                                                                 iscons?
                                                                                 quote-nil?
                                                                                 quasilist*
                                                                                 quasicons
                                                                                 quasiappend
                                                                                 quasivector
                                                                                 quasi)
                                                                               #((top)
                                                                                 (top)
                                                                                 (top)
                                                                                 (top)
                                                                                 (top)
                                                                                 (top)
                                                                                 (top)
                                                                                 (top)
                                                                                 (top))
                                                                               #("i"
                                                                                 "i"
                                                                                 "i"
                                                                                 "i"
                                                                                 "i"
                                                                                 "i"
                                                                                 "i"
                                                                                 "i"
                                                                                 "i"))
                                                                             #(ribcage
                                                                               (#(import-token
                                                                                  *top*))
                                                                               ()
                                                                               ())))
                                                                         tmp_27f))
                                                                 x_27e)))
                                                   tmp_26t)
                                            ((lambda (tmp_26u)
                                               (if (if tmp_26u
                                                     (apply (lambda (listp_27b
                                                                     x_27c)
                                                              (islist?_24o
                                                                listp_27b))
                                                            tmp_26u)
                                                     '#f)
                                                 (apply (lambda (listp_278
                                                                 x_279)
                                                          (k_26r x_279))
                                                        tmp_26u)
                                                 ((lambda (tmp_26v)
                                                    (if (if tmp_26v
                                                          (apply (lambda (cons?_275
                                                                          x_276
                                                                          y_277)
                                                                   (iscons?_24p
                                                                     cons?_275))
                                                                 tmp_26v)
                                                          '#f)
                                                      (apply (lambda (cons?_271
                                                                      x_272
                                                                      y_273)
                                                               (f_26p y_273
                                                                      (lambda (ls_274)
                                                                        (k_26r (cons x_272
                                                                                     ls_274)))))
                                                             tmp_26v)
                                                      (list '#(syntax-object
                                                               list->vector
                                                               ((top)
                                                                #(ribcage
                                                                  #(else)
                                                                  #((top))
                                                                  #("i"))
                                                                #(ribcage
                                                                  ()
                                                                  ()
                                                                  ())
                                                                #(ribcage
                                                                  #(x k)
                                                                  #((top)
                                                                    (top))
                                                                  #("i" "i"))
                                                                #(ribcage
                                                                  #(f)
                                                                  #((top))
                                                                  #("i"))
                                                                #(ribcage
                                                                  #(_)
                                                                  #((top))
                                                                  #("i"))
                                                                #(ribcage
                                                                  #(pat-x)
                                                                  #((top))
                                                                  #("i"))
                                                                #(ribcage
                                                                  ()
                                                                  ()
                                                                  ())
                                                                #(ribcage
                                                                  #(x)
                                                                  #((top))
                                                                  #("i"))
                                                                #(ribcage
                                                                  #(isquote?
                                                                    islist?
                                                                    iscons?
                                                                    quote-nil?
                                                                    quasilist*
                                                                    quasicons
                                                                    quasiappend
                                                                    quasivector
                                                                    quasi)
                                                                  #((top)
                                                                    (top)
                                                                    (top)
                                                                    (top)
                                                                    (top)
                                                                    (top)
                                                                    (top)
                                                                    (top)
                                                                    (top))
                                                                  #("i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"))
                                                                #(ribcage
                                                                  (#(import-token
                                                                     *top*))
                                                                  ()
                                                                  ())))
                                                            x_26j)))
                                                  ($syntax-dispatch
                                                    (compile-in-annotation
                                                      x_26q
                                                      value)
                                                    '(any any any)))))
                                             ($syntax-dispatch
                                               (compile-in-annotation
                                                 x_26q
                                                 value)
                                               '(any . each-any)))))
                                        ($syntax-dispatch
                                          (compile-in-annotation x_26q value)
                                          '(any each-any))))))
                       f_26p)
                     x_26j
                     (lambda (ls_27i)
                       (cons '#(syntax-object
                                vector
                                ((top)
                                 #(ribcage () () ())
                                 #(ribcage #(ls) #((top)) #("i"))
                                 #(ribcage #(_) #((top)) #("i"))
                                 #(ribcage #(pat-x) #((top)) #("i"))
                                 #(ribcage () () ())
                                 #(ribcage #(x) #((top)) #("i"))
                                 #(ribcage
                                   #(isquote?
                                     islist?
                                     iscons?
                                     quote-nil?
                                     quasilist*
                                     quasicons
                                     quasiappend
                                     quasivector
                                     quasi)
                                   #((top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top)
                                     (top))
                                   #("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                                 #(ribcage (#(import-token *top*)) () ())))
                             ls_27i)))))
                ($syntax-dispatch
                  (compile-in-annotation x_26j value)
                  '(any each-any)))))
           (quasi_24v
             (lambda (p_27o lev_27p)
               ((lambda (tmp_27r)
                  (if tmp_27r
                    (apply (lambda (p_28f)
                             (if (= lev_27p '0)
                               p_28f
                               (quasicons_24s
                                 '#(syntax-object
                                    'unquote
                                    ((top)
                                     #(ribcage #(p) #((top)) #("i"))
                                     #(ribcage () () ())
                                     #(ribcage
                                       #(p lev)
                                       #((top) (top))
                                       #("i" "i"))
                                     #(ribcage
                                       #(isquote?
                                         islist?
                                         iscons?
                                         quote-nil?
                                         quasilist*
                                         quasicons
                                         quasiappend
                                         quasivector
                                         quasi)
                                       #((top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top))
                                       #("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                                     #(ribcage (#(import-token *top*)) () ())))
                                 (quasi_24v (list p_28f) (- lev_27p '1)))))
                           tmp_27r)
                    ((lambda (tmp_27s)
                       (if tmp_27s
                         (apply (lambda (p_28b q_28c)
                                  (if (= lev_27p '0)
                                    (quasilist*_24r
                                      p_28b
                                      (quasi_24v q_28c lev_27p))
                                    (quasicons_24s
                                      (quasicons_24s
                                        '#(syntax-object
                                           'unquote
                                           ((top)
                                            #(ribcage
                                              #(p q)
                                              #((top) (top))
                                              #("i" "i"))
                                            #(ribcage () () ())
                                            #(ribcage
                                              #(p lev)
                                              #((top) (top))
                                              #("i" "i"))
                                            #(ribcage
                                              #(isquote?
                                                islist?
                                                iscons?
                                                quote-nil?
                                                quasilist*
                                                quasicons
                                                quasiappend
                                                quasivector
                                                quasi)
                                              #((top)
                                                (top)
                                                (top)
                                                (top)
                                                (top)
                                                (top)
                                                (top)
                                                (top)
                                                (top))
                                              #("i"
                                                "i"
                                                "i"
                                                "i"
                                                "i"
                                                "i"
                                                "i"
                                                "i"
                                                "i"))
                                            #(ribcage
                                              (#(import-token *top*))
                                              ()
                                              ())))
                                        (quasi_24v p_28b (- lev_27p '1)))
                                      (quasi_24v q_28c lev_27p))))
                                tmp_27s)
                         ((lambda (tmp_27t)
                            (if tmp_27t
                              (apply (lambda (p_287 q_288)
                                       (if (= lev_27p '0)
                                         (quasiappend_24t
                                           p_287
                                           (quasi_24v q_288 lev_27p))
                                         (quasicons_24s
                                           (quasicons_24s
                                             '#(syntax-object
                                                'unquote-splicing
                                                ((top)
                                                 #(ribcage
                                                   #(p q)
                                                   #((top) (top))
                                                   #("i" "i"))
                                                 #(ribcage () () ())
                                                 #(ribcage
                                                   #(p lev)
                                                   #((top) (top))
                                                   #("i" "i"))
                                                 #(ribcage
                                                   #(isquote?
                                                     islist?
                                                     iscons?
                                                     quote-nil?
                                                     quasilist*
                                                     quasicons
                                                     quasiappend
                                                     quasivector
                                                     quasi)
                                                   #((top)
                                                     (top)
                                                     (top)
                                                     (top)
                                                     (top)
                                                     (top)
                                                     (top)
                                                     (top)
                                                     (top))
                                                   #("i"
                                                     "i"
                                                     "i"
                                                     "i"
                                                     "i"
                                                     "i"
                                                     "i"
                                                     "i"
                                                     "i"))
                                                 #(ribcage
                                                   (#(import-token *top*))
                                                   ()
                                                   ())))
                                             (quasi_24v p_287 (- lev_27p '1)))
                                           (quasi_24v q_288 lev_27p))))
                                     tmp_27t)
                              ((lambda (tmp_27u)
                                 (if tmp_27u
                                   (apply (lambda (p_286)
                                            (quasicons_24s
                                              '#(syntax-object
                                                 'quasiquote
                                                 ((top)
                                                  #(ribcage
                                                    #(p)
                                                    #((top))
                                                    #("i"))
                                                  #(ribcage () () ())
                                                  #(ribcage
                                                    #(p lev)
                                                    #((top) (top))
                                                    #("i" "i"))
                                                  #(ribcage
                                                    #(isquote?
                                                      islist?
                                                      iscons?
                                                      quote-nil?
                                                      quasilist*
                                                      quasicons
                                                      quasiappend
                                                      quasivector
                                                      quasi)
                                                    #((top)
                                                      (top)
                                                      (top)
                                                      (top)
                                                      (top)
                                                      (top)
                                                      (top)
                                                      (top)
                                                      (top))
                                                    #("i"
                                                      "i"
                                                      "i"
                                                      "i"
                                                      "i"
                                                      "i"
                                                      "i"
                                                      "i"
                                                      "i"))
                                                  #(ribcage
                                                    (#(import-token *top*))
                                                    ()
                                                    ())))
                                              (quasi_24v
                                                (list p_286)
                                                (+ lev_27p '1))))
                                          tmp_27u)
                                   ((lambda (tmp_27v)
                                      (if tmp_27v
                                        (apply (lambda (p_284 q_285)
                                                 (quasicons_24s
                                                   (quasi_24v p_284 lev_27p)
                                                   (quasi_24v q_285 lev_27p)))
                                               tmp_27v)
                                        ((lambda (tmp_280)
                                           (if tmp_280
                                             (apply (lambda (x_282)
                                                      (quasivector_24u
                                                        (quasi_24v
                                                          x_282
                                                          lev_27p)))
                                                    tmp_280)
                                             (list '#(syntax-object
                                                      quote
                                                      ((top)
                                                       #(ribcage
                                                         #(p)
                                                         #((top))
                                                         #("i"))
                                                       #(ribcage () () ())
                                                       #(ribcage
                                                         #(p lev)
                                                         #((top) (top))
                                                         #("i" "i"))
                                                       #(ribcage
                                                         #(isquote?
                                                           islist?
                                                           iscons?
                                                           quote-nil?
                                                           quasilist*
                                                           quasicons
                                                           quasiappend
                                                           quasivector
                                                           quasi)
                                                         #((top)
                                                           (top)
                                                           (top)
                                                           (top)
                                                           (top)
                                                           (top)
                                                           (top)
                                                           (top)
                                                           (top))
                                                         #("i"
                                                           "i"
                                                           "i"
                                                           "i"
                                                           "i"
                                                           "i"
                                                           "i"
                                                           "i"
                                                           "i"))
                                                       #(ribcage
                                                         (#(import-token
                                                            *top*))
                                                         ()
                                                         ())))
                                                   p_27o)))
                                         ($syntax-dispatch
                                           (compile-in-annotation p_27o value)
                                           '#(vector each-any)))))
                                    ($syntax-dispatch
                                      (compile-in-annotation p_27o value)
                                      '(any . any)))))
                               ($syntax-dispatch
                                 (compile-in-annotation p_27o value)
                                 '(#(free-id
                                     #(syntax-object
                                       quasiquote
                                       ((top)
                                        #(ribcage () () ())
                                        #(ribcage
                                          #(p lev)
                                          #((top) (top))
                                          #("i" "i"))
                                        #(ribcage
                                          #(isquote?
                                            islist?
                                            iscons?
                                            quote-nil?
                                            quasilist*
                                            quasicons
                                            quasiappend
                                            quasivector
                                            quasi)
                                          #((top)
                                            (top)
                                            (top)
                                            (top)
                                            (top)
                                            (top)
                                            (top)
                                            (top)
                                            (top))
                                          #("i"
                                            "i"
                                            "i"
                                            "i"
                                            "i"
                                            "i"
                                            "i"
                                            "i"
                                            "i"))
                                        #(ribcage
                                          (#(import-token *top*))
                                          ()
                                          ()))))
                                   any)))))
                          ($syntax-dispatch
                            (compile-in-annotation p_27o value)
                            '((#(free-id
                                 #(syntax-object
                                   unquote-splicing
                                   ((top)
                                    #(ribcage () () ())
                                    #(ribcage
                                      #(p lev)
                                      #((top) (top))
                                      #("i" "i"))
                                    #(ribcage
                                      #(isquote?
                                        islist?
                                        iscons?
                                        quote-nil?
                                        quasilist*
                                        quasicons
                                        quasiappend
                                        quasivector
                                        quasi)
                                      #((top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top))
                                      #("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                                    #(ribcage (#(import-token *top*)) () ()))))
                               .
                               each-any)
                              .
                              any)))))
                     ($syntax-dispatch
                       (compile-in-annotation p_27o value)
                       '((#(free-id
                            #(syntax-object
                              unquote
                              ((top)
                               #(ribcage () () ())
                               #(ribcage #(p lev) #((top) (top)) #("i" "i"))
                               #(ribcage
                                 #(isquote?
                                   islist?
                                   iscons?
                                   quote-nil?
                                   quasilist*
                                   quasicons
                                   quasiappend
                                   quasivector
                                   quasi)
                                 #((top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top)
                                   (top))
                                 #("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                               #(ribcage (#(import-token *top*)) () ()))))
                          .
                          each-any)
                         .
                         any)))))
                ($syntax-dispatch
                  (compile-in-annotation p_27o value)
                  '(#(free-id
                      #(syntax-object
                        unquote
                        ((top)
                         #(ribcage () () ())
                         #(ribcage #(p lev) #((top) (top)) #("i" "i"))
                         #(ribcage
                           #(isquote?
                             islist?
                             iscons?
                             quote-nil?
                             quasilist*
                             quasicons
                             quasiappend
                             quasivector
                             quasi)
                           #((top)
                             (top)
                             (top)
                             (top)
                             (top)
                             (top)
                             (top)
                             (top)
                             (top))
                           #("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                         #(ribcage (#(import-token *top*)) () ()))))
                    any))))))
    (lambda (x_250)
      ((lambda (tmp_252)
         (if tmp_252
           (apply (lambda (__253 e_254) (quasi_24v e_254 '0))
                  tmp_252)
           (syntax-error x_250)))
       ($syntax-dispatch
         (compile-in-annotation x_250 value)
         '(any any))))))
($sc-put-cte
  'include
  (lambda (x_28g)
    (letrec ((read-file_28h
               (lambda (fn_28r k_28s)
                 ((lambda (p_28t)
                    ((letrec ((f_28u (lambda (acc_28v)
                                       ((lambda (x_290)
                                          (if (eof-object? x_290)
                                            (begin
                                              (close-input-port p_28t)
                                              (reverse acc_28v))
                                            (f_28u (cons (datum->syntax-object
                                                           k_28s
                                                           x_290)
                                                         acc_28v))))
                                        (read-code p_28t)))))
                       f_28u)
                     '()))
                  (open-source-input-file fn_28r)))))
      ((lambda (tmp_28j)
         (if tmp_28j
           (apply (lambda (k_28k filename_28l)
                    ((lambda (fn_28m)
                       ((lambda (tmp_28n)
                          ((lambda (tmp_28o)
                             (if tmp_28o
                               (apply (lambda (exp_28p)
                                        (cons '#(syntax-object
                                                 begin
                                                 ((top)
                                                  #(ribcage
                                                    #(exp)
                                                    #((top))
                                                    #("i"))
                                                  #(ribcage () () ())
                                                  #(ribcage
                                                    #(fn)
                                                    #((top))
                                                    #("i"))
                                                  #(ribcage
                                                    #(k filename)
                                                    #((top) (top))
                                                    #("i" "i"))
                                                  #(ribcage
                                                    (read-file)
                                                    ((top))
                                                    ("i"))
                                                  #(ribcage
                                                    #(x)
                                                    #((top))
                                                    #("i"))
                                                  #(ribcage
                                                    (#(import-token *top*))
                                                    ()
                                                    ())))
                                              exp_28p))
                                      tmp_28o)
                               (syntax-error tmp_28n)))
                           ($syntax-dispatch
                             (compile-in-annotation tmp_28n value)
                             'each-any)))
                        (read-file_28h fn_28m k_28k)))
                     (syntax-object->datum filename_28l)))
                  tmp_28j)
           (syntax-error x_28g)))
       ($syntax-dispatch
         (compile-in-annotation x_28g value)
         '(any any))))))
($sc-put-cte
  'unquote
  (lambda (x_291)
    ((lambda (tmp_293)
       (if tmp_293
         (apply (lambda (__294 e_295)
                  (syntax-error
                    x_291
                    '"expression not valid outside of quasiquote"))
                tmp_293)
         (syntax-error x_291)))
     ($syntax-dispatch
       (compile-in-annotation x_291 value)
       '(any . each-any)))))
($sc-put-cte
  'unquote-splicing
  (lambda (x_296)
    ((lambda (tmp_298)
       (if tmp_298
         (apply (lambda (__299 e_29a)
                  (syntax-error
                    x_296
                    '"expression not valid outside of quasiquote"))
                tmp_298)
         (syntax-error x_296)))
     ($syntax-dispatch
       (compile-in-annotation x_296 value)
       '(any . each-any)))))
($sc-put-cte
  'case
  (lambda (x_29b)
    ((lambda (tmp_29d)
       (if tmp_29d
         (apply (lambda (__29e e_29f m1_29g m2_29h)
                  ((lambda (tmp_29i)
                     (list '#(syntax-object
                              let
                              ((top)
                               #(ribcage #(body) #((top)) #("i"))
                               #(ribcage
                                 #(_ e m1 m2)
                                 #((top) (top) (top) (top))
                                 #("i" "i" "i" "i"))
                               #(ribcage () () ())
                               #(ribcage #(x) #((top)) #("i"))
                               #(ribcage (#(import-token *top*)) () ())))
                           (list (list '#(syntax-object
                                          t
                                          ((top)
                                           #(ribcage #(body) #((top)) #("i"))
                                           #(ribcage
                                             #(_ e m1 m2)
                                             #((top) (top) (top) (top))
                                             #("i" "i" "i" "i"))
                                           #(ribcage () () ())
                                           #(ribcage #(x) #((top)) #("i"))
                                           #(ribcage
                                             (#(import-token *top*))
                                             ()
                                             ())))
                                       e_29f))
                           tmp_29i))
                   ((letrec ((f_29j (lambda (clause_29k clauses_29l)
                                      (if (null? clauses_29l)
                                        ((lambda (tmp_2a6)
                                           (if tmp_2a6
                                             (apply (lambda (e1_2ae e2_2af)
                                                      (cons '#(syntax-object
                                                               begin
                                                               ((top)
                                                                #(ribcage
                                                                  #(e1 e2)
                                                                  #((top)
                                                                    (top))
                                                                  #("i" "i"))
                                                                #(ribcage
                                                                  ()
                                                                  ()
                                                                  ())
                                                                #(ribcage
                                                                  #(clause
                                                                    clauses)
                                                                  #((top)
                                                                    (top))
                                                                  #("i" "i"))
                                                                #(ribcage
                                                                  #(f)
                                                                  #((top))
                                                                  #("i"))
                                                                #(ribcage
                                                                  #(_ e m1 m2)
                                                                  #((top)
                                                                    (top)
                                                                    (top)
                                                                    (top))
                                                                  #("i"
                                                                    "i"
                                                                    "i"
                                                                    "i"))
                                                                #(ribcage
                                                                  ()
                                                                  ()
                                                                  ())
                                                                #(ribcage
                                                                  #(x)
                                                                  #((top))
                                                                  #("i"))
                                                                #(ribcage
                                                                  (#(import-token
                                                                     *top*))
                                                                  ()
                                                                  ())))
                                                            (cons '#(syntax-object
                                                                     '#t
                                                                     ((top)
                                                                      #(ribcage
                                                                        #(e1
                                                                          e2)
                                                                        #((top)
                                                                          (top))
                                                                        #("i"
                                                                          "i"))
                                                                      #(ribcage
                                                                        ()
                                                                        ()
                                                                        ())
                                                                      #(ribcage
                                                                        #(clause
                                                                          clauses)
                                                                        #((top)
                                                                          (top))
                                                                        #("i"
                                                                          "i"))
                                                                      #(ribcage
                                                                        #(f)
                                                                        #((top))
                                                                        #("i"))
                                                                      #(ribcage
                                                                        #(_
                                                                          e
                                                                          m1
                                                                          m2)
                                                                        #((top)
                                                                          (top)
                                                                          (top)
                                                                          (top))
                                                                        #("i"
                                                                          "i"
                                                                          "i"
                                                                          "i"))
                                                                      #(ribcage
                                                                        ()
                                                                        ()
                                                                        ())
                                                                      #(ribcage
                                                                        #(x)
                                                                        #((top))
                                                                        #("i"))
                                                                      #(ribcage
                                                                        (#(import-token
                                                                           *top*))
                                                                        ()
                                                                        ())))
                                                                  (cons e1_2ae
                                                                        e2_2af))))
                                                    tmp_2a6)
                                             ((lambda (tmp_2a7)
                                                (if tmp_2a7
                                                  (apply (lambda (k_2a9
                                                                  e1_2aa
                                                                  e2_2ab)
                                                           (list '#(syntax-object
                                                                    if
                                                                    ((top)
                                                                     #(ribcage
                                                                       #(k
                                                                         e1
                                                                         e2)
                                                                       #((top)
                                                                         (top)
                                                                         (top))
                                                                       #("i"
                                                                         "i"
                                                                         "i"))
                                                                     #(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                     #(ribcage
                                                                       #(clause
                                                                         clauses)
                                                                       #((top)
                                                                         (top))
                                                                       #("i"
                                                                         "i"))
                                                                     #(ribcage
                                                                       #(f)
                                                                       #((top))
                                                                       #("i"))
                                                                     #(ribcage
                                                                       #(_
                                                                         e
                                                                         m1
                                                                         m2)
                                                                       #((top)
                                                                         (top)
                                                                         (top)
                                                                         (top))
                                                                       #("i"
                                                                         "i"
                                                                         "i"
                                                                         "i"))
                                                                     #(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                     #(ribcage
                                                                       #(x)
                                                                       #((top))
                                                                       #("i"))
                                                                     #(ribcage
                                                                       (#(import-token
                                                                          *top*))
                                                                       ()
                                                                       ())))
                                                                 (list '#(syntax-object
                                                                          memv
                                                                          ((top)
                                                                           #(ribcage
                                                                             #(k
                                                                               e1
                                                                               e2)
                                                                             #((top)
                                                                               (top)
                                                                               (top))
                                                                             #("i"
                                                                               "i"
                                                                               "i"))
                                                                           #(ribcage
                                                                             ()
                                                                             ()
                                                                             ())
                                                                           #(ribcage
                                                                             #(clause
                                                                               clauses)
                                                                             #((top)
                                                                               (top))
                                                                             #("i"
                                                                               "i"))
                                                                           #(ribcage
                                                                             #(f)
                                                                             #((top))
                                                                             #("i"))
                                                                           #(ribcage
                                                                             #(_
                                                                               e
                                                                               m1
                                                                               m2)
                                                                             #((top)
                                                                               (top)
                                                                               (top)
                                                                               (top))
                                                                             #("i"
                                                                               "i"
                                                                               "i"
                                                                               "i"))
                                                                           #(ribcage
                                                                             ()
                                                                             ()
                                                                             ())
                                                                           #(ribcage
                                                                             #(x)
                                                                             #((top))
                                                                             #("i"))
                                                                           #(ribcage
                                                                             (#(import-token
                                                                                *top*))
                                                                             ()
                                                                             ())))
                                                                       '#(syntax-object
                                                                          t
                                                                          ((top)
                                                                           #(ribcage
                                                                             #(k
                                                                               e1
                                                                               e2)
                                                                             #((top)
                                                                               (top)
                                                                               (top))
                                                                             #("i"
                                                                               "i"
                                                                               "i"))
                                                                           #(ribcage
                                                                             ()
                                                                             ()
                                                                             ())
                                                                           #(ribcage
                                                                             #(clause
                                                                               clauses)
                                                                             #((top)
                                                                               (top))
                                                                             #("i"
                                                                               "i"))
                                                                           #(ribcage
                                                                             #(f)
                                                                             #((top))
                                                                             #("i"))
                                                                           #(ribcage
                                                                             #(_
                                                                               e
                                                                               m1
                                                                               m2)
                                                                             #((top)
                                                                               (top)
                                                                               (top)
                                                                               (top))
                                                                             #("i"
                                                                               "i"
                                                                               "i"
                                                                               "i"))
                                                                           #(ribcage
                                                                             ()
                                                                             ()
                                                                             ())
                                                                           #(ribcage
                                                                             #(x)
                                                                             #((top))
                                                                             #("i"))
                                                                           #(ribcage
                                                                             (#(import-token
                                                                                *top*))
                                                                             ()
                                                                             ())))
                                                                       (list '#(syntax-object
                                                                                quote
                                                                                ((top)
                                                                                 #(ribcage
                                                                                   #(k
                                                                                     e1
                                                                                     e2)
                                                                                   #((top)
                                                                                     (top)
                                                                                     (top))
                                                                                   #("i"
                                                                                     "i"
                                                                                     "i"))
                                                                                 #(ribcage
                                                                                   ()
                                                                                   ()
                                                                                   ())
                                                                                 #(ribcage
                                                                                   #(clause
                                                                                     clauses)
                                                                                   #((top)
                                                                                     (top))
                                                                                   #("i"
                                                                                     "i"))
                                                                                 #(ribcage
                                                                                   #(f)
                                                                                   #((top))
                                                                                   #("i"))
                                                                                 #(ribcage
                                                                                   #(_
                                                                                     e
                                                                                     m1
                                                                                     m2)
                                                                                   #((top)
                                                                                     (top)
                                                                                     (top)
                                                                                     (top))
                                                                                   #("i"
                                                                                     "i"
                                                                                     "i"
                                                                                     "i"))
                                                                                 #(ribcage
                                                                                   ()
                                                                                   ()
                                                                                   ())
                                                                                 #(ribcage
                                                                                   #(x)
                                                                                   #((top))
                                                                                   #("i"))
                                                                                 #(ribcage
                                                                                   (#(import-token
                                                                                      *top*))
                                                                                   ()
                                                                                   ())))
                                                                             k_2a9))
                                                                 (cons '#(syntax-object
                                                                          begin
                                                                          ((top)
                                                                           #(ribcage
                                                                             #(k
                                                                               e1
                                                                               e2)
                                                                             #((top)
                                                                               (top)
                                                                               (top))
                                                                             #("i"
                                                                               "i"
                                                                               "i"))
                                                                           #(ribcage
                                                                             ()
                                                                             ()
                                                                             ())
                                                                           #(ribcage
                                                                             #(clause
                                                                               clauses)
                                                                             #((top)
                                                                               (top))
                                                                             #("i"
                                                                               "i"))
                                                                           #(ribcage
                                                                             #(f)
                                                                             #((top))
                                                                             #("i"))
                                                                           #(ribcage
                                                                             #(_
                                                                               e
                                                                               m1
                                                                               m2)
                                                                             #((top)
                                                                               (top)
                                                                               (top)
                                                                               (top))
                                                                             #("i"
                                                                               "i"
                                                                               "i"
                                                                               "i"))
                                                                           #(ribcage
                                                                             ()
                                                                             ()
                                                                             ())
                                                                           #(ribcage
                                                                             #(x)
                                                                             #((top))
                                                                             #("i"))
                                                                           #(ribcage
                                                                             (#(import-token
                                                                                *top*))
                                                                             ()
                                                                             ())))
                                                                       (cons e1_2aa
                                                                             e2_2ab))))
                                                         tmp_2a7)
                                                  (syntax-error x_29b)))
                                              ($syntax-dispatch
                                                (compile-in-annotation
                                                  clause_29k
                                                  value)
                                                '(each-any any . each-any)))))
                                         ($syntax-dispatch
                                           (compile-in-annotation
                                             clause_29k
                                             value)
                                           '(#(free-id
                                               #(syntax-object
                                                 else
                                                 ((top)
                                                  #(ribcage () () ())
                                                  #(ribcage
                                                    #(clause clauses)
                                                    #((top) (top))
                                                    #("i" "i"))
                                                  #(ribcage
                                                    #(f)
                                                    #((top))
                                                    #("i"))
                                                  #(ribcage
                                                    #(_ e m1 m2)
                                                    #((top) (top) (top) (top))
                                                    #("i" "i" "i" "i"))
                                                  #(ribcage () () ())
                                                  #(ribcage
                                                    #(x)
                                                    #((top))
                                                    #("i"))
                                                  #(ribcage
                                                    (#(import-token *top*))
                                                    ()
                                                    ()))))
                                             any
                                             .
                                             each-any)))
                                        ((lambda (tmp_29m)
                                           ((lambda (tmp_29p)
                                              (if tmp_29p
                                                (apply (lambda (k_2a1
                                                                e1_2a2
                                                                e2_2a3)
                                                         (list '#(syntax-object
                                                                  if
                                                                  ((top)
                                                                   #(ribcage
                                                                     #(k e1 e2)
                                                                     #((top)
                                                                       (top)
                                                                       (top))
                                                                     #("i"
                                                                       "i"
                                                                       "i"))
                                                                   #(ribcage
                                                                     #(rest)
                                                                     #((top))
                                                                     #("i"))
                                                                   #(ribcage
                                                                     ()
                                                                     ()
                                                                     ())
                                                                   #(ribcage
                                                                     #(clause
                                                                       clauses)
                                                                     #((top)
                                                                       (top))
                                                                     #("i"
                                                                       "i"))
                                                                   #(ribcage
                                                                     #(f)
                                                                     #((top))
                                                                     #("i"))
                                                                   #(ribcage
                                                                     #(_
                                                                       e
                                                                       m1
                                                                       m2)
                                                                     #((top)
                                                                       (top)
                                                                       (top)
                                                                       (top))
                                                                     #("i"
                                                                       "i"
                                                                       "i"
                                                                       "i"))
                                                                   #(ribcage
                                                                     ()
                                                                     ()
                                                                     ())
                                                                   #(ribcage
                                                                     #(x)
                                                                     #((top))
                                                                     #("i"))
                                                                   #(ribcage
                                                                     (#(import-token
                                                                        *top*))
                                                                     ()
                                                                     ())))
                                                               (list '#(syntax-object
                                                                        eqv?
                                                                        ((top)
                                                                         #(ribcage
                                                                           #(k
                                                                             e1
                                                                             e2)
                                                                           #((top)
                                                                             (top)
                                                                             (top))
                                                                           #("i"
                                                                             "i"
                                                                             "i"))
                                                                         #(ribcage
                                                                           #(rest)
                                                                           #((top))
                                                                           #("i"))
                                                                         #(ribcage
                                                                           ()
                                                                           ()
                                                                           ())
                                                                         #(ribcage
                                                                           #(clause
                                                                             clauses)
                                                                           #((top)
                                                                             (top))
                                                                           #("i"
                                                                             "i"))
                                                                         #(ribcage
                                                                           #(f)
                                                                           #((top))
                                                                           #("i"))
                                                                         #(ribcage
                                                                           #(_
                                                                             e
                                                                             m1
                                                                             m2)
                                                                           #((top)
                                                                             (top)
                                                                             (top)
                                                                             (top))
                                                                           #("i"
                                                                             "i"
                                                                             "i"
                                                                             "i"))
                                                                         #(ribcage
                                                                           ()
                                                                           ()
                                                                           ())
                                                                         #(ribcage
                                                                           #(x)
                                                                           #((top))
                                                                           #("i"))
                                                                         #(ribcage
                                                                           (#(import-token
                                                                              *top*))
                                                                           ()
                                                                           ())))
                                                                     '#(syntax-object
                                                                        t
                                                                        ((top)
                                                                         #(ribcage
                                                                           #(k
                                                                             e1
                                                                             e2)
                                                                           #((top)
                                                                             (top)
                                                                             (top))
                                                                           #("i"
                                                                             "i"
                                                                             "i"))
                                                                         #(ribcage
                                                                           #(rest)
                                                                           #((top))
                                                                           #("i"))
                                                                         #(ribcage
                                                                           ()
                                                                           ()
                                                                           ())
                                                                         #(ribcage
                                                                           #(clause
                                                                             clauses)
                                                                           #((top)
                                                                             (top))
                                                                           #("i"
                                                                             "i"))
                                                                         #(ribcage
                                                                           #(f)
                                                                           #((top))
                                                                           #("i"))
                                                                         #(ribcage
                                                                           #(_
                                                                             e
                                                                             m1
                                                                             m2)
                                                                           #((top)
                                                                             (top)
                                                                             (top)
                                                                             (top))
                                                                           #("i"
                                                                             "i"
                                                                             "i"
                                                                             "i"))
                                                                         #(ribcage
                                                                           ()
                                                                           ()
                                                                           ())
                                                                         #(ribcage
                                                                           #(x)
                                                                           #((top))
                                                                           #("i"))
                                                                         #(ribcage
                                                                           (#(import-token
                                                                              *top*))
                                                                           ()
                                                                           ())))
                                                                     (list '#(syntax-object
                                                                              quote
                                                                              ((top)
                                                                               #(ribcage
                                                                                 #(k
                                                                                   e1
                                                                                   e2)
                                                                                 #((top)
                                                                                   (top)
                                                                                   (top))
                                                                                 #("i"
                                                                                   "i"
                                                                                   "i"))
                                                                               #(ribcage
                                                                                 #(rest)
                                                                                 #((top))
                                                                                 #("i"))
                                                                               #(ribcage
                                                                                 ()
                                                                                 ()
                                                                                 ())
                                                                               #(ribcage
                                                                                 #(clause
                                                                                   clauses)
                                                                                 #((top)
                                                                                   (top))
                                                                                 #("i"
                                                                                   "i"))
                                                                               #(ribcage
                                                                                 #(f)
                                                                                 #((top))
                                                                                 #("i"))
                                                                               #(ribcage
                                                                                 #(_
                                                                                   e
                                                                                   m1
                                                                                   m2)
                                                                                 #((top)
                                                                                   (top)
                                                                                   (top)
                                                                                   (top))
                                                                                 #("i"
                                                                                   "i"
                                                                                   "i"
                                                                                   "i"))
                                                                               #(ribcage
                                                                                 ()
                                                                                 ()
                                                                                 ())
                                                                               #(ribcage
                                                                                 #(x)
                                                                                 #((top))
                                                                                 #("i"))
                                                                               #(ribcage
                                                                                 (#(import-token
                                                                                    *top*))
                                                                                 ()
                                                                                 ())))
                                                                           k_2a1))
                                                               (cons '#(syntax-object
                                                                        begin
                                                                        ((top)
                                                                         #(ribcage
                                                                           #(k
                                                                             e1
                                                                             e2)
                                                                           #((top)
                                                                             (top)
                                                                             (top))
                                                                           #("i"
                                                                             "i"
                                                                             "i"))
                                                                         #(ribcage
                                                                           #(rest)
                                                                           #((top))
                                                                           #("i"))
                                                                         #(ribcage
                                                                           ()
                                                                           ()
                                                                           ())
                                                                         #(ribcage
                                                                           #(clause
                                                                             clauses)
                                                                           #((top)
                                                                             (top))
                                                                           #("i"
                                                                             "i"))
                                                                         #(ribcage
                                                                           #(f)
                                                                           #((top))
                                                                           #("i"))
                                                                         #(ribcage
                                                                           #(_
                                                                             e
                                                                             m1
                                                                             m2)
                                                                           #((top)
                                                                             (top)
                                                                             (top)
                                                                             (top))
                                                                           #("i"
                                                                             "i"
                                                                             "i"
                                                                             "i"))
                                                                         #(ribcage
                                                                           ()
                                                                           ()
                                                                           ())
                                                                         #(ribcage
                                                                           #(x)
                                                                           #((top))
                                                                           #("i"))
                                                                         #(ribcage
                                                                           (#(import-token
                                                                              *top*))
                                                                           ()
                                                                           ())))
                                                                     (cons e1_2a2
                                                                           e2_2a3))
                                                               tmp_29m))
                                                       tmp_29p)
                                                ((lambda (tmp_29q)
                                                   (if tmp_29q
                                                     (apply (lambda (k_29s
                                                                     e1_29t
                                                                     e2_29u)
                                                              (list '#(syntax-object
                                                                       if
                                                                       ((top)
                                                                        #(ribcage
                                                                          #(k
                                                                            e1
                                                                            e2)
                                                                          #((top)
                                                                            (top)
                                                                            (top))
                                                                          #("i"
                                                                            "i"
                                                                            "i"))
                                                                        #(ribcage
                                                                          #(rest)
                                                                          #((top))
                                                                          #("i"))
                                                                        #(ribcage
                                                                          ()
                                                                          ()
                                                                          ())
                                                                        #(ribcage
                                                                          #(clause
                                                                            clauses)
                                                                          #((top)
                                                                            (top))
                                                                          #("i"
                                                                            "i"))
                                                                        #(ribcage
                                                                          #(f)
                                                                          #((top))
                                                                          #("i"))
                                                                        #(ribcage
                                                                          #(_
                                                                            e
                                                                            m1
                                                                            m2)
                                                                          #((top)
                                                                            (top)
                                                                            (top)
                                                                            (top))
                                                                          #("i"
                                                                            "i"
                                                                            "i"
                                                                            "i"))
                                                                        #(ribcage
                                                                          ()
                                                                          ()
                                                                          ())
                                                                        #(ribcage
                                                                          #(x)
                                                                          #((top))
                                                                          #("i"))
                                                                        #(ribcage
                                                                          (#(import-token
                                                                             *top*))
                                                                          ()
                                                                          ())))
                                                                    (list '#(syntax-object
                                                                             memv
                                                                             ((top)
                                                                              #(ribcage
                                                                                #(k
                                                                                  e1
                                                                                  e2)
                                                                                #((top)
                                                                                  (top)
                                                                                  (top))
                                                                                #("i"
                                                                                  "i"
                                                                                  "i"))
                                                                              #(ribcage
                                                                                #(rest)
                                                                                #((top))
                                                                                #("i"))
                                                                              #(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                              #(ribcage
                                                                                #(clause
                                                                                  clauses)
                                                                                #((top)
                                                                                  (top))
                                                                                #("i"
                                                                                  "i"))
                                                                              #(ribcage
                                                                                #(f)
                                                                                #((top))
                                                                                #("i"))
                                                                              #(ribcage
                                                                                #(_
                                                                                  e
                                                                                  m1
                                                                                  m2)
                                                                                #((top)
                                                                                  (top)
                                                                                  (top)
                                                                                  (top))
                                                                                #("i"
                                                                                  "i"
                                                                                  "i"
                                                                                  "i"))
                                                                              #(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                              #(ribcage
                                                                                #(x)
                                                                                #((top))
                                                                                #("i"))
                                                                              #(ribcage
                                                                                (#(import-token
                                                                                   *top*))
                                                                                ()
                                                                                ())))
                                                                          '#(syntax-object
                                                                             t
                                                                             ((top)
                                                                              #(ribcage
                                                                                #(k
                                                                                  e1
                                                                                  e2)
                                                                                #((top)
                                                                                  (top)
                                                                                  (top))
                                                                                #("i"
                                                                                  "i"
                                                                                  "i"))
                                                                              #(ribcage
                                                                                #(rest)
                                                                                #((top))
                                                                                #("i"))
                                                                              #(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                              #(ribcage
                                                                                #(clause
                                                                                  clauses)
                                                                                #((top)
                                                                                  (top))
                                                                                #("i"
                                                                                  "i"))
                                                                              #(ribcage
                                                                                #(f)
                                                                                #((top))
                                                                                #("i"))
                                                                              #(ribcage
                                                                                #(_
                                                                                  e
                                                                                  m1
                                                                                  m2)
                                                                                #((top)
                                                                                  (top)
                                                                                  (top)
                                                                                  (top))
                                                                                #("i"
                                                                                  "i"
                                                                                  "i"
                                                                                  "i"))
                                                                              #(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                              #(ribcage
                                                                                #(x)
                                                                                #((top))
                                                                                #("i"))
                                                                              #(ribcage
                                                                                (#(import-token
                                                                                   *top*))
                                                                                ()
                                                                                ())))
                                                                          (list '#(syntax-object
                                                                                   quote
                                                                                   ((top)
                                                                                    #(ribcage
                                                                                      #(k
                                                                                        e1
                                                                                        e2)
                                                                                      #((top)
                                                                                        (top)
                                                                                        (top))
                                                                                      #("i"
                                                                                        "i"
                                                                                        "i"))
                                                                                    #(ribcage
                                                                                      #(rest)
                                                                                      #((top))
                                                                                      #("i"))
                                                                                    #(ribcage
                                                                                      ()
                                                                                      ()
                                                                                      ())
                                                                                    #(ribcage
                                                                                      #(clause
                                                                                        clauses)
                                                                                      #((top)
                                                                                        (top))
                                                                                      #("i"
                                                                                        "i"))
                                                                                    #(ribcage
                                                                                      #(f)
                                                                                      #((top))
                                                                                      #("i"))
                                                                                    #(ribcage
                                                                                      #(_
                                                                                        e
                                                                                        m1
                                                                                        m2)
                                                                                      #((top)
                                                                                        (top)
                                                                                        (top)
                                                                                        (top))
                                                                                      #("i"
                                                                                        "i"
                                                                                        "i"
                                                                                        "i"))
                                                                                    #(ribcage
                                                                                      ()
                                                                                      ()
                                                                                      ())
                                                                                    #(ribcage
                                                                                      #(x)
                                                                                      #((top))
                                                                                      #("i"))
                                                                                    #(ribcage
                                                                                      (#(import-token
                                                                                         *top*))
                                                                                      ()
                                                                                      ())))
                                                                                k_29s))
                                                                    (cons '#(syntax-object
                                                                             begin
                                                                             ((top)
                                                                              #(ribcage
                                                                                #(k
                                                                                  e1
                                                                                  e2)
                                                                                #((top)
                                                                                  (top)
                                                                                  (top))
                                                                                #("i"
                                                                                  "i"
                                                                                  "i"))
                                                                              #(ribcage
                                                                                #(rest)
                                                                                #((top))
                                                                                #("i"))
                                                                              #(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                              #(ribcage
                                                                                #(clause
                                                                                  clauses)
                                                                                #((top)
                                                                                  (top))
                                                                                #("i"
                                                                                  "i"))
                                                                              #(ribcage
                                                                                #(f)
                                                                                #((top))
                                                                                #("i"))
                                                                              #(ribcage
                                                                                #(_
                                                                                  e
                                                                                  m1
                                                                                  m2)
                                                                                #((top)
                                                                                  (top)
                                                                                  (top)
                                                                                  (top))
                                                                                #("i"
                                                                                  "i"
                                                                                  "i"
                                                                                  "i"))
                                                                              #(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                              #(ribcage
                                                                                #(x)
                                                                                #((top))
                                                                                #("i"))
                                                                              #(ribcage
                                                                                (#(import-token
                                                                                   *top*))
                                                                                ()
                                                                                ())))
                                                                          (cons e1_29t
                                                                                e2_29u))
                                                                    tmp_29m))
                                                            tmp_29q)
                                                     (syntax-error x_29b)))
                                                 ($syntax-dispatch
                                                   (compile-in-annotation
                                                     clause_29k
                                                     value)
                                                   '(each-any
                                                      any
                                                      .
                                                      each-any)))))
                                            ($syntax-dispatch
                                              (compile-in-annotation
                                                clause_29k
                                                value)
                                              '((any) any . each-any))))
                                         (f_29j (car clauses_29l)
                                                (cdr clauses_29l)))))))
                      f_29j)
                    m1_29g
                    m2_29h)))
                tmp_29d)
         (syntax-error x_29b)))
     ($syntax-dispatch
       (compile-in-annotation x_29b value)
       '(any any any . each-any)))))
($sc-put-cte
  'identifier-syntax
  (lambda (x_2aj)
    ((lambda (tmp_2al)
       (if tmp_2al
         (apply (lambda (__2b3 e_2b4)
                  (list '#(syntax-object
                           lambda
                           ((top)
                            #(ribcage #(_ e) #((top) (top)) #("i" "i"))
                            #(ribcage () () ())
                            #(ribcage #(x) #((top)) #("i"))
                            #(ribcage (#(import-token *top*)) () ())))
                        '#(syntax-object
                           (x)
                           ((top)
                            #(ribcage #(_ e) #((top) (top)) #("i" "i"))
                            #(ribcage () () ())
                            #(ribcage #(x) #((top)) #("i"))
                            #(ribcage (#(import-token *top*)) () ())))
                        (list '#(syntax-object
                                 syntax-case
                                 ((top)
                                  #(ribcage #(_ e) #((top) (top)) #("i" "i"))
                                  #(ribcage () () ())
                                  #(ribcage #(x) #((top)) #("i"))
                                  #(ribcage (#(import-token *top*)) () ())))
                              '#(syntax-object
                                 x
                                 ((top)
                                  #(ribcage #(_ e) #((top) (top)) #("i" "i"))
                                  #(ribcage () () ())
                                  #(ribcage #(x) #((top)) #("i"))
                                  #(ribcage (#(import-token *top*)) () ())))
                              '()
                              (list '#(syntax-object
                                       id
                                       ((top)
                                        #(ribcage
                                          #(_ e)
                                          #((top) (top))
                                          #("i" "i"))
                                        #(ribcage () () ())
                                        #(ribcage #(x) #((top)) #("i"))
                                        #(ribcage
                                          (#(import-token *top*))
                                          ()
                                          ())))
                                    '#(syntax-object
                                       (identifier? (syntax id))
                                       ((top)
                                        #(ribcage
                                          #(_ e)
                                          #((top) (top))
                                          #("i" "i"))
                                        #(ribcage () () ())
                                        #(ribcage #(x) #((top)) #("i"))
                                        #(ribcage
                                          (#(import-token *top*))
                                          ()
                                          ())))
                                    (list '#(syntax-object
                                             syntax
                                             ((top)
                                              #(ribcage
                                                #(_ e)
                                                #((top) (top))
                                                #("i" "i"))
                                              #(ribcage () () ())
                                              #(ribcage #(x) #((top)) #("i"))
                                              #(ribcage
                                                (#(import-token *top*))
                                                ()
                                                ())))
                                          e_2b4))
                              (list (cons __2b3
                                          '(#(syntax-object
                                              x
                                              ((top)
                                               #(ribcage
                                                 #(_ e)
                                                 #((top) (top))
                                                 #("i" "i"))
                                               #(ribcage () () ())
                                               #(ribcage #(x) #((top)) #("i"))
                                               #(ribcage
                                                 (#(import-token *top*))
                                                 ()
                                                 ())))
                                            #(syntax-object
                                              ...
                                              ((top)
                                               #(ribcage
                                                 #(_ e)
                                                 #((top) (top))
                                                 #("i" "i"))
                                               #(ribcage () () ())
                                               #(ribcage #(x) #((top)) #("i"))
                                               #(ribcage
                                                 (#(import-token *top*))
                                                 ()
                                                 ())))))
                                    (list '#(syntax-object
                                             syntax
                                             ((top)
                                              #(ribcage
                                                #(_ e)
                                                #((top) (top))
                                                #("i" "i"))
                                              #(ribcage () () ())
                                              #(ribcage #(x) #((top)) #("i"))
                                              #(ribcage
                                                (#(import-token *top*))
                                                ()
                                                ())))
                                          (cons e_2b4
                                                '(#(syntax-object
                                                    x
                                                    ((top)
                                                     #(ribcage
                                                       #(_ e)
                                                       #((top) (top))
                                                       #("i" "i"))
                                                     #(ribcage () () ())
                                                     #(ribcage
                                                       #(x)
                                                       #((top))
                                                       #("i"))
                                                     #(ribcage
                                                       (#(import-token *top*))
                                                       ()
                                                       ())))
                                                  #(syntax-object
                                                    ...
                                                    ((top)
                                                     #(ribcage
                                                       #(_ e)
                                                       #((top) (top))
                                                       #("i" "i"))
                                                     #(ribcage () () ())
                                                     #(ribcage
                                                       #(x)
                                                       #((top))
                                                       #("i"))
                                                     #(ribcage
                                                       (#(import-token *top*))
                                                       ()
                                                       ()))))))))))
                tmp_2al)
         ((lambda (tmp_2am)
            (if (if tmp_2am
                  (apply (lambda (__2at
                                  id_2au
                                  exp1_2av
                                  var_2b0
                                  val_2b1
                                  exp2_2b2)
                           (if (identifier? id_2au)
                             (identifier? var_2b0)
                             '#f))
                         tmp_2am)
                  '#f)
              (apply (lambda (__2an id_2ao exp1_2ap var_2aq val_2ar exp2_2as)
                       (list '#(syntax-object
                                cons
                                ((top)
                                 #(ribcage
                                   #(_ id exp1 var val exp2)
                                   #((top) (top) (top) (top) (top) (top))
                                   #("i" "i" "i" "i" "i" "i"))
                                 #(ribcage () () ())
                                 #(ribcage #(x) #((top)) #("i"))
                                 #(ribcage (#(import-token *top*)) () ())))
                             '#(syntax-object
                                'macro!
                                ((top)
                                 #(ribcage
                                   #(_ id exp1 var val exp2)
                                   #((top) (top) (top) (top) (top) (top))
                                   #("i" "i" "i" "i" "i" "i"))
                                 #(ribcage () () ())
                                 #(ribcage #(x) #((top)) #("i"))
                                 #(ribcage (#(import-token *top*)) () ())))
                             (list '#(syntax-object
                                      lambda
                                      ((top)
                                       #(ribcage
                                         #(_ id exp1 var val exp2)
                                         #((top) (top) (top) (top) (top) (top))
                                         #("i" "i" "i" "i" "i" "i"))
                                       #(ribcage () () ())
                                       #(ribcage #(x) #((top)) #("i"))
                                       #(ribcage
                                         (#(import-token *top*))
                                         ()
                                         ())))
                                   '#(syntax-object
                                      (x)
                                      ((top)
                                       #(ribcage
                                         #(_ id exp1 var val exp2)
                                         #((top) (top) (top) (top) (top) (top))
                                         #("i" "i" "i" "i" "i" "i"))
                                       #(ribcage () () ())
                                       #(ribcage #(x) #((top)) #("i"))
                                       #(ribcage
                                         (#(import-token *top*))
                                         ()
                                         ())))
                                   (list '#(syntax-object
                                            syntax-case
                                            ((top)
                                             #(ribcage
                                               #(_ id exp1 var val exp2)
                                               #((top)
                                                 (top)
                                                 (top)
                                                 (top)
                                                 (top)
                                                 (top))
                                               #("i" "i" "i" "i" "i" "i"))
                                             #(ribcage () () ())
                                             #(ribcage #(x) #((top)) #("i"))
                                             #(ribcage
                                               (#(import-token *top*))
                                               ()
                                               ())))
                                         '#(syntax-object
                                            x
                                            ((top)
                                             #(ribcage
                                               #(_ id exp1 var val exp2)
                                               #((top)
                                                 (top)
                                                 (top)
                                                 (top)
                                                 (top)
                                                 (top))
                                               #("i" "i" "i" "i" "i" "i"))
                                             #(ribcage () () ())
                                             #(ribcage #(x) #((top)) #("i"))
                                             #(ribcage
                                               (#(import-token *top*))
                                               ()
                                               ())))
                                         '#(syntax-object
                                            (set!)
                                            ((top)
                                             #(ribcage
                                               #(_ id exp1 var val exp2)
                                               #((top)
                                                 (top)
                                                 (top)
                                                 (top)
                                                 (top)
                                                 (top))
                                               #("i" "i" "i" "i" "i" "i"))
                                             #(ribcage () () ())
                                             #(ribcage #(x) #((top)) #("i"))
                                             #(ribcage
                                               (#(import-token *top*))
                                               ()
                                               ())))
                                         (list (list '#(syntax-object
                                                        set!
                                                        ((top)
                                                         #(ribcage
                                                           #(_
                                                             id
                                                             exp1
                                                             var
                                                             val
                                                             exp2)
                                                           #((top)
                                                             (top)
                                                             (top)
                                                             (top)
                                                             (top)
                                                             (top))
                                                           #("i"
                                                             "i"
                                                             "i"
                                                             "i"
                                                             "i"
                                                             "i"))
                                                         #(ribcage () () ())
                                                         #(ribcage
                                                           #(x)
                                                           #((top))
                                                           #("i"))
                                                         #(ribcage
                                                           (#(import-token
                                                              *top*))
                                                           ()
                                                           ())))
                                                     var_2aq
                                                     val_2ar)
                                               (list '#(syntax-object
                                                        syntax
                                                        ((top)
                                                         #(ribcage
                                                           #(_
                                                             id
                                                             exp1
                                                             var
                                                             val
                                                             exp2)
                                                           #((top)
                                                             (top)
                                                             (top)
                                                             (top)
                                                             (top)
                                                             (top))
                                                           #("i"
                                                             "i"
                                                             "i"
                                                             "i"
                                                             "i"
                                                             "i"))
                                                         #(ribcage () () ())
                                                         #(ribcage
                                                           #(x)
                                                           #((top))
                                                           #("i"))
                                                         #(ribcage
                                                           (#(import-token
                                                              *top*))
                                                           ()
                                                           ())))
                                                     exp2_2as))
                                         (list (cons id_2ao
                                                     '(#(syntax-object
                                                         x
                                                         ((top)
                                                          #(ribcage
                                                            #(_
                                                              id
                                                              exp1
                                                              var
                                                              val
                                                              exp2)
                                                            #((top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top))
                                                            #("i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"))
                                                          #(ribcage () () ())
                                                          #(ribcage
                                                            #(x)
                                                            #((top))
                                                            #("i"))
                                                          #(ribcage
                                                            (#(import-token
                                                               *top*))
                                                            ()
                                                            ())))
                                                       #(syntax-object
                                                         ...
                                                         ((top)
                                                          #(ribcage
                                                            #(_
                                                              id
                                                              exp1
                                                              var
                                                              val
                                                              exp2)
                                                            #((top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top))
                                                            #("i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"))
                                                          #(ribcage () () ())
                                                          #(ribcage
                                                            #(x)
                                                            #((top))
                                                            #("i"))
                                                          #(ribcage
                                                            (#(import-token
                                                               *top*))
                                                            ()
                                                            ())))))
                                               (list '#(syntax-object
                                                        syntax
                                                        ((top)
                                                         #(ribcage
                                                           #(_
                                                             id
                                                             exp1
                                                             var
                                                             val
                                                             exp2)
                                                           #((top)
                                                             (top)
                                                             (top)
                                                             (top)
                                                             (top)
                                                             (top))
                                                           #("i"
                                                             "i"
                                                             "i"
                                                             "i"
                                                             "i"
                                                             "i"))
                                                         #(ribcage () () ())
                                                         #(ribcage
                                                           #(x)
                                                           #((top))
                                                           #("i"))
                                                         #(ribcage
                                                           (#(import-token
                                                              *top*))
                                                           ()
                                                           ())))
                                                     (cons exp1_2ap
                                                           '(#(syntax-object
                                                               x
                                                               ((top)
                                                                #(ribcage
                                                                  #(_
                                                                    id
                                                                    exp1
                                                                    var
                                                                    val
                                                                    exp2)
                                                                  #((top)
                                                                    (top)
                                                                    (top)
                                                                    (top)
                                                                    (top)
                                                                    (top))
                                                                  #("i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"))
                                                                #(ribcage
                                                                  ()
                                                                  ()
                                                                  ())
                                                                #(ribcage
                                                                  #(x)
                                                                  #((top))
                                                                  #("i"))
                                                                #(ribcage
                                                                  (#(import-token
                                                                     *top*))
                                                                  ()
                                                                  ())))
                                                             #(syntax-object
                                                               ...
                                                               ((top)
                                                                #(ribcage
                                                                  #(_
                                                                    id
                                                                    exp1
                                                                    var
                                                                    val
                                                                    exp2)
                                                                  #((top)
                                                                    (top)
                                                                    (top)
                                                                    (top)
                                                                    (top)
                                                                    (top))
                                                                  #("i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"))
                                                                #(ribcage
                                                                  ()
                                                                  ()
                                                                  ())
                                                                #(ribcage
                                                                  #(x)
                                                                  #((top))
                                                                  #("i"))
                                                                #(ribcage
                                                                  (#(import-token
                                                                     *top*))
                                                                  ()
                                                                  ())))))))
                                         (list id_2ao
                                               (list '#(syntax-object
                                                        identifier?
                                                        ((top)
                                                         #(ribcage
                                                           #(_
                                                             id
                                                             exp1
                                                             var
                                                             val
                                                             exp2)
                                                           #((top)
                                                             (top)
                                                             (top)
                                                             (top)
                                                             (top)
                                                             (top))
                                                           #("i"
                                                             "i"
                                                             "i"
                                                             "i"
                                                             "i"
                                                             "i"))
                                                         #(ribcage () () ())
                                                         #(ribcage
                                                           #(x)
                                                           #((top))
                                                           #("i"))
                                                         #(ribcage
                                                           (#(import-token
                                                              *top*))
                                                           ()
                                                           ())))
                                                     (list '#(syntax-object
                                                              syntax
                                                              ((top)
                                                               #(ribcage
                                                                 #(_
                                                                   id
                                                                   exp1
                                                                   var
                                                                   val
                                                                   exp2)
                                                                 #((top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top))
                                                                 #("i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"))
                                                               #(ribcage
                                                                 ()
                                                                 ()
                                                                 ())
                                                               #(ribcage
                                                                 #(x)
                                                                 #((top))
                                                                 #("i"))
                                                               #(ribcage
                                                                 (#(import-token
                                                                    *top*))
                                                                 ()
                                                                 ())))
                                                           id_2ao))
                                               (list '#(syntax-object
                                                        syntax
                                                        ((top)
                                                         #(ribcage
                                                           #(_
                                                             id
                                                             exp1
                                                             var
                                                             val
                                                             exp2)
                                                           #((top)
                                                             (top)
                                                             (top)
                                                             (top)
                                                             (top)
                                                             (top))
                                                           #("i"
                                                             "i"
                                                             "i"
                                                             "i"
                                                             "i"
                                                             "i"))
                                                         #(ribcage () () ())
                                                         #(ribcage
                                                           #(x)
                                                           #((top))
                                                           #("i"))
                                                         #(ribcage
                                                           (#(import-token
                                                              *top*))
                                                           ()
                                                           ())))
                                                     exp1_2ap))))))
                     tmp_2am)
              (syntax-error x_2aj)))
          ($syntax-dispatch
            (compile-in-annotation x_2aj value)
            '(any (any any)
                  ((#(free-id
                      #(syntax-object
                        set!
                        ((top)
                         #(ribcage () () ())
                         #(ribcage #(x) #((top)) #("i"))
                         #(ribcage (#(import-token *top*)) () ()))))
                    any
                    any)
                   any))))))
     ($syntax-dispatch
       (compile-in-annotation x_2aj value)
       '(any any)))))
