(letrec ((%_3161
           (lambda (%_4691)
             ((letrec ((%_4692
                         (lambda (%_4693 %_4694 %_4695)
                           (if (pair? %_4693)
                             (%_4692
                               (cdr %_4693)
                               (cons (%_3099 (car %_4693) %_4695) %_4694)
                               %_4695)
                             (if (%_2993 %_4693)
                               (cons (%_3099 %_4693 %_4695) %_4694)
                               (if (null? %_4693)
                                 %_4694
                                 (if (%_2936 %_4693)
                                   (%_4692
                                     (%_2937 %_4693)
                                     %_4694
                                     (%_3080 %_4695 (%_2938 %_4693)))
                                   (if (annotation? %_4693)
                                     (%_4692
                                       (annotation-expression %_4693)
                                       %_4694
                                       %_4695)
                                     (cons %_4693 %_4694)))))))))
                %_4692)
              %_4691
              '()
              '(()))))
         (%_3160
           (lambda (%_4689)
             ((lambda (%_4690)
                (if (annotation? %_4690)
                  (if (annotation-source %_4690)
                    (list 'compile-in-annotation
                          (gen-sym (annotation-expression %_4690))
                          (annotation-source %_4690))
                    (gen-sym (annotation-expression %_4690)))
                  (gen-sym %_4690)))
              (if (%_2936 %_4689) (%_2937 %_4689) %_4689))))
         (%_3159
           (lambda (%_4685 %_4686)
             (%_3158
               %_4685
               %_4686
               (lambda (%_4687)
                 (if ((lambda (%_4688)
                        (if %_4688
                          %_4688
                          (if (pair? %_4687)
                            (annotation? (car %_4687))
                            '#f)))
                      (annotation? %_4687))
                   (%_3157 %_4687 '#f)
                   %_4687)))))
         (%_3158
           (lambda (%_4676 %_4677 %_4678)
             (if (memq 'top (%_3001 %_4677))
               (%_4678 %_4676)
               ((letrec ((%_4679
                           (lambda (%_4680)
                             (if (%_2936 %_4680)
                               (%_3158 (%_2937 %_4680) (%_2938 %_4680) %_4678)
                               (if (pair? %_4680)
                                 ((lambda (%_4684 %_4683)
                                    (if (if (eq? %_4683 (car %_4680))
                                          (eq? %_4684 (cdr %_4680))
                                          '#f)
                                      %_4680
                                      (cons %_4683 %_4684)))
                                  (%_4679 (cdr %_4680))
                                  (%_4679 (car %_4680)))
                                 (if (vector? %_4680)
                                   ((lambda (%_4681)
                                      ((lambda (%_4682)
                                         (if (andmap eq? %_4681 %_4682)
                                           %_4680
                                           (list->vector %_4682)))
                                       (map %_4679 %_4681)))
                                    (vector->list %_4680))
                                   %_4680))))))
                  %_4679)
                %_4676))))
         (%_3157
           (lambda (%_4669 %_4670)
             (if (pair? %_4669)
               ((lambda (%_4675)
                  (begin
                    (if %_4670
                      (set-annotation-stripped! %_4670 %_4675)
                      (void))
                    (set-car! %_4675 (%_3157 (car %_4669) '#f))
                    (set-cdr! %_4675 (%_3157 (cdr %_4669) '#f))
                    %_4675))
                (cons '#f '#f))
               (if (annotation? %_4669)
                 ((lambda (%_4674)
                    (if %_4674
                      %_4674
                      (%_3157 (annotation-expression %_4669) %_4669)))
                  (annotation-stripped %_4669))
                 (if (vector? %_4669)
                   ((lambda (%_4671)
                      (begin
                        (if %_4670
                          (set-annotation-stripped! %_4670 %_4671)
                          (void))
                        ((letrec ((%_4672
                                    (lambda (%_4673)
                                      (if (not (< %_4673 '0))
                                        (begin
                                          (vector-set!
                                            %_4671
                                            %_4673
                                            (%_3157
                                              (vector-ref %_4669 %_4673)
                                              '#f))
                                          (%_4672 (- %_4673 '1)))
                                        (void)))))
                           %_4672)
                         (- (vector-length %_4669) '1))
                        %_4671))
                    (make-vector (vector-length %_4669)))
                   %_4669)))))
         (%_3156
           (lambda (%_4668)
             (if (%_2987 %_4668)
               (%_3088
                 %_4668
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
         (%_3155 (lambda () (list 'void)))
         (%_3154
           (lambda (%_4644 %_4645 %_4646 %_4647 %_4648 %_4649)
             ((lambda (%_4651)
                (if %_4651
                  (apply (lambda (%_4653 %_4654 %_4655 %_4656 %_4657)
                           (if (not (%_3090 %_4654))
                             (%_3097
                               (map (lambda (%_4666) (%_3099 %_4666 %_4647))
                                    %_4654)
                               (%_3100 %_4645 %_4647 %_4648)
                               '"keyword")
                             ((lambda (%_4659)
                                ((lambda (%_4660)
                                   (%_4649
                                     (cons %_4656 %_4657)
                                     (%_2979
                                       %_4659
                                       ((lambda (%_4663 %_4662)
                                          (map (lambda (%_4664)
                                                 (%_2963
                                                   'deferred
                                                   (%_3141
                                                     %_4664
                                                     %_4663
                                                     %_4662)))
                                               %_4655))
                                        (%_2981 %_4646)
                                        (if %_4644 %_4660 %_4647))
                                       %_4646)
                                     %_4660
                                     %_4648))
                                 (%_3077 %_4654 %_4659 %_4647)))
                              (%_3040 %_4654))))
                         %_4651)
                  (syntax-error (%_3100 %_4645 %_4647 %_4648))))
              ($syntax-dispatch
                (compile-in-annotation %_4645 value)
                '(any #2(each (any any)) any . each-any)))))
         (%_3153
           (lambda (%_4617 %_4618 %_4619 %_4620 %_4621)
             ((lambda (%_4623)
                (if %_4623
                  (apply (lambda (%_4636 %_4637 %_4638)
                           (if (not (%_3090 %_4636))
                             (syntax-error
                               %_4617
                               '"invalid parameter list in")
                             ((lambda (%_4641 %_4640)
                                (%_4621
                                  %_4641
                                  (%_3146
                                    (cons %_4637 %_4638)
                                    %_4617
                                    (%_2980 %_4640 %_4641 %_4619)
                                    (%_3077 %_4636 %_4640 %_4620))))
                              (map %_3160 %_4636)
                              (%_3040 %_4636))))
                         %_4623)
                  ((lambda (%_4624)
                     (if %_4624
                       (apply (lambda (%_4626 %_4627 %_4628)
                                ((lambda (%_4629)
                                   (if (not (%_3090 %_4629))
                                     (syntax-error
                                       %_4617
                                       '"invalid parameter list in")
                                     ((lambda (%_4631 %_4630)
                                        (%_4621
                                          ((letrec ((%_4632
                                                      (lambda (%_4633 %_4634)
                                                        (if (null? %_4633)
                                                          %_4634
                                                          (%_4632
                                                            (cdr %_4633)
                                                            (cons (car %_4633)
                                                                  %_4634))))))
                                             %_4632)
                                           (cdr %_4631)
                                           (car %_4631))
                                          (%_3146
                                            (cons %_4627 %_4628)
                                            %_4617
                                            (%_2980 %_4630 %_4631 %_4619)
                                            (%_3077 %_4629 %_4630 %_4620))))
                                      (map %_3160 %_4629)
                                      (%_3040 %_4629))))
                                 (%_3161 %_4626)))
                              %_4624)
                       (syntax-error %_4617)))
                   ($syntax-dispatch
                     (compile-in-annotation %_4618 value)
                     '(any any . each-any)))))
              ($syntax-dispatch
                (compile-in-annotation %_4618 value)
                '(each-any any . each-any)))))
         (%_3152
           (lambda (%_4604 %_4605 %_4606 %_4607)
             ((lambda (%_4609)
                (if (if %_4609
                      (apply (lambda (%_4614 %_4615 %_4616) (%_2993 %_4615))
                             %_4609)
                      '#f)
                  (apply (lambda (%_4611 %_4612 %_4613)
                           (%_4607 %_4612 %_4613 %_4605))
                         %_4609)
                  (syntax-error (%_3100 %_4604 %_4605 %_4606))))
              ($syntax-dispatch
                (compile-in-annotation %_4604 value)
                '(any any any)))))
         (%_3151
           (lambda (%_4574 %_4575 %_4576 %_4577)
             ((lambda (%_4579)
                (if (if %_4579
                      (apply (lambda (%_4601 %_4602 %_4603) (%_2993 %_4602))
                             %_4579)
                      '#f)
                  (apply (lambda (%_4598 %_4599 %_4600)
                           (%_4577 %_4599 %_4600 %_4575))
                         %_4579)
                  ((lambda (%_4580)
                     (if (if %_4580
                           (apply (lambda (%_4593 %_4594 %_4595 %_4596 %_4597)
                                    (if (%_2993 %_4594)
                                      (%_3090 (%_3161 %_4595))
                                      '#f))
                                  %_4580)
                           '#f)
                       (apply (lambda (%_4587 %_4588 %_4589 %_4590 %_4591)
                                (%_4577
                                  (%_3099 %_4588 %_4575)
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
                                        (%_3099
                                          (cons %_4589 (cons %_4590 %_4591))
                                          %_4575))
                                  '(())))
                              %_4580)
                       ((lambda (%_4581)
                          (if (if %_4581
                                (apply (lambda (%_4585 %_4586) (%_2993 %_4586))
                                       %_4581)
                                '#f)
                            (apply (lambda (%_4583 %_4584)
                                     (%_4577
                                       (%_3099 %_4584 %_4575)
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
                                   %_4581)
                            (syntax-error (%_3100 %_4574 %_4575 %_4576))))
                        ($syntax-dispatch
                          (compile-in-annotation %_4574 value)
                          '(any any)))))
                   ($syntax-dispatch
                     (compile-in-annotation %_4574 value)
                     '(any (any . any) any . each-any)))))
              ($syntax-dispatch
                (compile-in-annotation %_4574 value)
                '(any any any)))))
         (%_3150
           (lambda (%_4563 %_4564 %_4565 %_4566)
             ((lambda (%_4568)
                (if (if %_4568
                      (apply (lambda (%_4572 %_4573) (%_2993 %_4573))
                             %_4568)
                      '#f)
                  (apply (lambda (%_4570 %_4571)
                           (%_4566 (%_3099 %_4571 %_4564)))
                         %_4568)
                  (syntax-error (%_3100 %_4563 %_4564 %_4565))))
              ($syntax-dispatch
                (compile-in-annotation %_4563 value)
                '(any any)))))
         (%_3149
           (lambda (%_4527 %_4528 %_4529 %_4530 %_4531)
             (letrec ((%_4533
                        (lambda (%_4559 %_4560 %_4561)
                          (%_4531
                            %_4559
                            (%_4532 %_4560)
                            (map (lambda (%_4562) (%_3099 %_4562 %_4530))
                                 %_4561))))
                      (%_4532
                        (lambda (%_4553)
                          (if (null? %_4553)
                            '()
                            (cons ((lambda (%_4554)
                                     ((lambda (%_4555)
                                        (if %_4555
                                          (apply (lambda (%_4557)
                                                   (%_4532 %_4557))
                                                 %_4555)
                                          (if (%_2993 %_4554)
                                            (%_3099 %_4554 %_4530)
                                            (syntax-error
                                              (%_3100 %_4527 %_4528 %_4529)
                                              '"invalid exports list in"))))
                                      ($syntax-dispatch
                                        (compile-in-annotation %_4554 value)
                                        'each-any)))
                                   (car %_4553))
                                  (%_4532 (cdr %_4553)))))))
               ((lambda (%_4535)
                  (if %_4535
                    (apply (lambda (%_4548 %_4549 %_4550)
                             (%_4533 '#f %_4549 %_4550))
                           %_4535)
                    ((lambda (%_4536)
                       (if (if %_4536
                             (apply (lambda (%_4544 %_4545 %_4546 %_4547)
                                      (%_2993 %_4545))
                                    %_4536)
                             '#f)
                         (apply (lambda (%_4538 %_4539 %_4540 %_4541)
                                  (%_4533
                                    (%_3099 %_4539 %_4528)
                                    %_4540
                                    %_4541))
                                %_4536)
                         (syntax-error (%_3100 %_4527 %_4528 %_4529))))
                     ($syntax-dispatch
                       (compile-in-annotation %_4527 value)
                       '(any any each-any . each-any)))))
                ($syntax-dispatch
                  (compile-in-annotation %_4527 value)
                  '(any each-any . each-any))))))
         (%_3148
           (lambda (%_4522 %_4523)
             ((lambda (%_4524)
                (if %_4524
                  (%_3075 %_4523 %_4524)
                  (%_3135
                    (lambda (%_4525)
                      ((lambda (%_4526)
                         (begin
                           (if (not %_4526)
                             (syntax-error
                               %_4525
                               '"exported identifier not visible")
                             (void))
                           (%_3072 %_4523 %_4525 %_4526)))
                       (%_3085 %_4525 '(()))))
                    (%_3110 %_4522))))
              (%_3111 %_4522))))
         (%_3147
           (lambda (%_4442 %_4443 %_4444 %_4445 %_4446)
             (letrec ((%_4447
                        (lambda (%_4517 %_4518 %_4519 %_4520 %_4521)
                          (begin
                            (%_3132 %_4443 %_4518)
                            (%_4446
                              %_4517
                              %_4518
                              (reverse %_4519)
                              (reverse %_4520)
                              %_4521)))))
               ((letrec ((%_4448
                           (lambda (%_4449 %_4450 %_4451 %_4452 %_4453)
                             (if (null? %_4449)
                               (%_4447 %_4449 %_4450 %_4451 %_4452 %_4453)
                               ((lambda (%_4455 %_4454)
                                  (call-with-values
                                    (lambda ()
                                      (%_3104 %_4454 %_4455 '(()) '#f %_4442))
                                    (lambda (%_4456
                                             %_4457
                                             %_4458
                                             %_4459
                                             %_4460)
                                      (if (memv %_4456 '(define-form))
                                        (%_3151
                                          %_4458
                                          %_4459
                                          %_4460
                                          (lambda (%_4511 %_4512 %_4513)
                                            ((lambda (%_4515 %_4514)
                                               ((lambda (%_4516)
                                                  (begin
                                                    (%_3072
                                                      %_4442
                                                      %_4514
                                                      %_4515)
                                                    (%_3130
                                                      %_4445
                                                      %_4515
                                                      (%_2963 'lexical %_4516))
                                                    (%_4448
                                                      (cdr %_4449)
                                                      (cons %_4514 %_4450)
                                                      (cons %_4516 %_4451)
                                                      (cons (cons %_4455
                                                                  (%_3099
                                                                    %_4512
                                                                    %_4513))
                                                            %_4452)
                                                      %_4453)))
                                                (%_3160 %_4514)))
                                             (%_3038)
                                             (%_3099 %_4511 %_4513))))
                                        (if (memv %_4456 '(define-syntax-form))
                                          (%_3152
                                            %_4458
                                            %_4459
                                            %_4460
                                            (lambda (%_4505 %_4506 %_4507)
                                              ((lambda (%_4510 %_4509 %_4508)
                                                 (begin
                                                   (%_3072
                                                     %_4442
                                                     %_4508
                                                     %_4509)
                                                   (%_3130
                                                     %_4445
                                                     %_4509
                                                     (%_2963 'deferred %_4510))
                                                   (%_4448
                                                     (cdr %_4449)
                                                     (cons %_4508 %_4450)
                                                     %_4451
                                                     %_4452
                                                     %_4453)))
                                               (%_3141
                                                 %_4506
                                                 (%_2981 %_4455)
                                                 %_4507)
                                               (%_3038)
                                               (%_3099 %_4505 %_4507))))
                                          (if (memv %_4456 '(module-form))
                                            ((lambda (%_4489)
                                               ((lambda (%_4490)
                                                  (%_3149
                                                    %_4458
                                                    %_4459
                                                    %_4460
                                                    %_4490
                                                    (lambda (%_4491
                                                             %_4492
                                                             %_4493)
                                                      (%_3147
                                                        %_4489
                                                        (%_3100
                                                          %_4458
                                                          %_4459
                                                          %_4460)
                                                        (map (lambda (%_4494)
                                                               (cons %_4455
                                                                     %_4494))
                                                             %_4493)
                                                        %_4445
                                                        (lambda (%_4495
                                                                 %_4496
                                                                 %_4497
                                                                 %_4498
                                                                 %_4499)
                                                          (begin
                                                            (%_3131
                                                              %_4443
                                                              (%_3107 %_4492)
                                                              %_4496)
                                                            ((lambda (%_4503
                                                                      %_4502
                                                                      %_4501
                                                                      %_4500)
                                                               (if %_4491
                                                                 ((lambda (%_4504)
                                                                    (begin
                                                                      (%_3072
                                                                        %_4442
                                                                        %_4491
                                                                        %_4504)
                                                                      (%_3130
                                                                        %_4445
                                                                        %_4504
                                                                        (%_2963
                                                                          'module
                                                                          %_4500))
                                                                      (%_4448
                                                                        (cdr %_4449)
                                                                        (cons %_4491
                                                                              %_4450)
                                                                        %_4501
                                                                        %_4502
                                                                        %_4503)))
                                                                  (%_3038))
                                                                 (begin
                                                                   (%_3148
                                                                     %_4500
                                                                     %_4442)
                                                                   (%_4448
                                                                     (cdr %_4449)
                                                                     (cons %_4500
                                                                           %_4450)
                                                                     %_4501
                                                                     %_4502
                                                                     %_4503))))
                                                             (append
                                                               %_4453
                                                               %_4499
                                                               %_4495)
                                                             (append
                                                               %_4498
                                                               %_4452)
                                                             (append
                                                               %_4497
                                                               %_4451)
                                                             (%_3114
                                                               %_4492))))))))
                                                (%_3000
                                                  (%_3001 %_4459)
                                                  (cons %_4489
                                                        (%_3002 %_4459)))))
                                             (%_3041 '() '() '()))
                                            (if (memv %_4456 '(import-form))
                                              (%_3150
                                                %_4458
                                                %_4459
                                                %_4460
                                                (lambda (%_4484)
                                                  ((lambda (%_4485)
                                                     ((lambda (%_4486)
                                                        ((lambda (%_4487)
                                                           (if (memv %_4487
                                                                     '(module))
                                                             ((lambda (%_4488)
                                                                (begin
                                                                  (if %_4457
                                                                    (%_3073
                                                                      %_4442
                                                                      %_4457)
                                                                    (void))
                                                                  (%_3148
                                                                    %_4488
                                                                    %_4442)
                                                                  (%_4448
                                                                    (cdr %_4449)
                                                                    (cons %_4488
                                                                          %_4450)
                                                                    %_4451
                                                                    %_4452
                                                                    %_4453)))
                                                              (cdr %_4486))
                                                             (if (memv %_4487
                                                                       '(displaced-lexical))
                                                               (%_2982 %_4484)
                                                               (syntax-error
                                                                 %_4484
                                                                 '"import from unknown module"))))
                                                         (car %_4486)))
                                                      (%_2985 %_4485 %_4445)))
                                                   (%_3086 %_4484 '(())))))
                                              (if (memv %_4456 '(begin-form))
                                                ((lambda (%_4478)
                                                   (if %_4478
                                                     (apply (lambda (%_4479
                                                                     %_4480)
                                                              (%_4448
                                                                ((letrec ((%_4481
                                                                            (lambda (%_4482)
                                                                              (if (null? %_4482)
                                                                                (cdr %_4449)
                                                                                (cons (cons %_4455
                                                                                            (%_3099
                                                                                              (car %_4482)
                                                                                              %_4459))
                                                                                      (%_4481
                                                                                        (cdr %_4482)))))))
                                                                   %_4481)
                                                                 %_4480)
                                                                %_4450
                                                                %_4451
                                                                %_4452
                                                                %_4453))
                                                            %_4478)
                                                     (syntax-error %_4458)))
                                                 ($syntax-dispatch
                                                   (compile-in-annotation
                                                     %_4458
                                                     value)
                                                   '(any . each-any)))
                                                (if (memv %_4456
                                                          '(eval-when-form))
                                                  ((lambda (%_4469)
                                                     (if %_4469
                                                       (apply (lambda (%_4470
                                                                       %_4471
                                                                       %_4472)
                                                                (%_4448
                                                                  (if (memq 'eval
                                                                            (%_3103
                                                                              %_4471
                                                                              %_4459))
                                                                    ((letrec ((%_4473
                                                                                (lambda (%_4474)
                                                                                  (if (null? %_4474)
                                                                                    (cdr %_4449)
                                                                                    (cons (cons %_4455
                                                                                                (%_3099
                                                                                                  (car %_4474)
                                                                                                  %_4459))
                                                                                          (%_4473
                                                                                            (cdr %_4474)))))))
                                                                       %_4473)
                                                                     %_4472)
                                                                    (cdr %_4449))
                                                                  %_4450
                                                                  %_4451
                                                                  %_4452
                                                                  %_4453))
                                                              %_4469)
                                                       (syntax-error %_4458)))
                                                   ($syntax-dispatch
                                                     (compile-in-annotation
                                                       %_4458
                                                       value)
                                                     '(any each-any
                                                           .
                                                           each-any)))
                                                  (if (memv %_4456
                                                            '(local-syntax-form))
                                                    (%_3154
                                                      %_4457
                                                      %_4458
                                                      %_4455
                                                      %_4459
                                                      %_4460
                                                      (lambda (%_4462
                                                               %_4463
                                                               %_4464
                                                               %_4465)
                                                        (%_4448
                                                          ((letrec ((%_4466
                                                                      (lambda (%_4467)
                                                                        (if (null? %_4467)
                                                                          (cdr %_4449)
                                                                          (cons (cons %_4463
                                                                                      (%_3099
                                                                                        (car %_4467)
                                                                                        %_4464))
                                                                                (%_4466
                                                                                  (cdr %_4467)))))))
                                                             %_4466)
                                                           %_4462)
                                                          %_4450
                                                          %_4451
                                                          %_4452
                                                          %_4453)))
                                                    (%_4447
                                                      (cons (cons %_4455
                                                                  (%_3100
                                                                    %_4458
                                                                    %_4459
                                                                    %_4460))
                                                            (cdr %_4449))
                                                      %_4450
                                                      %_4451
                                                      %_4452
                                                      %_4453)))))))))))
                                (caar %_4449)
                                (cdar %_4449))))))
                  %_4448)
                %_4444
                '()
                '()
                '()
                '()))))
         (%_3146
           (lambda (%_4426 %_4427 %_4428 %_4429)
             ((lambda (%_4430)
                ((lambda (%_4431)
                   ((lambda (%_4432)
                      ((lambda (%_4433)
                         (%_3147
                           %_4431
                           %_4427
                           %_4433
                           %_4430
                           (lambda (%_4434 %_4435 %_4436 %_4437 %_4438)
                             (begin
                               (if (null? %_4434)
                                 (syntax-error
                                   %_4427
                                   '"no expressions in body")
                                 (void))
                               (%_2923
                                 '#f
                                 %_4436
                                 (map (lambda (%_4439)
                                        (%_3141
                                          (cdr %_4439)
                                          (car %_4439)
                                          '(())))
                                      %_4437)
                                 (%_2921
                                   '#f
                                   (map (lambda (%_4440)
                                          (%_3141
                                            (cdr %_4440)
                                            (car %_4440)
                                            '(())))
                                        (append %_4438 %_4434))))))))
                       (map (lambda (%_4441)
                              (cons %_4430 (%_3099 %_4441 %_4432)))
                            %_4426)))
                    (%_3000
                      (%_3001 %_4429)
                      (cons %_4431 (%_3002 %_4429)))))
                 (%_3041 '() '() '())))
              (cons '("placeholder" placeholder) %_4428))))
         (%_3145
           (lambda (%_4408 %_4409 %_4410 %_4411 %_4412 %_4413)
             (letrec ((%_4414
                        (lambda (%_4417 %_4418)
                          (if (pair? %_4417)
                            (cons (%_4414 (car %_4417) %_4418)
                                  (%_4414 (cdr %_4417) %_4418))
                            (if (%_2936 %_4417)
                              ((lambda (%_4423)
                                 ((lambda (%_4425 %_4424)
                                    (%_2935
                                      (%_2937 %_4417)
                                      (if (if (pair? %_4424)
                                            (eq? (car %_4424) '#f)
                                            '#f)
                                        (%_3000 (cdr %_4424) (cdr %_4425))
                                        (%_3000
                                          (cons %_4418 %_4424)
                                          (if %_4413
                                            (cons %_4413 (cons 'shift %_4425))
                                            (cons 'shift %_4425))))))
                                  (%_3002 %_4423)
                                  (%_3001 %_4423)))
                               (%_2938 %_4417))
                              (if (vector? %_4417)
                                ((lambda (%_4419)
                                   ((lambda (%_4420)
                                      ((letrec ((%_4421
                                                  (lambda (%_4422)
                                                    (if (= %_4422 %_4419)
                                                      %_4420
                                                      (begin
                                                        (vector-set!
                                                          %_4420
                                                          %_4422
                                                          (%_4414
                                                            (vector-ref
                                                              %_4417
                                                              %_4422)
                                                            %_4418))
                                                        (%_4421
                                                          (+ %_4422 '1)))))))
                                         %_4421)
                                       '0))
                                    (make-vector %_4419)))
                                 (vector-length %_4417))
                                (if (symbol? %_4417)
                                  (syntax-error
                                    (%_3100 %_4409 %_4411 %_4412)
                                    '"encountered raw symbol "
                                    (format '"~s" %_4417)
                                    '" in output of macro")
                                  %_4417)))))))
               (%_4414
                 ((lambda (%_4415)
                    (if (procedure? %_4415)
                      (%_4415
                        (lambda (%_4416)
                          (begin
                            (if (not (identifier? %_4416))
                              (syntax-error
                                %_4416
                                '"environment argument is not an identifier")
                              (void))
                            (%_2985 (%_3086 %_4416 '(())) %_4410))))
                      %_4415))
                  (%_4408 (%_3100 %_4409 (%_3058 %_4411) %_4412)))
                 (string '#\m)))))
         (%_3144
           (lambda (%_4381 %_4382 %_4383 %_4384 %_4385)
             ((lambda (%_4387)
                (if (if %_4387
                      (apply (lambda (%_4405 %_4406 %_4407) (%_2993 %_4406))
                             %_4387)
                      '#f)
                  (apply (lambda (%_4389 %_4390 %_4391)
                           ((lambda (%_4392)
                              ((lambda (%_4393)
                                 ((lambda (%_4394)
                                    (if (memv %_4394 '(macro!))
                                      ((lambda (%_4404 %_4403)
                                         (%_3104
                                           (%_3145
                                             (%_2965 %_4393)
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
                                                   %_4403
                                                   %_4404)
                                             %_4382
                                             '(())
                                             %_4384
                                             %_4385)
                                           %_4382
                                           '(())
                                           %_4384
                                           %_4385))
                                       (%_3099 %_4391 %_4383)
                                       (%_3099 %_4390 %_4383))
                                      (values
                                        'core
                                        (lambda (%_4395 %_4396 %_4397 %_4398)
                                          ((lambda (%_4400 %_4399)
                                             ((lambda (%_4401)
                                                ((lambda (%_4402)
                                                   (if (memv %_4402 '(lexical))
                                                     (if %_4398
                                                       (list 'compile-in-annotation
                                                             (list 'set!
                                                                   (%_2965
                                                                     %_4401)
                                                                   %_4399)
                                                             %_4398)
                                                       (list 'set!
                                                             (%_2965 %_4401)
                                                             %_4399))
                                                     (if (memv %_4402
                                                               '(global))
                                                       (if %_4398
                                                         (list 'compile-in-annotation
                                                               (list 'set!
                                                                     (%_2965
                                                                       %_4401)
                                                                     %_4399)
                                                               %_4398)
                                                         (list 'set!
                                                               (%_2965 %_4401)
                                                               %_4399))
                                                       (if (memv %_4402
                                                                 '(displaced-lexical))
                                                         (syntax-error
                                                           (%_3099
                                                             %_4390
                                                             %_4397)
                                                           '"identifier out of context")
                                                         (syntax-error
                                                           (%_3100
                                                             %_4395
                                                             %_4397
                                                             %_4398))))))
                                                 (%_2964 %_4401)))
                                              (%_2985 %_4400 %_4396)))
                                           (%_3086 %_4390 %_4397)
                                           (%_3141 %_4391 %_4396 %_4397)))
                                        %_4381
                                        %_4383
                                        %_4384)))
                                  (%_2964 %_4393)))
                               (%_2985 %_4392 %_4382)))
                            (%_3086 %_4390 %_4383)))
                         %_4387)
                  (syntax-error (%_3100 %_4381 %_4383 %_4384))))
              ($syntax-dispatch
                (compile-in-annotation %_4381 value)
                '(any any any)))))
         (%_3143
           (lambda (%_4367 %_4368 %_4369 %_4370 %_4371)
             ((lambda (%_4373)
                (if %_4373
                  (apply (lambda (%_4375 %_4376)
                           (if %_4371
                             (list 'compile-in-annotation
                                   (cons %_4367
                                         (map (lambda (%_4379)
                                                (%_3141 %_4379 %_4369 %_4370))
                                              %_4376))
                                   %_4371)
                             (cons %_4367
                                   (map (lambda (%_4377)
                                          (%_3141 %_4377 %_4369 %_4370))
                                        %_4376))))
                         %_4373)
                  (syntax-error (%_3100 %_4368 %_4370 %_4371))))
              ($syntax-dispatch
                (compile-in-annotation %_4368 value)
                '(any . each-any)))))
         (%_3142
           (lambda (%_4346 %_4347 %_4348 %_4349 %_4350 %_4351)
             (if (memv %_4346 '(lexical))
               (if %_4351
                 (list 'compile-in-annotation %_4347 %_4351)
                 %_4347)
               (if (memv %_4346 '(core))
                 (%_4347 %_4348 %_4349 %_4350 %_4351)
                 (if (memv %_4346 '(lexical-call))
                   (%_3143
                     (if (%_2955 (car %_4348))
                       (list 'compile-in-annotation
                             %_4347
                             (%_2955 (car %_4348)))
                       %_4347)
                     %_4348
                     %_4349
                     %_4350
                     %_4351)
                   (if (memv %_4346 '(constant))
                     (if %_4351
                       (list 'compile-in-annotation
                             (list 'quote
                                   (%_3159
                                     (%_3100 %_4348 %_4350 %_4351)
                                     '(())))
                             %_4351)
                       (list 'quote
                             (%_3159 (%_3100 %_4348 %_4350 %_4351) '(()))))
                     (if (memv %_4346 '(global))
                       (if %_4351
                         (list 'compile-in-annotation %_4347 %_4351)
                         %_4347)
                       (if (memv %_4346 '(call))
                         (%_3143
                           (%_3141 (car %_4348) %_4349 %_4350)
                           %_4348
                           %_4349
                           %_4350
                           %_4351)
                         (if (memv %_4346 '(begin-form))
                           ((lambda (%_4362)
                              (if %_4362
                                (apply (lambda (%_4363 %_4364 %_4365)
                                         (%_3101
                                           (cons %_4364 %_4365)
                                           %_4349
                                           %_4350
                                           %_4351))
                                       %_4362)
                                (syntax-error %_4348)))
                            ($syntax-dispatch
                              (compile-in-annotation %_4348 value)
                              '(any any . each-any)))
                           (if (memv %_4346 '(local-syntax-form))
                             (%_3154
                               %_4347
                               %_4348
                               %_4349
                               %_4350
                               %_4351
                               %_3101)
                             (if (memv %_4346 '(eval-when-form))
                               ((lambda (%_4354)
                                  (if %_4354
                                    (apply (lambda (%_4355
                                                    %_4356
                                                    %_4357
                                                    %_4358)
                                             (if (memq 'eval
                                                       (%_3103 %_4356 %_4350))
                                               (%_3101
                                                 (cons %_4357 %_4358)
                                                 %_4349
                                                 %_4350
                                                 %_4351)
                                               (%_3155)))
                                           %_4354)
                                    (syntax-error %_4348)))
                                ($syntax-dispatch
                                  (compile-in-annotation %_4348 value)
                                  '(any each-any any . each-any)))
                               (if (memv %_4346
                                         '(define-form
                                            define-syntax-form
                                            module-form
                                            import-form))
                                 (syntax-error
                                   (%_3100 %_4348 %_4350 %_4351)
                                   '"invalid context for definition")
                                 (if (memv %_4346 '(syntax))
                                   (syntax-error
                                     (%_3100 %_4348 %_4350 %_4351)
                                     '"reference to pattern variable outside syntax form")
                                   (if (memv %_4346 '(displaced-lexical))
                                     (%_2982 (%_3100 %_4348 %_4350 %_4351))
                                     (syntax-error
                                       (%_3100
                                         %_4348
                                         %_4350
                                         %_4351))))))))))))))))
         (%_3141
           (lambda (%_4338 %_4339 %_4340)
             (call-with-values
               (lambda () (%_3104 %_4338 %_4339 %_4340 '#f '#f))
               (lambda (%_4341 %_4342 %_4343 %_4344 %_4345)
                 (%_3142
                   %_4341
                   %_4342
                   %_4343
                   %_4339
                   %_4344
                   %_4345)))))
         (%_3140
           (lambda (%_4332 %_4333)
             (if (memq 'e %_4332)
               (begin (%_2812 (%_4333)) (%_3155))
               ((lambda (%_4334)
                  (if (memq 'r %_4332)
                    (if ((lambda (%_4336)
                           (if %_4336 %_4336 (memq 'v %_4332)))
                         (memq 'l %_4332))
                      (%_4334)
                      (%_4334))
                    (if ((lambda (%_4335)
                           (if %_4335 %_4335 (memq 'v %_4332)))
                         (memq 'l %_4332))
                      (%_4334)
                      (%_3155))))
                (if (memq 'c %_4332)
                  ((lambda (%_4337)
                     (begin (%_2812 %_4337) (lambda () %_4337)))
                   (%_4333))
                  %_4333)))))
         (%_3139
           (lambda (%_4326 %_4327)
             (if (memq 'e %_4326)
               (%_4327)
               ((lambda (%_4328)
                  (if (memq 'v %_4326)
                    (if ((lambda (%_4330)
                           (if %_4330 %_4330 (memq 'r %_4326)))
                         (memq 'l %_4326))
                      (%_4328)
                      (%_4328))
                    (if ((lambda (%_4329)
                           (if %_4329 %_4329 (memq 'r %_4326)))
                         (memq 'l %_4326))
                      (%_4328)
                      (%_3155))))
                (if (memq 'c %_4326)
                  ((lambda (%_4331)
                     (begin (%_2812 %_4331) (lambda () %_4331)))
                   (%_4327))
                  %_4327)))))
         (%_3138
           (lambda (%_4321 %_4322)
             (apply append
                    (map (lambda (%_4323)
                           (if %_4322
                             (if (memv %_4323 '(compile))
                               '(c)
                               (if (memv %_4323 '(load))
                                 '(l)
                                 (if (memv %_4323 '(visit))
                                   '(v)
                                   (if (memv %_4323 '(revisit)) '(r) '()))))
                             (if (memv %_4323 '(eval)) '(e) '())))
                         %_4321))))
         (%_3137
           (lambda (%_4316 %_4317)
             (remq '-
                   (apply append
                          (map (lambda (%_4318)
                                 ((lambda (%_4319)
                                    (map (lambda (%_4320)
                                           (cdr (assq %_4320 %_4319)))
                                         %_4316))
                                  (cdr (assq %_4318
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
                               %_4317)))))
         (%_3136
           (lambda (%_4313 %_4314)
             (list '$sc-put-cte
                   (list 'quote %_4313)
                   (list 'quote (%_2963 'do-import %_4314)))))
         (%_3135
           (lambda (%_4308 %_4309)
             ((lambda (%_4310)
                ((letrec ((%_4311
                            (lambda (%_4312)
                              (if (not (= %_4312 %_4310))
                                (begin
                                  (%_4308 (vector-ref %_4309 %_4312))
                                  (%_4311 (+ %_4312 '1)))
                                (void)))))
                   %_4311)
                 '0))
              (vector-length %_4309))))
         (%_3134
           (lambda (%_4303 %_4304)
             ((letrec ((%_4305
                         (lambda (%_4306 %_4307)
                           (if (< %_4306 '0)
                             %_4307
                             (%_4305
                               (- %_4306 '1)
                               (cons (%_4303 (vector-ref %_4304 %_4306))
                                     %_4307))))))
                %_4305)
              (- (vector-length %_4304) '1)
              '())))
         (%_3133
           (lambda (%_4214
                    %_4215
                    %_4216
                    %_4217
                    %_4218
                    %_4219
                    %_4220
                    %_4221)
             (letrec ((%_4224
                        (lambda (%_4297 %_4298)
                          ((lambda (%_4299)
                             (map (lambda (%_4300)
                                    ((lambda (%_4301)
                                       (if (not (%_3098 %_4301 %_4299))
                                         %_4300
                                         (%_3116
                                           (%_3118 %_4300)
                                           %_4301
                                           (%_3120 %_4300)
                                           (append
                                             (%_4223 %_4301)
                                             (%_3121 %_4300))
                                           (%_3122 %_4300))))
                                     (%_3119 %_4300)))
                                  %_4297))
                           (map (lambda (%_4302)
                                  (if (pair? %_4302) (car %_4302) %_4302))
                                %_4298))))
                      (%_4223
                        (lambda (%_4294)
                          ((letrec ((%_4295
                                      (lambda (%_4296)
                                        (if (null? %_4296)
                                          '()
                                          (if (if (pair? (car %_4296))
                                                (%_3089 %_4294 (caar %_4296))
                                                '#f)
                                            (%_3107 (cdar %_4296))
                                            (%_4295 (cdr %_4296)))))))
                             %_4295)
                           %_4218)))
                      (%_4222
                        (lambda (%_4291 %_4292 %_4293)
                          (begin
                            (%_3132 %_4215 %_4292)
                            (%_3131 %_4215 %_4219 %_4292)
                            (%_4221 %_4291 %_4293)))))
               ((letrec ((%_4225
                           (lambda (%_4226 %_4227 %_4228 %_4229)
                             (if (null? %_4226)
                               (%_4222 %_4228 %_4227 %_4229)
                               ((lambda (%_4231 %_4230)
                                  (call-with-values
                                    (lambda ()
                                      (%_3104 %_4230 %_4231 '(()) '#f %_4214))
                                    (lambda (%_4232
                                             %_4233
                                             %_4234
                                             %_4235
                                             %_4236)
                                      (if (memv %_4232 '(define-form))
                                        (%_3151
                                          %_4234
                                          %_4235
                                          %_4236
                                          (lambda (%_4285 %_4286 %_4287)
                                            ((lambda (%_4288)
                                               ((lambda (%_4289)
                                                  ((lambda (%_4290)
                                                     (begin
                                                       (%_3072
                                                         %_4214
                                                         %_4288
                                                         %_4289)
                                                       (%_4225
                                                         (cdr %_4226)
                                                         (cons %_4288 %_4227)
                                                         (cons (%_3116
                                                                 %_4232
                                                                 %_4288
                                                                 %_4289
                                                                 %_4290
                                                                 (cons %_4231
                                                                       (%_3099
                                                                         %_4286
                                                                         %_4287)))
                                                               %_4228)
                                                         %_4229)))
                                                   (%_4223 %_4288)))
                                                (%_3035)))
                                             (%_3099 %_4285 %_4287))))
                                        (if (memv %_4232 '(define-syntax-form))
                                          (%_3152
                                            %_4234
                                            %_4235
                                            %_4236
                                            (lambda (%_4278 %_4279 %_4280)
                                              ((lambda (%_4281)
                                                 ((lambda (%_4282)
                                                    ((lambda (%_4283)
                                                       ((lambda (%_4284)
                                                          (begin
                                                            (%_3130
                                                              %_4217
                                                              (%_3036 %_4282)
                                                              (cons 'deferred
                                                                    %_4284))
                                                            (%_3072
                                                              %_4214
                                                              %_4281
                                                              %_4282)
                                                            (%_4225
                                                              (cdr %_4226)
                                                              (cons %_4281
                                                                    %_4227)
                                                              (cons (%_3116
                                                                      %_4232
                                                                      %_4281
                                                                      %_4282
                                                                      %_4283
                                                                      %_4284)
                                                                    %_4228)
                                                              %_4229)))
                                                        (%_3141
                                                          %_4279
                                                          (%_2981 %_4231)
                                                          %_4280)))
                                                     (%_4223 %_4281)))
                                                  (%_3035)))
                                               (%_3099 %_4278 %_4280))))
                                          (if (memv %_4232 '(module-form))
                                            ((lambda (%_4265)
                                               ((lambda (%_4266)
                                                  (%_3149
                                                    %_4234
                                                    %_4235
                                                    %_4236
                                                    %_4266
                                                    (lambda (%_4267
                                                             %_4268
                                                             %_4269)
                                                      (%_3133
                                                        %_4265
                                                        (%_3100
                                                          %_4234
                                                          %_4235
                                                          %_4236)
                                                        (map (lambda (%_4270)
                                                               (cons %_4231
                                                                     %_4270))
                                                             %_4269)
                                                        %_4217
                                                        %_4268
                                                        (%_3107 %_4268)
                                                        %_4220
                                                        (lambda (%_4271 %_4272)
                                                          ((lambda (%_4273)
                                                             ((lambda (%_4274)
                                                                ((lambda (%_4275)
                                                                   (if %_4267
                                                                     ((lambda (%_4277
                                                                               %_4276)
                                                                        (begin
                                                                          (%_3130
                                                                            %_4217
                                                                            (%_3036
                                                                              %_4276)
                                                                            (%_2963
                                                                              'module
                                                                              %_4273))
                                                                          (%_3072
                                                                            %_4214
                                                                            %_4267
                                                                            %_4276)
                                                                          (%_4225
                                                                            (cdr %_4226)
                                                                            (cons %_4267
                                                                                  %_4227)
                                                                            (cons (%_3116
                                                                                    %_4232
                                                                                    %_4267
                                                                                    %_4276
                                                                                    %_4277
                                                                                    %_4268)
                                                                                  %_4274)
                                                                            %_4275)))
                                                                      (%_4223
                                                                        %_4267)
                                                                      (%_3035))
                                                                     (begin
                                                                       (%_3148
                                                                         %_4273
                                                                         %_4214)
                                                                       (%_4225
                                                                         (cdr %_4226)
                                                                         (cons %_4273
                                                                               %_4227)
                                                                         %_4274
                                                                         %_4275))))
                                                                 (append
                                                                   %_4229
                                                                   %_4272)))
                                                              (append
                                                                (if %_4267
                                                                  %_4271
                                                                  (%_4224
                                                                    %_4271
                                                                    %_4268))
                                                                %_4228)))
                                                           (%_3114
                                                             %_4268)))))))
                                                (%_3000
                                                  (%_3001 %_4235)
                                                  (cons %_4265
                                                        (%_3002 %_4235)))))
                                             (%_3041 '() '() '()))
                                            (if (memv %_4232 '(import-form))
                                              (%_3150
                                                %_4234
                                                %_4235
                                                %_4236
                                                (lambda (%_4260)
                                                  ((lambda (%_4261)
                                                     ((lambda (%_4262)
                                                        ((lambda (%_4263)
                                                           (if (memv %_4263
                                                                     '(module))
                                                             ((lambda (%_4264)
                                                                (begin
                                                                  (if %_4233
                                                                    (%_3073
                                                                      %_4214
                                                                      %_4233)
                                                                    (void))
                                                                  (%_3148
                                                                    %_4264
                                                                    %_4214)
                                                                  (%_4225
                                                                    (cdr %_4226)
                                                                    (cons %_4264
                                                                          %_4227)
                                                                    (%_4224
                                                                      %_4228
                                                                      (vector->list
                                                                        (%_3110
                                                                          %_4264)))
                                                                    %_4229)))
                                                              (%_2965 %_4262))
                                                             (if (memv %_4263
                                                                       '(displaced-lexical))
                                                               (%_2982 %_4260)
                                                               (syntax-error
                                                                 %_4260
                                                                 '"import from unknown module"))))
                                                         (%_2964 %_4262)))
                                                      (%_2985 %_4261 %_4217)))
                                                   (%_3086 %_4260 '(())))))
                                              (if (memv %_4232 '(begin-form))
                                                ((lambda (%_4254)
                                                   (if %_4254
                                                     (apply (lambda (%_4255
                                                                     %_4256)
                                                              (%_4225
                                                                ((letrec ((%_4257
                                                                            (lambda (%_4258)
                                                                              (if (null? %_4258)
                                                                                (cdr %_4226)
                                                                                (cons (cons %_4231
                                                                                            (%_3099
                                                                                              (car %_4258)
                                                                                              %_4235))
                                                                                      (%_4257
                                                                                        (cdr %_4258)))))))
                                                                   %_4257)
                                                                 %_4256)
                                                                %_4227
                                                                %_4228
                                                                %_4229))
                                                            %_4254)
                                                     (syntax-error %_4234)))
                                                 ($syntax-dispatch
                                                   (compile-in-annotation
                                                     %_4234
                                                     value)
                                                   '(any . each-any)))
                                                (if (memv %_4232
                                                          '(eval-when-form))
                                                  ((lambda (%_4245)
                                                     (if %_4245
                                                       (apply (lambda (%_4246
                                                                       %_4247
                                                                       %_4248)
                                                                (%_4225
                                                                  (if (memq 'eval
                                                                            (%_3103
                                                                              %_4247
                                                                              %_4235))
                                                                    ((letrec ((%_4249
                                                                                (lambda (%_4250)
                                                                                  (if (null? %_4250)
                                                                                    (cdr %_4226)
                                                                                    (cons (cons %_4231
                                                                                                (%_3099
                                                                                                  (car %_4250)
                                                                                                  %_4235))
                                                                                          (%_4249
                                                                                            (cdr %_4250)))))))
                                                                       %_4249)
                                                                     %_4248)
                                                                    (cdr %_4226))
                                                                  %_4227
                                                                  %_4228
                                                                  %_4229))
                                                              %_4245)
                                                       (syntax-error %_4234)))
                                                   ($syntax-dispatch
                                                     (compile-in-annotation
                                                       %_4234
                                                       value)
                                                     '(any each-any
                                                           .
                                                           each-any)))
                                                  (if (memv %_4232
                                                            '(local-syntax-form))
                                                    (%_3154
                                                      %_4233
                                                      %_4234
                                                      %_4231
                                                      %_4235
                                                      %_4236
                                                      (lambda (%_4238
                                                               %_4239
                                                               %_4240
                                                               %_4241)
                                                        (%_4225
                                                          ((letrec ((%_4242
                                                                      (lambda (%_4243)
                                                                        (if (null? %_4243)
                                                                          (cdr %_4226)
                                                                          (cons (cons %_4239
                                                                                      (%_3099
                                                                                        (car %_4243)
                                                                                        %_4240))
                                                                                (%_4242
                                                                                  (cdr %_4243)))))))
                                                             %_4242)
                                                           %_4238)
                                                          %_4227
                                                          %_4228
                                                          %_4229)))
                                                    (%_4222
                                                      %_4228
                                                      %_4227
                                                      (append
                                                        %_4229
                                                        (cons (cons %_4231
                                                                    (%_3100
                                                                      %_4234
                                                                      %_4235
                                                                      %_4236))
                                                              (cdr %_4226))))))))))))))
                                (caar %_4226)
                                (cdar %_4226))))))
                  %_4225)
                %_4216
                '()
                '()
                '()))))
         (%_3132
           (lambda (%_4170 %_4171)
             (letrec ((%_4175
                        (lambda (%_4206 %_4207 %_4208)
                          ((lambda (%_4209)
                             (if %_4209
                               (if (%_3076
                                     ((lambda (%_4213)
                                        (if (annotation? %_4213)
                                          (annotation-expression %_4213)
                                          %_4213))
                                      (if (%_2936 %_4206)
                                        (%_2937 %_4206)
                                        %_4206))
                                     %_4209
                                     (if (symbol? %_4206)
                                       (%_3001 '((top)))
                                       (%_3001 (%_2938 %_4206))))
                                 (cons %_4206 %_4208)
                                 %_4208)
                               (%_4173
                                 (%_3110 %_4207)
                                 (lambda (%_4210 %_4211)
                                   (if (%_4172 %_4210 %_4206)
                                     (cons %_4210 %_4211)
                                     %_4211))
                                 %_4208)))
                           (%_3111 %_4207))))
                      (%_4174
                        (lambda (%_4197 %_4198 %_4199)
                          (if (%_3109 %_4197)
                            (if (%_3109 %_4198)
                              (call-with-values
                                (lambda ()
                                  ((lambda (%_4201 %_4200)
                                     (if (> (vector-length %_4200)
                                            (vector-length %_4201))
                                       (values %_4197 %_4201)
                                       (values %_4198 %_4200)))
                                   (%_3110 %_4198)
                                   (%_3110 %_4197)))
                                (lambda (%_4202 %_4203)
                                  (%_4173
                                    %_4203
                                    (lambda (%_4204 %_4205)
                                      (%_4175 %_4204 %_4202 %_4205))
                                    %_4199)))
                              (%_4175 %_4198 %_4197 %_4199))
                            (if (%_3109 %_4198)
                              (%_4175 %_4197 %_4198 %_4199)
                              (if (%_4172 %_4197 %_4198)
                                (cons %_4197 %_4199)
                                %_4199)))))
                      (%_4173
                        (lambda (%_4190 %_4191 %_4192)
                          ((lambda (%_4193)
                             ((letrec ((%_4194
                                         (lambda (%_4195 %_4196)
                                           (if (= %_4195 %_4193)
                                             %_4196
                                             (%_4194
                                               (+ %_4195 '1)
                                               (%_4191
                                                 (vector-ref %_4190 %_4195)
                                                 %_4196))))))
                                %_4194)
                              '0
                              %_4192))
                           (vector-length %_4190))))
                      (%_4172
                        (lambda (%_4184 %_4185)
                          (if (symbol? %_4184)
                            (if (symbol? %_4185)
                              (eq? %_4184 %_4185)
                              (if (eq? %_4184
                                       ((lambda (%_4189)
                                          (if (annotation? %_4189)
                                            (annotation-expression %_4189)
                                            %_4189))
                                        (if (%_2936 %_4185)
                                          (%_2937 %_4185)
                                          %_4185)))
                                (%_3082
                                  (%_3001 (%_2938 %_4185))
                                  (%_3001 '((top))))
                                '#f))
                            (if (symbol? %_4185)
                              (if (eq? %_4185
                                       ((lambda (%_4187)
                                          (if (annotation? %_4187)
                                            (annotation-expression %_4187)
                                            %_4187))
                                        (if (%_2936 %_4184)
                                          (%_2937 %_4184)
                                          %_4184)))
                                (%_3082
                                  (%_3001 (%_2938 %_4184))
                                  (%_3001 '((top))))
                                '#f)
                              (%_3089 %_4184 %_4185))))))
               (if (not (null? %_4171))
                 ((letrec ((%_4176
                             (lambda (%_4177 %_4178 %_4179)
                               (if (null? %_4178)
                                 (if (not (null? %_4179))
                                   ((lambda (%_4183)
                                      (syntax-error
                                        %_4170
                                        '"duplicate definition for "
                                        (symbol->string (car %_4183))
                                        '" in"))
                                    (syntax-object->datum %_4179))
                                   (void))
                                 ((letrec ((%_4180
                                             (lambda (%_4181 %_4182)
                                               (if (null? %_4181)
                                                 (%_4176
                                                   (car %_4178)
                                                   (cdr %_4178)
                                                   %_4182)
                                                 (%_4180
                                                   (cdr %_4181)
                                                   (%_4174
                                                     %_4177
                                                     (car %_4181)
                                                     %_4182))))))
                                    %_4180)
                                  %_4178
                                  %_4179)))))
                    %_4176)
                  (car %_4171)
                  (cdr %_4171)
                  '())
                 (void)))))
         (%_3131
           (lambda (%_4151 %_4152 %_4153)
             (letrec ((%_4154
                        (lambda (%_4160 %_4161)
                          (ormap (lambda (%_4162)
                                   (if (%_3109 %_4162)
                                     ((lambda (%_4163)
                                        (if %_4163
                                          (%_3076
                                            ((lambda (%_4169)
                                               (if (annotation? %_4169)
                                                 (annotation-expression %_4169)
                                                 %_4169))
                                             (if (%_2936 %_4160)
                                               (%_2937 %_4160)
                                               %_4160))
                                            %_4163
                                            (%_3001 (%_2938 %_4160)))
                                          ((lambda (%_4164)
                                             ((letrec ((%_4165
                                                         (lambda (%_4166)
                                                           (if (>= %_4166 '0)
                                                             ((lambda (%_4167)
                                                                (if %_4167
                                                                  %_4167
                                                                  (%_4165
                                                                    (- %_4166
                                                                       '1))))
                                                              (%_3089
                                                                %_4160
                                                                (vector-ref
                                                                  %_4164
                                                                  %_4166)))
                                                             '#f))))
                                                %_4165)
                                              (- (vector-length %_4164) '1)))
                                           (%_3110 %_4162))))
                                      (%_3111 %_4162))
                                     (%_3089 %_4160 %_4162)))
                                 %_4161))))
               ((letrec ((%_4155
                           (lambda (%_4156 %_4157)
                             (if (null? %_4156)
                               (if (not (null? %_4157))
                                 (syntax-error
                                   %_4157
                                   '"missing definition for export(s)")
                                 (void))
                               ((lambda (%_4159 %_4158)
                                  (if (%_4154 %_4158 %_4153)
                                    (%_4155 %_4159 %_4157)
                                    (%_4155 %_4159 (cons %_4158 %_4157))))
                                (cdr %_4156)
                                (car %_4156))))))
                  %_4155)
                %_4152
                '()))))
         (%_3130
           (lambda (%_4148 %_4149 %_4150)
             (set-cdr!
               %_4148
               (%_2978 %_4149 %_4150 (cdr %_4148)))))
         (%_3129
           (lambda (%_4146 %_4147)
             (if (null? %_4146)
               '()
               (if (%_3098 (car %_4146) %_4147)
                 (%_3129 (cdr %_4146) %_4147)
                 (cons (car %_4146) (%_3129 (cdr %_4146) %_4147))))))
         (%_3128
           (lambda (%_4072
                    %_4073
                    %_4074
                    %_4075
                    %_4076
                    %_4077
                    %_4078
                    %_4079
                    %_4080
                    %_4081)
             ((lambda (%_4082)
                (%_3133
                  %_4074
                  (%_3100 %_4072 %_4075 %_4076)
                  (map (lambda (%_4083) (cons %_4073 %_4083))
                       %_4081)
                  %_4073
                  %_4080
                  %_4082
                  %_4077
                  (lambda (%_4084 %_4085)
                    ((letrec ((%_4086
                                (lambda (%_4087 %_4088 %_4089 %_4090 %_4091)
                                  (if (null? %_4087)
                                    ((letrec ((%_4113
                                                (lambda (%_4114 %_4115 %_4116)
                                                  (if (null? %_4114)
                                                    ((lambda (%_4122
                                                              %_4121
                                                              %_4120)
                                                       (begin
                                                         (for-each
                                                           (lambda (%_4123)
                                                             (apply (lambda (%_4124
                                                                             %_4125
                                                                             %_4126
                                                                             %_4127)
                                                                      (if %_4125
                                                                        (%_3037
                                                                          %_4125
                                                                          %_4126)
                                                                        (void)))
                                                                    %_4123))
                                                           %_4091)
                                                         (%_2921
                                                           '#f
                                                           (list (%_3140
                                                                   %_4077
                                                                   (lambda ()
                                                                     (if (null? %_4091)
                                                                       (%_3155)
                                                                       (%_2921
                                                                         '#f
                                                                         (map (lambda (%_4128)
                                                                                (apply (lambda (%_4129
                                                                                                %_4130
                                                                                                %_4131
                                                                                                %_4132)
                                                                                         (list '$sc-put-cte
                                                                                               (list 'quote
                                                                                                     %_4131)
                                                                                               (if (eq? %_4129
                                                                                                        'define-syntax-form)
                                                                                                 %_4132
                                                                                                 (list 'quote
                                                                                                       (%_2963
                                                                                                         'module
                                                                                                         (%_3115
                                                                                                           %_4132
                                                                                                           %_4131))))))
                                                                                       %_4128))
                                                                              %_4091)))))
                                                                 (%_3140
                                                                   %_4077
                                                                   (lambda ()
                                                                     ((lambda (%_4133)
                                                                        ((lambda (%_4134)
                                                                           ((lambda (%_4135)
                                                                              (if %_4133
                                                                                (list '$sc-put-cte
                                                                                      (list 'quote
                                                                                            (if (%_3082
                                                                                                  (%_3001
                                                                                                    (%_2938
                                                                                                      %_4079))
                                                                                                  (%_3001
                                                                                                    '((top))))
                                                                                              %_4133
                                                                                              ((lambda (%_4137)
                                                                                                 (%_2935
                                                                                                   %_4133
                                                                                                   (%_3000
                                                                                                     %_4137
                                                                                                     (list (%_3041
                                                                                                             (vector
                                                                                                               %_4133)
                                                                                                             (vector
                                                                                                               %_4137)
                                                                                                             (vector
                                                                                                               (%_2822
                                                                                                                 %_4133)))))))
                                                                                               (%_3001
                                                                                                 (%_2938
                                                                                                   %_4079)))))
                                                                                      %_4135)
                                                                                ((lambda (%_4136)
                                                                                   (%_2921
                                                                                     '#f
                                                                                     (list (list '$sc-put-cte
                                                                                                 (list 'quote
                                                                                                       %_4136)
                                                                                                 %_4135)
                                                                                           (%_3136
                                                                                             %_4136
                                                                                             %_4134))))
                                                                                 (%_2822
                                                                                   'tmp))))
                                                                            (list 'quote
                                                                                  (%_2963
                                                                                    'module
                                                                                    (%_3115
                                                                                      %_4080
                                                                                      %_4134)))))
                                                                         (%_2822
                                                                           %_4133)))
                                                                      (if %_4079
                                                                        ((lambda (%_4139)
                                                                           (if (annotation?
                                                                                 %_4139)
                                                                             (annotation-expression
                                                                               %_4139)
                                                                             %_4139))
                                                                         (if (%_2936
                                                                               %_4079)
                                                                           (%_2937
                                                                             %_4079)
                                                                           %_4079))
                                                                        '#f))))
                                                                 (if (null? %_4089)
                                                                   (%_3155)
                                                                   (%_2921
                                                                     '#f
                                                                     (map (lambda (%_4140)
                                                                            (list 'define
                                                                                  %_4140
                                                                                  (%_3155)))
                                                                          %_4089)))
                                                                 (%_3139
                                                                   %_4078
                                                                   (lambda ()
                                                                     (%_2923
                                                                       '#f
                                                                       %_4115
                                                                       %_4121
                                                                       (%_2921
                                                                         '#f
                                                                         (list (if (null? %_4089)
                                                                                 (%_3155)
                                                                                 (%_2921
                                                                                   '#f
                                                                                   (map (lambda (%_4141
                                                                                                 %_4142)
                                                                                          (list 'set!
                                                                                                %_4141
                                                                                                %_4142))
                                                                                        %_4089
                                                                                        %_4120)))
                                                                               (if (null? %_4122)
                                                                                 (%_3155)
                                                                                 (%_2921
                                                                                   '#f
                                                                                   %_4122)))))))
                                                                 (%_3155)))))
                                                     (map (lambda (%_4145)
                                                            (%_3141
                                                              (cdr %_4145)
                                                              (car %_4145)
                                                              '(())))
                                                          %_4085)
                                                     (map (lambda (%_4144)
                                                            (%_3141
                                                              (cdr %_4144)
                                                              (car %_4144)
                                                              '(())))
                                                          %_4116)
                                                     (map (lambda (%_4143)
                                                            (%_3141
                                                              (cdr %_4143)
                                                              (car %_4143)
                                                              '(())))
                                                          %_4090))
                                                    ((lambda (%_4117)
                                                       ((lambda (%_4118)
                                                          (if (memv %_4118
                                                                    '(define-form))
                                                            ((lambda (%_4119)
                                                               (begin
                                                                 (%_3130
                                                                   %_4073
                                                                   (%_3036
                                                                     (%_3120
                                                                       %_4117))
                                                                   (%_2963
                                                                     'lexical
                                                                     %_4119))
                                                                 (%_4113
                                                                   (cdr %_4114)
                                                                   (cons %_4119
                                                                         %_4115)
                                                                   (cons (%_3122
                                                                           %_4117)
                                                                         %_4116))))
                                                             (%_3160
                                                               (%_3119
                                                                 %_4117)))
                                                            (if (memv %_4118
                                                                      '(define-syntax-form
                                                                         module-form))
                                                              (%_4113
                                                                (cdr %_4114)
                                                                %_4115
                                                                %_4116)
                                                              (error 'sc-expand-internal
                                                                     '"unexpected module binding type"))))
                                                        (%_3118 %_4117)))
                                                     (car %_4114))))))
                                       %_4113)
                                     %_4088
                                     '()
                                     '())
                                    ((lambda (%_4093 %_4092)
                                       (letrec ((%_4094
                                                  (lambda (%_4106
                                                           %_4107
                                                           %_4108
                                                           %_4109)
                                                    ((letrec ((%_4110
                                                                (lambda (%_4111
                                                                         %_4112)
                                                                  (if (null? %_4111)
                                                                    (%_4109)
                                                                    (if (%_3087
                                                                          (%_3119
                                                                            (car %_4111))
                                                                          %_4106)
                                                                      (%_4108
                                                                        (car %_4111)
                                                                        (%_3079
                                                                          (reverse
                                                                            %_4112)
                                                                          (cdr %_4111)))
                                                                      (%_4110
                                                                        (cdr %_4111)
                                                                        (cons (car %_4111)
                                                                              %_4112)))))))
                                                       %_4110)
                                                     %_4107
                                                     '()))))
                                         (%_4094
                                           %_4092
                                           %_4088
                                           (lambda (%_4095 %_4096)
                                             ((lambda (%_4099 %_4098 %_4097)
                                                ((lambda (%_4101 %_4100)
                                                   (if (memv %_4097
                                                             '(define-form))
                                                     (begin
                                                       (%_3037 %_4098 %_4101)
                                                       (%_4086
                                                         %_4100
                                                         %_4096
                                                         (cons %_4101 %_4089)
                                                         (cons (%_3122 %_4095)
                                                               %_4090)
                                                         %_4091))
                                                     (if (memv %_4097
                                                               '(define-syntax-form))
                                                       (%_4086
                                                         %_4100
                                                         %_4096
                                                         %_4089
                                                         %_4090
                                                         (cons (list %_4097
                                                                     %_4098
                                                                     %_4101
                                                                     (%_3122
                                                                       %_4095))
                                                               %_4091))
                                                       (if (memv %_4097
                                                                 '(module-form))
                                                         ((lambda (%_4103)
                                                            (%_4086
                                                              (append
                                                                (%_3107 %_4103)
                                                                %_4100)
                                                              %_4096
                                                              %_4089
                                                              %_4090
                                                              (cons (list %_4097
                                                                          %_4098
                                                                          %_4101
                                                                          %_4103)
                                                                    %_4091)))
                                                          (%_3122 %_4095))
                                                         (error 'sc-expand-internal
                                                                '"unexpected module binding type")))))
                                                 (%_2822
                                                   ((lambda (%_4105)
                                                      (if (annotation? %_4105)
                                                        (annotation-expression
                                                          %_4105)
                                                        %_4105))
                                                    (if (%_2936 %_4092)
                                                      (%_2937 %_4092)
                                                      %_4092)))
                                                 (append %_4099 %_4093)))
                                              (%_3121 %_4095)
                                              (%_3120 %_4095)
                                              (%_3118 %_4095)))
                                           (lambda ()
                                             (%_4086
                                               %_4093
                                               %_4088
                                               %_4089
                                               %_4090
                                               %_4091)))))
                                     (cdr %_4087)
                                     (car %_4087))))))
                       %_4086)
                     %_4082
                     %_4084
                     '()
                     '()
                     '()))))
              (%_3107 %_4080))))
         (%_3127
           (lambda (%_4070 %_4071)
             (vector-set! %_4070 '5 %_4071)))
         (%_3126
           (lambda (%_4068 %_4069)
             (vector-set! %_4068 '4 %_4069)))
         (%_3125
           (lambda (%_4066 %_4067)
             (vector-set! %_4066 '3 %_4067)))
         (%_3124
           (lambda (%_4064 %_4065)
             (vector-set! %_4064 '2 %_4065)))
         (%_3123
           (lambda (%_4062 %_4063)
             (vector-set! %_4062 '1 %_4063)))
         (%_3122 (lambda (%_4061) (vector-ref %_4061 '5)))
         (%_3121 (lambda (%_4060) (vector-ref %_4060 '4)))
         (%_3120 (lambda (%_4059) (vector-ref %_4059 '3)))
         (%_3119 (lambda (%_4058) (vector-ref %_4058 '2)))
         (%_3118 (lambda (%_4057) (vector-ref %_4057 '1)))
         (%_3117
           (lambda (%_4056)
             (if (vector? %_4056)
               (if (= (vector-length %_4056) '6)
                 (eq? (vector-ref %_4056 '0) 'module-binding)
                 '#f)
               '#f)))
         (%_3116
           (lambda (%_4051 %_4052 %_4053 %_4054 %_4055)
             (vector
               'module-binding
               %_4051
               %_4052
               %_4053
               %_4054
               %_4055)))
         (%_3115
           (lambda (%_4048 %_4049)
             (%_3108
               (list->vector
                 (map (lambda (%_4050)
                        (%_3078 (if (pair? %_4050) (car %_4050) %_4050)))
                      %_4048))
               %_4049)))
         (%_3114
           (lambda (%_4046)
             (%_3108
               (list->vector
                 (map (lambda (%_4047)
                        (if (pair? %_4047) (car %_4047) %_4047))
                      %_4046))
               '#f)))
         (%_3113
           (lambda (%_4044 %_4045)
             (vector-set! %_4044 '2 %_4045)))
         (%_3112
           (lambda (%_4042 %_4043)
             (vector-set! %_4042 '1 %_4043)))
         (%_3111 (lambda (%_4041) (vector-ref %_4041 '2)))
         (%_3110 (lambda (%_4040) (vector-ref %_4040 '1)))
         (%_3109
           (lambda (%_4039)
             (if (vector? %_4039)
               (if (= (vector-length %_4039) '3)
                 (eq? (vector-ref %_4039 '0) 'interface)
                 '#f)
               '#f)))
         (%_3108
           (lambda (%_4037 %_4038)
             (vector 'interface %_4037 %_4038)))
         (%_3107
           (lambda (%_4033)
             ((letrec ((%_4034
                         (lambda (%_4035 %_4036)
                           (if (null? %_4035)
                             %_4036
                             (%_4034
                               (cdr %_4035)
                               (if (pair? (car %_4035))
                                 (%_4034 (car %_4035) %_4036)
                                 (cons (car %_4035) %_4036)))))))
                %_4034)
              %_4033
              '())))
         (%_3106
           (lambda (%_3963 %_3964 %_3965 %_3966 %_3967 %_3968)
             (call-with-values
               (lambda ()
                 (%_3104 %_3963 %_3964 %_3965 '#f %_3968))
               (lambda (%_3969 %_3970 %_3971 %_3972 %_3973)
                 (if (memv %_3969 '(begin-form))
                   ((lambda (%_4026)
                      (if %_4026
                        (apply (lambda (%_4032) (%_3155)) %_4026)
                        ((lambda (%_4027)
                           (if %_4027
                             (apply (lambda (%_4028 %_4029 %_4030)
                                      (%_3102
                                        (cons %_4029 %_4030)
                                        %_3964
                                        %_3972
                                        %_3973
                                        %_3966
                                        %_3967
                                        %_3968))
                                    %_4027)
                             (syntax-error %_3971)))
                         ($syntax-dispatch
                           (compile-in-annotation %_3971 value)
                           '(any any . each-any)))))
                    ($syntax-dispatch
                      (compile-in-annotation %_3971 value)
                      '(any)))
                   (if (memv %_3969 '(local-syntax-form))
                     (%_3154
                       %_3970
                       %_3971
                       %_3964
                       %_3972
                       %_3973
                       (lambda (%_4021 %_4022 %_4023 %_4024)
                         (%_3102
                           %_4021
                           %_4022
                           %_4023
                           %_4024
                           %_3966
                           %_3967
                           %_3968)))
                     (if (memv %_3969 '(eval-when-form))
                       ((lambda (%_4010)
                          (if %_4010
                            (apply (lambda (%_4011 %_4012 %_4013 %_4014)
                                     ((lambda (%_4016 %_4015)
                                        ((lambda (%_4018 %_4017)
                                           (if (if (null? %_4017)
                                                 (null? %_4018)
                                                 '#f)
                                             (%_3155)
                                             (%_3102
                                               %_4016
                                               %_3964
                                               %_3972
                                               %_3973
                                               %_4017
                                               %_4018
                                               %_3968)))
                                         (%_3137 %_4015 %_3967)
                                         (%_3137 %_4015 %_3966)))
                                      (cons %_4013 %_4014)
                                      (%_3103 %_4012 %_3972)))
                                   %_4010)
                            (syntax-error %_3971)))
                        ($syntax-dispatch
                          (compile-in-annotation %_3971 value)
                          '(any each-any any . each-any)))
                       (if (memv %_3969 '(define-syntax-form))
                         (%_3152
                           %_3971
                           %_3972
                           %_3973
                           (lambda (%_3998 %_3999 %_4000)
                             ((lambda (%_4001)
                                (begin
                                  ((lambda (%_4002)
                                     ((lambda (%_4003)
                                        ((lambda (%_4004)
                                           (if (memv %_4004
                                                     '(displaced-lexical))
                                             (%_2982 %_4001)
                                             (void)))
                                         (%_2964 %_4003)))
                                      (%_2985 %_4002 %_3964)))
                                   (%_3086 %_4001 '(())))
                                  (%_3140
                                    %_3966
                                    (lambda ()
                                      (list '$sc-put-cte
                                            (list 'quote
                                                  ((lambda (%_4005)
                                                     (if (%_3082
                                                           (%_3001
                                                             (%_2938 %_4001))
                                                           (%_3001 '((top))))
                                                       %_4005
                                                       ((lambda (%_4006)
                                                          (%_2935
                                                            %_4005
                                                            (%_3000
                                                              %_4006
                                                              (list (%_3041
                                                                      (vector
                                                                        %_4005)
                                                                      (vector
                                                                        %_4006)
                                                                      (vector
                                                                        (%_2822
                                                                          %_4005)))))))
                                                        (%_3001
                                                          (%_2938 %_4001)))))
                                                   ((lambda (%_4008)
                                                      (if (annotation? %_4008)
                                                        (annotation-expression
                                                          %_4008)
                                                        %_4008))
                                                    (if (%_2936 %_4001)
                                                      (%_2937 %_4001)
                                                      %_4001))))
                                            (%_3141
                                              %_3999
                                              (%_2981 %_3964)
                                              %_4000))))))
                              (%_3099 %_3998 %_4000))))
                         (if (memv %_3969 '(define-form))
                           (%_3151
                             %_3971
                             %_3972
                             %_3973
                             (lambda (%_3986 %_3987 %_3988)
                               ((lambda (%_3989)
                                  (begin
                                    ((lambda (%_3990)
                                       ((lambda (%_3991)
                                          ((lambda (%_3992)
                                             (if (memv %_3992
                                                       '(displaced-lexical))
                                               (%_2982 %_3989)
                                               (void)))
                                           (%_2964 %_3991)))
                                        (%_2985 %_3990 %_3964)))
                                     (%_3086 %_3989 '(())))
                                    ((lambda (%_3993)
                                       ((lambda (%_3994)
                                          (%_2921
                                            '#f
                                            (list (%_3140
                                                    %_3966
                                                    (lambda ()
                                                      (list '$sc-put-cte
                                                            (list 'quote
                                                                  (if (eq? %_3993
                                                                           %_3994)
                                                                    %_3993
                                                                    ((lambda (%_3995)
                                                                       (%_2935
                                                                         %_3993
                                                                         (%_3000
                                                                           %_3995
                                                                           (list (%_3041
                                                                                   (vector
                                                                                     %_3993)
                                                                                   (vector
                                                                                     %_3995)
                                                                                   (vector
                                                                                     %_3994))))))
                                                                     (%_3001
                                                                       (%_2938
                                                                         %_3989)))))
                                                            (list 'quote
                                                                  (%_2963
                                                                    'global
                                                                    %_3994)))))
                                                  (%_3139
                                                    %_3967
                                                    (lambda ()
                                                      (if %_3973
                                                        (list 'compile-in-annotation
                                                              (list 'define
                                                                    %_3994
                                                                    (%_3141
                                                                      %_3987
                                                                      %_3964
                                                                      %_3988))
                                                              %_3973)
                                                        (list 'define
                                                              %_3994
                                                              (%_3141
                                                                %_3987
                                                                %_3964
                                                                %_3988))))))))
                                        (if (%_3082
                                              (%_3001 (%_2938 %_3989))
                                              (%_3001 '((top))))
                                          %_3993
                                          (%_2822 %_3993))))
                                     ((lambda (%_3997)
                                        (if (annotation? %_3997)
                                          (annotation-expression %_3997)
                                          %_3997))
                                      (if (%_2936 %_3989)
                                        (%_2937 %_3989)
                                        %_3989)))))
                                (%_3099 %_3986 %_3988))))
                           (if (memv %_3969 '(module-form))
                             ((lambda (%_3979 %_3978)
                                (%_3149
                                  %_3971
                                  %_3972
                                  %_3973
                                  (%_3000
                                    (%_3001 %_3972)
                                    (cons %_3979 (%_3002 %_3972)))
                                  (lambda (%_3980 %_3981 %_3982)
                                    (if %_3980
                                      (begin
                                        ((lambda (%_3983)
                                           ((lambda (%_3984)
                                              ((lambda (%_3985)
                                                 (if (memv %_3985
                                                           '(displaced-lexical))
                                                   (%_2982
                                                     (%_3099 %_3980 %_3972))
                                                   (void)))
                                               (%_2964 %_3984)))
                                            (%_2985 %_3983 %_3978)))
                                         (%_3086 %_3980 '(())))
                                        (%_3128
                                          %_3971
                                          %_3978
                                          %_3979
                                          %_3972
                                          %_3973
                                          %_3966
                                          %_3967
                                          %_3980
                                          %_3981
                                          %_3982))
                                      (%_3128
                                        %_3971
                                        %_3978
                                        %_3979
                                        %_3972
                                        %_3973
                                        %_3966
                                        %_3967
                                        '#f
                                        %_3981
                                        %_3982)))))
                              (%_3041 '() '() '())
                              (cons '("top-level module placeholder"
                                      placeholder)
                                    %_3964))
                             (if (memv %_3969 '(import-form))
                               (%_3150
                                 %_3971
                                 %_3972
                                 %_3973
                                 (lambda (%_3975)
                                   (%_3140
                                     %_3966
                                     (lambda ()
                                       (begin
                                         (if %_3970
                                           (syntax-error
                                             (%_3100 %_3971 %_3972 %_3973)
                                             '"not valid at top-level")
                                           (void))
                                         ((lambda (%_3976)
                                            ((lambda (%_3977)
                                               (if (memv %_3977 '(module))
                                                 (%_3136
                                                   %_3975
                                                   (%_3111 (%_2965 %_3976)))
                                                 (if (memv %_3977
                                                           '(displaced-lexical))
                                                   (%_2982 %_3975)
                                                   (syntax-error
                                                     %_3975
                                                     '"import from unknown module"))))
                                             (%_2964 %_3976)))
                                          (%_2985
                                            (%_3086 %_3975 '(()))
                                            '())))))))
                               (%_3139
                                 %_3967
                                 (lambda ()
                                   (%_3142
                                     %_3969
                                     %_3970
                                     %_3971
                                     %_3964
                                     %_3972
                                     %_3973))))))))))))))
         (%_3105
           (lambda (%_3954 %_3955 %_3956 %_3957)
             (call-with-values
               (lambda ()
                 (%_3104 %_3954 %_3955 %_3956 '#f %_3957))
               (lambda (%_3958 %_3959 %_3960 %_3961 %_3962)
                 (%_3142
                   %_3958
                   %_3959
                   %_3960
                   %_3955
                   %_3961
                   %_3962)))))
         (%_3104
           (lambda (%_3938 %_3939 %_3940 %_3941 %_3942)
             (if (symbol? %_3938)
               ((lambda (%_3950)
                  ((lambda (%_3951)
                     ((lambda (%_3952)
                        (if (memv %_3952 '(lexical))
                          (values
                            %_3952
                            (%_2965 %_3951)
                            %_3938
                            %_3940
                            %_3941)
                          (if (memv %_3952 '(global))
                            (values
                              %_3952
                              (%_2965 %_3951)
                              %_3938
                              %_3940
                              %_3941)
                            (if (memv %_3952 '(macro macro!))
                              (%_3104
                                (%_3145
                                  (%_2965 %_3951)
                                  %_3938
                                  %_3939
                                  %_3940
                                  %_3941
                                  %_3942)
                                %_3939
                                '(())
                                '#f
                                %_3942)
                              (values
                                %_3952
                                (%_2965 %_3951)
                                %_3938
                                %_3940
                                %_3941)))))
                      (%_2964 %_3951)))
                   (%_2985 %_3950 %_3939)))
                (%_3086 %_3938 %_3940))
               (if (pair? %_3938)
                 ((lambda (%_3945)
                    (if (%_2993 %_3945)
                      ((lambda (%_3946)
                         ((lambda (%_3947)
                            ((lambda (%_3948)
                               (if (memv %_3948 '(lexical))
                                 (values
                                   'lexical-call
                                   (%_2965 %_3947)
                                   %_3938
                                   %_3940
                                   %_3941)
                                 (if (memv %_3948 '(macro macro!))
                                   (%_3104
                                     (%_3145
                                       (%_2965 %_3947)
                                       %_3938
                                       %_3939
                                       %_3940
                                       %_3941
                                       %_3942)
                                     %_3939
                                     '(())
                                     '#f
                                     %_3942)
                                   (if (memv %_3948 '(core))
                                     (values
                                       %_3948
                                       (%_2965 %_3947)
                                       %_3938
                                       %_3940
                                       %_3941)
                                     (if (memv %_3948 '(local-syntax))
                                       (values
                                         'local-syntax-form
                                         (%_2965 %_3947)
                                         %_3938
                                         %_3940
                                         %_3941)
                                       (if (memv %_3948 '(begin))
                                         (values
                                           'begin-form
                                           '#f
                                           %_3938
                                           %_3940
                                           %_3941)
                                         (if (memv %_3948 '(eval-when))
                                           (values
                                             'eval-when-form
                                             '#f
                                             %_3938
                                             %_3940
                                             %_3941)
                                           (if (memv %_3948 '(define))
                                             (values
                                               'define-form
                                               '#f
                                               %_3938
                                               %_3940
                                               %_3941)
                                             (if (memv %_3948 '(define-syntax))
                                               (values
                                                 'define-syntax-form
                                                 '#f
                                                 %_3938
                                                 %_3940
                                                 %_3941)
                                               (if (memv %_3948 '(module-key))
                                                 (values
                                                   'module-form
                                                   '#f
                                                   %_3938
                                                   %_3940
                                                   %_3941)
                                                 (if (memv %_3948 '(import))
                                                   (values
                                                     'import-form
                                                     (if (%_2965 %_3947)
                                                       (%_3099 %_3945 %_3940)
                                                       '#f)
                                                     %_3938
                                                     %_3940
                                                     %_3941)
                                                   (if (memv %_3948 '(set!))
                                                     (%_3144
                                                       %_3938
                                                       %_3939
                                                       %_3940
                                                       %_3941
                                                       %_3942)
                                                     (values
                                                       'call
                                                       '#f
                                                       %_3938
                                                       %_3940
                                                       %_3941)))))))))))))
                             (%_2964 %_3947)))
                          (%_2985 %_3946 %_3939)))
                       (%_3086 %_3945 %_3940))
                      (values 'call '#f %_3938 %_3940 %_3941)))
                  (car %_3938))
                 (if (%_2936 %_3938)
                   (%_3104
                     (%_2937 %_3938)
                     %_3939
                     (%_3080 %_3940 (%_2938 %_3938))
                     '#f
                     %_3942)
                   (if (annotation? %_3938)
                     (%_3104
                       (annotation-expression %_3938)
                       %_3939
                       %_3940
                       (annotation-source %_3938)
                       %_3942)
                     (if (not ((lambda (%_3944)
                                 (if %_3944 %_3944 (vector? %_3938)))
                               (pair? %_3938)))
                       (values 'constant '#f %_3938 %_3940 %_3941)
                       (values 'other '#f %_3938 %_3940 %_3941))))))))
         (%_3103
           (lambda (%_3935 %_3936)
             (map (lambda (%_3937)
                    (if (%_3088
                          %_3937
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
                      (if (%_3088
                            %_3937
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
                        (if (%_3088
                              %_3937
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
                          (if (%_3088
                                %_3937
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
                            (if (%_3088
                                  %_3937
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
                                (%_3099 %_3937 %_3936)
                                '"invalid eval-when situation")))))))
                  %_3935)))
         (%_3102
           (lambda (%_3921
                    %_3922
                    %_3923
                    %_3924
                    %_3925
                    %_3926
                    %_3927)
             (%_2921
               %_3924
               ((letrec ((%_3928
                           (lambda (%_3929 %_3930 %_3931 %_3932 %_3933)
                             (if (null? %_3929)
                               '()
                               ((lambda (%_3934)
                                  (cons %_3934
                                        (%_3928
                                          (cdr %_3929)
                                          %_3930
                                          %_3931
                                          %_3932
                                          %_3933)))
                                (%_3106
                                  (car %_3929)
                                  %_3930
                                  %_3931
                                  %_3932
                                  %_3933
                                  %_3927))))))
                  %_3928)
                %_3921
                %_3922
                %_3923
                %_3925
                %_3926))))
         (%_3101
           (lambda (%_3912 %_3913 %_3914 %_3915)
             (%_2921
               %_3915
               ((letrec ((%_3916
                           (lambda (%_3917 %_3918 %_3919)
                             (if (null? %_3917)
                               '()
                               ((lambda (%_3920)
                                  (cons %_3920
                                        (%_3916 (cdr %_3917) %_3918 %_3919)))
                                (%_3141 (car %_3917) %_3918 %_3919))))))
                  %_3916)
                %_3912
                %_3913
                %_3914))))
         (%_3100
           (lambda (%_3909 %_3910 %_3911)
             (%_3099
               (if %_3911
                 (make-annotation %_3909 %_3911 '#f)
                 %_3909)
               %_3910)))
         (%_3099
           (lambda (%_3907 %_3908)
             (if (if (null? (%_3001 %_3908))
                   (null? (%_3002 %_3908))
                   '#f)
               %_3907
               (if (%_2936 %_3907)
                 (%_2935
                   (%_2937 %_3907)
                   (%_3080 %_3908 (%_2938 %_3907)))
                 (if (null? %_3907) %_3907 (%_2935 %_3907 %_3908))))))
         (%_3098
           (lambda (%_3904 %_3905)
             (if (not (null? %_3905))
               ((lambda (%_3906)
                  (if %_3906 %_3906 (%_3098 %_3904 (cdr %_3905))))
                (%_3089 %_3904 (car %_3905)))
               '#f)))
         (%_3097
           (lambda (%_3898 %_3899 %_3900)
             ((letrec ((%_3901
                         (lambda (%_3902 %_3903)
                           (if (null? %_3902)
                             (syntax-error %_3899)
                             (if (%_2993 (car %_3902))
                               (if (%_3098 (car %_3902) %_3903)
                                 (syntax-error
                                   (car %_3902)
                                   '"duplicate "
                                   %_3900)
                                 (%_3901
                                   (cdr %_3902)
                                   (cons (car %_3902) %_3903)))
                               (syntax-error
                                 (car %_3902)
                                 '"invalid "
                                 %_3900))))))
                %_3901)
              %_3898
              '())))
         (%_3096
           (lambda (%_3894)
             ((letrec ((%_3895
                         (lambda (%_3896)
                           ((lambda (%_3897)
                              (if %_3897
                                %_3897
                                (if (not (%_3098 (car %_3896) (cdr %_3896)))
                                  (%_3895 (cdr %_3896))
                                  '#f)))
                            (null? %_3896)))))
                %_3895)
              %_3894)))
         (%_3090
           (lambda (%_3890)
             (if ((letrec ((%_3891
                             (lambda (%_3892)
                               ((lambda (%_3893)
                                  (if %_3893
                                    %_3893
                                    (if (%_2993 (car %_3892))
                                      (%_3891 (cdr %_3892))
                                      '#f)))
                                (null? %_3892)))))
                    %_3891)
                  %_3890)
               (%_3096 %_3890)
               '#f)))
         (%_3089
           (lambda (%_3884 %_3885)
             (if (if (%_2936 %_3884) (%_2936 %_3885) '#f)
               (if (eq? ((lambda (%_3888)
                           (if (annotation? %_3888)
                             (annotation-expression %_3888)
                             %_3888))
                         (%_2937 %_3884))
                        ((lambda (%_3889)
                           (if (annotation? %_3889)
                             (annotation-expression %_3889)
                             %_3889))
                         (%_2937 %_3885)))
                 (%_3082
                   (%_3001 (%_2938 %_3884))
                   (%_3001 (%_2938 %_3885)))
                 '#f)
               (eq? (if (annotation? %_3884)
                      (annotation-expression %_3884)
                      %_3884)
                    (if (annotation? %_3885)
                      (annotation-expression %_3885)
                      %_3885)))))
         (%_3088
           (lambda (%_3873 %_3874)
             (if (eq? ((lambda (%_3881)
                         (if (annotation? %_3881)
                           (annotation-expression %_3881)
                           %_3881))
                       (if (%_2936 %_3873) (%_2937 %_3873) %_3873))
                      ((lambda (%_3883)
                         (if (annotation? %_3883)
                           (annotation-expression %_3883)
                           %_3883))
                       (if (%_2936 %_3874) (%_2937 %_3874) %_3874)))
               ((lambda (%_3876 %_3875)
                  ((lambda (%_3877)
                     (if %_3877
                       %_3877
                       (if ((lambda (%_3879)
                              (if %_3879 %_3879 (symbol? %_3875)))
                            (not %_3875))
                         ((lambda (%_3878)
                            (if %_3878 %_3878 (symbol? %_3876)))
                          (not %_3876))
                         '#f)))
                   (eq? %_3875 %_3876)))
                (%_3086 %_3874 '(()))
                (%_3086 %_3873 '(())))
               '#f)))
         (%_3087
           (lambda (%_3867 %_3868)
             (if (eq? ((lambda (%_3870)
                         (if (annotation? %_3870)
                           (annotation-expression %_3870)
                           %_3870))
                       (if (%_2936 %_3867) (%_2937 %_3867) %_3867))
                      ((lambda (%_3872)
                         (if (annotation? %_3872)
                           (annotation-expression %_3872)
                           %_3872))
                       (if (%_2936 %_3868) (%_2937 %_3868) %_3868)))
               (eq? (%_3086 %_3867 '(())) (%_3086 %_3868 '(())))
               '#f)))
         (%_3086
           (lambda (%_3863 %_3864)
             (call-with-values
               (lambda () (%_3083 %_3863 %_3864))
               (lambda (%_3865 %_3866)
                 (if (%_3032 %_3865) (%_3036 %_3865) %_3865)))))
         (%_3085
           (lambda (%_3859 %_3860)
             (call-with-values
               (lambda () (%_3083 %_3859 %_3860))
               (lambda (%_3861 %_3862) %_3861))))
         (%_3084
           (lambda (%_3855 %_3856)
             (call-with-values
               (lambda () (%_3083 %_3855 %_3856))
               (lambda (%_3857 %_3858)
                 (values
                   (if (%_3032 %_3857) (%_3036 %_3857) %_3857)
                   %_3858)))))
         (%_3083
           (lambda (%_3820 %_3821)
             (letrec ((%_3824
                        (lambda (%_3847 %_3848 %_3849 %_3850 %_3851)
                          ((lambda (%_3852)
                             ((letrec ((%_3853
                                         (lambda (%_3854)
                                           (if (= %_3854 %_3852)
                                             (%_3822
                                               %_3847
                                               (cdr %_3848)
                                               %_3849)
                                             (if (if (eq? (vector-ref
                                                            %_3850
                                                            %_3854)
                                                          %_3847)
                                                   (%_3082
                                                     %_3849
                                                     (vector-ref
                                                       (%_3044 %_3851)
                                                       %_3854))
                                                   '#f)
                                               (values
                                                 (vector-ref
                                                   (%_3045 %_3851)
                                                   %_3854)
                                                 %_3849)
                                               (%_3853 (+ %_3854 '1)))))))
                                %_3853)
                              '0))
                           (vector-length %_3850))))
                      (%_3823
                        (lambda (%_3837 %_3838 %_3839 %_3840 %_3841)
                          ((letrec ((%_3842
                                      (lambda (%_3843 %_3844)
                                        (if (null? %_3843)
                                          (%_3822 %_3837 (cdr %_3838) %_3839)
                                          (if (if (eq? (car %_3843) %_3837)
                                                (%_3082
                                                  %_3839
                                                  (list-ref
                                                    (%_3044 %_3841)
                                                    %_3844))
                                                '#f)
                                            (values
                                              (list-ref (%_3045 %_3841) %_3844)
                                              %_3839)
                                            (if (%_3065 (car %_3843))
                                              ((lambda (%_3845)
                                                 (if %_3845
                                                   (if (symbol? %_3845)
                                                     (values %_3845 %_3839)
                                                     (%_3084 %_3845 '(())))
                                                   (%_3842
                                                     (cdr %_3843)
                                                     %_3844)))
                                               (%_3076
                                                 %_3837
                                                 (%_3066 (car %_3843))
                                                 %_3839))
                                              (if (if (eq? (car %_3843) %_3063)
                                                    (%_3082
                                                      %_3839
                                                      (list-ref
                                                        (%_3044 %_3841)
                                                        %_3844))
                                                    '#f)
                                                (values '#f %_3839)
                                                (%_3842
                                                  (cdr %_3843)
                                                  (+ %_3844 '1)))))))))
                             %_3842)
                           %_3840
                           '0)))
                      (%_3822
                        (lambda (%_3832 %_3833 %_3834)
                          (if (null? %_3833)
                            (values %_3832 %_3834)
                            ((lambda (%_3835)
                               (if (eq? %_3835 'shift)
                                 (%_3822 %_3832 (cdr %_3833) (cdr %_3834))
                                 ((lambda (%_3836)
                                    (if (vector? %_3836)
                                      (%_3824
                                        %_3832
                                        %_3833
                                        %_3834
                                        %_3836
                                        %_3835)
                                      (%_3823
                                        %_3832
                                        %_3833
                                        %_3834
                                        %_3836
                                        %_3835)))
                                  (%_3043 %_3835))))
                             (car %_3833))))))
               (if (symbol? %_3820)
                 (%_3822 %_3820 (%_3002 %_3821) (%_3001 %_3821))
                 (if (%_2936 %_3820)
                   ((lambda (%_3827 %_3826)
                      ((lambda (%_3828)
                         (call-with-values
                           (lambda ()
                             (%_3822 %_3826 (%_3002 %_3821) %_3828))
                           (lambda (%_3829 %_3830)
                             (if (eq? %_3829 %_3826)
                               (%_3822 %_3826 (%_3002 %_3827) %_3830)
                               (values %_3829 %_3830)))))
                       (%_3081 (%_3001 %_3821) (%_3001 %_3827))))
                    (%_2938 %_3820)
                    ((lambda (%_3831)
                       (if (annotation? %_3831)
                         (annotation-expression %_3831)
                         %_3831))
                     (%_2937 %_3820)))
                   (if (annotation? %_3820)
                     (%_3822
                       (if (annotation? %_3820)
                         (annotation-expression %_3820)
                         %_3820)
                       (%_3002 %_3821)
                       (%_3001 %_3821))
                     (%_2814 'id-var-name '"invalid id" %_3820)))))))
         (%_3082
           (lambda (%_3817 %_3818)
             ((lambda (%_3819)
                (if %_3819
                  %_3819
                  (if (not (null? %_3817))
                    (if (not (null? %_3818))
                      (if (eq? (car %_3817) (car %_3818))
                        (%_3082 (cdr %_3817) (cdr %_3818))
                        '#f)
                      '#f)
                    '#f)))
              (eq? %_3817 %_3818))))
         (%_3081
           (lambda (%_3815 %_3816) (%_3079 %_3815 %_3816)))
         (%_3080
           (lambda (%_3811 %_3812)
             ((lambda (%_3814 %_3813)
                (if (null? %_3813)
                  (if (null? %_3814)
                    %_3812
                    (%_3000
                      (%_3001 %_3812)
                      (%_3079 %_3814 (%_3002 %_3812))))
                  (%_3000
                    (%_3079 %_3813 (%_3001 %_3812))
                    (%_3079 %_3814 (%_3002 %_3812)))))
              (%_3002 %_3811)
              (%_3001 %_3811))))
         (%_3079
           (lambda (%_3809 %_3810)
             (if (null? %_3810) %_3809 (append %_3809 %_3810))))
         (%_3078
           (lambda (%_3803)
             (call-with-values
               (lambda () (%_3084 %_3803 '(())))
               (lambda (%_3804 %_3805)
                 (begin
                   (if (not %_3804)
                     (syntax-error
                       %_3803
                       '"identifier not visible for export")
                     (void))
                   ((lambda (%_3806)
                      (%_2935
                        %_3806
                        (%_3000
                          %_3805
                          (list (%_3041
                                  (vector %_3806)
                                  (vector %_3805)
                                  (vector %_3804))))))
                    ((lambda (%_3808)
                       (if (annotation? %_3808)
                         (annotation-expression %_3808)
                         %_3808))
                     (if (%_2936 %_3803) (%_2937 %_3803) %_3803))))))))
         (%_3077
           (lambda (%_3791 %_3792 %_3793)
             (if (null? %_3791)
               %_3793
               (%_3000
                 (%_3001 %_3793)
                 (cons ((lambda (%_3794)
                          ((lambda (%_3795)
                             ((lambda (%_3797 %_3796)
                                (begin
                                  ((letrec ((%_3798
                                              (lambda (%_3799 %_3800)
                                                (if (not (null? %_3799))
                                                  (call-with-values
                                                    (lambda ()
                                                      (%_2999
                                                        (car %_3799)
                                                        %_3793))
                                                    (lambda (%_3801 %_3802)
                                                      (begin
                                                        (vector-set!
                                                          %_3796
                                                          %_3800
                                                          %_3801)
                                                        (vector-set!
                                                          %_3797
                                                          %_3800
                                                          %_3802)
                                                        (%_3798
                                                          (cdr %_3799)
                                                          (+ %_3800 '1)))))
                                                  (void)))))
                                     %_3798)
                                   %_3791
                                   '0)
                                  (%_3041 %_3796 %_3797 %_3794)))
                              (make-vector %_3795)
                              (make-vector %_3795)))
                           (vector-length %_3794)))
                        (list->vector %_3792))
                       (%_3002 %_3793))))))
         (%_3076
           (lambda (%_3784 %_3785 %_3786)
             ((lambda (%_3787)
                (if %_3787
                  ((letrec ((%_3788
                              (lambda (%_3789)
                                (if (pair? %_3789)
                                  ((lambda (%_3790)
                                     (if %_3790 %_3790 (%_3788 (cdr %_3789))))
                                   (%_3788 (car %_3789)))
                                  (if (symbol? %_3789)
                                    (if (%_3082 %_3786 (%_3001 '((top))))
                                      %_3789
                                      '#f)
                                    (if (%_3082
                                          %_3786
                                          (%_3001 (%_2938 %_3789)))
                                      %_3789
                                      '#f))))))
                     %_3788)
                   %_3787)
                  '#f))
              (%_2821 %_3784 %_3785))))
         (%_3075
           (lambda (%_3782 %_3783)
             (%_3046
               %_3782
               (cons (%_3064 %_3783) (%_3043 %_3782)))))
         (%_3074
           (lambda (%_3780 %_3781)
             (begin
               (%_3046 %_3780 (cons %_3063 (%_3043 %_3780)))
               (%_3047
                 %_3780
                 (cons (%_3001 %_3781) (%_3044 %_3780))))))
         (%_3073
           (lambda (%_3778 %_3779)
             (%_3074 %_3778 (%_2938 %_3779))))
         (%_3072
           (lambda (%_3774 %_3775 %_3776)
             (begin
               (%_3046
                 %_3774
                 (cons ((lambda (%_3777)
                          (if (annotation? %_3777)
                            (annotation-expression %_3777)
                            %_3777))
                        (%_2937 %_3775))
                       (%_3043 %_3774)))
               (%_3047
                 %_3774
                 (cons (%_3001 (%_2938 %_3775)) (%_3044 %_3774)))
               (%_3048 %_3774 (cons %_3776 (%_3045 %_3774))))))
         (%_3067
           (lambda (%_3772 %_3773)
             (vector-set! %_3772 '1 %_3773)))
         (%_3066 (lambda (%_3771) (vector-ref %_3771 '1)))
         (%_3065
           (lambda (%_3770)
             (if (vector? %_3770)
               (if (= (vector-length %_3770) '2)
                 (eq? (vector-ref %_3770 '0) 'import-token)
                 '#f)
               '#f)))
         (%_3064
           (lambda (%_3769) (vector 'import-token %_3769)))
         (%_3063 '#f)
         (%_3058
           (lambda (%_3768)
             (%_3000
               (cons '#f (%_3001 %_3768))
               (cons 'shift (%_3002 %_3768)))))
         (%_3048
           (lambda (%_3766 %_3767)
             (vector-set! %_3766 '3 %_3767)))
         (%_3047
           (lambda (%_3764 %_3765)
             (vector-set! %_3764 '2 %_3765)))
         (%_3046
           (lambda (%_3762 %_3763)
             (vector-set! %_3762 '1 %_3763)))
         (%_3045 (lambda (%_3761) (vector-ref %_3761 '3)))
         (%_3044 (lambda (%_3760) (vector-ref %_3760 '2)))
         (%_3043 (lambda (%_3759) (vector-ref %_3759 '1)))
         (%_3042
           (lambda (%_3758)
             (if (vector? %_3758)
               (if (= (vector-length %_3758) '4)
                 (eq? (vector-ref %_3758 '0) 'ribcage)
                 '#f)
               '#f)))
         (%_3041
           (lambda (%_3755 %_3756 %_3757)
             (vector 'ribcage %_3755 %_3756 %_3757)))
         (%_3040
           (lambda (%_3754)
             (if (null? %_3754)
               '()
               (cons (%_3038) (%_3040 (cdr %_3754))))))
         (%_3039
           (lambda (%_3751)
             ((lambda (%_3752)
                (if %_3752
                  %_3752
                  ((lambda (%_3753)
                     (if %_3753 %_3753 (%_3032 %_3751)))
                   (symbol? %_3751))))
              (string? %_3751))))
         (%_3038 (lambda () (string '#\i)))
         (%_3031
           (lambda (%_3750) (vector 'indirect-label %_3750)))
         (%_3032
           (lambda (%_3749)
             (if (vector? %_3749)
               (if (= (vector-length %_3749) '2)
                 (eq? (vector-ref %_3749 '0) 'indirect-label)
                 '#f)
               '#f)))
         (%_3033 (lambda (%_3748) (vector-ref %_3748 '1)))
         (%_3034
           (lambda (%_3746 %_3747)
             (vector-set! %_3746 '1 %_3747)))
         (%_3035 (lambda () (%_3031 (%_3038))))
         (%_3036 (lambda (%_3745) (%_3033 %_3745)))
         (%_3037
           (lambda (%_3743 %_3744) (%_3034 %_3743 %_3744)))
         (%_3002 cdr)
         (%_3001 car)
         (%_3000 cons)
         (%_2999
           (lambda (%_3739 %_3740)
             (if (%_2936 %_3739)
               (values
                 ((lambda (%_3742)
                    (if (annotation? %_3742)
                      (annotation-expression %_3742)
                      %_3742))
                  (%_2937 %_3739))
                 (%_3081 (%_3001 %_3740) (%_3001 (%_2938 %_3739))))
               (values
                 (if (annotation? %_3739)
                   (annotation-expression %_3739)
                   %_3739)
                 (%_3001 %_3740)))))
         (%_2993
           (lambda (%_3737)
             (if (symbol? %_3737)
               '#t
               (if (%_2936 %_3737)
                 (symbol?
                   ((lambda (%_3738)
                      (if (annotation? %_3738)
                        (annotation-expression %_3738)
                        %_3738))
                    (%_2937 %_3737)))
                 (if (annotation? %_3737)
                   (symbol? (annotation-expression %_3737))
                   '#f)))))
         (%_2987
           (lambda (%_3735)
             (if (%_2936 %_3735)
               (symbol?
                 ((lambda (%_3736)
                    (if (annotation? %_3736)
                      (annotation-expression %_3736)
                      %_3736))
                  (%_2937 %_3735)))
               '#f)))
         (%_2986
           (lambda (%_3732 %_3733 %_3734)
             (%_2819 %_3733 (%_2963 %_3732 %_3734))))
         (%_2985
           (lambda (%_3722 %_3723)
             (letrec ((%_3724
                        (lambda (%_3730 %_3731)
                          (begin
                            (%_2966 %_3730 (%_2964 %_3731))
                            (%_2967 %_3730 (%_2965 %_3731))))))
               ((lambda (%_3725)
                  ((lambda (%_3726)
                     (if (memv %_3726 '(deferred))
                       (begin
                         (%_3724
                           %_3725
                           ((lambda (%_3727)
                              ((lambda (%_3728)
                                 (if %_3728
                                   %_3728
                                   (syntax-error
                                     %_3727
                                     '"invalid transformer")))
                               (%_2984 %_3727)))
                            (%_2813 (%_2965 %_3725))))
                         ((lambda (%_3729) %_3725) (%_2964 %_3725)))
                       %_3725))
                   (%_2964 %_3725)))
                (%_2983 %_3722 %_3723)))))
         (%_2984
           (lambda (%_3720)
             (if (procedure? %_3720)
               (%_2963 'macro %_3720)
               (if (%_2968 %_3720)
                 ((lambda (%_3721)
                    (if (memv %_3721 '(core macro macro!))
                      (if (procedure? (%_2965 %_3720)) %_3720 '#f)
                      (if (memv %_3721 '(module))
                        (if (%_3109 (%_2965 %_3720)) %_3720 '#f)
                        %_3720)))
                  (%_2964 %_3720))
                 '#f))))
         (%_2983
           (lambda (%_3716 %_3717)
             ((lambda (%_3718)
                (if %_3718
                  (cdr %_3718)
                  (if (symbol? %_3716)
                    ((lambda (%_3719)
                       (if %_3719 %_3719 (%_2963 'global %_3716)))
                     (%_2820 %_3716))
                    (%_2963 'displaced-lexical '#f))))
              (assq %_3716 %_3717))))
         (%_2982
           (lambda (%_3715)
             (syntax-error
               %_3715
               (if (%_3086 %_3715 '(()))
                 '"identifier out of context"
                 '"identifier not visible"))))
         (%_2981
           (lambda (%_3713)
             (if (null? %_3713)
               '()
               ((lambda (%_3714)
                  (if (eq? (cadr %_3714) 'lexical)
                    (%_2981 (cdr %_3713))
                    (cons %_3714 (%_2981 (cdr %_3713)))))
                (car %_3713)))))
         (%_2980
           (lambda (%_3710 %_3711 %_3712)
             (if (null? %_3710)
               %_3712
               (%_2980
                 (cdr %_3710)
                 (cdr %_3711)
                 (%_2978
                   (car %_3710)
                   (%_2963 'lexical (car %_3711))
                   %_3712)))))
         (%_2979
           (lambda (%_3707 %_3708 %_3709)
             (if (null? %_3707)
               %_3709
               (%_2979
                 (cdr %_3707)
                 (cdr %_3708)
                 (%_2978 (car %_3707) (car %_3708) %_3709)))))
         (%_2978
           (lambda (%_3704 %_3705 %_3706)
             (cons (cons %_3704 %_3705) %_3706)))
         (%_2968
           (lambda (%_3703)
             (if (pair? %_3703) (symbol? (car %_3703)) '#f)))
         (%_2967 set-cdr!)
         (%_2966 set-car!)
         (%_2965 cdr)
         (%_2964 car)
         (%_2963
           (lambda (%_3701 %_3702) (cons %_3701 %_3702)))
         (%_2955
           (lambda (%_3700)
             (if (annotation? %_3700)
               (annotation-source %_3700)
               (if (%_2936 %_3700) (%_2955 (%_2937 %_3700)) '#f))))
         (%_2940
           (lambda (%_3698 %_3699)
             (vector-set! %_3698 '2 %_3699)))
         (%_2939
           (lambda (%_3696 %_3697)
             (vector-set! %_3696 '1 %_3697)))
         (%_2938 (lambda (%_3695) (vector-ref %_3695 '2)))
         (%_2937 (lambda (%_3694) (vector-ref %_3694 '1)))
         (%_2936
           (lambda (%_3693)
             (if (vector? %_3693)
               (if (= (vector-length %_3693) '3)
                 (eq? (vector-ref %_3693 '0) 'syntax-object)
                 '#f)
               '#f)))
         (%_2935
           (lambda (%_3691 %_3692)
             (vector 'syntax-object %_3691 %_3692)))
         (%_2923
           (lambda (%_3687 %_3688 %_3689 %_3690)
             (%_2922 %_3687 %_3688 %_3689 %_3690)))
         (%_2922
           (lambda (%_3683 %_3684 %_3685 %_3686)
             (if (null? %_3684)
               (if %_3683
                 (list 'compile-in-annotation %_3686 %_3683)
                 %_3686)
               (if %_3683
                 (list 'compile-in-annotation
                       (list 'letrec (map list %_3684 %_3685) %_3686)
                       %_3683)
                 (list 'letrec (map list %_3684 %_3685) %_3686)))))
         (%_2921
           (lambda (%_3681 %_3682)
             (if (null? %_3682)
               '(if '#f '#f)
               (if (equal? '(void) (car %_3682))
                 (%_2921 %_3681 (cdr %_3682))
                 (if (null? (cdr %_3682))
                   (if %_3681
                     (list 'compile-in-annotation (car %_3682) %_3681)
                     (car %_3682))
                   (if %_3681
                     (list 'compile-in-annotation
                           (cons 'begin %_3682)
                           %_3681)
                     (cons 'begin %_3682)))))))
         (%_2822
           ((lambda (%_3668)
              (letrec ((%_3671
                         (lambda (%_3675)
                           ((letrec ((%_3676
                                       (lambda (%_3677 %_3678)
                                         (if (< %_3677 %_3668)
                                           (list->string
                                             (cons (%_3670 %_3677) %_3678))
                                           ((lambda (%_3680 %_3679)
                                              (%_3676
                                                %_3680
                                                (cons (%_3670 %_3679) %_3678)))
                                            (quotient %_3677 %_3668)
                                            (modulo %_3677 %_3668))))))
                              %_3676)
                            %_3675
                            '())))
                       (%_3670
                         (lambda (%_3674)
                           (string-ref
                             '"0123456789abcdefghijklmnopqrstuvwxyz"
                             %_3674))))
                ((lambda (%_3672)
                   (lambda (%_3673)
                     (begin
                       (set! %_3672 (+ %_3672 '1))
                       (string->symbol
                         (string-append
                           (symbol->string %_3673)
                           '"_"
                           (%_3671 %_3672))))))
                 '-1)))
            (string-length
              '"0123456789abcdefghijklmnopqrstuvwxyz")))
         (%_2821
           (lambda (%_3665 %_3666) (getprop %_3665 %_3666)))
         (%_2820
           (lambda (%_3664) (getprop %_3664 '*sc-expander*)))
         (%_2819
           (lambda (%_3662 %_3663)
             ($sc-put-cte %_3662 %_3663)))
         (%_2814
           (lambda (%_3659 %_3660 %_3661)
             (error %_3659 '"~a ~s" %_3660 %_3661)))
         (%_2813
           (lambda (%_3658) (eval (list %_2748 %_3658))))
         (%_2812
           (lambda (%_3657) (eval (list %_2748 %_3657))))
         (%_2748 '"noexpand"))
  (begin
    (set! $sc-put-cte
      (lambda (%_3162 %_3163)
        (letrec ((%_3166
                   (lambda (%_3191 %_3192)
                     (begin
                       (%_3164 %_3191 '*top*)
                       ((lambda (%_3193)
                          (putprop %_3193 '*sc-expander* %_3192))
                        (if (symbol? %_3191)
                          %_3191
                          (%_3086 %_3191 '(())))))))
                 (%_3165
                   (lambda (%_3188 %_3189)
                     (%_3135
                       (lambda (%_3190) (%_3164 %_3190 %_3189))
                       %_3188)))
                 (%_3164
                   (lambda (%_3175 %_3176)
                     (letrec ((%_3178
                                (lambda (%_3185 %_3186)
                                  (if (pair? %_3186)
                                    (if (%_3089 (car %_3186) %_3185)
                                      (%_3178 %_3185 (cdr %_3186))
                                      (%_3177
                                        (car %_3186)
                                        (%_3178 %_3185 (cdr %_3186))))
                                    (if ((lambda (%_3187)
                                           (if %_3187
                                             %_3187
                                             (%_3089 %_3186 %_3185)))
                                         (not %_3186))
                                      '#f
                                      %_3186))))
                              (%_3177
                                (lambda (%_3183 %_3184)
                                  (if (not %_3184)
                                    %_3183
                                    (cons %_3183 %_3184)))))
                       ((lambda (%_3179)
                          ((lambda (%_3180)
                             (if (if (not %_3180) (symbol? %_3175) '#f)
                               (remprop %_3179 %_3176)
                               (putprop %_3179 %_3176 (%_3177 %_3175 %_3180))))
                           (%_3178 %_3175 (getprop %_3179 %_3176))))
                        ((lambda (%_3182)
                           (if (annotation? %_3182)
                             (annotation-expression %_3182)
                             %_3182))
                         (if (%_2936 %_3175) (%_2937 %_3175) %_3175)))))))
          ((lambda (%_3167)
             ((lambda (%_3168)
                (if (memv %_3168 '(module))
                  (begin
                    ((lambda (%_3173)
                       (%_3165 (%_3110 %_3173) (%_3111 %_3173)))
                     (%_2965 %_3167))
                    (%_3166 %_3162 %_3167))
                  (if (memv %_3168 '(do-import))
                    ((lambda (%_3169)
                       ((lambda (%_3170)
                          ((lambda (%_3171)
                             (if (memv %_3171 '(module))
                               ((lambda (%_3172)
                                  (begin
                                    (if (not (eq? (%_3111 %_3172) %_3169))
                                      (syntax-error
                                        %_3162
                                        '"import mismatch for module")
                                      (void))
                                    (%_3165 (%_3110 %_3172) '*top*)))
                                (%_2965 %_3170))
                               (syntax-error
                                 %_3162
                                 '"import from unknown module")))
                           (%_2964 %_3170)))
                        (%_2985 (%_3086 %_3162 '(())) '())))
                     (%_2965 %_3163))
                    (%_3166 %_3162 %_3167))))
              (%_2964 %_3167)))
           ((lambda (%_3174)
              (if %_3174
                %_3174
                (error 'define-syntax
                       '"invalid transformer ~s"
                       %_3163)))
            (%_2984 %_3163))))))
    (%_2986 'local-syntax 'letrec-syntax '#t)
    (%_2986 'local-syntax 'let-syntax '#f)
    (%_2986
      'core
      'fluid-let-syntax
      (lambda (%_3194 %_3195 %_3196 %_3197)
        ((lambda (%_3199)
           (if (if %_3199
                 (apply (lambda (%_3217 %_3218 %_3219 %_3220 %_3221)
                          (%_3090 %_3218))
                        %_3199)
                 '#f)
             (apply (lambda (%_3201 %_3202 %_3203 %_3204 %_3205)
                      ((lambda (%_3206)
                         (begin
                           (for-each
                             (lambda (%_3207 %_3208)
                               ((lambda (%_3209)
                                  (if (memv %_3209 '(displaced-lexical))
                                    (%_2982 (%_3099 %_3207 %_3196))
                                    (void)))
                                (%_2964 (%_2985 %_3208 %_3195))))
                             %_3202
                             %_3206)
                           (%_3146
                             (cons %_3204 %_3205)
                             (%_3100 %_3194 %_3196 %_3197)
                             (%_2979
                               %_3206
                               ((lambda (%_3212)
                                  (map (lambda (%_3213)
                                         (%_2963
                                           'deferred
                                           (%_3141 %_3213 %_3212 %_3196)))
                                       %_3203))
                                (%_2981 %_3195))
                               %_3195)
                             %_3196)))
                       (map (lambda (%_3215) (%_3086 %_3215 %_3196))
                            %_3202)))
                    %_3199)
             (syntax-error (%_3100 %_3194 %_3196 %_3197))))
         ($syntax-dispatch
           (compile-in-annotation %_3194 value)
           '(any #2(each (any any)) any . each-any)))))
    (%_2986
      'core
      'quote
      (lambda (%_3223 %_3224 %_3225 %_3226)
        ((lambda (%_3228)
           (if %_3228
             (apply (lambda (%_3230 %_3231)
                      (if %_3226
                        (list 'compile-in-annotation
                              (list 'quote (%_3159 %_3231 %_3225))
                              %_3226)
                        (list 'quote (%_3159 %_3231 %_3225))))
                    %_3228)
             (syntax-error (%_3100 %_3223 %_3225 %_3226))))
         ($syntax-dispatch
           (compile-in-annotation %_3223 value)
           '(any any)))))
    (%_2986
      'core
      'syntax
      (letrec ((%_3239
                 (lambda (%_3342)
                   ((lambda (%_3343)
                      (if (memv %_3343 '(ref))
                        (cadr %_3342)
                        (if (memv %_3343 '(primitive))
                          (cadr %_3342)
                          (if (memv %_3343 '(quote))
                            (list 'quote (cadr %_3342))
                            (if (memv %_3343 '(lambda))
                              (list 'lambda
                                    (cadr %_3342)
                                    (%_3239 (caddr %_3342)))
                              (if (memv %_3343 '(map))
                                ((lambda (%_3344)
                                   (cons (if (= (length %_3344) '2) 'map 'map)
                                         %_3344))
                                 (map %_3239 (cdr %_3342)))
                                (cons (car %_3342)
                                      (map %_3239 (cdr %_3342)))))))))
                    (car %_3342))))
               (%_3238
                 (lambda (%_3339 %_3340 %_3341)
                   (if (eq? (car %_3341) 'quote)
                     (if (eq? (cadr %_3341) %_3340)
                       (list 'quote %_3339)
                       (list 'quote (list->vector (cadr %_3341))))
                     (if (eq? (car %_3341) 'list)
                       (cons 'vector (cdr %_3341))
                       (list 'list->vector %_3341)))))
               (%_3237
                 (lambda (%_3331 %_3332 %_3333 %_3334 %_3335)
                   ((lambda (%_3336)
                      (if (memv %_3336 '(quote))
                        (if (eq? (car %_3334) 'quote)
                          ((lambda (%_3338 %_3337)
                             (if (if (eq? %_3337 %_3332)
                                   (eq? %_3338 %_3333)
                                   '#f)
                               (list 'quote %_3331)
                               (list 'quote (cons %_3337 %_3338))))
                           (cadr %_3335)
                           (cadr %_3334))
                          (if (eq? (cadr %_3335) '())
                            (list 'list %_3334)
                            (list 'cons %_3334 %_3335)))
                        (if (memv %_3336 '(list))
                          (cons 'list (cons %_3334 (cdr %_3335)))
                          (list 'cons %_3334 %_3335))))
                    (car %_3335))))
               (%_3236
                 (lambda (%_3323 %_3324)
                   ((lambda (%_3326 %_3325)
                      (if (eq? (car %_3323) 'ref)
                        (car %_3326)
                        (if (andmap
                              (lambda (%_3329)
                                (if (eq? (car %_3329) 'ref)
                                  (memq (cadr %_3329) %_3325)
                                  '#f))
                              (cdr %_3323))
                          (cons 'map
                                (cons (list 'primitive (car %_3323))
                                      (map ((lambda (%_3327)
                                              (lambda (%_3328)
                                                (cdr (assq (cadr %_3328)
                                                           %_3327))))
                                            (map cons %_3325 %_3326))
                                           (cdr %_3323))))
                          (cons 'map
                                (cons (list 'lambda %_3325 %_3323) %_3326)))))
                    (map (lambda (%_3330) (list 'ref (car %_3330)))
                         %_3324)
                    (map cdr %_3324))))
               (%_3235
                 (lambda (%_3321 %_3322)
                   (list 'apply
                         '(primitive append)
                         (%_3236 %_3321 %_3322))))
               (%_3234
                 (lambda (%_3319 %_3320)
                   (if (equal? %_3320 ''())
                     %_3319
                     (list 'append %_3319 %_3320))))
               (%_3233
                 (lambda (%_3311 %_3312 %_3313 %_3314)
                   (if (= %_3313 '0)
                     (values %_3312 %_3314)
                     (if (null? %_3314)
                       (syntax-error
                         %_3311
                         '"missing ellipsis in syntax form")
                       (call-with-values
                         (lambda ()
                           (%_3233 %_3311 %_3312 (- %_3313 '1) (cdr %_3314)))
                         (lambda (%_3315 %_3316)
                           ((lambda (%_3317)
                              (if %_3317
                                (values (cdr %_3317) %_3314)
                                ((lambda (%_3318)
                                   (values
                                     %_3318
                                     (cons (cons (cons %_3315 %_3318)
                                                 (car %_3314))
                                           %_3316)))
                                 (%_3160 'tmp))))
                            (assq %_3315 (car %_3314)))))))))
               (%_3232
                 (lambda (%_3252 %_3253 %_3254 %_3255 %_3256)
                   (if (%_2993 %_3253)
                     ((lambda (%_3306)
                        ((lambda (%_3307)
                           (if (eq? (%_2964 %_3307) 'syntax)
                             (call-with-values
                               (lambda ()
                                 ((lambda (%_3308)
                                    (%_3233
                                      %_3252
                                      (car %_3308)
                                      (cdr %_3308)
                                      %_3255))
                                  (%_2965 %_3307)))
                               (lambda (%_3309 %_3310)
                                 (values (list 'ref %_3309) %_3310)))
                             (if (%_3256 %_3253)
                               (syntax-error
                                 %_3252
                                 '"misplaced ellipsis in syntax form")
                               (values (list 'quote %_3253) %_3255))))
                         (%_2985 %_3306 %_3254)))
                      (%_3086 %_3253 '(())))
                     ((lambda (%_3258)
                        (if (if %_3258
                              (apply (lambda (%_3304 %_3305) (%_3256 %_3304))
                                     %_3258)
                              '#f)
                          (apply (lambda (%_3301 %_3302)
                                   (%_3232
                                     %_3252
                                     %_3302
                                     %_3254
                                     %_3255
                                     (lambda (%_3303) '#f)))
                                 %_3258)
                          ((lambda (%_3259)
                             (if (if %_3259
                                   (apply (lambda (%_3298 %_3299 %_3300)
                                            (%_3256 %_3299))
                                          %_3259)
                                   '#f)
                               (apply (lambda (%_3275 %_3276 %_3277)
                                        ((letrec ((%_3278
                                                    (lambda (%_3279 %_3280)
                                                      ((lambda (%_3282)
                                                         (if (if %_3282
                                                               (apply (lambda (%_3293
                                                                               %_3294)
                                                                        (%_3256
                                                                          %_3293))
                                                                      %_3282)
                                                               '#f)
                                                           (apply (lambda (%_3288
                                                                           %_3289)
                                                                    (%_3278
                                                                      %_3289
                                                                      (lambda (%_3290)
                                                                        (call-with-values
                                                                          (lambda ()
                                                                            (%_3280
                                                                              (cons '()
                                                                                    %_3290)))
                                                                          (lambda (%_3291
                                                                                   %_3292)
                                                                            (if (null? (car %_3292))
                                                                              (syntax-error
                                                                                %_3252
                                                                                '"extra ellipsis in syntax form")
                                                                              (values
                                                                                (%_3235
                                                                                  %_3291
                                                                                  (car %_3292))
                                                                                (cdr %_3292))))))))
                                                                  %_3282)
                                                           (call-with-values
                                                             (lambda ()
                                                               (%_3232
                                                                 %_3252
                                                                 %_3279
                                                                 %_3254
                                                                 %_3255
                                                                 %_3256))
                                                             (lambda (%_3284
                                                                      %_3285)
                                                               (call-with-values
                                                                 (lambda ()
                                                                   (%_3280
                                                                     %_3285))
                                                                 (lambda (%_3286
                                                                          %_3287)
                                                                   (values
                                                                     (%_3234
                                                                       %_3286
                                                                       %_3284)
                                                                     %_3287)))))))
                                                       ($syntax-dispatch
                                                         (compile-in-annotation
                                                           %_3279
                                                           value)
                                                         '(any . any))))))
                                           %_3278)
                                         %_3277
                                         (lambda (%_3295)
                                           (call-with-values
                                             (lambda ()
                                               (%_3232
                                                 %_3252
                                                 %_3275
                                                 %_3254
                                                 (cons '() %_3295)
                                                 %_3256))
                                             (lambda (%_3296 %_3297)
                                               (if (null? (car %_3297))
                                                 (syntax-error
                                                   %_3252
                                                   '"extra ellipsis in syntax form")
                                                 (values
                                                   (%_3236 %_3296 (car %_3297))
                                                   (cdr %_3297))))))))
                                      %_3259)
                               ((lambda (%_3260)
                                  (if %_3260
                                    (apply (lambda (%_3269 %_3270)
                                             (call-with-values
                                               (lambda ()
                                                 (%_3232
                                                   %_3252
                                                   %_3269
                                                   %_3254
                                                   %_3255
                                                   %_3256))
                                               (lambda (%_3271 %_3272)
                                                 (call-with-values
                                                   (lambda ()
                                                     (%_3232
                                                       %_3252
                                                       %_3270
                                                       %_3254
                                                       %_3272
                                                       %_3256))
                                                   (lambda (%_3273 %_3274)
                                                     (values
                                                       (%_3237
                                                         %_3253
                                                         %_3269
                                                         %_3270
                                                         %_3271
                                                         %_3273)
                                                       %_3274))))))
                                           %_3260)
                                    ((lambda (%_3261)
                                       (if %_3261
                                         (apply (lambda (%_3263 %_3264)
                                                  ((lambda (%_3265)
                                                     (call-with-values
                                                       (lambda ()
                                                         (%_3232
                                                           %_3252
                                                           %_3265
                                                           %_3254
                                                           %_3255
                                                           %_3256))
                                                       (lambda (%_3266 %_3267)
                                                         (values
                                                           (%_3238
                                                             %_3253
                                                             %_3265
                                                             %_3266)
                                                           %_3267))))
                                                   (cons %_3263 %_3264)))
                                                %_3261)
                                         (values (list 'quote %_3253) %_3255)))
                                     ($syntax-dispatch
                                       (compile-in-annotation %_3253 value)
                                       '#2(vector (any . each-any))))))
                                ($syntax-dispatch
                                  (compile-in-annotation %_3253 value)
                                  '(any . any)))))
                           ($syntax-dispatch
                             (compile-in-annotation %_3253 value)
                             '(any any . any)))))
                      ($syntax-dispatch
                        (compile-in-annotation %_3253 value)
                        '(any any)))))))
        (lambda (%_3240 %_3241 %_3242 %_3243)
          ((lambda (%_3244)
             ((lambda (%_3246)
                (if %_3246
                  (apply (lambda (%_3248 %_3249)
                           (call-with-values
                             (lambda ()
                               (%_3232 %_3244 %_3249 %_3241 '() %_3156))
                             (lambda (%_3250 %_3251) (%_3239 %_3250))))
                         %_3246)
                  (syntax-error %_3244)))
              ($syntax-dispatch
                (compile-in-annotation %_3244 value)
                '(any any))))
           (%_3100 %_3240 %_3242 %_3243)))))
    (%_2986
      'core
      'lambda
      (lambda (%_3345 %_3346 %_3347 %_3348)
        ((lambda (%_3350)
           (if %_3350
             (apply (lambda (%_3351 %_3352)
                      (%_3153
                        (%_3100 %_3345 %_3347 %_3348)
                        %_3352
                        %_3346
                        %_3347
                        (lambda (%_3353 %_3354)
                          (if %_3348
                            (list 'compile-in-annotation
                                  (list 'lambda %_3353 %_3354)
                                  %_3348)
                            (list 'lambda %_3353 %_3354)))))
                    %_3350)
             (syntax-error %_3345)))
         ($syntax-dispatch
           (compile-in-annotation %_3345 value)
           '(any . any)))))
    (%_2986
      'core
      'letrec
      (lambda (%_3355 %_3356 %_3357 %_3358)
        ((lambda (%_3360)
           (if %_3360
             (apply (lambda (%_3362 %_3363 %_3364 %_3365 %_3366)
                      (if (not (%_3090 %_3363))
                        (%_3097
                          (map (lambda (%_3375) (%_3099 %_3375 %_3357))
                               %_3363)
                          (%_3100 %_3355 %_3357 %_3358)
                          '"bound variable")
                        ((lambda (%_3369 %_3368)
                           ((lambda (%_3371 %_3370)
                              (%_2922
                                %_3358
                                %_3369
                                (map (lambda (%_3372)
                                       (%_3141 %_3372 %_3371 %_3370))
                                     %_3364)
                                (%_3146
                                  (cons %_3365 %_3366)
                                  (%_3100 %_3355 %_3370 %_3358)
                                  %_3371
                                  %_3370)))
                            (%_2980 %_3368 %_3369 %_3356)
                            (%_3077 %_3363 %_3368 %_3357)))
                         (map %_3160 %_3363)
                         (%_3040 %_3363))))
                    %_3360)
             (syntax-error (%_3100 %_3355 %_3357 %_3358))))
         ($syntax-dispatch
           (compile-in-annotation %_3355 value)
           '(any #2(each (any any)) any . each-any)))))
    (%_2986
      'core
      'if
      (lambda (%_3377 %_3378 %_3379 %_3380)
        ((lambda (%_3382)
           (if %_3382
             (apply (lambda (%_3389 %_3390 %_3391)
                      (if %_3380
                        (list 'compile-in-annotation
                              (list 'if
                                    (%_3141 %_3390 %_3378 %_3379)
                                    (%_3141 %_3391 %_3378 %_3379)
                                    (%_3155))
                              %_3380)
                        (list 'if
                              (%_3141 %_3390 %_3378 %_3379)
                              (%_3141 %_3391 %_3378 %_3379)
                              (%_3155))))
                    %_3382)
             ((lambda (%_3383)
                (if %_3383
                  (apply (lambda (%_3385 %_3386 %_3387 %_3388)
                           (if %_3380
                             (list 'compile-in-annotation
                                   (list 'if
                                         (%_3141 %_3386 %_3378 %_3379)
                                         (%_3141 %_3387 %_3378 %_3379)
                                         (%_3141 %_3388 %_3378 %_3379))
                                   %_3380)
                             (list 'if
                                   (%_3141 %_3386 %_3378 %_3379)
                                   (%_3141 %_3387 %_3378 %_3379)
                                   (%_3141 %_3388 %_3378 %_3379))))
                         %_3383)
                  (syntax-error (%_3100 %_3377 %_3379 %_3380))))
              ($syntax-dispatch
                (compile-in-annotation %_3377 value)
                '(any any any any)))))
         ($syntax-dispatch
           (compile-in-annotation %_3377 value)
           '(any any any)))))
    (%_2986 'set! 'set! '())
    (%_2986 'begin 'begin '())
    (%_2986 'module-key 'module '())
    (%_2986 'import 'import '#f)
    (%_2986 'import 'import-only '#t)
    (%_2986 'define 'define '())
    (%_2986 'define-syntax 'define-syntax '())
    (%_2986 'eval-when 'eval-when '())
    (%_2986
      'core
      'syntax-case
      (letrec ((%_3395
                 (lambda (%_3557 %_3558 %_3559 %_3560)
                   (if (null? %_3559)
                     (list 'syntax-error %_3557)
                     ((lambda (%_3561)
                        ((lambda (%_3562)
                           (if %_3562
                             (apply (lambda (%_3568 %_3569)
                                      (if (if (%_2993 %_3568)
                                            (if (not (%_3098 %_3568 %_3558))
                                              (not (%_3156 %_3568))
                                              '#f)
                                            '#f)
                                        ((lambda (%_3571 %_3570)
                                           (list (list 'lambda
                                                       (list %_3571)
                                                       (%_3141
                                                         %_3569
                                                         (%_2978
                                                           %_3570
                                                           (%_2963
                                                             'syntax
                                                             (cons %_3571 '0))
                                                           %_3560)
                                                         (%_3077
                                                           (list %_3568)
                                                           (list %_3570)
                                                           '(()))))
                                                 %_3557))
                                         (%_3160 %_3568)
                                         (%_3038))
                                        (%_3394
                                          %_3557
                                          %_3558
                                          (cdr %_3559)
                                          %_3560
                                          %_3568
                                          '#t
                                          %_3569)))
                                    %_3562)
                             ((lambda (%_3563)
                                (if %_3563
                                  (apply (lambda (%_3565 %_3566 %_3567)
                                           (%_3394
                                             %_3557
                                             %_3558
                                             (cdr %_3559)
                                             %_3560
                                             %_3565
                                             %_3566
                                             %_3567))
                                         %_3563)
                                  (syntax-error
                                    (car %_3559)
                                    '"invalid syntax-case clause")))
                              ($syntax-dispatch
                                (compile-in-annotation %_3561 value)
                                '(any any any)))))
                         ($syntax-dispatch
                           (compile-in-annotation %_3561 value)
                           '(any any))))
                      (car %_3559)))))
               (%_3394
                 (lambda (%_3486
                          %_3487
                          %_3488
                          %_3489
                          %_3490
                          %_3491
                          %_3492)
                   (call-with-values
                     (lambda () (%_3392 %_3490 %_3487))
                     (lambda (%_3493 %_3494)
                       (if (not (%_3096 (map car %_3494)))
                         (%_3097
                           (map car %_3494)
                           %_3490
                           '"pattern variable")
                         (if (not (andmap
                                    (lambda (%_3556)
                                      (not (%_3156 (car %_3556))))
                                    %_3494))
                           (syntax-error
                             %_3490
                             '"misplaced ellipsis in syntax-case pattern")
                           ((lambda (%_3495)
                              (list (list 'lambda
                                          (list %_3495)
                                          (list 'if
                                                ((lambda (%_3506)
                                                   (if %_3506
                                                     (apply (lambda () %_3495)
                                                            %_3506)
                                                     (list 'if
                                                           %_3495
                                                           (%_3393
                                                             %_3494
                                                             %_3491
                                                             %_3495
                                                             %_3489)
                                                           (list 'quote '#f))))
                                                 ($syntax-dispatch
                                                   (compile-in-annotation
                                                     %_3491
                                                     value)
                                                   '#2(atom #t)))
                                                (%_3393
                                                  %_3494
                                                  %_3492
                                                  %_3495
                                                  %_3489)
                                                (%_3395
                                                  %_3486
                                                  %_3487
                                                  %_3488
                                                  %_3489)))
                                    (if (eq? %_3493 'any)
                                      (list 'list
                                            (cons 'compile-in-annotation
                                                  (cons %_3486 '(value))))
                                      (list '$syntax-dispatch
                                            (cons 'compile-in-annotation
                                                  (cons %_3486 '(value)))
                                            (list 'quote %_3493)))))
                            (%_3160 'tmp))))))))
               (%_3393
                 (lambda (%_3470 %_3471 %_3472 %_3473)
                   ((lambda (%_3475 %_3474)
                      ((lambda (%_3477 %_3476)
                         (list 'apply
                               (list 'lambda
                                     %_3477
                                     (%_3141
                                       %_3471
                                       (%_2979
                                         %_3476
                                         (map (lambda (%_3478 %_3479)
                                                (%_2963
                                                  'syntax
                                                  (cons %_3478 %_3479)))
                                              %_3477
                                              (map cdr %_3470))
                                         %_3473)
                                       (%_3077 %_3474 %_3476 '(()))))
                               %_3472))
                       (map %_3160 %_3474)
                       (%_3040 %_3474)))
                    (map cdr %_3470)
                    (map car %_3470))))
               (%_3392
                 (lambda (%_3418 %_3419)
                   (letrec ((%_3421
                              (lambda (%_3429 %_3430 %_3431)
                                (if (%_2993 %_3429)
                                  (if (%_3098 %_3429 %_3419)
                                    (values (vector 'free-id %_3429) %_3431)
                                    (values
                                      'any
                                      (cons (cons %_3429 %_3430) %_3431)))
                                  ((lambda (%_3433)
                                     (if (if %_3433
                                           (apply (lambda (%_3468 %_3469)
                                                    (%_3156 %_3469))
                                                  %_3433)
                                           '#f)
                                       (apply (lambda (%_3464 %_3465)
                                                (call-with-values
                                                  (lambda ()
                                                    (%_3421
                                                      %_3464
                                                      (+ %_3430 '1)
                                                      %_3431))
                                                  (lambda (%_3466 %_3467)
                                                    (values
                                                      (if (eq? %_3466 'any)
                                                        'each-any
                                                        (vector 'each %_3466))
                                                      %_3467))))
                                              %_3433)
                                       ((lambda (%_3434)
                                          (if (if %_3434
                                                (apply (lambda (%_3460
                                                                %_3461
                                                                %_3462
                                                                %_3463)
                                                         (%_3156 %_3461))
                                                       %_3434)
                                                '#f)
                                            (apply (lambda (%_3449
                                                            %_3450
                                                            %_3451
                                                            %_3452)
                                                     (call-with-values
                                                       (lambda ()
                                                         (%_3421
                                                           %_3452
                                                           %_3430
                                                           %_3431))
                                                       (lambda (%_3453 %_3454)
                                                         (call-with-values
                                                           (lambda ()
                                                             (%_3420
                                                               %_3451
                                                               %_3430
                                                               %_3454))
                                                           (lambda (%_3456
                                                                    %_3457)
                                                             (call-with-values
                                                               (lambda ()
                                                                 (%_3421
                                                                   %_3449
                                                                   (+ %_3430
                                                                      '1)
                                                                   %_3457))
                                                               (lambda (%_3458
                                                                        %_3459)
                                                                 (values
                                                                   (vector
                                                                     'each+
                                                                     %_3458
                                                                     (reverse
                                                                       %_3456)
                                                                     %_3453)
                                                                   %_3459))))))))
                                                   %_3434)
                                            ((lambda (%_3435)
                                               (if %_3435
                                                 (apply (lambda (%_3443 %_3444)
                                                          (call-with-values
                                                            (lambda ()
                                                              (%_3421
                                                                %_3444
                                                                %_3430
                                                                %_3431))
                                                            (lambda (%_3445
                                                                     %_3446)
                                                              (call-with-values
                                                                (lambda ()
                                                                  (%_3421
                                                                    %_3443
                                                                    %_3430
                                                                    %_3446))
                                                                (lambda (%_3447
                                                                         %_3448)
                                                                  (values
                                                                    (cons %_3447
                                                                          %_3445)
                                                                    %_3448))))))
                                                        %_3435)
                                                 ((lambda (%_3436)
                                                    (if %_3436
                                                      (apply (lambda ()
                                                               (values
                                                                 '()
                                                                 %_3431))
                                                             %_3436)
                                                      ((lambda (%_3437)
                                                         (if %_3437
                                                           (apply (lambda (%_3439)
                                                                    (call-with-values
                                                                      (lambda ()
                                                                        (%_3421
                                                                          %_3439
                                                                          %_3430
                                                                          %_3431))
                                                                      (lambda (%_3441
                                                                               %_3442)
                                                                        (values
                                                                          (vector
                                                                            'vector
                                                                            %_3441)
                                                                          %_3442))))
                                                                  %_3437)
                                                           (values
                                                             (vector
                                                               'atom
                                                               (%_3159
                                                                 %_3429
                                                                 '(())))
                                                             %_3431)))
                                                       ($syntax-dispatch
                                                         (compile-in-annotation
                                                           %_3429
                                                           value)
                                                         '#2(vector
                                                             each-any)))))
                                                  ($syntax-dispatch
                                                    (compile-in-annotation
                                                      %_3429
                                                      value)
                                                    '()))))
                                             ($syntax-dispatch
                                               (compile-in-annotation
                                                 %_3429
                                                 value)
                                               '(any . any)))))
                                        ($syntax-dispatch
                                          (compile-in-annotation %_3429 value)
                                          '(any any . #4(each+ any () any))))))
                                   ($syntax-dispatch
                                     (compile-in-annotation %_3429 value)
                                     '(any any))))))
                            (%_3420
                              (lambda (%_3422 %_3423 %_3424)
                                (if (null? %_3422)
                                  (values '() %_3424)
                                  (call-with-values
                                    (lambda ()
                                      (%_3420 (cdr %_3422) %_3423 %_3424))
                                    (lambda (%_3425 %_3426)
                                      (call-with-values
                                        (lambda ()
                                          (%_3421 (car %_3422) %_3423 %_3426))
                                        (lambda (%_3427 %_3428)
                                          (values
                                            (cons %_3427 %_3425)
                                            %_3428)))))))))
                     (%_3421 %_3418 '0 '())))))
        (lambda (%_3396 %_3397 %_3398 %_3399)
          ((lambda (%_3400)
             ((lambda (%_3402)
                (if %_3402
                  (apply (lambda (%_3403 %_3404 %_3405 %_3406)
                           (if (andmap
                                 (lambda (%_3416)
                                   (if (%_2993 %_3416)
                                     (not (%_3156 %_3416))
                                     '#f))
                                 %_3405)
                             ((lambda (%_3407)
                                (if %_3399
                                  (list 'compile-in-annotation
                                        (list (list 'lambda
                                                    (list %_3407)
                                                    (%_3395
                                                      %_3407
                                                      %_3405
                                                      %_3406
                                                      %_3397))
                                              (%_3141 %_3404 %_3397 '(())))
                                        %_3399)
                                  (list (list 'lambda
                                              (list %_3407)
                                              (%_3395
                                                %_3407
                                                %_3405
                                                %_3406
                                                %_3397))
                                        (%_3141 %_3404 %_3397 '(())))))
                              (%_3160 'tmp))
                             (syntax-error
                               %_3400
                               '"invalid literals list in")))
                         %_3402)
                  (syntax-error %_3400)))
              ($syntax-dispatch
                (compile-in-annotation %_3400 value)
                '(any any each-any . each-any))))
           (%_3100 %_3396 %_3398 %_3399)))))
    (set! sc-expand
      ((lambda (%_3574)
         ((lambda (%_3575)
            (lambda (%_3577 . %_3576)
              (if (if (pair? %_3577)
                    (equal? (car %_3577) '"noexpand")
                    '#f)
                (cadr %_3577)
                (if (null? %_3576)
                  (%_3106 %_3577 '() %_3575 '(l c) '(l) %_3574)
                  (%_3106
                    %_3577
                    '()
                    %_3575
                    (car %_3576)
                    (cadr %_3576)
                    %_3574)))))
          (%_3000
            (%_3001 '((top)))
            (cons %_3574 (%_3002 '((top)))))))
       ((lambda (%_3578)
          (begin (%_3075 %_3578 '*top*) %_3578))
        (%_3041 '() '() '()))))
    (set! identifier?
      (lambda (%_3579) (%_2987 %_3579)))
    (set! datum->syntax-object
      (lambda (%_3580 %_3581)
        (begin
          (if (not (%_2987 %_3580))
            (%_2814
              'datum->syntax-object
              '"invalid argument"
              %_3580)
            (void))
          (%_2935 %_3581 (%_2938 %_3580)))))
    (set! syntax-object->datum
      (lambda (%_3583) (%_3159 %_3583 '(()))))
    (set! generate-temporaries
      (lambda (%_3584)
        (begin
          (if (not (list? %_3584))
            (%_2814
              'generate-temporaries
              '"invalid argument"
              %_3584)
            (void))
          (map (lambda (%_3586) (%_3099 (gensym) '((top))))
               %_3584))))
    (set! free-identifier=?
      (lambda (%_3587 %_3588)
        (begin
          (if (not (%_2987 %_3587))
            (%_2814
              'free-identifier=?
              '"invalid argument"
              %_3587)
            (void))
          (if (not (%_2987 %_3588))
            (%_2814
              'free-identifier=?
              '"invalid argument"
              %_3588)
            (void))
          (%_3087 %_3587 %_3588))))
    (set! bound-identifier=?
      (lambda (%_3591 %_3592)
        (begin
          (if (not (%_2987 %_3591))
            (%_2814
              'bound-identifier=?
              '"invalid argument"
              %_3591)
            (void))
          (if (not (%_2987 %_3592))
            (%_2814
              'bound-identifier=?
              '"invalid argument"
              %_3592)
            (void))
          (%_3089 %_3591 %_3592))))
    (set! literal-identifier=?
      (lambda (%_3595 %_3596)
        (begin
          (if (not (%_2987 %_3595))
            (%_2814
              'literal-identifier=?
              '"invalid argument"
              %_3595)
            (void))
          (if (not (%_2987 %_3596))
            (%_2814
              'literal-identifier=?
              '"invalid argument"
              %_3596)
            (void))
          (%_3088 %_3595 %_3596))))
    (set! syntax-error
      (lambda (%_3600 . %_3599)
        (begin
          (for-each
            (lambda (%_3601)
              (if (not (string? %_3601))
                (%_2814 'syntax-error '"invalid argument" %_3601)
                (void)))
            %_3599)
          ((lambda (%_3603)
             (%_2814 '#f %_3603 (%_3159 %_3600 '(()))))
           (if (null? %_3599)
             '"invalid syntax"
             (apply string-append %_3599))))))
    (letrec ((%_3610
               (lambda (%_3651 %_3652 %_3653 %_3654)
                 (if (not %_3654)
                   '#f
                   (if (eq? %_3652 'any)
                     (cons (%_3099 %_3651 %_3653) %_3654)
                     (if (%_2936 %_3651)
                       (%_3609
                         ((lambda (%_3656)
                            (if (annotation? %_3656)
                              (annotation-expression %_3656)
                              %_3656))
                          (%_2937 %_3651))
                         %_3652
                         (%_3080 %_3653 (%_2938 %_3651))
                         %_3654)
                       (%_3609
                         (if (annotation? %_3651)
                           (annotation-expression %_3651)
                           %_3651)
                         %_3652
                         %_3653
                         %_3654))))))
             (%_3609
               (lambda (%_3641 %_3642 %_3643 %_3644)
                 (if (null? %_3642)
                   (if (null? %_3641) %_3644 '#f)
                   (if (pair? %_3642)
                     (if (pair? %_3641)
                       (%_3610
                         (car %_3641)
                         (car %_3642)
                         %_3643
                         (%_3610 (cdr %_3641) (cdr %_3642) %_3643 %_3644))
                       '#f)
                     (if (eq? %_3642 'each-any)
                       ((lambda (%_3650)
                          (if %_3650 (cons %_3650 %_3644) '#f))
                        (%_3606 %_3641 %_3643))
                       ((lambda (%_3645)
                          (if (memv %_3645 '(each))
                            (if (null? %_3641)
                              (%_3607 (vector-ref %_3642 '1) %_3644)
                              ((lambda (%_3649)
                                 (if %_3649 (%_3608 %_3649 %_3644) '#f))
                               (%_3604 %_3641 (vector-ref %_3642 '1) %_3643)))
                            (if (memv %_3645 '(free-id))
                              (if (%_2993 %_3641)
                                (if (%_3088
                                      (%_3099 %_3641 %_3643)
                                      (vector-ref %_3642 '1))
                                  %_3644
                                  '#f)
                                '#f)
                              (if (memv %_3645 '(each+))
                                (call-with-values
                                  (lambda ()
                                    (%_3605
                                      %_3641
                                      (vector-ref %_3642 '1)
                                      (vector-ref %_3642 '2)
                                      (vector-ref %_3642 '3)
                                      %_3643
                                      %_3644))
                                  (lambda (%_3646 %_3647 %_3648)
                                    (if %_3648
                                      (if (null? %_3647)
                                        (if (null? %_3646)
                                          (%_3607
                                            (vector-ref %_3642 '1)
                                            %_3648)
                                          (%_3608 %_3646 %_3648))
                                        '#f)
                                      '#f)))
                                (if (memv %_3645 '(atom))
                                  (if (equal?
                                        (vector-ref %_3642 '1)
                                        (%_3159 %_3641 %_3643))
                                    %_3644
                                    '#f)
                                  (if (memv %_3645 '(vector))
                                    (if (vector? %_3641)
                                      (%_3610
                                        (vector->list %_3641)
                                        (vector-ref %_3642 '1)
                                        %_3643
                                        %_3644)
                                      '#f)
                                    (void)))))))
                        (vector-ref %_3642 '0)))))))
             (%_3608
               (lambda (%_3639 %_3640)
                 (if (null? (car %_3639))
                   %_3640
                   (cons (map car %_3639)
                         (%_3608 (map cdr %_3639) %_3640)))))
             (%_3607
               (lambda (%_3636 %_3637)
                 (if (null? %_3636)
                   %_3637
                   (if (eq? %_3636 'any)
                     (cons '() %_3637)
                     (if (pair? %_3636)
                       (%_3607
                         (car %_3636)
                         (%_3607 (cdr %_3636) %_3637))
                       (if (eq? %_3636 'each-any)
                         (cons '() %_3637)
                         ((lambda (%_3638)
                            (if (memv %_3638 '(each))
                              (%_3607 (vector-ref %_3636 '1) %_3637)
                              (if (memv %_3638 '(each+))
                                (%_3607
                                  (vector-ref %_3636 '1)
                                  (%_3607
                                    (reverse (vector-ref %_3636 '2))
                                    (%_3607 (vector-ref %_3636 '3) %_3637)))
                                (if (memv %_3638 '(free-id atom))
                                  %_3637
                                  (if (memv %_3638 '(vector))
                                    (%_3607 (vector-ref %_3636 '1) %_3637)
                                    (void))))))
                          (vector-ref %_3636 '0))))))))
             (%_3606
               (lambda (%_3633 %_3634)
                 (if (annotation? %_3633)
                   (%_3606 (annotation-expression %_3633) %_3634)
                   (if (pair? %_3633)
                     ((lambda (%_3635)
                        (if %_3635
                          (cons (%_3099 (car %_3633) %_3634) %_3635)
                          '#f))
                      (%_3606 (cdr %_3633) %_3634))
                     (if (null? %_3633)
                       '()
                       (if (%_2936 %_3633)
                         (%_3606
                           (%_2937 %_3633)
                           (%_3080 %_3634 (%_2938 %_3633)))
                         '#f))))))
             (%_3605
               (lambda (%_3620 %_3621 %_3622 %_3623 %_3624 %_3625)
                 ((letrec ((%_3626
                             (lambda (%_3627 %_3628)
                               (if (pair? %_3627)
                                 (call-with-values
                                   (lambda () (%_3626 (cdr %_3627) %_3628))
                                   (lambda (%_3629 %_3630 %_3631)
                                     (if %_3631
                                       (if (null? %_3630)
                                         ((lambda (%_3632)
                                            (if %_3632
                                              (values
                                                (cons %_3632 %_3629)
                                                %_3630
                                                %_3631)
                                              (values '#f '#f '#f)))
                                          (%_3610
                                            (car %_3627)
                                            %_3621
                                            %_3628
                                            '()))
                                         (values
                                           '()
                                           (cdr %_3630)
                                           (%_3610
                                             (car %_3627)
                                             (car %_3630)
                                             %_3628
                                             %_3631)))
                                       (values '#f '#f '#f))))
                                 (if (annotation? %_3627)
                                   (%_3626
                                     (annotation-expression %_3627)
                                     %_3628)
                                   (if (%_2936 %_3627)
                                     (%_3626
                                       (%_2937 %_3627)
                                       (%_3080 %_3628 (%_2938 %_3627)))
                                     (values
                                       '()
                                       %_3622
                                       (%_3610
                                         %_3627
                                         %_3623
                                         %_3628
                                         %_3625))))))))
                    %_3626)
                  %_3620
                  %_3624)))
             (%_3604
               (lambda (%_3615 %_3616 %_3617)
                 (if (annotation? %_3615)
                   (%_3604
                     (annotation-expression %_3615)
                     %_3616
                     %_3617)
                   (if (pair? %_3615)
                     ((lambda (%_3618)
                        (if %_3618
                          ((lambda (%_3619)
                             (if %_3619 (cons %_3618 %_3619) '#f))
                           (%_3604 (cdr %_3615) %_3616 %_3617))
                          '#f))
                      (%_3610 (car %_3615) %_3616 %_3617 '()))
                     (if (null? %_3615)
                       '()
                       (if (%_2936 %_3615)
                         (%_3604
                           (%_2937 %_3615)
                           %_3616
                           (%_3080 %_3617 (%_2938 %_3615)))
                         '#f)))))))
      (set! $syntax-dispatch
        (lambda (%_3611 %_3612)
          (if (eq? %_3612 'any)
            (list %_3611)
            (if (%_2936 %_3611)
              (%_3609
                ((lambda (%_3614)
                   (if (annotation? %_3614)
                     (annotation-expression %_3614)
                     %_3614))
                 (%_2937 %_3611))
                %_3612
                (%_2938 %_3611)
                '())
              (%_3609
                (if (annotation? %_3611)
                  (annotation-expression %_3611)
                  %_3611)
                %_3612
                '(())
                '()))))))))
($sc-put-cte
  'with-syntax
  (lambda (%_4696)
    ((lambda (%_4698)
       (if %_4698
         (apply (lambda (%_4715 %_4716 %_4717)
                  (cons '#3(syntax-object
                            begin
                            ((top)
                             #4(ribcage #3(_ e1 e2) #3((top)) #3("i" "i" "i"))
                             #4(ribcage ())
                             #4(ribcage #1(x) #1((top)) #1("i"))
                             #4(ribcage (#2(import-token *top*)) ())))
                        (cons %_4716 %_4717)))
                %_4698)
         ((lambda (%_4699)
            (if %_4699
              (apply (lambda (%_4709 %_4710 %_4711 %_4712 %_4713)
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
                             %_4711
                             '()
                             (list %_4710
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
                                         (cons %_4712 %_4713)))))
                     %_4699)
              ((lambda (%_4700)
                 (if %_4700
                   (apply (lambda (%_4701 %_4702 %_4703 %_4704 %_4705)
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
                                        %_4703)
                                  '()
                                  (list %_4702
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
                                              (cons %_4704 %_4705)))))
                          %_4700)
                   (syntax-error %_4696)))
               ($syntax-dispatch
                 (compile-in-annotation %_4696 value)
                 '(any #2(each (any any)) any . each-any)))))
          ($syntax-dispatch
            (compile-in-annotation %_4696 value)
            '(any ((any any)) any . each-any)))))
     ($syntax-dispatch
       (compile-in-annotation %_4696 value)
       '(any () any . each-any)))))
($sc-put-cte
  'syntax-rules
  (lambda (%_4719)
    ((lambda (%_4721)
       (if %_4721
         (apply (lambda (%_4722 %_4723 %_4724 %_4725 %_4726)
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
                                    (cons %_4723
                                          (map (lambda (%_4729 %_4728)
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
                                                             %_4728)
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
                                                             %_4729)))
                                               %_4726
                                               %_4725))))))
                %_4721)
         (syntax-error %_4719)))
     ($syntax-dispatch
       (compile-in-annotation %_4719 value)
       '(any each-any . #2(each ((any . any) any)))))))
($sc-put-cte
  'or
  (lambda (%_4730)
    ((lambda (%_4732)
       (if %_4732
         (apply (lambda (%_4742)
                  '#3(syntax-object
                      #f
                      ((top)
                       #4(ribcage #1(_) #1((top)) #1("i"))
                       #4(ribcage ())
                       #4(ribcage #1(x) #1((top)) #1("i"))
                       #4(ribcage (#2(import-token *top*)) ()))))
                %_4732)
         ((lambda (%_4733)
            (if %_4733
              (apply (lambda (%_4740 %_4741) %_4741) %_4733)
              ((lambda (%_4734)
                 (if %_4734
                   (apply (lambda (%_4735 %_4736 %_4737 %_4738)
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
                                              %_4736))
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
                                              (cons %_4737 %_4738)))))
                          %_4734)
                   (syntax-error %_4730)))
               ($syntax-dispatch
                 (compile-in-annotation %_4730 value)
                 '(any any any . each-any)))))
          ($syntax-dispatch
            (compile-in-annotation %_4730 value)
            '(any any)))))
     ($syntax-dispatch
       (compile-in-annotation %_4730 value)
       '(any)))))
($sc-put-cte
  'and
  (lambda (%_4743)
    ((lambda (%_4745)
       (if %_4745
         (apply (lambda (%_4751 %_4752 %_4753 %_4754)
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
                        (cons %_4752
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
                                          (cons %_4753 %_4754))
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
                %_4745)
         ((lambda (%_4746)
            (if %_4746
              (apply (lambda (%_4749 %_4750) %_4750) %_4746)
              ((lambda (%_4747)
                 (if %_4747
                   (apply (lambda (%_4748)
                            '#3(syntax-object
                                #t
                                ((top)
                                 #4(ribcage #1(_) #1((top)) #1("i"))
                                 #4(ribcage ())
                                 #4(ribcage #1(x) #1((top)) #1("i"))
                                 #4(ribcage (#2(import-token *top*)) ()))))
                          %_4747)
                   (syntax-error %_4743)))
               ($syntax-dispatch
                 (compile-in-annotation %_4743 value)
                 '(any)))))
          ($syntax-dispatch
            (compile-in-annotation %_4743 value)
            '(any any)))))
     ($syntax-dispatch
       (compile-in-annotation %_4743 value)
       '(any any any . each-any)))))
($sc-put-cte
  'let
  (lambda (%_4756)
    ((lambda (%_4758)
       (if (if %_4758
             (apply (lambda (%_4784 %_4785 %_4786 %_4787 %_4788)
                      (andmap identifier? %_4785))
                    %_4758)
             '#f)
         (apply (lambda (%_4776 %_4777 %_4778 %_4779 %_4780)
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
                              (cons %_4777 (cons %_4779 %_4780)))
                        %_4778))
                %_4758)
         ((lambda (%_4759)
            (if (if %_4759
                  (apply (lambda (%_4769 %_4770 %_4771 %_4772 %_4773 %_4774)
                           (andmap identifier? (cons %_4770 %_4771)))
                         %_4759)
                  '#f)
              (apply (lambda (%_4760 %_4761 %_4762 %_4763 %_4764 %_4765)
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
                                   (list (list %_4761
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
                                                     (cons %_4762
                                                           (cons %_4764
                                                                 %_4765)))))
                                   %_4761)
                             %_4763))
                     %_4759)
              (syntax-error %_4756)))
          ($syntax-dispatch
            (compile-in-annotation %_4756 value)
            '(any any #2(each (any any)) any . each-any)))))
     ($syntax-dispatch
       (compile-in-annotation %_4756 value)
       '(any #2(each (any any)) any . each-any)))))
($sc-put-cte
  'let*
  (lambda (%_4790)
    ((lambda (%_4792)
       (if (if %_4792
             (apply (lambda (%_4807 %_4808 %_4809 %_4810 %_4811)
                      (andmap identifier? %_4808))
                    %_4792)
             '#f)
         (apply (lambda (%_4793 %_4794 %_4795 %_4796 %_4797)
                  ((letrec ((%_4798
                              (lambda (%_4799)
                                (if (null? %_4799)
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
                                        (cons '() (cons %_4796 %_4797)))
                                  ((lambda (%_4800)
                                     ((lambda (%_4801)
                                        (if %_4801
                                          (apply (lambda (%_4802 %_4803)
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
                                                         (list %_4803)
                                                         %_4802))
                                                 %_4801)
                                          (syntax-error %_4800)))
                                      ($syntax-dispatch
                                        (compile-in-annotation %_4800 value)
                                        '(any any))))
                                   (list (%_4798 (cdr %_4799))
                                         (car %_4799)))))))
                     %_4798)
                   (map list %_4794 %_4795)))
                %_4792)
         (syntax-error %_4790)))
     ($syntax-dispatch
       (compile-in-annotation %_4790 value)
       '(any #2(each (any any)) any . each-any)))))
($sc-put-cte
  'cond
  (lambda (%_4813)
    ((lambda (%_4815)
       (if %_4815
         (apply (lambda (%_4816 %_4817 %_4818)
                  ((letrec ((%_4819
                              (lambda (%_4820 %_4821)
                                (if (null? %_4821)
                                  ((lambda (%_4837)
                                     (if %_4837
                                       (apply (lambda (%_4849 %_4850)
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
                                                      (cons %_4849 %_4850)))
                                              %_4837)
                                       ((lambda (%_4838)
                                          (if %_4838
                                            (apply (lambda (%_4848)
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
                                                                             %_4848))
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
                                                   %_4838)
                                            ((lambda (%_4839)
                                               (if %_4839
                                                 (apply (lambda (%_4846 %_4847)
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
                                                                            %_4846))
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
                                                                      (cons %_4847
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
                                                        %_4839)
                                                 ((lambda (%_4840)
                                                    (if %_4840
                                                      (apply (lambda (%_4842
                                                                      %_4843
                                                                      %_4844)
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
                                                                     %_4842
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
                                                                           (cons %_4843
                                                                                 %_4844))))
                                                             %_4840)
                                                      (syntax-error %_4813)))
                                                  ($syntax-dispatch
                                                    (compile-in-annotation
                                                      %_4820
                                                      value)
                                                    '(any any . each-any)))))
                                             ($syntax-dispatch
                                               (compile-in-annotation
                                                 %_4820
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
                                          (compile-in-annotation %_4820 value)
                                          '(any)))))
                                   ($syntax-dispatch
                                     (compile-in-annotation %_4820 value)
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
                                  ((lambda (%_4822)
                                     ((lambda (%_4825)
                                        (if %_4825
                                          (apply (lambda (%_4835)
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
                                                                     %_4835))
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
                                                               %_4822)))
                                                 %_4825)
                                          ((lambda (%_4826)
                                             (if %_4826
                                               (apply (lambda (%_4833 %_4834)
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
                                                                          %_4833))
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
                                                                    (cons %_4834
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
                                                                    %_4822)))
                                                      %_4826)
                                               ((lambda (%_4827)
                                                  (if %_4827
                                                    (apply (lambda (%_4829
                                                                    %_4830
                                                                    %_4831)
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
                                                                   %_4829
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
                                                                         (cons %_4830
                                                                               %_4831))
                                                                   %_4822))
                                                           %_4827)
                                                    (syntax-error %_4813)))
                                                ($syntax-dispatch
                                                  (compile-in-annotation
                                                    %_4820
                                                    value)
                                                  '(any any . each-any)))))
                                           ($syntax-dispatch
                                             (compile-in-annotation
                                               %_4820
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
                                        (compile-in-annotation %_4820 value)
                                        '(any))))
                                   (%_4819 (car %_4821) (cdr %_4821)))))))
                     %_4819)
                   %_4817
                   %_4818))
                %_4815)
         (syntax-error %_4813)))
     ($syntax-dispatch
       (compile-in-annotation %_4813 value)
       '(any any . each-any)))))
($sc-put-cte
  'do
  (lambda (%_4853)
    ((lambda (%_4855)
       (if %_4855
         (apply (lambda (%_4856
                         %_4857
                         %_4858
                         %_4859
                         %_4860
                         %_4861
                         %_4862)
                  ((lambda (%_4863)
                     ((lambda (%_4873)
                        (if %_4873
                          (apply (lambda (%_4874)
                                   ((lambda (%_4877)
                                      (if %_4877
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
                                                       (map list %_4857 %_4858)
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
                                                                   %_4860)
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
                                                                     %_4862
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
                                                                                 %_4874)))))))
                                               %_4877)
                                        ((lambda (%_4878)
                                           (if %_4878
                                             (apply (lambda (%_4879 %_4880)
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
                                                                 %_4857
                                                                 %_4858)
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
                                                                  %_4860
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
                                                                        (cons %_4879
                                                                              %_4880))
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
                                                                          %_4862
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
                                                                                      %_4874)))))))
                                                    %_4878)
                                             (syntax-error %_4861)))
                                         ($syntax-dispatch
                                           (compile-in-annotation %_4861 value)
                                           '(any . each-any)))))
                                    ($syntax-dispatch
                                      (compile-in-annotation %_4861 value)
                                      '())))
                                 %_4873)
                          (syntax-error %_4863)))
                      ($syntax-dispatch
                        (compile-in-annotation %_4863 value)
                        'each-any)))
                   (map (lambda (%_4864 %_4865)
                          ((lambda (%_4867)
                             (if %_4867
                               (apply (lambda () %_4864) %_4867)
                               ((lambda (%_4868)
                                  (if %_4868
                                    (apply (lambda (%_4870) %_4870) %_4868)
                                    (syntax-error %_4853)))
                                ($syntax-dispatch
                                  (compile-in-annotation %_4865 value)
                                  '(any)))))
                           ($syntax-dispatch
                             (compile-in-annotation %_4865 value)
                             '())))
                        %_4857
                        %_4859)))
                %_4855)
         (syntax-error %_4853)))
     ($syntax-dispatch
       (compile-in-annotation %_4853 value)
       '(any #2(each (any any . any))
             (any . each-any)
             .
             each-any)))))
($sc-put-cte
  'quasiquote
  (letrec ((%_4898
             (lambda (%_4987 %_4988)
               ((lambda (%_4990)
                  (if %_4990
                    (apply (lambda (%_5010)
                             (if (= %_4988 '0)
                               %_5010
                               (%_4895
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
                                 (%_4898 (list %_5010) (- %_4988 '1)))))
                           %_4990)
                    ((lambda (%_4991)
                       (if %_4991
                         (apply (lambda (%_5006 %_5007)
                                  (if (= %_4988 '0)
                                    (%_4894 %_5006 (%_4898 %_5007 %_4988))
                                    (%_4895
                                      (%_4895
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
                                        (%_4898 %_5006 (- %_4988 '1)))
                                      (%_4898 %_5007 %_4988))))
                                %_4991)
                         ((lambda (%_4992)
                            (if %_4992
                              (apply (lambda (%_5002 %_5003)
                                       (if (= %_4988 '0)
                                         (%_4896 %_5002 (%_4898 %_5003 %_4988))
                                         (%_4895
                                           (%_4895
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
                                             (%_4898 %_5002 (- %_4988 '1)))
                                           (%_4898 %_5003 %_4988))))
                                     %_4992)
                              ((lambda (%_4993)
                                 (if %_4993
                                   (apply (lambda (%_5001)
                                            (%_4895
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
                                              (%_4898
                                                (list %_5001)
                                                (+ %_4988 '1))))
                                          %_4993)
                                   ((lambda (%_4994)
                                      (if %_4994
                                        (apply (lambda (%_4999 %_5000)
                                                 (%_4895
                                                   (%_4898 %_4999 %_4988)
                                                   (%_4898 %_5000 %_4988)))
                                               %_4994)
                                        ((lambda (%_4995)
                                           (if %_4995
                                             (apply (lambda (%_4997)
                                                      (%_4897
                                                        (%_4898
                                                          %_4997
                                                          %_4988)))
                                                    %_4995)
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
                                                   %_4987)))
                                         ($syntax-dispatch
                                           (compile-in-annotation %_4987 value)
                                           '#2(vector each-any)))))
                                    ($syntax-dispatch
                                      (compile-in-annotation %_4987 value)
                                      '(any . any)))))
                               ($syntax-dispatch
                                 (compile-in-annotation %_4987 value)
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
                            (compile-in-annotation %_4987 value)
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
                       (compile-in-annotation %_4987 value)
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
                  (compile-in-annotation %_4987 value)
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
           (%_4897
             (lambda (%_4950)
               ((lambda (%_4954)
                  (if (if %_4954
                        (apply (lambda (%_4985 %_4986) (%_4890 %_4985))
                               %_4954)
                        '#f)
                    (apply (lambda (%_4982 %_4983)
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
                                   (list->vector %_4983)))
                           %_4954)
                    ((letrec ((%_4956
                                (lambda (%_4957 %_4958)
                                  ((lambda (%_4960)
                                     (if (if %_4960
                                           (apply (lambda (%_4979 %_4980)
                                                    (%_4890 %_4979))
                                                  %_4960)
                                           '#f)
                                       (apply (lambda (%_4976 %_4977)
                                                (%_4958
                                                  (map (lambda (%_4978)
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
                                                               %_4978))
                                                       %_4977)))
                                              %_4960)
                                       ((lambda (%_4961)
                                          (if (if %_4961
                                                (apply (lambda (%_4974 %_4975)
                                                         (%_4891 %_4974))
                                                       %_4961)
                                                '#f)
                                            (apply (lambda (%_4971 %_4972)
                                                     (%_4958 %_4972))
                                                   %_4961)
                                            ((lambda (%_4962)
                                               (if (if %_4962
                                                     (apply (lambda (%_4968
                                                                     %_4969
                                                                     %_4970)
                                                              (%_4892 %_4968))
                                                            %_4962)
                                                     '#f)
                                                 (apply (lambda (%_4964
                                                                 %_4965
                                                                 %_4966)
                                                          (%_4956
                                                            %_4966
                                                            (lambda (%_4967)
                                                              (%_4958
                                                                (cons %_4965
                                                                      %_4967)))))
                                                        %_4962)
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
                                                       %_4950)))
                                             ($syntax-dispatch
                                               (compile-in-annotation
                                                 %_4957
                                                 value)
                                               '(any any any)))))
                                        ($syntax-dispatch
                                          (compile-in-annotation %_4957 value)
                                          '(any . each-any)))))
                                   ($syntax-dispatch
                                     (compile-in-annotation %_4957 value)
                                     '(any each-any))))))
                       %_4956)
                     %_4950
                     (lambda (%_4981)
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
                             %_4981)))))
                ($syntax-dispatch
                  (compile-in-annotation %_4950 value)
                  '(any each-any)))))
           (%_4896
             (lambda (%_4941 %_4942)
               ((lambda (%_4943)
                  (if (null? %_4943)
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
                    (if (null? (cdr %_4943))
                      (car %_4943)
                      ((lambda (%_4945)
                         (if %_4945
                           (apply (lambda (%_4946)
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
                                          %_4946))
                                  %_4945)
                           (syntax-error %_4943)))
                       ($syntax-dispatch
                         (compile-in-annotation %_4943 value)
                         'each-any)))))
                ((letrec ((%_4948
                            (lambda (%_4949)
                              (if (null? %_4949)
                                (if (%_4893 %_4942) '() (list %_4942))
                                (if (%_4893 (car %_4949))
                                  (%_4948 (cdr %_4949))
                                  (cons (car %_4949)
                                        (%_4948 (cdr %_4949))))))))
                   %_4948)
                 %_4941))))
           (%_4895
             (lambda (%_4916 %_4917)
               ((lambda (%_4918)
                  ((lambda (%_4919)
                     (if %_4919
                       (apply (lambda (%_4920 %_4921)
                                ((lambda (%_4923)
                                   (if (if %_4923
                                         (apply (lambda (%_4939 %_4940)
                                                  (%_4890 %_4939))
                                                %_4923)
                                         '#f)
                                     (apply (lambda (%_4930 %_4931)
                                              ((lambda (%_4933)
                                                 (if (if %_4933
                                                       (apply (lambda (%_4937
                                                                       %_4938)
                                                                (%_4890
                                                                  %_4937))
                                                              %_4933)
                                                       '#f)
                                                   (apply (lambda (%_4935
                                                                   %_4936)
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
                                                                  (cons %_4936
                                                                        %_4931)))
                                                          %_4933)
                                                   (if (null? %_4931)
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
                                                           %_4920)
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
                                                           %_4920
                                                           %_4921))))
                                               ($syntax-dispatch
                                                 (compile-in-annotation
                                                   %_4920
                                                   value)
                                                 '(any any))))
                                            %_4923)
                                     ((lambda (%_4924)
                                        (if (if %_4924
                                              (apply (lambda (%_4928 %_4929)
                                                       (%_4891 %_4928))
                                                     %_4924)
                                              '#f)
                                          (apply (lambda (%_4926 %_4927)
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
                                                         (cons %_4920 %_4927)))
                                                 %_4924)
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
                                                %_4920
                                                %_4921)))
                                      ($syntax-dispatch
                                        (compile-in-annotation %_4921 value)
                                        '(any . any)))))
                                 ($syntax-dispatch
                                   (compile-in-annotation %_4921 value)
                                   '(any any))))
                              %_4919)
                       (syntax-error %_4918)))
                   ($syntax-dispatch
                     (compile-in-annotation %_4918 value)
                     '(any any))))
                (list %_4916 %_4917))))
           (%_4894
             (lambda (%_4912 %_4913)
               ((letrec ((%_4914
                           (lambda (%_4915)
                             (if (null? %_4915)
                               %_4913
                               (%_4895 (car %_4915) (%_4914 (cdr %_4915)))))))
                  %_4914)
                %_4912)))
           (%_4893
             (lambda (%_4907)
               ((lambda (%_4909)
                  (if %_4909
                    (apply (lambda (%_4911) (%_4890 %_4911)) %_4909)
                    '#f))
                ($syntax-dispatch
                  (compile-in-annotation %_4907 value)
                  '(any ())))))
           (%_4892
             (lambda (%_4906)
               (if (identifier? %_4906)
                 (free-identifier=?
                   %_4906
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
           (%_4891
             (lambda (%_4905)
               (if (identifier? %_4905)
                 (free-identifier=?
                   %_4905
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
           (%_4890
             (lambda (%_4904)
               (if (identifier? %_4904)
                 (free-identifier=?
                   %_4904
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
    (lambda (%_4899)
      ((lambda (%_4901)
         (if %_4901
           (apply (lambda (%_4902 %_4903) (%_4898 %_4903 '0))
                  %_4901)
           (syntax-error %_4899)))
       ($syntax-dispatch
         (compile-in-annotation %_4899 value)
         '(any any))))))
($sc-put-cte
  'include
  (lambda (%_5011)
    (letrec ((%_5012
               (lambda (%_5022 %_5023)
                 ((lambda (%_5024)
                    ((letrec ((%_5025
                                (lambda (%_5026)
                                  ((lambda (%_5027)
                                     (if (eof-object? %_5027)
                                       (begin
                                         (close-input-port %_5024)
                                         (reverse %_5026))
                                       (%_5025
                                         (cons (datum->syntax-object
                                                 %_5023
                                                 %_5027)
                                               %_5026))))
                                   (read-code %_5024)))))
                       %_5025)
                     '()))
                  (open-source-input-file %_5022)))))
      ((lambda (%_5014)
         (if %_5014
           (apply (lambda (%_5015 %_5016)
                    ((lambda (%_5017)
                       ((lambda (%_5018)
                          ((lambda (%_5019)
                             (if %_5019
                               (apply (lambda (%_5020)
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
                                              %_5020))
                                      %_5019)
                               (syntax-error %_5018)))
                           ($syntax-dispatch
                             (compile-in-annotation %_5018 value)
                             'each-any)))
                        (%_5012 %_5017 %_5015)))
                     (syntax-object->datum %_5016)))
                  %_5014)
           (syntax-error %_5011)))
       ($syntax-dispatch
         (compile-in-annotation %_5011 value)
         '(any any))))))
($sc-put-cte
  'unquote
  (lambda (%_5028)
    ((lambda (%_5030)
       (if %_5030
         (apply (lambda (%_5031 %_5032)
                  (syntax-error
                    %_5028
                    '"expression not valid outside of quasiquote"))
                %_5030)
         (syntax-error %_5028)))
     ($syntax-dispatch
       (compile-in-annotation %_5028 value)
       '(any . each-any)))))
($sc-put-cte
  'unquote-splicing
  (lambda (%_5033)
    ((lambda (%_5035)
       (if %_5035
         (apply (lambda (%_5036 %_5037)
                  (syntax-error
                    %_5033
                    '"expression not valid outside of quasiquote"))
                %_5035)
         (syntax-error %_5033)))
     ($syntax-dispatch
       (compile-in-annotation %_5033 value)
       '(any . each-any)))))
($sc-put-cte
  'case
  (lambda (%_5038)
    ((lambda (%_5040)
       (if %_5040
         (apply (lambda (%_5041 %_5042 %_5043 %_5044)
                  ((lambda (%_5045)
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
                                       %_5042))
                           %_5045))
                   ((letrec ((%_5046
                               (lambda (%_5047 %_5048)
                                 (if (null? %_5048)
                                   ((lambda (%_5060)
                                      (if %_5060
                                        (apply (lambda (%_5068 %_5069)
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
                                                       (cons %_5068 %_5069)))
                                               %_5060)
                                        ((lambda (%_5061)
                                           (if %_5061
                                             (apply (lambda (%_5063
                                                             %_5064
                                                             %_5065)
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
                                                                        %_5063))
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
                                                                  (cons %_5064
                                                                        %_5065))))
                                                    %_5061)
                                             (syntax-error %_5038)))
                                         ($syntax-dispatch
                                           (compile-in-annotation %_5047 value)
                                           '(each-any any . each-any)))))
                                    ($syntax-dispatch
                                      (compile-in-annotation %_5047 value)
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
                                   ((lambda (%_5049)
                                      ((lambda (%_5052)
                                         (if %_5052
                                           (apply (lambda (%_5054
                                                           %_5055
                                                           %_5056)
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
                                                                      %_5054))
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
                                                                (cons %_5055
                                                                      %_5056))
                                                          %_5049))
                                                  %_5052)
                                           (syntax-error %_5038)))
                                       ($syntax-dispatch
                                         (compile-in-annotation %_5047 value)
                                         '(each-any any . each-any))))
                                    (%_5046 (car %_5048) (cdr %_5048)))))))
                      %_5046)
                    %_5043
                    %_5044)))
                %_5040)
         (syntax-error %_5038)))
     ($syntax-dispatch
       (compile-in-annotation %_5038 value)
       '(any any any . each-any)))))
($sc-put-cte
  'identifier-syntax
  (lambda (%_5073)
    ((lambda (%_5075)
       (if %_5075
         (apply (lambda (%_5089 %_5090)
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
                                          %_5090))
                              (list (cons %_5089
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
                                          (cons %_5090
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
                %_5075)
         ((lambda (%_5076)
            (if (if %_5076
                  (apply (lambda (%_5083 %_5084 %_5085 %_5086 %_5087 %_5088)
                           (if (identifier? %_5084)
                             (identifier? %_5086)
                             '#f))
                         %_5076)
                  '#f)
              (apply (lambda (%_5077 %_5078 %_5079 %_5080 %_5081 %_5082)
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
                                                     %_5080
                                                     %_5081)
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
                                                     %_5082))
                                         (list (cons %_5078
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
                                                     (cons %_5079
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
                                         (list %_5078
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
                                                           %_5078))
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
                                                     %_5079))))))
                     %_5076)
              (syntax-error %_5073)))
          ($syntax-dispatch
            (compile-in-annotation %_5073 value)
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
       (compile-in-annotation %_5073 value)
       '(any any)))))
