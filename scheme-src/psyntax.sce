(letrec ((lambda-var-list_3x226TsAt
           (lambda (vars_QviQiz1Su)
             ((letrec ((lvl_GyKxkej9U
                         (lambda (vars_JYzovga0O ls_0trOY1a0P w_NG8P6TJy)
                           (if (pair? vars_JYzovga0O)
                             (lvl_GyKxkej9U
                               (cdr vars_JYzovga0O)
                               (cons (wrap_15NDGTTrpt
                                       (car vars_JYzovga0O)
                                       w_NG8P6TJy)
                                     ls_0trOY1a0P)
                               w_NG8P6TJy)
                             (if (id?_AEZ.eZJxY vars_JYzovga0O)
                               (cons (wrap_15NDGTTrpt
                                       vars_JYzovga0O
                                       w_NG8P6TJy)
                                     ls_0trOY1a0P)
                               (if (null? vars_JYzovga0O)
                                 ls_0trOY1a0P
                                 (if (syntax-object?_PiqwpY0La vars_JYzovga0O)
                                   (lvl_GyKxkej9U
                                     (syntax-object-expression_K1xadx9Um
                                       vars_JYzovga0O)
                                     ls_0trOY1a0P
                                     (join-wraps_f3DJEyieU
                                       w_NG8P6TJy
                                       (syntax-object-wrap_DJHTz7SC8
                                         vars_JYzovga0O)))
                                   (if (annotation? vars_JYzovga0O)
                                     (lvl_GyKxkej9U
                                       (annotation-expression vars_JYzovga0O)
                                       ls_0trOY1a0P
                                       w_NG8P6TJy)
                                     (cons vars_JYzovga0O ls_0trOY1a0P)))))))))
                lvl_GyKxkej9U)
              vars_QviQiz1Su
              '()
              '(()))))
         (gen-var_hMLALSjrb
           (lambda (id_15rc4zP1Pz)
             ((lambda (id_UbexW5aYQ)
                (if (annotation? id_UbexW5aYQ)
                  (if (annotation-source id_UbexW5aYQ)
                    (list 'compile-in-annotation
                          (gen-sym (annotation-expression id_UbexW5aYQ))
                          (annotation-source id_UbexW5aYQ))
                    (gen-sym (annotation-expression id_UbexW5aYQ)))
                  (gen-sym id_UbexW5aYQ)))
              (if (syntax-object?_PiqwpY0La id_15rc4zP1Pz)
                (syntax-object-expression_K1xadx9Um
                  id_15rc4zP1Pz)
                id_15rc4zP1Pz))))
         (strip_1ln0rNKSx
           (lambda (x_nWQ09L1Og w_7pQNgFj5A)
             (strip*_9LmLQosA9
               x_nWQ09L1Og
               w_7pQNgFj5A
               (lambda (x_B5Ev6UaXB)
                 (if ((lambda (t_s5azi6TFA)
                        (if t_s5azi6TFA
                          t_s5azi6TFA
                          (if (pair? x_B5Ev6UaXB)
                            (annotation? (car x_B5Ev6UaXB))
                            '#f)))
                      (annotation? x_B5Ev6UaXB))
                   (strip-annotation_FQANlaiN x_B5Ev6UaXB '#f)
                   x_B5Ev6UaXB)))))
         (strip*_9LmLQosA9
           (lambda (x_iwkvTP1Kf w_QKGPvwBjQ fn_dlLoaBKsZ)
             (if (memq 'top (wrap-marks_KA6c9HSHW w_QKGPvwBjQ))
               (fn_dlLoaBKsZ x_iwkvTP1Kf)
               ((letrec ((f_aq6Br4Bj5
                           (lambda (x_e9NhXKsa.)
                             (if (syntax-object?_PiqwpY0La x_e9NhXKsa.)
                               (strip*_9LmLQosA9
                                 (syntax-object-expression_K1xadx9Um
                                   x_e9NhXKsa.)
                                 (syntax-object-wrap_DJHTz7SC8 x_e9NhXKsa.)
                                 fn_dlLoaBKsZ)
                               (if (pair? x_e9NhXKsa.)
                                 ((lambda (d_FggXKtj3v a_zxzoKkaVl)
                                    (if (if (eq? a_zxzoKkaVl (car x_e9NhXKsa.))
                                          (eq? d_FggXKtj3v (cdr x_e9NhXKsa.))
                                          '#f)
                                      x_e9NhXKsa.
                                      (cons a_zxzoKkaVl d_FggXKtj3v)))
                                  (f_aq6Br4Bj5 (cdr x_e9NhXKsa.))
                                  (f_aq6Br4Bj5 (car x_e9NhXKsa.)))
                                 (if (vector? x_e9NhXKsa.)
                                   ((lambda (old_74KQqLBky)
                                      ((lambda (new_174kzVlj2o)
                                         (if (andmap
                                               eq?
                                               old_74KQqLBky
                                               new_174kzVlj2o)
                                           x_e9NhXKsa.
                                           (list->vector new_174kzVlj2o)))
                                       (map f_aq6Br4Bj5 old_74KQqLBky)))
                                    (vector->list x_e9NhXKsa.))
                                   x_e9NhXKsa.))))))
                  f_aq6Br4Bj5)
                x_iwkvTP1Kf))))
         (strip-annotation_FQANlaiN
           (lambda (x_Kai7YBKnD parent_nxCIbiTwO)
             (if (pair? x_Kai7YBKnD)
               ((lambda (new_TXZRN4Bin)
                  (begin
                    (if parent_nxCIbiTwO
                      (set-annotation-stripped!
                        parent_nxCIbiTwO
                        new_TXZRN4Bin)
                      (void))
                    (set-car!
                      new_TXZRN4Bin
                      (strip-annotation_FQANlaiN (car x_Kai7YBKnD) '#f))
                    (set-cdr!
                      new_TXZRN4Bin
                      (strip-annotation_FQANlaiN (cdr x_Kai7YBKnD) '#f))
                    new_TXZRN4Bin))
                (cons '#f '#f))
               (if (annotation? x_Kai7YBKnD)
                 ((lambda (t_5B1HjD1Ie)
                    (if t_5B1HjD1Ie
                      t_5B1HjD1Ie
                      (strip-annotation_FQANlaiN
                        (annotation-expression x_Kai7YBKnD)
                        x_Kai7YBKnD)))
                  (annotation-stripped x_Kai7YBKnD))
                 (if (vector? x_Kai7YBKnD)
                   ((lambda (new_q9sHVuTwd)
                      (begin
                        (if parent_nxCIbiTwO
                          (set-annotation-stripped!
                            parent_nxCIbiTwO
                            new_q9sHVuTwd)
                          (void))
                        ((letrec ((loop_rTA1ocBfu
                                    (lambda (i_yiHIZRjYf)
                                      (if (not (< i_yiHIZRjYf '0))
                                        (begin
                                          (vector-set!
                                            new_q9sHVuTwd
                                            i_yiHIZRjYf
                                            (strip-annotation_FQANlaiN
                                              (vector-ref
                                                x_Kai7YBKnD
                                                i_yiHIZRjYf)
                                              '#f))
                                          (loop_rTA1ocBfu (- i_yiHIZRjYf '1)))
                                        (void)))))
                           loop_rTA1ocBfu)
                         (- (vector-length x_Kai7YBKnD) '1))
                        new_q9sHVuTwd))
                    (make-vector (vector-length x_Kai7YBKnD)))
                   x_Kai7YBKnD)))))
         (ellipsis?_Zow.heKSh
           (lambda (x_cO3xyUKm2)
             (if (nonsymbol-id?_4NX5Kfi6a x_cO3xyUKm2)
               (literal-id=?_IORoNHroz
                 x_cO3xyUKm2
                 '#3(syntax-object
                     ...
                     ((top)
                      #4(ribcage ())
                      #4(ribcage #1(x) #1((top)) #1("i"))
                      #4(ribcage
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
                          "i"))
                      #4(ribcage (#2(import-token *top*)) ()))))
               '#f)))
         (chi-void_WCRY8TsAV (lambda () (list 'void)))
         (chi-local-syntax_7xtysjjrG
           (lambda (rec?_6yff0BKhw
                    e_bYxYrpjR6
                    r_GhABdEaIY
                    w_lWnEwAB8p
                    s_YTk3leTqI
                    k_x2m3HgB8r)
             ((lambda (tmp_pmO2TcaIz)
                (if tmp_pmO2TcaIz
                  (apply (lambda (__EwzQ37s03
                                  id_pdoHEOs04
                                  val_uTHg9kB9e
                                  e1_186Ibx6jSY
                                  e2_P4b6DiTry)
                           (if (not (valid-bound-ids?_F3ZGrRJG1 id_pdoHEOs04))
                             (invalid-ids-error_Oj3ohI0YU
                               (map (lambda (x_oBARLr1C9)
                                      (wrap_15NDGTTrpt
                                        x_oBARLr1C9
                                        w_lWnEwAB8p))
                                    id_pdoHEOs04)
                               (source-wrap_LaBpzTrpx
                                 e_bYxYrpjR6
                                 w_lWnEwAB8p
                                 s_YTk3leTqI)
                               '"keyword")
                             ((lambda (labels_nxGjs01A8)
                                ((lambda (new-w_cUOKycaJq)
                                   (k_x2m3HgB8r
                                     (cons e1_186Ibx6jSY e2_P4b6DiTry)
                                     (extend-env*_YcveBYAn.
                                       labels_nxGjs01A8
                                       ((lambda (trans-r_QcUmB7s1a w_Scc8P0Bai)
                                          (map (lambda (x_bOQRej1B7)
                                                 (make-binding_CEIm66Jv6
                                                   'deferred
                                                   (chi_emzRIPszD
                                                     x_bOQRej1B7
                                                     trans-r_QcUmB7s1a
                                                     w_Scc8P0Bai)))
                                               val_uTHg9kB9e))
                                        (transformer-env_h9Z7ZzreX r_GhABdEaIY)
                                        (if rec?_6yff0BKhw
                                          new-w_cUOKycaJq
                                          w_lWnEwAB8p))
                                       r_GhABdEaIY)
                                     new-w_cUOKycaJq
                                     s_YTk3leTqI))
                                 (make-binding-wrap_7af0eB95y
                                   id_pdoHEOs04
                                   labels_nxGjs01A8
                                   w_lWnEwAB8p)))
                              (gen-labels_wwfl95As. id_pdoHEOs04))))
                         tmp_pmO2TcaIz)
                  (syntax-error
                    (source-wrap_LaBpzTrpx
                      e_bYxYrpjR6
                      w_lWnEwAB8p
                      s_YTk3leTqI))))
              ($syntax-dispatch
                (compile-in-annotation e_bYxYrpjR6 value)
                '(any #2(each (any any)) any . each-any)))))
         (chi-lambda-clause_n2FPrLsAK
           (lambda (e_PTydP1KbW
                    c_JyzoZxKbX
                    r_yjH4RJjLw
                    w_Gww.LmTk6
                    k_i1vrPP1tg)
             ((lambda (tmp_PuunLkaDR)
                (if tmp_PuunLkaDR
                  (apply (lambda (id_ESxk5mToT e1_Ud6s.iToU e2_rth882jPl)
                           (if (not (valid-bound-ids?_F3ZGrRJG1 id_ESxk5mToT))
                             (syntax-error
                               e_PTydP1KbW
                               '"invalid parameter list in")
                             ((lambda (new-vars_vKdc7H1xr labels_8ixFxb1xq)
                                (k_i1vrPP1tg
                                  new-vars_vKdc7H1xr
                                  (chi-body_sNZTrMBIf
                                    (cons e1_Ud6s.iToU e2_rth882jPl)
                                    e_PTydP1KbW
                                    (extend-var-env*_RS4q.99XC
                                      labels_8ixFxb1xq
                                      new-vars_vKdc7H1xr
                                      r_yjH4RJjLw)
                                    (make-binding-wrap_7af0eB95y
                                      id_ESxk5mToT
                                      labels_8ixFxb1xq
                                      w_Gww.LmTk6))))
                              (map gen-var_hMLALSjrb id_ESxk5mToT)
                              (gen-labels_wwfl95As. id_ESxk5mToT))))
                         tmp_PuunLkaDR)
                  ((lambda (tmp_Vns5stKcB)
                     (if tmp_Vns5stKcB
                       (apply (lambda (ids_33AsPP1u7 e1_6Z2kcH1u8 e2_ZvhAapjMr)
                                ((lambda (old-ids_RZUC82Tl7)
                                   (if (not (valid-bound-ids?_F3ZGrRJG1
                                              old-ids_RZUC82Tl7))
                                     (syntax-error
                                       e_PTydP1KbW
                                       '"invalid parameter list in")
                                     ((lambda (new-vars_JYzovgaEH
                                               labels_ji7R66jNP)
                                        (k_i1vrPP1tg
                                          ((letrec ((f_Mq4fpTB4g
                                                      (lambda (ls1_d5LVYMaEY
                                                               ls2_cq8nq1aE.)
                                                        (if (null? ls1_d5LVYMaEY)
                                                          ls2_cq8nq1aE.
                                                          (f_Mq4fpTB4g
                                                            (cdr ls1_d5LVYMaEY)
                                                            (cons (car ls1_d5LVYMaEY)
                                                                  ls2_cq8nq1aE.))))))
                                             f_Mq4fpTB4g)
                                           (cdr new-vars_JYzovgaEH)
                                           (car new-vars_JYzovgaEH))
                                          (chi-body_sNZTrMBIf
                                            (cons e1_6Z2kcH1u8 e2_ZvhAapjMr)
                                            e_PTydP1KbW
                                            (extend-var-env*_RS4q.99XC
                                              labels_ji7R66jNP
                                              new-vars_JYzovgaEH
                                              r_yjH4RJjLw)
                                            (make-binding-wrap_7af0eB95y
                                              old-ids_RZUC82Tl7
                                              labels_ji7R66jNP
                                              w_Gww.LmTk6))))
                                      (map gen-var_hMLALSjrb old-ids_RZUC82Tl7)
                                      (gen-labels_wwfl95As.
                                        old-ids_RZUC82Tl7))))
                                 (lambda-var-list_3x226TsAt ids_33AsPP1u7)))
                              tmp_Vns5stKcB)
                       (syntax-error e_PTydP1KbW)))
                   ($syntax-dispatch
                     (compile-in-annotation c_JyzoZxKbX value)
                     '(any any . each-any)))))
              ($syntax-dispatch
                (compile-in-annotation c_JyzoZxKbX value)
                '(each-any any . each-any)))))
         (parse-define-syntax_2UqR2KSX
           (lambda (e_vUWXtVjKs w_VCLtnIaBk s_59J3jJKaV k_00pOjbsTE)
             ((lambda (tmp_ps6NKOsUV)
                (if (if tmp_ps6NKOsUV
                      (apply (lambda (__k8EpcBKbC name_nm.4Jn1tV val_7AluwwaC4)
                               (id?_AEZ.eZJxY name_nm.4Jn1tV))
                             tmp_ps6NKOsUV)
                      '#f)
                  (apply (lambda (__nn32TYaCQ name_P2UlEBjL. val_18ASueT1tJ)
                           (k_00pOjbsTE
                             name_P2UlEBjL.
                             val_18ASueT1tJ
                             w_VCLtnIaBk))
                         tmp_ps6NKOsUV)
                  (syntax-error
                    (source-wrap_LaBpzTrpx
                      e_vUWXtVjKs
                      w_VCLtnIaBk
                      s_59J3jJKaV))))
              ($syntax-dispatch
                (compile-in-annotation e_vUWXtVjKs value)
                '(any any any)))))
         (parse-define_bysS1mjrr
           (lambda (e_WEiiySsQ1 w_zrYKaj1pC s_YYI1CFjHV k_8KuH1sBZd)
             ((lambda (tmp_TkyoojsQq)
                (if (if tmp_TkyoojsQq
                      (apply (lambda (__dL3iqL1sT name_pCKWOkB1t val_jY4eaysTl)
                               (id?_AEZ.eZJxY name_pCKWOkB1t))
                             tmp_TkyoojsQq)
                      '#f)
                  (apply (lambda (__17PeBXljKY name_T6yMsLB1g val_MjaQRaTjz)
                           (k_8KuH1sBZd
                             name_T6yMsLB1g
                             val_MjaQRaTjz
                             w_zrYKaj1pC))
                         tmp_TkyoojsQq)
                  ((lambda (tmp_185cDJijHw)
                     (if (if tmp_185cDJijHw
                           (apply (lambda (__xq9o8CTiZ
                                           name_XEeALDB0I
                                           args_9dJuupK9R
                                           e1_Wy2guv1r9
                                           e2_7QNrT2Ti1)
                                    (if (id?_AEZ.eZJxY name_XEeALDB0I)
                                      (valid-bound-ids?_F3ZGrRJG1
                                        (lambda-var-list_3x226TsAt
                                          args_9dJuupK9R))
                                      '#f))
                                  tmp_185cDJijHw)
                           '#f)
                       (apply (lambda (__tRFEV6jIv
                                       name_zw4cOoazn
                                       args_tzD9BbsRF
                                       e1_8i1Rt71qf
                                       e2_mGSZnP1qg)
                                (k_8KuH1sBZd
                                  (wrap_15NDGTTrpt name_zw4cOoazn w_zrYKaj1pC)
                                  (cons '#3(syntax-object
                                            lambda
                                            ((top)
                                             #4(ribcage
                                                #5(_ name args e1 e2)
                                                #5((top))
                                                #5("i" "i" "i" "i" "i"))
                                             #4(ribcage ())
                                             #4(ribcage
                                                #4(e w s k)
                                                #4((top))
                                                #4("i" "i" "i" "i"))
                                             #4(ribcage
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
                                                 "i"))
                                             #4(ribcage
                                                (#2(import-token *top*))
                                                ()
                                                ())))
                                        (wrap_15NDGTTrpt
                                          (cons args_tzD9BbsRF
                                                (cons e1_8i1Rt71qf
                                                      e2_mGSZnP1qg))
                                          w_zrYKaj1pC))
                                  '(())))
                              tmp_185cDJijHw)
                       ((lambda (tmp_AuRyJ01ph)
                          (if (if tmp_AuRyJ01ph
                                (apply (lambda (__X1mEdajIh name_GvAdab1q0)
                                         (id?_AEZ.eZJxY name_GvAdab1q0))
                                       tmp_AuRyJ01ph)
                                '#f)
                            (apply (lambda (__O0iWcKThn name_ZuDPOb1qy)
                                     (k_8KuH1sBZd
                                       (wrap_15NDGTTrpt
                                         name_ZuDPOb1qy
                                         w_zrYKaj1pC)
                                       '#3(syntax-object
                                           (void)
                                           ((top)
                                            #4(ribcage
                                               #2(_ name)
                                               #2((top))
                                               #2("i" "i"))
                                            #4(ribcage ())
                                            #4(ribcage
                                               #4(e w s k)
                                               #4((top))
                                               #4("i" "i" "i" "i"))
                                            #4(ribcage
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
                                                "i"))
                                            #4(ribcage
                                               (#2(import-token *top*))
                                               ()
                                               ())))
                                       '(())))
                                   tmp_AuRyJ01ph)
                            (syntax-error
                              (source-wrap_LaBpzTrpx
                                e_WEiiySsQ1
                                w_zrYKaj1pC
                                s_YYI1CFjHV))))
                        ($syntax-dispatch
                          (compile-in-annotation e_WEiiySsQ1 value)
                          '(any any)))))
                   ($syntax-dispatch
                     (compile-in-annotation e_WEiiySsQ1 value)
                     '(any (any . any) any . each-any)))))
              ($syntax-dispatch
                (compile-in-annotation e_WEiiySsQ1 value)
                '(any any any)))))
         (parse-import_l27SwTT.S
           (lambda (e_zo1dPoaxJ w_nnSH4BYa s_qqHejMaxL k_Eip0yajGV)
             ((lambda (tmp_15RRAkD1oX)
                (if (if tmp_15RRAkD1oX
                      (apply (lambda (__hyYnLz1ol mid_HF5q2Eaxv)
                               (id?_AEZ.eZJxY mid_HF5q2Eaxv))
                             tmp_15RRAkD1oX)
                      '#f)
                  (apply (lambda (__eaJ3yVjGs mid_RJGk66Tf2)
                           (k_Eip0yajGV
                             (wrap_15NDGTTrpt mid_RJGk66Tf2 w_nnSH4BYa)))
                         tmp_15RRAkD1oX)
                  (syntax-error
                    (source-wrap_LaBpzTrpx
                      e_zo1dPoaxJ
                      w_nnSH4BYa
                      s_qqHejMaxL))))
              ($syntax-dispatch
                (compile-in-annotation e_zo1dPoaxJ value)
                '(any any)))))
         (parse-module_UVlZVkszm
           (lambda (e_OzNnSbsJA
                    w_ALi.sWsJB
                    s_14YBiIkark
                    *w_.PDJXv1ic
                    k_xpze35K0V)
             (letrec ((return_CCQPVMasB
                        (lambda (id_ldtmekBXE
                                 exports_SYZlatjFn
                                 forms_oaE5DxK5P)
                          (k_xpze35K0V
                            id_ldtmekBXE
                            (listify_npu7VBK00 exports_SYZlatjFn)
                            (map (lambda (x_sF550b1oo)
                                   (wrap_15NDGTTrpt x_sF550b1oo *w_.PDJXv1ic))
                                 forms_oaE5DxK5P))))
                      (listify_npu7VBK00
                        (lambda (exports_PmXcQoaub)
                          (if (null? exports_PmXcQoaub)
                            '()
                            (cons ((lambda (tmp_VdtY.qTdg)
                                     ((lambda (tmp_oMNN2BjEZ)
                                        (if tmp_oMNN2BjEZ
                                          (apply (lambda (ex_VL1D3HBWQ)
                                                   (listify_npu7VBK00
                                                     ex_VL1D3HBWQ))
                                                 tmp_oMNN2BjEZ)
                                          (if (id?_AEZ.eZJxY tmp_VdtY.qTdg)
                                            (wrap_15NDGTTrpt
                                              tmp_VdtY.qTdg
                                              *w_.PDJXv1ic)
                                            (syntax-error
                                              (source-wrap_LaBpzTrpx
                                                e_OzNnSbsJA
                                                w_ALi.sWsJB
                                                s_14YBiIkark)
                                              '"invalid exports list in"))))
                                      ($syntax-dispatch
                                        (compile-in-annotation
                                          tmp_VdtY.qTdg
                                          value)
                                        'each-any)))
                                   (car exports_PmXcQoaub))
                                  (listify_npu7VBK00
                                    (cdr exports_PmXcQoaub)))))))
               ((lambda (tmp_lZxYGCTaM)
                  (if tmp_lZxYGCTaM
                    (apply (lambda (__aBK7otK37 ex_5DL2XysMR form_TKhTjHBV.)
                             (return_CCQPVMasB
                               '#f
                               ex_5DL2XysMR
                               form_TKhTjHBV.))
                           tmp_lZxYGCTaM)
                    ((lambda (tmp_E11EtlK1.)
                       (if (if tmp_E11EtlK1.
                             (apply (lambda (__M3S333sLE
                                             mid_no88x31ke
                                             ex_ig1CAaTb6
                                             form_yvULTDBUP)
                                      (id?_AEZ.eZJxY mid_no88x31ke))
                                    tmp_E11EtlK1.)
                             '#f)
                         (apply (lambda (__17jUssX1kv
                                         mid_16yZa3BK2e
                                         ex_OUbJPUK2f
                                         form_Dto0guTbp)
                                  (return_CCQPVMasB
                                    (wrap_15NDGTTrpt
                                      mid_16yZa3BK2e
                                      w_ALi.sWsJB)
                                    ex_OUbJPUK2f
                                    form_Dto0guTbp))
                                tmp_E11EtlK1.)
                         (syntax-error
                           (source-wrap_LaBpzTrpx
                             e_OzNnSbsJA
                             w_ALi.sWsJB
                             s_14YBiIkark))))
                     ($syntax-dispatch
                       (compile-in-annotation e_OzNnSbsJA value)
                       '(any any each-any . each-any)))))
                ($syntax-dispatch
                  (compile-in-annotation e_OzNnSbsJA value)
                  '(any each-any . each-any))))))
         (do-import!_ZtgQqFah.
           (lambda (interface_FiNTqajzH ribcage_xQv0a01hq)
             ((lambda (token_XN8K46jzT)
                (if token_XN8K46jzT
                  (extend-ribcage-subst!_9ETy31AwG
                    ribcage_xQv0a01hq
                    token_XN8K46jzT)
                  (vfor-each_XnuRqpagO
                    (lambda (id_B8sQUpK.z)
                      ((lambda (label1_eiglZn1hZ)
                         (begin
                           (if (not label1_eiglZn1hZ)
                             (syntax-error
                               id_B8sQUpK.z
                               '"exported identifier not visible")
                             (void))
                           (extend-ribcage!_220FBaJED
                             ribcage_xQv0a01hq
                             id_B8sQUpK.z
                             label1_eiglZn1hZ)))
                       (id-var-name-loc_wJ97tA0XW id_B8sQUpK.z '(()))))
                    (interface-exports_vfHxavsv. interface_FiNTqajzH))))
              (interface-token_18s6UmHsv6 interface_FiNTqajzH))))
         (chi-internal_8665aDszb
           (lambda (ribcage_KjzhEA959
                    source-exp_EYzzkCSOT
                    body_qobFvY95b
                    r_wjsw2Fiek
                    k_0E4jUpiel)
             (letrec ((return_Zo5MvT0X9
                        (lambda (exprs_L8KRnyT7L
                                 ids_12lVo11KZD
                                 vars_zy0lhr1gW
                                 vals_v8O7COT7O
                                 inits_bJrmlijye)
                          (begin
                            (check-defined-ids_YL8SPPsyS
                              source-exp_EYzzkCSOT
                              ids_12lVo11KZD)
                            (k_0E4jUpiel
                              exprs_L8KRnyT7L
                              ids_12lVo11KZD
                              (reverse vars_zy0lhr1gW)
                              (reverse vals_v8O7COT7O)
                              inits_bJrmlijye)))))
               ((letrec ((parse_atLJGaSO9
                           (lambda (body_odnP9k95v
                                    ids_lATsVOSOh
                                    vars_BwjLCs95A
                                    vals_yt6OZ00Xs
                                    inits_16wKDuJieK)
                             (if (null? body_odnP9k95v)
                               (return_Zo5MvT0X9
                                 body_odnP9k95v
                                 ids_lATsVOSOh
                                 vars_BwjLCs95A
                                 vals_yt6OZ00Xs
                                 inits_16wKDuJieK)
                               ((lambda (er_FvIxd70XK e_46bSgGrn9)
                                  (call-with-values
                                    (lambda ()
                                      (syntax-type_Z4HWWyjl.
                                        e_46bSgGrn9
                                        er_FvIxd70XK
                                        '(())
                                        '#f
                                        ribcage_KjzhEA959))
                                    (lambda (type_1yTrrpJGd
                                             value_aLreBz0Yw
                                             e_GTIFvBJGe
                                             w_.YY52kAx6
                                             s_1hzjMpifQ)
                                      (if (memv type_1yTrrpJGd '(define-form))
                                        (parse-define_bysS1mjrr
                                          e_GTIFvBJGe
                                          w_.YY52kAx6
                                          s_1hzjMpifQ
                                          (lambda (id_sa.0IfsFI
                                                   rhs_PbFjpFKX0
                                                   w_aZKfFWsFK)
                                            ((lambda (label_BK16YIanB
                                                      id_Mduc7ABO0)
                                               ((lambda (var_jNNlKP1eA)
                                                  (begin
                                                    (extend-ribcage!_220FBaJED
                                                      ribcage_KjzhEA959
                                                      id_Mduc7ABO0
                                                      label_BK16YIanB)
                                                    (extend-store!_TzWoBfTZ7
                                                      r_wjsw2Fiek
                                                      label_BK16YIanB
                                                      (make-binding_CEIm66Jv6
                                                        'lexical
                                                        var_jNNlKP1eA))
                                                    (parse_atLJGaSO9
                                                      (cdr body_odnP9k95v)
                                                      (cons id_Mduc7ABO0
                                                            ids_lATsVOSOh)
                                                      (cons var_jNNlKP1eA
                                                            vars_BwjLCs95A)
                                                      (cons (cons er_FvIxd70XK
                                                                  (wrap_15NDGTTrpt
                                                                    rhs_PbFjpFKX0
                                                                    w_aZKfFWsFK))
                                                            vals_yt6OZ00Xs)
                                                      inits_16wKDuJieK)))
                                                (gen-var_hMLALSjrb
                                                  id_Mduc7ABO0)))
                                             (gen-label_LppBybSKb)
                                             (wrap_15NDGTTrpt
                                               id_sa.0IfsFI
                                               w_aZKfFWsFK))))
                                        (if (memv type_1yTrrpJGd
                                                  '(define-syntax-form))
                                          (parse-define-syntax_2UqR2KSX
                                            e_GTIFvBJGe
                                            w_.YY52kAx6
                                            s_1hzjMpifQ
                                            (lambda (id_aURARYKVG
                                                     rhs_0OgebABMy
                                                     w_2vwdWJjuh)
                                              ((lambda (exp_t0OYVysDB
                                                        label_X0z4bpKVS
                                                        id_NtoDDOsDz)
                                                 (begin
                                                   (extend-ribcage!_220FBaJED
                                                     ribcage_KjzhEA959
                                                     id_NtoDDOsDz
                                                     label_X0z4bpKVS)
                                                   (extend-store!_TzWoBfTZ7
                                                     r_wjsw2Fiek
                                                     label_X0z4bpKVS
                                                     (make-binding_CEIm66Jv6
                                                       'deferred
                                                       exp_t0OYVysDB))
                                                   (parse_atLJGaSO9
                                                     (cdr body_odnP9k95v)
                                                     (cons id_NtoDDOsDz
                                                           ids_lATsVOSOh)
                                                     vars_BwjLCs95A
                                                     vals_yt6OZ00Xs
                                                     inits_16wKDuJieK)))
                                               (chi_emzRIPszD
                                                 rhs_0OgebABMy
                                                 (transformer-env_h9Z7ZzreX
                                                   er_FvIxd70XK)
                                                 w_2vwdWJjuh)
                                               (gen-label_LppBybSKb)
                                               (wrap_15NDGTTrpt
                                                 id_aURARYKVG
                                                 w_2vwdWJjuh))))
                                          (if (memv type_1yTrrpJGd
                                                    '(module-form))
                                            ((lambda (*ribcage_SUBeakBIR)
                                               ((lambda (*w_tkMePEahu)
                                                  (parse-module_UVlZVkszm
                                                    e_GTIFvBJGe
                                                    w_.YY52kAx6
                                                    s_1hzjMpifQ
                                                    *w_tkMePEahu
                                                    (lambda (id_g0tiZ.szZ
                                                             exports_17VuD0JKRh
                                                             forms_6izvQXBI9)
                                                      (chi-internal_8665aDszb
                                                        *ribcage_SUBeakBIR
                                                        (source-wrap_LaBpzTrpx
                                                          e_GTIFvBJGe
                                                          w_.YY52kAx6
                                                          s_1hzjMpifQ)
                                                        (map (lambda (d_yjCuA1ah7)
                                                               (cons er_FvIxd70XK
                                                                     d_yjCuA1ah7))
                                                             forms_6izvQXBI9)
                                                        r_wjsw2Fiek
                                                        (lambda (*body_b0uuNkaiu
                                                                 *ids_wKT6eDBJW
                                                                 *vars_pOsNMaT0e
                                                                 *vals_0nPMv719o
                                                                 *inits_4mWdJ1KSa)
                                                          (begin
                                                            (check-module-exports_1iJTcHsyM
                                                              source-exp_EYzzkCSOT
                                                              (flatten-exports_13rskPPTVM
                                                                exports_17VuD0JKRh)
                                                              *ids_wKT6eDBJW)
                                                            ((lambda (inits_xcIbxQaiU
                                                                      vals_qgMH8rsAb
                                                                      vars_pU3rlb19K
                                                                      iface_eKR0deT0A)
                                                               (if id_g0tiZ.szZ
                                                                 ((lambda (label_ornWthKTp)
                                                                    (begin
                                                                      (extend-ribcage!_220FBaJED
                                                                        ribcage_KjzhEA959
                                                                        id_g0tiZ.szZ
                                                                        label_ornWthKTp)
                                                                      (extend-store!_TzWoBfTZ7
                                                                        r_wjsw2Fiek
                                                                        label_ornWthKTp
                                                                        (make-binding_CEIm66Jv6
                                                                          'module
                                                                          iface_eKR0deT0A))
                                                                      (parse_atLJGaSO9
                                                                        (cdr body_odnP9k95v)
                                                                        (cons id_g0tiZ.szZ
                                                                              ids_lATsVOSOh)
                                                                        vars_pU3rlb19K
                                                                        vals_qgMH8rsAb
                                                                        inits_xcIbxQaiU)))
                                                                  (gen-label_LppBybSKb))
                                                                 (begin
                                                                   (do-import!_ZtgQqFah.
                                                                     iface_eKR0deT0A
                                                                     ribcage_KjzhEA959)
                                                                   (parse_atLJGaSO9
                                                                     (cdr body_odnP9k95v)
                                                                     (cons iface_eKR0deT0A
                                                                           ids_lATsVOSOh)
                                                                     vars_pU3rlb19K
                                                                     vals_qgMH8rsAb
                                                                     inits_xcIbxQaiU))))
                                                             (append
                                                               inits_16wKDuJieK
                                                               *inits_4mWdJ1KSa
                                                               *body_b0uuNkaiu)
                                                             (append
                                                               *vals_0nPMv719o
                                                               vals_yt6OZ00Xs)
                                                             (append
                                                               *vars_pOsNMaT0e
                                                               vars_BwjLCs95A)
                                                             (make-trimmed-interface_mqgclLTWQ
                                                               exports_17VuD0JKRh))))))))
                                                (make-wrap_11O4kRWi7j
                                                  (wrap-marks_KA6c9HSHW
                                                    w_.YY52kAx6)
                                                  (cons *ribcage_SUBeakBIR
                                                        (wrap-subst_Kj.SjPSHZ
                                                          w_.YY52kAx6)))))
                                             (make-ribcage_3Q97Hvrjd
                                               '()
                                               '()
                                               '()))
                                            (if (memv type_1yTrrpJGd
                                                      '(import-form))
                                              (parse-import_l27SwTT.S
                                                e_GTIFvBJGe
                                                w_.YY52kAx6
                                                s_1hzjMpifQ
                                                (lambda (mid_FAGOjOTXp)
                                                  ((lambda (mlabel_ESGxEMaeP)
                                                     ((lambda (binding_lln9FVjn5)
                                                        ((lambda (t_15ID71KOL)
                                                           (if (memv t_15ID71KOL
                                                                     '(module))
                                                             ((lambda (iface_1878MckafJ)
                                                                (begin
                                                                  (if value_aLreBz0Yw
                                                                    (extend-ribcage-barrier!_16rJM7l958
                                                                      ribcage_KjzhEA959
                                                                      value_aLreBz0Yw)
                                                                    (void))
                                                                  (do-import!_ZtgQqFah.
                                                                    iface_1878MckafJ
                                                                    ribcage_KjzhEA959)
                                                                  (parse_atLJGaSO9
                                                                    (cdr body_odnP9k95v)
                                                                    (cons iface_1878MckafJ
                                                                          ids_lATsVOSOh)
                                                                    vars_BwjLCs95A
                                                                    vals_yt6OZ00Xs
                                                                    inits_16wKDuJieK)))
                                                              (cdr binding_lln9FVjn5))
                                                             (if (memv t_15ID71KOL
                                                                       '(displaced-lexical))
                                                               (displaced-lexical-error_133PzNLSFq
                                                                 mid_FAGOjOTXp)
                                                               (syntax-error
                                                                 mid_FAGOjOTXp
                                                                 '"import from unknown module"))))
                                                         (car binding_lln9FVjn5)))
                                                      (lookup_14YP5xrre9
                                                        mlabel_ESGxEMaeP
                                                        r_wjsw2Fiek)))
                                                   (id-var-name_a6RQVDroq
                                                     mid_FAGOjOTXp
                                                     '(())))))
                                              (if (memv type_1yTrrpJGd
                                                        '(begin-form))
                                                ((lambda (tmp_rl2ePoacL)
                                                   (if tmp_rl2ePoacL
                                                     (apply (lambda (__14BbkwoBDd
                                                                     e1_TGbNxusu4)
                                                              (parse_atLJGaSO9
                                                                ((letrec ((f_AQyEEqTVF
                                                                            (lambda (forms_GhdZI.suk)
                                                                              (if (null? forms_GhdZI.suk)
                                                                                (cdr body_odnP9k95v)
                                                                                (cons (cons er_FvIxd70XK
                                                                                            (wrap_15NDGTTrpt
                                                                                              (car forms_GhdZI.suk)
                                                                                              w_.YY52kAx6))
                                                                                      (f_AQyEEqTVF
                                                                                        (cdr forms_GhdZI.suk)))))))
                                                                   f_AQyEEqTVF)
                                                                 e1_TGbNxusu4)
                                                                ids_lATsVOSOh
                                                                vars_BwjLCs95A
                                                                vals_yt6OZ00Xs
                                                                inits_16wKDuJieK))
                                                            tmp_rl2ePoacL)
                                                     (syntax-error
                                                       e_GTIFvBJGe)))
                                                 ($syntax-dispatch
                                                   (compile-in-annotation
                                                     e_GTIFvBJGe
                                                     value)
                                                   '(any . each-any)))
                                                (if (memv type_1yTrrpJGd
                                                          '(eval-when-form))
                                                  ((lambda (tmp_jOr552ii2)
                                                     (if tmp_jOr552ii2
                                                       (apply (lambda (__OZvZh6ii4
                                                                       x_6CpX3v00N
                                                                       e1_fiVe5kAAn)
                                                                (parse_atLJGaSO9
                                                                  (if (memq 'eval
                                                                            (chi-when-list_UuubX.jlW
                                                                              x_6CpX3v00N
                                                                              w_.YY52kAx6))
                                                                    ((letrec ((f_qoGuz1aak
                                                                                (lambda (forms_vCPeLajjw)
                                                                                  (if (null? forms_vCPeLajjw)
                                                                                    (cdr body_odnP9k95v)
                                                                                    (cons (cons er_FvIxd70XK
                                                                                                (wrap_15NDGTTrpt
                                                                                                  (car forms_vCPeLajjw)
                                                                                                  w_.YY52kAx6))
                                                                                          (f_qoGuz1aak
                                                                                            (cdr forms_vCPeLajjw)))))))
                                                                       f_qoGuz1aak)
                                                                     e1_fiVe5kAAn)
                                                                    (cdr body_odnP9k95v))
                                                                  ids_lATsVOSOh
                                                                  vars_BwjLCs95A
                                                                  vals_yt6OZ00Xs
                                                                  inits_16wKDuJieK))
                                                              tmp_jOr552ii2)
                                                       (syntax-error
                                                         e_GTIFvBJGe)))
                                                   ($syntax-dispatch
                                                     (compile-in-annotation
                                                       e_GTIFvBJGe
                                                       value)
                                                     '(any each-any
                                                           .
                                                           each-any)))
                                                  (if (memv type_1yTrrpJGd
                                                            '(local-syntax-form))
                                                    (chi-local-syntax_7xtysjjrG
                                                      value_aLreBz0Yw
                                                      e_GTIFvBJGe
                                                      er_FvIxd70XK
                                                      w_.YY52kAx6
                                                      s_1hzjMpifQ
                                                      (lambda (forms_122KBEaSQA
                                                               er_18u22PKrpa
                                                               w_Zk4h0n0ZL
                                                               s_JuH52r0ZM)
                                                        (parse_atLJGaSO9
                                                          ((letrec ((f_N1AOHY988
                                                                      (lambda (forms_WE85.s98a)
                                                                        (if (null? forms_WE85.s98a)
                                                                          (cdr body_odnP9k95v)
                                                                          (cons (cons er_18u22PKrpa
                                                                                      (wrap_15NDGTTrpt
                                                                                        (car forms_WE85.s98a)
                                                                                        w_Zk4h0n0ZL))
                                                                                (f_N1AOHY988
                                                                                  (cdr forms_WE85.s98a)))))))
                                                             f_N1AOHY988)
                                                           forms_122KBEaSQA)
                                                          ids_lATsVOSOh
                                                          vars_BwjLCs95A
                                                          vals_yt6OZ00Xs
                                                          inits_16wKDuJieK)))
                                                    (return_Zo5MvT0X9
                                                      (cons (cons er_FvIxd70XK
                                                                  (source-wrap_LaBpzTrpx
                                                                    e_GTIFvBJGe
                                                                    w_.YY52kAx6
                                                                    s_1hzjMpifQ))
                                                            (cdr body_odnP9k95v))
                                                      ids_lATsVOSOh
                                                      vars_BwjLCs95A
                                                      vals_yt6OZ00Xs
                                                      inits_16wKDuJieK)))))))))))
                                (caar body_odnP9k95v)
                                (cdar body_odnP9k95v))))))
                  parse_atLJGaSO9)
                body_qobFvY95b
                '()
                '()
                '()
                '()))))
         (chi-body_sNZTrMBIf
           (lambda (body_xxGWPkArZ
                    outer-form_QotE8GriR
                    r_c03MCAAr0
                    w_114OaGGriS)
             ((lambda (r_huWTg30SC)
                ((lambda (ribcage_N6Ghk2i9Z)
                   ((lambda (w_MoyjJcArk)
                      ((lambda (body_b2VPcj0SP)
                         (chi-internal_8665aDszb
                           ribcage_N6Ghk2i9Z
                           outer-form_QotE8GriR
                           body_b2VPcj0SP
                           r_huWTg30SC
                           (lambda (exprs_ebAeSn0T0
                                    ids_k1tBx3rjw
                                    vars_UKJmspJBP
                                    vals_Q0bvDg91g
                                    inits_J4Z..VSK.)
                             (begin
                               (if (null? exprs_ebAeSn0T0)
                                 (syntax-error
                                   outer-form_QotE8GriR
                                   '"no expressions in body")
                                 (void))
                               (build-body_rzGZUWSAk
                                 '#f
                                 vars_UKJmspJBP
                                 (map (lambda (x_yerqFeSL.)
                                        (chi_emzRIPszD
                                          (cdr x_yerqFeSL.)
                                          (car x_yerqFeSL.)
                                          '(())))
                                      vals_Q0bvDg91g)
                                 (build-sequence_11xUoJl9Sx
                                   '#f
                                   (map (lambda (x_ieO40jrlq)
                                          (chi_emzRIPszD
                                            (cdr x_ieO40jrlq)
                                            (car x_ieO40jrlq)
                                            '(())))
                                        (append
                                          inits_J4Z..VSK.
                                          exprs_ebAeSn0T0))))))))
                       (map (lambda (x_PPkPZTAur)
                              (cons r_huWTg30SC
                                    (wrap_15NDGTTrpt x_PPkPZTAur w_MoyjJcArk)))
                            body_xxGWPkArZ)))
                    (make-wrap_11O4kRWi7j
                      (wrap-marks_KA6c9HSHW w_114OaGGriS)
                      (cons ribcage_N6Ghk2i9Z
                            (wrap-subst_Kj.SjPSHZ w_114OaGGriS)))))
                 (make-ribcage_3Q97Hvrjd '() '() '())))
              (cons '("placeholder" placeholder) r_c03MCAAr0))))
         (chi-macro_ovGrcJahK
           (lambda (p_q9XSRqSB3
                    e_p5.699JsW
                    r_XmcskBJsW
                    w_7ZMcsdJsX
                    s_18GHWE0AjP
                    rib_14sQzzH0Kj)
             (letrec ((rebuild-macro-output_6fMa2r0Kp
                        (lambda (x_ynEZ4w9Vy m_gKBLYeSDi)
                          (if (pair? x_ynEZ4w9Vy)
                            (cons (rebuild-macro-output_6fMa2r0Kp
                                    (car x_ynEZ4w9Vy)
                                    m_gKBLYeSDi)
                                  (rebuild-macro-output_6fMa2r0Kp
                                    (cdr x_ynEZ4w9Vy)
                                    m_gKBLYeSDi))
                            (if (syntax-object?_PiqwpY0La x_ynEZ4w9Vy)
                              ((lambda (w_I5KGyc9Ym)
                                 ((lambda (s_1LGhzQ9Yv ms_14KO5J1Jx3)
                                    (make-syntax-object_ZCTCCii2o
                                      (syntax-object-expression_K1xadx9Um
                                        x_ynEZ4w9Vy)
                                      (if (if (pair? ms_14KO5J1Jx3)
                                            (eq? (car ms_14KO5J1Jx3) '#f)
                                            '#f)
                                        (make-wrap_11O4kRWi7j
                                          (cdr ms_14KO5J1Jx3)
                                          (cdr s_1LGhzQ9Yv))
                                        (make-wrap_11O4kRWi7j
                                          (cons m_gKBLYeSDi ms_14KO5J1Jx3)
                                          (if rib_14sQzzH0Kj
                                            (cons rib_14sQzzH0Kj
                                                  (cons 'shift s_1LGhzQ9Yv))
                                            (cons 'shift s_1LGhzQ9Yv))))))
                                  (wrap-subst_Kj.SjPSHZ w_I5KGyc9Ym)
                                  (wrap-marks_KA6c9HSHW w_I5KGyc9Ym)))
                               (syntax-object-wrap_DJHTz7SC8 x_ynEZ4w9Vy))
                              (if (vector? x_ynEZ4w9Vy)
                                ((lambda (n_xxgBwr0No)
                                   ((lambda (v_QjiY5M9WB)
                                      ((letrec ((doloop_oFs9HxJvn
                                                  (lambda (i_DaI8sdJvq)
                                                    (if (= i_DaI8sdJvq
                                                           n_xxgBwr0No)
                                                      v_QjiY5M9WB
                                                      (begin
                                                        (vector-set!
                                                          v_QjiY5M9WB
                                                          i_DaI8sdJvq
                                                          (rebuild-macro-output_6fMa2r0Kp
                                                            (vector-ref
                                                              x_ynEZ4w9Vy
                                                              i_DaI8sdJvq)
                                                            m_gKBLYeSDi))
                                                        (doloop_oFs9HxJvn
                                                          (+ i_DaI8sdJvq
                                                             '1)))))))
                                         doloop_oFs9HxJvn)
                                       '0))
                                    (make-vector n_xxgBwr0No)))
                                 (vector-length x_ynEZ4w9Vy))
                                (if (symbol? x_ynEZ4w9Vy)
                                  (syntax-error
                                    (source-wrap_LaBpzTrpx
                                      e_p5.699JsW
                                      w_7ZMcsdJsX
                                      s_18GHWE0AjP)
                                    '"encountered raw symbol "
                                    (format '"~s" x_ynEZ4w9Vy)
                                    '" in output of macro")
                                  x_ynEZ4w9Vy)))))))
               (rebuild-macro-output_6fMa2r0Kp
                 ((lambda (out_7xGZqySBo)
                    (if (procedure? out_7xGZqySBo)
                      (out_7xGZqySBo
                        (lambda (id_Wi0TNc9UU)
                          (begin
                            (if (not (identifier? id_Wi0TNc9UU))
                              (syntax-error
                                id_Wi0TNc9UU
                                '"environment argument is not an identifier")
                              (void))
                            (lookup_14YP5xrre9
                              (id-var-name_a6RQVDroq id_Wi0TNc9UU '(()))
                              r_XmcskBJsW))))
                      out_7xGZqySBo))
                  (p_q9XSRqSB3
                    (source-wrap_LaBpzTrpx
                      e_p5.699JsW
                      (anti-mark_182Z59qJDR w_7ZMcsdJsX)
                      s_18GHWE0AjP)))
                 (string '#\m)))))
         (chi-set!_K2olx.T.i
           (lambda (e_7WfUUFJkd
                    r_r96XUjr2X
                    w_vOx5J0Ab6
                    s_URMYzxJkf
                    rib_dBWYpiStp)
             ((lambda (tmp_qrpHseiV3)
                (if (if tmp_qrpHseiV3
                      (apply (lambda (__HMbLX00KX id_NfArDv0KY val_MS9c5c9T7)
                               (id?_AEZ.eZJxY id_NfArDv0KY))
                             tmp_qrpHseiV3)
                      '#f)
                  (apply (lambda (__CktBBGSuQ id_uJcXLlJlI val_18xmyyb0D4)
                           ((lambda (n_S8UD5z0Dc)
                              ((lambda (b_MvaI2YJl1)
                                 ((lambda (t_00RhtTAc6)
                                    (if (memv t_00RhtTAc6 '(macro!))
                                      ((lambda (val_edTnJXAhY id_dA.bP70In)
                                         (syntax-type_Z4HWWyjl.
                                           (chi-macro_ovGrcJahK
                                             (binding-value_kYJv9nSEm
                                               b_MvaI2YJl1)
                                             (list '#3(syntax-object
                                                       set!
                                                       ((top)
                                                        #4(ribcage ())
                                                        #4(ribcage
                                                           #2(id val)
                                                           #2((top))
                                                           #2("i" "i"))
                                                        #4(ribcage ())
                                                        #4(ribcage
                                                           #1(t)
                                                           #1(("m" top))
                                                           #1("i"))
                                                        #4(ribcage ())
                                                        #4(ribcage
                                                           #1(b)
                                                           #1((top))
                                                           #1("i"))
                                                        #4(ribcage ())
                                                        #4(ribcage
                                                           #1(n)
                                                           #1((top))
                                                           #1("i"))
                                                        #4(ribcage
                                                           #3(_ id val)
                                                           #3((top))
                                                           #3("i" "i" "i"))
                                                        #4(ribcage ())
                                                        #4(ribcage
                                                           #5(e r w s rib)
                                                           #5((top))
                                                           #5("i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"))
                                                        #4(ribcage
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
                                                            "i"))
                                                        #4(ribcage
                                                           (#2(import-token
                                                               *top*))
                                                           ()
                                                           ())))
                                                   id_dA.bP70In
                                                   val_edTnJXAhY)
                                             r_r96XUjr2X
                                             '(())
                                             s_URMYzxJkf
                                             rib_dBWYpiStp)
                                           r_r96XUjr2X
                                           '(())
                                           s_URMYzxJkf
                                           rib_dBWYpiStp))
                                       (wrap_15NDGTTrpt
                                         val_18xmyyb0D4
                                         w_vOx5J0Ab6)
                                       (wrap_15NDGTTrpt
                                         id_uJcXLlJlI
                                         w_vOx5J0Ab6))
                                      (values
                                        'core
                                        (lambda (e_mSrENf0EY
                                                 r_ceqvsaSvQ
                                                 w_13zr5oZSvR
                                                 s_6pbU9JJmI)
                                          ((lambda (n_c0hzsH0E8 val_TiUE259Nh)
                                             ((lambda (b_11clYKKr4I)
                                                ((lambda (t_ZTlWQI9NG)
                                                   (if (memv t_ZTlWQI9NG
                                                             '(lexical))
                                                     (if s_6pbU9JJmI
                                                       (list 'compile-in-annotation
                                                             (list 'set!
                                                                   (binding-value_kYJv9nSEm
                                                                     b_11clYKKr4I)
                                                                   val_TiUE259Nh)
                                                             s_6pbU9JJmI)
                                                       (list 'set!
                                                             (binding-value_kYJv9nSEm
                                                               b_11clYKKr4I)
                                                             val_TiUE259Nh))
                                                     (if (memv t_ZTlWQI9NG
                                                               '(global))
                                                       (if s_6pbU9JJmI
                                                         (list 'compile-in-annotation
                                                               (list 'set!
                                                                     (binding-value_kYJv9nSEm
                                                                       b_11clYKKr4I)
                                                                     val_TiUE259Nh)
                                                               s_6pbU9JJmI)
                                                         (list 'set!
                                                               (binding-value_kYJv9nSEm
                                                                 b_11clYKKr4I)
                                                               val_TiUE259Nh))
                                                       (if (memv t_ZTlWQI9NG
                                                                 '(displaced-lexical))
                                                         (syntax-error
                                                           (wrap_15NDGTTrpt
                                                             id_uJcXLlJlI
                                                             w_13zr5oZSvR)
                                                           '"identifier out of context")
                                                         (syntax-error
                                                           (source-wrap_LaBpzTrpx
                                                             e_mSrENf0EY
                                                             w_13zr5oZSvR
                                                             s_6pbU9JJmI))))))
                                                 (binding-type_jhChhh9WA
                                                   b_11clYKKr4I)))
                                              (lookup_14YP5xrre9
                                                n_c0hzsH0E8
                                                r_ceqvsaSvQ)))
                                           (id-var-name_a6RQVDroq
                                             id_uJcXLlJlI
                                             w_13zr5oZSvR)
                                           (chi_emzRIPszD
                                             val_18xmyyb0D4
                                             r_ceqvsaSvQ
                                             w_13zr5oZSvR)))
                                        e_7WfUUFJkd
                                        w_vOx5J0Ab6
                                        s_URMYzxJkf)))
                                  (binding-type_jhChhh9WA b_MvaI2YJl1)))
                               (lookup_14YP5xrre9 n_S8UD5z0Dc r_r96XUjr2X)))
                            (id-var-name_a6RQVDroq id_uJcXLlJlI w_vOx5J0Ab6)))
                         tmp_qrpHseiV3)
                  (syntax-error
                    (source-wrap_LaBpzTrpx
                      e_7WfUUFJkd
                      w_vOx5J0Ab6
                      s_URMYzxJkf))))
              ($syntax-dispatch
                (compile-in-annotation e_7WfUUFJkd value)
                '(any any any)))))
         (chi-application_wlG3CxBIW
           (lambda (x_15KG9xYJiv
                    e_V6h9kTA9n
                    r_11FeMPaSrG
                    w_nKyKR8A9p
                    s_5W9xE00AQ)
             ((lambda (tmp_StaFZliSs)
                (if tmp_StaFZliSs
                  (apply (lambda (e0_ivPX400Ap e1_Iibwh6Srh)
                           (if s_5W9xE00AQ
                             (list 'compile-in-annotation
                                   (cons x_15KG9xYJiv
                                         (map (lambda (e_ezz6Mur2v)
                                                (chi_emzRIPszD
                                                  e_ezz6Mur2v
                                                  r_11FeMPaSrG
                                                  w_nKyKR8A9p))
                                              e1_Iibwh6Srh))
                                   s_5W9xE00AQ)
                             (cons x_15KG9xYJiv
                                   (map (lambda (e_ReqOUpJjO)
                                          (chi_emzRIPszD
                                            e_ReqOUpJjO
                                            r_11FeMPaSrG
                                            w_nKyKR8A9p))
                                        e1_Iibwh6Srh))))
                         tmp_StaFZliSs)
                  (syntax-error
                    (source-wrap_LaBpzTrpx
                      e_V6h9kTA9n
                      w_nKyKR8A9p
                      s_5W9xE00AQ))))
              ($syntax-dispatch
                (compile-in-annotation e_V6h9kTA9n value)
                '(any . each-any)))))
         (chi-expr_978lxZKR.
           (lambda (type_3LqErY9B8
                    value_112S1dDA1A
                    e_5skkQhJaJ
                    r_PsLEfxJaK
                    w_qu8qZ1JaL
                    s_vsqM0eSjV)
             (if (memv type_3LqErY9B8 '(lexical))
               (if s_vsqM0eSjV
                 (list 'compile-in-annotation
                       value_112S1dDA1A
                       s_vsqM0eSjV)
                 value_112S1dDA1A)
               (if (memv type_3LqErY9B8 '(core))
                 (value_112S1dDA1A
                   e_5skkQhJaJ
                   r_PsLEfxJaK
                   w_qu8qZ1JaL
                   s_vsqM0eSjV)
                 (if (memv type_3LqErY9B8 '(lexical-call))
                   (chi-application_wlG3CxBIW
                     (if (source-annotation_9y.vnbSDy (car e_5skkQhJaJ))
                       (list 'compile-in-annotation
                             value_112S1dDA1A
                             (source-annotation_9y.vnbSDy (car e_5skkQhJaJ)))
                       value_112S1dDA1A)
                     e_5skkQhJaJ
                     r_PsLEfxJaK
                     w_qu8qZ1JaL
                     s_vsqM0eSjV)
                   (if (memv type_3LqErY9B8 '(constant))
                     (if s_vsqM0eSjV
                       (list 'compile-in-annotation
                             (list 'quote
                                   (strip_1ln0rNKSx
                                     (source-wrap_LaBpzTrpx
                                       e_5skkQhJaJ
                                       w_qu8qZ1JaL
                                       s_vsqM0eSjV)
                                     '(())))
                             s_vsqM0eSjV)
                       (list 'quote
                             (strip_1ln0rNKSx
                               (source-wrap_LaBpzTrpx
                                 e_5skkQhJaJ
                                 w_qu8qZ1JaL
                                 s_vsqM0eSjV)
                               '(()))))
                     (if (memv type_3LqErY9B8 '(global))
                       (if s_vsqM0eSjV
                         (list 'compile-in-annotation
                               value_112S1dDA1A
                               s_vsqM0eSjV)
                         value_112S1dDA1A)
                       (if (memv type_3LqErY9B8 '(call))
                         (chi-application_wlG3CxBIW
                           (chi_emzRIPszD
                             (car e_5skkQhJaJ)
                             r_PsLEfxJaK
                             w_qu8qZ1JaL)
                           e_5skkQhJaJ
                           r_PsLEfxJaK
                           w_qu8qZ1JaL
                           s_vsqM0eSjV)
                         (if (memv type_3LqErY9B8 '(begin-form))
                           ((lambda (tmp_17e9.coA4Z)
                              (if tmp_17e9.coA4Z
                                (apply (lambda (__Uvmmgs9Ez
                                                e1_s4sAx3rWS
                                                e2_FCbK.uSmj)
                                         (chi-sequence_aZTrdlAyK
                                           (cons e1_s4sAx3rWS e2_FCbK.uSmj)
                                           r_PsLEfxJaK
                                           w_qu8qZ1JaL
                                           s_vsqM0eSjV))
                                       tmp_17e9.coA4Z)
                                (syntax-error e_5skkQhJaJ)))
                            ($syntax-dispatch
                              (compile-in-annotation e_5skkQhJaJ value)
                              '(any any . each-any)))
                           (if (memv type_3LqErY9B8 '(local-syntax-form))
                             (chi-local-syntax_7xtysjjrG
                               value_112S1dDA1A
                               e_5skkQhJaJ
                               r_PsLEfxJaK
                               w_qu8qZ1JaL
                               s_vsqM0eSjV
                               chi-sequence_aZTrdlAyK)
                             (if (memv type_3LqErY9B8 '(eval-when-form))
                               ((lambda (tmp_.HilRGrVr)
                                  (if tmp_.HilRGrVr
                                    (apply (lambda (__14Bkw4OSlU
                                                    x_7KxpOGrVu
                                                    e1_008iIQ9Dc
                                                    e2_9EoK.YJcN)
                                             (if (memq 'eval
                                                       (chi-when-list_UuubX.jlW
                                                         x_7KxpOGrVu
                                                         w_qu8qZ1JaL))
                                               (chi-sequence_aZTrdlAyK
                                                 (cons e1_008iIQ9Dc
                                                       e2_9EoK.YJcN)
                                                 r_PsLEfxJaK
                                                 w_qu8qZ1JaL
                                                 s_vsqM0eSjV)
                                               (chi-void_WCRY8TsAV)))
                                           tmp_.HilRGrVr)
                                    (syntax-error e_5skkQhJaJ)))
                                ($syntax-dispatch
                                  (compile-in-annotation e_5skkQhJaJ value)
                                  '(any each-any any . each-any)))
                               (if (memv type_3LqErY9B8
                                         '(define-form
                                            define-syntax-form
                                            module-form
                                            import-form))
                                 (syntax-error
                                   (source-wrap_LaBpzTrpx
                                     e_5skkQhJaJ
                                     w_qu8qZ1JaL
                                     s_vsqM0eSjV)
                                   '"invalid context for definition")
                                 (if (memv type_3LqErY9B8 '(syntax))
                                   (syntax-error
                                     (source-wrap_LaBpzTrpx
                                       e_5skkQhJaJ
                                       w_qu8qZ1JaL
                                       s_vsqM0eSjV)
                                     '"reference to pattern variable outside syntax form")
                                   (if (memv type_3LqErY9B8
                                             '(displaced-lexical))
                                     (displaced-lexical-error_133PzNLSFq
                                       (source-wrap_LaBpzTrpx
                                         e_5skkQhJaJ
                                         w_qu8qZ1JaL
                                         s_vsqM0eSjV))
                                     (syntax-error
                                       (source-wrap_LaBpzTrpx
                                         e_5skkQhJaJ
                                         w_qu8qZ1JaL
                                         s_vsqM0eSjV))))))))))))))))
         (chi_emzRIPszD
           (lambda (e_ZxikVaiJq r_LxjMRFJ9S w_CMZ8WeiJs)
             (call-with-values
               (lambda ()
                 (syntax-type_Z4HWWyjl.
                   e_ZxikVaiJq
                   r_LxjMRFJ9S
                   w_CMZ8WeiJs
                   '#f
                   '#f))
               (lambda (type_I85wOSjE
                        value_18CaD5sA1n
                        e_61gfErrTe
                        w_o6pOjViK6
                        s_7quaL0A1p)
                 (chi-expr_978lxZKR.
                   type_I85wOSjE
                   value_18CaD5sA1n
                   e_61gfErrTe
                   r_LxjMRFJ9S
                   w_o6pOjViK6
                   s_7quaL0A1p)))))
         (ct-eval/residualize_16qqn0xBHH
           (lambda (ctem_QaBdKySfI thunk_mqQCGw9x0)
             (if (memq 'e ctem_QaBdKySfI)
               (begin
                 (top-level-eval-hook_I.N2BF9Hk (thunk_mqQCGw9x0))
                 (chi-void_WCRY8TsAV))
               ((lambda (thunk_eW.4Yr0oa)
                  (if (memq 'r ctem_QaBdKySfI)
                    (if ((lambda (t_17HppNtJ73)
                           (if t_17HppNtJ73
                             t_17HppNtJ73
                             (memq 'v ctem_QaBdKySfI)))
                         (memq 'l ctem_QaBdKySfI))
                      (thunk_eW.4Yr0oa)
                      (thunk_eW.4Yr0oa))
                    (if ((lambda (t_CK6BKTAZ8)
                           (if t_CK6BKTAZ8
                             t_CK6BKTAZ8
                             (memq 'v ctem_QaBdKySfI)))
                         (memq 'l ctem_QaBdKySfI))
                      (thunk_eW.4Yr0oa)
                      (chi-void_WCRY8TsAV))))
                (if (memq 'c ctem_QaBdKySfI)
                  ((lambda (x_szLtF7rRG)
                     (begin
                       (top-level-eval-hook_I.N2BF9Hk x_szLtF7rRG)
                       (lambda () x_szLtF7rRG)))
                   (thunk_mqQCGw9x0))
                  thunk_mqQCGw9x0)))))
         (rt-eval/residualize_v.oMno17.
           (lambda (rtem_MADNcHAVj thunk_1o2wyM9uU)
             (if (memq 'e rtem_MADNcHAVj)
               (thunk_1o2wyM9uU)
               ((lambda (thunk_WIBa9b0l0)
                  (if (memq 'v rtem_MADNcHAVj)
                    (if ((lambda (t_bu4n9lJ4Z)
                           (if t_bu4n9lJ4Z
                             t_bu4n9lJ4Z
                             (memq 'r rtem_MADNcHAVj)))
                         (memq 'l rtem_MADNcHAVj))
                      (thunk_WIBa9b0l0)
                      (thunk_WIBa9b0l0))
                    (if ((lambda (t_Xchyhn0mu)
                           (if t_Xchyhn0mu
                             t_Xchyhn0mu
                             (memq 'r rtem_MADNcHAVj)))
                         (memq 'l rtem_MADNcHAVj))
                      (thunk_WIBa9b0l0)
                      (chi-void_WCRY8TsAV))))
                (if (memq 'c rtem_MADNcHAVj)
                  ((lambda (x_4d13qz0n9)
                     (begin
                       (top-level-eval-hook_I.N2BF9Hk x_4d13qz0n9)
                       (lambda () x_4d13qz0n9)))
                   (thunk_1o2wyM9uU))
                  thunk_1o2wyM9uU)))))
         (initial-mode-set_17HCcCA17V
           (lambda (when-list_Aihfbr0ju compiling-a-file_12vgwRBiBN)
             (apply append
                    (map (lambda (s_tQihFHATB)
                           (if compiling-a-file_12vgwRBiBN
                             (if (memv s_tQihFHATB '(compile))
                               '(c)
                               (if (memv s_tQihFHATB '(load))
                                 '(l)
                                 (if (memv s_tQihFHATB '(visit))
                                   '(v)
                                   (if (memv s_tQihFHATB '(revisit))
                                     '(r)
                                     '()))))
                             (if (memv s_tQihFHATB '(eval)) '(e) '())))
                         when-list_Aihfbr0ju))))
         (update-mode-set_aCtt1o17P
           (lambda (when-list_EEOJnLAR0 mode-set_GyP8CWrIT)
             (remq '-
                   (apply append
                          (map (lambda (m_QLoOgz0hb)
                                 ((lambda (row_jwZo.LAST)
                                    (map (lambda (s_15udbbr0iC)
                                           (cdr (assq s_15udbbr0iC
                                                      row_jwZo.LAST)))
                                         when-list_EEOJnLAR0))
                                  (cdr (assq m_QLoOgz0hb
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
                               mode-set_GyP8CWrIT)))))
         (do-top-import_HQ32T5BHj
           (lambda (mid_xF4VbRixG token_xWGrYFixH)
             (list '$sc-put-cte
                   (list 'quote mid_xF4VbRixG)
                   (list 'quote
                         (make-binding_CEIm66Jv6
                           'do-import
                           token_xWGrYFixH)))))
         (vfor-each_XnuRqpagO
           (lambda (fn_MsNB2P0d3 v_eWDssNivm)
             ((lambda (len_4Q1ODAANL)
                ((letrec ((doloop_ru4IbOS5g
                            (lambda (i_Z9WA72S5j)
                              (if (not (= i_Z9WA72S5j len_4Q1ODAANL))
                                (begin
                                  (fn_MsNB2P0d3
                                    (vector-ref v_eWDssNivm i_Z9WA72S5j))
                                  (doloop_ru4IbOS5g (+ i_Z9WA72S5j '1)))
                                (void)))))
                   doloop_ru4IbOS5g)
                 '0))
              (vector-length v_eWDssNivm))))
         (vmap_6I5bVdagK
           (lambda (fn_WfWaTT0cm v_ogPwqb0cn)
             ((letrec ((doloop_11srjACrD3
                         (lambda (i_6T4He99lP ls_rWjLV00cH)
                           (if (< i_6T4He99lP '0)
                             ls_rWjLV00cH
                             (doloop_11srjACrD3
                               (- i_6T4He99lP '1)
                               (cons (fn_WfWaTT0cm
                                       (vector-ref v_ogPwqb0cn i_6T4He99lP))
                                     ls_rWjLV00cH))))))
                doloop_11srjACrD3)
              (- (vector-length v_ogPwqb0cn) '1)
              '())))
         (chi-external_.C2GFbTZm
           (lambda (ribcage_.ekXvyREL
                    source-exp_2JKEIozmu
                    body_g3ld2c8W4
                    r_GqZXs2REN
                    exports_sKyy1OREO
                    fexports_1283lvM8W6
                    ctem_iTXU1..NZ
                    k_I2wM6tIvI)
             (letrec ((update-imp-exports_7heoWU8Wp
                        (lambda (bindings_yQAuXbrBI exports_189deJj0ai)
                          ((lambda (exports_CoVGKpJT8)
                             (map (lambda (b_OOFy030aJ)
                                    ((lambda (id_bguZ.9JTD)
                                       (if (not (bound-id-member?_ad1L5Hroo
                                                  id_bguZ.9JTD
                                                  exports_CoVGKpJT8))
                                         b_OOFy030aJ
                                         (make-module-binding_8RsISSjnR
                                           (module-binding-type_947dVmKOw
                                             b_OOFy030aJ)
                                           id_bguZ.9JTD
                                           (module-binding-label_cJTtD7jnl
                                             b_OOFy030aJ)
                                           (append
                                             (get-implicit-exports_18BwfB6h4s
                                               id_bguZ.9JTD)
                                             (module-binding-imps_4I3qWhBGO
                                               b_OOFy030aJ))
                                           (module-binding-val_Sm3sAw16m
                                             b_OOFy030aJ))))
                                     (module-binding-id_0aGkT2KOE
                                       b_OOFy030aJ)))
                                  bindings_yQAuXbrBI))
                           (map (lambda (x_7wOO559k.)
                                  (if (pair? x_7wOO559k.)
                                    (car x_7wOO559k.)
                                    x_7wOO559k.))
                                exports_189deJj0ai))))
                      (get-implicit-exports_18BwfB6h4s
                        (lambda (id_ciAcv59hJ)
                          ((letrec ((f_iWpBjSS.z
                                      (lambda (exports_SXyLvfrzb)
                                        (if (null? exports_SXyLvfrzb)
                                          '()
                                          (if (if (pair? (car exports_SXyLvfrzb))
                                                (bound-id=?_2xo8.WSP3
                                                  id_ciAcv59hJ
                                                  (caar exports_SXyLvfrzb))
                                                '#f)
                                            (flatten-exports_13rskPPTVM
                                              (cdar exports_SXyLvfrzb))
                                            (f_iWpBjSS.z
                                              (cdr exports_SXyLvfrzb)))))))
                             f_iWpBjSS.z)
                           exports_sKyy1OREO)))
                      (return_GKnVxU8We
                        (lambda (bindings_f6zf.tiqE
                                 ids_t.m0osAIX
                                 inits_3eXXwgAIY)
                          (begin
                            (check-defined-ids_YL8SPPsyS
                              source-exp_2JKEIozmu
                              ids_t.m0osAIX)
                            (check-module-exports_1iJTcHsyM
                              source-exp_2JKEIozmu
                              fexports_1283lvM8W6
                              ids_t.m0osAIX)
                            (k_I2wM6tIvI
                              bindings_f6zf.tiqE
                              inits_3eXXwgAIY)))))
               ((letrec ((parse_UJAN27qdU
                           (lambda (body_j6Va4b.Nw
                                    ids_13ojowFIvf
                                    bindings_ndv8dg8WH
                                    inits_iZujcb.Nz)
                             (if (null? body_j6Va4b.Nw)
                               (return_GKnVxU8We
                                 bindings_ndv8dg8WH
                                 ids_13ojowFIvf
                                 inits_iZujcb.Nz)
                               ((lambda (er_8ylCgfqeh e_cEvZL5Iwy)
                                  (call-with-values
                                    (lambda ()
                                      (syntax-type_Z4HWWyjl.
                                        e_cEvZL5Iwy
                                        er_8ylCgfqeh
                                        '(())
                                        '#f
                                        ribcage_.ekXvyREL))
                                    (lambda (type_RMeAj.OD
                                             value_TAwyHM8XN
                                             e_bJFabpIwm
                                             w_TrB0vqqe5
                                             s_tpXiKqqe6)
                                      (if (memv type_RMeAj.OD '(define-form))
                                        (parse-define_bysS1mjrr
                                          e_bJFabpIwm
                                          w_TrB0vqqe5
                                          s_tpXiKqqe6
                                          (lambda (id_fLwE3Wrwp
                                                   rhs_5xd.Efrwq
                                                   w_Lep6eg9e9)
                                            ((lambda (id_eWMF0cAGL)
                                               ((lambda (label_L7eizKSY6)
                                                  ((lambda (imps_XqEaBsAGT)
                                                     (begin
                                                       (extend-ribcage!_220FBaJED
                                                         ribcage_.ekXvyREL
                                                         id_eWMF0cAGL
                                                         label_L7eizKSY6)
                                                       (parse_UJAN27qdU
                                                         (cdr body_j6Va4b.Nw)
                                                         (cons id_eWMF0cAGL
                                                               ids_13ojowFIvf)
                                                         (cons (make-module-binding_8RsISSjnR
                                                                 type_RMeAj.OD
                                                                 id_eWMF0cAGL
                                                                 label_L7eizKSY6
                                                                 imps_XqEaBsAGT
                                                                 (cons er_8ylCgfqeh
                                                                       (wrap_15NDGTTrpt
                                                                         rhs_5xd.Efrwq
                                                                         w_Lep6eg9e9)))
                                                               bindings_ndv8dg8WH)
                                                         inits_iZujcb.Nz)))
                                                   (get-implicit-exports_18BwfB6h4s
                                                     id_eWMF0cAGL)))
                                                (gen-indirect-label_nqmG6Wian)))
                                             (wrap_15NDGTTrpt
                                               id_fLwE3Wrwp
                                               w_Lep6eg9e9))))
                                        (if (memv type_RMeAj.OD
                                                  '(define-syntax-form))
                                          (parse-define-syntax_2UqR2KSX
                                            e_bJFabpIwm
                                            w_TrB0vqqe5
                                            s_tpXiKqqe6
                                            (lambda (id_qzn5aw9cZ
                                                     rhs_2dzIMoADq
                                                     w_tCA2PZil9)
                                              ((lambda (id_G23qsiill)
                                                 ((lambda (label_IF1Igpimp)
                                                    ((lambda (imps_xYy.9004f)
                                                       ((lambda (exp_AleMwmSWa)
                                                          (begin
                                                            (extend-store!_TzWoBfTZ7
                                                              r_GqZXs2REN
                                                              (get-indirect-label_KqbGZl91i
                                                                label_IF1Igpimp)
                                                              (cons 'deferred
                                                                    exp_AleMwmSWa))
                                                            (extend-ribcage!_220FBaJED
                                                              ribcage_.ekXvyREL
                                                              id_G23qsiill
                                                              label_IF1Igpimp)
                                                            (parse_UJAN27qdU
                                                              (cdr body_j6Va4b.Nw)
                                                              (cons id_G23qsiill
                                                                    ids_13ojowFIvf)
                                                              (cons (make-module-binding_8RsISSjnR
                                                                      type_RMeAj.OD
                                                                      id_G23qsiill
                                                                      label_IF1Igpimp
                                                                      imps_xYy.9004f
                                                                      exp_AleMwmSWa)
                                                                    bindings_ndv8dg8WH)
                                                              inits_iZujcb.Nz)))
                                                        (chi_emzRIPszD
                                                          rhs_2dzIMoADq
                                                          (transformer-env_h9Z7ZzreX
                                                            er_8ylCgfqeh)
                                                          w_tCA2PZil9)))
                                                     (get-implicit-exports_18BwfB6h4s
                                                       id_G23qsiill)))
                                                  (gen-indirect-label_nqmG6Wian)))
                                               (wrap_15NDGTTrpt
                                                 id_qzn5aw9cZ
                                                 w_tCA2PZil9))))
                                          (if (memv type_RMeAj.OD
                                                    '(module-form))
                                            ((lambda (*ribcage_e4kQW8zya)
                                               ((lambda (*w_Ul4QHBIHq)
                                                  (parse-module_UVlZVkszm
                                                    e_bJFabpIwm
                                                    w_TrB0vqqe5
                                                    s_tpXiKqqe6
                                                    *w_Ul4QHBIHq
                                                    (lambda (id_9CwbOD.ZV
                                                             *exports_pPKzLSqpm
                                                             forms_Hqzfhhhge)
                                                      (chi-external_.C2GFbTZm
                                                        *ribcage_e4kQW8zya
                                                        (source-wrap_LaBpzTrpx
                                                          e_bJFabpIwm
                                                          w_TrB0vqqe5
                                                          s_tpXiKqqe6)
                                                        (map (lambda (d_Ml6ZjdII1)
                                                               (cons er_8ylCgfqeh
                                                                     d_Ml6ZjdII1))
                                                             forms_Hqzfhhhge)
                                                        r_GqZXs2REN
                                                        *exports_pPKzLSqpm
                                                        (flatten-exports_13rskPPTVM
                                                          *exports_pPKzLSqpm)
                                                        ctem_iTXU1..NZ
                                                        (lambda (*bindings_18.KaHGqqd
                                                                 *inits_5pYdQ7..O)
                                                          ((lambda (iface_mNka9aRRQ)
                                                             ((lambda (bindings_C9pu.2SSU)
                                                                ((lambda (inits_NVxcAQ99f)
                                                                   (if id_9CwbOD.ZV
                                                                     ((lambda (imps_i6CUtU9al
                                                                               label_EzwJgVijt)
                                                                        (begin
                                                                          (extend-store!_TzWoBfTZ7
                                                                            r_GqZXs2REN
                                                                            (get-indirect-label_KqbGZl91i
                                                                              label_EzwJgVijt)
                                                                            (make-binding_CEIm66Jv6
                                                                              'module
                                                                              iface_mNka9aRRQ))
                                                                          (extend-ribcage!_220FBaJED
                                                                            ribcage_.ekXvyREL
                                                                            id_9CwbOD.ZV
                                                                            label_EzwJgVijt)
                                                                          (parse_UJAN27qdU
                                                                            (cdr body_j6Va4b.Nw)
                                                                            (cons id_9CwbOD.ZV
                                                                                  ids_13ojowFIvf)
                                                                            (cons (make-module-binding_8RsISSjnR
                                                                                    type_RMeAj.OD
                                                                                    id_9CwbOD.ZV
                                                                                    label_EzwJgVijt
                                                                                    imps_i6CUtU9al
                                                                                    *exports_pPKzLSqpm)
                                                                                  bindings_C9pu.2SSU)
                                                                            inits_NVxcAQ99f)))
                                                                      (get-implicit-exports_18BwfB6h4s
                                                                        id_9CwbOD.ZV)
                                                                      (gen-indirect-label_nqmG6Wian))
                                                                     (begin
                                                                       (do-import!_ZtgQqFah.
                                                                         iface_mNka9aRRQ
                                                                         ribcage_.ekXvyREL)
                                                                       (parse_UJAN27qdU
                                                                         (cdr body_j6Va4b.Nw)
                                                                         (cons iface_mNka9aRRQ
                                                                               ids_13ojowFIvf)
                                                                         bindings_C9pu.2SSU
                                                                         inits_NVxcAQ99f))))
                                                                 (append
                                                                   inits_iZujcb.Nz
                                                                   *inits_5pYdQ7..O)))
                                                              (append
                                                                (if id_9CwbOD.ZV
                                                                  *bindings_18.KaHGqqd
                                                                  (update-imp-exports_7heoWU8Wp
                                                                    *bindings_18.KaHGqqd
                                                                    *exports_pPKzLSqpm))
                                                                bindings_ndv8dg8WH)))
                                                           (make-trimmed-interface_mqgclLTWQ
                                                             *exports_pPKzLSqpm)))))))
                                                (make-wrap_11O4kRWi7j
                                                  (wrap-marks_KA6c9HSHW
                                                    w_TrB0vqqe5)
                                                  (cons *ribcage_e4kQW8zya
                                                        (wrap-subst_Kj.SjPSHZ
                                                          w_TrB0vqqe5)))))
                                             (make-ribcage_3Q97Hvrjd
                                               '()
                                               '()
                                               '()))
                                            (if (memv type_RMeAj.OD
                                                      '(import-form))
                                              (parse-import_l27SwTT.S
                                                e_bJFabpIwm
                                                w_TrB0vqqe5
                                                s_tpXiKqqe6
                                                (lambda (mid_eMAJJ2hd7)
                                                  ((lambda (mlabel_5YjtXahef)
                                                     ((lambda (binding_vBaRgP.X5)
                                                        ((lambda (t_INR0VPzwY)
                                                           (if (memv t_INR0VPzwY
                                                                     '(module))
                                                             ((lambda (iface_fhQgWKqnj)
                                                                (begin
                                                                  (if value_TAwyHM8XN
                                                                    (extend-ribcage-barrier!_16rJM7l958
                                                                      ribcage_.ekXvyREL
                                                                      value_TAwyHM8XN)
                                                                    (void))
                                                                  (do-import!_ZtgQqFah.
                                                                    iface_fhQgWKqnj
                                                                    ribcage_.ekXvyREL)
                                                                  (parse_UJAN27qdU
                                                                    (cdr body_j6Va4b.Nw)
                                                                    (cons iface_fhQgWKqnj
                                                                          ids_13ojowFIvf)
                                                                    (update-imp-exports_7heoWU8Wp
                                                                      bindings_ndv8dg8WH
                                                                      (vector->list
                                                                        (interface-exports_vfHxavsv.
                                                                          iface_fhQgWKqnj)))
                                                                    inits_iZujcb.Nz)))
                                                              (binding-value_kYJv9nSEm
                                                                binding_vBaRgP.X5))
                                                             (if (memv t_INR0VPzwY
                                                                       '(displaced-lexical))
                                                               (displaced-lexical-error_133PzNLSFq
                                                                 mid_eMAJJ2hd7)
                                                               (syntax-error
                                                                 mid_eMAJJ2hd7
                                                                 '"import from unknown module"))))
                                                         (binding-type_jhChhh9WA
                                                           binding_vBaRgP.X5)))
                                                      (lookup_14YP5xrre9
                                                        mlabel_5YjtXahef
                                                        r_GqZXs2REN)))
                                                   (id-var-name_a6RQVDroq
                                                     mid_eMAJJ2hd7
                                                     '(())))))
                                              (if (memv type_RMeAj.OD
                                                        '(begin-form))
                                                ((lambda (tmp_FYSRVUIDE)
                                                   (if tmp_FYSRVUIDE
                                                     (apply (lambda (__300rt1836
                                                                     e1_Umi0pA836)
                                                              (parse_UJAN27qdU
                                                                ((letrec ((f_YY3E7j.V7
                                                                            (lambda (forms_14ED1OfqlA)
                                                                              (if (null? forms_14ED1OfqlA)
                                                                                (cdr body_j6Va4b.Nw)
                                                                                (cons (cons er_8ylCgfqeh
                                                                                            (wrap_15NDGTTrpt
                                                                                              (car forms_14ED1OfqlA)
                                                                                              w_TrB0vqqe5))
                                                                                      (f_YY3E7j.V7
                                                                                        (cdr forms_14ED1OfqlA)))))))
                                                                   f_YY3E7j.V7)
                                                                 e1_Umi0pA836)
                                                                ids_13ojowFIvf
                                                                bindings_ndv8dg8WH
                                                                inits_iZujcb.Nz))
                                                            tmp_FYSRVUIDE)
                                                     (syntax-error
                                                       e_bJFabpIwm)))
                                                 ($syntax-dispatch
                                                   (compile-in-annotation
                                                     e_bJFabpIwm
                                                     value)
                                                   '(any . each-any)))
                                                (if (memv type_RMeAj.OD
                                                          '(eval-when-form))
                                                  ((lambda (tmp_4qw7yiRJW)
                                                     (if tmp_4qw7yiRJW
                                                       (apply (lambda (__HGsNi2RJX
                                                                       x_NwZaAczrG
                                                                       e1_SRe0EE80g)
                                                                (parse_UJAN27qdU
                                                                  (if (memq 'eval
                                                                            (chi-when-list_UuubX.jlW
                                                                              x_NwZaAczrG
                                                                              w_TrB0vqqe5))
                                                                    ((letrec ((f_BQuWSb.Sy
                                                                                (lambda (forms_LQgMoo80K)
                                                                                  (if (null? forms_LQgMoo80K)
                                                                                    (cdr body_j6Va4b.Nw)
                                                                                    (cons (cons er_8ylCgfqeh
                                                                                                (wrap_15NDGTTrpt
                                                                                                  (car forms_LQgMoo80K)
                                                                                                  w_TrB0vqqe5))
                                                                                          (f_BQuWSb.Sy
                                                                                            (cdr forms_LQgMoo80K)))))))
                                                                       f_BQuWSb.Sy)
                                                                     e1_SRe0EE80g)
                                                                    (cdr body_j6Va4b.Nw))
                                                                  ids_13ojowFIvf
                                                                  bindings_ndv8dg8WH
                                                                  inits_iZujcb.Nz))
                                                              tmp_4qw7yiRJW)
                                                       (syntax-error
                                                         e_bJFabpIwm)))
                                                   ($syntax-dispatch
                                                     (compile-in-annotation
                                                       e_bJFabpIwm
                                                       value)
                                                     '(any each-any
                                                           .
                                                           each-any)))
                                                  (if (memv type_RMeAj.OD
                                                            '(local-syntax-form))
                                                    (chi-local-syntax_7xtysjjrG
                                                      value_TAwyHM8XN
                                                      e_bJFabpIwm
                                                      er_8ylCgfqeh
                                                      w_TrB0vqqe5
                                                      s_tpXiKqqe6
                                                      (lambda (forms_stX1fZRHX
                                                               er_91aHzr.Q6
                                                               w_GBH3G88Zg
                                                               s_J.OW58zpH)
                                                        (parse_UJAN27qdU
                                                          ((letrec ((f_o9Ij2mRH8
                                                                      (lambda (forms_AGD7t58Zt)
                                                                        (if (null? forms_AGD7t58Zt)
                                                                          (cdr body_j6Va4b.Nw)
                                                                          (cons (cons er_91aHzr.Q6
                                                                                      (wrap_15NDGTTrpt
                                                                                        (car forms_AGD7t58Zt)
                                                                                        w_GBH3G88Zg))
                                                                                (f_o9Ij2mRH8
                                                                                  (cdr forms_AGD7t58Zt)))))))
                                                             f_o9Ij2mRH8)
                                                           forms_stX1fZRHX)
                                                          ids_13ojowFIvf
                                                          bindings_ndv8dg8WH
                                                          inits_iZujcb.Nz)))
                                                    (return_GKnVxU8We
                                                      bindings_ndv8dg8WH
                                                      ids_13ojowFIvf
                                                      (append
                                                        inits_iZujcb.Nz
                                                        (cons (cons er_8ylCgfqeh
                                                                    (source-wrap_LaBpzTrpx
                                                                      e_bJFabpIwm
                                                                      w_TrB0vqqe5
                                                                      s_tpXiKqqe6))
                                                              (cdr body_j6Va4b.Nw))))))))))))))
                                (caar body_j6Va4b.Nw)
                                (cdar body_j6Va4b.Nw))))))
                  parse_UJAN27qdU)
                body_g3ld2c8W4
                '()
                '()
                '()))))
         (check-defined-ids_YL8SPPsyS
           (lambda (source-exp_VbYobCRoY ls_t9RkMqqYy)
             (letrec ((id-iface-conflicts_y3jJNUIfb
                        (lambda (id_90BVmORB. iface_k.ngwBh1r cls_RfvM2ZRB1)
                          ((lambda (token_yj7FwY8Tq)
                             (if token_yj7FwY8Tq
                               (if (lookup-import-binding-name_3Z4h.Z95j
                                     ((lambda (e_bkX38Tzk7)
                                        (if (annotation? e_bkX38Tzk7)
                                          (annotation-expression e_bkX38Tzk7)
                                          e_bkX38Tzk7))
                                      (if (syntax-object?_PiqwpY0La
                                            id_90BVmORB.)
                                        (syntax-object-expression_K1xadx9Um
                                          id_90BVmORB.)
                                        id_90BVmORB.))
                                     token_yj7FwY8Tq
                                     (if (symbol? id_90BVmORB.)
                                       (wrap-marks_KA6c9HSHW '((top)))
                                       (wrap-marks_KA6c9HSHW
                                         (syntax-object-wrap_DJHTz7SC8
                                           id_90BVmORB.))))
                                 (cons id_90BVmORB. cls_RfvM2ZRB1)
                                 cls_RfvM2ZRB1)
                               (vfold_ELmwqPz6S
                                 (interface-exports_vfHxavsv. iface_k.ngwBh1r)
                                 (lambda (*id_XR5DhU8TH cls_XKHpF7qa.)
                                   (if (b-i=?_ynqbfpIfW
                                         *id_XR5DhU8TH
                                         id_90BVmORB.)
                                     (cons *id_XR5DhU8TH cls_XKHpF7qa.)
                                     cls_XKHpF7qa.))
                                 cls_RfvM2ZRB1)))
                           (interface-token_18s6UmHsv6 iface_k.ngwBh1r))))
                      (conflicts_ENFFho8Gx
                        (lambda (x_ThxhMGq7O y_JpXDNTzgY cls_HEWRCmRyg)
                          (if (interface?_K5IRgssvT x_ThxhMGq7O)
                            (if (interface?_K5IRgssvT y_JpXDNTzgY)
                              (call-with-values
                                (lambda ()
                                  ((lambda (ye_9g6Avyq8R xe_zzFKMNh.H)
                                     (if (> (vector-length xe_zzFKMNh.H)
                                            (vector-length ye_9g6Avyq8R))
                                       (values x_ThxhMGq7O ye_9g6Avyq8R)
                                       (values y_JpXDNTzgY xe_zzFKMNh.H)))
                                   (interface-exports_vfHxavsv. y_JpXDNTzgY)
                                   (interface-exports_vfHxavsv. x_ThxhMGq7O)))
                                (lambda (iface_enWdYeh0Q exports_184cfRph0V)
                                  (vfold_ELmwqPz6S
                                    exports_184cfRph0V
                                    (lambda (id_nORfAA8T5 cls_5y0AH..KY)
                                      (id-iface-conflicts_y3jJNUIfb
                                        id_nORfAA8T5
                                        iface_enWdYeh0Q
                                        cls_5y0AH..KY))
                                    cls_HEWRCmRyg)))
                              (id-iface-conflicts_y3jJNUIfb
                                y_JpXDNTzgY
                                x_ThxhMGq7O
                                cls_HEWRCmRyg))
                            (if (interface?_K5IRgssvT y_JpXDNTzgY)
                              (id-iface-conflicts_y3jJNUIfb
                                x_ThxhMGq7O
                                y_JpXDNTzgY
                                cls_HEWRCmRyg)
                              (if (b-i=?_ynqbfpIfW x_ThxhMGq7O y_JpXDNTzgY)
                                (cons x_ThxhMGq7O cls_HEWRCmRyg)
                                cls_HEWRCmRyg)))))
                      (vfold_ELmwqPz6S
                        (lambda (v_hUT90zzfw p_Hv1HjU8P6 cls_PUpo8uq6p)
                          ((lambda (len_5xNp.0zfF)
                             ((letrec ((lp_los.3M8Pq
                                         (lambda (i_BOyNo88Pt cls_niLNpLzfV)
                                           (if (= i_BOyNo88Pt len_5xNp.0zfF)
                                             cls_niLNpLzfV
                                             (lp_los.3M8Pq
                                               (+ i_BOyNo88Pt '1)
                                               (p_Hv1HjU8P6
                                                 (vector-ref
                                                   v_hUT90zzfw
                                                   i_BOyNo88Pt)
                                                 cls_niLNpLzfV))))))
                                lp_los.3M8Pq)
                              '0
                              cls_PUpo8uq6p))
                           (vector-length v_hUT90zzfw))))
                      (b-i=?_ynqbfpIfW
                        (lambda (x_lbxdLhIkx y_fyvo.gzbp)
                          (if (symbol? x_lbxdLhIkx)
                            (if (symbol? y_fyvo.gzbp)
                              (eq? x_lbxdLhIkx y_fyvo.gzbp)
                              (if (eq? x_lbxdLhIkx
                                       ((lambda (e_7fzgIORwE)
                                          (if (annotation? e_7fzgIORwE)
                                            (annotation-expression e_7fzgIORwE)
                                            e_7fzgIORwE))
                                        (if (syntax-object?_PiqwpY0La
                                              y_fyvo.gzbp)
                                          (syntax-object-expression_K1xadx9Um
                                            y_fyvo.gzbp)
                                          y_fyvo.gzbp)))
                                (same-marks?_p3bMmE0XK
                                  (wrap-marks_KA6c9HSHW
                                    (syntax-object-wrap_DJHTz7SC8 y_fyvo.gzbp))
                                  (wrap-marks_KA6c9HSHW '((top))))
                                '#f))
                            (if (symbol? y_fyvo.gzbp)
                              (if (eq? y_fyvo.gzbp
                                       ((lambda (e_4kcS56hVh)
                                          (if (annotation? e_4kcS56hVh)
                                            (annotation-expression e_4kcS56hVh)
                                            e_4kcS56hVh))
                                        (if (syntax-object?_PiqwpY0La
                                              x_lbxdLhIkx)
                                          (syntax-object-expression_K1xadx9Um
                                            x_lbxdLhIkx)
                                          x_lbxdLhIkx)))
                                (same-marks?_p3bMmE0XK
                                  (wrap-marks_KA6c9HSHW
                                    (syntax-object-wrap_DJHTz7SC8 x_lbxdLhIkx))
                                  (wrap-marks_KA6c9HSHW '((top))))
                                '#f)
                              (bound-id=?_2xo8.WSP3
                                x_lbxdLhIkx
                                y_fyvo.gzbp))))))
               (if (not (null? ls_t9RkMqqYy))
                 ((letrec ((lp_Yasc5IgO
                             (lambda (x_yeKOM3qZz ls_6pC6X4z7J cls_ABK4NfqZB)
                               (if (null? ls_6pC6X4z7J)
                                 (if (not (null? cls_ABK4NfqZB))
                                   ((lambda (cls_gGI59g8J7)
                                      (syntax-error
                                        source-exp_VbYobCRoY
                                        '"duplicate definition for "
                                        (symbol->string (car cls_gGI59g8J7))
                                        '" in"))
                                    (syntax-object->datum cls_ABK4NfqZB))
                                   (void))
                                 ((letrec ((lp2_wIFWxE8HA
                                             (lambda (ls2_2lLTjORpm
                                                      cls_qFQxb7.yw)
                                               (if (null? ls2_2lLTjORpm)
                                                 (lp_Yasc5IgO
                                                   (car ls_6pC6X4z7J)
                                                   (cdr ls_6pC6X4z7J)
                                                   cls_qFQxb7.yw)
                                                 (lp2_wIFWxE8HA
                                                   (cdr ls2_2lLTjORpm)
                                                   (conflicts_ENFFho8Gx
                                                     x_yeKOM3qZz
                                                     (car ls2_2lLTjORpm)
                                                     cls_qFQxb7.yw))))))
                                    lp2_wIFWxE8HA)
                                  ls_6pC6X4z7J
                                  cls_ABK4NfqZB)))))
                    lp_Yasc5IgO)
                  (car ls_t9RkMqqYy)
                  (cdr ls_t9RkMqqYy)
                  '())
                 (void)))))
         (check-module-exports_1iJTcHsyM
           (lambda (source-exp_hiECYsz0i
                    fexports_HdjVD.rK
                    ids_kvu5yiRiG)
             (letrec ((defined?_QfuTywz0t
                        (lambda (e_V9w3MD.ta ids_416h64z2L)
                          (ormap (lambda (x_eTClQahLL)
                                   (if (interface?_K5IRgssvT x_eTClQahLL)
                                     ((lambda (token_8FOraJhM7)
                                        (if token_8FOraJhM7
                                          (lookup-import-binding-name_3Z4h.Z95j
                                            ((lambda (e_3P9LPDz5J)
                                               (if (annotation? e_3P9LPDz5J)
                                                 (annotation-expression
                                                   e_3P9LPDz5J)
                                                 e_3P9LPDz5J))
                                             (if (syntax-object?_PiqwpY0La
                                                   e_V9w3MD.ta)
                                               (syntax-object-expression_K1xadx9Um
                                                 e_V9w3MD.ta)
                                               e_V9w3MD.ta))
                                            token_8FOraJhM7
                                            (wrap-marks_KA6c9HSHW
                                              (syntax-object-wrap_DJHTz7SC8
                                                e_V9w3MD.ta)))
                                          ((lambda (v_iQJms8z3F)
                                             ((letrec ((lp_12Fx2qtIcW
                                                         (lambda (i_00.t1iRl7)
                                                           (if (>= i_00.t1iRl7
                                                                   '0)
                                                             ((lambda (t_.DUSZFIdi)
                                                                (if t_.DUSZFIdi
                                                                  t_.DUSZFIdi
                                                                  (lp_12Fx2qtIcW
                                                                    (- i_00.t1iRl7
                                                                       '1))))
                                                              (bound-id=?_2xo8.WSP3
                                                                e_V9w3MD.ta
                                                                (vector-ref
                                                                  v_iQJms8z3F
                                                                  i_00.t1iRl7)))
                                                             '#f))))
                                                lp_12Fx2qtIcW)
                                              (- (vector-length v_iQJms8z3F)
                                                 '1)))
                                           (interface-exports_vfHxavsv.
                                             x_eTClQahLL))))
                                      (interface-token_18s6UmHsv6 x_eTClQahLL))
                                     (bound-id=?_2xo8.WSP3
                                       e_V9w3MD.ta
                                       x_eTClQahLL)))
                                 ids_416h64z2L))))
               ((letrec ((loop_xXHPQxhJk
                           (lambda (fexports_WHOeeyqSw missing_.jWB4z.r6)
                             (if (null? fexports_WHOeeyqSw)
                               (if (not (null? missing_.jWB4z.r6))
                                 (syntax-error
                                   missing_.jWB4z.r6
                                   '"missing definition for export(s)")
                                 (void))
                               ((lambda (fexports_ip8HehI95 e_wEufuKRid)
                                  (if (defined?_QfuTywz0t
                                        e_wEufuKRid
                                        ids_kvu5yiRiG)
                                    (loop_xXHPQxhJk
                                      fexports_ip8HehI95
                                      missing_.jWB4z.r6)
                                    (loop_xXHPQxhJk
                                      fexports_ip8HehI95
                                      (cons e_wEufuKRid missing_.jWB4z.r6))))
                                (cdr fexports_WHOeeyqSw)
                                (car fexports_WHOeeyqSw))))))
                  loop_xXHPQxhJk)
                fexports_HdjVD.rK
                '()))))
         (extend-store!_TzWoBfTZ7
           (lambda (r_p2kB2bqRF label_GGNwjehIx binding_13.B9YCRh6)
             (set-cdr!
               r_p2kB2bqRF
               (extend-env_EIDOV00On
                 label_GGNwjehIx
                 binding_13.B9YCRh6
                 (cdr r_p2kB2bqRF)))))
         (id-set-diff_ZucC0Q17b
           (lambda (exports_s8bHVKRgG defs_oeKbpKRgH)
             (if (null? exports_s8bHVKRgG)
               '()
               (if (bound-id-member?_ad1L5Hroo
                     (car exports_s8bHVKRgG)
                     defs_oeKbpKRgH)
                 (id-set-diff_ZucC0Q17b
                   (cdr exports_s8bHVKRgG)
                   defs_oeKbpKRgH)
                 (cons (car exports_s8bHVKRgG)
                       (id-set-diff_ZucC0Q17b
                         (cdr exports_s8bHVKRgG)
                         defs_oeKbpKRgH))))))
         (chi-top-module_TkcNTEBGD
           (lambda (e_AC6r2E73a
                    r_uhuBBGQMU
                    ribcage_kRkUFJgcl
                    w_fug6FE73d
                    s_zvDfhhgcn
                    ctem_yOJWLQHDP
                    rtem_mp21ELyuH
                    id_D1dbX6QMZ
                    exports_6bxTJPyuI
                    forms_16C4gPOQM0)
             ((lambda (fexports_6qH55FHD3)
                (chi-external_.C2GFbTZm
                  ribcage_kRkUFJgcl
                  (source-wrap_LaBpzTrpx
                    e_AC6r2E73a
                    w_fug6FE73d
                    s_zvDfhhgcn)
                  (map (lambda (d_dCRK0tHDm)
                         (cons r_uhuBBGQMU d_dCRK0tHDm))
                       forms_16C4gPOQM0)
                  r_uhuBBGQMU
                  exports_6bxTJPyuI
                  fexports_6qH55FHD3
                  ctem_yOJWLQHDP
                  (lambda (bindings_AXO3BFgdf inits_SXULTM747)
                    ((letrec ((partition_wwi3XkyvM
                                (lambda (fexports_xEik85HEZ
                                         bs_12p9GlE74q
                                         svs_AJN3MfpmJ
                                         ses_watLtupmK
                                         ctdefs_hxFCNSpmK)
                                  (if (null? fexports_xEik85HEZ)
                                    ((letrec ((partition_HoD5Pfquw
                                                (lambda (bs_EaNCeo8ch
                                                         dvs_SRXCyPzDJ
                                                         des_pRU8a9IMT)
                                                  (if (null? bs_EaNCeo8ch)
                                                    ((lambda (inits_traQjiRXD
                                                              des_a3HwKBhn2
                                                              ses_VthUJthn1)
                                                       (begin
                                                         (for-each
                                                           (lambda (x_JoeE0Q8fi)
                                                             (apply (lambda (t_Mz2..3qxU
                                                                             label_fBsVkbqxV
                                                                             sym_b6JwRHzG4
                                                                             val_TYRpZphoO)
                                                                      (if label_fBsVkbqxV
                                                                        (set-indirect-label!_rJFudRJBV
                                                                          label_fBsVkbqxV
                                                                          sym_b6JwRHzG4)
                                                                        (void)))
                                                                    x_JoeE0Q8fi))
                                                           ctdefs_hxFCNSpmK)
                                                         (build-sequence_11xUoJl9Sx
                                                           '#f
                                                           (list (ct-eval/residualize_16qqn0xBHH
                                                                   ctem_yOJWLQHDP
                                                                   (lambda ()
                                                                     (if (null? ctdefs_hxFCNSpmK)
                                                                       (chi-void_WCRY8TsAV)
                                                                       (build-sequence_11xUoJl9Sx
                                                                         '#f
                                                                         (map (lambda (x_nrE4dL.7T)
                                                                                (apply (lambda (t_17.SuLCqzE
                                                                                                label_17nouf.8e
                                                                                                sym_G0UR1..8f
                                                                                                val_hP.7kKR.7)
                                                                                         (list '$sc-put-cte
                                                                                               (list 'quote
                                                                                                     sym_G0UR1..8f)
                                                                                               (if (eq? t_17.SuLCqzE
                                                                                                        'define-syntax-form)
                                                                                                 val_hP.7kKR.7
                                                                                                 (list 'quote
                                                                                                       (make-binding_CEIm66Jv6
                                                                                                         'module
                                                                                                         (make-resolved-interface_H6FAFUBED
                                                                                                           val_hP.7kKR.7
                                                                                                           sym_G0UR1..8f))))))
                                                                                       x_nrE4dL.7T))
                                                                              ctdefs_hxFCNSpmK)))))
                                                                 (ct-eval/residualize_16qqn0xBHH
                                                                   ctem_yOJWLQHDP
                                                                   (lambda ()
                                                                     ((lambda (n_czpw60zKE)
                                                                        ((lambda (token_2Zu.aKR25)
                                                                           ((lambda (b_ZdjH8czLS)
                                                                              (if n_czpw60zKE
                                                                                (list '$sc-put-cte
                                                                                      (list 'quote
                                                                                            (if (same-marks?_p3bMmE0XK
                                                                                                  (wrap-marks_KA6c9HSHW
                                                                                                    (syntax-object-wrap_DJHTz7SC8
                                                                                                      id_D1dbX6QMZ))
                                                                                                  (wrap-marks_KA6c9HSHW
                                                                                                    '((top))))
                                                                                              n_czpw60zKE
                                                                                              ((lambda (marks_mJucJhvQ)
                                                                                                 (make-syntax-object_ZCTCCii2o
                                                                                                   n_czpw60zKE
                                                                                                   (make-wrap_11O4kRWi7j
                                                                                                     marks_mJucJhvQ
                                                                                                     (list (make-ribcage_3Q97Hvrjd
                                                                                                             (vector
                                                                                                               n_czpw60zKE)
                                                                                                             (vector
                                                                                                               marks_mJucJhvQ)
                                                                                                             (vector
                                                                                                               (generate-id_j8I7ZPr.7
                                                                                                                 n_czpw60zKE)))))))
                                                                                               (wrap-marks_KA6c9HSHW
                                                                                                 (syntax-object-wrap_DJHTz7SC8
                                                                                                   id_D1dbX6QMZ)))))
                                                                                      b_ZdjH8czLS)
                                                                                ((lambda (n_18YO1eDzLc)
                                                                                   (build-sequence_11xUoJl9Sx
                                                                                     '#f
                                                                                     (list (list '$sc-put-cte
                                                                                                 (list 'quote
                                                                                                       n_18YO1eDzLc)
                                                                                                 b_ZdjH8czLS)
                                                                                           (do-top-import_HQ32T5BHj
                                                                                             n_18YO1eDzLc
                                                                                             token_2Zu.aKR25))))
                                                                                 (generate-id_j8I7ZPr.7
                                                                                   'tmp))))
                                                                            (list 'quote
                                                                                  (make-binding_CEIm66Jv6
                                                                                    'module
                                                                                    (make-resolved-interface_H6FAFUBED
                                                                                      exports_6bxTJPyuI
                                                                                      token_2Zu.aKR25)))))
                                                                         (generate-id_j8I7ZPr.7
                                                                           n_czpw60zKE)))
                                                                      (if id_D1dbX6QMZ
                                                                        ((lambda (e_ylMqTbqHs)
                                                                           (if (annotation?
                                                                                 e_ylMqTbqHs)
                                                                             (annotation-expression
                                                                               e_ylMqTbqHs)
                                                                             e_ylMqTbqHs))
                                                                         (if (syntax-object?_PiqwpY0La
                                                                               id_D1dbX6QMZ)
                                                                           (syntax-object-expression_K1xadx9Um
                                                                             id_D1dbX6QMZ)
                                                                           id_D1dbX6QMZ))
                                                                        '#f))))
                                                                 (if (null? svs_AJN3MfpmJ)
                                                                   (chi-void_WCRY8TsAV)
                                                                   (build-sequence_11xUoJl9Sx
                                                                     '#f
                                                                     (map (lambda (v_lNYigaR8.)
                                                                            (list 'define
                                                                                  v_lNYigaR8.
                                                                                  (chi-void_WCRY8TsAV)))
                                                                          svs_AJN3MfpmJ)))
                                                                 (rt-eval/residualize_v.oMno17.
                                                                   rtem_mp21ELyuH
                                                                   (lambda ()
                                                                     (build-body_rzGZUWSAk
                                                                       '#f
                                                                       dvs_SRXCyPzDJ
                                                                       des_a3HwKBhn2
                                                                       (build-sequence_11xUoJl9Sx
                                                                         '#f
                                                                         (list (if (null? svs_AJN3MfpmJ)
                                                                                 (chi-void_WCRY8TsAV)
                                                                                 (build-sequence_11xUoJl9Sx
                                                                                   '#f
                                                                                   (map (lambda (v_.AGXxVhC0
                                                                                                 e_LQQbKahC1)
                                                                                          (list 'set!
                                                                                                v_.AGXxVhC0
                                                                                                e_LQQbKahC1))
                                                                                        svs_AJN3MfpmJ
                                                                                        ses_VthUJthn1)))
                                                                               (if (null? inits_traQjiRXD)
                                                                                 (chi-void_WCRY8TsAV)
                                                                                 (build-sequence_11xUoJl9Sx
                                                                                   '#f
                                                                                   inits_traQjiRXD)))))))
                                                                 (chi-void_WCRY8TsAV)))))
                                                     (map (lambda (x_7uO3lk8xF)
                                                            (chi_emzRIPszD
                                                              (cdr x_7uO3lk8xF)
                                                              (car x_7uO3lk8xF)
                                                              '(())))
                                                          inits_SXULTM747)
                                                     (map (lambda (x_BXjL9czXl)
                                                            (chi_emzRIPszD
                                                              (cdr x_BXjL9czXl)
                                                              (car x_BXjL9czXl)
                                                              '(())))
                                                          des_pRU8a9IMT)
                                                     (map (lambda (x_.nY5z3.m1)
                                                            (chi_emzRIPszD
                                                              (cdr x_.nY5z3.m1)
                                                              (car x_.nY5z3.m1)
                                                              '(())))
                                                          ses_watLtupmK))
                                                    ((lambda (b_gfl6e..3r)
                                                       ((lambda (t_vyAXryRVB)
                                                          (if (memv t_vyAXryRVB
                                                                    '(define-form))
                                                            ((lambda (var_11ph.pA8dB)
                                                               (begin
                                                                 (extend-store!_TzWoBfTZ7
                                                                   r_uhuBBGQMU
                                                                   (get-indirect-label_KqbGZl91i
                                                                     (module-binding-label_cJTtD7jnl
                                                                       b_gfl6e..3r))
                                                                   (make-binding_CEIm66Jv6
                                                                     'lexical
                                                                     var_11ph.pA8dB))
                                                                 (partition_HoD5Pfquw
                                                                   (cdr bs_EaNCeo8ch)
                                                                   (cons var_11ph.pA8dB
                                                                         dvs_SRXCyPzDJ)
                                                                   (cons (module-binding-val_Sm3sAw16m
                                                                           b_gfl6e..3r)
                                                                         des_pRU8a9IMT))))
                                                             (gen-var_hMLALSjrb
                                                               (module-binding-id_0aGkT2KOE
                                                                 b_gfl6e..3r)))
                                                            (if (memv t_vyAXryRVB
                                                                      '(define-syntax-form
                                                                         module-form))
                                                              (partition_HoD5Pfquw
                                                                (cdr bs_EaNCeo8ch)
                                                                dvs_SRXCyPzDJ
                                                                des_pRU8a9IMT)
                                                              (error 'sc-expand-internal
                                                                     '"unexpected module binding type"))))
                                                        (module-binding-type_947dVmKOw
                                                          b_gfl6e..3r)))
                                                     (car bs_EaNCeo8ch))))))
                                       partition_HoD5Pfquw)
                                     bs_12p9GlE74q
                                     '()
                                     '())
                                    ((lambda (fexports_sN74.bZWC id_MzgOPaQNs)
                                       (letrec ((pluck-binding_GwanfI740
                                                  (lambda (id_VUWNmahiT
                                                           bs_133gF4A89L
                                                           succ_12JD8bGRSu
                                                           fail_15zYFr.qr4)
                                                    ((letrec ((loop_181kkNczAm
                                                                (lambda (bs_FcYr11IJy
                                                                         new-bs_14os5GFhi8)
                                                                  (if (null? bs_FcYr11IJy)
                                                                    (fail_15zYFr.qr4)
                                                                    (if (free-id=?_de9nIHrou
                                                                          (module-binding-id_0aGkT2KOE
                                                                            (car bs_FcYr11IJy))
                                                                          id_VUWNmahiT)
                                                                      (succ_12JD8bGRSu
                                                                        (car bs_FcYr11IJy)
                                                                        (smart-append_vU8Ki1Aw6
                                                                          (reverse
                                                                            new-bs_14os5GFhi8)
                                                                          (cdr bs_FcYr11IJy)))
                                                                      (loop_181kkNczAm
                                                                        (cdr bs_FcYr11IJy)
                                                                        (cons (car bs_FcYr11IJy)
                                                                              new-bs_14os5GFhi8)))))))
                                                       loop_181kkNczAm)
                                                     bs_133gF4A89L
                                                     '()))))
                                         (pluck-binding_GwanfI740
                                           id_MzgOPaQNs
                                           bs_12p9GlE74q
                                           (lambda (b_iX7A4Vgeh bs_6Zf71Opnr)
                                             ((lambda (imps_PhZWKJgex
                                                       label_19qCRauQO5
                                                       t_Qkr9EbpnE)
                                                ((lambda (sym_r7wqWVgeG
                                                          fexports_CDhMsTZXn)
                                                   (if (memv t_Qkr9EbpnE
                                                             '(define-form))
                                                     (begin
                                                       (set-indirect-label!_rJFudRJBV
                                                         label_19qCRauQO5
                                                         sym_r7wqWVgeG)
                                                       (partition_wwi3XkyvM
                                                         fexports_CDhMsTZXn
                                                         bs_6Zf71Opnr
                                                         (cons sym_r7wqWVgeG
                                                               svs_AJN3MfpmJ)
                                                         (cons (module-binding-val_Sm3sAw16m
                                                                 b_iX7A4Vgeh)
                                                               ses_watLtupmK)
                                                         ctdefs_hxFCNSpmK))
                                                     (if (memv t_Qkr9EbpnE
                                                               '(define-syntax-form))
                                                       (partition_wwi3XkyvM
                                                         fexports_CDhMsTZXn
                                                         bs_6Zf71Opnr
                                                         svs_AJN3MfpmJ
                                                         ses_watLtupmK
                                                         (cons (list t_Qkr9EbpnE
                                                                     label_19qCRauQO5
                                                                     sym_r7wqWVgeG
                                                                     (module-binding-val_Sm3sAw16m
                                                                       b_iX7A4Vgeh))
                                                               ctdefs_hxFCNSpmK))
                                                       (if (memv t_Qkr9EbpnE
                                                                 '(module-form))
                                                         ((lambda (exports_Jdw9VRQP2)
                                                            (partition_wwi3XkyvM
                                                              (append
                                                                (flatten-exports_13rskPPTVM
                                                                  exports_Jdw9VRQP2)
                                                                fexports_CDhMsTZXn)
                                                              bs_6Zf71Opnr
                                                              svs_AJN3MfpmJ
                                                              ses_watLtupmK
                                                              (cons (list t_Qkr9EbpnE
                                                                          label_19qCRauQO5
                                                                          sym_r7wqWVgeG
                                                                          exports_Jdw9VRQP2)
                                                                    ctdefs_hxFCNSpmK)))
                                                          (module-binding-val_Sm3sAw16m
                                                            b_iX7A4Vgeh))
                                                         (error 'sc-expand-internal
                                                                '"unexpected module binding type")))))
                                                 (generate-id_j8I7ZPr.7
                                                   ((lambda (e_CwtQFlIIl)
                                                      (if (annotation?
                                                            e_CwtQFlIIl)
                                                        (annotation-expression
                                                          e_CwtQFlIIl)
                                                        e_CwtQFlIIl))
                                                    (if (syntax-object?_PiqwpY0La
                                                          id_MzgOPaQNs)
                                                      (syntax-object-expression_K1xadx9Um
                                                        id_MzgOPaQNs)
                                                      id_MzgOPaQNs)))
                                                 (append
                                                   imps_PhZWKJgex
                                                   fexports_sN74.bZWC)))
                                              (module-binding-imps_4I3qWhBGO
                                                b_iX7A4Vgeh)
                                              (module-binding-label_cJTtD7jnl
                                                b_iX7A4Vgeh)
                                              (module-binding-type_947dVmKOw
                                                b_iX7A4Vgeh)))
                                           (lambda ()
                                             (partition_wwi3XkyvM
                                               fexports_sN74.bZWC
                                               bs_12p9GlE74q
                                               svs_AJN3MfpmJ
                                               ses_watLtupmK
                                               ctdefs_hxFCNSpmK)))))
                                     (cdr fexports_xEik85HEZ)
                                     (car fexports_xEik85HEZ))))))
                       partition_wwi3XkyvM)
                     fexports_6qH55FHD3
                     bindings_AXO3BFgdf
                     '()
                     '()
                     '()))))
              (flatten-exports_13rskPPTVM exports_6bxTJPyuI))))
         (set-module-binding-val!_28G1YqKPH
           (lambda (x_16TjOd572F update_9odaLgyt6)
             (vector-set! x_16TjOd572F '5 update_9odaLgyt6)))
         (set-module-binding-imps!_rJwiFssxh
           (lambda (x_NUTP5uQLL update_12hxV8.ZUV)
             (vector-set! x_NUTP5uQLL '4 update_12hxV8.ZUV)))
         (set-module-binding-label!_188zReYBGi
           (lambda (x_WBcAExgaz update_e6ZYaeQK9)
             (vector-set! x_WBcAExgaz '3 update_e6ZYaeQK9)))
         (set-module-binding-id!_14uukVVafK
           (lambda (x_.OkYYOpi9 update_Wf4nrhg91)
             (vector-set! x_.OkYYOpi9 '2 update_Wf4nrhg91)))
         (set-module-binding-type!_NiYyEEBG3
           (lambda (x_0bC6tdHAP update_DBiNH4yrI)
             (vector-set! x_0bC6tdHAP '1 update_DBiNH4yrI)))
         (module-binding-val_Sm3sAw16m
           (lambda (x_j0i9CiQIn)
             (vector-ref x_j0i9CiQIn '5)))
         (module-binding-imps_4I3qWhBGO
           (lambda (x_U.T2dDyqy)
             (vector-ref x_U.T2dDyqy '4)))
         (module-binding-label_cJTtD7jnl
           (lambda (x_NzDiPiQHd)
             (vector-ref x_NzDiPiQHd '3)))
         (module-binding-id_0aGkT2KOE
           (lambda (x_YfTlB7pfc)
             (vector-ref x_YfTlB7pfc '2)))
         (module-binding-type_947dVmKOw
           (lambda (x_7C8rr9HxX)
             (vector-ref x_7C8rr9HxX '1)))
         (module-binding?_1eVbxjTXy
           (lambda (x_141ZMAmQEd)
             (if (vector? x_141ZMAmQEd)
               (if (= (vector-length x_141ZMAmQEd) '6)
                 (eq? (vector-ref x_141ZMAmQEd '0)
                      'module-binding)
                 '#f)
               '#f)))
         (make-module-binding_8RsISSjnR
           (lambda (type_MVakIQ7VH
                    id_O5ooQPZMz
                    label_xssx.bpc0
                    imps_6fVnBRg3S
                    val_naR.ZaQDs)
             (vector
               'module-binding
               type_MVakIQ7VH
               id_O5ooQPZMz
               label_xssx.bpc0
               imps_6fVnBRg3S
               val_naR.ZaQDs)))
         (make-resolved-interface_H6FAFUBED
           (lambda (exports_sC3ZozZLu import-token_18J.rns7UE)
             (make-interface_BbZ8sYBEQ
               (list->vector
                 (map (lambda (x_8LDgsKQDL)
                        (make-trimmed-syntax-object_mwXrct95C
                          (if (pair? x_8LDgsKQDL)
                            (car x_8LDgsKQDL)
                            x_8LDgsKQDL)))
                      exports_sC3ZozZLu))
               import-token_18J.rns7UE)))
         (make-trimmed-interface_mqgclLTWQ
           (lambda (exports_YFtDY6g1P)
             (make-interface_BbZ8sYBEQ
               (list->vector
                 (map (lambda (x_t9DxXjZLW)
                        (if (pair? x_t9DxXjZLW)
                          (car x_t9DxXjZLW)
                          x_t9DxXjZLW))
                      exports_YFtDY6g1P))
               '#f)))
         (set-interface-token!_ErPmNzTWM
           (lambda (x_HVVOOpaq update_o7ZYpqpar)
             (vector-set! x_HVVOOpaq '2 update_o7ZYpqpar)))
         (set-interface-exports!_5JdSR2adW
           (lambda (x_M.loCCp9S update_tD5eLVg0K)
             (vector-set! x_M.loCCp9S '1 update_tD5eLVg0K)))
         (interface-token_18s6UmHsv6
           (lambda (x_139h0PmQAH)
             (vector-ref x_139h0PmQAH '2)))
         (interface-exports_vfHxavsv.
           (lambda (x_v1t7oRg.w)
             (vector-ref x_v1t7oRg.w '1)))
         (interface?_K5IRgssvT
           (lambda (x_LJnfk9Ho5)
             (if (vector? x_LJnfk9Ho5)
               (if (= (vector-length x_LJnfk9Ho5) '3)
                 (eq? (vector-ref x_LJnfk9Ho5 '0) 'interface)
                 '#f)
               '#f)))
         (make-interface_BbZ8sYBEQ
           (lambda (exports_zFbhsvZGH token_1161IgyQxz)
             (vector
               'interface
               exports_zFbhsvZGH
               token_1161IgyQxz)))
         (flatten-exports_13rskPPTVM
           (lambda (exports_qaaGGxgWi)
             ((letrec ((loop_vTMLVvZE8
                         (lambda (exports_6nP91rZEb ls_16vsfnUHmV)
                           (if (null? exports_6nP91rZEb)
                             ls_16vsfnUHmV
                             (loop_vTMLVvZE8
                               (cdr exports_6nP91rZEb)
                               (if (pair? (car exports_6nP91rZEb))
                                 (loop_vTMLVvZE8
                                   (car exports_6nP91rZEb)
                                   ls_16vsfnUHmV)
                                 (cons (car exports_6nP91rZEb)
                                       ls_16vsfnUHmV)))))))
                loop_vTMLVvZE8)
              exports_qaaGGxgWi
              '())))
         (chi-top_gUdU1LTVI
           (lambda (e_jy.8KwyRH
                    r_ZGZHowyRI
                    w_ZKiAZQ7qi
                    ctem_47uDfnZha
                    rtem_gi8VpVgzs
                    top-ribcage_13.eaA57qk)
             (call-with-values
               (lambda ()
                 (syntax-type_Z4HWWyjl.
                   e_jy.8KwyRH
                   r_ZGZHowyRI
                   w_ZKiAZQ7qi
                   '#f
                   top-ribcage_13.eaA57qk))
               (lambda (type_dLZH82Q9G
                        value_2309ZzySp
                        e_NTB36NgA8
                        w_jKqBBxgA8
                        s_cLHNqDZiS)
                 (if (memv type_dLZH82Q9G '(begin-form))
                   ((lambda (tmp_eUpVTVQu5)
                      (if tmp_eUpVTVQu5
                        (apply (lambda (__2C8Cgup4h) (chi-void_WCRY8TsAV))
                               tmp_eUpVTVQu5)
                        ((lambda (tmp_14thx5OQug)
                           (if tmp_14thx5OQug
                             (apply (lambda (__XILTjcyc0
                                             e1_0fDBYIHla
                                             e2_Up1KVoyc1)
                                      (chi-top-sequence_dqztIRacJ
                                        (cons e1_0fDBYIHla e2_Up1KVoyc1)
                                        r_ZGZHowyRI
                                        w_jKqBBxgA8
                                        s_cLHNqDZiS
                                        ctem_47uDfnZha
                                        rtem_gi8VpVgzs
                                        top-ribcage_13.eaA57qk))
                                    tmp_14thx5OQug)
                             (syntax-error e_NTB36NgA8)))
                         ($syntax-dispatch
                           (compile-in-annotation e_NTB36NgA8 value)
                           '(any any . each-any)))))
                    ($syntax-dispatch
                      (compile-in-annotation e_NTB36NgA8 value)
                      '(any)))
                   (if (memv type_dLZH82Q9G '(local-syntax-form))
                     (chi-local-syntax_7xtysjjrG
                       value_2309ZzySp
                       e_NTB36NgA8
                       r_ZGZHowyRI
                       w_jKqBBxgA8
                       s_cLHNqDZiS
                       (lambda (body_m40G4zZDR
                                r_.iN1EhHlA
                                w_TY3QWFHlB
                                s_fZK3QBHlC)
                         (chi-top-sequence_dqztIRacJ
                           body_m40G4zZDR
                           r_.iN1EhHlA
                           w_TY3QWFHlB
                           s_fZK3QBHlC
                           ctem_47uDfnZha
                           rtem_gi8VpVgzs
                           top-ribcage_13.eaA57qk)))
                     (if (memv type_dLZH82Q9G '(eval-when-form))
                       ((lambda (tmp_TDs31HZBZ)
                          (if tmp_TDs31HZBZ
                            (apply (lambda (__GaUZu2QsS
                                            x_q1LHj0yaB
                                            e1_u4yXNI7Ka
                                            e2_17UbS117Kc)
                                     ((lambda (body_.ooGeiQs3
                                               when-list_2CI1BgyaL)
                                        ((lambda (rtem_yeapqhgTH
                                                  ctem_15pQlrxgTC)
                                           (if (if (null? ctem_15pQlrxgTC)
                                                 (null? rtem_yeapqhgTH)
                                                 '#f)
                                             (chi-void_WCRY8TsAV)
                                             (chi-top-sequence_dqztIRacJ
                                               body_.ooGeiQs3
                                               r_ZGZHowyRI
                                               w_jKqBBxgA8
                                               s_cLHNqDZiS
                                               ctem_15pQlrxgTC
                                               rtem_yeapqhgTH
                                               top-ribcage_13.eaA57qk)))
                                         (update-mode-set_aCtt1o17P
                                           when-list_2CI1BgyaL
                                           rtem_gi8VpVgzs)
                                         (update-mode-set_aCtt1o17P
                                           when-list_2CI1BgyaL
                                           ctem_47uDfnZha)))
                                      (cons e1_u4yXNI7Ka e2_17UbS117Kc)
                                      (chi-when-list_UuubX.jlW
                                        x_q1LHj0yaB
                                        w_jKqBBxgA8)))
                                   tmp_TDs31HZBZ)
                            (syntax-error e_NTB36NgA8)))
                        ($syntax-dispatch
                          (compile-in-annotation e_NTB36NgA8 value)
                          '(any each-any any . each-any)))
                       (if (memv type_dLZH82Q9G '(define-syntax-form))
                         (parse-define-syntax_2UqR2KSX
                           e_NTB36NgA8
                           w_jKqBBxgA8
                           s_cLHNqDZiS
                           (lambda (id_4skrlOpX8 rhs_t4a4VI7FS w_17iCHtfpX9)
                             ((lambda (id_16DNfBRgO8)
                                (begin
                                  ((lambda (n_qU4kQFgOg)
                                     ((lambda (b_kn9IttgOo)
                                        ((lambda (t_YZvCEqQna)
                                           (if (memv t_YZvCEqQna
                                                     '(displaced-lexical))
                                             (displaced-lexical-error_133PzNLSFq
                                               id_16DNfBRgO8)
                                             (void)))
                                         (binding-type_jhChhh9WA b_kn9IttgOo)))
                                      (lookup_14YP5xrre9
                                        n_qU4kQFgOg
                                        r_ZGZHowyRI)))
                                   (id-var-name_a6RQVDroq id_16DNfBRgO8 '(())))
                                  (ct-eval/residualize_16qqn0xBHH
                                    ctem_47uDfnZha
                                    (lambda ()
                                      (list '$sc-put-cte
                                            (list 'quote
                                                  ((lambda (sym_ZjDktg7HJ)
                                                     (if (same-marks?_p3bMmE0XK
                                                           (wrap-marks_KA6c9HSHW
                                                             (syntax-object-wrap_DJHTz7SC8
                                                               id_16DNfBRgO8))
                                                           (wrap-marks_KA6c9HSHW
                                                             '((top))))
                                                       sym_ZjDktg7HJ
                                                       ((lambda (marks_UdfhGQ7H.)
                                                          (make-syntax-object_ZCTCCii2o
                                                            sym_ZjDktg7HJ
                                                            (make-wrap_11O4kRWi7j
                                                              marks_UdfhGQ7H.
                                                              (list (make-ribcage_3Q97Hvrjd
                                                                      (vector
                                                                        sym_ZjDktg7HJ)
                                                                      (vector
                                                                        marks_UdfhGQ7H.)
                                                                      (vector
                                                                        (generate-id_j8I7ZPr.7
                                                                          sym_ZjDktg7HJ)))))))
                                                        (wrap-marks_KA6c9HSHW
                                                          (syntax-object-wrap_DJHTz7SC8
                                                            id_16DNfBRgO8)))))
                                                   ((lambda (e_NGGVWqQrB)
                                                      (if (annotation?
                                                            e_NGGVWqQrB)
                                                        (annotation-expression
                                                          e_NGGVWqQrB)
                                                        e_NGGVWqQrB))
                                                    (if (syntax-object?_PiqwpY0La
                                                          id_16DNfBRgO8)
                                                      (syntax-object-expression_K1xadx9Um
                                                        id_16DNfBRgO8)
                                                      id_16DNfBRgO8))))
                                            (chi_emzRIPszD
                                              rhs_t4a4VI7FS
                                              (transformer-env_h9Z7ZzreX
                                                r_ZGZHowyRI)
                                              w_17iCHtfpX9))))))
                              (wrap_15NDGTTrpt id_4skrlOpX8 w_17iCHtfpX9))))
                         (if (memv type_dLZH82Q9G '(define-form))
                           (parse-define_bysS1mjrr
                             e_NTB36NgA8
                             w_jKqBBxgA8
                             s_cLHNqDZiS
                             (lambda (id_18YO1eDyY. rhs_wAbmTpgGJ w_pjIkZTZos)
                               ((lambda (id_q1gvn4yY9)
                                  (begin
                                    ((lambda (n_bu4n9lH6p)
                                       ((lambda (b_sNDgW7ZoS)
                                          ((lambda (t_GqVlblH6K)
                                             (if (memv t_GqVlblH6K
                                                       '(displaced-lexical))
                                               (displaced-lexical-error_133PzNLSFq
                                                 id_q1gvn4yY9)
                                               (void)))
                                           (binding-type_jhChhh9WA
                                             b_sNDgW7ZoS)))
                                        (lookup_14YP5xrre9
                                          n_bu4n9lH6p
                                          r_ZGZHowyRI)))
                                     (id-var-name_a6RQVDroq
                                       id_q1gvn4yY9
                                       '(())))
                                    ((lambda (sym_8UkDW57yI)
                                       ((lambda (valsym_YNJpMdH7s)
                                          (build-sequence_11xUoJl9Sx
                                            '#f
                                            (list (ct-eval/residualize_16qqn0xBHH
                                                    ctem_47uDfnZha
                                                    (lambda ()
                                                      (list '$sc-put-cte
                                                            (list 'quote
                                                                  (if (eq? sym_8UkDW57yI
                                                                           valsym_YNJpMdH7s)
                                                                    sym_8UkDW57yI
                                                                    ((lambda (marks_E3YOXoy.y)
                                                                       (make-syntax-object_ZCTCCii2o
                                                                         sym_8UkDW57yI
                                                                         (make-wrap_11O4kRWi7j
                                                                           marks_E3YOXoy.y
                                                                           (list (make-ribcage_3Q97Hvrjd
                                                                                   (vector
                                                                                     sym_8UkDW57yI)
                                                                                   (vector
                                                                                     marks_E3YOXoy.y)
                                                                                   (vector
                                                                                     valsym_YNJpMdH7s))))))
                                                                     (wrap-marks_KA6c9HSHW
                                                                       (syntax-object-wrap_DJHTz7SC8
                                                                         id_q1gvn4yY9)))))
                                                            (list 'quote
                                                                  (make-binding_CEIm66Jv6
                                                                    'global
                                                                    valsym_YNJpMdH7s)))))
                                                  (rt-eval/residualize_v.oMno17.
                                                    rtem_gi8VpVgzs
                                                    (lambda ()
                                                      (if s_cLHNqDZiS
                                                        (list 'compile-in-annotation
                                                              (list 'define
                                                                    valsym_YNJpMdH7s
                                                                    (chi_emzRIPszD
                                                                      rhs_wAbmTpgGJ
                                                                      r_ZGZHowyRI
                                                                      w_pjIkZTZos))
                                                              s_cLHNqDZiS)
                                                        (list 'define
                                                              valsym_YNJpMdH7s
                                                              (chi_emzRIPszD
                                                                rhs_wAbmTpgGJ
                                                                r_ZGZHowyRI
                                                                w_pjIkZTZos))))))))
                                        (if (same-marks?_p3bMmE0XK
                                              (wrap-marks_KA6c9HSHW
                                                (syntax-object-wrap_DJHTz7SC8
                                                  id_q1gvn4yY9))
                                              (wrap-marks_KA6c9HSHW '((top))))
                                          sym_8UkDW57yI
                                          (generate-id_j8I7ZPr.7
                                            sym_8UkDW57yI))))
                                     ((lambda (e_wjnVMY7EY)
                                        (if (annotation? e_wjnVMY7EY)
                                          (annotation-expression e_wjnVMY7EY)
                                          e_wjnVMY7EY))
                                      (if (syntax-object?_PiqwpY0La
                                            id_q1gvn4yY9)
                                        (syntax-object-expression_K1xadx9Um
                                          id_q1gvn4yY9)
                                        id_q1gvn4yY9)))))
                                (wrap_15NDGTTrpt id_18YO1eDyY. w_pjIkZTZos))))
                           (if (memv type_dLZH82Q9G '(module-form))
                             ((lambda (ribcage_YRCIIjpMk r_NXH8T.pMj)
                                (parse-module_UVlZVkszm
                                  e_NTB36NgA8
                                  w_jKqBBxgA8
                                  s_cLHNqDZiS
                                  (make-wrap_11O4kRWi7j
                                    (wrap-marks_KA6c9HSHW w_jKqBBxgA8)
                                    (cons ribcage_YRCIIjpMk
                                          (wrap-subst_Kj.SjPSHZ w_jKqBBxgA8)))
                                  (lambda (id_rEIRgjZll
                                           exports_l8svSXyWW
                                           forms_MvOIFrZmn)
                                    (if id_rEIRgjZll
                                      (begin
                                        ((lambda (n_Hykc2lH4y)
                                           ((lambda (b_GJJaaGQdO)
                                              ((lambda (t_lguuRXyWG)
                                                 (if (memv t_lguuRXyWG
                                                           '(displaced-lexical))
                                                   (displaced-lexical-error_133PzNLSFq
                                                     (wrap_15NDGTTrpt
                                                       id_rEIRgjZll
                                                       w_jKqBBxgA8))
                                                   (void)))
                                               (binding-type_jhChhh9WA
                                                 b_GJJaaGQdO)))
                                            (lookup_14YP5xrre9
                                              n_Hykc2lH4y
                                              r_NXH8T.pMj)))
                                         (id-var-name_a6RQVDroq
                                           id_rEIRgjZll
                                           '(())))
                                        (chi-top-module_TkcNTEBGD
                                          e_NTB36NgA8
                                          r_NXH8T.pMj
                                          ribcage_YRCIIjpMk
                                          w_jKqBBxgA8
                                          s_cLHNqDZiS
                                          ctem_47uDfnZha
                                          rtem_gi8VpVgzs
                                          id_rEIRgjZll
                                          exports_l8svSXyWW
                                          forms_MvOIFrZmn))
                                      (chi-top-module_TkcNTEBGD
                                        e_NTB36NgA8
                                        r_NXH8T.pMj
                                        ribcage_YRCIIjpMk
                                        w_jKqBBxgA8
                                        s_cLHNqDZiS
                                        ctem_47uDfnZha
                                        rtem_gi8VpVgzs
                                        '#f
                                        exports_l8svSXyWW
                                        forms_MvOIFrZmn)))))
                              (make-ribcage_3Q97Hvrjd '() '() '())
                              (cons '("top-level module placeholder"
                                      placeholder)
                                    r_ZGZHowyRI))
                             (if (memv type_dLZH82Q9G '(import-form))
                               (parse-import_l27SwTT.S
                                 e_NTB36NgA8
                                 w_jKqBBxgA8
                                 s_cLHNqDZiS
                                 (lambda (mid_mmP7b17sO)
                                   (ct-eval/residualize_16qqn0xBHH
                                     ctem_47uDfnZha
                                     (lambda ()
                                       (begin
                                         (if value_2309ZzySp
                                           (syntax-error
                                             (source-wrap_LaBpzTrpx
                                               e_NTB36NgA8
                                               w_jKqBBxgA8
                                               s_cLHNqDZiS)
                                             '"not valid at top-level")
                                           (void))
                                         ((lambda (binding_12oiv1bpLS)
                                            ((lambda (t_itSNCY7tP)
                                               (if (memv t_itSNCY7tP '(module))
                                                 (do-top-import_HQ32T5BHj
                                                   mid_mmP7b17sO
                                                   (interface-token_18s6UmHsv6
                                                     (binding-value_kYJv9nSEm
                                                       binding_12oiv1bpLS)))
                                                 (if (memv t_itSNCY7tP
                                                           '(displaced-lexical))
                                                   (displaced-lexical-error_133PzNLSFq
                                                     mid_mmP7b17sO)
                                                   (syntax-error
                                                     mid_mmP7b17sO
                                                     '"import from unknown module"))))
                                             (binding-type_jhChhh9WA
                                               binding_12oiv1bpLS)))
                                          (lookup_14YP5xrre9
                                            (id-var-name_a6RQVDroq
                                              mid_mmP7b17sO
                                              '(()))
                                            '())))))))
                               (rt-eval/residualize_v.oMno17.
                                 rtem_gi8VpVgzs
                                 (lambda ()
                                   (chi-expr_978lxZKR.
                                     type_dLZH82Q9G
                                     value_2309ZzySp
                                     e_NTB36NgA8
                                     r_ZGZHowyRI
                                     w_jKqBBxgA8
                                     s_cLHNqDZiS))))))))))))))
         (chi-top-expr_2cuJDOjl3
           (lambda (e_pH7Nyegyx
                    r_x5KaHpgyy
                    w_yy8FlnZhh
                    top-ribcage_13jcVSzyRR)
             (call-with-values
               (lambda ()
                 (syntax-type_Z4HWWyjl.
                   e_pH7Nyegyx
                   r_x5KaHpgyy
                   w_yy8FlnZhh
                   '#f
                   top-ribcage_13jcVSzyRR))
               (lambda (type_R7FAU6gzc
                        value_ggN3M6Q8N
                        e_3eSlfypIn
                        w_S29p5gyRx
                        s_.CZ5ouQ8P)
                 (chi-expr_978lxZKR.
                   type_R7FAU6gzc
                   value_ggN3M6Q8N
                   e_3eSlfypIn
                   r_x5KaHpgyy
                   w_S29p5gyRx
                   s_.CZ5ouQ8P)))))
         (syntax-type_Z4HWWyjl.
           (lambda (e_ZHhsmc7fD
                    r_6jEtZxHPd
                    w_WcV3gfZ6v
                    s_QzYlpxgoO
                    rib_ImDezYHPf)
             (if (symbol? e_ZHhsmc7fD)
               ((lambda (n_mcHGG2gwp)
                  ((lambda (b_rDM4F87nk)
                     ((lambda (type_BoSvupGH)
                        (if (memv type_BoSvupGH '(lexical))
                          (values
                            type_BoSvupGH
                            (binding-value_kYJv9nSEm b_rDM4F87nk)
                            e_ZHhsmc7fD
                            w_WcV3gfZ6v
                            s_QzYlpxgoO)
                          (if (memv type_BoSvupGH '(global))
                            (values
                              type_BoSvupGH
                              (binding-value_kYJv9nSEm b_rDM4F87nk)
                              e_ZHhsmc7fD
                              w_WcV3gfZ6v
                              s_QzYlpxgoO)
                            (if (memv type_BoSvupGH '(macro macro!))
                              (syntax-type_Z4HWWyjl.
                                (chi-macro_ovGrcJahK
                                  (binding-value_kYJv9nSEm b_rDM4F87nk)
                                  e_ZHhsmc7fD
                                  r_6jEtZxHPd
                                  w_WcV3gfZ6v
                                  s_QzYlpxgoO
                                  rib_ImDezYHPf)
                                r_6jEtZxHPd
                                '(())
                                '#f
                                rib_ImDezYHPf)
                              (values
                                type_BoSvupGH
                                (binding-value_kYJv9nSEm b_rDM4F87nk)
                                e_ZHhsmc7fD
                                w_WcV3gfZ6v
                                s_QzYlpxgoO)))))
                      (binding-type_jhChhh9WA b_rDM4F87nk)))
                   (lookup_14YP5xrre9 n_mcHGG2gwp r_6jEtZxHPd)))
                (id-var-name_a6RQVDroq e_ZHhsmc7fD w_WcV3gfZ6v))
               (if (pair? e_ZHhsmc7fD)
                 ((lambda (first_SaVnQjZ88)
                    (if (id?_AEZ.eZJxY first_SaVnQjZ88)
                      ((lambda (n_9mRrDZQ0y)
                         ((lambda (b_3zVAiegr2)
                            ((lambda (type_5gQgHyQ0G)
                               (if (memv type_5gQgHyQ0G '(lexical))
                                 (values
                                   'lexical-call
                                   (binding-value_kYJv9nSEm b_3zVAiegr2)
                                   e_ZHhsmc7fD
                                   w_WcV3gfZ6v
                                   s_QzYlpxgoO)
                                 (if (memv type_5gQgHyQ0G '(macro macro!))
                                   (syntax-type_Z4HWWyjl.
                                     (chi-macro_ovGrcJahK
                                       (binding-value_kYJv9nSEm b_3zVAiegr2)
                                       e_ZHhsmc7fD
                                       r_6jEtZxHPd
                                       w_WcV3gfZ6v
                                       s_QzYlpxgoO
                                       rib_ImDezYHPf)
                                     r_6jEtZxHPd
                                     '(())
                                     '#f
                                     rib_ImDezYHPf)
                                   (if (memv type_5gQgHyQ0G '(core))
                                     (values
                                       type_5gQgHyQ0G
                                       (binding-value_kYJv9nSEm b_3zVAiegr2)
                                       e_ZHhsmc7fD
                                       w_WcV3gfZ6v
                                       s_QzYlpxgoO)
                                     (if (memv type_5gQgHyQ0G '(local-syntax))
                                       (values
                                         'local-syntax-form
                                         (binding-value_kYJv9nSEm b_3zVAiegr2)
                                         e_ZHhsmc7fD
                                         w_WcV3gfZ6v
                                         s_QzYlpxgoO)
                                       (if (memv type_5gQgHyQ0G '(begin))
                                         (values
                                           'begin-form
                                           '#f
                                           e_ZHhsmc7fD
                                           w_WcV3gfZ6v
                                           s_QzYlpxgoO)
                                         (if (memv type_5gQgHyQ0G '(eval-when))
                                           (values
                                             'eval-when-form
                                             '#f
                                             e_ZHhsmc7fD
                                             w_WcV3gfZ6v
                                             s_QzYlpxgoO)
                                           (if (memv type_5gQgHyQ0G '(define))
                                             (values
                                               'define-form
                                               '#f
                                               e_ZHhsmc7fD
                                               w_WcV3gfZ6v
                                               s_QzYlpxgoO)
                                             (if (memv type_5gQgHyQ0G
                                                       '(define-syntax))
                                               (values
                                                 'define-syntax-form
                                                 '#f
                                                 e_ZHhsmc7fD
                                                 w_WcV3gfZ6v
                                                 s_QzYlpxgoO)
                                               (if (memv type_5gQgHyQ0G
                                                         '(module-key))
                                                 (values
                                                   'module-form
                                                   '#f
                                                   e_ZHhsmc7fD
                                                   w_WcV3gfZ6v
                                                   s_QzYlpxgoO)
                                                 (if (memv type_5gQgHyQ0G
                                                           '(import))
                                                   (values
                                                     'import-form
                                                     (if (binding-value_kYJv9nSEm
                                                           b_3zVAiegr2)
                                                       (wrap_15NDGTTrpt
                                                         first_SaVnQjZ88
                                                         w_WcV3gfZ6v)
                                                       '#f)
                                                     e_ZHhsmc7fD
                                                     w_WcV3gfZ6v
                                                     s_QzYlpxgoO)
                                                   (if (memv type_5gQgHyQ0G
                                                             '(set!))
                                                     (chi-set!_K2olx.T.i
                                                       e_ZHhsmc7fD
                                                       r_6jEtZxHPd
                                                       w_WcV3gfZ6v
                                                       s_QzYlpxgoO
                                                       rib_ImDezYHPf)
                                                     (values
                                                       'call
                                                       '#f
                                                       e_ZHhsmc7fD
                                                       w_WcV3gfZ6v
                                                       s_QzYlpxgoO)))))))))))))
                             (binding-type_jhChhh9WA b_3zVAiegr2)))
                          (lookup_14YP5xrre9 n_9mRrDZQ0y r_6jEtZxHPd)))
                       (id-var-name_a6RQVDroq
                         first_SaVnQjZ88
                         w_WcV3gfZ6v))
                      (values
                        'call
                        '#f
                        e_ZHhsmc7fD
                        w_WcV3gfZ6v
                        s_QzYlpxgoO)))
                  (car e_ZHhsmc7fD))
                 (if (syntax-object?_PiqwpY0La e_ZHhsmc7fD)
                   (syntax-type_Z4HWWyjl.
                     (syntax-object-expression_K1xadx9Um e_ZHhsmc7fD)
                     r_6jEtZxHPd
                     (join-wraps_f3DJEyieU
                       w_WcV3gfZ6v
                       (syntax-object-wrap_DJHTz7SC8 e_ZHhsmc7fD))
                     '#f
                     rib_ImDezYHPf)
                   (if (annotation? e_ZHhsmc7fD)
                     (syntax-type_Z4HWWyjl.
                       (annotation-expression e_ZHhsmc7fD)
                       r_6jEtZxHPd
                       w_WcV3gfZ6v
                       (annotation-source e_ZHhsmc7fD)
                       rib_ImDezYHPf)
                     (if (not ((lambda (t_Rc71VI7g1)
                                 (if t_Rc71VI7g1
                                   t_Rc71VI7g1
                                   (vector? e_ZHhsmc7fD)))
                               (pair? e_ZHhsmc7fD)))
                       (values
                         'constant
                         '#f
                         e_ZHhsmc7fD
                         w_WcV3gfZ6v
                         s_QzYlpxgoO)
                       (values
                         'other
                         '#f
                         e_ZHhsmc7fD
                         w_WcV3gfZ6v
                         s_QzYlpxgoO))))))))
         (chi-when-list_UuubX.jlW
           (lambda (when-list_bAtCM7pvI w_Fx5hmpHN0)
             (map (lambda (x_yk72oQ7dI)
                    (if (literal-id=?_IORoNHroz
                          x_yk72oQ7dI
                          '#3(syntax-object
                              compile
                              ((top)
                               #4(ribcage ())
                               #4(ribcage #1(x) #1((top)) #1("i"))
                               #4(ribcage ())
                               #4(ribcage
                                  #2(when-list w)
                                  #2((top))
                                  #2("i" "i"))
                               #4(ribcage
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
                                   "i"))
                               #4(ribcage (#2(import-token *top*)) ()))))
                      'compile
                      (if (literal-id=?_IORoNHroz
                            x_yk72oQ7dI
                            '#3(syntax-object
                                load
                                ((top)
                                 #4(ribcage ())
                                 #4(ribcage #1(x) #1((top)) #1("i"))
                                 #4(ribcage ())
                                 #4(ribcage
                                    #2(when-list w)
                                    #2((top))
                                    #2("i" "i"))
                                 #4(ribcage
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
                                     "i"))
                                 #4(ribcage (#2(import-token *top*)) ()))))
                        'load
                        (if (literal-id=?_IORoNHroz
                              x_yk72oQ7dI
                              '#3(syntax-object
                                  visit
                                  ((top)
                                   #4(ribcage ())
                                   #4(ribcage #1(x) #1((top)) #1("i"))
                                   #4(ribcage ())
                                   #4(ribcage
                                      #2(when-list w)
                                      #2((top))
                                      #2("i" "i"))
                                   #4(ribcage
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
                                       "i"))
                                   #4(ribcage (#2(import-token *top*)) ()))))
                          'visit
                          (if (literal-id=?_IORoNHroz
                                x_yk72oQ7dI
                                '#3(syntax-object
                                    revisit
                                    ((top)
                                     #4(ribcage ())
                                     #4(ribcage #1(x) #1((top)) #1("i"))
                                     #4(ribcage ())
                                     #4(ribcage
                                        #2(when-list w)
                                        #2((top))
                                        #2("i" "i"))
                                     #4(ribcage
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
                                         "i"))
                                     #4(ribcage (#2(import-token *top*)) ()))))
                            'revisit
                            (if (literal-id=?_IORoNHroz
                                  x_yk72oQ7dI
                                  '#3(syntax-object
                                      eval
                                      ((top)
                                       #4(ribcage ())
                                       #4(ribcage #1(x) #1((top)) #1("i"))
                                       #4(ribcage ())
                                       #4(ribcage
                                          #2(when-list w)
                                          #2((top))
                                          #2("i" "i"))
                                       #4(ribcage
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
                                           "i"))
                                       #4(ribcage
                                          (#2(import-token *top*))
                                          ()
                                          ()))))
                              'eval
                              (syntax-error
                                (wrap_15NDGTTrpt x_yk72oQ7dI w_Fx5hmpHN0)
                                '"invalid eval-when situation")))))))
                  when-list_bAtCM7pvI)))
         (chi-top-sequence_dqztIRacJ
           (lambda (body_ADYCm6QUl
                    r_Y5L0BFgkN
                    w_zRfLW.Z2A
                    s_buhaZs7bJ
                    ctem_veZyps7bK
                    rtem_KJFLXvZ2C
                    ribcage_11ROqeCQUu)
             (build-sequence_11xUoJl9Sx
               s_buhaZs7bJ
               ((letrec ((dobody_179DWU4yCs
                           (lambda (body_yJ2HU7ptn
                                    r_18fbfzKQUP
                                    w_uRxkRagkg
                                    ctem_FcbeR87b8
                                    rtem_MFX2GU7b8)
                             (if (null? body_yJ2HU7ptn)
                               '()
                               ((lambda (first_Xp8ZFwyDQ)
                                  (cons first_Xp8ZFwyDQ
                                        (dobody_179DWU4yCs
                                          (cdr body_yJ2HU7ptn)
                                          r_18fbfzKQUP
                                          w_uRxkRagkg
                                          ctem_FcbeR87b8
                                          rtem_MFX2GU7b8)))
                                (chi-top_gUdU1LTVI
                                  (car body_yJ2HU7ptn)
                                  r_18fbfzKQUP
                                  w_uRxkRagkg
                                  ctem_FcbeR87b8
                                  rtem_MFX2GU7b8
                                  ribcage_11ROqeCQUu))))))
                  dobody_179DWU4yCs)
                body_ADYCm6QUl
                r_Y5L0BFgkN
                w_zRfLW.Z2A
                ctem_veZyps7bK
                rtem_KJFLXvZ2C))))
         (chi-sequence_aZTrdlAyK
           (lambda (body_Rsv17FHJG
                    r_SSTo8.prp
                    w_KnTafUHJI
                    s_DuCO5Bgii)
             (build-sequence_11xUoJl9Sx
               s_DuCO5Bgii
               ((letrec ((dobody_bLjVyDZ1f
                           (lambda (body_2ltucZgjA r_IhTLjpgjB w_kYJv9nZ1k)
                             (if (null? body_2ltucZgjA)
                               '()
                               ((lambda (first_AdbNxmQTr)
                                  (cons first_AdbNxmQTr
                                        (dobody_bLjVyDZ1f
                                          (cdr body_2ltucZgjA)
                                          r_IhTLjpgjB
                                          w_kYJv9nZ1k)))
                                (chi_emzRIPszD
                                  (car body_2ltucZgjA)
                                  r_IhTLjpgjB
                                  w_kYJv9nZ1k))))))
                  dobody_bLjVyDZ1f)
                body_Rsv17FHJG
                r_SSTo8.prp
                w_KnTafUHJI))))
         (source-wrap_LaBpzTrpx
           (lambda (x_zn92vWprY w_60QF.cyA7 s_NibltM79I)
             (wrap_15NDGTTrpt
               (if s_NibltM79I
                 (make-annotation x_zn92vWprY s_NibltM79I '#f)
                 x_zn92vWprY)
               w_60QF.cyA7)))
         (wrap_15NDGTTrpt
           (lambda (x_ENrSrhHIV w_xB3qHlghv)
             (if (if (null? (wrap-marks_KA6c9HSHW w_xB3qHlghv))
                   (null? (wrap-subst_Kj.SjPSHZ w_xB3qHlghv))
                   '#f)
               x_ENrSrhHIV
               (if (syntax-object?_PiqwpY0La x_ENrSrhHIV)
                 (make-syntax-object_ZCTCCii2o
                   (syntax-object-expression_K1xadx9Um x_ENrSrhHIV)
                   (join-wraps_f3DJEyieU
                     w_xB3qHlghv
                     (syntax-object-wrap_DJHTz7SC8 x_ENrSrhHIV)))
                 (if (null? x_ENrSrhHIV)
                   x_ENrSrhHIV
                   (make-syntax-object_ZCTCCii2o
                     x_ENrSrhHIV
                     w_xB3qHlghv))))))
         (bound-id-member?_ad1L5Hroo
           (lambda (x_bWn19fZZ7 list_SnDeOaggq)
             (if (not (null? list_SnDeOaggq))
               ((lambda (t_15RRAkDZZq)
                  (if t_15RRAkDZZq
                    t_15RRAkDZZq
                    (bound-id-member?_ad1L5Hroo
                      x_bWn19fZZ7
                      (cdr list_SnDeOaggq))))
                (bound-id=?_2xo8.WSP3
                  x_bWn19fZZ7
                  (car list_SnDeOaggq)))
               '#f)))
         (invalid-ids-error_Oj3ohI0YU
           (lambda (ids_mwAsPXxvl exp_FBYziuomd class_YEBsDDxvn)
             ((letrec ((find_6CCm0Komm
                         (lambda (ids_Wjasduonq gooduns_5MT058xwA)
                           (if (null? ids_Wjasduonq)
                             (syntax-error exp_FBYziuomd)
                             (if (id?_AEZ.eZJxY (car ids_Wjasduonq))
                               (if (bound-id-member?_ad1L5Hroo
                                     (car ids_Wjasduonq)
                                     gooduns_5MT058xwA)
                                 (syntax-error
                                   (car ids_Wjasduonq)
                                   '"duplicate "
                                   class_YEBsDDxvn)
                                 (find_6CCm0Komm
                                   (cdr ids_Wjasduonq)
                                   (cons (car ids_Wjasduonq)
                                         gooduns_5MT058xwA)))
                               (syntax-error
                                 (car ids_Wjasduonq)
                                 '"invalid "
                                 class_YEBsDDxvn))))))
                find_6CCm0Komm)
              ids_mwAsPXxvl
              '())))
         (distinct-bound-ids?_3Ll3afSPA
           (lambda (ids_T3GRoyPMf)
             ((letrec ((distinct?_MfNlZ863F
                         (lambda (ids_BwKZpPYVz)
                           ((lambda (t_GsRvEoxuk)
                              (if t_GsRvEoxuk
                                t_GsRvEoxuk
                                (if (not (bound-id-member?_ad1L5Hroo
                                           (car ids_BwKZpPYVz)
                                           (cdr ids_BwKZpPYVz)))
                                  (distinct?_MfNlZ863F (cdr ids_BwKZpPYVz))
                                  '#f)))
                            (null? ids_BwKZpPYVz)))))
                distinct?_MfNlZ863F)
              ids_T3GRoyPMf)))
         (valid-bound-ids?_F3ZGrRJG1
           (lambda (ids_64JXWhfbs)
             (if ((letrec ((all-ids?_.3ye.KokS
                             (lambda (ids_mlxeIOPLk)
                               ((lambda (t_OY8C1Hxtb)
                                  (if t_OY8C1Hxtb
                                    t_OY8C1Hxtb
                                    (if (id?_AEZ.eZJxY (car ids_mlxeIOPLk))
                                      (all-ids?_.3ye.KokS (cdr ids_mlxeIOPLk))
                                      '#f)))
                                (null? ids_mlxeIOPLk)))))
                    all-ids?_.3ye.KokS)
                  ids_64JXWhfbs)
               (distinct-bound-ids?_3Ll3afSPA ids_64JXWhfbs)
               '#f)))
         (bound-id=?_2xo8.WSP3
           (lambda (i_0RNyK8xp4 j_Hgmj07YQw)
             (if (if (syntax-object?_PiqwpY0La i_0RNyK8xp4)
                   (syntax-object?_PiqwpY0La j_Hgmj07YQw)
                   '#f)
               (if (eq? ((lambda (e_55RES6f9Y)
                           (if (annotation? e_55RES6f9Y)
                             (annotation-expression e_55RES6f9Y)
                             e_55RES6f9Y))
                         (syntax-object-expression_K1xadx9Um i_0RNyK8xp4))
                        ((lambda (e_v.Pm1DYTm)
                           (if (annotation? e_v.Pm1DYTm)
                             (annotation-expression e_v.Pm1DYTm)
                             e_v.Pm1DYTm))
                         (syntax-object-expression_K1xadx9Um j_Hgmj07YQw)))
                 (same-marks?_p3bMmE0XK
                   (wrap-marks_KA6c9HSHW
                     (syntax-object-wrap_DJHTz7SC8 i_0RNyK8xp4))
                   (wrap-marks_KA6c9HSHW
                     (syntax-object-wrap_DJHTz7SC8 j_Hgmj07YQw)))
                 '#f)
               (eq? (if (annotation? i_0RNyK8xp4)
                      (annotation-expression i_0RNyK8xp4)
                      i_0RNyK8xp4)
                    (if (annotation? j_Hgmj07YQw)
                      (annotation-expression j_Hgmj07YQw)
                      j_Hgmj07YQw)))))
         (literal-id=?_IORoNHroz
           (lambda (id_JFGBmmPD2 literal_wjKV9uPD3)
             (if (eq? ((lambda (e_.5WZ716XV)
                         (if (annotation? e_.5WZ716XV)
                           (annotation-expression e_.5WZ716XV)
                           e_.5WZ716XV))
                       (if (syntax-object?_PiqwpY0La id_JFGBmmPD2)
                         (syntax-object-expression_K1xadx9Um id_JFGBmmPD2)
                         id_JFGBmmPD2))
                      ((lambda (e_tvoe9rYPL)
                         (if (annotation? e_tvoe9rYPL)
                           (annotation-expression e_tvoe9rYPL)
                           e_tvoe9rYPL))
                       (if (syntax-object?_PiqwpY0La literal_wjKV9uPD3)
                         (syntax-object-expression_K1xadx9Um
                           literal_wjKV9uPD3)
                         literal_wjKV9uPD3)))
               ((lambda (n-literal_5qx02M6VA n-id_ZnnNKPxl.)
                  ((lambda (t_cCqEJDxlc)
                     (if t_cCqEJDxlc
                       t_cCqEJDxlc
                       (if ((lambda (t_15CzzggxmX)
                              (if t_15CzzggxmX
                                t_15CzzggxmX
                                (symbol? n-id_ZnnNKPxl.)))
                            (not n-id_ZnnNKPxl.))
                         ((lambda (t_g3z0Skxmu)
                            (if t_g3z0Skxmu
                              t_g3z0Skxmu
                              (symbol? n-literal_5qx02M6VA)))
                          (not n-literal_5qx02M6VA))
                         '#f)))
                   (eq? n-id_ZnnNKPxl. n-literal_5qx02M6VA)))
                (id-var-name_a6RQVDroq literal_wjKV9uPD3 '(()))
                (id-var-name_a6RQVDroq id_JFGBmmPD2 '(())))
               '#f)))
         (free-id=?_de9nIHrou
           (lambda (i_17bz5m7o9N j_AXSFSno9O)
             (if (eq? ((lambda (e_KUIZ3FGs7)
                         (if (annotation? e_KUIZ3FGs7)
                           (annotation-expression e_KUIZ3FGs7)
                           e_KUIZ3FGs7))
                       (if (syntax-object?_PiqwpY0La i_17bz5m7o9N)
                         (syntax-object-expression_K1xadx9Um i_17bz5m7o9N)
                         i_17bz5m7o9N))
                      ((lambda (e_VCLtnI6Uy)
                         (if (annotation? e_VCLtnI6Uy)
                           (annotation-expression e_VCLtnI6Uy)
                           e_VCLtnI6Uy))
                       (if (syntax-object?_PiqwpY0La j_AXSFSno9O)
                         (syntax-object-expression_K1xadx9Um j_AXSFSno9O)
                         j_AXSFSno9O)))
               (eq? (id-var-name_a6RQVDroq i_17bz5m7o9N '(()))
                    (id-var-name_a6RQVDroq j_AXSFSno9O '(())))
               '#f)))
         (id-var-name_a6RQVDroq
           (lambda (id_LaxOhbo8T w_JfG6d16RC)
             (call-with-values
               (lambda ()
                 (id-var-name-loc&marks_VQITVqJFw
                   id_LaxOhbo8T
                   w_JfG6d16RC))
               (lambda (label_cC3El6PAQ marks_teebwk6Sb)
                 (if (indirect-label?_pvy88N913 label_cC3El6PAQ)
                   (get-indirect-label_KqbGZl91i label_cC3El6PAQ)
                   label_cC3El6PAQ)))))
         (id-var-name-loc_wJ97tA0XW
           (lambda (id_ch40z86RV w_15ghNEJf.4)
             (call-with-values
               (lambda ()
                 (id-var-name-loc&marks_VQITVqJFw
                   id_ch40z86RV
                   w_15ghNEJf.4))
               (lambda (label_qMjKYuPzc marks_KOe9aaPzd)
                 label_qMjKYuPzc))))
         (id-var-name&marks_16GOmdt950
           (lambda (id_9sP4AxGps w_ohC6tXxgk)
             (call-with-values
               (lambda ()
                 (id-var-name-loc&marks_VQITVqJFw
                   id_9sP4AxGps
                   w_ohC6tXxgk))
               (lambda (label_JI.65Oo7K marks_T3aFsCPyb)
                 (values
                   (if (indirect-label?_pvy88N913 label_JI.65Oo7K)
                     (get-indirect-label_KqbGZl91i label_JI.65Oo7K)
                     label_JI.65Oo7K)
                   marks_T3aFsCPyb)))))
         (id-var-name-loc&marks_VQITVqJFw
           (lambda (id_moUsdtfL6 w_8vtHc1Gby)
             (letrec ((search-vector-rib_SGfvkJfLn
                        (lambda (sym_mLbeR0xdM
                                 subst_JLhKkMGmW
                                 marks_YKMwyqPv4
                                 symnames_b3RBNuPv5
                                 ribcage_W9IslGmY)
                          ((lambda (n_sYQz5afWF)
                             ((letrec ((f_EEowApGmd
                                         (lambda (i_GZ1WYNfWQ)
                                           (if (= i_GZ1WYNfWQ n_sYQz5afWF)
                                             (search_8GKdMU6C3
                                               sym_mLbeR0xdM
                                               (cdr subst_JLhKkMGmW)
                                               marks_YKMwyqPv4)
                                             (if (if (eq? (vector-ref
                                                            symnames_b3RBNuPv5
                                                            i_GZ1WYNfWQ)
                                                          sym_mLbeR0xdM)
                                                   (same-marks?_p3bMmE0XK
                                                     marks_YKMwyqPv4
                                                     (vector-ref
                                                       (ribcage-marks_t56RwSSLU
                                                         ribcage_W9IslGmY)
                                                       i_GZ1WYNfWQ))
                                                   '#f)
                                               (values
                                                 (vector-ref
                                                   (ribcage-labels_42fRxmJCR
                                                     ribcage_W9IslGmY)
                                                   i_GZ1WYNfWQ)
                                                 marks_YKMwyqPv4)
                                               (f_EEowApGmd
                                                 (+ i_GZ1WYNfWQ '1)))))))
                                f_EEowApGmd)
                              '0))
                           (vector-length symnames_b3RBNuPv5))))
                      (search-list-rib_12Eot.boUr
                        (lambda (sym_a2VWIQGhQ
                                 subst_dazZv1GhR
                                 marks_Vv4RE6Pq0
                                 symnames_0lYejNfRs
                                 ribcage_YeOnsxfRt)
                          ((letrec ((f_w7afK2Pqe
                                      (lambda (symnames_4pJxwxfRI i_mIFiakx80)
                                        (if (null? symnames_4pJxwxfRI)
                                          (search_8GKdMU6C3
                                            sym_a2VWIQGhQ
                                            (cdr subst_dazZv1GhR)
                                            marks_Vv4RE6Pq0)
                                          (if (if (eq? (car symnames_4pJxwxfRI)
                                                       sym_a2VWIQGhQ)
                                                (same-marks?_p3bMmE0XK
                                                  marks_Vv4RE6Pq0
                                                  (list-ref
                                                    (ribcage-marks_t56RwSSLU
                                                      ribcage_YeOnsxfRt)
                                                    i_mIFiakx80))
                                                '#f)
                                            (values
                                              (list-ref
                                                (ribcage-labels_42fRxmJCR
                                                  ribcage_YeOnsxfRt)
                                                i_mIFiakx80)
                                              marks_Vv4RE6Pq0)
                                            (if (import-token?_rVeMLqJEH
                                                  (car symnames_4pJxwxfRI))
                                              ((lambda (t_39HikM6Kt)
                                                 (if t_39HikM6Kt
                                                   (if (symbol? t_39HikM6Kt)
                                                     (values
                                                       t_39HikM6Kt
                                                       marks_Vv4RE6Pq0)
                                                     (id-var-name&marks_16GOmdt950
                                                       t_39HikM6Kt
                                                       '(())))
                                                   (f_w7afK2Pqe
                                                     (cdr symnames_4pJxwxfRI)
                                                     i_mIFiakx80)))
                                               (lookup-import-binding-name_3Z4h.Z95j
                                                 sym_a2VWIQGhQ
                                                 (import-token-key_17Bizhvrmv
                                                   (car symnames_4pJxwxfRI))
                                                 marks_Vv4RE6Pq0))
                                              (if (if (eq? (car symnames_4pJxwxfRI)
                                                           barrier-marker_877s2vrl3)
                                                    (same-marks?_p3bMmE0XK
                                                      marks_Vv4RE6Pq0
                                                      (list-ref
                                                        (ribcage-marks_t56RwSSLU
                                                          ribcage_YeOnsxfRt)
                                                        i_mIFiakx80))
                                                    '#f)
                                                (values '#f marks_Vv4RE6Pq0)
                                                (f_w7afK2Pqe
                                                  (cdr symnames_4pJxwxfRI)
                                                  (+ i_mIFiakx80 '1)))))))))
                             f_w7afK2Pqe)
                           symnames_0lYejNfRs
                           '0)))
                      (search_8GKdMU6C3
                        (lambda (sym_HHjYCwx6F subst_9BJeU.oYx marks_Dd9QK4x6H)
                          (if (null? subst_9BJeU.oYx)
                            (values sym_HHjYCwx6F marks_Dd9QK4x6H)
                            ((lambda (fst_4zSSw.oYO)
                               (if (eq? fst_4zSSw.oYO 'shift)
                                 (search_8GKdMU6C3
                                   sym_HHjYCwx6F
                                   (cdr subst_9BJeU.oYx)
                                   (cdr marks_Dd9QK4x6H))
                                 ((lambda (symnames_r2KGVPpy)
                                    (if (vector? symnames_r2KGVPpy)
                                      (search-vector-rib_SGfvkJfLn
                                        sym_HHjYCwx6F
                                        subst_9BJeU.oYx
                                        marks_Dd9QK4x6H
                                        symnames_r2KGVPpy
                                        fst_4zSSw.oYO)
                                      (search-list-rib_12Eot.boUr
                                        sym_HHjYCwx6F
                                        subst_9BJeU.oYx
                                        marks_Dd9QK4x6H
                                        symnames_r2KGVPpy
                                        fst_4zSSw.oYO)))
                                  (ribcage-symnames_5E7pcY0UY fst_4zSSw.oYO))))
                             (car subst_9BJeU.oYx))))))
               (if (symbol? id_moUsdtfL6)
                 (search_8GKdMU6C3
                   id_moUsdtfL6
                   (wrap-subst_Kj.SjPSHZ w_8vtHc1Gby)
                   (wrap-marks_KA6c9HSHW w_8vtHc1Gby))
                 (if (syntax-object?_PiqwpY0La id_moUsdtfL6)
                   ((lambda (w1_nY3aRKoWZ sym_Snc00OoWY)
                      ((lambda (marks_cHjjyBfNX)
                         (call-with-values
                           (lambda ()
                             (search_8GKdMU6C3
                               sym_Snc00OoWY
                               (wrap-subst_Kj.SjPSHZ w_8vtHc1Gby)
                               marks_cHjjyBfNX))
                           (lambda (new-id_ohUvAM6Eo marks_CPqRc56Ep)
                             (if (eq? new-id_ohUvAM6Eo sym_Snc00OoWY)
                               (search_8GKdMU6C3
                                 sym_Snc00OoWY
                                 (wrap-subst_Kj.SjPSHZ w1_nY3aRKoWZ)
                                 marks_CPqRc56Ep)
                               (values new-id_ohUvAM6Eo marks_CPqRc56Ep)))))
                       (join-marks_YdSBRmieY
                         (wrap-marks_KA6c9HSHW w_8vtHc1Gby)
                         (wrap-marks_KA6c9HSHW w1_nY3aRKoWZ))))
                    (syntax-object-wrap_DJHTz7SC8 id_moUsdtfL6)
                    ((lambda (e_odrqq2fOp)
                       (if (annotation? e_odrqq2fOp)
                         (annotation-expression e_odrqq2fOp)
                         e_odrqq2fOp))
                     (syntax-object-expression_K1xadx9Um id_moUsdtfL6)))
                   (if (annotation? id_moUsdtfL6)
                     (search_8GKdMU6C3
                       (if (annotation? id_moUsdtfL6)
                         (annotation-expression id_moUsdtfL6)
                         id_moUsdtfL6)
                       (wrap-subst_Kj.SjPSHZ w_8vtHc1Gby)
                       (wrap-marks_KA6c9HSHW w_8vtHc1Gby))
                     (error-hook_3mDX7JJgZ
                       'id-var-name
                       '"invalid id"
                       id_moUsdtfL6)))))))
         (same-marks?_p3bMmE0XK
           (lambda (x_vvvBp5G9C y_n971c7oSl)
             ((lambda (t_13o0.pQ6Ac)
                (if t_13o0.pQ6Ac
                  t_13o0.pQ6Ac
                  (if (not (null? x_vvvBp5G9C))
                    (if (not (null? y_n971c7oSl))
                      (if (eq? (car x_vvvBp5G9C) (car y_n971c7oSl))
                        (same-marks?_p3bMmE0XK
                          (cdr x_vvvBp5G9C)
                          (cdr y_n971c7oSl))
                        '#f)
                      '#f)
                    '#f)))
              (eq? x_vvvBp5G9C y_n971c7oSl))))
         (join-marks_YdSBRmieY
           (lambda (m1_TKhTjHx0i m2_JOiSXpG9s)
             (smart-append_vU8Ki1Aw6
               m1_TKhTjHx0i
               m2_JOiSXpG9s)))
         (join-wraps_f3DJEyieU
           (lambda (w1_tnJLazYqs w2_.KjttjoRU)
             ((lambda (s1_A2pIaGoR5 m1_xOzRIY6zN)
                (if (null? m1_xOzRIY6zN)
                  (if (null? s1_A2pIaGoR5)
                    w2_.KjttjoRU
                    (make-wrap_11O4kRWi7j
                      (wrap-marks_KA6c9HSHW w2_.KjttjoRU)
                      (smart-append_vU8Ki1Aw6
                        s1_A2pIaGoR5
                        (wrap-subst_Kj.SjPSHZ w2_.KjttjoRU))))
                  (make-wrap_11O4kRWi7j
                    (smart-append_vU8Ki1Aw6
                      m1_xOzRIY6zN
                      (wrap-marks_KA6c9HSHW w2_.KjttjoRU))
                    (smart-append_vU8Ki1Aw6
                      s1_A2pIaGoR5
                      (wrap-subst_Kj.SjPSHZ w2_.KjttjoRU)))))
              (wrap-subst_Kj.SjPSHZ w1_tnJLazYqs)
              (wrap-marks_KA6c9HSHW w1_tnJLazYqs))))
         (smart-append_vU8Ki1Aw6
           (lambda (m1_5NfmlxfHe m2_fB5WXFG7G)
             (if (null? m2_fB5WXFG7G)
               m1_5NfmlxfHe
               (append m1_5NfmlxfHe m2_fB5WXFG7G))))
         (make-trimmed-syntax-object_mwXrct95C
           (lambda (id_kM5fsePdq)
             (call-with-values
               (lambda ()
                 (id-var-name&marks_16GOmdt950 id_kM5fsePdq '(())))
               (lambda (tosym_B4E8e16vm marks_K9QgyPd5)
                 (begin
                   (if (not tosym_B4E8e16vm)
                     (syntax-error
                       id_kM5fsePdq
                       '"identifier not visible for export")
                     (void))
                   ((lambda (fromsym_9qTW7uPeX)
                      (make-syntax-object_ZCTCCii2o
                        fromsym_9qTW7uPeX
                        (make-wrap_11O4kRWi7j
                          marks_K9QgyPd5
                          (list (make-ribcage_3Q97Hvrjd
                                  (vector fromsym_9qTW7uPeX)
                                  (vector marks_K9QgyPd5)
                                  (vector tosym_B4E8e16vm))))))
                    ((lambda (e_JTkJjMG6W)
                       (if (annotation? e_JTkJjMG6W)
                         (annotation-expression e_JTkJjMG6W)
                         e_JTkJjMG6W))
                     (if (syntax-object?_PiqwpY0La id_kM5fsePdq)
                       (syntax-object-expression_K1xadx9Um id_kM5fsePdq)
                       id_kM5fsePdq))))))))
         (make-binding-wrap_7af0eB95y
           (lambda (ids_16e.V9vYil labels_9Gt41qP9d w_EEUc8XYin)
             (if (null? ids_16e.V9vYil)
               w_EEUc8XYin
               (make-wrap_11O4kRWi7j
                 (wrap-marks_KA6c9HSHW w_EEUc8XYin)
                 (cons ((lambda (labelvec_RHjBZQ6r2)
                          ((lambda (n_nUKF8iP9S)
                             ((lambda (marksvec_DvUz4iP90 symnamevec_oLz.duP9.)
                                (begin
                                  ((letrec ((f_W1uYh6fAA
                                              (lambda (ids_16BR67OoKM
                                                       i_PG3FiU6sy)
                                                (if (not (null? ids_16BR67OoKM))
                                                  (call-with-values
                                                    (lambda ()
                                                      (id-sym-name&marks_XUPJFzrgp
                                                        (car ids_16BR67OoKM)
                                                        w_EEUc8XYin))
                                                    (lambda (symname_JPrqnHYkx
                                                             marks_azFMm0xU7)
                                                      (begin
                                                        (vector-set!
                                                          symnamevec_oLz.duP9.
                                                          i_PG3FiU6sy
                                                          symname_JPrqnHYkx)
                                                        (vector-set!
                                                          marksvec_DvUz4iP90
                                                          i_PG3FiU6sy
                                                          marks_azFMm0xU7)
                                                        (f_W1uYh6fAA
                                                          (cdr ids_16BR67OoKM)
                                                          (+ i_PG3FiU6sy
                                                             '1)))))
                                                  (void)))))
                                     f_W1uYh6fAA)
                                   ids_16e.V9vYil
                                   '0)
                                  (make-ribcage_3Q97Hvrjd
                                    symnamevec_oLz.duP9.
                                    marksvec_DvUz4iP90
                                    labelvec_RHjBZQ6r2)))
                              (make-vector n_nUKF8iP9S)
                              (make-vector n_nUKF8iP9S)))
                           (vector-length labelvec_RHjBZQ6r2)))
                        (list->vector labels_9Gt41qP9d))
                       (wrap-subst_Kj.SjPSHZ w_EEUc8XYin))))))
         (lookup-import-binding-name_3Z4h.Z95j
           (lambda (sym_q3VDCaP6Z key_hwBDDhfxq marks_P68f6lGYS)
             ((lambda (new_dtOn9BGZZ)
                (if new_dtOn9BGZZ
                  ((letrec ((f_0ax8kDxQ3
                              (lambda (new_XrAXcCoHY)
                                (if (pair? new_XrAXcCoHY)
                                  ((lambda (t_C8xjFA6qQ)
                                     (if t_C8xjFA6qQ
                                       t_C8xjFA6qQ
                                       (f_0ax8kDxQ3 (cdr new_XrAXcCoHY))))
                                   (f_0ax8kDxQ3 (car new_XrAXcCoHY)))
                                  (if (symbol? new_XrAXcCoHY)
                                    (if (same-marks?_p3bMmE0XK
                                          marks_P68f6lGYS
                                          (wrap-marks_KA6c9HSHW '((top))))
                                      new_XrAXcCoHY
                                      '#f)
                                    (if (same-marks?_p3bMmE0XK
                                          marks_P68f6lGYS
                                          (wrap-marks_KA6c9HSHW
                                            (syntax-object-wrap_DJHTz7SC8
                                              new_XrAXcCoHY)))
                                      new_XrAXcCoHY
                                      '#f))))))
                     f_0ax8kDxQ3)
                   new_dtOn9BGZZ)
                  '#f))
              (get-import-binding_ncmzNZJhm
                sym_q3VDCaP6Z
                key_hwBDDhfxq))))
         (extend-ribcage-subst!_9ETy31AwG
           (lambda (ribcage_17sopZ2P6x token_dIbmmxfxZ)
             (set-ribcage-symnames!_kNadCPSL4
               ribcage_17sopZ2P6x
               (cons (make-import-token_hCVgZmJDB token_dIbmmxfxZ)
                     (ribcage-symnames_5E7pcY0UY ribcage_17sopZ2P6x)))))
         (extend-ribcage-barrier-help!_.HmX8ornu
           (lambda (ribcage_H8U7eM6nb wrap_UY9jIQ6nc)
             (begin
               (set-ribcage-symnames!_kNadCPSL4
                 ribcage_H8U7eM6nb
                 (cons barrier-marker_877s2vrl3
                       (ribcage-symnames_5E7pcY0UY ribcage_H8U7eM6nb)))
               (set-ribcage-marks!_UhpYJKibB
                 ribcage_H8U7eM6nb
                 (cons (wrap-marks_KA6c9HSHW wrap_UY9jIQ6nc)
                       (ribcage-marks_t56RwSSLU ribcage_H8U7eM6nb))))))
         (extend-ribcage-barrier!_16rJM7l958
           (lambda (ribcage_DHaXTrYeM killer-id_KSpQc56nW)
             (extend-ribcage-barrier-help!_.HmX8ornu
               ribcage_DHaXTrYeM
               (syntax-object-wrap_DJHTz7SC8
                 killer-id_KSpQc56nW))))
         (extend-ribcage!_220FBaJED
           (lambda (ribcage_FpLUgA6lj id_LDQP9YGVU label_auyjJWoEG)
             (begin
               (set-ribcage-symnames!_kNadCPSL4
                 ribcage_FpLUgA6lj
                 (cons ((lambda (e_3OmaNTYdC)
                          (if (annotation? e_3OmaNTYdC)
                            (annotation-expression e_3OmaNTYdC)
                            e_3OmaNTYdC))
                        (syntax-object-expression_K1xadx9Um id_LDQP9YGVU))
                       (ribcage-symnames_5E7pcY0UY ribcage_FpLUgA6lj)))
               (set-ribcage-marks!_UhpYJKibB
                 ribcage_FpLUgA6lj
                 (cons (wrap-marks_KA6c9HSHW
                         (syntax-object-wrap_DJHTz7SC8 id_LDQP9YGVU))
                       (ribcage-marks_t56RwSSLU ribcage_FpLUgA6lj)))
               (set-ribcage-labels!_h03BOeJC6
                 ribcage_FpLUgA6lj
                 (cons label_auyjJWoEG
                       (ribcage-labels_42fRxmJCR ribcage_FpLUgA6lj))))))
         (set-import-token-key!_NlMSq994y
           (lambda (x_7.Mzk5GVn update_ngXQu7YcG)
             (vector-set! x_7.Mzk5GVn '1 update_ngXQu7YcG)))
         (import-token-key_17Bizhvrmv
           (lambda (x_QpCdzYGUN)
             (vector-ref x_QpCdzYGUN '1)))
         (import-token?_rVeMLqJEH
           (lambda (x_14RZUozYad)
             (if (vector? x_14RZUozYad)
               (if (= (vector-length x_14RZUozYad) '2)
                 (eq? (vector-ref x_14RZUozYad '0) 'import-token)
                 '#f)
               '#f)))
         (make-import-token_hCVgZmJDB
           (lambda (key_ta85L7Y9y)
             (vector 'import-token key_ta85L7Y9y)))
         (barrier-marker_877s2vrl3 '#f)
         (anti-mark_182Z59qJDR
           (lambda (w_19sMNtE6hW)
             (make-wrap_11O4kRWi7j
               (cons '#f (wrap-marks_KA6c9HSHW w_19sMNtE6hW))
               (cons 'shift (wrap-subst_Kj.SjPSHZ w_19sMNtE6hW)))))
         (set-ribcage-labels!_h03BOeJC6
           (lambda (x_QQHbfhfqw update_16Ch3FVfqx)
             (vector-set! x_QQHbfhfqw '3 update_16Ch3FVfqx)))
         (set-ribcage-marks!_UhpYJKibB
           (lambda (x_14u8IpgxHf update_t1KKwJfpZ)
             (vector-set! x_14u8IpgxHf '2 update_t1KKwJfpZ)))
         (set-ribcage-symnames!_kNadCPSL4
           (lambda (x_ATqAIDxGD update_et23tboxv)
             (vector-set! x_ATqAIDxGD '1 update_et23tboxv)))
         (ribcage-labels_42fRxmJCR
           (lambda (x_MUF8MU6fC)
             (vector-ref x_MUF8MU6fC '3)))
         (ribcage-marks_t56RwSSLU
           (lambda (x_eDT.nPY5W)
             (vector-ref x_eDT.nPY5W '2)))
         (ribcage-symnames_5E7pcY0UY
           (lambda (x_awNRiOPXb)
             (vector-ref x_awNRiOPXb '1)))
         (ribcage?_B7XEYtAss
           (lambda (x_ZvcZTI6cB)
             (if (vector? x_ZvcZTI6cB)
               (if (= (vector-length x_ZvcZTI6cB) '4)
                 (eq? (vector-ref x_ZvcZTI6cB '0) 'ribcage)
                 '#f)
               '#f)))
         (make-ribcage_3Q97Hvrjd
           (lambda (symnames_k2CaYlGLo
                    marks_bRulkhfk.
                    labels_Iyl5xPY2J)
             (vector
               'ribcage
               symnames_k2CaYlGLo
               marks_bRulkhfk.
               labels_Iyl5xPY2J)))
         (gen-labels_wwfl95As.
           (lambda (ls_hq3AkZfj3)
             (if (null? ls_hq3AkZfj3)
               '()
               (cons (gen-label_LppBybSKb)
                     (gen-labels_wwfl95As. (cdr ls_hq3AkZfj3))))))
         (label?_1T4T3uJB5
           (lambda (x_EpXOBefii)
             ((lambda (t_KpYvhmPT3)
                (if t_KpYvhmPT3
                  t_KpYvhmPT3
                  ((lambda (t_19jdCyI6as)
                     (if t_19jdCyI6as
                       t_19jdCyI6as
                       (indirect-label?_pvy88N913 x_EpXOBefii)))
                   (symbol? x_EpXOBefii))))
              (string? x_EpXOBefii))))
         (gen-label_LppBybSKb (lambda () (string '#\i)))
         (make-indirect-label_FmFbmfSJI
           (lambda (label_XU6LUw69v)
             (vector 'indirect-label label_XU6LUw69v)))
         (indirect-label?_pvy88N913
           (lambda (x_L7eizKPR4)
             (if (vector? x_L7eizKPR4)
               (if (= (vector-length x_L7eizKPR4) '2)
                 (eq? (vector-ref x_L7eizKPR4 '0) 'indirect-label)
                 '#f)
               '#f)))
         (indirect-label-label_14xi1AiJBG
           (lambda (x_I0JPbQ672)
             (vector-ref x_I0JPbQ672 '1)))
         (set-indirect-label-label!_14Sz3t40T2
           (lambda (x_EybGxGHh update_zuuGR.YZA)
             (vector-set! x_EybGxGHh '1 update_zuuGR.YZA)))
         (gen-indirect-label_nqmG6Wian
           (lambda ()
             (make-indirect-label_FmFbmfSJI
               (gen-label_LppBybSKb))))
         (get-indirect-label_KqbGZl91i
           (lambda (x_ypFJPg67q)
             (indirect-label-label_14xi1AiJBG x_ypFJPg67q)))
         (set-indirect-label!_rJFudRJBV
           (lambda (x_ZFb7lLYZ9 v_q7wxrrYZa)
             (set-indirect-label-label!_14Sz3t40T2
               x_ZFb7lLYZ9
               v_q7wxrrYZa)))
         (wrap-subst_Kj.SjPSHZ cdr)
         (wrap-marks_KA6c9HSHW car)
         (make-wrap_11O4kRWi7j cons)
         (id-sym-name&marks_XUPJFzrgp
           (lambda (x_BnLdPE54Z w_D0vca3nmh)
             (if (syntax-object?_PiqwpY0La x_BnLdPE54Z)
               (values
                 ((lambda (e_xX2qlbYY7)
                    (if (annotation? e_xX2qlbYY7)
                      (annotation-expression e_xX2qlbYY7)
                      e_xX2qlbYY7))
                  (syntax-object-expression_K1xadx9Um x_BnLdPE54Z))
                 (join-marks_YdSBRmieY
                   (wrap-marks_KA6c9HSHW w_D0vca3nmh)
                   (wrap-marks_KA6c9HSHW
                     (syntax-object-wrap_DJHTz7SC8 x_BnLdPE54Z))))
               (values
                 (if (annotation? x_BnLdPE54Z)
                   (annotation-expression x_BnLdPE54Z)
                   x_BnLdPE54Z)
                 (wrap-marks_KA6c9HSHW w_D0vca3nmh)))))
         (id?_AEZ.eZJxY
           (lambda (x_aaeWVNecj)
             (if (symbol? x_aaeWVNecj)
               '#t
               (if (syntax-object?_PiqwpY0La x_aaeWVNecj)
                 (symbol?
                   ((lambda (e_.ekXvyONT)
                      (if (annotation? e_.ekXvyONT)
                        (annotation-expression e_.ekXvyONT)
                        e_.ekXvyONT))
                    (syntax-object-expression_K1xadx9Um x_aaeWVNecj)))
                 (if (annotation? x_aaeWVNecj)
                   (symbol? (annotation-expression x_aaeWVNecj))
                   '#f)))))
         (nonsymbol-id?_4NX5Kfi6a
           (lambda (x_Tcvppjnko)
             (if (syntax-object?_PiqwpY0La x_Tcvppjnko)
               (symbol?
                 ((lambda (e_y3Y6gfXUn)
                    (if (annotation? e_y3Y6gfXUn)
                      (annotation-expression e_y3Y6gfXUn)
                      e_y3Y6gfXUn))
                  (syntax-object-expression_K1xadx9Um x_Tcvppjnko)))
               '#f)))
         (global-extend_CFNkgHSGG
           (lambda (type_VvS3P.nj3 sym_TenYCE51N val_TPKkkjnj4)
             (put-global-definition-hook_diPSPGJhi
               sym_TenYCE51N
               (make-binding_CEIm66Jv6
                 type_VvS3P.nj3
                 val_TPKkkjnj4))))
         (lookup_14YP5xrre9
           (lambda (x_ZrLUKZe8K r_SPr3K0wq2)
             (letrec ((whack-binding!_9XWpfPwq7
                        (lambda (b_diY4n551p *b_wB78uA51p)
                          (begin
                            (set-binding-type!_pEfSu0rdZ
                              b_diY4n551p
                              (binding-type_jhChhh9WA *b_wB78uA51p))
                            (set-binding-value!_WTeH5A0NB
                              b_diY4n551p
                              (binding-value_kYJv9nSEm *b_wB78uA51p))))))
               ((lambda (b_PH.rU3XRG)
                  ((lambda (t_8DnuDCnik)
                     (if (memv t_8DnuDCnik '(deferred))
                       (begin
                         (whack-binding!_9XWpfPwq7
                           b_PH.rU3XRG
                           ((lambda (*b_UxzxYswrF)
                              ((lambda (t_CCRHpfniJ)
                                 (if t_CCRHpfniJ
                                   t_CCRHpfniJ
                                   (syntax-error
                                     *b_UxzxYswrF
                                     '"invalid transformer")))
                               (sanitize-binding_178HaiUAne *b_UxzxYswrF)))
                            (local-eval-hook_YJqwaU0ye
                              (binding-value_kYJv9nSEm b_PH.rU3XRG))))
                         ((lambda (t_EDNYeOJJ) b_PH.rU3XRG)
                          (binding-type_jhChhh9WA b_PH.rU3XRG)))
                       b_PH.rU3XRG))
                   (binding-type_jhChhh9WA b_PH.rU3XRG)))
                (lookup*_SAMGqfi5U x_ZrLUKZe8K r_SPr3K0wq2)))))
         (sanitize-binding_178HaiUAne
           (lambda (b_xmDIIaOGD)
             (if (procedure? b_xmDIIaOGD)
               (make-binding_CEIm66Jv6 'macro b_xmDIIaOGD)
               (if (binding?_RgryE9Amd b_xmDIIaOGD)
                 ((lambda (t_COzGTCngE)
                    (if (memv t_COzGTCngE '(core macro macro!))
                      (if (procedure?
                            (binding-value_kYJv9nSEm b_xmDIIaOGD))
                        b_xmDIIaOGD
                        '#f)
                      (if (memv t_COzGTCngE '(module))
                        (if (interface?_K5IRgssvT
                              (binding-value_kYJv9nSEm b_xmDIIaOGD))
                          b_xmDIIaOGD
                          '#f)
                        b_xmDIIaOGD)))
                  (binding-type_jhChhh9WA b_xmDIIaOGD))
                 '#f))))
         (lookup*_SAMGqfi5U
           (lambda (x_sjPAK.XOh r_RhrVw1Fw0)
             ((lambda (t_ISwgMyOFs)
                (if t_ISwgMyOFs
                  (cdr t_ISwgMyOFs)
                  (if (symbol? x_sjPAK.XOh)
                    ((lambda (t_CdInAnnfp)
                       (if t_CdInAnnfp
                         t_CdInAnnfp
                         (make-binding_CEIm66Jv6 'global x_sjPAK.XOh)))
                     (get-global-definition-hook_sKC9jvSqt
                       x_sjPAK.XOh))
                    (make-binding_CEIm66Jv6 'displaced-lexical '#f))))
              (assq x_sjPAK.XOh r_RhrVw1Fw0))))
         (displaced-lexical-error_133PzNLSFq
           (lambda (id_11AIIwROEA)
             (syntax-error
               id_11AIIwROEA
               (if (id-var-name_a6RQVDroq id_11AIIwROEA '(()))
                 '"identifier out of context"
                 '"identifier not visible"))))
         (transformer-env_h9Z7ZzreX
           (lambda (r_oPi5Bae3k)
             (if (null? r_oPi5Bae3k)
               '()
               ((lambda (a_QMGzfgwlR)
                  (if (eq? (cadr a_QMGzfgwlR) 'lexical)
                    (transformer-env_h9Z7ZzreX (cdr r_oPi5Bae3k))
                    (cons a_QMGzfgwlR
                          (transformer-env_h9Z7ZzreX (cdr r_oPi5Bae3k)))))
                (car r_oPi5Bae3k)))))
         (extend-var-env*_RS4q.99XC
           (lambda (labels_T4GegqOCF vars_BwTaYee26 r_LObqnXXLQ)
             (if (null? labels_T4GegqOCF)
               r_LObqnXXLQ
               (extend-var-env*_RS4q.99XC
                 (cdr labels_T4GegqOCF)
                 (cdr vars_BwTaYee26)
                 (extend-env_EIDOV00On
                   (car labels_T4GegqOCF)
                   (make-binding_CEIm66Jv6
                     'lexical
                     (car vars_BwTaYee26))
                   r_LObqnXXLQ)))))
         (extend-env*_YcveBYAn.
           (lambda (labels_aWixn4wjk bindings_F0YzPeOBD r_nJtLHynac)
             (if (null? labels_aWixn4wjk)
               r_nJtLHynac
               (extend-env*_YcveBYAn.
                 (cdr labels_aWixn4wjk)
                 (cdr bindings_F0YzPeOBD)
                 (extend-env_EIDOV00On
                   (car labels_aWixn4wjk)
                   (car bindings_F0YzPeOBD)
                   r_nJtLHynac)))))
         (extend-env_EIDOV00On
           (lambda (label_189IqFfXJi binding_uKIwz9Fr1 r_S7PFXZOAb)
             (cons (cons label_189IqFfXJi binding_uKIwz9Fr1)
                   r_S7PFXZOAb)))
         (binding?_RgryE9Amd
           (lambda (x_SzIIhFe.W)
             (if (pair? x_SzIIhFe.W)
               (symbol? (car x_SzIIhFe.W))
               '#f)))
         (set-binding-value!_WTeH5A0NB set-cdr!)
         (set-binding-type!_pEfSu0rdZ set-car!)
         (binding-value_kYJv9nSEm cdr)
         (binding-type_jhChhh9WA car)
         (make-binding_CEIm66Jv6
           (lambda (x_6Cb9eowhC y_3r9.q2OzV)
             (cons x_6Cb9eowhC y_3r9.q2OzV)))
         (source-annotation_9y.vnbSDy
           (lambda (x_NC9BnROy1)
             (if (annotation? x_NC9BnROy1)
               (annotation-source x_NC9BnROy1)
               (if (syntax-object?_PiqwpY0La x_NC9BnROy1)
                 (source-annotation_9y.vnbSDy
                   (syntax-object-expression_K1xadx9Um x_NC9BnROy1))
                 '#f))))
         (set-syntax-object-wrap!_DD4S7eJt6
           (lambda (x_bdZ2jtFoo update_18ttgC6eZZ)
             (vector-set! x_bdZ2jtFoo '2 update_18ttgC6eZZ)))
         (set-syntax-object-expression!_a1bA3V9Uu
           (lambda (x_zfUgHPXG3 update_d.qhDHwfE)
             (vector-set! x_zfUgHPXG3 '1 update_d.qhDHwfE)))
         (syntax-object-wrap_DJHTz7SC8
           (lambda (x_jvLeiM5OG)
             (vector-ref x_jvLeiM5OG '2)))
         (syntax-object-expression_K1xadx9Um
           (lambda (x_32K9ZPwew)
             (vector-ref x_32K9ZPwew '1)))
         (syntax-object?_PiqwpY0La
           (lambda (x_e7R8uHwcF)
             (if (vector? x_e7R8uHwcF)
               (if (= (vector-length x_e7R8uHwcF) '3)
                 (eq? (vector-ref x_e7R8uHwcF '0) 'syntax-object)
                 '#f)
               '#f)))
         (make-syntax-object_ZCTCCii2o
           (lambda (expression_neJiVgwbV wrap_aPYx97XCm)
             (vector
               'syntax-object
               expression_neJiVgwbV
               wrap_aPYx97XCm)))
         (build-body_rzGZUWSAk
           (lambda (src_22cc3XXC2
                    vars_9pFLqun2u
                    val-exps_18CoqVzXC3
                    body-exp_Ahl6Io5Ld)
             (build-letrec_QE8okkr9R
               src_22cc3XXC2
               vars_9pFLqun2u
               val-exps_18CoqVzXC3
               body-exp_Ahl6Io5Ld)))
         (build-letrec_QE8okkr9R
           (lambda (src_M0czX55JV
                    vars_IJPwqkw9m
                    val-exps_ZF7w32OrF
                    body-exp_175kWNeeS6)
             (if (null? vars_IJPwqkw9m)
               (if src_M0czX55JV
                 (list 'compile-in-annotation
                       body-exp_175kWNeeS6
                       src_M0czX55JV)
                 body-exp_175kWNeeS6)
               (if src_M0czX55JV
                 (list 'compile-in-annotation
                       (list 'letrec
                             (map list vars_IJPwqkw9m val-exps_ZF7w32OrF)
                             body-exp_175kWNeeS6)
                       src_M0czX55JV)
                 (list 'letrec
                       (map list vars_IJPwqkw9m val-exps_ZF7w32OrF)
                       body-exp_175kWNeeS6)))))
         (build-sequence_11xUoJl9Sx
           (lambda (src_y7b0J.nYh exps_VSvQQ3nYk)
             (if (null? exps_VSvQQ3nYk)
               '(if '#f '#f)
               (if (equal? '(void) (car exps_VSvQQ3nYk))
                 (build-sequence_11xUoJl9Sx
                   src_y7b0J.nYh
                   (cdr exps_VSvQQ3nYk))
                 (if (null? (cdr exps_VSvQQ3nYk))
                   (if src_y7b0J.nYh
                     (list 'compile-in-annotation
                           (car exps_VSvQQ3nYk)
                           src_y7b0J.nYh)
                     (car exps_VSvQQ3nYk))
                   (if src_y7b0J.nYh
                     (list 'compile-in-annotation
                           (cons 'begin exps_VSvQQ3nYk)
                           src_y7b0J.nYh)
                     (cons 'begin exps_VSvQQ3nYk)))))))
         (generate-id_j8I7ZPr.7 gen-sym)
         (get-import-binding_ncmzNZJhm
           (lambda (symbol_cRNDWA5FA token_YRYjdY5FB)
             (getprop symbol_cRNDWA5FA token_YRYjdY5FB)))
         (get-global-definition-hook_sKC9jvSqt
           (lambda (symbol_Z6eOgw5F)
             (getprop symbol_Z6eOgw5F '*sc-expander*)))
         (put-global-definition-hook_diPSPGJhi
           (lambda (symbol_30eei8w5m val_j9IvRHw5n)
             ($sc-put-cte symbol_30eei8w5m val_j9IvRHw5n)))
         (error-hook_3mDX7JJgZ
           (lambda (who_EAJw51Fd8 why_13xW9IiOmi what_UDkLYLXvr)
             (error who_EAJw51Fd8
                    '"~a ~s"
                    why_13xW9IiOmi
                    what_UDkLYLXvr)))
         (local-eval-hook_YJqwaU0ye
           (lambda (x_clowiBFdt)
             (eval (list noexpand_JaS1HLrTm x_clowiBFdt))))
         (top-level-eval-hook_I.N2BF9Hk
           (lambda (x_0TnIPFFcR)
             (eval (list noexpand_JaS1HLrTm x_0TnIPFFcR))))
         (noexpand_JaS1HLrTm '"noexpand"))
  (begin
    (set! $sc-put-cte
      (lambda (id_DH1Lk1B45 b_lnK0iIB46)
        (letrec ((put-cte_64JXWhaEX
                   (lambda (id_CQmDOfTwX binding_5qYBI.TwY)
                     (begin
                       (put-token_KHRq9.jNU id_CQmDOfTwX '*top*)
                       ((lambda (sym_a4hiYfjXE)
                          (putprop
                            sym_a4hiYfjXE
                            '*sc-expander*
                            binding_5qYBI.TwY))
                        (if (symbol? id_CQmDOfTwX)
                          id_CQmDOfTwX
                          (id-var-name_a6RQVDroq id_CQmDOfTwX '(())))))))
                 (sc-put-module_1OgOwdaER
                   (lambda (exports_kLvsfBBep token_14qxrI7jX8)
                     (vfor-each_XnuRqpagO
                       (lambda (id_KiVUaeKnG)
                         (put-token_KHRq9.jNU
                           id_KiVUaeKnG
                           token_14qxrI7jX8))
                       exports_kLvsfBBep)))
                 (put-token_KHRq9.jNU
                   (lambda (id_lWrfNhB8w token_12hUUxxB8x)
                     (letrec ((weed_KqkSxLs.z
                                (lambda (id_ENd4CaaLh x_5jRnjaKlM)
                                  (if (pair? x_5jRnjaKlM)
                                    (if (bound-id=?_2xo8.WSP3
                                          (car x_5jRnjaKlM)
                                          id_ENd4CaaLh)
                                      (weed_KqkSxLs.z
                                        id_ENd4CaaLh
                                        (cdr x_5jRnjaKlM))
                                      (cons-id_go6yns1z3
                                        (car x_5jRnjaKlM)
                                        (weed_KqkSxLs.z
                                          id_ENd4CaaLh
                                          (cdr x_5jRnjaKlM))))
                                    (if ((lambda (t_xu1H4Hs33)
                                           (if t_xu1H4Hs33
                                             t_xu1H4Hs33
                                             (bound-id=?_2xo8.WSP3
                                               x_5jRnjaKlM
                                               id_ENd4CaaLh)))
                                         (not x_5jRnjaKlM))
                                      '#f
                                      x_5jRnjaKlM))))
                              (cons-id_go6yns1z3
                                (lambda (id_g3hDLvTtt x_KbeUzLs23)
                                  (if (not x_KbeUzLs23)
                                    id_g3hDLvTtt
                                    (cons id_g3hDLvTtt x_KbeUzLs23)))))
                       ((lambda (sym_SRapnWTq7)
                          ((lambda (x_vjJ1F0s.O)
                             (if (if (not x_vjJ1F0s.O)
                                   (symbol? id_lWrfNhB8w)
                                   '#f)
                               (remprop sym_SRapnWTq7 token_12hUUxxB8x)
                               (putprop
                                 sym_SRapnWTq7
                                 token_12hUUxxB8x
                                 (cons-id_go6yns1z3
                                   id_lWrfNhB8w
                                   x_vjJ1F0s.O))))
                           (weed_KqkSxLs.z
                             id_lWrfNhB8w
                             (getprop sym_SRapnWTq7 token_12hUUxxB8x))))
                        ((lambda (e_7q.mHXs1g)
                           (if (annotation? e_7q.mHXs1g)
                             (annotation-expression e_7q.mHXs1g)
                             e_7q.mHXs1g))
                         (if (syntax-object?_PiqwpY0La id_lWrfNhB8w)
                           (syntax-object-expression_K1xadx9Um id_lWrfNhB8w)
                           id_lWrfNhB8w)))))))
          ((lambda (binding_F7qoIIB4u)
             ((lambda (t_Dfwc.taEi)
                (if (memv t_Dfwc.taEi '(module))
                  (begin
                    ((lambda (iface_03NVkk1y6)
                       (sc-put-module_1OgOwdaER
                         (interface-exports_vfHxavsv. iface_03NVkk1y6)
                         (interface-token_18s6UmHsv6 iface_03NVkk1y6)))
                     (binding-value_kYJv9nSEm binding_F7qoIIB4u))
                    (put-cte_64JXWhaEX
                      id_DH1Lk1B45
                      binding_F7qoIIB4u))
                  (if (memv t_Dfwc.taEi '(do-import))
                    ((lambda (token_NG6vBEB4.)
                       ((lambda (b_0wsVAE1wy)
                          ((lambda (t_HygCLDsXc)
                             (if (memv t_HygCLDsXc '(module))
                               ((lambda (iface_bEZVkGjOs)
                                  (begin
                                    (if (not (eq? (interface-token_18s6UmHsv6
                                                    iface_bEZVkGjOs)
                                                  token_NG6vBEB4.))
                                      (syntax-error
                                        id_DH1Lk1B45
                                        '"import mismatch for module")
                                      (void))
                                    (sc-put-module_1OgOwdaER
                                      (interface-exports_vfHxavsv.
                                        iface_bEZVkGjOs)
                                      '*top*)))
                                (binding-value_kYJv9nSEm b_0wsVAE1wy))
                               (syntax-error
                                 id_DH1Lk1B45
                                 '"import from unknown module")))
                           (binding-type_jhChhh9WA b_0wsVAE1wy)))
                        (lookup_14YP5xrre9
                          (id-var-name_a6RQVDroq id_DH1Lk1B45 '(()))
                          '())))
                     (binding-value_kYJv9nSEm b_lnK0iIB46))
                    (put-cte_64JXWhaEX
                      id_DH1Lk1B45
                      binding_F7qoIIB4u))))
              (binding-type_jhChhh9WA binding_F7qoIIB4u)))
           ((lambda (t_zMWusOjQN)
              (if t_zMWusOjQN
                t_zMWusOjQN
                (error 'define-syntax
                       '"invalid transformer ~s"
                       b_lnK0iIB46)))
            (sanitize-binding_178HaiUAne b_lnK0iIB46))))))
    (global-extend_CFNkgHSGG
      'local-syntax
      'letrec-syntax
      '#t)
    (global-extend_CFNkgHSGG
      'local-syntax
      'let-syntax
      '#f)
    (global-extend_CFNkgHSGG
      'core
      'fluid-let-syntax
      (lambda (e_B.pt2xBgi r_t4x4ieKps w_xIaD5bjZ1 s_zUgSyDTyC)
        ((lambda (tmp_cWtvVqjZB)
           (if (if tmp_cWtvVqjZB
                 (apply (lambda (__16qEOYM1LN
                                 var_00MNII1LO
                                 val_Ich6Jo1LP
                                 e1_DEwPElBkp
                                 e2_aRMSXDsbh)
                          (valid-bound-ids?_F3ZGrRJG1 var_00MNII1LO))
                        tmp_cWtvVqjZB)
                 '#f)
             (apply (lambda (__Yf1x9xBg5
                             var_18dnVMdaQG
                             val_17l3pL6aQH
                             e1_6cbE42Kph
                             e2_ggMbhDs70)
                      ((lambda (names_cQ4hiEBhh)
                         (begin
                           (for-each
                             (lambda (id_3sFbmZKqN n_VcxbofTzX)
                               ((lambda (t_KUlZG7Tz5)
                                  (if (memv t_KUlZG7Tz5 '(displaced-lexical))
                                    (displaced-lexical-error_133PzNLSFq
                                      (wrap_15NDGTTrpt
                                        id_3sFbmZKqN
                                        w_xIaD5bjZ1))
                                    (void)))
                                (binding-type_jhChhh9WA
                                  (lookup_14YP5xrre9
                                    n_VcxbofTzX
                                    r_t4x4ieKps))))
                             var_18dnVMdaQG
                             names_cQ4hiEBhh)
                           (chi-body_sNZTrMBIf
                             (cons e1_6cbE42Kph e2_ggMbhDs70)
                             (source-wrap_LaBpzTrpx
                               e_B.pt2xBgi
                               w_xIaD5bjZ1
                               s_zUgSyDTyC)
                             (extend-env*_YcveBYAn.
                               names_cQ4hiEBhh
                               ((lambda (trans-r_5yenw7j0A)
                                  (map (lambda (x_N39YMtaSO)
                                         (make-binding_CEIm66Jv6
                                           'deferred
                                           (chi_emzRIPszD
                                             x_N39YMtaSO
                                             trans-r_5yenw7j0A
                                             w_xIaD5bjZ1)))
                                       val_17l3pL6aQH))
                                (transformer-env_h9Z7ZzreX r_t4x4ieKps))
                               r_t4x4ieKps)
                             w_xIaD5bjZ1)))
                       (map (lambda (x_MZLBpZaTx)
                              (id-var-name_a6RQVDroq x_MZLBpZaTx w_xIaD5bjZ1))
                            var_18dnVMdaQG)))
                    tmp_cWtvVqjZB)
             (syntax-error
               (source-wrap_LaBpzTrpx
                 e_B.pt2xBgi
                 w_xIaD5bjZ1
                 s_zUgSyDTyC))))
         ($syntax-dispatch
           (compile-in-annotation e_B.pt2xBgi value)
           '(any #2(each (any any)) any . each-any)))))
    (global-extend_CFNkgHSGG
      'core
      'quote
      (lambda (e_YUgQXpBk0
               r_116jJuuj2K
               w_.rlzr5Bk1
               s_ZgCcRE1Lt)
        ((lambda (tmp_17vbKLyj2Y)
           (if tmp_17vbKLyj2Y
             (apply (lambda (__14YjUBvscj e_Peo1Vs1MU)
                      (if s_ZgCcRE1Lt
                        (list 'compile-in-annotation
                              (list 'quote
                                    (strip_1ln0rNKSx e_Peo1Vs1MU w_.rlzr5Bk1))
                              s_ZgCcRE1Lt)
                        (list 'quote
                              (strip_1ln0rNKSx e_Peo1Vs1MU w_.rlzr5Bk1))))
                    tmp_17vbKLyj2Y)
             (syntax-error
               (source-wrap_LaBpzTrpx
                 e_YUgQXpBk0
                 w_.rlzr5Bk1
                 s_ZgCcRE1Lt))))
         ($syntax-dispatch
           (compile-in-annotation e_YUgQXpBk0 value)
           '(any any)))))
    (global-extend_CFNkgHSGG
      'core
      'syntax
      (letrec ((regen_GLe5RmKwM
                 (lambda (x_VW4RaRbux)
                   ((lambda (t_13cwWg6buN)
                      (if (memv t_13cwWg6buN '(ref))
                        (cadr x_VW4RaRbux)
                        (if (memv t_13cwWg6buN '(primitive))
                          (cadr x_VW4RaRbux)
                          (if (memv t_13cwWg6buN '(quote))
                            (list 'quote (cadr x_VW4RaRbux))
                            (if (memv t_13cwWg6buN '(lambda))
                              (list 'lambda
                                    (cadr x_VW4RaRbux)
                                    (regen_GLe5RmKwM (caddr x_VW4RaRbux)))
                              (if (memv t_13cwWg6buN '(map))
                                ((lambda (ls_19t89J2L5S)
                                   (cons (if (= (length ls_19t89J2L5S) '2)
                                           'map
                                           'map)
                                         ls_19t89J2L5S))
                                 (map regen_GLe5RmKwM (cdr x_VW4RaRbux)))
                                (cons (car x_VW4RaRbux)
                                      (map regen_GLe5RmKwM
                                           (cdr x_VW4RaRbux)))))))))
                    (car x_VW4RaRbux))))
               (gen-vector_v3ct1MBnu
                 (lambda (e_cGelo12iy ls_KQCTistJ. lsnew_yE9159CS9)
                   (if (eq? (car lsnew_yE9159CS9) 'quote)
                     (if (eq? (cadr lsnew_yE9159CS9) ls_KQCTistJ.)
                       (list 'quote e_cGelo12iy)
                       (list 'quote
                             (list->vector (cadr lsnew_yE9159CS9))))
                     (if (eq? (car lsnew_yE9159CS9) 'list)
                       (cons 'vector (cdr lsnew_yE9159CS9))
                       (list 'list->vector lsnew_yE9159CS9)))))
               (gen-cons_5BGIW6aXZ
                 (lambda (e_q1pIWuLWp
                          x_l4.NA5CNi
                          y_14c4jdCNj
                          xnew_ajI.XqLWt
                          ynew_L8T2WY2dM)
                   ((lambda (t_.XjIyZbm8)
                      (if (memv t_.XjIyZbm8 '(quote))
                        (if (eq? (car xnew_ajI.XqLWt) 'quote)
                          ((lambda (ynew_138z23jkyE xnew_18RpqKZLZ3)
                             (if (if (eq? xnew_18RpqKZLZ3 x_l4.NA5CNi)
                                   (eq? ynew_138z23jkyE y_14c4jdCNj)
                                   '#f)
                               (list 'quote e_q1pIWuLWp)
                               (list 'quote
                                     (cons xnew_18RpqKZLZ3 ynew_138z23jkyE))))
                           (cadr ynew_L8T2WY2dM)
                           (cadr xnew_ajI.XqLWt))
                          (if (eq? (cadr ynew_L8T2WY2dM) '())
                            (list 'list xnew_ajI.XqLWt)
                            (list 'cons xnew_ajI.XqLWt ynew_L8T2WY2dM)))
                        (if (memv t_.XjIyZbm8 '(list))
                          (cons 'list
                                (cons xnew_ajI.XqLWt (cdr ynew_L8T2WY2dM)))
                          (list 'cons xnew_ajI.XqLWt ynew_L8T2WY2dM))))
                    (car ynew_L8T2WY2dM))))
               (gen-map_W7OBDaKvs
                 (lambda (e_9NJuYFbg9 map-env_k0aQymLQK)
                   ((lambda (actuals_cls7ziLRT formals_aVdzeukqr)
                      (if (eq? (car e_9NJuYFbg9) 'ref)
                        (car actuals_cls7ziLRT)
                        (if (andmap
                              (lambda (x_15l6e2RLUU)
                                (if (eq? (car x_15l6e2RLUU) 'ref)
                                  (memq (cadr x_15l6e2RLUU) formals_aVdzeukqr)
                                  '#f))
                              (cdr e_9NJuYFbg9))
                          (cons 'map
                                (cons (list 'primitive (car e_9NJuYFbg9))
                                      (map ((lambda (r_ocJrFZLSC)
                                              (lambda (x_njoaU6LSM)
                                                (cdr (assq (cadr x_njoaU6LSM)
                                                           r_ocJrFZLSC))))
                                            (map cons
                                                 formals_aVdzeukqr
                                                 actuals_cls7ziLRT))
                                           (cdr e_9NJuYFbg9))))
                          (cons 'map
                                (cons (list 'lambda
                                            formals_aVdzeukqr
                                            e_9NJuYFbg9)
                                      actuals_cls7ziLRT)))))
                    (map (lambda (x_18h7o1MCMI)
                           (list 'ref (car x_18h7o1MCMI)))
                         map-env_k0aQymLQK)
                    (map cdr map-env_k0aQymLQK))))
               (gen-mappend_gl911xaWO
                 (lambda (e_t6tdMhCH5 map-env_Dn4nVpbgG)
                   (list 'apply
                         '(primitive append)
                         (gen-map_W7OBDaKvs e_t6tdMhCH5 map-env_Dn4nVpbgG))))
               (gen-append_16xCOObTEq
                 (lambda (x_138DDk0tx4 y_wSE3ZHUYw)
                   (if (equal? y_wSE3ZHUYw ''())
                     x_138DDk0tx4
                     (list 'append x_138DDk0tx4 y_wSE3ZHUYw))))
               (gen-ref_XGfkvosdV
                 (lambda (src_121sPFtbbR
                          var_lvN.hICCi
                          level_MES4wjUUB
                          maps_14EZEjU22P)
                   (if (= level_MES4wjUUB '0)
                     (values var_lvN.hICCi maps_14EZEjU22P)
                     (if (null? maps_14EZEjU22P)
                       (syntax-error
                         src_121sPFtbbR
                         '"missing ellipsis in syntax form")
                       (call-with-values
                         (lambda ()
                           (gen-ref_XGfkvosdV
                             src_121sPFtbbR
                             var_lvN.hICCi
                             (- level_MES4wjUUB '1)
                             (cdr maps_14EZEjU22P)))
                         (lambda (outer-var_bB6.gtCDr outer-maps_dX7MUfUVK)
                           ((lambda (b_o5LqPzUVS)
                              (if b_o5LqPzUVS
                                (values (cdr b_o5LqPzUVS) maps_14EZEjU22P)
                                ((lambda (inner-var_luDqRqkmy)
                                   (values
                                     inner-var_luDqRqkmy
                                     (cons (cons (cons outer-var_bB6.gtCDr
                                                       inner-var_luDqRqkmy)
                                                 (car maps_14EZEjU22P))
                                           outer-maps_dX7MUfUVK)))
                                 (gen-var_hMLALSjrb 'tmp))))
                            (assq outer-var_bB6.gtCDr
                                  (car maps_14EZEjU22P)))))))))
               (gen-syntax_TUQVuVaWx
                 (lambda (src_123K41zsfb
                          e_S2mcVnTGD
                          r_cfIhrSj64
                          maps_FVq8E2Kxw
                          ellipsis?_DWyX5osff)
                   (if (id?_AEZ.eZJxY e_S2mcVnTGD)
                     ((lambda (label_rQDv3hBze)
                        ((lambda (b_15f.pxUBzm)
                           (if (eq? (binding-type_jhChhh9WA b_15f.pxUBzm)
                                    'syntax)
                             (call-with-values
                               (lambda ()
                                 ((lambda (var.lev_SOrHS8ssv)
                                    (gen-ref_XGfkvosdV
                                      src_123K41zsfb
                                      (car var.lev_SOrHS8ssv)
                                      (cdr var.lev_SOrHS8ssv)
                                      maps_FVq8E2Kxw))
                                  (binding-value_kYJv9nSEm b_15f.pxUBzm)))
                               (lambda (var_eOi5mYBB7 maps_DY3vUcss.)
                                 (values
                                   (list 'ref var_eOi5mYBB7)
                                   maps_DY3vUcss.)))
                             (if (ellipsis?_DWyX5osff e_S2mcVnTGD)
                               (syntax-error
                                 src_123K41zsfb
                                 '"misplaced ellipsis in syntax form")
                               (values
                                 (list 'quote e_S2mcVnTGD)
                                 maps_FVq8E2Kxw))))
                         (lookup_14YP5xrre9 label_rQDv3hBze r_cfIhrSj64)))
                      (id-var-name_a6RQVDroq e_S2mcVnTGD '(())))
                     ((lambda (tmp_Q33qHuKyP)
                        (if (if tmp_Q33qHuKyP
                              (apply (lambda (dots_7KGBm5Bz0 e_15HF1VlBz1)
                                       (ellipsis?_DWyX5osff dots_7KGBm5Bz0))
                                     tmp_Q33qHuKyP)
                              '#f)
                          (apply (lambda (dots_FCyJn0sqz e_6DZJg81.9)
                                   (gen-syntax_TUQVuVaWx
                                     src_123K41zsfb
                                     e_6DZJg81.9
                                     r_cfIhrSj64
                                     maps_FVq8E2Kxw
                                     (lambda (x_E2G1YHTRf) '#f)))
                                 tmp_Q33qHuKyP)
                          ((lambda (tmp_15BQdDk1Q9)
                             (if (if tmp_15BQdDk1Q9
                                   (apply (lambda (x_2ouCPBa75
                                                   dots_8V2CH8spo
                                                   y_frf.211ZZ)
                                            (ellipsis?_DWyX5osff
                                              dots_8V2CH8spo))
                                          tmp_15BQdDk1Q9)
                                   '#f)
                               (apply (lambda (x_tbv58EBsi
                                               dots_QyBZ88sja
                                               y_IEnkM3TKD)
                                        ((letrec ((f_LiioamKCD
                                                    (lambda (y_17PSBzPsko
                                                             k_wjavOIBty)
                                                      ((lambda (tmp_0VP2eDskG)
                                                         (if (if tmp_0VP2eDskG
                                                               (apply (lambda (dots_w4C2iKFr
                                                                               y_VY5BVBa5T)
                                                                        (ellipsis?_DWyX5osff
                                                                          dots_w4C2iKFr))
                                                                      tmp_0VP2eDskG)
                                                               '#f)
                                                           (apply (lambda (dots_zXNa6bTMp
                                                                           y_rWe9DiKDh)
                                                                    (f_LiioamKCD
                                                                      y_rWe9DiKDh
                                                                      (lambda (maps_0s4rHCjc5)
                                                                        (call-with-values
                                                                          (lambda ()
                                                                            (k_wjavOIBty
                                                                              (cons '()
                                                                                    maps_0s4rHCjc5)))
                                                                          (lambda (x_hmUUh3TNl
                                                                                   maps_tiLu4U1Wv)
                                                                            (if (null? (car maps_tiLu4U1Wv))
                                                                              (syntax-error
                                                                                src_123K41zsfb
                                                                                '"extra ellipsis in syntax form")
                                                                              (values
                                                                                (gen-mappend_gl911xaWO
                                                                                  x_hmUUh3TNl
                                                                                  (car maps_tiLu4U1Wv))
                                                                                (cdr maps_tiLu4U1Wv))))))))
                                                                  tmp_0VP2eDskG)
                                                           (call-with-values
                                                             (lambda ()
                                                               (gen-syntax_TUQVuVaWx
                                                                 src_123K41zsfb
                                                                 y_17PSBzPsko
                                                                 r_cfIhrSj64
                                                                 maps_FVq8E2Kxw
                                                                 ellipsis?_DWyX5osff))
                                                             (lambda (y_QzTK7Q1UH
                                                                      maps_E5VXqqjb0)
                                                               (call-with-values
                                                                 (lambda ()
                                                                   (k_wjavOIBty
                                                                     maps_E5VXqqjb0))
                                                                 (lambda (x_EcKLHrTM7
                                                                          maps_nkb7OKjcz)
                                                                   (values
                                                                     (gen-append_16xCOObTEq
                                                                       x_EcKLHrTM7
                                                                       y_QzTK7Q1UH)
                                                                     maps_nkb7OKjcz)))))))
                                                       ($syntax-dispatch
                                                         (compile-in-annotation
                                                           y_17PSBzPsko
                                                           value)
                                                         '(any . any))))))
                                           f_LiioamKCD)
                                         y_IEnkM3TKD
                                         (lambda (maps_SDX.BhBxz)
                                           (call-with-values
                                             (lambda ()
                                               (gen-syntax_TUQVuVaWx
                                                 src_123K41zsfb
                                                 x_tbv58EBsi
                                                 r_cfIhrSj64
                                                 (cons '() maps_SDX.BhBxz)
                                                 ellipsis?_DWyX5osff))
                                             (lambda (x_2J11Pc1YP
                                                      maps_Ir5GAzsog)
                                               (if (null? (car maps_Ir5GAzsog))
                                                 (syntax-error
                                                   src_123K41zsfb
                                                   '"extra ellipsis in syntax form")
                                                 (values
                                                   (gen-map_W7OBDaKvs
                                                     x_2J11Pc1YP
                                                     (car maps_Ir5GAzsog))
                                                   (cdr maps_Ir5GAzsog))))))))
                                      tmp_15BQdDk1Q9)
                               ((lambda (tmp_rgANNNaZj)
                                  (if tmp_rgANNNaZj
                                    (apply (lambda (x_JhgDbpa0c y_y77qrha0d)
                                             (call-with-values
                                               (lambda ()
                                                 (gen-syntax_TUQVuVaWx
                                                   src_123K41zsfb
                                                   x_JhgDbpa0c
                                                   r_cfIhrSj64
                                                   maps_FVq8E2Kxw
                                                   ellipsis?_DWyX5osff))
                                               (lambda (xnew_CMpJAs1SE
                                                        maps_RuJzHw1SF)
                                                 (call-with-values
                                                   (lambda ()
                                                     (gen-syntax_TUQVuVaWx
                                                       src_123K41zsfb
                                                       y_y77qrha0d
                                                       r_cfIhrSj64
                                                       maps_RuJzHw1SF
                                                       ellipsis?_DWyX5osff))
                                                   (lambda (ynew_j6MZwMBsS
                                                            maps_K9OX1EBsT)
                                                     (values
                                                       (gen-cons_5BGIW6aXZ
                                                         e_S2mcVnTGD
                                                         x_JhgDbpa0c
                                                         y_y77qrha0d
                                                         xnew_CMpJAs1SE
                                                         ynew_j6MZwMBsS)
                                                       maps_K9OX1EBsT))))))
                                           tmp_rgANNNaZj)
                                    ((lambda (tmp_qqlCO7j7E)
                                       (if tmp_qqlCO7j7E
                                         (apply (lambda (x1_xSAlcs1QQ
                                                         x2_crzY5fTII)
                                                  ((lambda (ls_5NsaaEBqy)
                                                     (call-with-values
                                                       (lambda ()
                                                         (gen-syntax_TUQVuVaWx
                                                           src_123K41zsfb
                                                           ls_5NsaaEBqy
                                                           r_cfIhrSj64
                                                           maps_FVq8E2Kxw
                                                           ellipsis?_DWyX5osff))
                                                       (lambda (lsnew_pPGYtaa.G
                                                                maps_JAOWyo1Ry)
                                                         (values
                                                           (gen-vector_v3ct1MBnu
                                                             e_S2mcVnTGD
                                                             ls_5NsaaEBqy
                                                             lsnew_pPGYtaa.G)
                                                           maps_JAOWyo1Ry))))
                                                   (cons x1_xSAlcs1QQ
                                                         x2_crzY5fTII)))
                                                tmp_qqlCO7j7E)
                                         (values
                                           (list 'quote e_S2mcVnTGD)
                                           maps_FVq8E2Kxw)))
                                     ($syntax-dispatch
                                       (compile-in-annotation
                                         e_S2mcVnTGD
                                         value)
                                       '#2(vector (any . each-any))))))
                                ($syntax-dispatch
                                  (compile-in-annotation e_S2mcVnTGD value)
                                  '(any . any)))))
                           ($syntax-dispatch
                             (compile-in-annotation e_S2mcVnTGD value)
                             '(any any . any)))))
                      ($syntax-dispatch
                        (compile-in-annotation e_S2mcVnTGD value)
                        '(any any)))))))
        (lambda (e_kpKSy.j5y
                 r_VthUJtaXq
                 w_180TK7YBnR
                 s_tQ956haXr)
          ((lambda (e_t6UOrvseR)
             ((lambda (tmp_128uyh7TFu)
                (if tmp_128uyh7TFu
                  (apply (lambda (__usUHAPsfj x_tu6taKj6b)
                           (call-with-values
                             (lambda ()
                               (gen-syntax_TUQVuVaWx
                                 e_t6UOrvseR
                                 x_tu6taKj6b
                                 r_VthUJtaXq
                                 '()
                                 ellipsis?_Zow.heKSh))
                             (lambda (e_ARgDqtaYF maps_8XplPpaYG)
                               (regen_GLe5RmKwM e_ARgDqtaYF))))
                         tmp_128uyh7TFu)
                  (syntax-error e_t6UOrvseR)))
              ($syntax-dispatch
                (compile-in-annotation e_t6UOrvseR value)
                '(any any))))
           (source-wrap_LaBpzTrpx
             e_kpKSy.j5y
             w_180TK7YBnR
             s_tQ956haXr)))))
    (global-extend_CFNkgHSGG
      'core
      'lambda
      (lambda (e_QbjcwBbE4 r_JP5r.abE5 w_9UZw11C4x s_MnyWRktWp)
        ((lambda (tmp_o7MazjUm5)
           (if tmp_o7MazjUm5
             (apply (lambda (__IvUnfY2vf c_.EcDYlbEp)
                      (chi-lambda-clause_n2FPrLsAK
                        (source-wrap_LaBpzTrpx
                          e_QbjcwBbE4
                          w_9UZw11C4x
                          s_MnyWRktWp)
                        c_.EcDYlbEp
                        r_JP5r.abE5
                        w_9UZw11C4x
                        (lambda (vars_aFgOPUC43 body_TTfLoo2vv)
                          (if s_MnyWRktWp
                            (list 'compile-in-annotation
                                  (list 'lambda vars_aFgOPUC43 body_TTfLoo2vv)
                                  s_MnyWRktWp)
                            (list 'lambda vars_aFgOPUC43 body_TTfLoo2vv)))))
                    tmp_o7MazjUm5)
             (syntax-error e_QbjcwBbE4)))
         ($syntax-dispatch
           (compile-in-annotation e_QbjcwBbE4 value)
           '(any . any)))))
    (global-extend_CFNkgHSGG
      'core
      'letrec
      (lambda (e_CP8s6gtYo r_Ko1JGbUoQ w_rbQjxeLfI s_2He4UztYq)
        ((lambda (tmp_CpusY2Lff)
           (if tmp_CpusY2Lff
             (apply (lambda (__SGY7dUC7j
                             id_zoBDaabHU
                             val_OU77xctZc
                             e1_RBVmm3kQ4
                             e2_8UC11UC7n)
                      (if (not (valid-bound-ids?_F3ZGrRJG1 id_zoBDaabHU))
                        (invalid-ids-error_Oj3ohI0YU
                          (map (lambda (x_BfGY42A4)
                                 (wrap_15NDGTTrpt x_BfGY42A4 w_rbQjxeLfI))
                               id_zoBDaabHU)
                          (source-wrap_LaBpzTrpx
                            e_CP8s6gtYo
                            w_rbQjxeLfI
                            s_2He4UztYq)
                          '"bound variable")
                        ((lambda (new-vars_11VtWlA2yh labels_cLkO26bHl)
                           ((lambda (r_exlX4vUph w_WxBiXo2yp)
                              (build-letrec_QE8okkr9R
                                s_2He4UztYq
                                new-vars_11VtWlA2yh
                                (map (lambda (x_OZ8ZUzt.d)
                                       (chi_emzRIPszD
                                         x_OZ8ZUzt.d
                                         r_exlX4vUph
                                         w_WxBiXo2yp))
                                     val_OU77xctZc)
                                (chi-body_sNZTrMBIf
                                  (cons e1_RBVmm3kQ4 e2_8UC11UC7n)
                                  (source-wrap_LaBpzTrpx
                                    e_CP8s6gtYo
                                    w_WxBiXo2yp
                                    s_2He4UztYq)
                                  r_exlX4vUph
                                  w_WxBiXo2yp)))
                            (extend-var-env*_RS4q.99XC
                              labels_cLkO26bHl
                              new-vars_11VtWlA2yh
                              r_Ko1JGbUoQ)
                            (make-binding-wrap_7af0eB95y
                              id_zoBDaabHU
                              labels_cLkO26bHl
                              w_rbQjxeLfI)))
                         (map gen-var_hMLALSjrb id_zoBDaabHU)
                         (gen-labels_wwfl95As. id_zoBDaabHU))))
                    tmp_CpusY2Lff)
             (syntax-error
               (source-wrap_LaBpzTrpx
                 e_CP8s6gtYo
                 w_rbQjxeLfI
                 s_2He4UztYq))))
         ($syntax-dispatch
           (compile-in-annotation e_CP8s6gtYo value)
           '(any #2(each (any any)) any . each-any)))))
    (global-extend_CFNkgHSGG
      'core
      'if
      (lambda (e_ei2y9gt1m r_z47bj8t1n w_JD1R08t1n s_UsHS9uLjG)
        ((lambda (tmp_QKoqoHUs1)
           (if tmp_QKoqoHUs1
             (apply (lambda (__LeM5CNLlc test_8ltbT6Lle then_HijttaLlf)
                      (if s_UsHS9uLjG
                        (list 'compile-in-annotation
                              (list 'if
                                    (chi_emzRIPszD
                                      test_8ltbT6Lle
                                      r_z47bj8t1n
                                      w_JD1R08t1n)
                                    (chi_emzRIPszD
                                      then_HijttaLlf
                                      r_z47bj8t1n
                                      w_JD1R08t1n)
                                    (chi-void_WCRY8TsAV))
                              s_UsHS9uLjG)
                        (list 'if
                              (chi_emzRIPszD
                                test_8ltbT6Lle
                                r_z47bj8t1n
                                w_JD1R08t1n)
                              (chi_emzRIPszD
                                then_HijttaLlf
                                r_z47bj8t1n
                                w_JD1R08t1n)
                              (chi-void_WCRY8TsAV))))
                    tmp_QKoqoHUs1)
             ((lambda (tmp_iQ9zfukTw)
                (if tmp_iQ9zfukTw
                  (apply (lambda (__ztLH4Xt1S
                                  test_yqwU8KLjb
                                  then_Fvrw.bkTL
                                  else_14DDFWmkTM)
                           (if s_UsHS9uLjG
                             (list 'compile-in-annotation
                                   (list 'if
                                         (chi_emzRIPszD
                                           test_yqwU8KLjb
                                           r_z47bj8t1n
                                           w_JD1R08t1n)
                                         (chi_emzRIPszD
                                           then_Fvrw.bkTL
                                           r_z47bj8t1n
                                           w_JD1R08t1n)
                                         (chi_emzRIPszD
                                           else_14DDFWmkTM
                                           r_z47bj8t1n
                                           w_JD1R08t1n))
                                   s_UsHS9uLjG)
                             (list 'if
                                   (chi_emzRIPszD
                                     test_yqwU8KLjb
                                     r_z47bj8t1n
                                     w_JD1R08t1n)
                                   (chi_emzRIPszD
                                     then_Fvrw.bkTL
                                     r_z47bj8t1n
                                     w_JD1R08t1n)
                                   (chi_emzRIPszD
                                     else_14DDFWmkTM
                                     r_z47bj8t1n
                                     w_JD1R08t1n))))
                         tmp_iQ9zfukTw)
                  (syntax-error
                    (source-wrap_LaBpzTrpx
                      e_ei2y9gt1m
                      w_JD1R08t1n
                      s_UsHS9uLjG))))
              ($syntax-dispatch
                (compile-in-annotation e_ei2y9gt1m value)
                '(any any any any)))))
         ($syntax-dispatch
           (compile-in-annotation e_ei2y9gt1m value)
           '(any any any)))))
    (global-extend_CFNkgHSGG 'set! 'set! '())
    (global-extend_CFNkgHSGG 'begin 'begin '())
    (global-extend_CFNkgHSGG 'module-key 'module '())
    (global-extend_CFNkgHSGG 'import 'import '#f)
    (global-extend_CFNkgHSGG
      'import
      'import-only
      '#t)
    (global-extend_CFNkgHSGG 'define 'define '())
    (global-extend_CFNkgHSGG
      'define-syntax
      'define-syntax
      '())
    (global-extend_CFNkgHSGG
      'eval-when
      'eval-when
      '())
    (global-extend_CFNkgHSGG
      'core
      'syntax-case
      (letrec ((gen-syntax-case_oMRnjjkZV
                 (lambda (x_kKdHgU4LL
                          keys_pXS80zvbc
                          clauses_C.D9m7m24
                          r_1CykqfWCF)
                   (if (null? clauses_C.D9m7m24)
                     (list 'syntax-error x_kKdHgU4LL)
                     ((lambda (tmp_y15bc2dUa)
                        ((lambda (tmp_OJMvjddUp)
                           (if tmp_OJMvjddUp
                             (apply (lambda (pat_FVhX5Dvcy exp_1Q8mIzWD.)
                                      (if (if (id?_AEZ.eZJxY pat_FVhX5Dvcy)
                                            (if (not (bound-id-member?_ad1L5Hroo
                                                       pat_FVhX5Dvcy
                                                       keys_pXS80zvbc))
                                              (not (ellipsis?_Zow.heKSh
                                                     pat_FVhX5Dvcy))
                                              '#f)
                                            '#f)
                                        ((lambda (var_AAsGGqNum
                                                  label_bH9evIElc)
                                           (list (list 'lambda
                                                       (list var_AAsGGqNum)
                                                       (chi_emzRIPszD
                                                         exp_1Q8mIzWD.
                                                         (extend-env_EIDOV00On
                                                           label_bH9evIElc
                                                           (make-binding_CEIm66Jv6
                                                             'syntax
                                                             (cons var_AAsGGqNum
                                                                   '0))
                                                           r_1CykqfWCF)
                                                         (make-binding-wrap_7af0eB95y
                                                           (list pat_FVhX5Dvcy)
                                                           (list label_bH9evIElc)
                                                           '(()))))
                                                 x_kKdHgU4LL))
                                         (gen-var_hMLALSjrb pat_FVhX5Dvcy)
                                         (gen-label_LppBybSKb))
                                        (gen-clause_qdZmlVLpg
                                          x_kKdHgU4LL
                                          keys_pXS80zvbc
                                          (cdr clauses_C.D9m7m24)
                                          r_1CykqfWCF
                                          pat_FVhX5Dvcy
                                          '#t
                                          exp_1Q8mIzWD.)))
                                    tmp_OJMvjddUp)
                             ((lambda (tmp_tmzbKhEkT)
                                (if tmp_tmzbKhEkT
                                  (apply (lambda (pat_59itEuNtl
                                                  fender_jAv4qcvb4
                                                  exp_aMwcL84LE)
                                           (gen-clause_qdZmlVLpg
                                             x_kKdHgU4LL
                                             keys_pXS80zvbc
                                             (cdr clauses_C.D9m7m24)
                                             r_1CykqfWCF
                                             pat_59itEuNtl
                                             fender_jAv4qcvb4
                                             exp_aMwcL84LE))
                                         tmp_tmzbKhEkT)
                                  (syntax-error
                                    (car clauses_C.D9m7m24)
                                    '"invalid syntax-case clause")))
                              ($syntax-dispatch
                                (compile-in-annotation tmp_y15bc2dUa value)
                                '(any any any)))))
                         ($syntax-dispatch
                           (compile-in-annotation tmp_y15bc2dUa value)
                           '(any any))))
                      (car clauses_C.D9m7m24)))))
               (gen-clause_qdZmlVLpg
                 (lambda (x_3s5M1dDRg
                          keys_16XV4WdcqR
                          clauses_18Da.YkuI9
                          r_nn7LFbV8B
                          pat_OFkO2mlz2
                          fender_sH1fteM.t
                          exp_2LH93jlz3)
                   (call-with-values
                     (lambda ()
                       (convert-pattern_xDIa3zt7O
                         pat_OFkO2mlz2
                         keys_16XV4WdcqR))
                     (lambda (p_phQNNxcrs pvars_vxiykJcrt)
                       (if (not (distinct-bound-ids?_3Ll3afSPA
                                  (map car pvars_vxiykJcrt)))
                         (invalid-ids-error_Oj3ohI0YU
                           (map car pvars_vxiykJcrt)
                           pat_OFkO2mlz2
                           '"pattern variable")
                         (if (not (andmap
                                    (lambda (x_Lq3mVpdSK)
                                      (not (ellipsis?_Zow.heKSh
                                             (car x_Lq3mVpdSK))))
                                    pvars_vxiykJcrt))
                           (syntax-error
                             pat_OFkO2mlz2
                             '"misplaced ellipsis in syntax-case pattern")
                           ((lambda (y_s3SOkpcrO)
                              (list (list 'lambda
                                          (list y_s3SOkpcrO)
                                          (list 'if
                                                ((lambda (tmp_rehEXdDVA)
                                                   (if tmp_rehEXdDVA
                                                     (apply (lambda ()
                                                              y_s3SOkpcrO)
                                                            tmp_rehEXdDVA)
                                                     (list 'if
                                                           y_s3SOkpcrO
                                                           (build-dispatch-call_1rl1gdCg1
                                                             pvars_vxiykJcrt
                                                             fender_sH1fteM.t
                                                             y_s3SOkpcrO
                                                             r_nn7LFbV8B)
                                                           (list 'quote '#f))))
                                                 ($syntax-dispatch
                                                   (compile-in-annotation
                                                     fender_sH1fteM.t
                                                     value)
                                                   '#2(atom #t)))
                                                (build-dispatch-call_1rl1gdCg1
                                                  pvars_vxiykJcrt
                                                  exp_2LH93jlz3
                                                  y_s3SOkpcrO
                                                  r_nn7LFbV8B)
                                                (gen-syntax-case_oMRnjjkZV
                                                  x_3s5M1dDRg
                                                  keys_16XV4WdcqR
                                                  clauses_18Da.YkuI9
                                                  r_nn7LFbV8B)))
                                    (if (eq? p_phQNNxcrs 'any)
                                      (list 'list
                                            (cons 'compile-in-annotation
                                                  (cons x_3s5M1dDRg '(value))))
                                      (list '$syntax-dispatch
                                            (cons 'compile-in-annotation
                                                  (cons x_3s5M1dDRg '(value)))
                                            (list 'quote p_phQNNxcrs)))))
                            (gen-var_hMLALSjrb 'tmp))))))))
               (build-dispatch-call_1rl1gdCg1
                 (lambda (pvars_19nnWJKlp3
                          exp_p5cw6o37N
                          y_7s4IIpDHn
                          r_JesWw1DHo)
                   ((lambda (levels_Hp33llcg6 ids_14Xakbdcg5)
                      ((lambda (new-vars_URgMDBDHG labels_xWUeNMDHF)
                         (list 'apply
                               (list 'lambda
                                     new-vars_URgMDBDHG
                                     (chi_emzRIPszD
                                       exp_p5cw6o37N
                                       (extend-env*_YcveBYAn.
                                         labels_xWUeNMDHF
                                         (map (lambda (var_6sDezHuA8
                                                       level_fWWK3439J)
                                                (make-binding_CEIm66Jv6
                                                  'syntax
                                                  (cons var_6sDezHuA8
                                                        level_fWWK3439J)))
                                              new-vars_URgMDBDHG
                                              (map cdr pvars_19nnWJKlp3))
                                         r_JesWw1DHo)
                                       (make-binding-wrap_7af0eB95y
                                         ids_14Xakbdcg5
                                         labels_xWUeNMDHF
                                         '(()))))
                               y_7s4IIpDHn))
                       (map gen-var_hMLALSjrb ids_14Xakbdcg5)
                       (gen-labels_wwfl95As. ids_14Xakbdcg5)))
                    (map cdr pvars_19nnWJKlp3)
                    (map car pvars_19nnWJKlp3))))
               (convert-pattern_xDIa3zt7O
                 (lambda (pattern_UABEA4tlZ keys_NAh3bw2Vz)
                   (letrec ((cvt_rVTafM2VL
                              (lambda (p_o6ZAxykfx n_xIOEHECxQ ids_3HUZ0w2Yh)
                                (if (id?_AEZ.eZJxY p_o6ZAxykfx)
                                  (if (bound-id-member?_ad1L5Hroo
                                        p_o6ZAxykfx
                                        keys_NAh3bw2Vz)
                                    (values
                                      (vector 'free-id p_o6ZAxykfx)
                                      ids_3HUZ0w2Yh)
                                    (values
                                      'any
                                      (cons (cons p_o6ZAxykfx n_xIOEHECxQ)
                                            ids_3HUZ0w2Yh)))
                                  ((lambda (tmp_17jC4l7kfQ)
                                     (if (if tmp_17jC4l7kfQ
                                           (apply (lambda (x_8P4YJBDG2
                                                           dots_PwmWXGMPg)
                                                    (ellipsis?_Zow.heKSh
                                                      dots_PwmWXGMPg))
                                                  tmp_17jC4l7kfQ)
                                           '#f)
                                       (apply (lambda (x_ysYeyIDEu
                                                       dots_12K3JRUDEv)
                                                (call-with-values
                                                  (lambda ()
                                                    (cvt_rVTafM2VL
                                                      x_ysYeyIDEu
                                                      (+ n_xIOEHECxQ '1)
                                                      ids_3HUZ0w2Yh))
                                                  (lambda (p_xODsZFceO
                                                           ids_cHJwkY35G)
                                                    (values
                                                      (if (eq? p_xODsZFceO
                                                               'any)
                                                        'each-any
                                                        (vector
                                                          'each
                                                          p_xODsZFceO))
                                                      ids_cHJwkY35G))))
                                              tmp_17jC4l7kfQ)
                                       ((lambda (tmp_9AEgKpb6X)
                                          (if (if tmp_9AEgKpb6X
                                                (apply (lambda (x_16JLTyo34H
                                                                dots_dGaCCNcdR
                                                                y_XpzcsSlm4
                                                                z_emqF9pcdX)
                                                         (ellipsis?_Zow.heKSh
                                                           dots_dGaCCNcdR))
                                                       tmp_9AEgKpb6X)
                                                '#f)
                                            (apply (lambda (x_Ih1XRPts.
                                                            dots_Jitq0xCB9
                                                            y_SGY7dUCBa
                                                            z_11D4Pw0ts2)
                                                     (call-with-values
                                                       (lambda ()
                                                         (cvt_rVTafM2VL
                                                           z_11D4Pw0ts2
                                                           n_xIOEHECxQ
                                                           ids_3HUZ0w2Yh))
                                                       (lambda (z_JMW7P7UUY
                                                                ids_5h3qpxbbj)
                                                         (call-with-values
                                                           (lambda ()
                                                             (cvt*_4ll3Dvtl5
                                                               y_SGY7dUCBa
                                                               n_xIOEHECxQ
                                                               ids_5h3qpxbbj))
                                                           (lambda (y_noDXB7UUL
                                                                    ids_JP0QIs22V)
                                                             (call-with-values
                                                               (lambda ()
                                                                 (cvt_rVTafM2VL
                                                                   x_Ih1XRPts.
                                                                   (+ n_xIOEHECxQ
                                                                      '1)
                                                                   ids_JP0QIs22V))
                                                               (lambda (x_SnR1DhDDk
                                                                        ids_NGfH83VVD)
                                                                 (values
                                                                   (vector
                                                                     'each+
                                                                     x_SnR1DhDDk
                                                                     (reverse
                                                                       y_noDXB7UUL)
                                                                     z_JMW7P7UUY)
                                                                   ids_NGfH83VVD))))))))
                                                   tmp_9AEgKpb6X)
                                            ((lambda (tmp_gHEeCjUPG)
                                               (if tmp_gHEeCjUPG
                                                 (apply (lambda (x_hCVgZmLIG
                                                                 y_HHrhGstqp)
                                                          (call-with-values
                                                            (lambda ()
                                                              (cvt_rVTafM2VL
                                                                y_HHrhGstqp
                                                                n_xIOEHECxQ
                                                                ids_3HUZ0w2Yh))
                                                            (lambda (y_wUJp0820w
                                                                     ids_X7fHV.USo)
                                                              (call-with-values
                                                                (lambda ()
                                                                  (cvt_rVTafM2VL
                                                                    x_hCVgZmLIG
                                                                    n_xIOEHECxQ
                                                                    ids_X7fHV.USo))
                                                                (lambda (x_ByBxB9CBF
                                                                         ids_eUMVgstsx)
                                                                  (values
                                                                    (cons x_ByBxB9CBF
                                                                          y_wUJp0820w)
                                                                    ids_eUMVgstsx))))))
                                                        tmp_gHEeCjUPG)
                                                 ((lambda (tmp_wXXXA0toh)
                                                    (if tmp_wXXXA0toh
                                                      (apply (lambda ()
                                                               (values
                                                                 '()
                                                                 ids_3HUZ0w2Yh))
                                                             tmp_wXXXA0toh)
                                                      ((lambda (tmp_AQQ2Lfkgh)
                                                         (if tmp_AQQ2Lfkgh
                                                           (apply (lambda (x_vGqvsjkgO)
                                                                    (call-with-values
                                                                      (lambda ()
                                                                        (cvt_rVTafM2VL
                                                                          x_vGqvsjkgO
                                                                          n_xIOEHECxQ
                                                                          ids_3HUZ0w2Yh))
                                                                      (lambda (p_nxLUJI2.c
                                                                               ids_71dxSctqE)
                                                                        (values
                                                                          (vector
                                                                            'vector
                                                                            p_nxLUJI2.c)
                                                                          ids_71dxSctqE))))
                                                                  tmp_AQQ2Lfkgh)
                                                           (values
                                                             (vector
                                                               'atom
                                                               (strip_1ln0rNKSx
                                                                 p_o6ZAxykfx
                                                                 '(())))
                                                             ids_3HUZ0w2Yh)))
                                                       ($syntax-dispatch
                                                         (compile-in-annotation
                                                           p_o6ZAxykfx
                                                           value)
                                                         '#2(vector
                                                             each-any)))))
                                                  ($syntax-dispatch
                                                    (compile-in-annotation
                                                      p_o6ZAxykfx
                                                      value)
                                                    '()))))
                                             ($syntax-dispatch
                                               (compile-in-annotation
                                                 p_o6ZAxykfx
                                                 value)
                                               '(any . any)))))
                                        ($syntax-dispatch
                                          (compile-in-annotation
                                            p_o6ZAxykfx
                                            value)
                                          '(any any . #4(each+ any () any))))))
                                   ($syntax-dispatch
                                     (compile-in-annotation p_o6ZAxykfx value)
                                     '(any any))))))
                            (cvt*_4ll3Dvtl5
                              (lambda (p*_PbFjpECvv n_kh3Lr.kde ids_Ik34tstmo)
                                (if (null? p*_PbFjpECvv)
                                  (values '() ids_Ik34tstmo)
                                  (call-with-values
                                    (lambda ()
                                      (cvt*_4ll3Dvtl5
                                        (cdr p*_PbFjpECvv)
                                        n_kh3Lr.kde
                                        ids_Ik34tstmo))
                                    (lambda (y_vrpo8mLEp ids_rww2BMCvh)
                                      (call-with-values
                                        (lambda ()
                                          (cvt_rVTafM2VL
                                            (car p*_PbFjpECvv)
                                            n_kh3Lr.kde
                                            ids_rww2BMCvh))
                                        (lambda (x_zymlFYCwX ids_tB85hSkeG)
                                          (values
                                            (cons x_zymlFYCwX y_vrpo8mLEp)
                                            ids_tB85hSkeG)))))))))
                     (cvt_rVTafM2VL pattern_UABEA4tlZ '0 '())))))
        (lambda (e_fuQw0pbR.
                 r_jPOsmrUzJ
                 w_P050S5Chs
                 s_16yHNXM2IU)
          ((lambda (e_c0DzQdChA)
             ((lambda (tmp_VpgpeZbRD)
                (if tmp_VpgpeZbRD
                  (apply (lambda (__iF0SmabRE
                                  val_C6xzVQ2IA
                                  key_3UYPmU2IB
                                  m_ZmrEgMChb)
                           (if (andmap
                                 (lambda (x_16iFpgtb2Y)
                                   (if (id?_AEZ.eZJxY x_16iFpgtb2Y)
                                     (not (ellipsis?_Zow.heKSh x_16iFpgtb2Y))
                                     '#f))
                                 key_3UYPmU2IB)
                             ((lambda (x_533j4BCiw)
                                (if s_16yHNXM2IU
                                  (list 'compile-in-annotation
                                        (list (list 'lambda
                                                    (list x_533j4BCiw)
                                                    (gen-syntax-case_oMRnjjkZV
                                                      x_533j4BCiw
                                                      key_3UYPmU2IB
                                                      m_ZmrEgMChb
                                                      r_jPOsmrUzJ))
                                              (chi_emzRIPszD
                                                val_C6xzVQ2IA
                                                r_jPOsmrUzJ
                                                '(())))
                                        s_16yHNXM2IU)
                                  (list (list 'lambda
                                              (list x_533j4BCiw)
                                              (gen-syntax-case_oMRnjjkZV
                                                x_533j4BCiw
                                                key_3UYPmU2IB
                                                m_ZmrEgMChb
                                                r_jPOsmrUzJ))
                                        (chi_emzRIPszD
                                          val_C6xzVQ2IA
                                          r_jPOsmrUzJ
                                          '(())))))
                              (gen-var_hMLALSjrb 'tmp))
                             (syntax-error
                               e_c0DzQdChA
                               '"invalid literals list in")))
                         tmp_VpgpeZbRD)
                  (syntax-error e_c0DzQdChA)))
              ($syntax-dispatch
                (compile-in-annotation e_c0DzQdChA value)
                '(any any each-any . each-any))))
           (source-wrap_LaBpzTrpx
             e_fuQw0pbR.
             w_P050S5Chs
             s_16yHNXM2IU)))))
    (set! sc-expand
      ((lambda (user-ribcage_12.55xcvp3)
         ((lambda (user-top-wrap_wR8vaTWQC)
            (lambda (x_kZeH5jWQQ . c/rtem_15wAyrQEyx)
              (if (if (pair? x_kZeH5jWQQ)
                    (equal? (car x_kZeH5jWQQ) '"noexpand")
                    '#f)
                (cadr x_kZeH5jWQQ)
                (if (null? c/rtem_15wAyrQEyx)
                  (chi-top_gUdU1LTVI
                    x_kZeH5jWQQ
                    '()
                    user-top-wrap_wR8vaTWQC
                    '(l c)
                    '(l)
                    user-ribcage_12.55xcvp3)
                  (chi-top_gUdU1LTVI
                    x_kZeH5jWQQ
                    '()
                    user-top-wrap_wR8vaTWQC
                    (car c/rtem_15wAyrQEyx)
                    (cadr c/rtem_15wAyrQEyx)
                    user-ribcage_12.55xcvp3)))))
          (make-wrap_11O4kRWi7j
            (wrap-marks_KA6c9HSHW '((top)))
            (cons user-ribcage_12.55xcvp3
                  (wrap-subst_Kj.SjPSHZ '((top)))))))
       ((lambda (ribcage_bk0EqBEB3)
          (begin
            (extend-ribcage-subst!_9ETy31AwG
              ribcage_bk0EqBEB3
              '*top*)
            ribcage_bk0EqBEB3))
        (make-ribcage_3Q97Hvrjd '() '() '()))))
    (set! identifier?
      (lambda (x_mW1yCw42e)
        (nonsymbol-id?_4NX5Kfi6a x_mW1yCw42e)))
    (set! datum->syntax-object
      (lambda (id_11yULBddbN datum_4pXllEECe)
        (begin
          (if (not (nonsymbol-id?_4NX5Kfi6a id_11yULBddbN))
            (error-hook_3mDX7JJgZ
              'datum->syntax-object
              '"invalid argument"
              id_11yULBddbN)
            (void))
          (make-syntax-object_ZCTCCii2o
            datum_4pXllEECe
            (syntax-object-wrap_DJHTz7SC8 id_11yULBddbN)))))
    (set! syntax-object->datum
      (lambda (x_1LTHw4vud)
        (strip_1ln0rNKSx x_1LTHw4vud '(()))))
    (set! generate-temporaries
      (lambda (ls_11kU8FGmmt)
        (begin
          (if (not (list? ls_11kU8FGmmt))
            (error-hook_3mDX7JJgZ
              'generate-temporaries
              '"invalid argument"
              ls_11kU8FGmmt)
            (void))
          (map (lambda (x_dfrMPw55c)
                 (wrap_15NDGTTrpt (gensym) '((top))))
               ls_11kU8FGmmt))))
    (set! free-identifier=?
      (lambda (x_MyGEJFFFu y_o6kc2c55W)
        (begin
          (if (not (nonsymbol-id?_4NX5Kfi6a x_MyGEJFFFu))
            (error-hook_3mDX7JJgZ
              'free-identifier=?
              '"invalid argument"
              x_MyGEJFFFu)
            (void))
          (if (not (nonsymbol-id?_4NX5Kfi6a y_o6kc2c55W))
            (error-hook_3mDX7JJgZ
              'free-identifier=?
              '"invalid argument"
              y_o6kc2c55W)
            (void))
          (free-id=?_de9nIHrou x_MyGEJFFFu y_o6kc2c55W))))
    (set! bound-identifier=?
      (lambda (x_0cyT4owy6 y_29COzBFHg)
        (begin
          (if (not (nonsymbol-id?_4NX5Kfi6a x_0cyT4owy6))
            (error-hook_3mDX7JJgZ
              'bound-identifier=?
              '"invalid argument"
              x_0cyT4owy6)
            (void))
          (if (not (nonsymbol-id?_4NX5Kfi6a y_29COzBFHg))
            (error-hook_3mDX7JJgZ
              'bound-identifier=?
              '"invalid argument"
              y_29COzBFHg)
            (void))
          (bound-id=?_2xo8.WSP3 x_0cyT4owy6 y_29COzBFHg))))
    (set! literal-identifier=?
      (lambda (x_XpdAXdFJZ y_8ncVoVeiz)
        (begin
          (if (not (nonsymbol-id?_4NX5Kfi6a x_XpdAXdFJZ))
            (error-hook_3mDX7JJgZ
              'literal-identifier=?
              '"invalid argument"
              x_XpdAXdFJZ)
            (void))
          (if (not (nonsymbol-id?_4NX5Kfi6a y_8ncVoVeiz))
            (error-hook_3mDX7JJgZ
              'literal-identifier=?
              '"invalid argument"
              y_8ncVoVeiz)
            (void))
          (literal-id=?_IORoNHroz x_XpdAXdFJZ y_8ncVoVeiz))))
    (set! syntax-error
      (lambda (object_Dcv5nReji . messages_UTqJWLX1.)
        (begin
          (for-each
            (lambda (x_fKitmXX2i)
              (if (not (string? x_fKitmXX2i))
                (error-hook_3mDX7JJgZ
                  'syntax-error
                  '"invalid argument"
                  x_fKitmXX2i)
                (void)))
            messages_UTqJWLX1.)
          ((lambda (message_nN.4f7nuD)
             (error-hook_3mDX7JJgZ
               '#f
               message_nN.4f7nuD
               (strip_1ln0rNKSx object_Dcv5nReji '(()))))
           (if (null? messages_UTqJWLX1.)
             '"invalid syntax"
             (apply string-append messages_UTqJWLX1.))))))
    (letrec ((match_xO3GM15dS
               (lambda (e_bmaBJLXsC p_cieA.qnT3 w_7KC05ow1d r_TXzE.IFan)
                 (if (not r_TXzE.IFan)
                   '#f
                   (if (eq? p_cieA.qnT3 'any)
                     (cons (wrap_15NDGTTrpt e_bmaBJLXsC w_7KC05ow1d)
                           r_TXzE.IFan)
                     (if (syntax-object?_PiqwpY0La e_bmaBJLXsC)
                       (match*_vwzcHOOWv
                         ((lambda (e_wAGaXteL2)
                            (if (annotation? e_wAGaXteL2)
                              (annotation-expression e_wAGaXteL2)
                              e_wAGaXteL2))
                          (syntax-object-expression_K1xadx9Um e_bmaBJLXsC))
                         p_cieA.qnT3
                         (join-wraps_f3DJEyieU
                           w_7KC05ow1d
                           (syntax-object-wrap_DJHTz7SC8 e_bmaBJLXsC))
                         r_TXzE.IFan)
                       (match*_vwzcHOOWv
                         (if (annotation? e_bmaBJLXsC)
                           (annotation-expression e_bmaBJLXsC)
                           e_bmaBJLXsC)
                         p_cieA.qnT3
                         w_7KC05ow1d
                         r_TXzE.IFan))))))
             (match*_vwzcHOOWv
               (lambda (e_1uiyC8wV3 p_aOByMBeDN w_ZUz6yHwV4 r_4PGPf2Ocn)
                 (if (null? p_aOByMBeDN)
                   (if (null? e_1uiyC8wV3) r_4PGPf2Ocn '#f)
                   (if (pair? p_aOByMBeDN)
                     (if (pair? e_1uiyC8wV3)
                       (match_xO3GM15dS
                         (car e_1uiyC8wV3)
                         (car p_aOByMBeDN)
                         w_ZUz6yHwV4
                         (match_xO3GM15dS
                           (cdr e_1uiyC8wV3)
                           (cdr p_aOByMBeDN)
                           w_ZUz6yHwV4
                           r_4PGPf2Ocn))
                       '#f)
                     (if (eq? p_aOByMBeDN 'each-any)
                       ((lambda (l_aavsx8w.a)
                          (if l_aavsx8w.a
                            (cons l_aavsx8w.a r_4PGPf2Ocn)
                            '#f))
                        (match-each-any_9OO5fnnvL
                          e_1uiyC8wV3
                          w_ZUz6yHwV4))
                       ((lambda (t_I6PFINeDe)
                          (if (memv t_I6PFINeDe '(each))
                            (if (null? e_1uiyC8wV3)
                              (match-empty_5kEYmWnvT
                                (vector-ref p_aOByMBeDN '1)
                                r_4PGPf2Ocn)
                              ((lambda (r*_Hq6KKnQ4)
                                 (if r*_Hq6KKnQ4
                                   (combine_z7VTZw5dH r*_Hq6KKnQ4 r_4PGPf2Ocn)
                                   '#f))
                               (match-each_NJ7CdhFNS
                                 e_1uiyC8wV3
                                 (vector-ref p_aOByMBeDN '1)
                                 w_ZUz6yHwV4)))
                            (if (memv t_I6PFINeDe '(free-id))
                              (if (id?_AEZ.eZJxY e_1uiyC8wV3)
                                (if (literal-id=?_IORoNHroz
                                      (wrap_15NDGTTrpt e_1uiyC8wV3 w_ZUz6yHwV4)
                                      (vector-ref p_aOByMBeDN '1))
                                  r_4PGPf2Ocn
                                  '#f)
                                '#f)
                              (if (memv t_I6PFINeDe '(each+))
                                (call-with-values
                                  (lambda ()
                                    (match-each+_uLAHTCnvF
                                      e_1uiyC8wV3
                                      (vector-ref p_aOByMBeDN '1)
                                      (vector-ref p_aOByMBeDN '2)
                                      (vector-ref p_aOByMBeDN '3)
                                      w_ZUz6yHwV4
                                      r_4PGPf2Ocn))
                                  (lambda (xr*_JIVwP6eFp
                                           y-pat_lZGae15wi
                                           r_17if4YBF5S)
                                    (if r_17if4YBF5S
                                      (if (null? y-pat_lZGae15wi)
                                        (if (null? xr*_JIVwP6eFp)
                                          (match-empty_5kEYmWnvT
                                            (vector-ref p_aOByMBeDN '1)
                                            r_17if4YBF5S)
                                          (combine_z7VTZw5dH
                                            xr*_JIVwP6eFp
                                            r_17if4YBF5S))
                                        '#f)
                                      '#f)))
                                (if (memv t_I6PFINeDe '(atom))
                                  (if (equal?
                                        (vector-ref p_aOByMBeDN '1)
                                        (strip_1ln0rNKSx
                                          e_1uiyC8wV3
                                          w_ZUz6yHwV4))
                                    r_4PGPf2Ocn
                                    '#f)
                                  (if (memv t_I6PFINeDe '(vector))
                                    (if (vector? e_1uiyC8wV3)
                                      (match_xO3GM15dS
                                        (vector->list e_1uiyC8wV3)
                                        (vector-ref p_aOByMBeDN '1)
                                        w_ZUz6yHwV4
                                        r_4PGPf2Ocn)
                                      '#f)
                                    (void)))))))
                        (vector-ref p_aOByMBeDN '0)))))))
             (combine_z7VTZw5dH
               (lambda (r*_K.sPb55tt r_I7yDtQF23)
                 (if (null? (car r*_K.sPb55tt))
                   r_I7yDtQF23
                   (cons (map car r*_K.sPb55tt)
                         (combine_z7VTZw5dH
                           (map cdr r*_K.sPb55tt)
                           r_I7yDtQF23)))))
             (match-empty_5kEYmWnvT
               (lambda (p_GoLpTbnHd r_18A9TlHwQn)
                 (if (null? p_GoLpTbnHd)
                   r_18A9TlHwQn
                   (if (eq? p_GoLpTbnHd 'any)
                     (cons '() r_18A9TlHwQn)
                     (if (pair? p_GoLpTbnHd)
                       (match-empty_5kEYmWnvT
                         (car p_GoLpTbnHd)
                         (match-empty_5kEYmWnvT
                           (cdr p_GoLpTbnHd)
                           r_18A9TlHwQn))
                       (if (eq? p_GoLpTbnHd 'each-any)
                         (cons '() r_18A9TlHwQn)
                         ((lambda (t_STTTwo5qq)
                            (if (memv t_STTTwo5qq '(each))
                              (match-empty_5kEYmWnvT
                                (vector-ref p_GoLpTbnHd '1)
                                r_18A9TlHwQn)
                              (if (memv t_STTTwo5qq '(each+))
                                (match-empty_5kEYmWnvT
                                  (vector-ref p_GoLpTbnHd '1)
                                  (match-empty_5kEYmWnvT
                                    (reverse (vector-ref p_GoLpTbnHd '2))
                                    (match-empty_5kEYmWnvT
                                      (vector-ref p_GoLpTbnHd '3)
                                      r_18A9TlHwQn)))
                                (if (memv t_STTTwo5qq '(free-id atom))
                                  r_18A9TlHwQn
                                  (if (memv t_STTTwo5qq '(vector))
                                    (match-empty_5kEYmWnvT
                                      (vector-ref p_GoLpTbnHd '1)
                                      r_18A9TlHwQn)
                                    (void))))))
                          (vector-ref p_GoLpTbnHd '0))))))))
             (match-each-any_9OO5fnnvL
               (lambda (e_GopqvFFXs w_0dQE355nU)
                 (if (annotation? e_GopqvFFXs)
                   (match-each-any_9OO5fnnvL
                     (annotation-expression e_GopqvFFXs)
                     w_0dQE355nU)
                   (if (pair? e_GopqvFFXs)
                     ((lambda (l_N62gIzXfE)
                        (if l_N62gIzXfE
                          (cons (wrap_15NDGTTrpt (car e_GopqvFFXs) w_0dQE355nU)
                                l_N62gIzXfE)
                          '#f))
                      (match-each-any_9OO5fnnvL
                        (cdr e_GopqvFFXs)
                        w_0dQE355nU))
                     (if (null? e_GopqvFFXs)
                       '()
                       (if (syntax-object?_PiqwpY0La e_GopqvFFXs)
                         (match-each-any_9OO5fnnvL
                           (syntax-object-expression_K1xadx9Um e_GopqvFFXs)
                           (join-wraps_f3DJEyieU
                             w_0dQE355nU
                             (syntax-object-wrap_DJHTz7SC8 e_GopqvFFXs)))
                         '#f))))))
             (match-each+_uLAHTCnvF
               (lambda (e_118YRJBFTV
                        x-pat_19lemis5jm
                        y-pat_okc0idFTX
                        z-pat_z9dEYdFTX
                        w_rvJ5G85jo
                        r_Do4LNhesy)
                 ((letrec ((f_FdYPUUFT7
                             (lambda (e_ujRlJXwK1 w_hYCgofXat)
                               (if (pair? e_ujRlJXwK1)
                                 (call-with-values
                                   (lambda ()
                                     (f_FdYPUUFT7
                                       (cdr e_ujRlJXwK1)
                                       w_hYCgofXat))
                                   (lambda (xr*_gsDSW15kk
                                            y-pat_r4SiIPXcc
                                            r_12xM4Fpeuv)
                                     (if r_12xM4Fpeuv
                                       (if (null? y-pat_r4SiIPXcc)
                                         ((lambda (xr_14Kw4u55mB)
                                            (if xr_14Kw4u55mB
                                              (values
                                                (cons xr_14Kw4u55mB
                                                      xr*_gsDSW15kk)
                                                y-pat_r4SiIPXcc
                                                r_12xM4Fpeuv)
                                              (values '#f '#f '#f)))
                                          (match_xO3GM15dS
                                            (car e_ujRlJXwK1)
                                            x-pat_19lemis5jm
                                            w_hYCgofXat
                                            '()))
                                         (values
                                           '()
                                           (cdr y-pat_r4SiIPXcc)
                                           (match_xO3GM15dS
                                             (car e_ujRlJXwK1)
                                             (car y-pat_r4SiIPXcc)
                                             w_hYCgofXat
                                             r_12xM4Fpeuv)))
                                       (values '#f '#f '#f))))
                                 (if (annotation? e_ujRlJXwK1)
                                   (f_FdYPUUFT7
                                     (annotation-expression e_ujRlJXwK1)
                                     w_hYCgofXat)
                                   (if (syntax-object?_PiqwpY0La e_ujRlJXwK1)
                                     (f_FdYPUUFT7
                                       (syntax-object-expression_K1xadx9Um
                                         e_ujRlJXwK1)
                                       (join-wraps_f3DJEyieU
                                         w_hYCgofXat
                                         (syntax-object-wrap_DJHTz7SC8
                                           e_ujRlJXwK1)))
                                     (values
                                       '()
                                       y-pat_okc0idFTX
                                       (match_xO3GM15dS
                                         e_ujRlJXwK1
                                         z-pat_z9dEYdFTX
                                         w_hYCgofXat
                                         r_Do4LNhesy))))))))
                    f_FdYPUUFT7)
                  e_118YRJBFTV
                  w_rvJ5G85jo)))
             (match-each_NJ7CdhFNS
               (lambda (e_CMgx22OZz p_3mQKXRep0 w_1ElhlTwHj)
                 (if (annotation? e_CMgx22OZz)
                   (match-each_NJ7CdhFNS
                     (annotation-expression e_CMgx22OZz)
                     p_3mQKXRep0
                     w_1ElhlTwHj)
                   (if (pair? e_CMgx22OZz)
                     ((lambda (first_jHUi2ZeqX)
                        (if first_jHUi2ZeqX
                          ((lambda (rest_8K7HEVO.L)
                             (if rest_8K7HEVO.L
                               (cons first_jHUi2ZeqX rest_8K7HEVO.L)
                               '#f))
                           (match-each_NJ7CdhFNS
                             (cdr e_CMgx22OZz)
                             p_3mQKXRep0
                             w_1ElhlTwHj))
                          '#f))
                      (match_xO3GM15dS
                        (car e_CMgx22OZz)
                        p_3mQKXRep0
                        w_1ElhlTwHj
                        '()))
                     (if (null? e_CMgx22OZz)
                       '()
                       (if (syntax-object?_PiqwpY0La e_CMgx22OZz)
                         (match-each_NJ7CdhFNS
                           (syntax-object-expression_K1xadx9Um e_CMgx22OZz)
                           p_3mQKXRep0
                           (join-wraps_f3DJEyieU
                             w_1ElhlTwHj
                             (syntax-object-wrap_DJHTz7SC8 e_CMgx22OZz)))
                         '#f)))))))
      (set! $syntax-dispatch
        (lambda (e_Vegx2bnwx p_MRICqZenp)
          (if (eq? p_MRICqZenp 'any)
            (list e_Vegx2bnwx)
            (if (syntax-object?_PiqwpY0La e_Vegx2bnwx)
              (match*_vwzcHOOWv
                ((lambda (e_18k8wEpFPb)
                   (if (annotation? e_18k8wEpFPb)
                     (annotation-expression e_18k8wEpFPb)
                     e_18k8wEpFPb))
                 (syntax-object-expression_K1xadx9Um e_Vegx2bnwx))
                p_MRICqZenp
                (syntax-object-wrap_DJHTz7SC8 e_Vegx2bnwx)
                '())
              (match*_vwzcHOOWv
                (if (annotation? e_Vegx2bnwx)
                  (annotation-expression e_Vegx2bnwx)
                  e_Vegx2bnwx)
                p_MRICqZenp
                '(())
                '()))))))))
($sc-put-cte
  'with-syntax
  (lambda (x_sZpliOyHD)
    ((lambda (tmp_16I1UNlQ.4)
       (if tmp_16I1UNlQ.4
         (apply (lambda (__MUey6FpAS e1_bTAHmKyJ0 e2_FrCssWZ9s)
                  (cons '#3(syntax-object
                            begin
                            ((top)
                             #4(ribcage #3(_ e1 e2) #3((top)) #3("i" "i" "i"))
                             #4(ribcage ())
                             #4(ribcage #1(x) #1((top)) #1("i"))
                             #4(ribcage (#2(import-token *top*)) ())))
                        (cons e1_bTAHmKyJ0 e2_FrCssWZ9s)))
                tmp_16I1UNlQ.4)
         ((lambda (tmp_16sr7LhQ.e)
            (if tmp_16sr7LhQ.e
              (apply (lambda (__ZCTCCjyIH
                              out_Sb3XgBpzz
                              in_eukPsT7ii
                              e1_pXdLwepAA
                              e2_RmYYPlQ01)
                       (list '#3(syntax-object
                                 syntax-case
                                 ((top)
                                  #4(ribcage
                                     #5(_ out in e1 e2)
                                     #5((top))
                                     #5("i" "i" "i" "i" "i"))
                                  #4(ribcage ())
                                  #4(ribcage #1(x) #1((top)) #1("i"))
                                  #4(ribcage (#2(import-token *top*)) ())))
                             in_eukPsT7ii
                             '()
                             (list out_Sb3XgBpzz
                                   (cons '#3(syntax-object
                                             begin
                                             ((top)
                                              #4(ribcage
                                                 #5(_ out in e1 e2)
                                                 #5((top))
                                                 #5("i" "i" "i" "i" "i"))
                                              #4(ribcage ())
                                              #4(ribcage
                                                 #1(x)
                                                 #1((top))
                                                 #1("i"))
                                              #4(ribcage
                                                 (#2(import-token *top*))
                                                 ()
                                                 ())))
                                         (cons e1_pXdLwepAA e2_RmYYPlQ01)))))
                     tmp_16sr7LhQ.e)
              ((lambda (tmp_U4368qZ8E)
                 (if tmp_U4368qZ8E
                   (apply (lambda (__EETkEtQ.w
                                   out_b7ii4lQ.x
                                   in_22Io.T7hQ
                                   e1_607Gd9gqZ
                                   e2_9ndOToHRq)
                            (list '#3(syntax-object
                                      syntax-case
                                      ((top)
                                       #4(ribcage
                                          #5(_ out in e1 e2)
                                          #5((top))
                                          #5("i" "i" "i" "i" "i"))
                                       #4(ribcage ())
                                       #4(ribcage #1(x) #1((top)) #1("i"))
                                       #4(ribcage
                                          (#2(import-token *top*))
                                          ()
                                          ())))
                                  (cons '#3(syntax-object
                                            list
                                            ((top)
                                             #4(ribcage
                                                #5(_ out in e1 e2)
                                                #5((top))
                                                #5("i" "i" "i" "i" "i"))
                                             #4(ribcage ())
                                             #4(ribcage
                                                #1(x)
                                                #1((top))
                                                #1("i"))
                                             #4(ribcage
                                                (#2(import-token *top*))
                                                ()
                                                ())))
                                        in_22Io.T7hQ)
                                  '()
                                  (list out_b7ii4lQ.x
                                        (cons '#3(syntax-object
                                                  begin
                                                  ((top)
                                                   #4(ribcage
                                                      #5(_ out in e1 e2)
                                                      #5((top))
                                                      #5("i" "i" "i" "i" "i"))
                                                   #4(ribcage ())
                                                   #4(ribcage
                                                      #1(x)
                                                      #1((top))
                                                      #1("i"))
                                                   #4(ribcage
                                                      (#2(import-token *top*))
                                                      ()
                                                      ())))
                                              (cons e1_607Gd9gqZ
                                                    e2_9ndOToHRq)))))
                          tmp_U4368qZ8E)
                   (syntax-error x_sZpliOyHD)))
               ($syntax-dispatch
                 (compile-in-annotation x_sZpliOyHD value)
                 '(any #2(each (any any)) any . each-any)))))
          ($syntax-dispatch
            (compile-in-annotation x_sZpliOyHD value)
            '(any ((any any)) any . each-any)))))
     ($syntax-dispatch
       (compile-in-annotation x_sZpliOyHD value)
       '(any () any . each-any)))))
($sc-put-cte
  'syntax-rules
  (lambda (x_g8OG3P7mm)
    ((lambda (tmp_zt7GttpFV)
       (if tmp_zt7GttpFV
         (apply (lambda (__nXpNnogwO
                         k_frx0hYQ5o
                         keyword_EE1wcT7nG
                         pattern_RBhmKAgwQ
                         template_18BjsMZZez)
                  (list '#3(syntax-object
                            lambda
                            ((top)
                             #4(ribcage
                                #5(_ k keyword pattern template)
                                #5((top))
                                #5("i" "i" "i" "i" "i"))
                             #4(ribcage ())
                             #4(ribcage #1(x) #1((top)) #1("i"))
                             #4(ribcage (#2(import-token *top*)) ())))
                        '#3(syntax-object
                            (x)
                            ((top)
                             #4(ribcage
                                #5(_ k keyword pattern template)
                                #5((top))
                                #5("i" "i" "i" "i" "i"))
                             #4(ribcage ())
                             #4(ribcage #1(x) #1((top)) #1("i"))
                             #4(ribcage (#2(import-token *top*)) ())))
                        (cons '#3(syntax-object
                                  syntax-case
                                  ((top)
                                   #4(ribcage
                                      #5(_ k keyword pattern template)
                                      #5((top))
                                      #5("i" "i" "i" "i" "i"))
                                   #4(ribcage ())
                                   #4(ribcage #1(x) #1((top)) #1("i"))
                                   #4(ribcage (#2(import-token *top*)) ())))
                              (cons '#3(syntax-object
                                        x
                                        ((top)
                                         #4(ribcage
                                            #5(_ k keyword pattern template)
                                            #5((top))
                                            #5("i" "i" "i" "i" "i"))
                                         #4(ribcage ())
                                         #4(ribcage #1(x) #1((top)) #1("i"))
                                         #4(ribcage
                                            (#2(import-token *top*))
                                            ()
                                            ())))
                                    (cons k_frx0hYQ5o
                                          (map (lambda (tmp_IB9pkkHXB
                                                        tmp_14JwHCdgw8)
                                                 (list (cons '#3(syntax-object
                                                                 dummy
                                                                 ((top)
                                                                  #4(ribcage
                                                                     #5(_
                                                                        k
                                                                        keyword
                                                                        pattern
                                                                        template)
                                                                     #5((top))
                                                                     #5("i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"))
                                                                  #4(ribcage
                                                                     ()
                                                                     ()
                                                                     ())
                                                                  #4(ribcage
                                                                     #1(x)
                                                                     #1((top))
                                                                     #1("i"))
                                                                  #4(ribcage
                                                                     (#2(import-token
                                                                         *top*))
                                                                     ()
                                                                     ())))
                                                             tmp_14JwHCdgw8)
                                                       (list '#3(syntax-object
                                                                 syntax
                                                                 ((top)
                                                                  #4(ribcage
                                                                     #5(_
                                                                        k
                                                                        keyword
                                                                        pattern
                                                                        template)
                                                                     #5((top))
                                                                     #5("i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"))
                                                                  #4(ribcage
                                                                     ()
                                                                     ()
                                                                     ())
                                                                  #4(ribcage
                                                                     #1(x)
                                                                     #1((top))
                                                                     #1("i"))
                                                                  #4(ribcage
                                                                     (#2(import-token
                                                                         *top*))
                                                                     ()
                                                                     ())))
                                                             tmp_IB9pkkHXB)))
                                               template_18BjsMZZez
                                               pattern_RBhmKAgwQ))))))
                tmp_zt7GttpFV)
         (syntax-error x_g8OG3P7mm)))
     ($syntax-dispatch
       (compile-in-annotation x_g8OG3P7mm value)
       '(any each-any . #2(each ((any . any) any)))))))
($sc-put-cte
  'or
  (lambda (x_fvcTgP7ql)
    ((lambda (tmp_aRQselQ9a)
       (if tmp_aRQselQ9a
         (apply (lambda (__12OJBPL7rZ)
                  '#3(syntax-object
                      #f
                      ((top)
                       #4(ribcage #1(_) #1((top)) #1("i"))
                       #4(ribcage ())
                       #4(ribcage #1(x) #1((top)) #1("i"))
                       #4(ribcage (#2(import-token *top*)) ()))))
                tmp_aRQselQ9a)
         ((lambda (tmp_17QsLElQ9c)
            (if tmp_17QsLElQ9c
              (apply (lambda (__MA3nSWySm e_NNl12qZiN) e_NNl12qZiN)
                     tmp_17QsLElQ9c)
              ((lambda (tmp_mlCQZv7rC)
                 (if tmp_mlCQZv7rC
                   (apply (lambda (__wWanxf7rD
                                   e1_xV1GBr7rE
                                   e2_oDrpXNQ9n
                                   e3_18Q6FLipJX)
                            (list '#3(syntax-object
                                      let
                                      ((top)
                                       #4(ribcage
                                          #4(_ e1 e2 e3)
                                          #4((top))
                                          #4("i" "i" "i" "i"))
                                       #4(ribcage ())
                                       #4(ribcage #1(x) #1((top)) #1("i"))
                                       #4(ribcage
                                          (#2(import-token *top*))
                                          ()
                                          ())))
                                  (list (list '#3(syntax-object
                                                  t
                                                  ((top)
                                                   #4(ribcage
                                                      #4(_ e1 e2 e3)
                                                      #4((top))
                                                      #4("i" "i" "i" "i"))
                                                   #4(ribcage ())
                                                   #4(ribcage
                                                      #1(x)
                                                      #1((top))
                                                      #1("i"))
                                                   #4(ribcage
                                                      (#2(import-token *top*))
                                                      ()
                                                      ())))
                                              e1_xV1GBr7rE))
                                  (list '#3(syntax-object
                                            if
                                            ((top)
                                             #4(ribcage
                                                #4(_ e1 e2 e3)
                                                #4((top))
                                                #4("i" "i" "i" "i"))
                                             #4(ribcage ())
                                             #4(ribcage
                                                #1(x)
                                                #1((top))
                                                #1("i"))
                                             #4(ribcage
                                                (#2(import-token *top*))
                                                ()
                                                ())))
                                        '#3(syntax-object
                                            t
                                            ((top)
                                             #4(ribcage
                                                #4(_ e1 e2 e3)
                                                #4((top))
                                                #4("i" "i" "i" "i"))
                                             #4(ribcage ())
                                             #4(ribcage
                                                #1(x)
                                                #1((top))
                                                #1("i"))
                                             #4(ribcage
                                                (#2(import-token *top*))
                                                ()
                                                ())))
                                        '#3(syntax-object
                                            t
                                            ((top)
                                             #4(ribcage
                                                #4(_ e1 e2 e3)
                                                #4((top))
                                                #4("i" "i" "i" "i"))
                                             #4(ribcage ())
                                             #4(ribcage
                                                #1(x)
                                                #1((top))
                                                #1("i"))
                                             #4(ribcage
                                                (#2(import-token *top*))
                                                ()
                                                ())))
                                        (cons '#3(syntax-object
                                                  or
                                                  ((top)
                                                   #4(ribcage
                                                      #4(_ e1 e2 e3)
                                                      #4((top))
                                                      #4("i" "i" "i" "i"))
                                                   #4(ribcage ())
                                                   #4(ribcage
                                                      #1(x)
                                                      #1((top))
                                                      #1("i"))
                                                   #4(ribcage
                                                      (#2(import-token *top*))
                                                      ()
                                                      ())))
                                              (cons e2_oDrpXNQ9n
                                                    e3_18Q6FLipJX)))))
                          tmp_mlCQZv7rC)
                   (syntax-error x_fvcTgP7ql)))
               ($syntax-dispatch
                 (compile-in-annotation x_fvcTgP7ql value)
                 '(any any any . each-any)))))
          ($syntax-dispatch
            (compile-in-annotation x_fvcTgP7ql value)
            '(any any)))))
     ($syntax-dispatch
       (compile-in-annotation x_fvcTgP7ql value)
       '(any)))))
($sc-put-cte
  'and
  (lambda (x_66NqsggEu)
    ((lambda (tmp_2mbRRUQeg)
       (if tmp_2mbRRUQeg
         (apply (lambda (__U9ios2pO.
                         e1_HQ32T5Qer
                         e2_lTdllxpO1
                         e3_dwbu9KyXa)
                  (cons '#3(syntax-object
                            if
                            ((top)
                             #4(ribcage
                                #4(_ e1 e2 e3)
                                #4((top))
                                #4("i" "i" "i" "i"))
                             #4(ribcage ())
                             #4(ribcage #1(x) #1((top)) #1("i"))
                             #4(ribcage (#2(import-token *top*)) ())))
                        (cons e1_HQ32T5Qer
                              (cons (cons '#3(syntax-object
                                              and
                                              ((top)
                                               #4(ribcage
                                                  #4(_ e1 e2 e3)
                                                  #4((top))
                                                  #4("i" "i" "i" "i"))
                                               #4(ribcage ())
                                               #4(ribcage
                                                  #1(x)
                                                  #1((top))
                                                  #1("i"))
                                               #4(ribcage
                                                  (#2(import-token *top*))
                                                  ()
                                                  ())))
                                          (cons e2_lTdllxpO1 e3_dwbu9KyXa))
                                    '#3(syntax-object
                                        (#f)
                                        ((top)
                                         #4(ribcage
                                            #4(_ e1 e2 e3)
                                            #4((top))
                                            #4("i" "i" "i" "i"))
                                         #4(ribcage ())
                                         #4(ribcage #1(x) #1((top)) #1("i"))
                                         #4(ribcage
                                            (#2(import-token *top*))
                                            ()
                                            ())))))))
                tmp_2mbRRUQeg)
         ((lambda (tmp_8TGfrKZnr)
            (if tmp_8TGfrKZnr
              (apply (lambda (__0VGQGepOX e_KRUhoggFO) e_KRUhoggFO)
                     tmp_8TGfrKZnr)
              ((lambda (tmp_6RqWTWZnt)
                 (if tmp_6RqWTWZnt
                   (apply (lambda (__HoD5PfyX3)
                            '#3(syntax-object
                                #t
                                ((top)
                                 #4(ribcage #1(_) #1((top)) #1("i"))
                                 #4(ribcage ())
                                 #4(ribcage #1(x) #1((top)) #1("i"))
                                 #4(ribcage (#2(import-token *top*)) ()))))
                          tmp_6RqWTWZnt)
                   (syntax-error x_66NqsggEu)))
               ($syntax-dispatch
                 (compile-in-annotation x_66NqsggEu value)
                 '(any)))))
          ($syntax-dispatch
            (compile-in-annotation x_66NqsggEu value)
            '(any any)))))
     ($syntax-dispatch
       (compile-in-annotation x_66NqsggEu value)
       '(any any any . each-any)))))
($sc-put-cte
  'let
  (lambda (x_18Xm3HxQhY)
    ((lambda (tmp_kAAbkv7zy)
       (if (if tmp_kAAbkv7zy
             (apply (lambda (__.4VBf9gKd
                             x_PJJNx.y1w
                             v_LR7XJSZsY
                             e1_2UqR2ZsZ
                             e2_14kANKAHaH)
                      (andmap identifier? x_PJJNx.y1w))
                    tmp_kAAbkv7zy)
             '#f)
         (apply (lambda (__pmwFMoHaa
                         x_17ZmWXOy13
                         v_9xRXXUQjl
                         e1_HHOMGAHad
                         e2_116Y6ZQQjn)
                  (cons (cons '#3(syntax-object
                                  lambda
                                  ((top)
                                   #4(ribcage
                                      #5(_ x v e1 e2)
                                      #5((top))
                                      #5("i" "i" "i" "i" "i"))
                                   #4(ribcage ())
                                   #4(ribcage #1(x) #1((top)) #1("i"))
                                   #4(ribcage (#2(import-token *top*)) ())))
                              (cons x_17ZmWXOy13
                                    (cons e1_HHOMGAHad e2_116Y6ZQQjn)))
                        v_9xRXXUQjl))
                tmp_kAAbkv7zy)
         ((lambda (tmp_rJBUX9Qiw)
            (if (if tmp_rJBUX9Qiw
                  (apply (lambda (__4qXIdxQi4
                                  f_sc.Ls.y0O
                                  x_J8zTQb7Ao
                                  v_V79kEmpSG
                                  e1_Ajv20yy0Q
                                  e2_5qspM47Aq)
                           (andmap
                             identifier?
                             (cons f_sc.Ls.y0O x_J8zTQb7Ao)))
                         tmp_rJBUX9Qiw)
                  '#f)
              (apply (lambda (__zcKXwNQix
                              f_YIp9i1gJZ
                              x_13Tpli4H9p
                              v_vGQJfFpS8
                              e1_7UB8xry0i
                              e2_hg9WE6ZrK)
                       (cons (list '#3(syntax-object
                                       letrec
                                       ((top)
                                        #4(ribcage
                                           #6(_ f x v e1 e2)
                                           #6((top))
                                           #6("i" "i" "i" "i" "i" "i"))
                                        #4(ribcage ())
                                        #4(ribcage #1(x) #1((top)) #1("i"))
                                        #4(ribcage
                                           (#2(import-token *top*))
                                           ()
                                           ())))
                                   (list (list f_YIp9i1gJZ
                                               (cons '#3(syntax-object
                                                         lambda
                                                         ((top)
                                                          #4(ribcage
                                                             #6(_ f x v e1 e2)
                                                             #6((top))
                                                             #6("i"
                                                                "i"
                                                                "i"
                                                                "i"
                                                                "i"
                                                                "i"))
                                                          #4(ribcage ())
                                                          #4(ribcage
                                                             #1(x)
                                                             #1((top))
                                                             #1("i"))
                                                          #4(ribcage
                                                             (#2(import-token
                                                                 *top*))
                                                             ()
                                                             ())))
                                                     (cons x_13Tpli4H9p
                                                           (cons e1_7UB8xry0i
                                                                 e2_hg9WE6ZrK)))))
                                   f_YIp9i1gJZ)
                             v_vGQJfFpS8))
                     tmp_rJBUX9Qiw)
              (syntax-error x_18Xm3HxQhY)))
          ($syntax-dispatch
            (compile-in-annotation x_18Xm3HxQhY value)
            '(any any #2(each (any any)) any . each-any)))))
     ($syntax-dispatch
       (compile-in-annotation x_18Xm3HxQhY value)
       '(any #2(each (any any)) any . each-any)))))
($sc-put-cte
  'let*
  (lambda (x_14QZwwH7F7)
    ((lambda (tmp_qWWT107Fn)
       (if (if tmp_qWWT107Fn
             (apply (lambda (let*_tyybsBp1Z
                             x_hUFmbsgTR
                             v_dgeJK9Qsr
                             e1_H1c7DiZBB
                             e2_iqRG.kgTT)
                      (andmap identifier? x_hUFmbsgTR))
                    tmp_qWWT107Fn)
             '#f)
         (apply (lambda (let*_cAQ6Mfy5P
                         x_QD71ssHeZ
                         v_Zs2GIGZwh
                         e1_iX7A4VpXI
                         e2_0sER2oHe0)
                  ((letrec ((f_5kN9VlQsJ
                              (lambda (bindings_14wS33b7K3)
                                (if (null? bindings_14wS33b7K3)
                                  (cons '#3(syntax-object
                                            let
                                            ((top)
                                             #4(ribcage ())
                                             #4(ribcage
                                                #1(bindings)
                                                #1((top))
                                                #1("i"))
                                             #4(ribcage
                                                #1(f)
                                                #1((top))
                                                #1("i"))
                                             #4(ribcage
                                                #5(let* x v e1 e2)
                                                #5((top))
                                                #5("i" "i" "i" "i" "i"))
                                             #4(ribcage ())
                                             #4(ribcage
                                                #1(x)
                                                #1((top))
                                                #1("i"))
                                             #4(ribcage
                                                (#2(import-token *top*))
                                                ()
                                                ())))
                                        (cons '()
                                              (cons e1_iX7A4VpXI
                                                    e2_0sER2oHe0)))
                                  ((lambda (tmp_nl3i8dgTh)
                                     ((lambda (tmp_ohkIm77Kd)
                                        (if tmp_ohkIm77Kd
                                          (apply (lambda (body_5AFk3ep1x
                                                          binding_bU4TiGyaG)
                                                   (list '#3(syntax-object
                                                             let
                                                             ((top)
                                                              #4(ribcage
                                                                 #2(body
                                                                    binding)
                                                                 #2((top))
                                                                 #2("i" "i"))
                                                              #4(ribcage ())
                                                              #4(ribcage
                                                                 #1(bindings)
                                                                 #1((top))
                                                                 #1("i"))
                                                              #4(ribcage
                                                                 #1(f)
                                                                 #1((top))
                                                                 #1("i"))
                                                              #4(ribcage
                                                                 #5(let*
                                                                    x
                                                                    v
                                                                    e1
                                                                    e2)
                                                                 #5((top))
                                                                 #5("i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"))
                                                              #4(ribcage ())
                                                              #4(ribcage
                                                                 #1(x)
                                                                 #1((top))
                                                                 #1("i"))
                                                              #4(ribcage
                                                                 (#2(import-token
                                                                     *top*))
                                                                 ()
                                                                 ())))
                                                         (list binding_bU4TiGyaG)
                                                         body_5AFk3ep1x))
                                                 tmp_ohkIm77Kd)
                                          (syntax-error tmp_nl3i8dgTh)))
                                      ($syntax-dispatch
                                        (compile-in-annotation
                                          tmp_nl3i8dgTh
                                          value)
                                        '(any any))))
                                   (list (f_5kN9VlQsJ
                                           (cdr bindings_14wS33b7K3))
                                         (car bindings_14wS33b7K3)))))))
                     f_5kN9VlQsJ)
                   (map list x_QD71ssHeZ v_Zs2GIGZwh)))
                tmp_qWWT107Fn)
         (syntax-error x_14QZwwH7F7)))
     ($syntax-dispatch
       (compile-in-annotation x_14QZwwH7F7 value)
       '(any #2(each (any any)) any . each-any)))))
($sc-put-cte
  'cond
  (lambda (x_6n1XRyyeb)
    ((lambda (tmp_Qtvvv3yfk)
       (if tmp_Qtvvv3yfk
         (apply (lambda (__4q5UMX7PV m1_OHgXvpp6d m2_Iw7yXXHow)
                  ((letrec ((f_F3QuTsHoA
                              (lambda (clause_jfxXgQgYc clauses_..kQaBp6m)
                                (if (null? clauses_..kQaBp6m)
                                  ((lambda (tmp_roHm3vygN)
                                     (if tmp_roHm3vygN
                                       (apply (lambda (e1_yFnbN9g.l
                                                       e2_syCUeQg.m)
                                                (cons '#3(syntax-object
                                                          begin
                                                          ((top)
                                                           #4(ribcage
                                                              #2(e1 e2)
                                                              #2((top))
                                                              #2("i" "i"))
                                                           #4(ribcage ())
                                                           #4(ribcage
                                                              #2(clause
                                                                 clauses)
                                                              #2((top))
                                                              #2("i" "i"))
                                                           #4(ribcage
                                                              #1(f)
                                                              #1((top))
                                                              #1("i"))
                                                           #4(ribcage
                                                              #3(_ m1 m2)
                                                              #3((top))
                                                              #3("i" "i" "i"))
                                                           #4(ribcage ())
                                                           #4(ribcage
                                                              #1(x)
                                                              #1((top))
                                                              #1("i"))
                                                           #4(ribcage
                                                              (#2(import-token
                                                                  *top*))
                                                              ()
                                                              ())))
                                                      (cons e1_yFnbN9g.l
                                                            e2_syCUeQg.m)))
                                              tmp_roHm3vygN)
                                       ((lambda (tmp_Hy7pdep7F)
                                          (if tmp_Hy7pdep7F
                                            (apply (lambda (e0_V9KRCKyhu)
                                                     (cons '#3(syntax-object
                                                               let
                                                               ((top)
                                                                #4(ribcage
                                                                   #1(e0)
                                                                   #1((top))
                                                                   #1("i"))
                                                                #4(ribcage ())
                                                                #4(ribcage
                                                                   #2(clause
                                                                      clauses)
                                                                   #2((top))
                                                                   #2("i" "i"))
                                                                #4(ribcage
                                                                   #1(f)
                                                                   #1((top))
                                                                   #1("i"))
                                                                #4(ribcage
                                                                   #3(_ m1 m2)
                                                                   #3((top))
                                                                   #3("i"
                                                                      "i"
                                                                      "i"))
                                                                #4(ribcage ())
                                                                #4(ribcage
                                                                   #1(x)
                                                                   #1((top))
                                                                   #1("i"))
                                                                #4(ribcage
                                                                   (#2(import-token
                                                                       *top*))
                                                                   ()
                                                                   ())))
                                                           (cons (list (list '#3(syntax-object
                                                                                 t
                                                                                 ((top)
                                                                                  #4(ribcage
                                                                                     #1(e0)
                                                                                     #1((top))
                                                                                     #1("i"))
                                                                                  #4(ribcage
                                                                                     ()
                                                                                     ()
                                                                                     ())
                                                                                  #4(ribcage
                                                                                     #2(clause
                                                                                        clauses)
                                                                                     #2((top)
                                                                                        (top))
                                                                                     #2("i"
                                                                                        "i"))
                                                                                  #4(ribcage
                                                                                     #1(f)
                                                                                     #1((top))
                                                                                     #1("i"))
                                                                                  #4(ribcage
                                                                                     #3(_
                                                                                        m1
                                                                                        m2)
                                                                                     #3((top)
                                                                                        (top)
                                                                                        (top))
                                                                                     #3("i"
                                                                                        "i"
                                                                                        "i"))
                                                                                  #4(ribcage
                                                                                     ()
                                                                                     ()
                                                                                     ())
                                                                                  #4(ribcage
                                                                                     #1(x)
                                                                                     #1((top))
                                                                                     #1("i"))
                                                                                  #4(ribcage
                                                                                     (#2(import-token
                                                                                         *top*))
                                                                                     ()
                                                                                     ())))
                                                                             e0_V9KRCKyhu))
                                                                 '#3(syntax-object
                                                                     ((if t t))
                                                                     ((top)
                                                                      #4(ribcage
                                                                         #1(e0)
                                                                         #1((top))
                                                                         #1("i"))
                                                                      #4(ribcage
                                                                         ()
                                                                         ()
                                                                         ())
                                                                      #4(ribcage
                                                                         #2(clause
                                                                            clauses)
                                                                         #2((top)
                                                                            (top))
                                                                         #2("i"
                                                                            "i"))
                                                                      #4(ribcage
                                                                         #1(f)
                                                                         #1((top))
                                                                         #1("i"))
                                                                      #4(ribcage
                                                                         #3(_
                                                                            m1
                                                                            m2)
                                                                         #3((top)
                                                                            (top)
                                                                            (top))
                                                                         #3("i"
                                                                            "i"
                                                                            "i"))
                                                                      #4(ribcage
                                                                         ()
                                                                         ()
                                                                         ())
                                                                      #4(ribcage
                                                                         #1(x)
                                                                         #1((top))
                                                                         #1("i"))
                                                                      #4(ribcage
                                                                         (#2(import-token
                                                                             *top*))
                                                                         ()
                                                                         ()))))))
                                                   tmp_Hy7pdep7F)
                                            ((lambda (tmp_qBP2HD7Qq)
                                               (if tmp_qBP2HD7Qq
                                                 (apply (lambda (e0_N4XVH6ZIL
                                                                 e1_xnuU1EHqt)
                                                          (list '#3(syntax-object
                                                                    let
                                                                    ((top)
                                                                     #4(ribcage
                                                                        #2(e0
                                                                           e1)
                                                                        #2((top)
                                                                           (top))
                                                                        #2("i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        ()
                                                                        ()
                                                                        ())
                                                                     #4(ribcage
                                                                        #2(clause
                                                                           clauses)
                                                                        #2((top)
                                                                           (top))
                                                                        #2("i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        #1(f)
                                                                        #1((top))
                                                                        #1("i"))
                                                                     #4(ribcage
                                                                        #3(_
                                                                           m1
                                                                           m2)
                                                                        #3((top)
                                                                           (top)
                                                                           (top))
                                                                        #3("i"
                                                                           "i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        ()
                                                                        ()
                                                                        ())
                                                                     #4(ribcage
                                                                        #1(x)
                                                                        #1((top))
                                                                        #1("i"))
                                                                     #4(ribcage
                                                                        (#2(import-token
                                                                            *top*))
                                                                        ()
                                                                        ())))
                                                                (list (list '#3(syntax-object
                                                                                t
                                                                                ((top)
                                                                                 #4(ribcage
                                                                                    #2(e0
                                                                                       e1)
                                                                                    #2((top)
                                                                                       (top))
                                                                                    #2("i"
                                                                                       "i"))
                                                                                 #4(ribcage
                                                                                    ()
                                                                                    ()
                                                                                    ())
                                                                                 #4(ribcage
                                                                                    #2(clause
                                                                                       clauses)
                                                                                    #2((top)
                                                                                       (top))
                                                                                    #2("i"
                                                                                       "i"))
                                                                                 #4(ribcage
                                                                                    #1(f)
                                                                                    #1((top))
                                                                                    #1("i"))
                                                                                 #4(ribcage
                                                                                    #3(_
                                                                                       m1
                                                                                       m2)
                                                                                    #3((top)
                                                                                       (top)
                                                                                       (top))
                                                                                    #3("i"
                                                                                       "i"
                                                                                       "i"))
                                                                                 #4(ribcage
                                                                                    ()
                                                                                    ()
                                                                                    ())
                                                                                 #4(ribcage
                                                                                    #1(x)
                                                                                    #1((top))
                                                                                    #1("i"))
                                                                                 #4(ribcage
                                                                                    (#2(import-token
                                                                                        *top*))
                                                                                    ()
                                                                                    ())))
                                                                            e0_N4XVH6ZIL))
                                                                (list '#3(syntax-object
                                                                          if
                                                                          ((top)
                                                                           #4(ribcage
                                                                              #2(e0
                                                                                 e1)
                                                                              #2((top)
                                                                                 (top))
                                                                              #2("i"
                                                                                 "i"))
                                                                           #4(ribcage
                                                                              ()
                                                                              ()
                                                                              ())
                                                                           #4(ribcage
                                                                              #2(clause
                                                                                 clauses)
                                                                              #2((top)
                                                                                 (top))
                                                                              #2("i"
                                                                                 "i"))
                                                                           #4(ribcage
                                                                              #1(f)
                                                                              #1((top))
                                                                              #1("i"))
                                                                           #4(ribcage
                                                                              #3(_
                                                                                 m1
                                                                                 m2)
                                                                              #3((top)
                                                                                 (top)
                                                                                 (top))
                                                                              #3("i"
                                                                                 "i"
                                                                                 "i"))
                                                                           #4(ribcage
                                                                              ()
                                                                              ()
                                                                              ())
                                                                           #4(ribcage
                                                                              #1(x)
                                                                              #1((top))
                                                                              #1("i"))
                                                                           #4(ribcage
                                                                              (#2(import-token
                                                                                  *top*))
                                                                              ()
                                                                              ())))
                                                                      '#3(syntax-object
                                                                          t
                                                                          ((top)
                                                                           #4(ribcage
                                                                              #2(e0
                                                                                 e1)
                                                                              #2((top)
                                                                                 (top))
                                                                              #2("i"
                                                                                 "i"))
                                                                           #4(ribcage
                                                                              ()
                                                                              ()
                                                                              ())
                                                                           #4(ribcage
                                                                              #2(clause
                                                                                 clauses)
                                                                              #2((top)
                                                                                 (top))
                                                                              #2("i"
                                                                                 "i"))
                                                                           #4(ribcage
                                                                              #1(f)
                                                                              #1((top))
                                                                              #1("i"))
                                                                           #4(ribcage
                                                                              #3(_
                                                                                 m1
                                                                                 m2)
                                                                              #3((top)
                                                                                 (top)
                                                                                 (top))
                                                                              #3("i"
                                                                                 "i"
                                                                                 "i"))
                                                                           #4(ribcage
                                                                              ()
                                                                              ()
                                                                              ())
                                                                           #4(ribcage
                                                                              #1(x)
                                                                              #1((top))
                                                                              #1("i"))
                                                                           #4(ribcage
                                                                              (#2(import-token
                                                                                  *top*))
                                                                              ()
                                                                              ())))
                                                                      (cons e1_xnuU1EHqt
                                                                            '#3(syntax-object
                                                                                (t)
                                                                                ((top)
                                                                                 #4(ribcage
                                                                                    #2(e0
                                                                                       e1)
                                                                                    #2((top)
                                                                                       (top))
                                                                                    #2("i"
                                                                                       "i"))
                                                                                 #4(ribcage
                                                                                    ()
                                                                                    ()
                                                                                    ())
                                                                                 #4(ribcage
                                                                                    #2(clause
                                                                                       clauses)
                                                                                    #2((top)
                                                                                       (top))
                                                                                    #2("i"
                                                                                       "i"))
                                                                                 #4(ribcage
                                                                                    #1(f)
                                                                                    #1((top))
                                                                                    #1("i"))
                                                                                 #4(ribcage
                                                                                    #3(_
                                                                                       m1
                                                                                       m2)
                                                                                    #3((top)
                                                                                       (top)
                                                                                       (top))
                                                                                    #3("i"
                                                                                       "i"
                                                                                       "i"))
                                                                                 #4(ribcage
                                                                                    ()
                                                                                    ()
                                                                                    ())
                                                                                 #4(ribcage
                                                                                    #1(x)
                                                                                    #1((top))
                                                                                    #1("i"))
                                                                                 #4(ribcage
                                                                                    (#2(import-token
                                                                                        *top*))
                                                                                    ()
                                                                                    ())))))))
                                                        tmp_qBP2HD7Qq)
                                                 ((lambda (tmp_ptt9.dgZH)
                                                    (if tmp_ptt9.dgZH
                                                      (apply (lambda (e0_FoYjdPHpb
                                                                      e1_7QmRdP7QD
                                                                      e2_y.JPXEHpg)
                                                               (list '#3(syntax-object
                                                                         if
                                                                         ((top)
                                                                          #4(ribcage
                                                                             #3(e0
                                                                                e1
                                                                                e2)
                                                                             #3((top)
                                                                                (top)
                                                                                (top))
                                                                             #3("i"
                                                                                "i"
                                                                                "i"))
                                                                          #4(ribcage
                                                                             ()
                                                                             ()
                                                                             ())
                                                                          #4(ribcage
                                                                             #2(clause
                                                                                clauses)
                                                                             #2((top)
                                                                                (top))
                                                                             #2("i"
                                                                                "i"))
                                                                          #4(ribcage
                                                                             #1(f)
                                                                             #1((top))
                                                                             #1("i"))
                                                                          #4(ribcage
                                                                             #3(_
                                                                                m1
                                                                                m2)
                                                                             #3((top)
                                                                                (top)
                                                                                (top))
                                                                             #3("i"
                                                                                "i"
                                                                                "i"))
                                                                          #4(ribcage
                                                                             ()
                                                                             ()
                                                                             ())
                                                                          #4(ribcage
                                                                             #1(x)
                                                                             #1((top))
                                                                             #1("i"))
                                                                          #4(ribcage
                                                                             (#2(import-token
                                                                                 *top*))
                                                                             ()
                                                                             ())))
                                                                     e0_FoYjdPHpb
                                                                     (cons '#3(syntax-object
                                                                               begin
                                                                               ((top)
                                                                                #4(ribcage
                                                                                   #3(e0
                                                                                      e1
                                                                                      e2)
                                                                                   #3((top)
                                                                                      (top)
                                                                                      (top))
                                                                                   #3("i"
                                                                                      "i"
                                                                                      "i"))
                                                                                #4(ribcage
                                                                                   ()
                                                                                   ()
                                                                                   ())
                                                                                #4(ribcage
                                                                                   #2(clause
                                                                                      clauses)
                                                                                   #2((top)
                                                                                      (top))
                                                                                   #2("i"
                                                                                      "i"))
                                                                                #4(ribcage
                                                                                   #1(f)
                                                                                   #1((top))
                                                                                   #1("i"))
                                                                                #4(ribcage
                                                                                   #3(_
                                                                                      m1
                                                                                      m2)
                                                                                   #3((top)
                                                                                      (top)
                                                                                      (top))
                                                                                   #3("i"
                                                                                      "i"
                                                                                      "i"))
                                                                                #4(ribcage
                                                                                   ()
                                                                                   ()
                                                                                   ())
                                                                                #4(ribcage
                                                                                   #1(x)
                                                                                   #1((top))
                                                                                   #1("i"))
                                                                                #4(ribcage
                                                                                   (#2(import-token
                                                                                       *top*))
                                                                                   ()
                                                                                   ())))
                                                                           (cons e1_7QmRdP7QD
                                                                                 e2_y.JPXEHpg))))
                                                             tmp_ptt9.dgZH)
                                                      (syntax-error
                                                        x_6n1XRyyeb)))
                                                  ($syntax-dispatch
                                                    (compile-in-annotation
                                                      clause_jfxXgQgYc
                                                      value)
                                                    '(any any . each-any)))))
                                             ($syntax-dispatch
                                               (compile-in-annotation
                                                 clause_jfxXgQgYc
                                                 value)
                                               '(any #2(free-id
                                                        #3(syntax-object
                                                           =>
                                                           ((top)
                                                            #4(ribcage ())
                                                            #4(ribcage
                                                               #2(clause
                                                                  clauses)
                                                               #2((top))
                                                               #2("i" "i"))
                                                            #4(ribcage
                                                               #1(f)
                                                               #1((top))
                                                               #1("i"))
                                                            #4(ribcage
                                                               #3(_ m1 m2)
                                                               #3((top))
                                                               #3("i" "i" "i"))
                                                            #4(ribcage ())
                                                            #4(ribcage
                                                               #1(x)
                                                               #1((top))
                                                               #1("i"))
                                                            #4(ribcage
                                                               (#2(import-token
                                                                   *top*))
                                                               ()
                                                               ()))))
                                                     any)))))
                                        ($syntax-dispatch
                                          (compile-in-annotation
                                            clause_jfxXgQgYc
                                            value)
                                          '(any)))))
                                   ($syntax-dispatch
                                     (compile-in-annotation
                                       clause_jfxXgQgYc
                                       value)
                                     '(#2(free-id
                                          #3(syntax-object
                                             else
                                             ((top)
                                              #4(ribcage ())
                                              #4(ribcage
                                                 #2(clause clauses)
                                                 #2((top))
                                                 #2("i" "i"))
                                              #4(ribcage
                                                 #1(f)
                                                 #1((top))
                                                 #1("i"))
                                              #4(ribcage
                                                 #3(_ m1 m2)
                                                 #3((top))
                                                 #3("i" "i" "i"))
                                              #4(ribcage ())
                                              #4(ribcage
                                                 #1(x)
                                                 #1((top))
                                                 #1("i"))
                                              #4(ribcage
                                                 (#2(import-token *top*))
                                                 ()
                                                 ()))))
                                       any
                                       .
                                       each-any)))
                                  ((lambda (tmp_87pR9kgYh)
                                     ((lambda (tmp_cp7.y9gYt)
                                        (if tmp_cp7.y9gYt
                                          (apply (lambda (e0_kTQQlpp7l)
                                                   (list '#3(syntax-object
                                                             let
                                                             ((top)
                                                              #4(ribcage
                                                                 #1(e0)
                                                                 #1((top))
                                                                 #1("i"))
                                                              #4(ribcage
                                                                 #1(rest)
                                                                 #1((top))
                                                                 #1("i"))
                                                              #4(ribcage ())
                                                              #4(ribcage
                                                                 #2(clause
                                                                    clauses)
                                                                 #2((top))
                                                                 #2("i" "i"))
                                                              #4(ribcage
                                                                 #1(f)
                                                                 #1((top))
                                                                 #1("i"))
                                                              #4(ribcage
                                                                 #3(_ m1 m2)
                                                                 #3((top))
                                                                 #3("i"
                                                                    "i"
                                                                    "i"))
                                                              #4(ribcage ())
                                                              #4(ribcage
                                                                 #1(x)
                                                                 #1((top))
                                                                 #1("i"))
                                                              #4(ribcage
                                                                 (#2(import-token
                                                                     *top*))
                                                                 ()
                                                                 ())))
                                                         (list (list '#3(syntax-object
                                                                         t
                                                                         ((top)
                                                                          #4(ribcage
                                                                             #1(e0)
                                                                             #1((top))
                                                                             #1("i"))
                                                                          #4(ribcage
                                                                             #1(rest)
                                                                             #1((top))
                                                                             #1("i"))
                                                                          #4(ribcage
                                                                             ()
                                                                             ()
                                                                             ())
                                                                          #4(ribcage
                                                                             #2(clause
                                                                                clauses)
                                                                             #2((top)
                                                                                (top))
                                                                             #2("i"
                                                                                "i"))
                                                                          #4(ribcage
                                                                             #1(f)
                                                                             #1((top))
                                                                             #1("i"))
                                                                          #4(ribcage
                                                                             #3(_
                                                                                m1
                                                                                m2)
                                                                             #3((top)
                                                                                (top)
                                                                                (top))
                                                                             #3("i"
                                                                                "i"
                                                                                "i"))
                                                                          #4(ribcage
                                                                             ()
                                                                             ()
                                                                             ())
                                                                          #4(ribcage
                                                                             #1(x)
                                                                             #1((top))
                                                                             #1("i"))
                                                                          #4(ribcage
                                                                             (#2(import-token
                                                                                 *top*))
                                                                             ()
                                                                             ())))
                                                                     e0_kTQQlpp7l))
                                                         (list '#3(syntax-object
                                                                   if
                                                                   ((top)
                                                                    #4(ribcage
                                                                       #1(e0)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       #1(rest)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                    #4(ribcage
                                                                       #2(clause
                                                                          clauses)
                                                                       #2((top)
                                                                          (top))
                                                                       #2("i"
                                                                          "i"))
                                                                    #4(ribcage
                                                                       #1(f)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       #3(_
                                                                          m1
                                                                          m2)
                                                                       #3((top)
                                                                          (top)
                                                                          (top))
                                                                       #3("i"
                                                                          "i"
                                                                          "i"))
                                                                    #4(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                    #4(ribcage
                                                                       #1(x)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       (#2(import-token
                                                                           *top*))
                                                                       ()
                                                                       ())))
                                                               '#3(syntax-object
                                                                   t
                                                                   ((top)
                                                                    #4(ribcage
                                                                       #1(e0)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       #1(rest)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                    #4(ribcage
                                                                       #2(clause
                                                                          clauses)
                                                                       #2((top)
                                                                          (top))
                                                                       #2("i"
                                                                          "i"))
                                                                    #4(ribcage
                                                                       #1(f)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       #3(_
                                                                          m1
                                                                          m2)
                                                                       #3((top)
                                                                          (top)
                                                                          (top))
                                                                       #3("i"
                                                                          "i"
                                                                          "i"))
                                                                    #4(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                    #4(ribcage
                                                                       #1(x)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       (#2(import-token
                                                                           *top*))
                                                                       ()
                                                                       ())))
                                                               '#3(syntax-object
                                                                   t
                                                                   ((top)
                                                                    #4(ribcage
                                                                       #1(e0)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       #1(rest)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                    #4(ribcage
                                                                       #2(clause
                                                                          clauses)
                                                                       #2((top)
                                                                          (top))
                                                                       #2("i"
                                                                          "i"))
                                                                    #4(ribcage
                                                                       #1(f)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       #3(_
                                                                          m1
                                                                          m2)
                                                                       #3((top)
                                                                          (top)
                                                                          (top))
                                                                       #3("i"
                                                                          "i"
                                                                          "i"))
                                                                    #4(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                    #4(ribcage
                                                                       #1(x)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       (#2(import-token
                                                                           *top*))
                                                                       ()
                                                                       ())))
                                                               tmp_87pR9kgYh)))
                                                 tmp_cp7.y9gYt)
                                          ((lambda (tmp_Lhh1iuZGf)
                                             (if tmp_Lhh1iuZGf
                                               (apply (lambda (e0_LbfN3eZGF
                                                               e1_ptPMvSZGG)
                                                        (list '#3(syntax-object
                                                                  let
                                                                  ((top)
                                                                   #4(ribcage
                                                                      #2(e0 e1)
                                                                      #2((top))
                                                                      #2("i"
                                                                         "i"))
                                                                   #4(ribcage
                                                                      #1(rest)
                                                                      #1((top))
                                                                      #1("i"))
                                                                   #4(ribcage
                                                                      ()
                                                                      ()
                                                                      ())
                                                                   #4(ribcage
                                                                      #2(clause
                                                                         clauses)
                                                                      #2((top))
                                                                      #2("i"
                                                                         "i"))
                                                                   #4(ribcage
                                                                      #1(f)
                                                                      #1((top))
                                                                      #1("i"))
                                                                   #4(ribcage
                                                                      #3(_
                                                                         m1
                                                                         m2)
                                                                      #3((top))
                                                                      #3("i"
                                                                         "i"
                                                                         "i"))
                                                                   #4(ribcage
                                                                      ()
                                                                      ()
                                                                      ())
                                                                   #4(ribcage
                                                                      #1(x)
                                                                      #1((top))
                                                                      #1("i"))
                                                                   #4(ribcage
                                                                      (#2(import-token
                                                                          *top*))
                                                                      ()
                                                                      ())))
                                                              (list (list '#3(syntax-object
                                                                              t
                                                                              ((top)
                                                                               #4(ribcage
                                                                                  #2(e0
                                                                                     e1)
                                                                                  #2((top)
                                                                                     (top))
                                                                                  #2("i"
                                                                                     "i"))
                                                                               #4(ribcage
                                                                                  #1(rest)
                                                                                  #1((top))
                                                                                  #1("i"))
                                                                               #4(ribcage
                                                                                  ()
                                                                                  ()
                                                                                  ())
                                                                               #4(ribcage
                                                                                  #2(clause
                                                                                     clauses)
                                                                                  #2((top)
                                                                                     (top))
                                                                                  #2("i"
                                                                                     "i"))
                                                                               #4(ribcage
                                                                                  #1(f)
                                                                                  #1((top))
                                                                                  #1("i"))
                                                                               #4(ribcage
                                                                                  #3(_
                                                                                     m1
                                                                                     m2)
                                                                                  #3((top)
                                                                                     (top)
                                                                                     (top))
                                                                                  #3("i"
                                                                                     "i"
                                                                                     "i"))
                                                                               #4(ribcage
                                                                                  ()
                                                                                  ()
                                                                                  ())
                                                                               #4(ribcage
                                                                                  #1(x)
                                                                                  #1((top))
                                                                                  #1("i"))
                                                                               #4(ribcage
                                                                                  (#2(import-token
                                                                                      *top*))
                                                                                  ()
                                                                                  ())))
                                                                          e0_LbfN3eZGF))
                                                              (list '#3(syntax-object
                                                                        if
                                                                        ((top)
                                                                         #4(ribcage
                                                                            #2(e0
                                                                               e1)
                                                                            #2((top)
                                                                               (top))
                                                                            #2("i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            #1(rest)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #2(clause
                                                                               clauses)
                                                                            #2((top)
                                                                               (top))
                                                                            #2("i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            #1(f)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            #3(_
                                                                               m1
                                                                               m2)
                                                                            #3((top)
                                                                               (top)
                                                                               (top))
                                                                            #3("i"
                                                                               "i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #1(x)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            (#2(import-token
                                                                                *top*))
                                                                            ()
                                                                            ())))
                                                                    '#3(syntax-object
                                                                        t
                                                                        ((top)
                                                                         #4(ribcage
                                                                            #2(e0
                                                                               e1)
                                                                            #2((top)
                                                                               (top))
                                                                            #2("i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            #1(rest)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #2(clause
                                                                               clauses)
                                                                            #2((top)
                                                                               (top))
                                                                            #2("i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            #1(f)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            #3(_
                                                                               m1
                                                                               m2)
                                                                            #3((top)
                                                                               (top)
                                                                               (top))
                                                                            #3("i"
                                                                               "i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #1(x)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            (#2(import-token
                                                                                *top*))
                                                                            ()
                                                                            ())))
                                                                    (cons e1_ptPMvSZGG
                                                                          '#3(syntax-object
                                                                              (t)
                                                                              ((top)
                                                                               #4(ribcage
                                                                                  #2(e0
                                                                                     e1)
                                                                                  #2((top)
                                                                                     (top))
                                                                                  #2("i"
                                                                                     "i"))
                                                                               #4(ribcage
                                                                                  #1(rest)
                                                                                  #1((top))
                                                                                  #1("i"))
                                                                               #4(ribcage
                                                                                  ()
                                                                                  ()
                                                                                  ())
                                                                               #4(ribcage
                                                                                  #2(clause
                                                                                     clauses)
                                                                                  #2((top)
                                                                                     (top))
                                                                                  #2("i"
                                                                                     "i"))
                                                                               #4(ribcage
                                                                                  #1(f)
                                                                                  #1((top))
                                                                                  #1("i"))
                                                                               #4(ribcage
                                                                                  #3(_
                                                                                     m1
                                                                                     m2)
                                                                                  #3((top)
                                                                                     (top)
                                                                                     (top))
                                                                                  #3("i"
                                                                                     "i"
                                                                                     "i"))
                                                                               #4(ribcage
                                                                                  ()
                                                                                  ()
                                                                                  ())
                                                                               #4(ribcage
                                                                                  #1(x)
                                                                                  #1((top))
                                                                                  #1("i"))
                                                                               #4(ribcage
                                                                                  (#2(import-token
                                                                                      *top*))
                                                                                  ()
                                                                                  ()))))
                                                                    tmp_87pR9kgYh)))
                                                      tmp_Lhh1iuZGf)
                                               ((lambda (tmp_mU9.qbyfW)
                                                  (if tmp_mU9.qbyfW
                                                    (apply (lambda (e0_pNnPCBQxh
                                                                    e1_26w5FgHo9
                                                                    e2_h8xastQxj)
                                                             (list '#3(syntax-object
                                                                       if
                                                                       ((top)
                                                                        #4(ribcage
                                                                           #3(e0
                                                                              e1
                                                                              e2)
                                                                           #3((top)
                                                                              (top)
                                                                              (top))
                                                                           #3("i"
                                                                              "i"
                                                                              "i"))
                                                                        #4(ribcage
                                                                           #1(rest)
                                                                           #1((top))
                                                                           #1("i"))
                                                                        #4(ribcage
                                                                           ()
                                                                           ()
                                                                           ())
                                                                        #4(ribcage
                                                                           #2(clause
                                                                              clauses)
                                                                           #2((top)
                                                                              (top))
                                                                           #2("i"
                                                                              "i"))
                                                                        #4(ribcage
                                                                           #1(f)
                                                                           #1((top))
                                                                           #1("i"))
                                                                        #4(ribcage
                                                                           #3(_
                                                                              m1
                                                                              m2)
                                                                           #3((top)
                                                                              (top)
                                                                              (top))
                                                                           #3("i"
                                                                              "i"
                                                                              "i"))
                                                                        #4(ribcage
                                                                           ()
                                                                           ()
                                                                           ())
                                                                        #4(ribcage
                                                                           #1(x)
                                                                           #1((top))
                                                                           #1("i"))
                                                                        #4(ribcage
                                                                           (#2(import-token
                                                                               *top*))
                                                                           ()
                                                                           ())))
                                                                   e0_pNnPCBQxh
                                                                   (cons '#3(syntax-object
                                                                             begin
                                                                             ((top)
                                                                              #4(ribcage
                                                                                 #3(e0
                                                                                    e1
                                                                                    e2)
                                                                                 #3((top)
                                                                                    (top)
                                                                                    (top))
                                                                                 #3("i"
                                                                                    "i"
                                                                                    "i"))
                                                                              #4(ribcage
                                                                                 #1(rest)
                                                                                 #1((top))
                                                                                 #1("i"))
                                                                              #4(ribcage
                                                                                 ()
                                                                                 ()
                                                                                 ())
                                                                              #4(ribcage
                                                                                 #2(clause
                                                                                    clauses)
                                                                                 #2((top)
                                                                                    (top))
                                                                                 #2("i"
                                                                                    "i"))
                                                                              #4(ribcage
                                                                                 #1(f)
                                                                                 #1((top))
                                                                                 #1("i"))
                                                                              #4(ribcage
                                                                                 #3(_
                                                                                    m1
                                                                                    m2)
                                                                                 #3((top)
                                                                                    (top)
                                                                                    (top))
                                                                                 #3("i"
                                                                                    "i"
                                                                                    "i"))
                                                                              #4(ribcage
                                                                                 ()
                                                                                 ()
                                                                                 ())
                                                                              #4(ribcage
                                                                                 #1(x)
                                                                                 #1((top))
                                                                                 #1("i"))
                                                                              #4(ribcage
                                                                                 (#2(import-token
                                                                                     *top*))
                                                                                 ()
                                                                                 ())))
                                                                         (cons e1_26w5FgHo9
                                                                               e2_h8xastQxj))
                                                                   tmp_87pR9kgYh))
                                                           tmp_mU9.qbyfW)
                                                    (syntax-error
                                                      x_6n1XRyyeb)))
                                                ($syntax-dispatch
                                                  (compile-in-annotation
                                                    clause_jfxXgQgYc
                                                    value)
                                                  '(any any . each-any)))))
                                           ($syntax-dispatch
                                             (compile-in-annotation
                                               clause_jfxXgQgYc
                                               value)
                                             '(any #2(free-id
                                                      #3(syntax-object
                                                         =>
                                                         ((top)
                                                          #4(ribcage
                                                             #1(rest)
                                                             #1((top))
                                                             #1("i"))
                                                          #4(ribcage ())
                                                          #4(ribcage
                                                             #2(clause clauses)
                                                             #2((top))
                                                             #2("i" "i"))
                                                          #4(ribcage
                                                             #1(f)
                                                             #1((top))
                                                             #1("i"))
                                                          #4(ribcage
                                                             #3(_ m1 m2)
                                                             #3((top))
                                                             #3("i" "i" "i"))
                                                          #4(ribcage ())
                                                          #4(ribcage
                                                             #1(x)
                                                             #1((top))
                                                             #1("i"))
                                                          #4(ribcage
                                                             (#2(import-token
                                                                 *top*))
                                                             ()
                                                             ()))))
                                                   any)))))
                                      ($syntax-dispatch
                                        (compile-in-annotation
                                          clause_jfxXgQgYc
                                          value)
                                        '(any))))
                                   (f_F3QuTsHoA
                                     (car clauses_..kQaBp6m)
                                     (cdr clauses_..kQaBp6m)))))))
                     f_F3QuTsHoA)
                   m1_OHgXvpp6d
                   m2_Iw7yXXHow))
                tmp_Qtvvv3yfk)
         (syntax-error x_6n1XRyyeb)))
     ($syntax-dispatch
       (compile-in-annotation x_6n1XRyyeb value)
       '(any any . each-any)))))
($sc-put-cte
  'do
  (lambda (orig-x_o8u9lnzB2)
    ((lambda (tmp_SJLr0qqse)
       (if tmp_SJLr0qqse
         (apply (lambda (__uXdAITIKx
                         var_19vNV5hhj7
                         init_uar.uy.1R
                         step_QfVtdKzBq
                         e0_CdhNW8IKA
                         e1_wp88MgIKB
                         c_CTnKqT8a5)
                  ((lambda (tmp_hqMcd9RTS)
                     ((lambda (tmp_HcMpaS.2x)
                        (if tmp_HcMpaS.2x
                          (apply (lambda (step_139qdnMhkQ)
                                   ((lambda (tmp_G1ce8PILu)
                                      (if tmp_G1ce8PILu
                                        (apply (lambda ()
                                                 (list '#3(syntax-object
                                                           let
                                                           ((top)
                                                            #4(ribcage
                                                               #1(step)
                                                               #1((top))
                                                               #1("i"))
                                                            #4(ribcage
                                                               #7(_
                                                                  var
                                                                  init
                                                                  step
                                                                  e0
                                                                  e1
                                                                  c)
                                                               #7((top))
                                                               #7("i"
                                                                  "i"
                                                                  "i"
                                                                  "i"
                                                                  "i"
                                                                  "i"
                                                                  "i"))
                                                            #4(ribcage ())
                                                            #4(ribcage
                                                               #1(orig-x)
                                                               #1((top))
                                                               #1("i"))
                                                            #4(ribcage
                                                               (#2(import-token
                                                                   *top*))
                                                               ()
                                                               ())))
                                                       '#3(syntax-object
                                                           doloop
                                                           ((top)
                                                            #4(ribcage
                                                               #1(step)
                                                               #1((top))
                                                               #1("i"))
                                                            #4(ribcage
                                                               #7(_
                                                                  var
                                                                  init
                                                                  step
                                                                  e0
                                                                  e1
                                                                  c)
                                                               #7((top))
                                                               #7("i"
                                                                  "i"
                                                                  "i"
                                                                  "i"
                                                                  "i"
                                                                  "i"
                                                                  "i"))
                                                            #4(ribcage ())
                                                            #4(ribcage
                                                               #1(orig-x)
                                                               #1((top))
                                                               #1("i"))
                                                            #4(ribcage
                                                               (#2(import-token
                                                                   *top*))
                                                               ()
                                                               ())))
                                                       (map list
                                                            var_19vNV5hhj7
                                                            init_uar.uy.1R)
                                                       (list '#3(syntax-object
                                                                 if
                                                                 ((top)
                                                                  #4(ribcage
                                                                     #1(step)
                                                                     #1((top))
                                                                     #1("i"))
                                                                  #4(ribcage
                                                                     #7(_
                                                                        var
                                                                        init
                                                                        step
                                                                        e0
                                                                        e1
                                                                        c)
                                                                     #7((top))
                                                                     #7("i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"))
                                                                  #4(ribcage
                                                                     ()
                                                                     ()
                                                                     ())
                                                                  #4(ribcage
                                                                     #1(orig-x)
                                                                     #1((top))
                                                                     #1("i"))
                                                                  #4(ribcage
                                                                     (#2(import-token
                                                                         *top*))
                                                                     ()
                                                                     ())))
                                                             (list '#3(syntax-object
                                                                       not
                                                                       ((top)
                                                                        #4(ribcage
                                                                           #1(step)
                                                                           #1((top))
                                                                           #1("i"))
                                                                        #4(ribcage
                                                                           #7(_
                                                                              var
                                                                              init
                                                                              step
                                                                              e0
                                                                              e1
                                                                              c)
                                                                           #7((top)
                                                                              (top)
                                                                              (top)
                                                                              (top)
                                                                              (top)
                                                                              (top)
                                                                              (top))
                                                                           #7("i"
                                                                              "i"
                                                                              "i"
                                                                              "i"
                                                                              "i"
                                                                              "i"
                                                                              "i"))
                                                                        #4(ribcage
                                                                           ()
                                                                           ()
                                                                           ())
                                                                        #4(ribcage
                                                                           #1(orig-x)
                                                                           #1((top))
                                                                           #1("i"))
                                                                        #4(ribcage
                                                                           (#2(import-token
                                                                               *top*))
                                                                           ()
                                                                           ())))
                                                                   e0_CdhNW8IKA)
                                                             (cons '#3(syntax-object
                                                                       begin
                                                                       ((top)
                                                                        #4(ribcage
                                                                           #1(step)
                                                                           #1((top))
                                                                           #1("i"))
                                                                        #4(ribcage
                                                                           #7(_
                                                                              var
                                                                              init
                                                                              step
                                                                              e0
                                                                              e1
                                                                              c)
                                                                           #7((top)
                                                                              (top)
                                                                              (top)
                                                                              (top)
                                                                              (top)
                                                                              (top)
                                                                              (top))
                                                                           #7("i"
                                                                              "i"
                                                                              "i"
                                                                              "i"
                                                                              "i"
                                                                              "i"
                                                                              "i"))
                                                                        #4(ribcage
                                                                           ()
                                                                           ()
                                                                           ())
                                                                        #4(ribcage
                                                                           #1(orig-x)
                                                                           #1((top))
                                                                           #1("i"))
                                                                        #4(ribcage
                                                                           (#2(import-token
                                                                               *top*))
                                                                           ()
                                                                           ())))
                                                                   (append
                                                                     c_CTnKqT8a5
                                                                     (list (cons '#3(syntax-object
                                                                                     doloop
                                                                                     ((top)
                                                                                      #4(ribcage
                                                                                         #1(step)
                                                                                         #1((top))
                                                                                         #1("i"))
                                                                                      #4(ribcage
                                                                                         #7(_
                                                                                            var
                                                                                            init
                                                                                            step
                                                                                            e0
                                                                                            e1
                                                                                            c)
                                                                                         #7((top)
                                                                                            (top)
                                                                                            (top)
                                                                                            (top)
                                                                                            (top)
                                                                                            (top)
                                                                                            (top))
                                                                                         #7("i"
                                                                                            "i"
                                                                                            "i"
                                                                                            "i"
                                                                                            "i"
                                                                                            "i"
                                                                                            "i"))
                                                                                      #4(ribcage
                                                                                         ()
                                                                                         ()
                                                                                         ())
                                                                                      #4(ribcage
                                                                                         #1(orig-x)
                                                                                         #1((top))
                                                                                         #1("i"))
                                                                                      #4(ribcage
                                                                                         (#2(import-token
                                                                                             *top*))
                                                                                         ()
                                                                                         ())))
                                                                                 step_139qdnMhkQ)))))))
                                               tmp_G1ce8PILu)
                                        ((lambda (tmp_fgxvY2.2S)
                                           (if tmp_fgxvY2.2S
                                             (apply (lambda (e1_13kI6OwILC
                                                             e2_11LlBk88b2)
                                                      (list '#3(syntax-object
                                                                let
                                                                ((top)
                                                                 #4(ribcage
                                                                    #2(e1 e2)
                                                                    #2((top))
                                                                    #2("i"
                                                                       "i"))
                                                                 #4(ribcage
                                                                    #1(step)
                                                                    #1((top))
                                                                    #1("i"))
                                                                 #4(ribcage
                                                                    #7(_
                                                                       var
                                                                       init
                                                                       step
                                                                       e0
                                                                       e1
                                                                       c)
                                                                    #7((top))
                                                                    #7("i"
                                                                       "i"
                                                                       "i"
                                                                       "i"
                                                                       "i"
                                                                       "i"
                                                                       "i"))
                                                                 #4(ribcage ())
                                                                 #4(ribcage
                                                                    #1(orig-x)
                                                                    #1((top))
                                                                    #1("i"))
                                                                 #4(ribcage
                                                                    (#2(import-token
                                                                        *top*))
                                                                    ()
                                                                    ())))
                                                            '#3(syntax-object
                                                                doloop
                                                                ((top)
                                                                 #4(ribcage
                                                                    #2(e1 e2)
                                                                    #2((top))
                                                                    #2("i"
                                                                       "i"))
                                                                 #4(ribcage
                                                                    #1(step)
                                                                    #1((top))
                                                                    #1("i"))
                                                                 #4(ribcage
                                                                    #7(_
                                                                       var
                                                                       init
                                                                       step
                                                                       e0
                                                                       e1
                                                                       c)
                                                                    #7((top))
                                                                    #7("i"
                                                                       "i"
                                                                       "i"
                                                                       "i"
                                                                       "i"
                                                                       "i"
                                                                       "i"))
                                                                 #4(ribcage ())
                                                                 #4(ribcage
                                                                    #1(orig-x)
                                                                    #1((top))
                                                                    #1("i"))
                                                                 #4(ribcage
                                                                    (#2(import-token
                                                                        *top*))
                                                                    ()
                                                                    ())))
                                                            (map list
                                                                 var_19vNV5hhj7
                                                                 init_uar.uy.1R)
                                                            (list '#3(syntax-object
                                                                      if
                                                                      ((top)
                                                                       #4(ribcage
                                                                          #2(e1
                                                                             e2)
                                                                          #2((top)
                                                                             (top))
                                                                          #2("i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          #1(step)
                                                                          #1((top))
                                                                          #1("i"))
                                                                       #4(ribcage
                                                                          #7(_
                                                                             var
                                                                             init
                                                                             step
                                                                             e0
                                                                             e1
                                                                             c)
                                                                          #7((top)
                                                                             (top)
                                                                             (top)
                                                                             (top)
                                                                             (top)
                                                                             (top)
                                                                             (top))
                                                                          #7("i"
                                                                             "i"
                                                                             "i"
                                                                             "i"
                                                                             "i"
                                                                             "i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          ()
                                                                          ()
                                                                          ())
                                                                       #4(ribcage
                                                                          #1(orig-x)
                                                                          #1((top))
                                                                          #1("i"))
                                                                       #4(ribcage
                                                                          (#2(import-token
                                                                              *top*))
                                                                          ()
                                                                          ())))
                                                                  e0_CdhNW8IKA
                                                                  (cons '#3(syntax-object
                                                                            begin
                                                                            ((top)
                                                                             #4(ribcage
                                                                                #2(e1
                                                                                   e2)
                                                                                #2((top)
                                                                                   (top))
                                                                                #2("i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                #1(step)
                                                                                #1((top))
                                                                                #1("i"))
                                                                             #4(ribcage
                                                                                #7(_
                                                                                   var
                                                                                   init
                                                                                   step
                                                                                   e0
                                                                                   e1
                                                                                   c)
                                                                                #7((top)
                                                                                   (top)
                                                                                   (top)
                                                                                   (top)
                                                                                   (top)
                                                                                   (top)
                                                                                   (top))
                                                                                #7("i"
                                                                                   "i"
                                                                                   "i"
                                                                                   "i"
                                                                                   "i"
                                                                                   "i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                             #4(ribcage
                                                                                #1(orig-x)
                                                                                #1((top))
                                                                                #1("i"))
                                                                             #4(ribcage
                                                                                (#2(import-token
                                                                                    *top*))
                                                                                ()
                                                                                ())))
                                                                        (cons e1_13kI6OwILC
                                                                              e2_11LlBk88b2))
                                                                  (cons '#3(syntax-object
                                                                            begin
                                                                            ((top)
                                                                             #4(ribcage
                                                                                #2(e1
                                                                                   e2)
                                                                                #2((top)
                                                                                   (top))
                                                                                #2("i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                #1(step)
                                                                                #1((top))
                                                                                #1("i"))
                                                                             #4(ribcage
                                                                                #7(_
                                                                                   var
                                                                                   init
                                                                                   step
                                                                                   e0
                                                                                   e1
                                                                                   c)
                                                                                #7((top)
                                                                                   (top)
                                                                                   (top)
                                                                                   (top)
                                                                                   (top)
                                                                                   (top)
                                                                                   (top))
                                                                                #7("i"
                                                                                   "i"
                                                                                   "i"
                                                                                   "i"
                                                                                   "i"
                                                                                   "i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                             #4(ribcage
                                                                                #1(orig-x)
                                                                                #1((top))
                                                                                #1("i"))
                                                                             #4(ribcage
                                                                                (#2(import-token
                                                                                    *top*))
                                                                                ()
                                                                                ())))
                                                                        (append
                                                                          c_CTnKqT8a5
                                                                          (list (cons '#3(syntax-object
                                                                                          doloop
                                                                                          ((top)
                                                                                           #4(ribcage
                                                                                              #2(e1
                                                                                                 e2)
                                                                                              #2((top)
                                                                                                 (top))
                                                                                              #2("i"
                                                                                                 "i"))
                                                                                           #4(ribcage
                                                                                              #1(step)
                                                                                              #1((top))
                                                                                              #1("i"))
                                                                                           #4(ribcage
                                                                                              #7(_
                                                                                                 var
                                                                                                 init
                                                                                                 step
                                                                                                 e0
                                                                                                 e1
                                                                                                 c)
                                                                                              #7((top)
                                                                                                 (top)
                                                                                                 (top)
                                                                                                 (top)
                                                                                                 (top)
                                                                                                 (top)
                                                                                                 (top))
                                                                                              #7("i"
                                                                                                 "i"
                                                                                                 "i"
                                                                                                 "i"
                                                                                                 "i"
                                                                                                 "i"
                                                                                                 "i"))
                                                                                           #4(ribcage
                                                                                              ()
                                                                                              ()
                                                                                              ())
                                                                                           #4(ribcage
                                                                                              #1(orig-x)
                                                                                              #1((top))
                                                                                              #1("i"))
                                                                                           #4(ribcage
                                                                                              (#2(import-token
                                                                                                  *top*))
                                                                                              ()
                                                                                              ())))
                                                                                      step_139qdnMhkQ)))))))
                                                    tmp_fgxvY2.2S)
                                             (syntax-error e1_wp88MgIKB)))
                                         ($syntax-dispatch
                                           (compile-in-annotation
                                             e1_wp88MgIKB
                                             value)
                                           '(any . each-any)))))
                                    ($syntax-dispatch
                                      (compile-in-annotation
                                        e1_wp88MgIKB
                                        value)
                                      '())))
                                 tmp_HcMpaS.2x)
                          (syntax-error tmp_hqMcd9RTS)))
                      ($syntax-dispatch
                        (compile-in-annotation tmp_hqMcd9RTS value)
                        'each-any)))
                   (map (lambda (v_n1J2QBRUU s_17.Jhddhkl)
                          ((lambda (tmp_xjU.cnzCH)
                             (if tmp_xjU.cnzCH
                               (apply (lambda () v_n1J2QBRUU) tmp_xjU.cnzCH)
                               ((lambda (tmp_Ust4knzCI)
                                  (if tmp_Ust4knzCI
                                    (apply (lambda (e_2mk2oj8bl) e_2mk2oj8bl)
                                           tmp_Ust4knzCI)
                                    (syntax-error orig-x_o8u9lnzB2)))
                                ($syntax-dispatch
                                  (compile-in-annotation s_17.Jhddhkl value)
                                  '(any)))))
                           ($syntax-dispatch
                             (compile-in-annotation s_17.Jhddhkl value)
                             '())))
                        var_19vNV5hhj7
                        step_QfVtdKzBq)))
                tmp_SJLr0qqse)
         (syntax-error orig-x_o8u9lnzB2)))
     ($syntax-dispatch
       (compile-in-annotation orig-x_o8u9lnzB2 value)
       '(any #2(each (any any . any))
             (any . each-any)
             .
             each-any)))))
($sc-put-cte
  'quasiquote
  (letrec ((quasi_ctv6yi.di
             (lambda (p_7l25BhR9C lev_wzP.D0I0u)
               ((lambda (tmp_MlbABW.iR)
                  (if tmp_MlbABW.iR
                    (apply (lambda (p_sE4J8j8tQ)
                             (if (= lev_wzP.D0I0u '0)
                               p_sE4J8j8tQ
                               (quasicons_i0AFeEhvy
                                 '#3(syntax-object
                                     'unquote
                                     ((top)
                                      #4(ribcage #1(p) #1((top)) #1("i"))
                                      #4(ribcage ())
                                      #4(ribcage
                                         #2(p lev)
                                         #2((top))
                                         #2("i" "i"))
                                      #4(ribcage
                                         #9(isquote?
                                            islist?
                                            iscons?
                                            quote-nil?
                                            quasilist*
                                            quasicons
                                            quasiappend
                                            quasivector
                                            quasi)
                                         #9((top))
                                         #9("i"
                                            "i"
                                            "i"
                                            "i"
                                            "i"
                                            "i"
                                            "i"
                                            "i"
                                            "i"))
                                      #4(ribcage (#2(import-token *top*)) ())))
                                 (quasi_ctv6yi.di
                                   (list p_sE4J8j8tQ)
                                   (- lev_wzP.D0I0u '1)))))
                           tmp_MlbABW.iR)
                    ((lambda (tmp_CCruDTI0H)
                       (if tmp_CCruDTI0H
                         (apply (lambda (p_fyGxb8sp q_H92GF3zTR)
                                  (if (= lev_wzP.D0I0u '0)
                                    (quasilist*_3BIxdS.df
                                      p_fyGxb8sp
                                      (quasi_ctv6yi.di
                                        q_H92GF3zTR
                                        lev_wzP.D0I0u))
                                    (quasicons_i0AFeEhvy
                                      (quasicons_i0AFeEhvy
                                        '#3(syntax-object
                                            'unquote
                                            ((top)
                                             #4(ribcage
                                                #2(p q)
                                                #2((top))
                                                #2("i" "i"))
                                             #4(ribcage ())
                                             #4(ribcage
                                                #2(p lev)
                                                #2((top))
                                                #2("i" "i"))
                                             #4(ribcage
                                                #9(isquote?
                                                   islist?
                                                   iscons?
                                                   quote-nil?
                                                   quasilist*
                                                   quasicons
                                                   quasiappend
                                                   quasivector
                                                   quasi)
                                                #9((top))
                                                #9("i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"))
                                             #4(ribcage
                                                (#2(import-token *top*))
                                                ()
                                                ())))
                                        (quasi_ctv6yi.di
                                          p_fyGxb8sp
                                          (- lev_wzP.D0I0u '1)))
                                      (quasi_ctv6yi.di
                                        q_H92GF3zTR
                                        lev_wzP.D0I0u))))
                                tmp_CCruDTI0H)
                         ((lambda (tmp_8JbW2L8re)
                            (if tmp_8JbW2L8re
                              (apply (lambda (p_yz3yr4I1u q_ZYFcjURaE)
                                       (if (= lev_wzP.D0I0u '0)
                                         (quasiappend_HxPEexR48
                                           p_yz3yr4I1u
                                           (quasi_ctv6yi.di
                                             q_ZYFcjURaE
                                             lev_wzP.D0I0u))
                                         (quasicons_i0AFeEhvy
                                           (quasicons_i0AFeEhvy
                                             '#3(syntax-object
                                                 'unquote-splicing
                                                 ((top)
                                                  #4(ribcage
                                                     #2(p q)
                                                     #2((top))
                                                     #2("i" "i"))
                                                  #4(ribcage ())
                                                  #4(ribcage
                                                     #2(p lev)
                                                     #2((top))
                                                     #2("i" "i"))
                                                  #4(ribcage
                                                     #9(isquote?
                                                        islist?
                                                        iscons?
                                                        quote-nil?
                                                        quasilist*
                                                        quasicons
                                                        quasiappend
                                                        quasivector
                                                        quasi)
                                                     #9((top))
                                                     #9("i"
                                                        "i"
                                                        "i"
                                                        "i"
                                                        "i"
                                                        "i"
                                                        "i"
                                                        "i"
                                                        "i"))
                                                  #4(ribcage
                                                     (#2(import-token *top*))
                                                     ()
                                                     ())))
                                             (quasi_ctv6yi.di
                                               p_yz3yr4I1u
                                               (- lev_wzP.D0I0u '1)))
                                           (quasi_ctv6yi.di
                                             q_ZYFcjURaE
                                             lev_wzP.D0I0u))))
                                     tmp_8JbW2L8re)
                              ((lambda (tmp_VKT3DqqJy)
                                 (if tmp_VKT3DqqJy
                                   (apply (lambda (p_fvHHkT8sN)
                                            (quasicons_i0AFeEhvy
                                              '#3(syntax-object
                                                  'quasiquote
                                                  ((top)
                                                   #4(ribcage
                                                      #1(p)
                                                      #1((top))
                                                      #1("i"))
                                                   #4(ribcage ())
                                                   #4(ribcage
                                                      #2(p lev)
                                                      #2((top))
                                                      #2("i" "i"))
                                                   #4(ribcage
                                                      #9(isquote?
                                                         islist?
                                                         iscons?
                                                         quote-nil?
                                                         quasilist*
                                                         quasicons
                                                         quasiappend
                                                         quasivector
                                                         quasi)
                                                      #9((top))
                                                      #9("i"
                                                         "i"
                                                         "i"
                                                         "i"
                                                         "i"
                                                         "i"
                                                         "i"
                                                         "i"
                                                         "i"))
                                                   #4(ribcage
                                                      (#2(import-token *top*))
                                                      ()
                                                      ())))
                                              (quasi_ctv6yi.di
                                                (list p_fvHHkT8sN)
                                                (+ lev_wzP.D0I0u '1))))
                                          tmp_VKT3DqqJy)
                                   ((lambda (tmp_Vg.gy..i9)
                                      (if tmp_Vg.gy..i9
                                        (apply (lambda (p_n8gt0NRap
                                                        q_11f447q.jz)
                                                 (quasicons_i0AFeEhvy
                                                   (quasi_ctv6yi.di
                                                     p_n8gt0NRap
                                                     lev_wzP.D0I0u)
                                                   (quasi_ctv6yi.di
                                                     q_11f447q.jz
                                                     lev_wzP.D0I0u)))
                                               tmp_Vg.gy..i9)
                                        ((lambda (tmp_NbDxqIhAx)
                                           (if tmp_NbDxqIhAx
                                             (apply (lambda (x_CvGTKIhBH)
                                                      (quasivector_KSy1LvzNR
                                                        (quasi_ctv6yi.di
                                                          x_CvGTKIhBH
                                                          lev_wzP.D0I0u)))
                                                    tmp_NbDxqIhAx)
                                             (list '#3(syntax-object
                                                       quote
                                                       ((top)
                                                        #4(ribcage
                                                           #1(p)
                                                           #1((top))
                                                           #1("i"))
                                                        #4(ribcage ())
                                                        #4(ribcage
                                                           #2(p lev)
                                                           #2((top))
                                                           #2("i" "i"))
                                                        #4(ribcage
                                                           #9(isquote?
                                                              islist?
                                                              iscons?
                                                              quote-nil?
                                                              quasilist*
                                                              quasicons
                                                              quasiappend
                                                              quasivector
                                                              quasi)
                                                           #9((top))
                                                           #9("i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"))
                                                        #4(ribcage
                                                           (#2(import-token
                                                               *top*))
                                                           ()
                                                           ())))
                                                   p_7l25BhR9C)))
                                         ($syntax-dispatch
                                           (compile-in-annotation
                                             p_7l25BhR9C
                                             value)
                                           '#2(vector each-any)))))
                                    ($syntax-dispatch
                                      (compile-in-annotation p_7l25BhR9C value)
                                      '(any . any)))))
                               ($syntax-dispatch
                                 (compile-in-annotation p_7l25BhR9C value)
                                 '(#2(free-id
                                      #3(syntax-object
                                         quasiquote
                                         ((top)
                                          #4(ribcage ())
                                          #4(ribcage
                                             #2(p lev)
                                             #2((top))
                                             #2("i" "i"))
                                          #4(ribcage
                                             #9(isquote?
                                                islist?
                                                iscons?
                                                quote-nil?
                                                quasilist*
                                                quasicons
                                                quasiappend
                                                quasivector
                                                quasi)
                                             #9((top))
                                             #9("i"
                                                "i"
                                                "i"
                                                "i"
                                                "i"
                                                "i"
                                                "i"
                                                "i"
                                                "i"))
                                          #4(ribcage
                                             (#2(import-token *top*))
                                             ()
                                             ()))))
                                   any)))))
                          ($syntax-dispatch
                            (compile-in-annotation p_7l25BhR9C value)
                            '((#2(free-id
                                  #3(syntax-object
                                     unquote-splicing
                                     ((top)
                                      #4(ribcage ())
                                      #4(ribcage
                                         #2(p lev)
                                         #2((top))
                                         #2("i" "i"))
                                      #4(ribcage
                                         #9(isquote?
                                            islist?
                                            iscons?
                                            quote-nil?
                                            quasilist*
                                            quasicons
                                            quasiappend
                                            quasivector
                                            quasi)
                                         #9((top))
                                         #9("i"
                                            "i"
                                            "i"
                                            "i"
                                            "i"
                                            "i"
                                            "i"
                                            "i"
                                            "i"))
                                      #4(ribcage
                                         (#2(import-token *top*))
                                         ()
                                         ()))))
                               .
                               each-any)
                              .
                              any)))))
                     ($syntax-dispatch
                       (compile-in-annotation p_7l25BhR9C value)
                       '((#2(free-id
                             #3(syntax-object
                                unquote
                                ((top)
                                 #4(ribcage ())
                                 #4(ribcage #2(p lev) #2((top)) #2("i" "i"))
                                 #4(ribcage
                                    #9(isquote?
                                       islist?
                                       iscons?
                                       quote-nil?
                                       quasilist*
                                       quasicons
                                       quasiappend
                                       quasivector
                                       quasi)
                                    #9((top))
                                    #9("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                                 #4(ribcage (#2(import-token *top*)) ()))))
                          .
                          each-any)
                         .
                         any)))))
                ($syntax-dispatch
                  (compile-in-annotation p_7l25BhR9C value)
                  '(#2(free-id
                       #3(syntax-object
                          unquote
                          ((top)
                           #4(ribcage ())
                           #4(ribcage #2(p lev) #2((top)) #2("i" "i"))
                           #4(ribcage
                              #9(isquote?
                                 islist?
                                 iscons?
                                 quote-nil?
                                 quasilist*
                                 quasicons
                                 quasiappend
                                 quasivector
                                 quasi)
                              #9((top))
                              #9("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                           #4(ribcage (#2(import-token *top*)) ()))))
                    any)))))
           (quasivector_KSy1LvzNR
             (lambda (x_dsicdFR7w)
               ((lambda (tmp_MOuIZe.gU)
                  (if (if tmp_MOuIZe.gU
                        (apply (lambda (quote?_3g1iyJR9y x_9EBxQ5hA.)
                                 (isquote?_YbmFaGzMM quote?_3g1iyJR9y))
                               tmp_MOuIZe.gU)
                        '#f)
                    (apply (lambda (quote?_nMHG9i.is x_V9lAtR9k)
                             (list '#3(syntax-object
                                       quote
                                       ((top)
                                        #4(ribcage
                                           #2(quote? x)
                                           #2((top))
                                           #2("i" "i"))
                                        #4(ribcage #1(pat-x) #1((top)) #1("i"))
                                        #4(ribcage ())
                                        #4(ribcage #1(x) #1((top)) #1("i"))
                                        #4(ribcage
                                           #9(isquote?
                                              islist?
                                              iscons?
                                              quote-nil?
                                              quasilist*
                                              quasicons
                                              quasiappend
                                              quasivector
                                              quasi)
                                           #9((top))
                                           #9("i"
                                              "i"
                                              "i"
                                              "i"
                                              "i"
                                              "i"
                                              "i"
                                              "i"
                                              "i"))
                                        #4(ribcage
                                           (#2(import-token *top*))
                                           ()
                                           ())))
                                   (list->vector x_V9lAtR9k)))
                           tmp_MOuIZe.gU)
                    ((letrec ((f_YHpMq9hyg
                                (lambda (x_13J4etv8pa k_PURZNJqHt)
                                  ((lambda (tmp_Un0.aEIZV)
                                     (if (if tmp_Un0.aEIZV
                                           (apply (lambda (quote?_reW1rz8qm
                                                           x_ttGo76.he)
                                                    (isquote?_YbmFaGzMM
                                                      quote?_reW1rz8qm))
                                                  tmp_Un0.aEIZV)
                                           '#f)
                                       (apply (lambda (quote?_whNLGr8qb
                                                       x_15s.EBAI.M)
                                                (k_PURZNJqHt
                                                  (map (lambda (tmp_Lxnm8m.hc)
                                                         (list '#3(syntax-object
                                                                   quote
                                                                   ((top)
                                                                    #4(ribcage
                                                                       #2(quote?
                                                                          x)
                                                                       #2((top)
                                                                          (top))
                                                                       #2("i"
                                                                          "i"))
                                                                    #4(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                    #4(ribcage
                                                                       #2(x k)
                                                                       #2((top)
                                                                          (top))
                                                                       #2("i"
                                                                          "i"))
                                                                    #4(ribcage
                                                                       #1(f)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       #1(_)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       #1(pat-x)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                    #4(ribcage
                                                                       #1(x)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       #9(isquote?
                                                                          islist?
                                                                          iscons?
                                                                          quote-nil?
                                                                          quasilist*
                                                                          quasicons
                                                                          quasiappend
                                                                          quasivector
                                                                          quasi)
                                                                       #9((top)
                                                                          (top)
                                                                          (top)
                                                                          (top)
                                                                          (top)
                                                                          (top)
                                                                          (top)
                                                                          (top)
                                                                          (top))
                                                                       #9("i"
                                                                          "i"
                                                                          "i"
                                                                          "i"
                                                                          "i"
                                                                          "i"
                                                                          "i"
                                                                          "i"
                                                                          "i"))
                                                                    #4(ribcage
                                                                       (#2(import-token
                                                                           *top*))
                                                                       ()
                                                                       ())))
                                                               tmp_Lxnm8m.hc))
                                                       x_15s.EBAI.M)))
                                              tmp_Un0.aEIZV)
                                       ((lambda (tmp_74nR2e.hn)
                                          (if (if tmp_74nR2e.hn
                                                (apply (lambda (listp_kv76aMhzc
                                                                x_yqjtbvzRz)
                                                         (islist?_syWCS.dd
                                                           listp_kv76aMhzc))
                                                       tmp_74nR2e.hn)
                                                '#f)
                                            (apply (lambda (listp_9L8Y0hhz2
                                                            x_12B9yxr8qV)
                                                     (k_PURZNJqHt
                                                       x_12B9yxr8qV))
                                                   tmp_74nR2e.hn)
                                            ((lambda (tmp_AEbN46qIR)
                                               (if (if tmp_AEbN46qIR
                                                     (apply (lambda (cons?_Ea0p3wI.o
                                                                     x_jsK6G9hzZ
                                                                     y_k9dcpe.hH)
                                                              (iscons?_15hNmsxqEF
                                                                cons?_Ea0p3wI.o))
                                                            tmp_AEbN46qIR)
                                                     '#f)
                                                 (apply (lambda (cons?_bumMfaqIW
                                                                 x_11DmdDQhzO
                                                                 y_s9HfJy.hx)
                                                          (f_YHpMq9hyg
                                                            y_s9HfJy.hx
                                                            (lambda (ls_dbvL6cI.j)
                                                              (k_PURZNJqHt
                                                                (cons x_11DmdDQhzO
                                                                      ls_dbvL6cI.j)))))
                                                        tmp_AEbN46qIR)
                                                 (list '#3(syntax-object
                                                           list->vector
                                                           ((top)
                                                            #4(ribcage
                                                               #1(else)
                                                               #1((top))
                                                               #1("i"))
                                                            #4(ribcage ())
                                                            #4(ribcage
                                                               #2(x k)
                                                               #2((top))
                                                               #2("i" "i"))
                                                            #4(ribcage
                                                               #1(f)
                                                               #1((top))
                                                               #1("i"))
                                                            #4(ribcage
                                                               #1(_)
                                                               #1((top))
                                                               #1("i"))
                                                            #4(ribcage
                                                               #1(pat-x)
                                                               #1((top))
                                                               #1("i"))
                                                            #4(ribcage ())
                                                            #4(ribcage
                                                               #1(x)
                                                               #1((top))
                                                               #1("i"))
                                                            #4(ribcage
                                                               #9(isquote?
                                                                  islist?
                                                                  iscons?
                                                                  quote-nil?
                                                                  quasilist*
                                                                  quasicons
                                                                  quasiappend
                                                                  quasivector
                                                                  quasi)
                                                               #9((top))
                                                               #9("i"
                                                                  "i"
                                                                  "i"
                                                                  "i"
                                                                  "i"
                                                                  "i"
                                                                  "i"
                                                                  "i"
                                                                  "i"))
                                                            #4(ribcage
                                                               (#2(import-token
                                                                   *top*))
                                                               ()
                                                               ())))
                                                       x_dsicdFR7w)))
                                             ($syntax-dispatch
                                               (compile-in-annotation
                                                 x_13J4etv8pa
                                                 value)
                                               '(any any any)))))
                                        ($syntax-dispatch
                                          (compile-in-annotation
                                            x_13J4etv8pa
                                            value)
                                          '(any . each-any)))))
                                   ($syntax-dispatch
                                     (compile-in-annotation x_13J4etv8pa value)
                                     '(any each-any))))))
                       f_YHpMq9hyg)
                     x_dsicdFR7w
                     (lambda (ls_W02.L.zSS)
                       (cons '#3(syntax-object
                                 vector
                                 ((top)
                                  #4(ribcage ())
                                  #4(ribcage #1(ls) #1((top)) #1("i"))
                                  #4(ribcage #1(_) #1((top)) #1("i"))
                                  #4(ribcage #1(pat-x) #1((top)) #1("i"))
                                  #4(ribcage ())
                                  #4(ribcage #1(x) #1((top)) #1("i"))
                                  #4(ribcage
                                     #9(isquote?
                                        islist?
                                        iscons?
                                        quote-nil?
                                        quasilist*
                                        quasicons
                                        quasiappend
                                        quasivector
                                        quasi)
                                     #9((top))
                                     #9("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                                  #4(ribcage (#2(import-token *top*)) ())))
                             ls_W02.L.zSS)))))
                ($syntax-dispatch
                  (compile-in-annotation x_dsicdFR7w value)
                  '(any each-any)))))
           (quasiappend_HxPEexR48
             (lambda (x_yXVu988oJ y_rBk772qG1)
               ((lambda (ls_7YV18L8oO)
                  (if (null? ls_7YV18L8oO)
                    '#3(syntax-object
                        '()
                        ((top)
                         #4(ribcage ())
                         #4(ribcage #1(ls) #1((top)) #1("i"))
                         #4(ribcage ())
                         #4(ribcage #2(x y) #2((top)) #2("i" "i"))
                         #4(ribcage
                            #9(isquote?
                               islist?
                               iscons?
                               quote-nil?
                               quasilist*
                               quasicons
                               quasiappend
                               quasivector
                               quasi)
                            #9((top))
                            #9("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                         #4(ribcage (#2(import-token *top*)) ())))
                    (if (null? (cdr ls_7YV18L8oO))
                      (car ls_7YV18L8oO)
                      ((lambda (tmp_BPyag1hxb)
                         (if tmp_BPyag1hxb
                           (apply (lambda (p_Yj7DVK.fZ)
                                    (cons '#3(syntax-object
                                              append
                                              ((top)
                                               #4(ribcage
                                                  #1(p)
                                                  #1((top))
                                                  #1("i"))
                                               #4(ribcage ())
                                               #4(ribcage
                                                  #1(ls)
                                                  #1((top))
                                                  #1("i"))
                                               #4(ribcage ())
                                               #4(ribcage
                                                  #2(x y)
                                                  #2((top))
                                                  #2("i" "i"))
                                               #4(ribcage
                                                  #9(isquote?
                                                     islist?
                                                     iscons?
                                                     quote-nil?
                                                     quasilist*
                                                     quasicons
                                                     quasiappend
                                                     quasivector
                                                     quasi)
                                                  #9((top))
                                                  #9("i"
                                                     "i"
                                                     "i"
                                                     "i"
                                                     "i"
                                                     "i"
                                                     "i"
                                                     "i"
                                                     "i"))
                                               #4(ribcage
                                                  (#2(import-token *top*))
                                                  ()
                                                  ())))
                                          p_Yj7DVK.fZ))
                                  tmp_BPyag1hxb)
                           (syntax-error ls_7YV18L8oO)))
                       ($syntax-dispatch
                         (compile-in-annotation ls_7YV18L8oO value)
                         'each-any)))))
                ((letrec ((f_Xn.2mmqHJ
                            (lambda (x_178VY71hyD)
                              (if (null? x_178VY71hyD)
                                (if (quote-nil?_114FZ8hhvx y_rBk772qG1)
                                  '()
                                  (list y_rBk772qG1))
                                (if (quote-nil?_114FZ8hhvx (car x_178VY71hyD))
                                  (f_Xn.2mmqHJ (cdr x_178VY71hyD))
                                  (cons (car x_178VY71hyD)
                                        (f_Xn.2mmqHJ (cdr x_178VY71hyD))))))))
                   f_Xn.2mmqHJ)
                 x_yXVu988oJ))))
           (quasicons_i0AFeEhvy
             (lambda (x_KE7HEb8nA y_c2rwLRqFT)
               ((lambda (tmp_j2s5VshwO)
                  ((lambda (tmp_cLL0PshwS)
                     (if tmp_cLL0PshwS
                       (apply (lambda (x_Vh.DqS.eF y_mIJxz9R5x)
                                ((lambda (tmp_gqk5XkIXu)
                                   (if (if tmp_gqk5XkIXu
                                         (apply (lambda (quote?_yKuEqeqGW
                                                         dy_.DLFqfzP5)
                                                  (isquote?_YbmFaGzMM
                                                    quote?_yKuEqeqGW))
                                                tmp_gqk5XkIXu)
                                         '#f)
                                     (apply (lambda (quote?_YqrggOzOB
                                                     dy_8qv3fu.e2)
                                              ((lambda (tmp_5mFI6GzOH)
                                                 (if (if tmp_5mFI6GzOH
                                                       (apply (lambda (quote?_5T8p1n8oA
                                                                       dx_pUcEUBqGT)
                                                                (isquote?_YbmFaGzMM
                                                                  quote?_5T8p1n8oA))
                                                              tmp_5mFI6GzOH)
                                                       '#f)
                                                   (apply (lambda (quote?_qqZCqBR6d
                                                                   dx_yeBCdEhxF)
                                                            (list '#3(syntax-object
                                                                      quote
                                                                      ((top)
                                                                       #4(ribcage
                                                                          #2(quote?
                                                                             dx)
                                                                          #2((top)
                                                                             (top))
                                                                          #2("i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          #2(quote?
                                                                             dy)
                                                                          #2((top)
                                                                             (top))
                                                                          #2("i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          #2(x
                                                                             y)
                                                                          #2((top)
                                                                             (top))
                                                                          #2("i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          ()
                                                                          ()
                                                                          ())
                                                                       #4(ribcage
                                                                          #2(x
                                                                             y)
                                                                          #2((top)
                                                                             (top))
                                                                          #2("i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          #9(isquote?
                                                                             islist?
                                                                             iscons?
                                                                             quote-nil?
                                                                             quasilist*
                                                                             quasicons
                                                                             quasiappend
                                                                             quasivector
                                                                             quasi)
                                                                          #9((top)
                                                                             (top)
                                                                             (top)
                                                                             (top)
                                                                             (top)
                                                                             (top)
                                                                             (top)
                                                                             (top)
                                                                             (top))
                                                                          #9("i"
                                                                             "i"
                                                                             "i"
                                                                             "i"
                                                                             "i"
                                                                             "i"
                                                                             "i"
                                                                             "i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          (#2(import-token
                                                                              *top*))
                                                                          ()
                                                                          ())))
                                                                  (cons dx_yeBCdEhxF
                                                                        dy_8qv3fu.e2)))
                                                          tmp_5mFI6GzOH)
                                                   (if (null? dy_8qv3fu.e2)
                                                     (list '#3(syntax-object
                                                               list
                                                               ((top)
                                                                #4(ribcage
                                                                   #1(_)
                                                                   #1((top))
                                                                   #1("i"))
                                                                #4(ribcage
                                                                   #2(quote?
                                                                      dy)
                                                                   #2((top))
                                                                   #2("i" "i"))
                                                                #4(ribcage
                                                                   #2(x y)
                                                                   #2((top))
                                                                   #2("i" "i"))
                                                                #4(ribcage ())
                                                                #4(ribcage
                                                                   #2(x y)
                                                                   #2((top))
                                                                   #2("i" "i"))
                                                                #4(ribcage
                                                                   #9(isquote?
                                                                      islist?
                                                                      iscons?
                                                                      quote-nil?
                                                                      quasilist*
                                                                      quasicons
                                                                      quasiappend
                                                                      quasivector
                                                                      quasi)
                                                                   #9((top))
                                                                   #9("i"
                                                                      "i"
                                                                      "i"
                                                                      "i"
                                                                      "i"
                                                                      "i"
                                                                      "i"
                                                                      "i"
                                                                      "i"))
                                                                #4(ribcage
                                                                   (#2(import-token
                                                                       *top*))
                                                                   ()
                                                                   ())))
                                                           x_Vh.DqS.eF)
                                                     (list '#3(syntax-object
                                                               cons
                                                               ((top)
                                                                #4(ribcage
                                                                   #1(_)
                                                                   #1((top))
                                                                   #1("i"))
                                                                #4(ribcage
                                                                   #2(quote?
                                                                      dy)
                                                                   #2((top))
                                                                   #2("i" "i"))
                                                                #4(ribcage
                                                                   #2(x y)
                                                                   #2((top))
                                                                   #2("i" "i"))
                                                                #4(ribcage ())
                                                                #4(ribcage
                                                                   #2(x y)
                                                                   #2((top))
                                                                   #2("i" "i"))
                                                                #4(ribcage
                                                                   #9(isquote?
                                                                      islist?
                                                                      iscons?
                                                                      quote-nil?
                                                                      quasilist*
                                                                      quasicons
                                                                      quasiappend
                                                                      quasivector
                                                                      quasi)
                                                                   #9((top))
                                                                   #9("i"
                                                                      "i"
                                                                      "i"
                                                                      "i"
                                                                      "i"
                                                                      "i"
                                                                      "i"
                                                                      "i"
                                                                      "i"))
                                                                #4(ribcage
                                                                   (#2(import-token
                                                                       *top*))
                                                                   ()
                                                                   ())))
                                                           x_Vh.DqS.eF
                                                           y_mIJxz9R5x))))
                                               ($syntax-dispatch
                                                 (compile-in-annotation
                                                   x_Vh.DqS.eF
                                                   value)
                                                 '(any any))))
                                            tmp_gqk5XkIXu)
                                     ((lambda (tmp_E1Kgnwhw4)
                                        (if (if tmp_E1Kgnwhw4
                                              (apply (lambda (listp_R0VmTO.eY
                                                              stuff_wCQ7fEIXH)
                                                       (islist?_syWCS.dd
                                                         listp_R0VmTO.eY))
                                                     tmp_E1Kgnwhw4)
                                              '#f)
                                          (apply (lambda (listp_t77Z8v8n1
                                                          stuff_9gbbMgIXC)
                                                   (cons '#3(syntax-object
                                                             list
                                                             ((top)
                                                              #4(ribcage
                                                                 #2(listp
                                                                    stuff)
                                                                 #2((top))
                                                                 #2("i" "i"))
                                                              #4(ribcage
                                                                 #2(x y)
                                                                 #2((top))
                                                                 #2("i" "i"))
                                                              #4(ribcage ())
                                                              #4(ribcage
                                                                 #2(x y)
                                                                 #2((top))
                                                                 #2("i" "i"))
                                                              #4(ribcage
                                                                 #9(isquote?
                                                                    islist?
                                                                    iscons?
                                                                    quote-nil?
                                                                    quasilist*
                                                                    quasicons
                                                                    quasiappend
                                                                    quasivector
                                                                    quasi)
                                                                 #9((top))
                                                                 #9("i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"))
                                                              #4(ribcage
                                                                 (#2(import-token
                                                                     *top*))
                                                                 ()
                                                                 ())))
                                                         (cons x_Vh.DqS.eF
                                                               stuff_9gbbMgIXC)))
                                                 tmp_E1Kgnwhw4)
                                          (list '#3(syntax-object
                                                    cons
                                                    ((top)
                                                     #4(ribcage
                                                        #1(else)
                                                        #1((top))
                                                        #1("i"))
                                                     #4(ribcage
                                                        #2(x y)
                                                        #2((top))
                                                        #2("i" "i"))
                                                     #4(ribcage ())
                                                     #4(ribcage
                                                        #2(x y)
                                                        #2((top))
                                                        #2("i" "i"))
                                                     #4(ribcage
                                                        #9(isquote?
                                                           islist?
                                                           iscons?
                                                           quote-nil?
                                                           quasilist*
                                                           quasicons
                                                           quasiappend
                                                           quasivector
                                                           quasi)
                                                        #9((top))
                                                        #9("i"
                                                           "i"
                                                           "i"
                                                           "i"
                                                           "i"
                                                           "i"
                                                           "i"
                                                           "i"
                                                           "i"))
                                                     #4(ribcage
                                                        (#2(import-token
                                                            *top*))
                                                        ()
                                                        ())))
                                                x_Vh.DqS.eF
                                                y_mIJxz9R5x)))
                                      ($syntax-dispatch
                                        (compile-in-annotation
                                          y_mIJxz9R5x
                                          value)
                                        '(any . any)))))
                                 ($syntax-dispatch
                                   (compile-in-annotation y_mIJxz9R5x value)
                                   '(any any))))
                              tmp_cLL0PshwS)
                       (syntax-error tmp_j2s5VshwO)))
                   ($syntax-dispatch
                     (compile-in-annotation tmp_j2s5VshwO value)
                     '(any any))))
                (list x_KE7HEb8nA y_c2rwLRqFT))))
           (quasilist*_3BIxdS.df
             (lambda (x_zuZRNX8mk y_s2SrsxqEC)
               ((letrec ((f_9B5ehwhwx
                           (lambda (x_RU5aKVqFJ)
                             (if (null? x_RU5aKVqFJ)
                               y_s2SrsxqEC
                               (quasicons_i0AFeEhvy
                                 (car x_RU5aKVqFJ)
                                 (f_9B5ehwhwx (cdr x_RU5aKVqFJ)))))))
                  f_9B5ehwhwx)
                x_zuZRNX8mk)))
           (quote-nil?_114FZ8hhvx
             (lambda (x_s.ukroIWJ)
               ((lambda (tmp_8bIRfbzNF)
                  (if tmp_8bIRfbzNF
                    (apply (lambda (quote?_H5nOGdhvp)
                             (isquote?_YbmFaGzMM quote?_H5nOGdhvp))
                           tmp_8bIRfbzNF)
                    '#f))
                ($syntax-dispatch
                  (compile-in-annotation x_s.ukroIWJ value)
                  '(any ())))))
           (iscons?_15hNmsxqEF
             (lambda (x_17.miPGzNo)
               (if (identifier? x_17.miPGzNo)
                 (free-identifier=?
                   x_17.miPGzNo
                   '#3(syntax-object
                       cons
                       ((top)
                        #4(ribcage ())
                        #4(ribcage #1(x) #1((top)) #1("i"))
                        #4(ribcage
                           #9(isquote?
                              islist?
                              iscons?
                              quote-nil?
                              quasilist*
                              quasicons
                              quasiappend
                              quasivector
                              quasi)
                           #9((top))
                           #9("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                        #4(ribcage (#2(import-token *top*)) ()))))
                 '#f)))
           (islist?_syWCS.dd
             (lambda (x_.ynbydR4y)
               (if (identifier? x_.ynbydR4y)
                 (free-identifier=?
                   x_.ynbydR4y
                   '#3(syntax-object
                       list
                       ((top)
                        #4(ribcage ())
                        #4(ribcage #1(x) #1((top)) #1("i"))
                        #4(ribcage
                           #9(isquote?
                              islist?
                              iscons?
                              quote-nil?
                              quasilist*
                              quasicons
                              quasiappend
                              quasivector
                              quasi)
                           #9((top))
                           #9("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                        #4(ribcage (#2(import-token *top*)) ()))))
                 '#f)))
           (isquote?_YbmFaGzMM
             (lambda (x_iRwWvUhvR)
               (if (identifier? x_iRwWvUhvR)
                 (free-identifier=?
                   x_iRwWvUhvR
                   '#3(syntax-object
                       quote
                       ((top)
                        #4(ribcage ())
                        #4(ribcage #1(x) #1((top)) #1("i"))
                        #4(ribcage
                           #9(isquote?
                              islist?
                              iscons?
                              quote-nil?
                              quasilist*
                              quasicons
                              quasiappend
                              quasivector
                              quasi)
                           #9((top))
                           #9("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                        #4(ribcage (#2(import-token *top*)) ()))))
                 '#f))))
    (lambda (x_18aJNx88my)
      ((lambda (tmp_VrQzkvzN2)
         (if tmp_VrQzkvzN2
           (apply (lambda (__rZZf0ZqEV e_sDNY9CzN4)
                    (quasi_ctv6yi.di e_sDNY9CzN4 '0))
                  tmp_VrQzkvzN2)
           (syntax-error x_18aJNx88my)))
       ($syntax-dispatch
         (compile-in-annotation x_18aJNx88my value)
         '(any any))))))
($sc-put-cte
  'include
  (lambda (x_xFWIDr8Uy)
    (letrec ((read-file_ijKtBv8Uz
               (lambda (fn_Gww.Lm.M. k_2gSdvQh3i)
                 ((lambda (p_yXlIXu.M3)
                    ((letrec ((f_J57bykh3p
                                (lambda (acc_WWCO5K.Ma)
                                  ((lambda (x_ptPMvS.Mh)
                                     (if (eof-object? x_ptPMvS.Mh)
                                       (begin
                                         (close-input-port p_yXlIXu.M3)
                                         (reverse acc_WWCO5K.Ma))
                                       (f_J57bykh3p
                                         (cons (datum->syntax-object
                                                 k_2gSdvQh3i
                                                 x_ptPMvS.Mh)
                                               acc_WWCO5K.Ma))))
                                   (read-code p_yXlIXu.M3)))))
                       f_J57bykh3p)
                     '()))
                  (open-source-input-file fn_Gww.Lm.M.)))))
      ((lambda (tmp_uGtefxqbW)
         (if tmp_uGtefxqbW
           (apply (lambda (k_XwxdiiqbZ filename_319.Ujzk8)
                    ((lambda (fn_QGv8sBqb3)
                       ((lambda (tmp_Kpbi6tqb6)
                          ((lambda (tmp_ypi6jCzlm)
                             (if tmp_ypi6jCzlm
                               (apply (lambda (exp_15iAWui.MO)
                                        (cons '#3(syntax-object
                                                  begin
                                                  ((top)
                                                   #4(ribcage
                                                      #1(exp)
                                                      #1((top))
                                                      #1("i"))
                                                   #4(ribcage ())
                                                   #4(ribcage
                                                      #1(fn)
                                                      #1((top))
                                                      #1("i"))
                                                   #4(ribcage
                                                      #2(k filename)
                                                      #2((top))
                                                      #2("i" "i"))
                                                   #4(ribcage
                                                      (read-file)
                                                      ((top))
                                                      ("i"))
                                                   #4(ribcage
                                                      #1(x)
                                                      #1((top))
                                                      #1("i"))
                                                   #4(ribcage
                                                      (#2(import-token *top*))
                                                      ()
                                                      ())))
                                              exp_15iAWui.MO))
                                      tmp_ypi6jCzlm)
                               (syntax-error tmp_Kpbi6tqb6)))
                           ($syntax-dispatch
                             (compile-in-annotation tmp_Kpbi6tqb6 value)
                             'each-any)))
                        (read-file_ijKtBv8Uz fn_QGv8sBqb3 k_XwxdiiqbZ)))
                     (syntax-object->datum filename_319.Ujzk8)))
                  tmp_uGtefxqbW)
           (syntax-error x_xFWIDr8Uy)))
       ($syntax-dispatch
         (compile-in-annotation x_xFWIDr8Uy value)
         '(any any))))))
($sc-put-cte
  'unquote
  (lambda (x_8iotZNRGG)
    ((lambda (tmp_o3TSDeqgn)
       (if tmp_o3TSDeqgn
         (apply (lambda (__sCMAhKzpx e_ZRQn1Uh7g)
                  (syntax-error
                    x_8iotZNRGG
                    '"expression not valid outside of quasiquote"))
                tmp_o3TSDeqgn)
         (syntax-error x_8iotZNRGG)))
     ($syntax-dispatch
       (compile-in-annotation x_8iotZNRGG value)
       '(any . each-any)))))
($sc-put-cte
  'unquote-splicing
  (lambda (x_2yCWQ3zqr)
    ((lambda (tmp_CD8AUtRIS)
       (if tmp_CD8AUtRIS
         (apply (lambda (__eB9EKTIzK e_O7lxjS.R2)
                  (syntax-error
                    x_2yCWQ3zqr
                    '"expression not valid outside of quasiquote"))
                tmp_CD8AUtRIS)
         (syntax-error x_2yCWQ3zqr)))
     ($syntax-dispatch
       (compile-in-annotation x_2yCWQ3zqr value)
       '(any . each-any)))))
($sc-put-cte
  'case
  (lambda (x_Riag9Yh9c)
    ((lambda (tmp_xtw8gTIAN)
       (if tmp_xtw8gTIAN
         (apply (lambda (__11TTonb80e
                         e_AU3Yc..S6
                         m1_19xNFQ1h9p
                         m2_EYvZ2URJ2)
                  ((lambda (tmp_Jor3Z4IAY)
                     (list '#3(syntax-object
                               let
                               ((top)
                                #4(ribcage #1(body) #1((top)) #1("i"))
                                #4(ribcage
                                   #4(_ e m1 m2)
                                   #4((top))
                                   #4("i" "i" "i" "i"))
                                #4(ribcage ())
                                #4(ribcage #1(x) #1((top)) #1("i"))
                                #4(ribcage (#2(import-token *top*)) ())))
                           (list (list '#3(syntax-object
                                           t
                                           ((top)
                                            #4(ribcage
                                               #1(body)
                                               #1((top))
                                               #1("i"))
                                            #4(ribcage
                                               #4(_ e m1 m2)
                                               #4((top))
                                               #4("i" "i" "i" "i"))
                                            #4(ribcage ())
                                            #4(ribcage #1(x) #1((top)) #1("i"))
                                            #4(ribcage
                                               (#2(import-token *top*))
                                               ()
                                               ())))
                                       e_AU3Yc..S6))
                           tmp_Jor3Z4IAY))
                   ((letrec ((f_MVOIbbzrT
                               (lambda (clause_kHlMcGzrV clauses_NGKvc880v)
                                 (if (null? clauses_NGKvc880v)
                                   ((lambda (tmp_ZXJqJK.Tn)
                                      (if tmp_ZXJqJK.Tn
                                        (apply (lambda (e1_T5GB8i.U4
                                                        e2_y4shcb82e)
                                                 (cons '#3(syntax-object
                                                           begin
                                                           ((top)
                                                            #4(ribcage
                                                               #2(e1 e2)
                                                               #2((top))
                                                               #2("i" "i"))
                                                            #4(ribcage ())
                                                            #4(ribcage
                                                               #2(clause
                                                                  clauses)
                                                               #2((top))
                                                               #2("i" "i"))
                                                            #4(ribcage
                                                               #1(f)
                                                               #1((top))
                                                               #1("i"))
                                                            #4(ribcage
                                                               #4(_ e m1 m2)
                                                               #4((top))
                                                               #4("i"
                                                                  "i"
                                                                  "i"
                                                                  "i"))
                                                            #4(ribcage ())
                                                            #4(ribcage
                                                               #1(x)
                                                               #1((top))
                                                               #1("i"))
                                                            #4(ribcage
                                                               (#2(import-token
                                                                   *top*))
                                                               ()
                                                               ())))
                                                       (cons e1_T5GB8i.U4
                                                             e2_y4shcb82e)))
                                               tmp_ZXJqJK.Tn)
                                        ((lambda (tmp_Tho5ehhaR)
                                           (if tmp_Tho5ehhaR
                                             (apply (lambda (k_Yk3pwURKz
                                                             e1_0BV.Jn81R
                                                             e2_kH7Znz81S)
                                                      (list '#3(syntax-object
                                                                if
                                                                ((top)
                                                                 #4(ribcage
                                                                    #3(k e1 e2)
                                                                    #3((top))
                                                                    #3("i"
                                                                       "i"
                                                                       "i"))
                                                                 #4(ribcage ())
                                                                 #4(ribcage
                                                                    #2(clause
                                                                       clauses)
                                                                    #2((top))
                                                                    #2("i"
                                                                       "i"))
                                                                 #4(ribcage
                                                                    #1(f)
                                                                    #1((top))
                                                                    #1("i"))
                                                                 #4(ribcage
                                                                    #4(_
                                                                       e
                                                                       m1
                                                                       m2)
                                                                    #4((top))
                                                                    #4("i"
                                                                       "i"
                                                                       "i"
                                                                       "i"))
                                                                 #4(ribcage ())
                                                                 #4(ribcage
                                                                    #1(x)
                                                                    #1((top))
                                                                    #1("i"))
                                                                 #4(ribcage
                                                                    (#2(import-token
                                                                        *top*))
                                                                    ()
                                                                    ())))
                                                            (list '#3(syntax-object
                                                                      memv
                                                                      ((top)
                                                                       #4(ribcage
                                                                          #3(k
                                                                             e1
                                                                             e2)
                                                                          #3((top)
                                                                             (top)
                                                                             (top))
                                                                          #3("i"
                                                                             "i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          ()
                                                                          ()
                                                                          ())
                                                                       #4(ribcage
                                                                          #2(clause
                                                                             clauses)
                                                                          #2((top)
                                                                             (top))
                                                                          #2("i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          #1(f)
                                                                          #1((top))
                                                                          #1("i"))
                                                                       #4(ribcage
                                                                          #4(_
                                                                             e
                                                                             m1
                                                                             m2)
                                                                          #4((top)
                                                                             (top)
                                                                             (top)
                                                                             (top))
                                                                          #4("i"
                                                                             "i"
                                                                             "i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          ()
                                                                          ()
                                                                          ())
                                                                       #4(ribcage
                                                                          #1(x)
                                                                          #1((top))
                                                                          #1("i"))
                                                                       #4(ribcage
                                                                          (#2(import-token
                                                                              *top*))
                                                                          ()
                                                                          ())))
                                                                  '#3(syntax-object
                                                                      t
                                                                      ((top)
                                                                       #4(ribcage
                                                                          #3(k
                                                                             e1
                                                                             e2)
                                                                          #3((top)
                                                                             (top)
                                                                             (top))
                                                                          #3("i"
                                                                             "i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          ()
                                                                          ()
                                                                          ())
                                                                       #4(ribcage
                                                                          #2(clause
                                                                             clauses)
                                                                          #2((top)
                                                                             (top))
                                                                          #2("i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          #1(f)
                                                                          #1((top))
                                                                          #1("i"))
                                                                       #4(ribcage
                                                                          #4(_
                                                                             e
                                                                             m1
                                                                             m2)
                                                                          #4((top)
                                                                             (top)
                                                                             (top)
                                                                             (top))
                                                                          #4("i"
                                                                             "i"
                                                                             "i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          ()
                                                                          ()
                                                                          ())
                                                                       #4(ribcage
                                                                          #1(x)
                                                                          #1((top))
                                                                          #1("i"))
                                                                       #4(ribcage
                                                                          (#2(import-token
                                                                              *top*))
                                                                          ()
                                                                          ())))
                                                                  (list '#3(syntax-object
                                                                            quote
                                                                            ((top)
                                                                             #4(ribcage
                                                                                #3(k
                                                                                   e1
                                                                                   e2)
                                                                                #3((top)
                                                                                   (top)
                                                                                   (top))
                                                                                #3("i"
                                                                                   "i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                             #4(ribcage
                                                                                #2(clause
                                                                                   clauses)
                                                                                #2((top)
                                                                                   (top))
                                                                                #2("i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                #1(f)
                                                                                #1((top))
                                                                                #1("i"))
                                                                             #4(ribcage
                                                                                #4(_
                                                                                   e
                                                                                   m1
                                                                                   m2)
                                                                                #4((top)
                                                                                   (top)
                                                                                   (top)
                                                                                   (top))
                                                                                #4("i"
                                                                                   "i"
                                                                                   "i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                             #4(ribcage
                                                                                #1(x)
                                                                                #1((top))
                                                                                #1("i"))
                                                                             #4(ribcage
                                                                                (#2(import-token
                                                                                    *top*))
                                                                                ()
                                                                                ())))
                                                                        k_Yk3pwURKz))
                                                            (cons '#3(syntax-object
                                                                      begin
                                                                      ((top)
                                                                       #4(ribcage
                                                                          #3(k
                                                                             e1
                                                                             e2)
                                                                          #3((top)
                                                                             (top)
                                                                             (top))
                                                                          #3("i"
                                                                             "i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          ()
                                                                          ()
                                                                          ())
                                                                       #4(ribcage
                                                                          #2(clause
                                                                             clauses)
                                                                          #2((top)
                                                                             (top))
                                                                          #2("i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          #1(f)
                                                                          #1((top))
                                                                          #1("i"))
                                                                       #4(ribcage
                                                                          #4(_
                                                                             e
                                                                             m1
                                                                             m2)
                                                                          #4((top)
                                                                             (top)
                                                                             (top)
                                                                             (top))
                                                                          #4("i"
                                                                             "i"
                                                                             "i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          ()
                                                                          ()
                                                                          ())
                                                                       #4(ribcage
                                                                          #1(x)
                                                                          #1((top))
                                                                          #1("i"))
                                                                       #4(ribcage
                                                                          (#2(import-token
                                                                              *top*))
                                                                          ()
                                                                          ())))
                                                                  (cons e1_0BV.Jn81R
                                                                        e2_kH7Znz81S))))
                                                    tmp_Tho5ehhaR)
                                             (syntax-error x_Riag9Yh9c)))
                                         ($syntax-dispatch
                                           (compile-in-annotation
                                             clause_kHlMcGzrV
                                             value)
                                           '(each-any any . each-any)))))
                                    ($syntax-dispatch
                                      (compile-in-annotation
                                        clause_kHlMcGzrV
                                        value)
                                      '(#2(free-id
                                           #3(syntax-object
                                              else
                                              ((top)
                                               #4(ribcage ())
                                               #4(ribcage
                                                  #2(clause clauses)
                                                  #2((top))
                                                  #2("i" "i"))
                                               #4(ribcage
                                                  #1(f)
                                                  #1((top))
                                                  #1("i"))
                                               #4(ribcage
                                                  #4(_ e m1 m2)
                                                  #4((top))
                                                  #4("i" "i" "i" "i"))
                                               #4(ribcage ())
                                               #4(ribcage
                                                  #1(x)
                                                  #1((top))
                                                  #1("i"))
                                               #4(ribcage
                                                  (#2(import-token *top*))
                                                  ()
                                                  ()))))
                                        any
                                        .
                                        each-any)))
                                   ((lambda (tmp_HBIXaCzr.)
                                      ((lambda (tmp_CAIL65h90)
                                         (if tmp_CAIL65h90
                                           (apply (lambda (k_El.Vorzrm
                                                           e1_ZBBdvu.SO
                                                           e2_189IqFf811)
                                                    (list '#3(syntax-object
                                                              if
                                                              ((top)
                                                               #4(ribcage
                                                                  #3(k e1 e2)
                                                                  #3((top))
                                                                  #3("i"
                                                                     "i"
                                                                     "i"))
                                                               #4(ribcage
                                                                  #1(rest)
                                                                  #1((top))
                                                                  #1("i"))
                                                               #4(ribcage ())
                                                               #4(ribcage
                                                                  #2(clause
                                                                     clauses)
                                                                  #2((top))
                                                                  #2("i" "i"))
                                                               #4(ribcage
                                                                  #1(f)
                                                                  #1((top))
                                                                  #1("i"))
                                                               #4(ribcage
                                                                  #4(_ e m1 m2)
                                                                  #4((top))
                                                                  #4("i"
                                                                     "i"
                                                                     "i"
                                                                     "i"))
                                                               #4(ribcage ())
                                                               #4(ribcage
                                                                  #1(x)
                                                                  #1((top))
                                                                  #1("i"))
                                                               #4(ribcage
                                                                  (#2(import-token
                                                                      *top*))
                                                                  ()
                                                                  ())))
                                                          (list '#3(syntax-object
                                                                    memv
                                                                    ((top)
                                                                     #4(ribcage
                                                                        #3(k
                                                                           e1
                                                                           e2)
                                                                        #3((top)
                                                                           (top)
                                                                           (top))
                                                                        #3("i"
                                                                           "i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        #1(rest)
                                                                        #1((top))
                                                                        #1("i"))
                                                                     #4(ribcage
                                                                        ()
                                                                        ()
                                                                        ())
                                                                     #4(ribcage
                                                                        #2(clause
                                                                           clauses)
                                                                        #2((top)
                                                                           (top))
                                                                        #2("i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        #1(f)
                                                                        #1((top))
                                                                        #1("i"))
                                                                     #4(ribcage
                                                                        #4(_
                                                                           e
                                                                           m1
                                                                           m2)
                                                                        #4((top)
                                                                           (top)
                                                                           (top)
                                                                           (top))
                                                                        #4("i"
                                                                           "i"
                                                                           "i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        ()
                                                                        ()
                                                                        ())
                                                                     #4(ribcage
                                                                        #1(x)
                                                                        #1((top))
                                                                        #1("i"))
                                                                     #4(ribcage
                                                                        (#2(import-token
                                                                            *top*))
                                                                        ()
                                                                        ())))
                                                                '#3(syntax-object
                                                                    t
                                                                    ((top)
                                                                     #4(ribcage
                                                                        #3(k
                                                                           e1
                                                                           e2)
                                                                        #3((top)
                                                                           (top)
                                                                           (top))
                                                                        #3("i"
                                                                           "i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        #1(rest)
                                                                        #1((top))
                                                                        #1("i"))
                                                                     #4(ribcage
                                                                        ()
                                                                        ()
                                                                        ())
                                                                     #4(ribcage
                                                                        #2(clause
                                                                           clauses)
                                                                        #2((top)
                                                                           (top))
                                                                        #2("i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        #1(f)
                                                                        #1((top))
                                                                        #1("i"))
                                                                     #4(ribcage
                                                                        #4(_
                                                                           e
                                                                           m1
                                                                           m2)
                                                                        #4((top)
                                                                           (top)
                                                                           (top)
                                                                           (top))
                                                                        #4("i"
                                                                           "i"
                                                                           "i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        ()
                                                                        ()
                                                                        ())
                                                                     #4(ribcage
                                                                        #1(x)
                                                                        #1((top))
                                                                        #1("i"))
                                                                     #4(ribcage
                                                                        (#2(import-token
                                                                            *top*))
                                                                        ()
                                                                        ())))
                                                                (list '#3(syntax-object
                                                                          quote
                                                                          ((top)
                                                                           #4(ribcage
                                                                              #3(k
                                                                                 e1
                                                                                 e2)
                                                                              #3((top)
                                                                                 (top)
                                                                                 (top))
                                                                              #3("i"
                                                                                 "i"
                                                                                 "i"))
                                                                           #4(ribcage
                                                                              #1(rest)
                                                                              #1((top))
                                                                              #1("i"))
                                                                           #4(ribcage
                                                                              ()
                                                                              ()
                                                                              ())
                                                                           #4(ribcage
                                                                              #2(clause
                                                                                 clauses)
                                                                              #2((top)
                                                                                 (top))
                                                                              #2("i"
                                                                                 "i"))
                                                                           #4(ribcage
                                                                              #1(f)
                                                                              #1((top))
                                                                              #1("i"))
                                                                           #4(ribcage
                                                                              #4(_
                                                                                 e
                                                                                 m1
                                                                                 m2)
                                                                              #4((top)
                                                                                 (top)
                                                                                 (top)
                                                                                 (top))
                                                                              #4("i"
                                                                                 "i"
                                                                                 "i"
                                                                                 "i"))
                                                                           #4(ribcage
                                                                              ()
                                                                              ()
                                                                              ())
                                                                           #4(ribcage
                                                                              #1(x)
                                                                              #1((top))
                                                                              #1("i"))
                                                                           #4(ribcage
                                                                              (#2(import-token
                                                                                  *top*))
                                                                              ()
                                                                              ())))
                                                                      k_El.Vorzrm))
                                                          (cons '#3(syntax-object
                                                                    begin
                                                                    ((top)
                                                                     #4(ribcage
                                                                        #3(k
                                                                           e1
                                                                           e2)
                                                                        #3((top)
                                                                           (top)
                                                                           (top))
                                                                        #3("i"
                                                                           "i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        #1(rest)
                                                                        #1((top))
                                                                        #1("i"))
                                                                     #4(ribcage
                                                                        ()
                                                                        ()
                                                                        ())
                                                                     #4(ribcage
                                                                        #2(clause
                                                                           clauses)
                                                                        #2((top)
                                                                           (top))
                                                                        #2("i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        #1(f)
                                                                        #1((top))
                                                                        #1("i"))
                                                                     #4(ribcage
                                                                        #4(_
                                                                           e
                                                                           m1
                                                                           m2)
                                                                        #4((top)
                                                                           (top)
                                                                           (top)
                                                                           (top))
                                                                        #4("i"
                                                                           "i"
                                                                           "i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        ()
                                                                        ()
                                                                        ())
                                                                     #4(ribcage
                                                                        #1(x)
                                                                        #1((top))
                                                                        #1("i"))
                                                                     #4(ribcage
                                                                        (#2(import-token
                                                                            *top*))
                                                                        ()
                                                                        ())))
                                                                (cons e1_ZBBdvu.SO
                                                                      e2_189IqFf811))
                                                          tmp_HBIXaCzr.))
                                                  tmp_CAIL65h90)
                                           (syntax-error x_Riag9Yh9c)))
                                       ($syntax-dispatch
                                         (compile-in-annotation
                                           clause_kHlMcGzrV
                                           value)
                                         '(each-any any . each-any))))
                                    (f_MVOIbbzrT
                                      (car clauses_NGKvc880v)
                                      (cdr clauses_NGKvc880v)))))))
                      f_MVOIbbzrT)
                    m1_19xNFQ1h9p
                    m2_EYvZ2URJ2)))
                tmp_xtw8gTIAN)
         (syntax-error x_Riag9Yh9c)))
     ($syntax-dispatch
       (compile-in-annotation x_Riag9Yh9c value)
       '(any any any . each-any)))))
($sc-put-cte
  'identifier-syntax
  (lambda (x_ADC.Rsimx)
    ((lambda (tmp_TjQqDf9dt)
       (if tmp_TjQqDf9dt
         (apply (lambda (__42xfEbAF. e_.MLOTirwR)
                  (list '#3(syntax-object
                            lambda
                            ((top)
                             #4(ribcage #2(_ e) #2((top)) #2("i" "i"))
                             #4(ribcage ())
                             #4(ribcage #1(x) #1((top)) #1("i"))
                             #4(ribcage (#2(import-token *top*)) ())))
                        '#3(syntax-object
                            (x)
                            ((top)
                             #4(ribcage #2(_ e) #2((top)) #2("i" "i"))
                             #4(ribcage ())
                             #4(ribcage #1(x) #1((top)) #1("i"))
                             #4(ribcage (#2(import-token *top*)) ())))
                        (list '#3(syntax-object
                                  syntax-case
                                  ((top)
                                   #4(ribcage #2(_ e) #2((top)) #2("i" "i"))
                                   #4(ribcage ())
                                   #4(ribcage #1(x) #1((top)) #1("i"))
                                   #4(ribcage (#2(import-token *top*)) ())))
                              '#3(syntax-object
                                  x
                                  ((top)
                                   #4(ribcage #2(_ e) #2((top)) #2("i" "i"))
                                   #4(ribcage ())
                                   #4(ribcage #1(x) #1((top)) #1("i"))
                                   #4(ribcage (#2(import-token *top*)) ())))
                              '()
                              (list '#3(syntax-object
                                        id
                                        ((top)
                                         #4(ribcage
                                            #2(_ e)
                                            #2((top))
                                            #2("i" "i"))
                                         #4(ribcage ())
                                         #4(ribcage #1(x) #1((top)) #1("i"))
                                         #4(ribcage
                                            (#2(import-token *top*))
                                            ()
                                            ())))
                                    '#3(syntax-object
                                        (identifier? (syntax id))
                                        ((top)
                                         #4(ribcage
                                            #2(_ e)
                                            #2((top))
                                            #2("i" "i"))
                                         #4(ribcage ())
                                         #4(ribcage #1(x) #1((top)) #1("i"))
                                         #4(ribcage
                                            (#2(import-token *top*))
                                            ()
                                            ())))
                                    (list '#3(syntax-object
                                              syntax
                                              ((top)
                                               #4(ribcage
                                                  #2(_ e)
                                                  #2((top))
                                                  #2("i" "i"))
                                               #4(ribcage ())
                                               #4(ribcage
                                                  #1(x)
                                                  #1((top))
                                                  #1("i"))
                                               #4(ribcage
                                                  (#2(import-token *top*))
                                                  ()
                                                  ())))
                                          e_.MLOTirwR))
                              (list (cons __42xfEbAF.
                                          '(#3(syntax-object
                                               x
                                               ((top)
                                                #4(ribcage
                                                   #2(_ e)
                                                   #2((top))
                                                   #2("i" "i"))
                                                #4(ribcage ())
                                                #4(ribcage
                                                   #1(x)
                                                   #1((top))
                                                   #1("i"))
                                                #4(ribcage
                                                   (#2(import-token *top*))
                                                   ()
                                                   ())))
                                            #3(syntax-object
                                               ...
                                               ((top)
                                                #4(ribcage
                                                   #2(_ e)
                                                   #2((top))
                                                   #2("i" "i"))
                                                #4(ribcage ())
                                                #4(ribcage
                                                   #1(x)
                                                   #1((top))
                                                   #1("i"))
                                                #4(ribcage
                                                   (#2(import-token *top*))
                                                   ()
                                                   ())))))
                                    (list '#3(syntax-object
                                              syntax
                                              ((top)
                                               #4(ribcage
                                                  #2(_ e)
                                                  #2((top))
                                                  #2("i" "i"))
                                               #4(ribcage ())
                                               #4(ribcage
                                                  #1(x)
                                                  #1((top))
                                                  #1("i"))
                                               #4(ribcage
                                                  (#2(import-token *top*))
                                                  ()
                                                  ())))
                                          (cons e_.MLOTirwR
                                                '(#3(syntax-object
                                                     x
                                                     ((top)
                                                      #4(ribcage
                                                         #2(_ e)
                                                         #2((top))
                                                         #2("i" "i"))
                                                      #4(ribcage ())
                                                      #4(ribcage
                                                         #1(x)
                                                         #1((top))
                                                         #1("i"))
                                                      #4(ribcage
                                                         (#2(import-token
                                                             *top*))
                                                         ()
                                                         ())))
                                                  #3(syntax-object
                                                     ...
                                                     ((top)
                                                      #4(ribcage
                                                         #2(_ e)
                                                         #2((top))
                                                         #2("i" "i"))
                                                      #4(ribcage ())
                                                      #4(ribcage
                                                         #1(x)
                                                         #1((top))
                                                         #1("i"))
                                                      #4(ribcage
                                                         (#2(import-token
                                                             *top*))
                                                         ()
                                                         ()))))))))))
                tmp_TjQqDf9dt)
         ((lambda (tmp_vLibhhimJ)
            (if (if tmp_vLibhhimJ
                  (apply (lambda (__LXwblEJOU
                                  id_aw.E7VrwD
                                  exp1_11wCDKFSX6
                                  var_ftgKNMiny
                                  val_RrEQOb9eq
                                  exp2_xG0HN1inA)
                           (if (identifier? id_aw.E7VrwD)
                             (identifier? var_ftgKNMiny)
                             '#f))
                         tmp_vLibhhimJ)
                  '#f)
              (apply (lambda (__D09dNxSWk
                              id_16yQZvbAE2
                              exp1_O3TQ109dD
                              var_f5DtojAE4
                              val_lW9RGsimO
                              exp2_rvEupr9dI)
                       (list '#3(syntax-object
                                 cons
                                 ((top)
                                  #4(ribcage
                                     #6(_ id exp1 var val exp2)
                                     #6((top))
                                     #6("i" "i" "i" "i" "i" "i"))
                                  #4(ribcage ())
                                  #4(ribcage #1(x) #1((top)) #1("i"))
                                  #4(ribcage (#2(import-token *top*)) ())))
                             '#3(syntax-object
                                 'macro!
                                 ((top)
                                  #4(ribcage
                                     #6(_ id exp1 var val exp2)
                                     #6((top))
                                     #6("i" "i" "i" "i" "i" "i"))
                                  #4(ribcage ())
                                  #4(ribcage #1(x) #1((top)) #1("i"))
                                  #4(ribcage (#2(import-token *top*)) ())))
                             (list '#3(syntax-object
                                       lambda
                                       ((top)
                                        #4(ribcage
                                           #6(_ id exp1 var val exp2)
                                           #6((top))
                                           #6("i" "i" "i" "i" "i" "i"))
                                        #4(ribcage ())
                                        #4(ribcage #1(x) #1((top)) #1("i"))
                                        #4(ribcage
                                           (#2(import-token *top*))
                                           ()
                                           ())))
                                   '#3(syntax-object
                                       (x)
                                       ((top)
                                        #4(ribcage
                                           #6(_ id exp1 var val exp2)
                                           #6((top))
                                           #6("i" "i" "i" "i" "i" "i"))
                                        #4(ribcage ())
                                        #4(ribcage #1(x) #1((top)) #1("i"))
                                        #4(ribcage
                                           (#2(import-token *top*))
                                           ()
                                           ())))
                                   (list '#3(syntax-object
                                             syntax-case
                                             ((top)
                                              #4(ribcage
                                                 #6(_ id exp1 var val exp2)
                                                 #6((top))
                                                 #6("i" "i" "i" "i" "i" "i"))
                                              #4(ribcage ())
                                              #4(ribcage
                                                 #1(x)
                                                 #1((top))
                                                 #1("i"))
                                              #4(ribcage
                                                 (#2(import-token *top*))
                                                 ()
                                                 ())))
                                         '#3(syntax-object
                                             x
                                             ((top)
                                              #4(ribcage
                                                 #6(_ id exp1 var val exp2)
                                                 #6((top))
                                                 #6("i" "i" "i" "i" "i" "i"))
                                              #4(ribcage ())
                                              #4(ribcage
                                                 #1(x)
                                                 #1((top))
                                                 #1("i"))
                                              #4(ribcage
                                                 (#2(import-token *top*))
                                                 ()
                                                 ())))
                                         '#3(syntax-object
                                             (set!)
                                             ((top)
                                              #4(ribcage
                                                 #6(_ id exp1 var val exp2)
                                                 #6((top))
                                                 #6("i" "i" "i" "i" "i" "i"))
                                              #4(ribcage ())
                                              #4(ribcage
                                                 #1(x)
                                                 #1((top))
                                                 #1("i"))
                                              #4(ribcage
                                                 (#2(import-token *top*))
                                                 ()
                                                 ())))
                                         (list (list '#3(syntax-object
                                                         set!
                                                         ((top)
                                                          #4(ribcage
                                                             #6(_
                                                                id
                                                                exp1
                                                                var
                                                                val
                                                                exp2)
                                                             #6((top))
                                                             #6("i"
                                                                "i"
                                                                "i"
                                                                "i"
                                                                "i"
                                                                "i"))
                                                          #4(ribcage ())
                                                          #4(ribcage
                                                             #1(x)
                                                             #1((top))
                                                             #1("i"))
                                                          #4(ribcage
                                                             (#2(import-token
                                                                 *top*))
                                                             ()
                                                             ())))
                                                     var_f5DtojAE4
                                                     val_lW9RGsimO)
                                               (list '#3(syntax-object
                                                         syntax
                                                         ((top)
                                                          #4(ribcage
                                                             #6(_
                                                                id
                                                                exp1
                                                                var
                                                                val
                                                                exp2)
                                                             #6((top))
                                                             #6("i"
                                                                "i"
                                                                "i"
                                                                "i"
                                                                "i"
                                                                "i"))
                                                          #4(ribcage ())
                                                          #4(ribcage
                                                             #1(x)
                                                             #1((top))
                                                             #1("i"))
                                                          #4(ribcage
                                                             (#2(import-token
                                                                 *top*))
                                                             ()
                                                             ())))
                                                     exp2_rvEupr9dI))
                                         (list (cons id_16yQZvbAE2
                                                     '(#3(syntax-object
                                                          x
                                                          ((top)
                                                           #4(ribcage
                                                              #6(_
                                                                 id
                                                                 exp1
                                                                 var
                                                                 val
                                                                 exp2)
                                                              #6((top))
                                                              #6("i"
                                                                 "i"
                                                                 "i"
                                                                 "i"
                                                                 "i"
                                                                 "i"))
                                                           #4(ribcage ())
                                                           #4(ribcage
                                                              #1(x)
                                                              #1((top))
                                                              #1("i"))
                                                           #4(ribcage
                                                              (#2(import-token
                                                                  *top*))
                                                              ()
                                                              ())))
                                                       #3(syntax-object
                                                          ...
                                                          ((top)
                                                           #4(ribcage
                                                              #6(_
                                                                 id
                                                                 exp1
                                                                 var
                                                                 val
                                                                 exp2)
                                                              #6((top))
                                                              #6("i"
                                                                 "i"
                                                                 "i"
                                                                 "i"
                                                                 "i"
                                                                 "i"))
                                                           #4(ribcage ())
                                                           #4(ribcage
                                                              #1(x)
                                                              #1((top))
                                                              #1("i"))
                                                           #4(ribcage
                                                              (#2(import-token
                                                                  *top*))
                                                              ()
                                                              ())))))
                                               (list '#3(syntax-object
                                                         syntax
                                                         ((top)
                                                          #4(ribcage
                                                             #6(_
                                                                id
                                                                exp1
                                                                var
                                                                val
                                                                exp2)
                                                             #6((top))
                                                             #6("i"
                                                                "i"
                                                                "i"
                                                                "i"
                                                                "i"
                                                                "i"))
                                                          #4(ribcage ())
                                                          #4(ribcage
                                                             #1(x)
                                                             #1((top))
                                                             #1("i"))
                                                          #4(ribcage
                                                             (#2(import-token
                                                                 *top*))
                                                             ()
                                                             ())))
                                                     (cons exp1_O3TQ109dD
                                                           '(#3(syntax-object
                                                                x
                                                                ((top)
                                                                 #4(ribcage
                                                                    #6(_
                                                                       id
                                                                       exp1
                                                                       var
                                                                       val
                                                                       exp2)
                                                                    #6((top))
                                                                    #6("i"
                                                                       "i"
                                                                       "i"
                                                                       "i"
                                                                       "i"
                                                                       "i"))
                                                                 #4(ribcage ())
                                                                 #4(ribcage
                                                                    #1(x)
                                                                    #1((top))
                                                                    #1("i"))
                                                                 #4(ribcage
                                                                    (#2(import-token
                                                                        *top*))
                                                                    ()
                                                                    ())))
                                                             #3(syntax-object
                                                                ...
                                                                ((top)
                                                                 #4(ribcage
                                                                    #6(_
                                                                       id
                                                                       exp1
                                                                       var
                                                                       val
                                                                       exp2)
                                                                    #6((top))
                                                                    #6("i"
                                                                       "i"
                                                                       "i"
                                                                       "i"
                                                                       "i"
                                                                       "i"))
                                                                 #4(ribcage ())
                                                                 #4(ribcage
                                                                    #1(x)
                                                                    #1((top))
                                                                    #1("i"))
                                                                 #4(ribcage
                                                                    (#2(import-token
                                                                        *top*))
                                                                    ()
                                                                    ())))))))
                                         (list id_16yQZvbAE2
                                               (list '#3(syntax-object
                                                         identifier?
                                                         ((top)
                                                          #4(ribcage
                                                             #6(_
                                                                id
                                                                exp1
                                                                var
                                                                val
                                                                exp2)
                                                             #6((top))
                                                             #6("i"
                                                                "i"
                                                                "i"
                                                                "i"
                                                                "i"
                                                                "i"))
                                                          #4(ribcage ())
                                                          #4(ribcage
                                                             #1(x)
                                                             #1((top))
                                                             #1("i"))
                                                          #4(ribcage
                                                             (#2(import-token
                                                                 *top*))
                                                             ()
                                                             ())))
                                                     (list '#3(syntax-object
                                                               syntax
                                                               ((top)
                                                                #4(ribcage
                                                                   #6(_
                                                                      id
                                                                      exp1
                                                                      var
                                                                      val
                                                                      exp2)
                                                                   #6((top))
                                                                   #6("i"
                                                                      "i"
                                                                      "i"
                                                                      "i"
                                                                      "i"
                                                                      "i"))
                                                                #4(ribcage ())
                                                                #4(ribcage
                                                                   #1(x)
                                                                   #1((top))
                                                                   #1("i"))
                                                                #4(ribcage
                                                                   (#2(import-token
                                                                       *top*))
                                                                   ()
                                                                   ())))
                                                           id_16yQZvbAE2))
                                               (list '#3(syntax-object
                                                         syntax
                                                         ((top)
                                                          #4(ribcage
                                                             #6(_
                                                                id
                                                                exp1
                                                                var
                                                                val
                                                                exp2)
                                                             #6((top))
                                                             #6("i"
                                                                "i"
                                                                "i"
                                                                "i"
                                                                "i"
                                                                "i"))
                                                          #4(ribcage ())
                                                          #4(ribcage
                                                             #1(x)
                                                             #1((top))
                                                             #1("i"))
                                                          #4(ribcage
                                                             (#2(import-token
                                                                 *top*))
                                                             ()
                                                             ())))
                                                     exp1_O3TQ109dD))))))
                     tmp_vLibhhimJ)
              (syntax-error x_ADC.Rsimx)))
          ($syntax-dispatch
            (compile-in-annotation x_ADC.Rsimx value)
            '(any (any any)
                  ((#2(free-id
                       #3(syntax-object
                          set!
                          ((top)
                           #4(ribcage ())
                           #4(ribcage #1(x) #1((top)) #1("i"))
                           #4(ribcage (#2(import-token *top*)) ()))))
                    any
                    any)
                   any))))))
     ($syntax-dispatch
       (compile-in-annotation x_ADC.Rsimx value)
       '(any any)))))
