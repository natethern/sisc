(letrec ((%_3123
           (lambda (%_4653)
             ((letrec ((%_4654
                         (lambda (%_4655 %_4656 %_4657)
                           (if (pair? %_4655)
                             (%_4654
                               (cdr %_4655)
                               (cons (%_3061 (car %_4655) %_4657) %_4656)
                               %_4657)
                             (if (%_2955 %_4655)
                               (cons (%_3061 %_4655 %_4657) %_4656)
                               (if (null? %_4655)
                                 %_4656
                                 (if (%_2898 %_4655)
                                   (%_4654
                                     (%_2899 %_4655)
                                     %_4656
                                     (%_3042 %_4657 (%_2900 %_4655)))
                                   (if (annotation? %_4655)
                                     (%_4654
                                       (annotation-expression %_4655)
                                       %_4656
                                       %_4657)
                                     (cons %_4655 %_4656)))))))))
                %_4654)
              %_4653
              '()
              '(()))))
         (%_3122
           (lambda (%_4651)
             ((lambda (%_4652)
                (if (annotation? %_4652)
                  (if (annotation-source %_4652)
                    (list 'compile-in-annotation
                          (gensym)
                          (annotation-source %_4652))
                    (gensym))
                  (gensym)))
              (if (%_2898 %_4651) (%_2899 %_4651) %_4651))))
         (%_3121
           (lambda (%_4647 %_4648)
             (%_3120
               %_4647
               %_4648
               (lambda (%_4649)
                 (if ((lambda (%_4650)
                        (if %_4650
                          %_4650
                          (if (pair? %_4649)
                            (annotation? (car %_4649))
                            '#f)))
                      (annotation? %_4649))
                   (%_3119 %_4649 '#f)
                   %_4649)))))
         (%_3120
           (lambda (%_4638 %_4639 %_4640)
             (if (memq 'top (%_2963 %_4639))
               (%_4640 %_4638)
               ((letrec ((%_4641
                           (lambda (%_4642)
                             (if (%_2898 %_4642)
                               (%_3120 (%_2899 %_4642) (%_2900 %_4642) %_4640)
                               (if (pair? %_4642)
                                 ((lambda (%_4646 %_4645)
                                    (if (if (eq? %_4645 (car %_4642))
                                          (eq? %_4646 (cdr %_4642))
                                          '#f)
                                      %_4642
                                      (cons %_4645 %_4646)))
                                  (%_4641 (cdr %_4642))
                                  (%_4641 (car %_4642)))
                                 (if (vector? %_4642)
                                   ((lambda (%_4643)
                                      ((lambda (%_4644)
                                         (if (andmap eq? %_4643 %_4644)
                                           %_4642
                                           (list->vector %_4644)))
                                       (map %_4641 %_4643)))
                                    (vector->list %_4642))
                                   %_4642))))))
                  %_4641)
                %_4638))))
         (%_3119
           (lambda (%_4631 %_4632)
             (if (pair? %_4631)
               ((lambda (%_4637)
                  (begin
                    (if %_4632
                      (set-annotation-stripped! %_4632 %_4637)
                      (void))
                    (set-car! %_4637 (%_3119 (car %_4631) '#f))
                    (set-cdr! %_4637 (%_3119 (cdr %_4631) '#f))
                    %_4637))
                (cons '#f '#f))
               (if (annotation? %_4631)
                 ((lambda (%_4636)
                    (if %_4636
                      %_4636
                      (%_3119 (annotation-expression %_4631) %_4631)))
                  (annotation-stripped %_4631))
                 (if (vector? %_4631)
                   ((lambda (%_4633)
                      (begin
                        (if %_4632
                          (set-annotation-stripped! %_4632 %_4633)
                          (void))
                        ((letrec ((%_4634
                                    (lambda (%_4635)
                                      (if (not (< %_4635 '0))
                                        (begin
                                          (vector-set!
                                            %_4633
                                            %_4635
                                            (%_3119
                                              (vector-ref %_4631 %_4635)
                                              '#f))
                                          (%_4634 (- %_4635 '1)))
                                        (void)))))
                           %_4634)
                         (- (vector-length %_4631) '1))
                        %_4633))
                    (make-vector (vector-length %_4631)))
                   %_4631)))))
         (%_3118
           (lambda (%_4630)
             (if (%_2949 %_4630)
               (%_3050
                 %_4630
                 '#3(syntax-object
                     ...
                     ((top)
                      #4(ribcage ())
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
                      #4(ribcage (#2(import-token *top*)) ())
                      #4(ribcage (#2(import-token *top*)) ()))))
               '#f)))
         (%_3117 (lambda () (list 'void)))
         (%_3116
           (lambda (%_4606 %_4607 %_4608 %_4609 %_4610 %_4611)
             ((lambda (%_4613)
                (if %_4613
                  (apply (lambda (%_4615 %_4616 %_4617 %_4618 %_4619)
                           (if (not (%_3052 %_4616))
                             (%_3059
                               (map (lambda (%_4628) (%_3061 %_4628 %_4609))
                                    %_4616)
                               (%_3062 %_4607 %_4609 %_4610)
                               '"keyword")
                             ((lambda (%_4621)
                                ((lambda (%_4622)
                                   (%_4611
                                     (cons %_4618 %_4619)
                                     (%_2941
                                       %_4621
                                       ((lambda (%_4625 %_4624)
                                          (map (lambda (%_4626)
                                                 (%_2925
                                                   'deferred
                                                   (%_3103
                                                     %_4626
                                                     %_4625
                                                     %_4624)))
                                               %_4617))
                                        (%_2943 %_4608)
                                        (if %_4606 %_4622 %_4609))
                                       %_4608)
                                     %_4622
                                     %_4610))
                                 (%_3039 %_4616 %_4621 %_4609)))
                              (%_3002 %_4616))))
                         %_4613)
                  (syntax-error (%_3062 %_4607 %_4609 %_4610))))
              ($syntax-dispatch
                (compile-in-annotation %_4607 value)
                '(any #2(each (any any)) any . each-any)))))
         (%_3115
           (lambda (%_4579 %_4580 %_4581 %_4582 %_4583)
             ((lambda (%_4585)
                (if %_4585
                  (apply (lambda (%_4598 %_4599 %_4600)
                           (if (not (%_3052 %_4598))
                             (syntax-error
                               %_4579
                               '"invalid parameter list in")
                             ((lambda (%_4603 %_4602)
                                (%_4583
                                  %_4603
                                  (%_3108
                                    (cons %_4599 %_4600)
                                    %_4579
                                    (%_2942 %_4602 %_4603 %_4581)
                                    (%_3039 %_4598 %_4602 %_4582))))
                              (map %_3122 %_4598)
                              (%_3002 %_4598))))
                         %_4585)
                  ((lambda (%_4586)
                     (if %_4586
                       (apply (lambda (%_4588 %_4589 %_4590)
                                ((lambda (%_4591)
                                   (if (not (%_3052 %_4591))
                                     (syntax-error
                                       %_4579
                                       '"invalid parameter list in")
                                     ((lambda (%_4593 %_4592)
                                        (%_4583
                                          ((letrec ((%_4594
                                                      (lambda (%_4595 %_4596)
                                                        (if (null? %_4595)
                                                          %_4596
                                                          (%_4594
                                                            (cdr %_4595)
                                                            (cons (car %_4595)
                                                                  %_4596))))))
                                             %_4594)
                                           (cdr %_4593)
                                           (car %_4593))
                                          (%_3108
                                            (cons %_4589 %_4590)
                                            %_4579
                                            (%_2942 %_4592 %_4593 %_4581)
                                            (%_3039 %_4591 %_4592 %_4582))))
                                      (map %_3122 %_4591)
                                      (%_3002 %_4591))))
                                 (%_3123 %_4588)))
                              %_4586)
                       (syntax-error %_4579)))
                   ($syntax-dispatch
                     (compile-in-annotation %_4580 value)
                     '(any any . each-any)))))
              ($syntax-dispatch
                (compile-in-annotation %_4580 value)
                '(each-any any . each-any)))))
         (%_3114
           (lambda (%_4566 %_4567 %_4568 %_4569)
             ((lambda (%_4571)
                (if (if %_4571
                      (apply (lambda (%_4576 %_4577 %_4578) (%_2955 %_4577))
                             %_4571)
                      '#f)
                  (apply (lambda (%_4573 %_4574 %_4575)
                           (%_4569 %_4574 %_4575 %_4567))
                         %_4571)
                  (syntax-error (%_3062 %_4566 %_4567 %_4568))))
              ($syntax-dispatch
                (compile-in-annotation %_4566 value)
                '(any any any)))))
         (%_3113
           (lambda (%_4536 %_4537 %_4538 %_4539)
             ((lambda (%_4541)
                (if (if %_4541
                      (apply (lambda (%_4563 %_4564 %_4565) (%_2955 %_4564))
                             %_4541)
                      '#f)
                  (apply (lambda (%_4560 %_4561 %_4562)
                           (%_4539 %_4561 %_4562 %_4537))
                         %_4541)
                  ((lambda (%_4542)
                     (if (if %_4542
                           (apply (lambda (%_4555 %_4556 %_4557 %_4558 %_4559)
                                    (if (%_2955 %_4556)
                                      (%_3052 (%_3123 %_4557))
                                      '#f))
                                  %_4542)
                           '#f)
                       (apply (lambda (%_4549 %_4550 %_4551 %_4552 %_4553)
                                (%_4539
                                  (%_3061 %_4550 %_4537)
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
                                                ())
                                             #4(ribcage
                                                (#2(import-token *top*))
                                                ()
                                                ())))
                                        (%_3061
                                          (cons %_4551 (cons %_4552 %_4553))
                                          %_4537))
                                  '(())))
                              %_4542)
                       ((lambda (%_4543)
                          (if (if %_4543
                                (apply (lambda (%_4547 %_4548) (%_2955 %_4548))
                                       %_4543)
                                '#f)
                            (apply (lambda (%_4545 %_4546)
                                     (%_4539
                                       (%_3061 %_4546 %_4537)
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
                                               ())
                                            #4(ribcage
                                               (#2(import-token *top*))
                                               ()
                                               ())))
                                       '(())))
                                   %_4543)
                            (syntax-error (%_3062 %_4536 %_4537 %_4538))))
                        ($syntax-dispatch
                          (compile-in-annotation %_4536 value)
                          '(any any)))))
                   ($syntax-dispatch
                     (compile-in-annotation %_4536 value)
                     '(any (any . any) any . each-any)))))
              ($syntax-dispatch
                (compile-in-annotation %_4536 value)
                '(any any any)))))
         (%_3112
           (lambda (%_4525 %_4526 %_4527 %_4528)
             ((lambda (%_4530)
                (if (if %_4530
                      (apply (lambda (%_4534 %_4535) (%_2955 %_4535))
                             %_4530)
                      '#f)
                  (apply (lambda (%_4532 %_4533)
                           (%_4528 (%_3061 %_4533 %_4526)))
                         %_4530)
                  (syntax-error (%_3062 %_4525 %_4526 %_4527))))
              ($syntax-dispatch
                (compile-in-annotation %_4525 value)
                '(any any)))))
         (%_3111
           (lambda (%_4489 %_4490 %_4491 %_4492 %_4493)
             (letrec ((%_4495
                        (lambda (%_4521 %_4522 %_4523)
                          (%_4493
                            %_4521
                            (%_4494 %_4522)
                            (map (lambda (%_4524) (%_3061 %_4524 %_4492))
                                 %_4523))))
                      (%_4494
                        (lambda (%_4515)
                          (if (null? %_4515)
                            '()
                            (cons ((lambda (%_4516)
                                     ((lambda (%_4517)
                                        (if %_4517
                                          (apply (lambda (%_4519)
                                                   (%_4494 %_4519))
                                                 %_4517)
                                          (if (%_2955 %_4516)
                                            (%_3061 %_4516 %_4492)
                                            (syntax-error
                                              (%_3062 %_4489 %_4490 %_4491)
                                              '"invalid exports list in"))))
                                      ($syntax-dispatch
                                        (compile-in-annotation %_4516 value)
                                        'each-any)))
                                   (car %_4515))
                                  (%_4494 (cdr %_4515)))))))
               ((lambda (%_4497)
                  (if %_4497
                    (apply (lambda (%_4510 %_4511 %_4512)
                             (%_4495 '#f %_4511 %_4512))
                           %_4497)
                    ((lambda (%_4498)
                       (if (if %_4498
                             (apply (lambda (%_4506 %_4507 %_4508 %_4509)
                                      (%_2955 %_4507))
                                    %_4498)
                             '#f)
                         (apply (lambda (%_4500 %_4501 %_4502 %_4503)
                                  (%_4495
                                    (%_3061 %_4501 %_4490)
                                    %_4502
                                    %_4503))
                                %_4498)
                         (syntax-error (%_3062 %_4489 %_4490 %_4491))))
                     ($syntax-dispatch
                       (compile-in-annotation %_4489 value)
                       '(any any each-any . each-any)))))
                ($syntax-dispatch
                  (compile-in-annotation %_4489 value)
                  '(any each-any . each-any))))))
         (%_3110
           (lambda (%_4484 %_4485)
             ((lambda (%_4486)
                (if %_4486
                  (%_3037 %_4485 %_4486)
                  (%_3097
                    (lambda (%_4487)
                      ((lambda (%_4488)
                         (begin
                           (if (not %_4488)
                             (syntax-error
                               %_4487
                               '"exported identifier not visible")
                             (void))
                           (%_3034 %_4485 %_4487 %_4488)))
                       (%_3047 %_4487 '(()))))
                    (%_3072 %_4484))))
              (%_3073 %_4484))))
         (%_3109
           (lambda (%_4404 %_4405 %_4406 %_4407 %_4408)
             (letrec ((%_4409
                        (lambda (%_4479 %_4480 %_4481 %_4482 %_4483)
                          (begin
                            (%_3094 %_4405 %_4480)
                            (%_4408
                              %_4479
                              %_4480
                              (reverse %_4481)
                              (reverse %_4482)
                              %_4483)))))
               ((letrec ((%_4410
                           (lambda (%_4411 %_4412 %_4413 %_4414 %_4415)
                             (if (null? %_4411)
                               (%_4409 %_4411 %_4412 %_4413 %_4414 %_4415)
                               ((lambda (%_4417 %_4416)
                                  (call-with-values
                                    (lambda ()
                                      (%_3066 %_4416 %_4417 '(()) '#f %_4404))
                                    (lambda (%_4418
                                             %_4419
                                             %_4420
                                             %_4421
                                             %_4422)
                                      (if (memv %_4418 '(define-form))
                                        (%_3113
                                          %_4420
                                          %_4421
                                          %_4422
                                          (lambda (%_4473 %_4474 %_4475)
                                            ((lambda (%_4477 %_4476)
                                               ((lambda (%_4478)
                                                  (begin
                                                    (%_3034
                                                      %_4404
                                                      %_4476
                                                      %_4477)
                                                    (%_3092
                                                      %_4407
                                                      %_4477
                                                      (%_2925 'lexical %_4478))
                                                    (%_4410
                                                      (cdr %_4411)
                                                      (cons %_4476 %_4412)
                                                      (cons %_4478 %_4413)
                                                      (cons (cons %_4417
                                                                  (%_3061
                                                                    %_4474
                                                                    %_4475))
                                                            %_4414)
                                                      %_4415)))
                                                (%_3122 %_4476)))
                                             (%_3000)
                                             (%_3061 %_4473 %_4475))))
                                        (if (memv %_4418 '(define-syntax-form))
                                          (%_3114
                                            %_4420
                                            %_4421
                                            %_4422
                                            (lambda (%_4467 %_4468 %_4469)
                                              ((lambda (%_4472 %_4471 %_4470)
                                                 (begin
                                                   (%_3034
                                                     %_4404
                                                     %_4470
                                                     %_4471)
                                                   (%_3092
                                                     %_4407
                                                     %_4471
                                                     (%_2925 'deferred %_4472))
                                                   (%_4410
                                                     (cdr %_4411)
                                                     (cons %_4470 %_4412)
                                                     %_4413
                                                     %_4414
                                                     %_4415)))
                                               (%_3103
                                                 %_4468
                                                 (%_2943 %_4417)
                                                 %_4469)
                                               (%_3000)
                                               (%_3061 %_4467 %_4469))))
                                          (if (memv %_4418 '(module-form))
                                            ((lambda (%_4451)
                                               ((lambda (%_4452)
                                                  (%_3111
                                                    %_4420
                                                    %_4421
                                                    %_4422
                                                    %_4452
                                                    (lambda (%_4453
                                                             %_4454
                                                             %_4455)
                                                      (%_3109
                                                        %_4451
                                                        (%_3062
                                                          %_4420
                                                          %_4421
                                                          %_4422)
                                                        (map (lambda (%_4456)
                                                               (cons %_4417
                                                                     %_4456))
                                                             %_4455)
                                                        %_4407
                                                        (lambda (%_4457
                                                                 %_4458
                                                                 %_4459
                                                                 %_4460
                                                                 %_4461)
                                                          (begin
                                                            (%_3093
                                                              %_4405
                                                              (%_3069 %_4454)
                                                              %_4458)
                                                            ((lambda (%_4465
                                                                      %_4464
                                                                      %_4463
                                                                      %_4462)
                                                               (if %_4453
                                                                 ((lambda (%_4466)
                                                                    (begin
                                                                      (%_3034
                                                                        %_4404
                                                                        %_4453
                                                                        %_4466)
                                                                      (%_3092
                                                                        %_4407
                                                                        %_4466
                                                                        (%_2925
                                                                          'module
                                                                          %_4462))
                                                                      (%_4410
                                                                        (cdr %_4411)
                                                                        (cons %_4453
                                                                              %_4412)
                                                                        %_4463
                                                                        %_4464
                                                                        %_4465)))
                                                                  (%_3000))
                                                                 (begin
                                                                   (%_3110
                                                                     %_4462
                                                                     %_4404)
                                                                   (%_4410
                                                                     (cdr %_4411)
                                                                     (cons %_4462
                                                                           %_4412)
                                                                     %_4463
                                                                     %_4464
                                                                     %_4465))))
                                                             (append
                                                               %_4415
                                                               %_4461
                                                               %_4457)
                                                             (append
                                                               %_4460
                                                               %_4414)
                                                             (append
                                                               %_4459
                                                               %_4413)
                                                             (%_3076
                                                               %_4454))))))))
                                                (%_2962
                                                  (%_2963 %_4421)
                                                  (cons %_4451
                                                        (%_2964 %_4421)))))
                                             (%_3003 '() '() '()))
                                            (if (memv %_4418 '(import-form))
                                              (%_3112
                                                %_4420
                                                %_4421
                                                %_4422
                                                (lambda (%_4446)
                                                  ((lambda (%_4447)
                                                     ((lambda (%_4448)
                                                        ((lambda (%_4449)
                                                           (if (memv %_4449
                                                                     '(module))
                                                             ((lambda (%_4450)
                                                                (begin
                                                                  (if %_4419
                                                                    (%_3035
                                                                      %_4404
                                                                      %_4419)
                                                                    (void))
                                                                  (%_3110
                                                                    %_4450
                                                                    %_4404)
                                                                  (%_4410
                                                                    (cdr %_4411)
                                                                    (cons %_4450
                                                                          %_4412)
                                                                    %_4413
                                                                    %_4414
                                                                    %_4415)))
                                                              (cdr %_4448))
                                                             (if (memv %_4449
                                                                       '(displaced-lexical))
                                                               (%_2944 %_4446)
                                                               (syntax-error
                                                                 %_4446
                                                                 '"import from unknown module"))))
                                                         (car %_4448)))
                                                      (%_2947 %_4447 %_4407)))
                                                   (%_3048 %_4446 '(())))))
                                              (if (memv %_4418 '(begin-form))
                                                ((lambda (%_4440)
                                                   (if %_4440
                                                     (apply (lambda (%_4441
                                                                     %_4442)
                                                              (%_4410
                                                                ((letrec ((%_4443
                                                                            (lambda (%_4444)
                                                                              (if (null? %_4444)
                                                                                (cdr %_4411)
                                                                                (cons (cons %_4417
                                                                                            (%_3061
                                                                                              (car %_4444)
                                                                                              %_4421))
                                                                                      (%_4443
                                                                                        (cdr %_4444)))))))
                                                                   %_4443)
                                                                 %_4442)
                                                                %_4412
                                                                %_4413
                                                                %_4414
                                                                %_4415))
                                                            %_4440)
                                                     (syntax-error %_4420)))
                                                 ($syntax-dispatch
                                                   (compile-in-annotation
                                                     %_4420
                                                     value)
                                                   '(any . each-any)))
                                                (if (memv %_4418
                                                          '(eval-when-form))
                                                  ((lambda (%_4431)
                                                     (if %_4431
                                                       (apply (lambda (%_4432
                                                                       %_4433
                                                                       %_4434)
                                                                (%_4410
                                                                  (if (memq 'eval
                                                                            (%_3065
                                                                              %_4433
                                                                              %_4421))
                                                                    ((letrec ((%_4435
                                                                                (lambda (%_4436)
                                                                                  (if (null? %_4436)
                                                                                    (cdr %_4411)
                                                                                    (cons (cons %_4417
                                                                                                (%_3061
                                                                                                  (car %_4436)
                                                                                                  %_4421))
                                                                                          (%_4435
                                                                                            (cdr %_4436)))))))
                                                                       %_4435)
                                                                     %_4434)
                                                                    (cdr %_4411))
                                                                  %_4412
                                                                  %_4413
                                                                  %_4414
                                                                  %_4415))
                                                              %_4431)
                                                       (syntax-error %_4420)))
                                                   ($syntax-dispatch
                                                     (compile-in-annotation
                                                       %_4420
                                                       value)
                                                     '(any each-any
                                                           .
                                                           each-any)))
                                                  (if (memv %_4418
                                                            '(local-syntax-form))
                                                    (%_3116
                                                      %_4419
                                                      %_4420
                                                      %_4417
                                                      %_4421
                                                      %_4422
                                                      (lambda (%_4424
                                                               %_4425
                                                               %_4426
                                                               %_4427)
                                                        (%_4410
                                                          ((letrec ((%_4428
                                                                      (lambda (%_4429)
                                                                        (if (null? %_4429)
                                                                          (cdr %_4411)
                                                                          (cons (cons %_4425
                                                                                      (%_3061
                                                                                        (car %_4429)
                                                                                        %_4426))
                                                                                (%_4428
                                                                                  (cdr %_4429)))))))
                                                             %_4428)
                                                           %_4424)
                                                          %_4412
                                                          %_4413
                                                          %_4414
                                                          %_4415)))
                                                    (%_4409
                                                      (cons (cons %_4417
                                                                  (%_3062
                                                                    %_4420
                                                                    %_4421
                                                                    %_4422))
                                                            (cdr %_4411))
                                                      %_4412
                                                      %_4413
                                                      %_4414
                                                      %_4415)))))))))))
                                (caar %_4411)
                                (cdar %_4411))))))
                  %_4410)
                %_4406
                '()
                '()
                '()
                '()))))
         (%_3108
           (lambda (%_4388 %_4389 %_4390 %_4391)
             ((lambda (%_4392)
                ((lambda (%_4393)
                   ((lambda (%_4394)
                      ((lambda (%_4395)
                         (%_3109
                           %_4393
                           %_4389
                           %_4395
                           %_4392
                           (lambda (%_4396 %_4397 %_4398 %_4399 %_4400)
                             (begin
                               (if (null? %_4396)
                                 (syntax-error
                                   %_4389
                                   '"no expressions in body")
                                 (void))
                               (%_2885
                                 '#f
                                 %_4398
                                 (map (lambda (%_4401)
                                        (%_3103
                                          (cdr %_4401)
                                          (car %_4401)
                                          '(())))
                                      %_4399)
                                 (%_2883
                                   '#f
                                   (map (lambda (%_4402)
                                          (%_3103
                                            (cdr %_4402)
                                            (car %_4402)
                                            '(())))
                                        (append %_4400 %_4396))))))))
                       (map (lambda (%_4403)
                              (cons %_4392 (%_3061 %_4403 %_4394)))
                            %_4388)))
                    (%_2962
                      (%_2963 %_4391)
                      (cons %_4393 (%_2964 %_4391)))))
                 (%_3003 '() '() '())))
              (cons '("placeholder" placeholder) %_4390))))
         (%_3107
           (lambda (%_4370 %_4371 %_4372 %_4373 %_4374 %_4375)
             (letrec ((%_4376
                        (lambda (%_4379 %_4380)
                          (if (pair? %_4379)
                            (cons (%_4376 (car %_4379) %_4380)
                                  (%_4376 (cdr %_4379) %_4380))
                            (if (%_2898 %_4379)
                              ((lambda (%_4385)
                                 ((lambda (%_4387 %_4386)
                                    (%_2897
                                      (%_2899 %_4379)
                                      (if (if (pair? %_4386)
                                            (eq? (car %_4386) '#f)
                                            '#f)
                                        (%_2962 (cdr %_4386) (cdr %_4387))
                                        (%_2962
                                          (cons %_4380 %_4386)
                                          (if %_4375
                                            (cons %_4375 (cons 'shift %_4387))
                                            (cons 'shift %_4387))))))
                                  (%_2964 %_4385)
                                  (%_2963 %_4385)))
                               (%_2900 %_4379))
                              (if (vector? %_4379)
                                ((lambda (%_4381)
                                   ((lambda (%_4382)
                                      ((letrec ((%_4383
                                                  (lambda (%_4384)
                                                    (if (= %_4384 %_4381)
                                                      %_4382
                                                      (begin
                                                        (vector-set!
                                                          %_4382
                                                          %_4384
                                                          (%_4376
                                                            (vector-ref
                                                              %_4379
                                                              %_4384)
                                                            %_4380))
                                                        (%_4383
                                                          (+ %_4384 '1)))))))
                                         %_4383)
                                       '0))
                                    (make-vector %_4381)))
                                 (vector-length %_4379))
                                (if (symbol? %_4379)
                                  (syntax-error
                                    (%_3062 %_4371 %_4373 %_4374)
                                    '"encountered raw symbol "
                                    (format '"~s" %_4379)
                                    '" in output of macro")
                                  %_4379)))))))
               (%_4376
                 ((lambda (%_4377)
                    (if (procedure? %_4377)
                      (%_4377
                        (lambda (%_4378)
                          (begin
                            (if (not (identifier? %_4378))
                              (syntax-error
                                %_4378
                                '"environment argument is not an identifier")
                              (void))
                            (%_2947 (%_3048 %_4378 '(())) %_4372))))
                      %_4377))
                  (%_4370 (%_3062 %_4371 (%_3020 %_4373) %_4374)))
                 (string '#\m)))))
         (%_3106
           (lambda (%_4343 %_4344 %_4345 %_4346 %_4347)
             ((lambda (%_4349)
                (if (if %_4349
                      (apply (lambda (%_4367 %_4368 %_4369) (%_2955 %_4368))
                             %_4349)
                      '#f)
                  (apply (lambda (%_4351 %_4352 %_4353)
                           ((lambda (%_4354)
                              ((lambda (%_4355)
                                 ((lambda (%_4356)
                                    (if (memv %_4356 '(macro!))
                                      ((lambda (%_4366 %_4365)
                                         (%_3066
                                           (%_3107
                                             (%_2927 %_4355)
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
                                                        #4(ribcage ())
                                                        #4(ribcage ())
                                                        #4(ribcage
                                                           #1(b)
                                                           #1((top))
                                                           #1("i"))
                                                        #4(ribcage ())
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
                                                           ())
                                                        #4(ribcage
                                                           (#2(import-token
                                                               *top*))
                                                           ()
                                                           ())))
                                                   %_4365
                                                   %_4366)
                                             %_4344
                                             '(())
                                             %_4346
                                             %_4347)
                                           %_4344
                                           '(())
                                           %_4346
                                           %_4347))
                                       (%_3061 %_4353 %_4345)
                                       (%_3061 %_4352 %_4345))
                                      (values
                                        'core
                                        (lambda (%_4357 %_4358 %_4359 %_4360)
                                          ((lambda (%_4362 %_4361)
                                             ((lambda (%_4363)
                                                ((lambda (%_4364)
                                                   (if (memv %_4364 '(lexical))
                                                     (if %_4360
                                                       (list 'compile-in-annotation
                                                             (list 'set!
                                                                   (%_2927
                                                                     %_4363)
                                                                   %_4361)
                                                             %_4360)
                                                       (list 'set!
                                                             (%_2927 %_4363)
                                                             %_4361))
                                                     (if (memv %_4364
                                                               '(global))
                                                       (if %_4360
                                                         (list 'compile-in-annotation
                                                               (list 'set!
                                                                     (%_2927
                                                                       %_4363)
                                                                     %_4361)
                                                               %_4360)
                                                         (list 'set!
                                                               (%_2927 %_4363)
                                                               %_4361))
                                                       (if (memv %_4364
                                                                 '(displaced-lexical))
                                                         (syntax-error
                                                           (%_3061
                                                             %_4352
                                                             %_4359)
                                                           '"identifier out of context")
                                                         (syntax-error
                                                           (%_3062
                                                             %_4357
                                                             %_4359
                                                             %_4360))))))
                                                 (%_2926 %_4363)))
                                              (%_2947 %_4362 %_4358)))
                                           (%_3048 %_4352 %_4359)
                                           (%_3103 %_4353 %_4358 %_4359)))
                                        %_4343
                                        %_4345
                                        %_4346)))
                                  (%_2926 %_4355)))
                               (%_2947 %_4354 %_4344)))
                            (%_3048 %_4352 %_4345)))
                         %_4349)
                  (syntax-error (%_3062 %_4343 %_4345 %_4346))))
              ($syntax-dispatch
                (compile-in-annotation %_4343 value)
                '(any any any)))))
         (%_3105
           (lambda (%_4329 %_4330 %_4331 %_4332 %_4333)
             ((lambda (%_4335)
                (if %_4335
                  (apply (lambda (%_4337 %_4338)
                           (if %_4333
                             (list 'compile-in-annotation
                                   (cons %_4329
                                         (map (lambda (%_4341)
                                                (%_3103 %_4341 %_4331 %_4332))
                                              %_4338))
                                   %_4333)
                             (cons %_4329
                                   (map (lambda (%_4339)
                                          (%_3103 %_4339 %_4331 %_4332))
                                        %_4338))))
                         %_4335)
                  (syntax-error (%_3062 %_4330 %_4332 %_4333))))
              ($syntax-dispatch
                (compile-in-annotation %_4330 value)
                '(any . each-any)))))
         (%_3104
           (lambda (%_4308 %_4309 %_4310 %_4311 %_4312 %_4313)
             (if (memv %_4308 '(lexical))
               (if %_4313
                 (list 'compile-in-annotation %_4309 %_4313)
                 %_4309)
               (if (memv %_4308 '(core))
                 (%_4309 %_4310 %_4311 %_4312 %_4313)
                 (if (memv %_4308 '(lexical-call))
                   (%_3105
                     (if (%_2917 (car %_4310))
                       (list 'compile-in-annotation
                             %_4309
                             (%_2917 (car %_4310)))
                       %_4309)
                     %_4310
                     %_4311
                     %_4312
                     %_4313)
                   (if (memv %_4308 '(constant))
                     (if %_4313
                       (list 'compile-in-annotation
                             (list 'quote
                                   (%_3121
                                     (%_3062 %_4310 %_4312 %_4313)
                                     '(())))
                             %_4313)
                       (list 'quote
                             (%_3121 (%_3062 %_4310 %_4312 %_4313) '(()))))
                     (if (memv %_4308 '(global))
                       (if %_4313
                         (list 'compile-in-annotation %_4309 %_4313)
                         %_4309)
                       (if (memv %_4308 '(call))
                         (%_3105
                           (%_3103 (car %_4310) %_4311 %_4312)
                           %_4310
                           %_4311
                           %_4312
                           %_4313)
                         (if (memv %_4308 '(begin-form))
                           ((lambda (%_4324)
                              (if %_4324
                                (apply (lambda (%_4325 %_4326 %_4327)
                                         (%_3063
                                           (cons %_4326 %_4327)
                                           %_4311
                                           %_4312
                                           %_4313))
                                       %_4324)
                                (syntax-error %_4310)))
                            ($syntax-dispatch
                              (compile-in-annotation %_4310 value)
                              '(any any . each-any)))
                           (if (memv %_4308 '(local-syntax-form))
                             (%_3116
                               %_4309
                               %_4310
                               %_4311
                               %_4312
                               %_4313
                               %_3063)
                             (if (memv %_4308 '(eval-when-form))
                               ((lambda (%_4316)
                                  (if %_4316
                                    (apply (lambda (%_4317
                                                    %_4318
                                                    %_4319
                                                    %_4320)
                                             (if (memq 'eval
                                                       (%_3065 %_4318 %_4312))
                                               (%_3063
                                                 (cons %_4319 %_4320)
                                                 %_4311
                                                 %_4312
                                                 %_4313)
                                               (%_3117)))
                                           %_4316)
                                    (syntax-error %_4310)))
                                ($syntax-dispatch
                                  (compile-in-annotation %_4310 value)
                                  '(any each-any any . each-any)))
                               (if (memv %_4308
                                         '(define-form
                                            define-syntax-form
                                            module-form
                                            import-form))
                                 (syntax-error
                                   (%_3062 %_4310 %_4312 %_4313)
                                   '"invalid context for definition")
                                 (if (memv %_4308 '(syntax))
                                   (syntax-error
                                     (%_3062 %_4310 %_4312 %_4313)
                                     '"reference to pattern variable outside syntax form")
                                   (if (memv %_4308 '(displaced-lexical))
                                     (%_2944 (%_3062 %_4310 %_4312 %_4313))
                                     (syntax-error
                                       (%_3062
                                         %_4310
                                         %_4312
                                         %_4313))))))))))))))))
         (%_3103
           (lambda (%_4300 %_4301 %_4302)
             (call-with-values
               (lambda () (%_3066 %_4300 %_4301 %_4302 '#f '#f))
               (lambda (%_4303 %_4304 %_4305 %_4306 %_4307)
                 (%_3104
                   %_4303
                   %_4304
                   %_4305
                   %_4301
                   %_4306
                   %_4307)))))
         (%_3102
           (lambda (%_4294 %_4295)
             (if (memq 'e %_4294)
               (begin (%_2774 (%_4295)) (%_3117))
               ((lambda (%_4296)
                  (if (memq 'r %_4294)
                    (if ((lambda (%_4298)
                           (if %_4298 %_4298 (memq 'v %_4294)))
                         (memq 'l %_4294))
                      (%_4296)
                      (%_4296))
                    (if ((lambda (%_4297)
                           (if %_4297 %_4297 (memq 'v %_4294)))
                         (memq 'l %_4294))
                      (%_4296)
                      (%_3117))))
                (if (memq 'c %_4294)
                  ((lambda (%_4299)
                     (begin (%_2774 %_4299) (lambda () %_4299)))
                   (%_4295))
                  %_4295)))))
         (%_3101
           (lambda (%_4288 %_4289)
             (if (memq 'e %_4288)
               (%_4289)
               ((lambda (%_4290)
                  (if (memq 'v %_4288)
                    (if ((lambda (%_4292)
                           (if %_4292 %_4292 (memq 'r %_4288)))
                         (memq 'l %_4288))
                      (%_4290)
                      (%_4290))
                    (if ((lambda (%_4291)
                           (if %_4291 %_4291 (memq 'r %_4288)))
                         (memq 'l %_4288))
                      (%_4290)
                      (%_3117))))
                (if (memq 'c %_4288)
                  ((lambda (%_4293)
                     (begin (%_2774 %_4293) (lambda () %_4293)))
                   (%_4289))
                  %_4289)))))
         (%_3100
           (lambda (%_4283 %_4284)
             (apply append
                    (map (lambda (%_4285)
                           (if %_4284
                             (if (memv %_4285 '(compile))
                               '(c)
                               (if (memv %_4285 '(load))
                                 '(l)
                                 (if (memv %_4285 '(visit))
                                   '(v)
                                   (if (memv %_4285 '(revisit)) '(r) '()))))
                             (if (memv %_4285 '(eval)) '(e) '())))
                         %_4283))))
         (%_3099
           (lambda (%_4278 %_4279)
             (remq '-
                   (apply append
                          (map (lambda (%_4280)
                                 ((lambda (%_4281)
                                    (map (lambda (%_4282)
                                           (cdr (assq %_4282 %_4281)))
                                         %_4278))
                                  (cdr (assq %_4280
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
                               %_4279)))))
         (%_3098
           (lambda (%_4275 %_4276)
             (list '$sc-put-cte
                   (list 'quote %_4275)
                   (list 'quote (%_2925 'do-import %_4276)))))
         (%_3097
           (lambda (%_4270 %_4271)
             ((lambda (%_4272)
                ((letrec ((%_4273
                            (lambda (%_4274)
                              (if (not (= %_4274 %_4272))
                                (begin
                                  (%_4270 (vector-ref %_4271 %_4274))
                                  (%_4273 (+ %_4274 '1)))
                                (void)))))
                   %_4273)
                 '0))
              (vector-length %_4271))))
         (%_3096
           (lambda (%_4265 %_4266)
             ((letrec ((%_4267
                         (lambda (%_4268 %_4269)
                           (if (< %_4268 '0)
                             %_4269
                             (%_4267
                               (- %_4268 '1)
                               (cons (%_4265 (vector-ref %_4266 %_4268))
                                     %_4269))))))
                %_4267)
              (- (vector-length %_4266) '1)
              '())))
         (%_3095
           (lambda (%_4176
                    %_4177
                    %_4178
                    %_4179
                    %_4180
                    %_4181
                    %_4182
                    %_4183)
             (letrec ((%_4186
                        (lambda (%_4259 %_4260)
                          ((lambda (%_4261)
                             (map (lambda (%_4262)
                                    ((lambda (%_4263)
                                       (if (not (%_3060 %_4263 %_4261))
                                         %_4262
                                         (%_3078
                                           (%_3080 %_4262)
                                           %_4263
                                           (%_3082 %_4262)
                                           (append
                                             (%_4185 %_4263)
                                             (%_3083 %_4262))
                                           (%_3084 %_4262))))
                                     (%_3081 %_4262)))
                                  %_4259))
                           (map (lambda (%_4264)
                                  (if (pair? %_4264) (car %_4264) %_4264))
                                %_4260))))
                      (%_4185
                        (lambda (%_4256)
                          ((letrec ((%_4257
                                      (lambda (%_4258)
                                        (if (null? %_4258)
                                          '()
                                          (if (if (pair? (car %_4258))
                                                (%_3051 %_4256 (caar %_4258))
                                                '#f)
                                            (%_3069 (cdar %_4258))
                                            (%_4257 (cdr %_4258)))))))
                             %_4257)
                           %_4180)))
                      (%_4184
                        (lambda (%_4253 %_4254 %_4255)
                          (begin
                            (%_3094 %_4177 %_4254)
                            (%_3093 %_4177 %_4181 %_4254)
                            (%_4183 %_4253 %_4255)))))
               ((letrec ((%_4187
                           (lambda (%_4188 %_4189 %_4190 %_4191)
                             (if (null? %_4188)
                               (%_4184 %_4190 %_4189 %_4191)
                               ((lambda (%_4193 %_4192)
                                  (call-with-values
                                    (lambda ()
                                      (%_3066 %_4192 %_4193 '(()) '#f %_4176))
                                    (lambda (%_4194
                                             %_4195
                                             %_4196
                                             %_4197
                                             %_4198)
                                      (if (memv %_4194 '(define-form))
                                        (%_3113
                                          %_4196
                                          %_4197
                                          %_4198
                                          (lambda (%_4247 %_4248 %_4249)
                                            ((lambda (%_4250)
                                               ((lambda (%_4251)
                                                  ((lambda (%_4252)
                                                     (begin
                                                       (%_3034
                                                         %_4176
                                                         %_4250
                                                         %_4251)
                                                       (%_4187
                                                         (cdr %_4188)
                                                         (cons %_4250 %_4189)
                                                         (cons (%_3078
                                                                 %_4194
                                                                 %_4250
                                                                 %_4251
                                                                 %_4252
                                                                 (cons %_4193
                                                                       (%_3061
                                                                         %_4248
                                                                         %_4249)))
                                                               %_4190)
                                                         %_4191)))
                                                   (%_4185 %_4250)))
                                                (%_2997)))
                                             (%_3061 %_4247 %_4249))))
                                        (if (memv %_4194 '(define-syntax-form))
                                          (%_3114
                                            %_4196
                                            %_4197
                                            %_4198
                                            (lambda (%_4240 %_4241 %_4242)
                                              ((lambda (%_4243)
                                                 ((lambda (%_4244)
                                                    ((lambda (%_4245)
                                                       ((lambda (%_4246)
                                                          (begin
                                                            (%_3092
                                                              %_4179
                                                              (%_2998 %_4244)
                                                              (cons 'deferred
                                                                    %_4246))
                                                            (%_3034
                                                              %_4176
                                                              %_4243
                                                              %_4244)
                                                            (%_4187
                                                              (cdr %_4188)
                                                              (cons %_4243
                                                                    %_4189)
                                                              (cons (%_3078
                                                                      %_4194
                                                                      %_4243
                                                                      %_4244
                                                                      %_4245
                                                                      %_4246)
                                                                    %_4190)
                                                              %_4191)))
                                                        (%_3103
                                                          %_4241
                                                          (%_2943 %_4193)
                                                          %_4242)))
                                                     (%_4185 %_4243)))
                                                  (%_2997)))
                                               (%_3061 %_4240 %_4242))))
                                          (if (memv %_4194 '(module-form))
                                            ((lambda (%_4227)
                                               ((lambda (%_4228)
                                                  (%_3111
                                                    %_4196
                                                    %_4197
                                                    %_4198
                                                    %_4228
                                                    (lambda (%_4229
                                                             %_4230
                                                             %_4231)
                                                      (%_3095
                                                        %_4227
                                                        (%_3062
                                                          %_4196
                                                          %_4197
                                                          %_4198)
                                                        (map (lambda (%_4232)
                                                               (cons %_4193
                                                                     %_4232))
                                                             %_4231)
                                                        %_4179
                                                        %_4230
                                                        (%_3069 %_4230)
                                                        %_4182
                                                        (lambda (%_4233 %_4234)
                                                          ((lambda (%_4235)
                                                             ((lambda (%_4236)
                                                                ((lambda (%_4237)
                                                                   (if %_4229
                                                                     ((lambda (%_4239
                                                                               %_4238)
                                                                        (begin
                                                                          (%_3092
                                                                            %_4179
                                                                            (%_2998
                                                                              %_4238)
                                                                            (%_2925
                                                                              'module
                                                                              %_4235))
                                                                          (%_3034
                                                                            %_4176
                                                                            %_4229
                                                                            %_4238)
                                                                          (%_4187
                                                                            (cdr %_4188)
                                                                            (cons %_4229
                                                                                  %_4189)
                                                                            (cons (%_3078
                                                                                    %_4194
                                                                                    %_4229
                                                                                    %_4238
                                                                                    %_4239
                                                                                    %_4230)
                                                                                  %_4236)
                                                                            %_4237)))
                                                                      (%_4185
                                                                        %_4229)
                                                                      (%_2997))
                                                                     (begin
                                                                       (%_3110
                                                                         %_4235
                                                                         %_4176)
                                                                       (%_4187
                                                                         (cdr %_4188)
                                                                         (cons %_4235
                                                                               %_4189)
                                                                         %_4236
                                                                         %_4237))))
                                                                 (append
                                                                   %_4191
                                                                   %_4234)))
                                                              (append
                                                                (if %_4229
                                                                  %_4233
                                                                  (%_4186
                                                                    %_4233
                                                                    %_4230))
                                                                %_4190)))
                                                           (%_3076
                                                             %_4230)))))))
                                                (%_2962
                                                  (%_2963 %_4197)
                                                  (cons %_4227
                                                        (%_2964 %_4197)))))
                                             (%_3003 '() '() '()))
                                            (if (memv %_4194 '(import-form))
                                              (%_3112
                                                %_4196
                                                %_4197
                                                %_4198
                                                (lambda (%_4222)
                                                  ((lambda (%_4223)
                                                     ((lambda (%_4224)
                                                        ((lambda (%_4225)
                                                           (if (memv %_4225
                                                                     '(module))
                                                             ((lambda (%_4226)
                                                                (begin
                                                                  (if %_4195
                                                                    (%_3035
                                                                      %_4176
                                                                      %_4195)
                                                                    (void))
                                                                  (%_3110
                                                                    %_4226
                                                                    %_4176)
                                                                  (%_4187
                                                                    (cdr %_4188)
                                                                    (cons %_4226
                                                                          %_4189)
                                                                    (%_4186
                                                                      %_4190
                                                                      (vector->list
                                                                        (%_3072
                                                                          %_4226)))
                                                                    %_4191)))
                                                              (%_2927 %_4224))
                                                             (if (memv %_4225
                                                                       '(displaced-lexical))
                                                               (%_2944 %_4222)
                                                               (syntax-error
                                                                 %_4222
                                                                 '"import from unknown module"))))
                                                         (%_2926 %_4224)))
                                                      (%_2947 %_4223 %_4179)))
                                                   (%_3048 %_4222 '(())))))
                                              (if (memv %_4194 '(begin-form))
                                                ((lambda (%_4216)
                                                   (if %_4216
                                                     (apply (lambda (%_4217
                                                                     %_4218)
                                                              (%_4187
                                                                ((letrec ((%_4219
                                                                            (lambda (%_4220)
                                                                              (if (null? %_4220)
                                                                                (cdr %_4188)
                                                                                (cons (cons %_4193
                                                                                            (%_3061
                                                                                              (car %_4220)
                                                                                              %_4197))
                                                                                      (%_4219
                                                                                        (cdr %_4220)))))))
                                                                   %_4219)
                                                                 %_4218)
                                                                %_4189
                                                                %_4190
                                                                %_4191))
                                                            %_4216)
                                                     (syntax-error %_4196)))
                                                 ($syntax-dispatch
                                                   (compile-in-annotation
                                                     %_4196
                                                     value)
                                                   '(any . each-any)))
                                                (if (memv %_4194
                                                          '(eval-when-form))
                                                  ((lambda (%_4207)
                                                     (if %_4207
                                                       (apply (lambda (%_4208
                                                                       %_4209
                                                                       %_4210)
                                                                (%_4187
                                                                  (if (memq 'eval
                                                                            (%_3065
                                                                              %_4209
                                                                              %_4197))
                                                                    ((letrec ((%_4211
                                                                                (lambda (%_4212)
                                                                                  (if (null? %_4212)
                                                                                    (cdr %_4188)
                                                                                    (cons (cons %_4193
                                                                                                (%_3061
                                                                                                  (car %_4212)
                                                                                                  %_4197))
                                                                                          (%_4211
                                                                                            (cdr %_4212)))))))
                                                                       %_4211)
                                                                     %_4210)
                                                                    (cdr %_4188))
                                                                  %_4189
                                                                  %_4190
                                                                  %_4191))
                                                              %_4207)
                                                       (syntax-error %_4196)))
                                                   ($syntax-dispatch
                                                     (compile-in-annotation
                                                       %_4196
                                                       value)
                                                     '(any each-any
                                                           .
                                                           each-any)))
                                                  (if (memv %_4194
                                                            '(local-syntax-form))
                                                    (%_3116
                                                      %_4195
                                                      %_4196
                                                      %_4193
                                                      %_4197
                                                      %_4198
                                                      (lambda (%_4200
                                                               %_4201
                                                               %_4202
                                                               %_4203)
                                                        (%_4187
                                                          ((letrec ((%_4204
                                                                      (lambda (%_4205)
                                                                        (if (null? %_4205)
                                                                          (cdr %_4188)
                                                                          (cons (cons %_4201
                                                                                      (%_3061
                                                                                        (car %_4205)
                                                                                        %_4202))
                                                                                (%_4204
                                                                                  (cdr %_4205)))))))
                                                             %_4204)
                                                           %_4200)
                                                          %_4189
                                                          %_4190
                                                          %_4191)))
                                                    (%_4184
                                                      %_4190
                                                      %_4189
                                                      (append
                                                        %_4191
                                                        (cons (cons %_4193
                                                                    (%_3062
                                                                      %_4196
                                                                      %_4197
                                                                      %_4198))
                                                              (cdr %_4188))))))))))))))
                                (caar %_4188)
                                (cdar %_4188))))))
                  %_4187)
                %_4178
                '()
                '()
                '()))))
         (%_3094
           (lambda (%_4132 %_4133)
             (letrec ((%_4137
                        (lambda (%_4168 %_4169 %_4170)
                          ((lambda (%_4171)
                             (if %_4171
                               (if (%_3038
                                     ((lambda (%_4175)
                                        (if (annotation? %_4175)
                                          (annotation-expression %_4175)
                                          %_4175))
                                      (if (%_2898 %_4168)
                                        (%_2899 %_4168)
                                        %_4168))
                                     %_4171
                                     (if (symbol? %_4168)
                                       (%_2963 '((top)))
                                       (%_2963 (%_2900 %_4168))))
                                 (cons %_4168 %_4170)
                                 %_4170)
                               (%_4135
                                 (%_3072 %_4169)
                                 (lambda (%_4172 %_4173)
                                   (if (%_4134 %_4172 %_4168)
                                     (cons %_4172 %_4173)
                                     %_4173))
                                 %_4170)))
                           (%_3073 %_4169))))
                      (%_4136
                        (lambda (%_4159 %_4160 %_4161)
                          (if (%_3071 %_4159)
                            (if (%_3071 %_4160)
                              (call-with-values
                                (lambda ()
                                  ((lambda (%_4163 %_4162)
                                     (if (> (vector-length %_4162)
                                            (vector-length %_4163))
                                       (values %_4159 %_4163)
                                       (values %_4160 %_4162)))
                                   (%_3072 %_4160)
                                   (%_3072 %_4159)))
                                (lambda (%_4164 %_4165)
                                  (%_4135
                                    %_4165
                                    (lambda (%_4166 %_4167)
                                      (%_4137 %_4166 %_4164 %_4167))
                                    %_4161)))
                              (%_4137 %_4160 %_4159 %_4161))
                            (if (%_3071 %_4160)
                              (%_4137 %_4159 %_4160 %_4161)
                              (if (%_4134 %_4159 %_4160)
                                (cons %_4159 %_4161)
                                %_4161)))))
                      (%_4135
                        (lambda (%_4152 %_4153 %_4154)
                          ((lambda (%_4155)
                             ((letrec ((%_4156
                                         (lambda (%_4157 %_4158)
                                           (if (= %_4157 %_4155)
                                             %_4158
                                             (%_4156
                                               (+ %_4157 '1)
                                               (%_4153
                                                 (vector-ref %_4152 %_4157)
                                                 %_4158))))))
                                %_4156)
                              '0
                              %_4154))
                           (vector-length %_4152))))
                      (%_4134
                        (lambda (%_4146 %_4147)
                          (if (symbol? %_4146)
                            (if (symbol? %_4147)
                              (eq? %_4146 %_4147)
                              (if (eq? %_4146
                                       ((lambda (%_4151)
                                          (if (annotation? %_4151)
                                            (annotation-expression %_4151)
                                            %_4151))
                                        (if (%_2898 %_4147)
                                          (%_2899 %_4147)
                                          %_4147)))
                                (%_3044
                                  (%_2963 (%_2900 %_4147))
                                  (%_2963 '((top))))
                                '#f))
                            (if (symbol? %_4147)
                              (if (eq? %_4147
                                       ((lambda (%_4149)
                                          (if (annotation? %_4149)
                                            (annotation-expression %_4149)
                                            %_4149))
                                        (if (%_2898 %_4146)
                                          (%_2899 %_4146)
                                          %_4146)))
                                (%_3044
                                  (%_2963 (%_2900 %_4146))
                                  (%_2963 '((top))))
                                '#f)
                              (%_3051 %_4146 %_4147))))))
               (if (not (null? %_4133))
                 ((letrec ((%_4138
                             (lambda (%_4139 %_4140 %_4141)
                               (if (null? %_4140)
                                 (if (not (null? %_4141))
                                   ((lambda (%_4145)
                                      (syntax-error
                                        %_4132
                                        '"duplicate definition for "
                                        (symbol->string (car %_4145))
                                        '" in"))
                                    (syntax-object->datum %_4141))
                                   (void))
                                 ((letrec ((%_4142
                                             (lambda (%_4143 %_4144)
                                               (if (null? %_4143)
                                                 (%_4138
                                                   (car %_4140)
                                                   (cdr %_4140)
                                                   %_4144)
                                                 (%_4142
                                                   (cdr %_4143)
                                                   (%_4136
                                                     %_4139
                                                     (car %_4143)
                                                     %_4144))))))
                                    %_4142)
                                  %_4140
                                  %_4141)))))
                    %_4138)
                  (car %_4133)
                  (cdr %_4133)
                  '())
                 (void)))))
         (%_3093
           (lambda (%_4113 %_4114 %_4115)
             (letrec ((%_4116
                        (lambda (%_4122 %_4123)
                          (ormap (lambda (%_4124)
                                   (if (%_3071 %_4124)
                                     ((lambda (%_4125)
                                        (if %_4125
                                          (%_3038
                                            ((lambda (%_4131)
                                               (if (annotation? %_4131)
                                                 (annotation-expression %_4131)
                                                 %_4131))
                                             (if (%_2898 %_4122)
                                               (%_2899 %_4122)
                                               %_4122))
                                            %_4125
                                            (%_2963 (%_2900 %_4122)))
                                          ((lambda (%_4126)
                                             ((letrec ((%_4127
                                                         (lambda (%_4128)
                                                           (if (>= %_4128 '0)
                                                             ((lambda (%_4129)
                                                                (if %_4129
                                                                  %_4129
                                                                  (%_4127
                                                                    (- %_4128
                                                                       '1))))
                                                              (%_3051
                                                                %_4122
                                                                (vector-ref
                                                                  %_4126
                                                                  %_4128)))
                                                             '#f))))
                                                %_4127)
                                              (- (vector-length %_4126) '1)))
                                           (%_3072 %_4124))))
                                      (%_3073 %_4124))
                                     (%_3051 %_4122 %_4124)))
                                 %_4123))))
               ((letrec ((%_4117
                           (lambda (%_4118 %_4119)
                             (if (null? %_4118)
                               (if (not (null? %_4119))
                                 (syntax-error
                                   %_4119
                                   '"missing definition for export(s)")
                                 (void))
                               ((lambda (%_4121 %_4120)
                                  (if (%_4116 %_4120 %_4115)
                                    (%_4117 %_4121 %_4119)
                                    (%_4117 %_4121 (cons %_4120 %_4119))))
                                (cdr %_4118)
                                (car %_4118))))))
                  %_4117)
                %_4114
                '()))))
         (%_3092
           (lambda (%_4110 %_4111 %_4112)
             (set-cdr!
               %_4110
               (%_2940 %_4111 %_4112 (cdr %_4110)))))
         (%_3091
           (lambda (%_4108 %_4109)
             (if (null? %_4108)
               '()
               (if (%_3060 (car %_4108) %_4109)
                 (%_3091 (cdr %_4108) %_4109)
                 (cons (car %_4108) (%_3091 (cdr %_4108) %_4109))))))
         (%_3090
           (lambda (%_4034
                    %_4035
                    %_4036
                    %_4037
                    %_4038
                    %_4039
                    %_4040
                    %_4041
                    %_4042
                    %_4043)
             ((lambda (%_4044)
                (%_3095
                  %_4036
                  (%_3062 %_4034 %_4037 %_4038)
                  (map (lambda (%_4045) (cons %_4035 %_4045))
                       %_4043)
                  %_4035
                  %_4042
                  %_4044
                  %_4039
                  (lambda (%_4046 %_4047)
                    ((letrec ((%_4048
                                (lambda (%_4049 %_4050 %_4051 %_4052 %_4053)
                                  (if (null? %_4049)
                                    ((letrec ((%_4075
                                                (lambda (%_4076 %_4077 %_4078)
                                                  (if (null? %_4076)
                                                    ((lambda (%_4084
                                                              %_4083
                                                              %_4082)
                                                       (begin
                                                         (for-each
                                                           (lambda (%_4085)
                                                             (apply (lambda (%_4086
                                                                             %_4087
                                                                             %_4088
                                                                             %_4089)
                                                                      (if %_4087
                                                                        (%_2999
                                                                          %_4087
                                                                          %_4088)
                                                                        (void)))
                                                                    %_4085))
                                                           %_4053)
                                                         (%_2883
                                                           '#f
                                                           (list (%_3102
                                                                   %_4039
                                                                   (lambda ()
                                                                     (if (null? %_4053)
                                                                       (%_3117)
                                                                       (%_2883
                                                                         '#f
                                                                         (map (lambda (%_4090)
                                                                                (apply (lambda (%_4091
                                                                                                %_4092
                                                                                                %_4093
                                                                                                %_4094)
                                                                                         (list '$sc-put-cte
                                                                                               (list 'quote
                                                                                                     %_4093)
                                                                                               (if (eq? %_4091
                                                                                                        'define-syntax-form)
                                                                                                 %_4094
                                                                                                 (list 'quote
                                                                                                       (%_2925
                                                                                                         'module
                                                                                                         (%_3077
                                                                                                           %_4094
                                                                                                           %_4093))))))
                                                                                       %_4090))
                                                                              %_4053)))))
                                                                 (%_3102
                                                                   %_4039
                                                                   (lambda ()
                                                                     ((lambda (%_4095)
                                                                        ((lambda (%_4096)
                                                                           ((lambda (%_4097)
                                                                              (if %_4095
                                                                                (list '$sc-put-cte
                                                                                      (list 'quote
                                                                                            (if (%_3044
                                                                                                  (%_2963
                                                                                                    (%_2900
                                                                                                      %_4041))
                                                                                                  (%_2963
                                                                                                    '((top))))
                                                                                              %_4095
                                                                                              ((lambda (%_4099)
                                                                                                 (%_2897
                                                                                                   %_4095
                                                                                                   (%_2962
                                                                                                     %_4099
                                                                                                     (list (%_3003
                                                                                                             (vector
                                                                                                               %_4095)
                                                                                                             (vector
                                                                                                               %_4099)
                                                                                                             (vector
                                                                                                               (%_2784
                                                                                                                 %_4095)))))))
                                                                                               (%_2963
                                                                                                 (%_2900
                                                                                                   %_4041)))))
                                                                                      %_4097)
                                                                                ((lambda (%_4098)
                                                                                   (%_2883
                                                                                     '#f
                                                                                     (list (list '$sc-put-cte
                                                                                                 (list 'quote
                                                                                                       %_4098)
                                                                                                 %_4097)
                                                                                           (%_3098
                                                                                             %_4098
                                                                                             %_4096))))
                                                                                 (%_2784
                                                                                   'tmp))))
                                                                            (list 'quote
                                                                                  (%_2925
                                                                                    'module
                                                                                    (%_3077
                                                                                      %_4042
                                                                                      %_4096)))))
                                                                         (%_2784
                                                                           %_4095)))
                                                                      (if %_4041
                                                                        ((lambda (%_4101)
                                                                           (if (annotation?
                                                                                 %_4101)
                                                                             (annotation-expression
                                                                               %_4101)
                                                                             %_4101))
                                                                         (if (%_2898
                                                                               %_4041)
                                                                           (%_2899
                                                                             %_4041)
                                                                           %_4041))
                                                                        '#f))))
                                                                 (if (null? %_4051)
                                                                   (%_3117)
                                                                   (%_2883
                                                                     '#f
                                                                     (map (lambda (%_4102)
                                                                            (list 'define
                                                                                  %_4102
                                                                                  (%_3117)))
                                                                          %_4051)))
                                                                 (%_3101
                                                                   %_4040
                                                                   (lambda ()
                                                                     (%_2885
                                                                       '#f
                                                                       %_4077
                                                                       %_4083
                                                                       (%_2883
                                                                         '#f
                                                                         (list (if (null? %_4051)
                                                                                 (%_3117)
                                                                                 (%_2883
                                                                                   '#f
                                                                                   (map (lambda (%_4103
                                                                                                 %_4104)
                                                                                          (list 'set!
                                                                                                %_4103
                                                                                                %_4104))
                                                                                        %_4051
                                                                                        %_4082)))
                                                                               (if (null? %_4084)
                                                                                 (%_3117)
                                                                                 (%_2883
                                                                                   '#f
                                                                                   %_4084)))))))
                                                                 (%_3117)))))
                                                     (map (lambda (%_4107)
                                                            (%_3103
                                                              (cdr %_4107)
                                                              (car %_4107)
                                                              '(())))
                                                          %_4047)
                                                     (map (lambda (%_4106)
                                                            (%_3103
                                                              (cdr %_4106)
                                                              (car %_4106)
                                                              '(())))
                                                          %_4078)
                                                     (map (lambda (%_4105)
                                                            (%_3103
                                                              (cdr %_4105)
                                                              (car %_4105)
                                                              '(())))
                                                          %_4052))
                                                    ((lambda (%_4079)
                                                       ((lambda (%_4080)
                                                          (if (memv %_4080
                                                                    '(define-form))
                                                            ((lambda (%_4081)
                                                               (begin
                                                                 (%_3092
                                                                   %_4035
                                                                   (%_2998
                                                                     (%_3082
                                                                       %_4079))
                                                                   (%_2925
                                                                     'lexical
                                                                     %_4081))
                                                                 (%_4075
                                                                   (cdr %_4076)
                                                                   (cons %_4081
                                                                         %_4077)
                                                                   (cons (%_3084
                                                                           %_4079)
                                                                         %_4078))))
                                                             (%_3122
                                                               (%_3081
                                                                 %_4079)))
                                                            (if (memv %_4080
                                                                      '(define-syntax-form
                                                                         module-form))
                                                              (%_4075
                                                                (cdr %_4076)
                                                                %_4077
                                                                %_4078)
                                                              (error 'sc-expand-internal
                                                                     '"unexpected module binding type"))))
                                                        (%_3080 %_4079)))
                                                     (car %_4076))))))
                                       %_4075)
                                     %_4050
                                     '()
                                     '())
                                    ((lambda (%_4055 %_4054)
                                       (letrec ((%_4056
                                                  (lambda (%_4068
                                                           %_4069
                                                           %_4070
                                                           %_4071)
                                                    ((letrec ((%_4072
                                                                (lambda (%_4073
                                                                         %_4074)
                                                                  (if (null? %_4073)
                                                                    (%_4071)
                                                                    (if (%_3049
                                                                          (%_3081
                                                                            (car %_4073))
                                                                          %_4068)
                                                                      (%_4070
                                                                        (car %_4073)
                                                                        (%_3041
                                                                          (reverse
                                                                            %_4074)
                                                                          (cdr %_4073)))
                                                                      (%_4072
                                                                        (cdr %_4073)
                                                                        (cons (car %_4073)
                                                                              %_4074)))))))
                                                       %_4072)
                                                     %_4069
                                                     '()))))
                                         (%_4056
                                           %_4054
                                           %_4050
                                           (lambda (%_4057 %_4058)
                                             ((lambda (%_4061 %_4060 %_4059)
                                                ((lambda (%_4063 %_4062)
                                                   (if (memv %_4059
                                                             '(define-form))
                                                     (begin
                                                       (%_2999 %_4060 %_4063)
                                                       (%_4048
                                                         %_4062
                                                         %_4058
                                                         (cons %_4063 %_4051)
                                                         (cons (%_3084 %_4057)
                                                               %_4052)
                                                         %_4053))
                                                     (if (memv %_4059
                                                               '(define-syntax-form))
                                                       (%_4048
                                                         %_4062
                                                         %_4058
                                                         %_4051
                                                         %_4052
                                                         (cons (list %_4059
                                                                     %_4060
                                                                     %_4063
                                                                     (%_3084
                                                                       %_4057))
                                                               %_4053))
                                                       (if (memv %_4059
                                                                 '(module-form))
                                                         ((lambda (%_4065)
                                                            (%_4048
                                                              (append
                                                                (%_3069 %_4065)
                                                                %_4062)
                                                              %_4058
                                                              %_4051
                                                              %_4052
                                                              (cons (list %_4059
                                                                          %_4060
                                                                          %_4063
                                                                          %_4065)
                                                                    %_4053)))
                                                          (%_3084 %_4057))
                                                         (error 'sc-expand-internal
                                                                '"unexpected module binding type")))))
                                                 (%_2784
                                                   ((lambda (%_4067)
                                                      (if (annotation? %_4067)
                                                        (annotation-expression
                                                          %_4067)
                                                        %_4067))
                                                    (if (%_2898 %_4054)
                                                      (%_2899 %_4054)
                                                      %_4054)))
                                                 (append %_4061 %_4055)))
                                              (%_3083 %_4057)
                                              (%_3082 %_4057)
                                              (%_3080 %_4057)))
                                           (lambda ()
                                             (%_4048
                                               %_4055
                                               %_4050
                                               %_4051
                                               %_4052
                                               %_4053)))))
                                     (cdr %_4049)
                                     (car %_4049))))))
                       %_4048)
                     %_4044
                     %_4046
                     '()
                     '()
                     '()))))
              (%_3069 %_4042))))
         (%_3089
           (lambda (%_4032 %_4033)
             (vector-set! %_4032 '5 %_4033)))
         (%_3088
           (lambda (%_4030 %_4031)
             (vector-set! %_4030 '4 %_4031)))
         (%_3087
           (lambda (%_4028 %_4029)
             (vector-set! %_4028 '3 %_4029)))
         (%_3086
           (lambda (%_4026 %_4027)
             (vector-set! %_4026 '2 %_4027)))
         (%_3085
           (lambda (%_4024 %_4025)
             (vector-set! %_4024 '1 %_4025)))
         (%_3084 (lambda (%_4023) (vector-ref %_4023 '5)))
         (%_3083 (lambda (%_4022) (vector-ref %_4022 '4)))
         (%_3082 (lambda (%_4021) (vector-ref %_4021 '3)))
         (%_3081 (lambda (%_4020) (vector-ref %_4020 '2)))
         (%_3080 (lambda (%_4019) (vector-ref %_4019 '1)))
         (%_3079
           (lambda (%_4018)
             (if (vector? %_4018)
               (if (= (vector-length %_4018) '6)
                 (eq? (vector-ref %_4018 '0) 'module-binding)
                 '#f)
               '#f)))
         (%_3078
           (lambda (%_4013 %_4014 %_4015 %_4016 %_4017)
             (vector
               'module-binding
               %_4013
               %_4014
               %_4015
               %_4016
               %_4017)))
         (%_3077
           (lambda (%_4010 %_4011)
             (%_3070
               (list->vector
                 (map (lambda (%_4012)
                        (%_3040 (if (pair? %_4012) (car %_4012) %_4012)))
                      %_4010))
               %_4011)))
         (%_3076
           (lambda (%_4008)
             (%_3070
               (list->vector
                 (map (lambda (%_4009)
                        (if (pair? %_4009) (car %_4009) %_4009))
                      %_4008))
               '#f)))
         (%_3075
           (lambda (%_4006 %_4007)
             (vector-set! %_4006 '2 %_4007)))
         (%_3074
           (lambda (%_4004 %_4005)
             (vector-set! %_4004 '1 %_4005)))
         (%_3073 (lambda (%_4003) (vector-ref %_4003 '2)))
         (%_3072 (lambda (%_4002) (vector-ref %_4002 '1)))
         (%_3071
           (lambda (%_4001)
             (if (vector? %_4001)
               (if (= (vector-length %_4001) '3)
                 (eq? (vector-ref %_4001 '0) 'interface)
                 '#f)
               '#f)))
         (%_3070
           (lambda (%_3999 %_4000)
             (vector 'interface %_3999 %_4000)))
         (%_3069
           (lambda (%_3995)
             ((letrec ((%_3996
                         (lambda (%_3997 %_3998)
                           (if (null? %_3997)
                             %_3998
                             (%_3996
                               (cdr %_3997)
                               (if (pair? (car %_3997))
                                 (%_3996 (car %_3997) %_3998)
                                 (cons (car %_3997) %_3998)))))))
                %_3996)
              %_3995
              '())))
         (%_3068
           (lambda (%_3925 %_3926 %_3927 %_3928 %_3929 %_3930)
             (call-with-values
               (lambda ()
                 (%_3066 %_3925 %_3926 %_3927 '#f %_3930))
               (lambda (%_3931 %_3932 %_3933 %_3934 %_3935)
                 (if (memv %_3931 '(begin-form))
                   ((lambda (%_3988)
                      (if %_3988
                        (apply (lambda (%_3994) (%_3117)) %_3988)
                        ((lambda (%_3989)
                           (if %_3989
                             (apply (lambda (%_3990 %_3991 %_3992)
                                      (%_3064
                                        (cons %_3991 %_3992)
                                        %_3926
                                        %_3934
                                        %_3935
                                        %_3928
                                        %_3929
                                        %_3930))
                                    %_3989)
                             (syntax-error %_3933)))
                         ($syntax-dispatch
                           (compile-in-annotation %_3933 value)
                           '(any any . each-any)))))
                    ($syntax-dispatch
                      (compile-in-annotation %_3933 value)
                      '(any)))
                   (if (memv %_3931 '(local-syntax-form))
                     (%_3116
                       %_3932
                       %_3933
                       %_3926
                       %_3934
                       %_3935
                       (lambda (%_3983 %_3984 %_3985 %_3986)
                         (%_3064
                           %_3983
                           %_3984
                           %_3985
                           %_3986
                           %_3928
                           %_3929
                           %_3930)))
                     (if (memv %_3931 '(eval-when-form))
                       ((lambda (%_3972)
                          (if %_3972
                            (apply (lambda (%_3973 %_3974 %_3975 %_3976)
                                     ((lambda (%_3978 %_3977)
                                        ((lambda (%_3980 %_3979)
                                           (if (if (null? %_3979)
                                                 (null? %_3980)
                                                 '#f)
                                             (%_3117)
                                             (%_3064
                                               %_3978
                                               %_3926
                                               %_3934
                                               %_3935
                                               %_3979
                                               %_3980
                                               %_3930)))
                                         (%_3099 %_3977 %_3929)
                                         (%_3099 %_3977 %_3928)))
                                      (cons %_3975 %_3976)
                                      (%_3065 %_3974 %_3934)))
                                   %_3972)
                            (syntax-error %_3933)))
                        ($syntax-dispatch
                          (compile-in-annotation %_3933 value)
                          '(any each-any any . each-any)))
                       (if (memv %_3931 '(define-syntax-form))
                         (%_3114
                           %_3933
                           %_3934
                           %_3935
                           (lambda (%_3960 %_3961 %_3962)
                             ((lambda (%_3963)
                                (begin
                                  ((lambda (%_3964)
                                     ((lambda (%_3965)
                                        ((lambda (%_3966)
                                           (if (memv %_3966
                                                     '(displaced-lexical))
                                             (%_2944 %_3963)
                                             (void)))
                                         (%_2926 %_3965)))
                                      (%_2947 %_3964 %_3926)))
                                   (%_3048 %_3963 '(())))
                                  (%_3102
                                    %_3928
                                    (lambda ()
                                      (list '$sc-put-cte
                                            (list 'quote
                                                  ((lambda (%_3967)
                                                     (if (%_3044
                                                           (%_2963
                                                             (%_2900 %_3963))
                                                           (%_2963 '((top))))
                                                       %_3967
                                                       ((lambda (%_3968)
                                                          (%_2897
                                                            %_3967
                                                            (%_2962
                                                              %_3968
                                                              (list (%_3003
                                                                      (vector
                                                                        %_3967)
                                                                      (vector
                                                                        %_3968)
                                                                      (vector
                                                                        (%_2784
                                                                          %_3967)))))))
                                                        (%_2963
                                                          (%_2900 %_3963)))))
                                                   ((lambda (%_3970)
                                                      (if (annotation? %_3970)
                                                        (annotation-expression
                                                          %_3970)
                                                        %_3970))
                                                    (if (%_2898 %_3963)
                                                      (%_2899 %_3963)
                                                      %_3963))))
                                            (%_3103
                                              %_3961
                                              (%_2943 %_3926)
                                              %_3962))))))
                              (%_3061 %_3960 %_3962))))
                         (if (memv %_3931 '(define-form))
                           (%_3113
                             %_3933
                             %_3934
                             %_3935
                             (lambda (%_3948 %_3949 %_3950)
                               ((lambda (%_3951)
                                  (begin
                                    ((lambda (%_3952)
                                       ((lambda (%_3953)
                                          ((lambda (%_3954)
                                             (if (memv %_3954
                                                       '(displaced-lexical))
                                               (%_2944 %_3951)
                                               (void)))
                                           (%_2926 %_3953)))
                                        (%_2947 %_3952 %_3926)))
                                     (%_3048 %_3951 '(())))
                                    ((lambda (%_3955)
                                       ((lambda (%_3956)
                                          (%_2883
                                            '#f
                                            (list (%_3102
                                                    %_3928
                                                    (lambda ()
                                                      (list '$sc-put-cte
                                                            (list 'quote
                                                                  (if (eq? %_3955
                                                                           %_3956)
                                                                    %_3955
                                                                    ((lambda (%_3957)
                                                                       (%_2897
                                                                         %_3955
                                                                         (%_2962
                                                                           %_3957
                                                                           (list (%_3003
                                                                                   (vector
                                                                                     %_3955)
                                                                                   (vector
                                                                                     %_3957)
                                                                                   (vector
                                                                                     %_3956))))))
                                                                     (%_2963
                                                                       (%_2900
                                                                         %_3951)))))
                                                            (list 'quote
                                                                  (%_2925
                                                                    'global
                                                                    %_3956)))))
                                                  (%_3101
                                                    %_3929
                                                    (lambda ()
                                                      (if %_3935
                                                        (list 'compile-in-annotation
                                                              (list 'define
                                                                    %_3956
                                                                    (%_3103
                                                                      %_3949
                                                                      %_3926
                                                                      %_3950))
                                                              %_3935)
                                                        (list 'define
                                                              %_3956
                                                              (%_3103
                                                                %_3949
                                                                %_3926
                                                                %_3950))))))))
                                        (if (%_3044
                                              (%_2963 (%_2900 %_3951))
                                              (%_2963 '((top))))
                                          %_3955
                                          (%_2784 %_3955))))
                                     ((lambda (%_3959)
                                        (if (annotation? %_3959)
                                          (annotation-expression %_3959)
                                          %_3959))
                                      (if (%_2898 %_3951)
                                        (%_2899 %_3951)
                                        %_3951)))))
                                (%_3061 %_3948 %_3950))))
                           (if (memv %_3931 '(module-form))
                             ((lambda (%_3941 %_3940)
                                (%_3111
                                  %_3933
                                  %_3934
                                  %_3935
                                  (%_2962
                                    (%_2963 %_3934)
                                    (cons %_3941 (%_2964 %_3934)))
                                  (lambda (%_3942 %_3943 %_3944)
                                    (if %_3942
                                      (begin
                                        ((lambda (%_3945)
                                           ((lambda (%_3946)
                                              ((lambda (%_3947)
                                                 (if (memv %_3947
                                                           '(displaced-lexical))
                                                   (%_2944
                                                     (%_3061 %_3942 %_3934))
                                                   (void)))
                                               (%_2926 %_3946)))
                                            (%_2947 %_3945 %_3940)))
                                         (%_3048 %_3942 '(())))
                                        (%_3090
                                          %_3933
                                          %_3940
                                          %_3941
                                          %_3934
                                          %_3935
                                          %_3928
                                          %_3929
                                          %_3942
                                          %_3943
                                          %_3944))
                                      (%_3090
                                        %_3933
                                        %_3940
                                        %_3941
                                        %_3934
                                        %_3935
                                        %_3928
                                        %_3929
                                        '#f
                                        %_3943
                                        %_3944)))))
                              (%_3003 '() '() '())
                              (cons '("top-level module placeholder"
                                      placeholder)
                                    %_3926))
                             (if (memv %_3931 '(import-form))
                               (%_3112
                                 %_3933
                                 %_3934
                                 %_3935
                                 (lambda (%_3937)
                                   (%_3102
                                     %_3928
                                     (lambda ()
                                       (begin
                                         (if %_3932
                                           (syntax-error
                                             (%_3062 %_3933 %_3934 %_3935)
                                             '"not valid at top-level")
                                           (void))
                                         ((lambda (%_3938)
                                            ((lambda (%_3939)
                                               (if (memv %_3939 '(module))
                                                 (%_3098
                                                   %_3937
                                                   (%_3073 (%_2927 %_3938)))
                                                 (if (memv %_3939
                                                           '(displaced-lexical))
                                                   (%_2944 %_3937)
                                                   (syntax-error
                                                     %_3937
                                                     '"import from unknown module"))))
                                             (%_2926 %_3938)))
                                          (%_2947
                                            (%_3048 %_3937 '(()))
                                            '())))))))
                               (%_3101
                                 %_3929
                                 (lambda ()
                                   (%_3104
                                     %_3931
                                     %_3932
                                     %_3933
                                     %_3926
                                     %_3934
                                     %_3935))))))))))))))
         (%_3067
           (lambda (%_3916 %_3917 %_3918 %_3919)
             (call-with-values
               (lambda ()
                 (%_3066 %_3916 %_3917 %_3918 '#f %_3919))
               (lambda (%_3920 %_3921 %_3922 %_3923 %_3924)
                 (%_3104
                   %_3920
                   %_3921
                   %_3922
                   %_3917
                   %_3923
                   %_3924)))))
         (%_3066
           (lambda (%_3900 %_3901 %_3902 %_3903 %_3904)
             (if (symbol? %_3900)
               ((lambda (%_3912)
                  ((lambda (%_3913)
                     ((lambda (%_3914)
                        (if (memv %_3914 '(lexical))
                          (values
                            %_3914
                            (%_2927 %_3913)
                            %_3900
                            %_3902
                            %_3903)
                          (if (memv %_3914 '(global))
                            (values
                              %_3914
                              (%_2927 %_3913)
                              %_3900
                              %_3902
                              %_3903)
                            (if (memv %_3914 '(macro macro!))
                              (%_3066
                                (%_3107
                                  (%_2927 %_3913)
                                  %_3900
                                  %_3901
                                  %_3902
                                  %_3903
                                  %_3904)
                                %_3901
                                '(())
                                '#f
                                %_3904)
                              (values
                                %_3914
                                (%_2927 %_3913)
                                %_3900
                                %_3902
                                %_3903)))))
                      (%_2926 %_3913)))
                   (%_2947 %_3912 %_3901)))
                (%_3048 %_3900 %_3902))
               (if (pair? %_3900)
                 ((lambda (%_3907)
                    (if (%_2955 %_3907)
                      ((lambda (%_3908)
                         ((lambda (%_3909)
                            ((lambda (%_3910)
                               (if (memv %_3910 '(lexical))
                                 (values
                                   'lexical-call
                                   (%_2927 %_3909)
                                   %_3900
                                   %_3902
                                   %_3903)
                                 (if (memv %_3910 '(macro macro!))
                                   (%_3066
                                     (%_3107
                                       (%_2927 %_3909)
                                       %_3900
                                       %_3901
                                       %_3902
                                       %_3903
                                       %_3904)
                                     %_3901
                                     '(())
                                     '#f
                                     %_3904)
                                   (if (memv %_3910 '(core))
                                     (values
                                       %_3910
                                       (%_2927 %_3909)
                                       %_3900
                                       %_3902
                                       %_3903)
                                     (if (memv %_3910 '(local-syntax))
                                       (values
                                         'local-syntax-form
                                         (%_2927 %_3909)
                                         %_3900
                                         %_3902
                                         %_3903)
                                       (if (memv %_3910 '(begin))
                                         (values
                                           'begin-form
                                           '#f
                                           %_3900
                                           %_3902
                                           %_3903)
                                         (if (memv %_3910 '(eval-when))
                                           (values
                                             'eval-when-form
                                             '#f
                                             %_3900
                                             %_3902
                                             %_3903)
                                           (if (memv %_3910 '(define))
                                             (values
                                               'define-form
                                               '#f
                                               %_3900
                                               %_3902
                                               %_3903)
                                             (if (memv %_3910 '(define-syntax))
                                               (values
                                                 'define-syntax-form
                                                 '#f
                                                 %_3900
                                                 %_3902
                                                 %_3903)
                                               (if (memv %_3910 '(module-key))
                                                 (values
                                                   'module-form
                                                   '#f
                                                   %_3900
                                                   %_3902
                                                   %_3903)
                                                 (if (memv %_3910 '(import))
                                                   (values
                                                     'import-form
                                                     (if (%_2927 %_3909)
                                                       (%_3061 %_3907 %_3902)
                                                       '#f)
                                                     %_3900
                                                     %_3902
                                                     %_3903)
                                                   (if (memv %_3910 '(set!))
                                                     (%_3106
                                                       %_3900
                                                       %_3901
                                                       %_3902
                                                       %_3903
                                                       %_3904)
                                                     (values
                                                       'call
                                                       '#f
                                                       %_3900
                                                       %_3902
                                                       %_3903)))))))))))))
                             (%_2926 %_3909)))
                          (%_2947 %_3908 %_3901)))
                       (%_3048 %_3907 %_3902))
                      (values 'call '#f %_3900 %_3902 %_3903)))
                  (car %_3900))
                 (if (%_2898 %_3900)
                   (%_3066
                     (%_2899 %_3900)
                     %_3901
                     (%_3042 %_3902 (%_2900 %_3900))
                     '#f
                     %_3904)
                   (if (annotation? %_3900)
                     (%_3066
                       (annotation-expression %_3900)
                       %_3901
                       %_3902
                       (annotation-source %_3900)
                       %_3904)
                     (if (not ((lambda (%_3906)
                                 (if %_3906 %_3906 (vector? %_3900)))
                               (pair? %_3900)))
                       (values 'constant '#f %_3900 %_3902 %_3903)
                       (values 'other '#f %_3900 %_3902 %_3903))))))))
         (%_3065
           (lambda (%_3897 %_3898)
             (map (lambda (%_3899)
                    (if (%_3050
                          %_3899
                          '#3(syntax-object
                              compile
                              ((top)
                               #4(ribcage ())
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
                               #4(ribcage (#2(import-token *top*)) ())
                               #4(ribcage (#2(import-token *top*)) ()))))
                      'compile
                      (if (%_3050
                            %_3899
                            '#3(syntax-object
                                load
                                ((top)
                                 #4(ribcage ())
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
                                 #4(ribcage (#2(import-token *top*)) ())
                                 #4(ribcage (#2(import-token *top*)) ()))))
                        'load
                        (if (%_3050
                              %_3899
                              '#3(syntax-object
                                  visit
                                  ((top)
                                   #4(ribcage ())
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
                                   #4(ribcage (#2(import-token *top*)) ())
                                   #4(ribcage (#2(import-token *top*)) ()))))
                          'visit
                          (if (%_3050
                                %_3899
                                '#3(syntax-object
                                    revisit
                                    ((top)
                                     #4(ribcage ())
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
                                     #4(ribcage (#2(import-token *top*)) ())
                                     #4(ribcage (#2(import-token *top*)) ()))))
                            'revisit
                            (if (%_3050
                                  %_3899
                                  '#3(syntax-object
                                      eval
                                      ((top)
                                       #4(ribcage ())
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
                                       #4(ribcage (#2(import-token *top*)) ())
                                       #4(ribcage
                                          (#2(import-token *top*))
                                          ()
                                          ()))))
                              'eval
                              (syntax-error
                                (%_3061 %_3899 %_3898)
                                '"invalid eval-when situation")))))))
                  %_3897)))
         (%_3064
           (lambda (%_3883
                    %_3884
                    %_3885
                    %_3886
                    %_3887
                    %_3888
                    %_3889)
             (%_2883
               %_3886
               ((letrec ((%_3890
                           (lambda (%_3891 %_3892 %_3893 %_3894 %_3895)
                             (if (null? %_3891)
                               '()
                               ((lambda (%_3896)
                                  (cons %_3896
                                        (%_3890
                                          (cdr %_3891)
                                          %_3892
                                          %_3893
                                          %_3894
                                          %_3895)))
                                (%_3068
                                  (car %_3891)
                                  %_3892
                                  %_3893
                                  %_3894
                                  %_3895
                                  %_3889))))))
                  %_3890)
                %_3883
                %_3884
                %_3885
                %_3887
                %_3888))))
         (%_3063
           (lambda (%_3874 %_3875 %_3876 %_3877)
             (%_2883
               %_3877
               ((letrec ((%_3878
                           (lambda (%_3879 %_3880 %_3881)
                             (if (null? %_3879)
                               '()
                               ((lambda (%_3882)
                                  (cons %_3882
                                        (%_3878 (cdr %_3879) %_3880 %_3881)))
                                (%_3103 (car %_3879) %_3880 %_3881))))))
                  %_3878)
                %_3874
                %_3875
                %_3876))))
         (%_3062
           (lambda (%_3871 %_3872 %_3873)
             (%_3061
               (if %_3873
                 (make-annotation %_3871 %_3873 '#f)
                 %_3871)
               %_3872)))
         (%_3061
           (lambda (%_3869 %_3870)
             (if (if (null? (%_2963 %_3870))
                   (null? (%_2964 %_3870))
                   '#f)
               %_3869
               (if (%_2898 %_3869)
                 (%_2897
                   (%_2899 %_3869)
                   (%_3042 %_3870 (%_2900 %_3869)))
                 (if (null? %_3869) %_3869 (%_2897 %_3869 %_3870))))))
         (%_3060
           (lambda (%_3866 %_3867)
             (if (not (null? %_3867))
               ((lambda (%_3868)
                  (if %_3868 %_3868 (%_3060 %_3866 (cdr %_3867))))
                (%_3051 %_3866 (car %_3867)))
               '#f)))
         (%_3059
           (lambda (%_3860 %_3861 %_3862)
             ((letrec ((%_3863
                         (lambda (%_3864 %_3865)
                           (if (null? %_3864)
                             (syntax-error %_3861)
                             (if (%_2955 (car %_3864))
                               (if (%_3060 (car %_3864) %_3865)
                                 (syntax-error
                                   (car %_3864)
                                   '"duplicate "
                                   %_3862)
                                 (%_3863
                                   (cdr %_3864)
                                   (cons (car %_3864) %_3865)))
                               (syntax-error
                                 (car %_3864)
                                 '"invalid "
                                 %_3862))))))
                %_3863)
              %_3860
              '())))
         (%_3058
           (lambda (%_3856)
             ((letrec ((%_3857
                         (lambda (%_3858)
                           ((lambda (%_3859)
                              (if %_3859
                                %_3859
                                (if (not (%_3060 (car %_3858) (cdr %_3858)))
                                  (%_3857 (cdr %_3858))
                                  '#f)))
                            (null? %_3858)))))
                %_3857)
              %_3856)))
         (%_3052
           (lambda (%_3852)
             (if ((letrec ((%_3853
                             (lambda (%_3854)
                               ((lambda (%_3855)
                                  (if %_3855
                                    %_3855
                                    (if (%_2955 (car %_3854))
                                      (%_3853 (cdr %_3854))
                                      '#f)))
                                (null? %_3854)))))
                    %_3853)
                  %_3852)
               (%_3058 %_3852)
               '#f)))
         (%_3051
           (lambda (%_3846 %_3847)
             (if (if (%_2898 %_3846) (%_2898 %_3847) '#f)
               (if (eq? ((lambda (%_3850)
                           (if (annotation? %_3850)
                             (annotation-expression %_3850)
                             %_3850))
                         (%_2899 %_3846))
                        ((lambda (%_3851)
                           (if (annotation? %_3851)
                             (annotation-expression %_3851)
                             %_3851))
                         (%_2899 %_3847)))
                 (%_3044
                   (%_2963 (%_2900 %_3846))
                   (%_2963 (%_2900 %_3847)))
                 '#f)
               (eq? (if (annotation? %_3846)
                      (annotation-expression %_3846)
                      %_3846)
                    (if (annotation? %_3847)
                      (annotation-expression %_3847)
                      %_3847)))))
         (%_3050
           (lambda (%_3835 %_3836)
             (if (eq? ((lambda (%_3843)
                         (if (annotation? %_3843)
                           (annotation-expression %_3843)
                           %_3843))
                       (if (%_2898 %_3835) (%_2899 %_3835) %_3835))
                      ((lambda (%_3845)
                         (if (annotation? %_3845)
                           (annotation-expression %_3845)
                           %_3845))
                       (if (%_2898 %_3836) (%_2899 %_3836) %_3836)))
               ((lambda (%_3838 %_3837)
                  ((lambda (%_3839)
                     (if %_3839
                       %_3839
                       (if ((lambda (%_3841)
                              (if %_3841 %_3841 (symbol? %_3837)))
                            (not %_3837))
                         ((lambda (%_3840)
                            (if %_3840 %_3840 (symbol? %_3838)))
                          (not %_3838))
                         '#f)))
                   (eq? %_3837 %_3838)))
                (%_3048 %_3836 '(()))
                (%_3048 %_3835 '(())))
               '#f)))
         (%_3049
           (lambda (%_3829 %_3830)
             (if (eq? ((lambda (%_3832)
                         (if (annotation? %_3832)
                           (annotation-expression %_3832)
                           %_3832))
                       (if (%_2898 %_3829) (%_2899 %_3829) %_3829))
                      ((lambda (%_3834)
                         (if (annotation? %_3834)
                           (annotation-expression %_3834)
                           %_3834))
                       (if (%_2898 %_3830) (%_2899 %_3830) %_3830)))
               (eq? (%_3048 %_3829 '(())) (%_3048 %_3830 '(())))
               '#f)))
         (%_3048
           (lambda (%_3825 %_3826)
             (call-with-values
               (lambda () (%_3045 %_3825 %_3826))
               (lambda (%_3827 %_3828)
                 (if (%_2994 %_3827) (%_2998 %_3827) %_3827)))))
         (%_3047
           (lambda (%_3821 %_3822)
             (call-with-values
               (lambda () (%_3045 %_3821 %_3822))
               (lambda (%_3823 %_3824) %_3823))))
         (%_3046
           (lambda (%_3817 %_3818)
             (call-with-values
               (lambda () (%_3045 %_3817 %_3818))
               (lambda (%_3819 %_3820)
                 (values
                   (if (%_2994 %_3819) (%_2998 %_3819) %_3819)
                   %_3820)))))
         (%_3045
           (lambda (%_3782 %_3783)
             (letrec ((%_3786
                        (lambda (%_3809 %_3810 %_3811 %_3812 %_3813)
                          ((lambda (%_3814)
                             ((letrec ((%_3815
                                         (lambda (%_3816)
                                           (if (= %_3816 %_3814)
                                             (%_3784
                                               %_3809
                                               (cdr %_3810)
                                               %_3811)
                                             (if (if (eq? (vector-ref
                                                            %_3812
                                                            %_3816)
                                                          %_3809)
                                                   (%_3044
                                                     %_3811
                                                     (vector-ref
                                                       (%_3006 %_3813)
                                                       %_3816))
                                                   '#f)
                                               (values
                                                 (vector-ref
                                                   (%_3007 %_3813)
                                                   %_3816)
                                                 %_3811)
                                               (%_3815 (+ %_3816 '1)))))))
                                %_3815)
                              '0))
                           (vector-length %_3812))))
                      (%_3785
                        (lambda (%_3799 %_3800 %_3801 %_3802 %_3803)
                          ((letrec ((%_3804
                                      (lambda (%_3805 %_3806)
                                        (if (null? %_3805)
                                          (%_3784 %_3799 (cdr %_3800) %_3801)
                                          (if (if (eq? (car %_3805) %_3799)
                                                (%_3044
                                                  %_3801
                                                  (list-ref
                                                    (%_3006 %_3803)
                                                    %_3806))
                                                '#f)
                                            (values
                                              (list-ref (%_3007 %_3803) %_3806)
                                              %_3801)
                                            (if (%_3027 (car %_3805))
                                              ((lambda (%_3807)
                                                 (if %_3807
                                                   (if (symbol? %_3807)
                                                     (values %_3807 %_3801)
                                                     (%_3046 %_3807 '(())))
                                                   (%_3804
                                                     (cdr %_3805)
                                                     %_3806)))
                                               (%_3038
                                                 %_3799
                                                 (%_3028 (car %_3805))
                                                 %_3801))
                                              (if (if (eq? (car %_3805) %_3025)
                                                    (%_3044
                                                      %_3801
                                                      (list-ref
                                                        (%_3006 %_3803)
                                                        %_3806))
                                                    '#f)
                                                (values '#f %_3801)
                                                (%_3804
                                                  (cdr %_3805)
                                                  (+ %_3806 '1)))))))))
                             %_3804)
                           %_3802
                           '0)))
                      (%_3784
                        (lambda (%_3794 %_3795 %_3796)
                          (if (null? %_3795)
                            (values %_3794 %_3796)
                            ((lambda (%_3797)
                               (if (eq? %_3797 'shift)
                                 (%_3784 %_3794 (cdr %_3795) (cdr %_3796))
                                 ((lambda (%_3798)
                                    (if (vector? %_3798)
                                      (%_3786
                                        %_3794
                                        %_3795
                                        %_3796
                                        %_3798
                                        %_3797)
                                      (%_3785
                                        %_3794
                                        %_3795
                                        %_3796
                                        %_3798
                                        %_3797)))
                                  (%_3005 %_3797))))
                             (car %_3795))))))
               (if (symbol? %_3782)
                 (%_3784 %_3782 (%_2964 %_3783) (%_2963 %_3783))
                 (if (%_2898 %_3782)
                   ((lambda (%_3789 %_3788)
                      ((lambda (%_3790)
                         (call-with-values
                           (lambda ()
                             (%_3784 %_3788 (%_2964 %_3783) %_3790))
                           (lambda (%_3791 %_3792)
                             (if (eq? %_3791 %_3788)
                               (%_3784 %_3788 (%_2964 %_3789) %_3792)
                               (values %_3791 %_3792)))))
                       (%_3043 (%_2963 %_3783) (%_2963 %_3789))))
                    (%_2900 %_3782)
                    ((lambda (%_3793)
                       (if (annotation? %_3793)
                         (annotation-expression %_3793)
                         %_3793))
                     (%_2899 %_3782)))
                   (if (annotation? %_3782)
                     (%_3784
                       (if (annotation? %_3782)
                         (annotation-expression %_3782)
                         %_3782)
                       (%_2964 %_3783)
                       (%_2963 %_3783))
                     (%_2776 'id-var-name '"invalid id" %_3782)))))))
         (%_3044
           (lambda (%_3779 %_3780)
             ((lambda (%_3781)
                (if %_3781
                  %_3781
                  (if (not (null? %_3779))
                    (if (not (null? %_3780))
                      (if (eq? (car %_3779) (car %_3780))
                        (%_3044 (cdr %_3779) (cdr %_3780))
                        '#f)
                      '#f)
                    '#f)))
              (eq? %_3779 %_3780))))
         (%_3043
           (lambda (%_3777 %_3778) (%_3041 %_3777 %_3778)))
         (%_3042
           (lambda (%_3773 %_3774)
             ((lambda (%_3776 %_3775)
                (if (null? %_3775)
                  (if (null? %_3776)
                    %_3774
                    (%_2962
                      (%_2963 %_3774)
                      (%_3041 %_3776 (%_2964 %_3774))))
                  (%_2962
                    (%_3041 %_3775 (%_2963 %_3774))
                    (%_3041 %_3776 (%_2964 %_3774)))))
              (%_2964 %_3773)
              (%_2963 %_3773))))
         (%_3041
           (lambda (%_3771 %_3772)
             (if (null? %_3772) %_3771 (append %_3771 %_3772))))
         (%_3040
           (lambda (%_3765)
             (call-with-values
               (lambda () (%_3046 %_3765 '(())))
               (lambda (%_3766 %_3767)
                 (begin
                   (if (not %_3766)
                     (syntax-error
                       %_3765
                       '"identifier not visible for export")
                     (void))
                   ((lambda (%_3768)
                      (%_2897
                        %_3768
                        (%_2962
                          %_3767
                          (list (%_3003
                                  (vector %_3768)
                                  (vector %_3767)
                                  (vector %_3766))))))
                    ((lambda (%_3770)
                       (if (annotation? %_3770)
                         (annotation-expression %_3770)
                         %_3770))
                     (if (%_2898 %_3765) (%_2899 %_3765) %_3765))))))))
         (%_3039
           (lambda (%_3753 %_3754 %_3755)
             (if (null? %_3753)
               %_3755
               (%_2962
                 (%_2963 %_3755)
                 (cons ((lambda (%_3756)
                          ((lambda (%_3757)
                             ((lambda (%_3759 %_3758)
                                (begin
                                  ((letrec ((%_3760
                                              (lambda (%_3761 %_3762)
                                                (if (not (null? %_3761))
                                                  (call-with-values
                                                    (lambda ()
                                                      (%_2961
                                                        (car %_3761)
                                                        %_3755))
                                                    (lambda (%_3763 %_3764)
                                                      (begin
                                                        (vector-set!
                                                          %_3758
                                                          %_3762
                                                          %_3763)
                                                        (vector-set!
                                                          %_3759
                                                          %_3762
                                                          %_3764)
                                                        (%_3760
                                                          (cdr %_3761)
                                                          (+ %_3762 '1)))))
                                                  (void)))))
                                     %_3760)
                                   %_3753
                                   '0)
                                  (%_3003 %_3758 %_3759 %_3756)))
                              (make-vector %_3757)
                              (make-vector %_3757)))
                           (vector-length %_3756)))
                        (list->vector %_3754))
                       (%_2964 %_3755))))))
         (%_3038
           (lambda (%_3746 %_3747 %_3748)
             ((lambda (%_3749)
                (if %_3749
                  ((letrec ((%_3750
                              (lambda (%_3751)
                                (if (pair? %_3751)
                                  ((lambda (%_3752)
                                     (if %_3752 %_3752 (%_3750 (cdr %_3751))))
                                   (%_3750 (car %_3751)))
                                  (if (symbol? %_3751)
                                    (if (%_3044 %_3748 (%_2963 '((top))))
                                      %_3751
                                      '#f)
                                    (if (%_3044
                                          %_3748
                                          (%_2963 (%_2900 %_3751)))
                                      %_3751
                                      '#f))))))
                     %_3750)
                   %_3749)
                  '#f))
              (%_2783 %_3746 %_3747))))
         (%_3037
           (lambda (%_3744 %_3745)
             (%_3008
               %_3744
               (cons (%_3026 %_3745) (%_3005 %_3744)))))
         (%_3036
           (lambda (%_3742 %_3743)
             (begin
               (%_3008 %_3742 (cons %_3025 (%_3005 %_3742)))
               (%_3009
                 %_3742
                 (cons (%_2963 %_3743) (%_3006 %_3742))))))
         (%_3035
           (lambda (%_3740 %_3741)
             (%_3036 %_3740 (%_2900 %_3741))))
         (%_3034
           (lambda (%_3736 %_3737 %_3738)
             (begin
               (%_3008
                 %_3736
                 (cons ((lambda (%_3739)
                          (if (annotation? %_3739)
                            (annotation-expression %_3739)
                            %_3739))
                        (%_2899 %_3737))
                       (%_3005 %_3736)))
               (%_3009
                 %_3736
                 (cons (%_2963 (%_2900 %_3737)) (%_3006 %_3736)))
               (%_3010 %_3736 (cons %_3738 (%_3007 %_3736))))))
         (%_3029
           (lambda (%_3734 %_3735)
             (vector-set! %_3734 '1 %_3735)))
         (%_3028 (lambda (%_3733) (vector-ref %_3733 '1)))
         (%_3027
           (lambda (%_3732)
             (if (vector? %_3732)
               (if (= (vector-length %_3732) '2)
                 (eq? (vector-ref %_3732 '0) 'import-token)
                 '#f)
               '#f)))
         (%_3026
           (lambda (%_3731) (vector 'import-token %_3731)))
         (%_3025 '#f)
         (%_3020
           (lambda (%_3730)
             (%_2962
               (cons '#f (%_2963 %_3730))
               (cons 'shift (%_2964 %_3730)))))
         (%_3010
           (lambda (%_3728 %_3729)
             (vector-set! %_3728 '3 %_3729)))
         (%_3009
           (lambda (%_3726 %_3727)
             (vector-set! %_3726 '2 %_3727)))
         (%_3008
           (lambda (%_3724 %_3725)
             (vector-set! %_3724 '1 %_3725)))
         (%_3007 (lambda (%_3723) (vector-ref %_3723 '3)))
         (%_3006 (lambda (%_3722) (vector-ref %_3722 '2)))
         (%_3005 (lambda (%_3721) (vector-ref %_3721 '1)))
         (%_3004
           (lambda (%_3720)
             (if (vector? %_3720)
               (if (= (vector-length %_3720) '4)
                 (eq? (vector-ref %_3720 '0) 'ribcage)
                 '#f)
               '#f)))
         (%_3003
           (lambda (%_3717 %_3718 %_3719)
             (vector 'ribcage %_3717 %_3718 %_3719)))
         (%_3002
           (lambda (%_3716)
             (if (null? %_3716)
               '()
               (cons (%_3000) (%_3002 (cdr %_3716))))))
         (%_3001
           (lambda (%_3713)
             ((lambda (%_3714)
                (if %_3714
                  %_3714
                  ((lambda (%_3715)
                     (if %_3715 %_3715 (%_2994 %_3713)))
                   (symbol? %_3713))))
              (string? %_3713))))
         (%_3000 (lambda () (string '#\i)))
         (%_2993
           (lambda (%_3712) (vector 'indirect-label %_3712)))
         (%_2994
           (lambda (%_3711)
             (if (vector? %_3711)
               (if (= (vector-length %_3711) '2)
                 (eq? (vector-ref %_3711 '0) 'indirect-label)
                 '#f)
               '#f)))
         (%_2995 (lambda (%_3710) (vector-ref %_3710 '1)))
         (%_2996
           (lambda (%_3708 %_3709)
             (vector-set! %_3708 '1 %_3709)))
         (%_2997 (lambda () (%_2993 (%_3000))))
         (%_2998 (lambda (%_3707) (%_2995 %_3707)))
         (%_2999
           (lambda (%_3705 %_3706) (%_2996 %_3705 %_3706)))
         (%_2964 cdr)
         (%_2963 car)
         (%_2962 cons)
         (%_2961
           (lambda (%_3701 %_3702)
             (if (%_2898 %_3701)
               (values
                 ((lambda (%_3704)
                    (if (annotation? %_3704)
                      (annotation-expression %_3704)
                      %_3704))
                  (%_2899 %_3701))
                 (%_3043 (%_2963 %_3702) (%_2963 (%_2900 %_3701))))
               (values
                 (if (annotation? %_3701)
                   (annotation-expression %_3701)
                   %_3701)
                 (%_2963 %_3702)))))
         (%_2955
           (lambda (%_3699)
             (if (symbol? %_3699)
               '#t
               (if (%_2898 %_3699)
                 (symbol?
                   ((lambda (%_3700)
                      (if (annotation? %_3700)
                        (annotation-expression %_3700)
                        %_3700))
                    (%_2899 %_3699)))
                 (if (annotation? %_3699)
                   (symbol? (annotation-expression %_3699))
                   '#f)))))
         (%_2949
           (lambda (%_3697)
             (if (%_2898 %_3697)
               (symbol?
                 ((lambda (%_3698)
                    (if (annotation? %_3698)
                      (annotation-expression %_3698)
                      %_3698))
                  (%_2899 %_3697)))
               '#f)))
         (%_2948
           (lambda (%_3694 %_3695 %_3696)
             (%_2781 %_3695 (%_2925 %_3694 %_3696))))
         (%_2947
           (lambda (%_3684 %_3685)
             (letrec ((%_3686
                        (lambda (%_3692 %_3693)
                          (begin
                            (%_2928 %_3692 (%_2926 %_3693))
                            (%_2929 %_3692 (%_2927 %_3693))))))
               ((lambda (%_3687)
                  ((lambda (%_3688)
                     (if (memv %_3688 '(deferred))
                       (begin
                         (%_3686
                           %_3687
                           ((lambda (%_3689)
                              ((lambda (%_3690)
                                 (if %_3690
                                   %_3690
                                   (syntax-error
                                     %_3689
                                     '"invalid transformer")))
                               (%_2946 %_3689)))
                            (%_2775 (%_2927 %_3687))))
                         ((lambda (%_3691) %_3687) (%_2926 %_3687)))
                       %_3687))
                   (%_2926 %_3687)))
                (%_2945 %_3684 %_3685)))))
         (%_2946
           (lambda (%_3682)
             (if (procedure? %_3682)
               (%_2925 'macro %_3682)
               (if (%_2930 %_3682)
                 ((lambda (%_3683)
                    (if (memv %_3683 '(core macro macro!))
                      (if (procedure? (%_2927 %_3682)) %_3682 '#f)
                      (if (memv %_3683 '(module))
                        (if (%_3071 (%_2927 %_3682)) %_3682 '#f)
                        %_3682)))
                  (%_2926 %_3682))
                 '#f))))
         (%_2945
           (lambda (%_3678 %_3679)
             ((lambda (%_3680)
                (if %_3680
                  (cdr %_3680)
                  (if (symbol? %_3678)
                    ((lambda (%_3681)
                       (if %_3681 %_3681 (%_2925 'global %_3678)))
                     (%_2782 %_3678))
                    (%_2925 'displaced-lexical '#f))))
              (assq %_3678 %_3679))))
         (%_2944
           (lambda (%_3677)
             (syntax-error
               %_3677
               (if (%_3048 %_3677 '(()))
                 '"identifier out of context"
                 '"identifier not visible"))))
         (%_2943
           (lambda (%_3675)
             (if (null? %_3675)
               '()
               ((lambda (%_3676)
                  (if (eq? (cadr %_3676) 'lexical)
                    (%_2943 (cdr %_3675))
                    (cons %_3676 (%_2943 (cdr %_3675)))))
                (car %_3675)))))
         (%_2942
           (lambda (%_3672 %_3673 %_3674)
             (if (null? %_3672)
               %_3674
               (%_2942
                 (cdr %_3672)
                 (cdr %_3673)
                 (%_2940
                   (car %_3672)
                   (%_2925 'lexical (car %_3673))
                   %_3674)))))
         (%_2941
           (lambda (%_3669 %_3670 %_3671)
             (if (null? %_3669)
               %_3671
               (%_2941
                 (cdr %_3669)
                 (cdr %_3670)
                 (%_2940 (car %_3669) (car %_3670) %_3671)))))
         (%_2940
           (lambda (%_3666 %_3667 %_3668)
             (cons (cons %_3666 %_3667) %_3668)))
         (%_2930
           (lambda (%_3665)
             (if (pair? %_3665) (symbol? (car %_3665)) '#f)))
         (%_2929 set-cdr!)
         (%_2928 set-car!)
         (%_2927 cdr)
         (%_2926 car)
         (%_2925
           (lambda (%_3663 %_3664) (cons %_3663 %_3664)))
         (%_2917
           (lambda (%_3662)
             (if (annotation? %_3662)
               (annotation-source %_3662)
               (if (%_2898 %_3662) (%_2917 (%_2899 %_3662)) '#f))))
         (%_2902
           (lambda (%_3660 %_3661)
             (vector-set! %_3660 '2 %_3661)))
         (%_2901
           (lambda (%_3658 %_3659)
             (vector-set! %_3658 '1 %_3659)))
         (%_2900 (lambda (%_3657) (vector-ref %_3657 '2)))
         (%_2899 (lambda (%_3656) (vector-ref %_3656 '1)))
         (%_2898
           (lambda (%_3655)
             (if (vector? %_3655)
               (if (= (vector-length %_3655) '3)
                 (eq? (vector-ref %_3655 '0) 'syntax-object)
                 '#f)
               '#f)))
         (%_2897
           (lambda (%_3653 %_3654)
             (vector 'syntax-object %_3653 %_3654)))
         (%_2885
           (lambda (%_3649 %_3650 %_3651 %_3652)
             (%_2884 %_3649 %_3650 %_3651 %_3652)))
         (%_2884
           (lambda (%_3645 %_3646 %_3647 %_3648)
             (if (null? %_3646)
               (if %_3645
                 (list 'compile-in-annotation %_3648 %_3645)
                 %_3648)
               (if %_3645
                 (list 'compile-in-annotation
                       (list 'letrec (map list %_3646 %_3647) %_3648)
                       %_3645)
                 (list 'letrec (map list %_3646 %_3647) %_3648)))))
         (%_2883
           (lambda (%_3643 %_3644)
             (if (null? %_3644)
               '(if '#f '#f)
               (if (equal? '(void) (car %_3644))
                 (%_2883 %_3643 (cdr %_3644))
                 (if (null? (cdr %_3644))
                   (if %_3643
                     (list 'compile-in-annotation (car %_3644) %_3643)
                     (car %_3644))
                   (if %_3643
                     (list 'compile-in-annotation
                           (cons 'begin %_3644)
                           %_3643)
                     (cons 'begin %_3644)))))))
         (%_2784
           ((lambda (%_3630)
              (letrec ((%_3633
                         (lambda (%_3637)
                           ((letrec ((%_3638
                                       (lambda (%_3639 %_3640)
                                         (if (< %_3639 %_3630)
                                           (list->string
                                             (cons (%_3632 %_3639) %_3640))
                                           ((lambda (%_3642 %_3641)
                                              (%_3638
                                                %_3642
                                                (cons (%_3632 %_3641) %_3640)))
                                            (quotient %_3639 %_3630)
                                            (modulo %_3639 %_3630))))))
                              %_3638)
                            %_3637
                            '())))
                       (%_3632
                         (lambda (%_3636)
                           (string-ref
                             '"0123456789abcdefghijklmnopqrstuvwxyz"
                             %_3636))))
                ((lambda (%_3634)
                   (lambda (%_3635)
                     (begin
                       (set! %_3634 (+ %_3634 '1))
                       (string->symbol
                         (string-append
                           (symbol->string %_3635)
                           '"_"
                           (%_3633 %_3634))))))
                 '-1)))
            (string-length
              '"0123456789abcdefghijklmnopqrstuvwxyz")))
         (%_2783
           (lambda (%_3627 %_3628) (getprop %_3627 %_3628)))
         (%_2782
           (lambda (%_3626) (getprop %_3626 '*sc-expander*)))
         (%_2781
           (lambda (%_3624 %_3625)
             ($sc-put-cte %_3624 %_3625)))
         (%_2776
           (lambda (%_3621 %_3622 %_3623)
             (error %_3621 '"~a ~s" %_3622 %_3623)))
         (%_2775
           (lambda (%_3620) (eval (list %_2710 %_3620))))
         (%_2774
           (lambda (%_3619) (eval (list %_2710 %_3619))))
         (%_2710 '"noexpand"))
  (begin
    (set! $sc-put-cte
      (lambda (%_3124 %_3125)
        (letrec ((%_3128
                   (lambda (%_3153 %_3154)
                     (begin
                       (%_3126 %_3153 '*top*)
                       ((lambda (%_3155)
                          (putprop %_3155 '*sc-expander* %_3154))
                        (if (symbol? %_3153)
                          %_3153
                          (%_3048 %_3153 '(())))))))
                 (%_3127
                   (lambda (%_3150 %_3151)
                     (%_3097
                       (lambda (%_3152) (%_3126 %_3152 %_3151))
                       %_3150)))
                 (%_3126
                   (lambda (%_3137 %_3138)
                     (letrec ((%_3140
                                (lambda (%_3147 %_3148)
                                  (if (pair? %_3148)
                                    (if (%_3051 (car %_3148) %_3147)
                                      (%_3140 %_3147 (cdr %_3148))
                                      (%_3139
                                        (car %_3148)
                                        (%_3140 %_3147 (cdr %_3148))))
                                    (if ((lambda (%_3149)
                                           (if %_3149
                                             %_3149
                                             (%_3051 %_3148 %_3147)))
                                         (not %_3148))
                                      '#f
                                      %_3148))))
                              (%_3139
                                (lambda (%_3145 %_3146)
                                  (if (not %_3146)
                                    %_3145
                                    (cons %_3145 %_3146)))))
                       ((lambda (%_3141)
                          ((lambda (%_3142)
                             (if (if (not %_3142) (symbol? %_3137) '#f)
                               (remprop %_3141 %_3138)
                               (putprop %_3141 %_3138 (%_3139 %_3137 %_3142))))
                           (%_3140 %_3137 (getprop %_3141 %_3138))))
                        ((lambda (%_3144)
                           (if (annotation? %_3144)
                             (annotation-expression %_3144)
                             %_3144))
                         (if (%_2898 %_3137) (%_2899 %_3137) %_3137)))))))
          ((lambda (%_3129)
             ((lambda (%_3130)
                (if (memv %_3130 '(module))
                  (begin
                    ((lambda (%_3135)
                       (%_3127 (%_3072 %_3135) (%_3073 %_3135)))
                     (%_2927 %_3129))
                    (%_3128 %_3124 %_3129))
                  (if (memv %_3130 '(do-import))
                    ((lambda (%_3131)
                       ((lambda (%_3132)
                          ((lambda (%_3133)
                             (if (memv %_3133 '(module))
                               ((lambda (%_3134)
                                  (begin
                                    (if (not (eq? (%_3073 %_3134) %_3131))
                                      (syntax-error
                                        %_3124
                                        '"import mismatch for module")
                                      (void))
                                    (%_3127 (%_3072 %_3134) '*top*)))
                                (%_2927 %_3132))
                               (syntax-error
                                 %_3124
                                 '"import from unknown module")))
                           (%_2926 %_3132)))
                        (%_2947 (%_3048 %_3124 '(())) '())))
                     (%_2927 %_3125))
                    (%_3128 %_3124 %_3129))))
              (%_2926 %_3129)))
           ((lambda (%_3136)
              (if %_3136
                %_3136
                (error 'define-syntax
                       '"invalid transformer ~s"
                       %_3125)))
            (%_2946 %_3125))))))
    (%_2948 'local-syntax 'letrec-syntax '#t)
    (%_2948 'local-syntax 'let-syntax '#f)
    (%_2948
      'core
      'fluid-let-syntax
      (lambda (%_3156 %_3157 %_3158 %_3159)
        ((lambda (%_3161)
           (if (if %_3161
                 (apply (lambda (%_3179 %_3180 %_3181 %_3182 %_3183)
                          (%_3052 %_3180))
                        %_3161)
                 '#f)
             (apply (lambda (%_3163 %_3164 %_3165 %_3166 %_3167)
                      ((lambda (%_3168)
                         (begin
                           (for-each
                             (lambda (%_3169 %_3170)
                               ((lambda (%_3171)
                                  (if (memv %_3171 '(displaced-lexical))
                                    (%_2944 (%_3061 %_3169 %_3158))
                                    (void)))
                                (%_2926 (%_2947 %_3170 %_3157))))
                             %_3164
                             %_3168)
                           (%_3108
                             (cons %_3166 %_3167)
                             (%_3062 %_3156 %_3158 %_3159)
                             (%_2941
                               %_3168
                               ((lambda (%_3174)
                                  (map (lambda (%_3175)
                                         (%_2925
                                           'deferred
                                           (%_3103 %_3175 %_3174 %_3158)))
                                       %_3165))
                                (%_2943 %_3157))
                               %_3157)
                             %_3158)))
                       (map (lambda (%_3177) (%_3048 %_3177 %_3158))
                            %_3164)))
                    %_3161)
             (syntax-error (%_3062 %_3156 %_3158 %_3159))))
         ($syntax-dispatch
           (compile-in-annotation %_3156 value)
           '(any #2(each (any any)) any . each-any)))))
    (%_2948
      'core
      'quote
      (lambda (%_3185 %_3186 %_3187 %_3188)
        ((lambda (%_3190)
           (if %_3190
             (apply (lambda (%_3192 %_3193)
                      (if %_3188
                        (list 'compile-in-annotation
                              (list 'quote (%_3121 %_3193 %_3187))
                              %_3188)
                        (list 'quote (%_3121 %_3193 %_3187))))
                    %_3190)
             (syntax-error (%_3062 %_3185 %_3187 %_3188))))
         ($syntax-dispatch
           (compile-in-annotation %_3185 value)
           '(any any)))))
    (%_2948
      'core
      'syntax
      (letrec ((%_3201
                 (lambda (%_3304)
                   ((lambda (%_3305)
                      (if (memv %_3305 '(ref))
                        (cadr %_3304)
                        (if (memv %_3305 '(primitive))
                          (cadr %_3304)
                          (if (memv %_3305 '(quote))
                            (list 'quote (cadr %_3304))
                            (if (memv %_3305 '(lambda))
                              (list 'lambda
                                    (cadr %_3304)
                                    (%_3201 (caddr %_3304)))
                              (if (memv %_3305 '(map))
                                ((lambda (%_3306)
                                   (cons (if (= (length %_3306) '2) 'map 'map)
                                         %_3306))
                                 (map %_3201 (cdr %_3304)))
                                (cons (car %_3304)
                                      (map %_3201 (cdr %_3304)))))))))
                    (car %_3304))))
               (%_3200
                 (lambda (%_3301 %_3302 %_3303)
                   (if (eq? (car %_3303) 'quote)
                     (if (eq? (cadr %_3303) %_3302)
                       (list 'quote %_3301)
                       (list 'quote (list->vector (cadr %_3303))))
                     (if (eq? (car %_3303) 'list)
                       (cons 'vector (cdr %_3303))
                       (list 'list->vector %_3303)))))
               (%_3199
                 (lambda (%_3293 %_3294 %_3295 %_3296 %_3297)
                   ((lambda (%_3298)
                      (if (memv %_3298 '(quote))
                        (if (eq? (car %_3296) 'quote)
                          ((lambda (%_3300 %_3299)
                             (if (if (eq? %_3299 %_3294)
                                   (eq? %_3300 %_3295)
                                   '#f)
                               (list 'quote %_3293)
                               (list 'quote (cons %_3299 %_3300))))
                           (cadr %_3297)
                           (cadr %_3296))
                          (if (eq? (cadr %_3297) '())
                            (list 'list %_3296)
                            (list 'cons %_3296 %_3297)))
                        (if (memv %_3298 '(list))
                          (cons 'list (cons %_3296 (cdr %_3297)))
                          (list 'cons %_3296 %_3297))))
                    (car %_3297))))
               (%_3198
                 (lambda (%_3285 %_3286)
                   ((lambda (%_3288 %_3287)
                      (if (eq? (car %_3285) 'ref)
                        (car %_3288)
                        (if (andmap
                              (lambda (%_3291)
                                (if (eq? (car %_3291) 'ref)
                                  (memq (cadr %_3291) %_3287)
                                  '#f))
                              (cdr %_3285))
                          (cons 'map
                                (cons (list 'primitive (car %_3285))
                                      (map ((lambda (%_3289)
                                              (lambda (%_3290)
                                                (cdr (assq (cadr %_3290)
                                                           %_3289))))
                                            (map cons %_3287 %_3288))
                                           (cdr %_3285))))
                          (cons 'map
                                (cons (list 'lambda %_3287 %_3285) %_3288)))))
                    (map (lambda (%_3292) (list 'ref (car %_3292)))
                         %_3286)
                    (map cdr %_3286))))
               (%_3197
                 (lambda (%_3283 %_3284)
                   (list 'apply
                         '(primitive append)
                         (%_3198 %_3283 %_3284))))
               (%_3196
                 (lambda (%_3281 %_3282)
                   (if (equal? %_3282 ''())
                     %_3281
                     (list 'append %_3281 %_3282))))
               (%_3195
                 (lambda (%_3273 %_3274 %_3275 %_3276)
                   (if (= %_3275 '0)
                     (values %_3274 %_3276)
                     (if (null? %_3276)
                       (syntax-error
                         %_3273
                         '"missing ellipsis in syntax form")
                       (call-with-values
                         (lambda ()
                           (%_3195 %_3273 %_3274 (- %_3275 '1) (cdr %_3276)))
                         (lambda (%_3277 %_3278)
                           ((lambda (%_3279)
                              (if %_3279
                                (values (cdr %_3279) %_3276)
                                ((lambda (%_3280)
                                   (values
                                     %_3280
                                     (cons (cons (cons %_3277 %_3280)
                                                 (car %_3276))
                                           %_3278)))
                                 (%_3122 'tmp))))
                            (assq %_3277 (car %_3276)))))))))
               (%_3194
                 (lambda (%_3214 %_3215 %_3216 %_3217 %_3218)
                   (if (%_2955 %_3215)
                     ((lambda (%_3268)
                        ((lambda (%_3269)
                           (if (eq? (%_2926 %_3269) 'syntax)
                             (call-with-values
                               (lambda ()
                                 ((lambda (%_3270)
                                    (%_3195
                                      %_3214
                                      (car %_3270)
                                      (cdr %_3270)
                                      %_3217))
                                  (%_2927 %_3269)))
                               (lambda (%_3271 %_3272)
                                 (values (list 'ref %_3271) %_3272)))
                             (if (%_3218 %_3215)
                               (syntax-error
                                 %_3214
                                 '"misplaced ellipsis in syntax form")
                               (values (list 'quote %_3215) %_3217))))
                         (%_2947 %_3268 %_3216)))
                      (%_3048 %_3215 '(())))
                     ((lambda (%_3220)
                        (if (if %_3220
                              (apply (lambda (%_3266 %_3267) (%_3218 %_3266))
                                     %_3220)
                              '#f)
                          (apply (lambda (%_3263 %_3264)
                                   (%_3194
                                     %_3214
                                     %_3264
                                     %_3216
                                     %_3217
                                     (lambda (%_3265) '#f)))
                                 %_3220)
                          ((lambda (%_3221)
                             (if (if %_3221
                                   (apply (lambda (%_3260 %_3261 %_3262)
                                            (%_3218 %_3261))
                                          %_3221)
                                   '#f)
                               (apply (lambda (%_3237 %_3238 %_3239)
                                        ((letrec ((%_3240
                                                    (lambda (%_3241 %_3242)
                                                      ((lambda (%_3244)
                                                         (if (if %_3244
                                                               (apply (lambda (%_3255
                                                                               %_3256)
                                                                        (%_3218
                                                                          %_3255))
                                                                      %_3244)
                                                               '#f)
                                                           (apply (lambda (%_3250
                                                                           %_3251)
                                                                    (%_3240
                                                                      %_3251
                                                                      (lambda (%_3252)
                                                                        (call-with-values
                                                                          (lambda ()
                                                                            (%_3242
                                                                              (cons '()
                                                                                    %_3252)))
                                                                          (lambda (%_3253
                                                                                   %_3254)
                                                                            (if (null? (car %_3254))
                                                                              (syntax-error
                                                                                %_3214
                                                                                '"extra ellipsis in syntax form")
                                                                              (values
                                                                                (%_3197
                                                                                  %_3253
                                                                                  (car %_3254))
                                                                                (cdr %_3254))))))))
                                                                  %_3244)
                                                           (call-with-values
                                                             (lambda ()
                                                               (%_3194
                                                                 %_3214
                                                                 %_3241
                                                                 %_3216
                                                                 %_3217
                                                                 %_3218))
                                                             (lambda (%_3246
                                                                      %_3247)
                                                               (call-with-values
                                                                 (lambda ()
                                                                   (%_3242
                                                                     %_3247))
                                                                 (lambda (%_3248
                                                                          %_3249)
                                                                   (values
                                                                     (%_3196
                                                                       %_3248
                                                                       %_3246)
                                                                     %_3249)))))))
                                                       ($syntax-dispatch
                                                         (compile-in-annotation
                                                           %_3241
                                                           value)
                                                         '(any . any))))))
                                           %_3240)
                                         %_3239
                                         (lambda (%_3257)
                                           (call-with-values
                                             (lambda ()
                                               (%_3194
                                                 %_3214
                                                 %_3237
                                                 %_3216
                                                 (cons '() %_3257)
                                                 %_3218))
                                             (lambda (%_3258 %_3259)
                                               (if (null? (car %_3259))
                                                 (syntax-error
                                                   %_3214
                                                   '"extra ellipsis in syntax form")
                                                 (values
                                                   (%_3198 %_3258 (car %_3259))
                                                   (cdr %_3259))))))))
                                      %_3221)
                               ((lambda (%_3222)
                                  (if %_3222
                                    (apply (lambda (%_3231 %_3232)
                                             (call-with-values
                                               (lambda ()
                                                 (%_3194
                                                   %_3214
                                                   %_3231
                                                   %_3216
                                                   %_3217
                                                   %_3218))
                                               (lambda (%_3233 %_3234)
                                                 (call-with-values
                                                   (lambda ()
                                                     (%_3194
                                                       %_3214
                                                       %_3232
                                                       %_3216
                                                       %_3234
                                                       %_3218))
                                                   (lambda (%_3235 %_3236)
                                                     (values
                                                       (%_3199
                                                         %_3215
                                                         %_3231
                                                         %_3232
                                                         %_3233
                                                         %_3235)
                                                       %_3236))))))
                                           %_3222)
                                    ((lambda (%_3223)
                                       (if %_3223
                                         (apply (lambda (%_3225 %_3226)
                                                  ((lambda (%_3227)
                                                     (call-with-values
                                                       (lambda ()
                                                         (%_3194
                                                           %_3214
                                                           %_3227
                                                           %_3216
                                                           %_3217
                                                           %_3218))
                                                       (lambda (%_3228 %_3229)
                                                         (values
                                                           (%_3200
                                                             %_3215
                                                             %_3227
                                                             %_3228)
                                                           %_3229))))
                                                   (cons %_3225 %_3226)))
                                                %_3223)
                                         (values (list 'quote %_3215) %_3217)))
                                     ($syntax-dispatch
                                       (compile-in-annotation %_3215 value)
                                       '#2(vector (any . each-any))))))
                                ($syntax-dispatch
                                  (compile-in-annotation %_3215 value)
                                  '(any . any)))))
                           ($syntax-dispatch
                             (compile-in-annotation %_3215 value)
                             '(any any . any)))))
                      ($syntax-dispatch
                        (compile-in-annotation %_3215 value)
                        '(any any)))))))
        (lambda (%_3202 %_3203 %_3204 %_3205)
          ((lambda (%_3206)
             ((lambda (%_3208)
                (if %_3208
                  (apply (lambda (%_3210 %_3211)
                           (call-with-values
                             (lambda ()
                               (%_3194 %_3206 %_3211 %_3203 '() %_3118))
                             (lambda (%_3212 %_3213) (%_3201 %_3212))))
                         %_3208)
                  (syntax-error %_3206)))
              ($syntax-dispatch
                (compile-in-annotation %_3206 value)
                '(any any))))
           (%_3062 %_3202 %_3204 %_3205)))))
    (%_2948
      'core
      'lambda
      (lambda (%_3307 %_3308 %_3309 %_3310)
        ((lambda (%_3312)
           (if %_3312
             (apply (lambda (%_3313 %_3314)
                      (%_3115
                        (%_3062 %_3307 %_3309 %_3310)
                        %_3314
                        %_3308
                        %_3309
                        (lambda (%_3315 %_3316)
                          (if %_3310
                            (list 'compile-in-annotation
                                  (list 'lambda %_3315 %_3316)
                                  %_3310)
                            (list 'lambda %_3315 %_3316)))))
                    %_3312)
             (syntax-error %_3307)))
         ($syntax-dispatch
           (compile-in-annotation %_3307 value)
           '(any . any)))))
    (%_2948
      'core
      'letrec
      (lambda (%_3317 %_3318 %_3319 %_3320)
        ((lambda (%_3322)
           (if %_3322
             (apply (lambda (%_3324 %_3325 %_3326 %_3327 %_3328)
                      (if (not (%_3052 %_3325))
                        (%_3059
                          (map (lambda (%_3337) (%_3061 %_3337 %_3319))
                               %_3325)
                          (%_3062 %_3317 %_3319 %_3320)
                          '"bound variable")
                        ((lambda (%_3331 %_3330)
                           ((lambda (%_3333 %_3332)
                              (%_2884
                                %_3320
                                %_3331
                                (map (lambda (%_3334)
                                       (%_3103 %_3334 %_3333 %_3332))
                                     %_3326)
                                (%_3108
                                  (cons %_3327 %_3328)
                                  (%_3062 %_3317 %_3332 %_3320)
                                  %_3333
                                  %_3332)))
                            (%_2942 %_3330 %_3331 %_3318)
                            (%_3039 %_3325 %_3330 %_3319)))
                         (map %_3122 %_3325)
                         (%_3002 %_3325))))
                    %_3322)
             (syntax-error (%_3062 %_3317 %_3319 %_3320))))
         ($syntax-dispatch
           (compile-in-annotation %_3317 value)
           '(any #2(each (any any)) any . each-any)))))
    (%_2948
      'core
      'if
      (lambda (%_3339 %_3340 %_3341 %_3342)
        ((lambda (%_3344)
           (if %_3344
             (apply (lambda (%_3351 %_3352 %_3353)
                      (if %_3342
                        (list 'compile-in-annotation
                              (list 'if
                                    (%_3103 %_3352 %_3340 %_3341)
                                    (%_3103 %_3353 %_3340 %_3341)
                                    (%_3117))
                              %_3342)
                        (list 'if
                              (%_3103 %_3352 %_3340 %_3341)
                              (%_3103 %_3353 %_3340 %_3341)
                              (%_3117))))
                    %_3344)
             ((lambda (%_3345)
                (if %_3345
                  (apply (lambda (%_3347 %_3348 %_3349 %_3350)
                           (if %_3342
                             (list 'compile-in-annotation
                                   (list 'if
                                         (%_3103 %_3348 %_3340 %_3341)
                                         (%_3103 %_3349 %_3340 %_3341)
                                         (%_3103 %_3350 %_3340 %_3341))
                                   %_3342)
                             (list 'if
                                   (%_3103 %_3348 %_3340 %_3341)
                                   (%_3103 %_3349 %_3340 %_3341)
                                   (%_3103 %_3350 %_3340 %_3341))))
                         %_3345)
                  (syntax-error (%_3062 %_3339 %_3341 %_3342))))
              ($syntax-dispatch
                (compile-in-annotation %_3339 value)
                '(any any any any)))))
         ($syntax-dispatch
           (compile-in-annotation %_3339 value)
           '(any any any)))))
    (%_2948 'set! 'set! '())
    (%_2948 'begin 'begin '())
    (%_2948 'module-key 'module '())
    (%_2948 'import 'import '#f)
    (%_2948 'import 'import-only '#t)
    (%_2948 'define 'define '())
    (%_2948 'define-syntax 'define-syntax '())
    (%_2948 'eval-when 'eval-when '())
    (%_2948
      'core
      'syntax-case
      (letrec ((%_3357
                 (lambda (%_3519 %_3520 %_3521 %_3522)
                   (if (null? %_3521)
                     (list 'syntax-error %_3519)
                     ((lambda (%_3523)
                        ((lambda (%_3524)
                           (if %_3524
                             (apply (lambda (%_3530 %_3531)
                                      (if (if (%_2955 %_3530)
                                            (if (not (%_3060 %_3530 %_3520))
                                              (not (%_3118 %_3530))
                                              '#f)
                                            '#f)
                                        ((lambda (%_3533 %_3532)
                                           (list (list 'lambda
                                                       (list %_3533)
                                                       (%_3103
                                                         %_3531
                                                         (%_2940
                                                           %_3532
                                                           (%_2925
                                                             'syntax
                                                             (cons %_3533 '0))
                                                           %_3522)
                                                         (%_3039
                                                           (list %_3530)
                                                           (list %_3532)
                                                           '(()))))
                                                 %_3519))
                                         (%_3122 %_3530)
                                         (%_3000))
                                        (%_3356
                                          %_3519
                                          %_3520
                                          (cdr %_3521)
                                          %_3522
                                          %_3530
                                          '#t
                                          %_3531)))
                                    %_3524)
                             ((lambda (%_3525)
                                (if %_3525
                                  (apply (lambda (%_3527 %_3528 %_3529)
                                           (%_3356
                                             %_3519
                                             %_3520
                                             (cdr %_3521)
                                             %_3522
                                             %_3527
                                             %_3528
                                             %_3529))
                                         %_3525)
                                  (syntax-error
                                    (car %_3521)
                                    '"invalid syntax-case clause")))
                              ($syntax-dispatch
                                (compile-in-annotation %_3523 value)
                                '(any any any)))))
                         ($syntax-dispatch
                           (compile-in-annotation %_3523 value)
                           '(any any))))
                      (car %_3521)))))
               (%_3356
                 (lambda (%_3448
                          %_3449
                          %_3450
                          %_3451
                          %_3452
                          %_3453
                          %_3454)
                   (call-with-values
                     (lambda () (%_3354 %_3452 %_3449))
                     (lambda (%_3455 %_3456)
                       (if (not (%_3058 (map car %_3456)))
                         (%_3059
                           (map car %_3456)
                           %_3452
                           '"pattern variable")
                         (if (not (andmap
                                    (lambda (%_3518)
                                      (not (%_3118 (car %_3518))))
                                    %_3456))
                           (syntax-error
                             %_3452
                             '"misplaced ellipsis in syntax-case pattern")
                           ((lambda (%_3457)
                              (list (list 'lambda
                                          (list %_3457)
                                          (list 'if
                                                ((lambda (%_3468)
                                                   (if %_3468
                                                     (apply (lambda () %_3457)
                                                            %_3468)
                                                     (list 'if
                                                           %_3457
                                                           (%_3355
                                                             %_3456
                                                             %_3453
                                                             %_3457
                                                             %_3451)
                                                           (list 'quote '#f))))
                                                 ($syntax-dispatch
                                                   (compile-in-annotation
                                                     %_3453
                                                     value)
                                                   '#2(atom #t)))
                                                (%_3355
                                                  %_3456
                                                  %_3454
                                                  %_3457
                                                  %_3451)
                                                (%_3357
                                                  %_3448
                                                  %_3449
                                                  %_3450
                                                  %_3451)))
                                    (if (eq? %_3455 'any)
                                      (list 'list
                                            (cons 'compile-in-annotation
                                                  (cons %_3448 '(value))))
                                      (list '$syntax-dispatch
                                            (cons 'compile-in-annotation
                                                  (cons %_3448 '(value)))
                                            (list 'quote %_3455)))))
                            (%_3122 'tmp))))))))
               (%_3355
                 (lambda (%_3432 %_3433 %_3434 %_3435)
                   ((lambda (%_3437 %_3436)
                      ((lambda (%_3439 %_3438)
                         (list 'apply
                               (list 'lambda
                                     %_3439
                                     (%_3103
                                       %_3433
                                       (%_2941
                                         %_3438
                                         (map (lambda (%_3440 %_3441)
                                                (%_2925
                                                  'syntax
                                                  (cons %_3440 %_3441)))
                                              %_3439
                                              (map cdr %_3432))
                                         %_3435)
                                       (%_3039 %_3436 %_3438 '(()))))
                               %_3434))
                       (map %_3122 %_3436)
                       (%_3002 %_3436)))
                    (map cdr %_3432)
                    (map car %_3432))))
               (%_3354
                 (lambda (%_3380 %_3381)
                   (letrec ((%_3383
                              (lambda (%_3391 %_3392 %_3393)
                                (if (%_2955 %_3391)
                                  (if (%_3060 %_3391 %_3381)
                                    (values (vector 'free-id %_3391) %_3393)
                                    (values
                                      'any
                                      (cons (cons %_3391 %_3392) %_3393)))
                                  ((lambda (%_3395)
                                     (if (if %_3395
                                           (apply (lambda (%_3430 %_3431)
                                                    (%_3118 %_3431))
                                                  %_3395)
                                           '#f)
                                       (apply (lambda (%_3426 %_3427)
                                                (call-with-values
                                                  (lambda ()
                                                    (%_3383
                                                      %_3426
                                                      (+ %_3392 '1)
                                                      %_3393))
                                                  (lambda (%_3428 %_3429)
                                                    (values
                                                      (if (eq? %_3428 'any)
                                                        'each-any
                                                        (vector 'each %_3428))
                                                      %_3429))))
                                              %_3395)
                                       ((lambda (%_3396)
                                          (if (if %_3396
                                                (apply (lambda (%_3422
                                                                %_3423
                                                                %_3424
                                                                %_3425)
                                                         (%_3118 %_3423))
                                                       %_3396)
                                                '#f)
                                            (apply (lambda (%_3411
                                                            %_3412
                                                            %_3413
                                                            %_3414)
                                                     (call-with-values
                                                       (lambda ()
                                                         (%_3383
                                                           %_3414
                                                           %_3392
                                                           %_3393))
                                                       (lambda (%_3415 %_3416)
                                                         (call-with-values
                                                           (lambda ()
                                                             (%_3382
                                                               %_3413
                                                               %_3392
                                                               %_3416))
                                                           (lambda (%_3418
                                                                    %_3419)
                                                             (call-with-values
                                                               (lambda ()
                                                                 (%_3383
                                                                   %_3411
                                                                   (+ %_3392
                                                                      '1)
                                                                   %_3419))
                                                               (lambda (%_3420
                                                                        %_3421)
                                                                 (values
                                                                   (vector
                                                                     'each+
                                                                     %_3420
                                                                     (reverse
                                                                       %_3418)
                                                                     %_3415)
                                                                   %_3421))))))))
                                                   %_3396)
                                            ((lambda (%_3397)
                                               (if %_3397
                                                 (apply (lambda (%_3405 %_3406)
                                                          (call-with-values
                                                            (lambda ()
                                                              (%_3383
                                                                %_3406
                                                                %_3392
                                                                %_3393))
                                                            (lambda (%_3407
                                                                     %_3408)
                                                              (call-with-values
                                                                (lambda ()
                                                                  (%_3383
                                                                    %_3405
                                                                    %_3392
                                                                    %_3408))
                                                                (lambda (%_3409
                                                                         %_3410)
                                                                  (values
                                                                    (cons %_3409
                                                                          %_3407)
                                                                    %_3410))))))
                                                        %_3397)
                                                 ((lambda (%_3398)
                                                    (if %_3398
                                                      (apply (lambda ()
                                                               (values
                                                                 '()
                                                                 %_3393))
                                                             %_3398)
                                                      ((lambda (%_3399)
                                                         (if %_3399
                                                           (apply (lambda (%_3401)
                                                                    (call-with-values
                                                                      (lambda ()
                                                                        (%_3383
                                                                          %_3401
                                                                          %_3392
                                                                          %_3393))
                                                                      (lambda (%_3403
                                                                               %_3404)
                                                                        (values
                                                                          (vector
                                                                            'vector
                                                                            %_3403)
                                                                          %_3404))))
                                                                  %_3399)
                                                           (values
                                                             (vector
                                                               'atom
                                                               (%_3121
                                                                 %_3391
                                                                 '(())))
                                                             %_3393)))
                                                       ($syntax-dispatch
                                                         (compile-in-annotation
                                                           %_3391
                                                           value)
                                                         '#2(vector
                                                             each-any)))))
                                                  ($syntax-dispatch
                                                    (compile-in-annotation
                                                      %_3391
                                                      value)
                                                    '()))))
                                             ($syntax-dispatch
                                               (compile-in-annotation
                                                 %_3391
                                                 value)
                                               '(any . any)))))
                                        ($syntax-dispatch
                                          (compile-in-annotation %_3391 value)
                                          '(any any . #4(each+ any () any))))))
                                   ($syntax-dispatch
                                     (compile-in-annotation %_3391 value)
                                     '(any any))))))
                            (%_3382
                              (lambda (%_3384 %_3385 %_3386)
                                (if (null? %_3384)
                                  (values '() %_3386)
                                  (call-with-values
                                    (lambda ()
                                      (%_3382 (cdr %_3384) %_3385 %_3386))
                                    (lambda (%_3387 %_3388)
                                      (call-with-values
                                        (lambda ()
                                          (%_3383 (car %_3384) %_3385 %_3388))
                                        (lambda (%_3389 %_3390)
                                          (values
                                            (cons %_3389 %_3387)
                                            %_3390)))))))))
                     (%_3383 %_3380 '0 '())))))
        (lambda (%_3358 %_3359 %_3360 %_3361)
          ((lambda (%_3362)
             ((lambda (%_3364)
                (if %_3364
                  (apply (lambda (%_3365 %_3366 %_3367 %_3368)
                           (if (andmap
                                 (lambda (%_3378)
                                   (if (%_2955 %_3378)
                                     (not (%_3118 %_3378))
                                     '#f))
                                 %_3367)
                             ((lambda (%_3369)
                                (if %_3361
                                  (list 'compile-in-annotation
                                        (list (list 'lambda
                                                    (list %_3369)
                                                    (%_3357
                                                      %_3369
                                                      %_3367
                                                      %_3368
                                                      %_3359))
                                              (%_3103 %_3366 %_3359 '(())))
                                        %_3361)
                                  (list (list 'lambda
                                              (list %_3369)
                                              (%_3357
                                                %_3369
                                                %_3367
                                                %_3368
                                                %_3359))
                                        (%_3103 %_3366 %_3359 '(())))))
                              (%_3122 'tmp))
                             (syntax-error
                               %_3362
                               '"invalid literals list in")))
                         %_3364)
                  (syntax-error %_3362)))
              ($syntax-dispatch
                (compile-in-annotation %_3362 value)
                '(any any each-any . each-any))))
           (%_3062 %_3358 %_3360 %_3361)))))
    (set! sc-expand
      ((lambda (%_3536)
         ((lambda (%_3537)
            (lambda (%_3539 . %_3538)
              (if (if (pair? %_3539)
                    (equal? (car %_3539) '"noexpand")
                    '#f)
                (cadr %_3539)
                (if (null? %_3538)
                  (%_3068 %_3539 '() %_3537 '(l c) '(l) %_3536)
                  (%_3068
                    %_3539
                    '()
                    %_3537
                    (car %_3538)
                    (cadr %_3538)
                    %_3536)))))
          (%_2962
            (%_2963 '((top)))
            (cons %_3536 (%_2964 '((top)))))))
       ((lambda (%_3540)
          (begin (%_3037 %_3540 '*top*) %_3540))
        (%_3003 '() '() '()))))
    (set! identifier?
      (lambda (%_3541) (%_2949 %_3541)))
    (set! datum->syntax-object
      (lambda (%_3542 %_3543)
        (begin
          (if (not (%_2949 %_3542))
            (%_2776
              'datum->syntax-object
              '"invalid argument"
              %_3542)
            (void))
          (%_2897 %_3543 (%_2900 %_3542)))))
    (set! syntax-object->datum
      (lambda (%_3545) (%_3121 %_3545 '(()))))
    (set! generate-temporaries
      (lambda (%_3546)
        (begin
          (if (not (list? %_3546))
            (%_2776
              'generate-temporaries
              '"invalid argument"
              %_3546)
            (void))
          (map (lambda (%_3548) (%_3061 (gensym) '((top))))
               %_3546))))
    (set! free-identifier=?
      (lambda (%_3549 %_3550)
        (begin
          (if (not (%_2949 %_3549))
            (%_2776
              'free-identifier=?
              '"invalid argument"
              %_3549)
            (void))
          (if (not (%_2949 %_3550))
            (%_2776
              'free-identifier=?
              '"invalid argument"
              %_3550)
            (void))
          (%_3049 %_3549 %_3550))))
    (set! bound-identifier=?
      (lambda (%_3553 %_3554)
        (begin
          (if (not (%_2949 %_3553))
            (%_2776
              'bound-identifier=?
              '"invalid argument"
              %_3553)
            (void))
          (if (not (%_2949 %_3554))
            (%_2776
              'bound-identifier=?
              '"invalid argument"
              %_3554)
            (void))
          (%_3051 %_3553 %_3554))))
    (set! literal-identifier=?
      (lambda (%_3557 %_3558)
        (begin
          (if (not (%_2949 %_3557))
            (%_2776
              'literal-identifier=?
              '"invalid argument"
              %_3557)
            (void))
          (if (not (%_2949 %_3558))
            (%_2776
              'literal-identifier=?
              '"invalid argument"
              %_3558)
            (void))
          (%_3050 %_3557 %_3558))))
    (set! syntax-error
      (lambda (%_3562 . %_3561)
        (begin
          (for-each
            (lambda (%_3563)
              (if (not (string? %_3563))
                (%_2776 'syntax-error '"invalid argument" %_3563)
                (void)))
            %_3561)
          ((lambda (%_3565)
             (%_2776 '#f %_3565 (%_3121 %_3562 '(()))))
           (if (null? %_3561)
             '"invalid syntax"
             (apply string-append %_3561))))))
    (letrec ((%_3572
               (lambda (%_3613 %_3614 %_3615 %_3616)
                 (if (not %_3616)
                   '#f
                   (if (eq? %_3614 'any)
                     (cons (%_3061 %_3613 %_3615) %_3616)
                     (if (%_2898 %_3613)
                       (%_3571
                         ((lambda (%_3618)
                            (if (annotation? %_3618)
                              (annotation-expression %_3618)
                              %_3618))
                          (%_2899 %_3613))
                         %_3614
                         (%_3042 %_3615 (%_2900 %_3613))
                         %_3616)
                       (%_3571
                         (if (annotation? %_3613)
                           (annotation-expression %_3613)
                           %_3613)
                         %_3614
                         %_3615
                         %_3616))))))
             (%_3571
               (lambda (%_3603 %_3604 %_3605 %_3606)
                 (if (null? %_3604)
                   (if (null? %_3603) %_3606 '#f)
                   (if (pair? %_3604)
                     (if (pair? %_3603)
                       (%_3572
                         (car %_3603)
                         (car %_3604)
                         %_3605
                         (%_3572 (cdr %_3603) (cdr %_3604) %_3605 %_3606))
                       '#f)
                     (if (eq? %_3604 'each-any)
                       ((lambda (%_3612)
                          (if %_3612 (cons %_3612 %_3606) '#f))
                        (%_3568 %_3603 %_3605))
                       ((lambda (%_3607)
                          (if (memv %_3607 '(each))
                            (if (null? %_3603)
                              (%_3569 (vector-ref %_3604 '1) %_3606)
                              ((lambda (%_3611)
                                 (if %_3611 (%_3570 %_3611 %_3606) '#f))
                               (%_3566 %_3603 (vector-ref %_3604 '1) %_3605)))
                            (if (memv %_3607 '(free-id))
                              (if (%_2955 %_3603)
                                (if (%_3050
                                      (%_3061 %_3603 %_3605)
                                      (vector-ref %_3604 '1))
                                  %_3606
                                  '#f)
                                '#f)
                              (if (memv %_3607 '(each+))
                                (call-with-values
                                  (lambda ()
                                    (%_3567
                                      %_3603
                                      (vector-ref %_3604 '1)
                                      (vector-ref %_3604 '2)
                                      (vector-ref %_3604 '3)
                                      %_3605
                                      %_3606))
                                  (lambda (%_3608 %_3609 %_3610)
                                    (if %_3610
                                      (if (null? %_3609)
                                        (if (null? %_3608)
                                          (%_3569
                                            (vector-ref %_3604 '1)
                                            %_3610)
                                          (%_3570 %_3608 %_3610))
                                        '#f)
                                      '#f)))
                                (if (memv %_3607 '(atom))
                                  (if (equal?
                                        (vector-ref %_3604 '1)
                                        (%_3121 %_3603 %_3605))
                                    %_3606
                                    '#f)
                                  (if (memv %_3607 '(vector))
                                    (if (vector? %_3603)
                                      (%_3572
                                        (vector->list %_3603)
                                        (vector-ref %_3604 '1)
                                        %_3605
                                        %_3606)
                                      '#f)
                                    (void)))))))
                        (vector-ref %_3604 '0)))))))
             (%_3570
               (lambda (%_3601 %_3602)
                 (if (null? (car %_3601))
                   %_3602
                   (cons (map car %_3601)
                         (%_3570 (map cdr %_3601) %_3602)))))
             (%_3569
               (lambda (%_3598 %_3599)
                 (if (null? %_3598)
                   %_3599
                   (if (eq? %_3598 'any)
                     (cons '() %_3599)
                     (if (pair? %_3598)
                       (%_3569
                         (car %_3598)
                         (%_3569 (cdr %_3598) %_3599))
                       (if (eq? %_3598 'each-any)
                         (cons '() %_3599)
                         ((lambda (%_3600)
                            (if (memv %_3600 '(each))
                              (%_3569 (vector-ref %_3598 '1) %_3599)
                              (if (memv %_3600 '(each+))
                                (%_3569
                                  (vector-ref %_3598 '1)
                                  (%_3569
                                    (reverse (vector-ref %_3598 '2))
                                    (%_3569 (vector-ref %_3598 '3) %_3599)))
                                (if (memv %_3600 '(free-id atom))
                                  %_3599
                                  (if (memv %_3600 '(vector))
                                    (%_3569 (vector-ref %_3598 '1) %_3599)
                                    (void))))))
                          (vector-ref %_3598 '0))))))))
             (%_3568
               (lambda (%_3595 %_3596)
                 (if (annotation? %_3595)
                   (%_3568 (annotation-expression %_3595) %_3596)
                   (if (pair? %_3595)
                     ((lambda (%_3597)
                        (if %_3597
                          (cons (%_3061 (car %_3595) %_3596) %_3597)
                          '#f))
                      (%_3568 (cdr %_3595) %_3596))
                     (if (null? %_3595)
                       '()
                       (if (%_2898 %_3595)
                         (%_3568
                           (%_2899 %_3595)
                           (%_3042 %_3596 (%_2900 %_3595)))
                         '#f))))))
             (%_3567
               (lambda (%_3582 %_3583 %_3584 %_3585 %_3586 %_3587)
                 ((letrec ((%_3588
                             (lambda (%_3589 %_3590)
                               (if (pair? %_3589)
                                 (call-with-values
                                   (lambda () (%_3588 (cdr %_3589) %_3590))
                                   (lambda (%_3591 %_3592 %_3593)
                                     (if %_3593
                                       (if (null? %_3592)
                                         ((lambda (%_3594)
                                            (if %_3594
                                              (values
                                                (cons %_3594 %_3591)
                                                %_3592
                                                %_3593)
                                              (values '#f '#f '#f)))
                                          (%_3572
                                            (car %_3589)
                                            %_3583
                                            %_3590
                                            '()))
                                         (values
                                           '()
                                           (cdr %_3592)
                                           (%_3572
                                             (car %_3589)
                                             (car %_3592)
                                             %_3590
                                             %_3593)))
                                       (values '#f '#f '#f))))
                                 (if (annotation? %_3589)
                                   (%_3588
                                     (annotation-expression %_3589)
                                     %_3590)
                                   (if (%_2898 %_3589)
                                     (%_3588
                                       (%_2899 %_3589)
                                       (%_3042 %_3590 (%_2900 %_3589)))
                                     (values
                                       '()
                                       %_3584
                                       (%_3572
                                         %_3589
                                         %_3585
                                         %_3590
                                         %_3587))))))))
                    %_3588)
                  %_3582
                  %_3586)))
             (%_3566
               (lambda (%_3577 %_3578 %_3579)
                 (if (annotation? %_3577)
                   (%_3566
                     (annotation-expression %_3577)
                     %_3578
                     %_3579)
                   (if (pair? %_3577)
                     ((lambda (%_3580)
                        (if %_3580
                          ((lambda (%_3581)
                             (if %_3581 (cons %_3580 %_3581) '#f))
                           (%_3566 (cdr %_3577) %_3578 %_3579))
                          '#f))
                      (%_3572 (car %_3577) %_3578 %_3579 '()))
                     (if (null? %_3577)
                       '()
                       (if (%_2898 %_3577)
                         (%_3566
                           (%_2899 %_3577)
                           %_3578
                           (%_3042 %_3579 (%_2900 %_3577)))
                         '#f)))))))
      (set! $syntax-dispatch
        (lambda (%_3573 %_3574)
          (if (eq? %_3574 'any)
            (list %_3573)
            (if (%_2898 %_3573)
              (%_3571
                ((lambda (%_3576)
                   (if (annotation? %_3576)
                     (annotation-expression %_3576)
                     %_3576))
                 (%_2899 %_3573))
                %_3574
                (%_2900 %_3573)
                '())
              (%_3571
                (if (annotation? %_3573)
                  (annotation-expression %_3573)
                  %_3573)
                %_3574
                '(())
                '()))))))))
($sc-put-cte
  'with-syntax
  (lambda (%_4658)
    ((lambda (%_4660)
       (if %_4660
         (apply (lambda (%_4677 %_4678 %_4679)
                  (cons '#3(syntax-object
                            begin
                            ((top)
                             #4(ribcage #3(_ e1 e2) #3((top)) #3("i" "i" "i"))
                             #4(ribcage ())
                             #4(ribcage #1(x) #1((top)) #1("i"))
                             #4(ribcage (#2(import-token *top*)) ())))
                        (cons %_4678 %_4679)))
                %_4660)
         ((lambda (%_4661)
            (if %_4661
              (apply (lambda (%_4671 %_4672 %_4673 %_4674 %_4675)
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
                             %_4673
                             '()
                             (list %_4672
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
                                         (cons %_4674 %_4675)))))
                     %_4661)
              ((lambda (%_4662)
                 (if %_4662
                   (apply (lambda (%_4663 %_4664 %_4665 %_4666 %_4667)
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
                                        %_4665)
                                  '()
                                  (list %_4664
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
                                              (cons %_4666 %_4667)))))
                          %_4662)
                   (syntax-error %_4658)))
               ($syntax-dispatch
                 (compile-in-annotation %_4658 value)
                 '(any #2(each (any any)) any . each-any)))))
          ($syntax-dispatch
            (compile-in-annotation %_4658 value)
            '(any ((any any)) any . each-any)))))
     ($syntax-dispatch
       (compile-in-annotation %_4658 value)
       '(any () any . each-any)))))
($sc-put-cte
  'syntax-rules
  (lambda (%_4681)
    ((lambda (%_4683)
       (if %_4683
         (apply (lambda (%_4684 %_4685 %_4686 %_4687 %_4688)
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
                                    (cons %_4685
                                          (map (lambda (%_4691 %_4690)
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
                                                             %_4690)
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
                                                             %_4691)))
                                               %_4688
                                               %_4687))))))
                %_4683)
         (syntax-error %_4681)))
     ($syntax-dispatch
       (compile-in-annotation %_4681 value)
       '(any each-any . #2(each ((any . any) any)))))))
($sc-put-cte
  'or
  (lambda (%_4692)
    ((lambda (%_4694)
       (if %_4694
         (apply (lambda (%_4704)
                  '#3(syntax-object
                      #f
                      ((top)
                       #4(ribcage #1(_) #1((top)) #1("i"))
                       #4(ribcage ())
                       #4(ribcage #1(x) #1((top)) #1("i"))
                       #4(ribcage (#2(import-token *top*)) ()))))
                %_4694)
         ((lambda (%_4695)
            (if %_4695
              (apply (lambda (%_4702 %_4703) %_4703) %_4695)
              ((lambda (%_4696)
                 (if %_4696
                   (apply (lambda (%_4697 %_4698 %_4699 %_4700)
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
                                              %_4698))
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
                                              (cons %_4699 %_4700)))))
                          %_4696)
                   (syntax-error %_4692)))
               ($syntax-dispatch
                 (compile-in-annotation %_4692 value)
                 '(any any any . each-any)))))
          ($syntax-dispatch
            (compile-in-annotation %_4692 value)
            '(any any)))))
     ($syntax-dispatch
       (compile-in-annotation %_4692 value)
       '(any)))))
($sc-put-cte
  'and
  (lambda (%_4705)
    ((lambda (%_4707)
       (if %_4707
         (apply (lambda (%_4713 %_4714 %_4715 %_4716)
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
                        (cons %_4714
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
                                          (cons %_4715 %_4716))
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
                %_4707)
         ((lambda (%_4708)
            (if %_4708
              (apply (lambda (%_4711 %_4712) %_4712) %_4708)
              ((lambda (%_4709)
                 (if %_4709
                   (apply (lambda (%_4710)
                            '#3(syntax-object
                                #t
                                ((top)
                                 #4(ribcage #1(_) #1((top)) #1("i"))
                                 #4(ribcage ())
                                 #4(ribcage #1(x) #1((top)) #1("i"))
                                 #4(ribcage (#2(import-token *top*)) ()))))
                          %_4709)
                   (syntax-error %_4705)))
               ($syntax-dispatch
                 (compile-in-annotation %_4705 value)
                 '(any)))))
          ($syntax-dispatch
            (compile-in-annotation %_4705 value)
            '(any any)))))
     ($syntax-dispatch
       (compile-in-annotation %_4705 value)
       '(any any any . each-any)))))
($sc-put-cte
  'let
  (lambda (%_4718)
    ((lambda (%_4720)
       (if (if %_4720
             (apply (lambda (%_4746 %_4747 %_4748 %_4749 %_4750)
                      (andmap identifier? %_4747))
                    %_4720)
             '#f)
         (apply (lambda (%_4738 %_4739 %_4740 %_4741 %_4742)
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
                              (cons %_4739 (cons %_4741 %_4742)))
                        %_4740))
                %_4720)
         ((lambda (%_4721)
            (if (if %_4721
                  (apply (lambda (%_4731 %_4732 %_4733 %_4734 %_4735 %_4736)
                           (andmap identifier? (cons %_4732 %_4733)))
                         %_4721)
                  '#f)
              (apply (lambda (%_4722 %_4723 %_4724 %_4725 %_4726 %_4727)
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
                                   (list (list %_4723
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
                                                     (cons %_4724
                                                           (cons %_4726
                                                                 %_4727)))))
                                   %_4723)
                             %_4725))
                     %_4721)
              (syntax-error %_4718)))
          ($syntax-dispatch
            (compile-in-annotation %_4718 value)
            '(any any #2(each (any any)) any . each-any)))))
     ($syntax-dispatch
       (compile-in-annotation %_4718 value)
       '(any #2(each (any any)) any . each-any)))))
($sc-put-cte
  'let*
  (lambda (%_4752)
    ((lambda (%_4754)
       (if (if %_4754
             (apply (lambda (%_4769 %_4770 %_4771 %_4772 %_4773)
                      (andmap identifier? %_4770))
                    %_4754)
             '#f)
         (apply (lambda (%_4755 %_4756 %_4757 %_4758 %_4759)
                  ((letrec ((%_4760
                              (lambda (%_4761)
                                (if (null? %_4761)
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
                                        (cons '() (cons %_4758 %_4759)))
                                  ((lambda (%_4762)
                                     ((lambda (%_4763)
                                        (if %_4763
                                          (apply (lambda (%_4764 %_4765)
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
                                                         (list %_4765)
                                                         %_4764))
                                                 %_4763)
                                          (syntax-error %_4762)))
                                      ($syntax-dispatch
                                        (compile-in-annotation %_4762 value)
                                        '(any any))))
                                   (list (%_4760 (cdr %_4761))
                                         (car %_4761)))))))
                     %_4760)
                   (map list %_4756 %_4757)))
                %_4754)
         (syntax-error %_4752)))
     ($syntax-dispatch
       (compile-in-annotation %_4752 value)
       '(any #2(each (any any)) any . each-any)))))
($sc-put-cte
  'cond
  (lambda (%_4775)
    ((lambda (%_4777)
       (if %_4777
         (apply (lambda (%_4778 %_4779 %_4780)
                  ((letrec ((%_4781
                              (lambda (%_4782 %_4783)
                                (if (null? %_4783)
                                  ((lambda (%_4799)
                                     (if %_4799
                                       (apply (lambda (%_4811 %_4812)
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
                                                      (cons %_4811 %_4812)))
                                              %_4799)
                                       ((lambda (%_4800)
                                          (if %_4800
                                            (apply (lambda (%_4810)
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
                                                                             %_4810))
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
                                                   %_4800)
                                            ((lambda (%_4801)
                                               (if %_4801
                                                 (apply (lambda (%_4808 %_4809)
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
                                                                            %_4808))
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
                                                                      (cons %_4809
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
                                                        %_4801)
                                                 ((lambda (%_4802)
                                                    (if %_4802
                                                      (apply (lambda (%_4804
                                                                      %_4805
                                                                      %_4806)
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
                                                                     %_4804
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
                                                                           (cons %_4805
                                                                                 %_4806))))
                                                             %_4802)
                                                      (syntax-error %_4775)))
                                                  ($syntax-dispatch
                                                    (compile-in-annotation
                                                      %_4782
                                                      value)
                                                    '(any any . each-any)))))
                                             ($syntax-dispatch
                                               (compile-in-annotation
                                                 %_4782
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
                                          (compile-in-annotation %_4782 value)
                                          '(any)))))
                                   ($syntax-dispatch
                                     (compile-in-annotation %_4782 value)
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
                                  ((lambda (%_4784)
                                     ((lambda (%_4787)
                                        (if %_4787
                                          (apply (lambda (%_4797)
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
                                                                     %_4797))
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
                                                               %_4784)))
                                                 %_4787)
                                          ((lambda (%_4788)
                                             (if %_4788
                                               (apply (lambda (%_4795 %_4796)
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
                                                                          %_4795))
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
                                                                    (cons %_4796
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
                                                                    %_4784)))
                                                      %_4788)
                                               ((lambda (%_4789)
                                                  (if %_4789
                                                    (apply (lambda (%_4791
                                                                    %_4792
                                                                    %_4793)
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
                                                                   %_4791
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
                                                                         (cons %_4792
                                                                               %_4793))
                                                                   %_4784))
                                                           %_4789)
                                                    (syntax-error %_4775)))
                                                ($syntax-dispatch
                                                  (compile-in-annotation
                                                    %_4782
                                                    value)
                                                  '(any any . each-any)))))
                                           ($syntax-dispatch
                                             (compile-in-annotation
                                               %_4782
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
                                        (compile-in-annotation %_4782 value)
                                        '(any))))
                                   (%_4781 (car %_4783) (cdr %_4783)))))))
                     %_4781)
                   %_4779
                   %_4780))
                %_4777)
         (syntax-error %_4775)))
     ($syntax-dispatch
       (compile-in-annotation %_4775 value)
       '(any any . each-any)))))
($sc-put-cte
  'do
  (lambda (%_4815)
    ((lambda (%_4817)
       (if %_4817
         (apply (lambda (%_4818
                         %_4819
                         %_4820
                         %_4821
                         %_4822
                         %_4823
                         %_4824)
                  ((lambda (%_4825)
                     ((lambda (%_4835)
                        (if %_4835
                          (apply (lambda (%_4836)
                                   ((lambda (%_4839)
                                      (if %_4839
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
                                                       (map list %_4819 %_4820)
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
                                                                   %_4822)
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
                                                                     %_4824
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
                                                                                 %_4836)))))))
                                               %_4839)
                                        ((lambda (%_4840)
                                           (if %_4840
                                             (apply (lambda (%_4841 %_4842)
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
                                                                 %_4819
                                                                 %_4820)
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
                                                                  %_4822
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
                                                                        (cons %_4841
                                                                              %_4842))
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
                                                                          %_4824
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
                                                                                      %_4836)))))))
                                                    %_4840)
                                             (syntax-error %_4823)))
                                         ($syntax-dispatch
                                           (compile-in-annotation %_4823 value)
                                           '(any . each-any)))))
                                    ($syntax-dispatch
                                      (compile-in-annotation %_4823 value)
                                      '())))
                                 %_4835)
                          (syntax-error %_4825)))
                      ($syntax-dispatch
                        (compile-in-annotation %_4825 value)
                        'each-any)))
                   (map (lambda (%_4826 %_4827)
                          ((lambda (%_4829)
                             (if %_4829
                               (apply (lambda () %_4826) %_4829)
                               ((lambda (%_4830)
                                  (if %_4830
                                    (apply (lambda (%_4832) %_4832) %_4830)
                                    (syntax-error %_4815)))
                                ($syntax-dispatch
                                  (compile-in-annotation %_4827 value)
                                  '(any)))))
                           ($syntax-dispatch
                             (compile-in-annotation %_4827 value)
                             '())))
                        %_4819
                        %_4821)))
                %_4817)
         (syntax-error %_4815)))
     ($syntax-dispatch
       (compile-in-annotation %_4815 value)
       '(any #2(each (any any . any))
             (any . each-any)
             .
             each-any)))))
($sc-put-cte
  'quasiquote
  (letrec ((%_4860
             (lambda (%_4949 %_4950)
               ((lambda (%_4952)
                  (if %_4952
                    (apply (lambda (%_4972)
                             (if (= %_4950 '0)
                               %_4972
                               (%_4857
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
                                 (%_4860 (list %_4972) (- %_4950 '1)))))
                           %_4952)
                    ((lambda (%_4953)
                       (if %_4953
                         (apply (lambda (%_4968 %_4969)
                                  (if (= %_4950 '0)
                                    (%_4856 %_4968 (%_4860 %_4969 %_4950))
                                    (%_4857
                                      (%_4857
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
                                        (%_4860 %_4968 (- %_4950 '1)))
                                      (%_4860 %_4969 %_4950))))
                                %_4953)
                         ((lambda (%_4954)
                            (if %_4954
                              (apply (lambda (%_4964 %_4965)
                                       (if (= %_4950 '0)
                                         (%_4858 %_4964 (%_4860 %_4965 %_4950))
                                         (%_4857
                                           (%_4857
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
                                             (%_4860 %_4964 (- %_4950 '1)))
                                           (%_4860 %_4965 %_4950))))
                                     %_4954)
                              ((lambda (%_4955)
                                 (if %_4955
                                   (apply (lambda (%_4963)
                                            (%_4857
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
                                              (%_4860
                                                (list %_4963)
                                                (+ %_4950 '1))))
                                          %_4955)
                                   ((lambda (%_4956)
                                      (if %_4956
                                        (apply (lambda (%_4961 %_4962)
                                                 (%_4857
                                                   (%_4860 %_4961 %_4950)
                                                   (%_4860 %_4962 %_4950)))
                                               %_4956)
                                        ((lambda (%_4957)
                                           (if %_4957
                                             (apply (lambda (%_4959)
                                                      (%_4859
                                                        (%_4860
                                                          %_4959
                                                          %_4950)))
                                                    %_4957)
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
                                                   %_4949)))
                                         ($syntax-dispatch
                                           (compile-in-annotation %_4949 value)
                                           '#2(vector each-any)))))
                                    ($syntax-dispatch
                                      (compile-in-annotation %_4949 value)
                                      '(any . any)))))
                               ($syntax-dispatch
                                 (compile-in-annotation %_4949 value)
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
                            (compile-in-annotation %_4949 value)
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
                       (compile-in-annotation %_4949 value)
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
                  (compile-in-annotation %_4949 value)
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
           (%_4859
             (lambda (%_4912)
               ((lambda (%_4916)
                  (if (if %_4916
                        (apply (lambda (%_4947 %_4948) (%_4852 %_4947))
                               %_4916)
                        '#f)
                    (apply (lambda (%_4944 %_4945)
                             (list '#3(syntax-object
                                       quote
                                       ((top)
                                        #4(ribcage
                                           #2(quote? x)
                                           #2((top))
                                           #2("i" "i"))
                                        #4(ribcage #1(pat-x) #1((top)) #1("i"))
                                        #4(ribcage ())
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
                                   (list->vector %_4945)))
                           %_4916)
                    ((letrec ((%_4918
                                (lambda (%_4919 %_4920)
                                  ((lambda (%_4922)
                                     (if (if %_4922
                                           (apply (lambda (%_4941 %_4942)
                                                    (%_4852 %_4941))
                                                  %_4922)
                                           '#f)
                                       (apply (lambda (%_4938 %_4939)
                                                (%_4920
                                                  (map (lambda (%_4940)
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
                                                               %_4940))
                                                       %_4939)))
                                              %_4922)
                                       ((lambda (%_4923)
                                          (if (if %_4923
                                                (apply (lambda (%_4936 %_4937)
                                                         (%_4853 %_4936))
                                                       %_4923)
                                                '#f)
                                            (apply (lambda (%_4933 %_4934)
                                                     (%_4920 %_4934))
                                                   %_4923)
                                            ((lambda (%_4924)
                                               (if (if %_4924
                                                     (apply (lambda (%_4930
                                                                     %_4931
                                                                     %_4932)
                                                              (%_4854 %_4930))
                                                            %_4924)
                                                     '#f)
                                                 (apply (lambda (%_4926
                                                                 %_4927
                                                                 %_4928)
                                                          (%_4918
                                                            %_4928
                                                            (lambda (%_4929)
                                                              (%_4920
                                                                (cons %_4927
                                                                      %_4929)))))
                                                        %_4924)
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
                                                       %_4912)))
                                             ($syntax-dispatch
                                               (compile-in-annotation
                                                 %_4919
                                                 value)
                                               '(any any any)))))
                                        ($syntax-dispatch
                                          (compile-in-annotation %_4919 value)
                                          '(any . each-any)))))
                                   ($syntax-dispatch
                                     (compile-in-annotation %_4919 value)
                                     '(any each-any))))))
                       %_4918)
                     %_4912
                     (lambda (%_4943)
                       (cons '#3(syntax-object
                                 vector
                                 ((top)
                                  #4(ribcage ())
                                  #4(ribcage ())
                                  #4(ribcage #1(ls) #1((top)) #1("i"))
                                  #4(ribcage #1(_) #1((top)) #1("i"))
                                  #4(ribcage #1(pat-x) #1((top)) #1("i"))
                                  #4(ribcage ())
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
                             %_4943)))))
                ($syntax-dispatch
                  (compile-in-annotation %_4912 value)
                  '(any each-any)))))
           (%_4858
             (lambda (%_4903 %_4904)
               ((lambda (%_4905)
                  (if (null? %_4905)
                    '#3(syntax-object
                        '()
                        ((top)
                         #4(ribcage ())
                         #4(ribcage ())
                         #4(ribcage #1(ls) #1((top)) #1("i"))
                         #4(ribcage ())
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
                    (if (null? (cdr %_4905))
                      (car %_4905)
                      ((lambda (%_4907)
                         (if %_4907
                           (apply (lambda (%_4908)
                                    (cons '#3(syntax-object
                                              append
                                              ((top)
                                               #4(ribcage
                                                  #1(p)
                                                  #1((top))
                                                  #1("i"))
                                               #4(ribcage ())
                                               #4(ribcage ())
                                               #4(ribcage
                                                  #1(ls)
                                                  #1((top))
                                                  #1("i"))
                                               #4(ribcage ())
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
                                          %_4908))
                                  %_4907)
                           (syntax-error %_4905)))
                       ($syntax-dispatch
                         (compile-in-annotation %_4905 value)
                         'each-any)))))
                ((letrec ((%_4910
                            (lambda (%_4911)
                              (if (null? %_4911)
                                (if (%_4855 %_4904) '() (list %_4904))
                                (if (%_4855 (car %_4911))
                                  (%_4910 (cdr %_4911))
                                  (cons (car %_4911)
                                        (%_4910 (cdr %_4911))))))))
                   %_4910)
                 %_4903))))
           (%_4857
             (lambda (%_4878 %_4879)
               ((lambda (%_4880)
                  ((lambda (%_4881)
                     (if %_4881
                       (apply (lambda (%_4882 %_4883)
                                ((lambda (%_4885)
                                   (if (if %_4885
                                         (apply (lambda (%_4901 %_4902)
                                                  (%_4852 %_4901))
                                                %_4885)
                                         '#f)
                                     (apply (lambda (%_4892 %_4893)
                                              ((lambda (%_4895)
                                                 (if (if %_4895
                                                       (apply (lambda (%_4899
                                                                       %_4900)
                                                                (%_4852
                                                                  %_4899))
                                                              %_4895)
                                                       '#f)
                                                   (apply (lambda (%_4897
                                                                   %_4898)
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
                                                                  (cons %_4898
                                                                        %_4893)))
                                                          %_4895)
                                                   (if (null? %_4893)
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
                                                           %_4882)
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
                                                           %_4882
                                                           %_4883))))
                                               ($syntax-dispatch
                                                 (compile-in-annotation
                                                   %_4882
                                                   value)
                                                 '(any any))))
                                            %_4885)
                                     ((lambda (%_4886)
                                        (if (if %_4886
                                              (apply (lambda (%_4890 %_4891)
                                                       (%_4853 %_4890))
                                                     %_4886)
                                              '#f)
                                          (apply (lambda (%_4888 %_4889)
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
                                                         (cons %_4882 %_4889)))
                                                 %_4886)
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
                                                %_4882
                                                %_4883)))
                                      ($syntax-dispatch
                                        (compile-in-annotation %_4883 value)
                                        '(any . any)))))
                                 ($syntax-dispatch
                                   (compile-in-annotation %_4883 value)
                                   '(any any))))
                              %_4881)
                       (syntax-error %_4880)))
                   ($syntax-dispatch
                     (compile-in-annotation %_4880 value)
                     '(any any))))
                (list %_4878 %_4879))))
           (%_4856
             (lambda (%_4874 %_4875)
               ((letrec ((%_4876
                           (lambda (%_4877)
                             (if (null? %_4877)
                               %_4875
                               (%_4857 (car %_4877) (%_4876 (cdr %_4877)))))))
                  %_4876)
                %_4874)))
           (%_4855
             (lambda (%_4869)
               ((lambda (%_4871)
                  (if %_4871
                    (apply (lambda (%_4873) (%_4852 %_4873)) %_4871)
                    '#f))
                ($syntax-dispatch
                  (compile-in-annotation %_4869 value)
                  '(any ())))))
           (%_4854
             (lambda (%_4868)
               (if (identifier? %_4868)
                 (free-identifier=?
                   %_4868
                   '#3(syntax-object
                       cons
                       ((top)
                        #4(ribcage ())
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
           (%_4853
             (lambda (%_4867)
               (if (identifier? %_4867)
                 (free-identifier=?
                   %_4867
                   '#3(syntax-object
                       list
                       ((top)
                        #4(ribcage ())
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
           (%_4852
             (lambda (%_4866)
               (if (identifier? %_4866)
                 (free-identifier=?
                   %_4866
                   '#3(syntax-object
                       quote
                       ((top)
                        #4(ribcage ())
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
    (lambda (%_4861)
      ((lambda (%_4863)
         (if %_4863
           (apply (lambda (%_4864 %_4865) (%_4860 %_4865 '0))
                  %_4863)
           (syntax-error %_4861)))
       ($syntax-dispatch
         (compile-in-annotation %_4861 value)
         '(any any))))))
($sc-put-cte
  'include
  (lambda (%_4973)
    (letrec ((%_4974
               (lambda (%_4984 %_4985)
                 ((lambda (%_4986)
                    ((letrec ((%_4987
                                (lambda (%_4988)
                                  ((lambda (%_4989)
                                     (if (eof-object? %_4989)
                                       (begin
                                         (close-input-port %_4986)
                                         (reverse %_4988))
                                       (%_4987
                                         (cons (datum->syntax-object
                                                 %_4985
                                                 %_4989)
                                               %_4988))))
                                   (read-code %_4986)))))
                       %_4987)
                     '()))
                  (open-source-input-file %_4984)))))
      ((lambda (%_4976)
         (if %_4976
           (apply (lambda (%_4977 %_4978)
                    ((lambda (%_4979)
                       ((lambda (%_4980)
                          ((lambda (%_4981)
                             (if %_4981
                               (apply (lambda (%_4982)
                                        (cons '#3(syntax-object
                                                  begin
                                                  ((top)
                                                   #4(ribcage
                                                      #1(exp)
                                                      #1((top))
                                                      #1("i"))
                                                   #4(ribcage ())
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
                                              %_4982))
                                      %_4981)
                               (syntax-error %_4980)))
                           ($syntax-dispatch
                             (compile-in-annotation %_4980 value)
                             'each-any)))
                        (%_4974 %_4979 %_4977)))
                     (syntax-object->datum %_4978)))
                  %_4976)
           (syntax-error %_4973)))
       ($syntax-dispatch
         (compile-in-annotation %_4973 value)
         '(any any))))))
($sc-put-cte
  'unquote
  (lambda (%_4990)
    ((lambda (%_4992)
       (if %_4992
         (apply (lambda (%_4993 %_4994)
                  (syntax-error
                    %_4990
                    '"expression not valid outside of quasiquote"))
                %_4992)
         (syntax-error %_4990)))
     ($syntax-dispatch
       (compile-in-annotation %_4990 value)
       '(any . each-any)))))
($sc-put-cte
  'unquote-splicing
  (lambda (%_4995)
    ((lambda (%_4997)
       (if %_4997
         (apply (lambda (%_4998 %_4999)
                  (syntax-error
                    %_4995
                    '"expression not valid outside of quasiquote"))
                %_4997)
         (syntax-error %_4995)))
     ($syntax-dispatch
       (compile-in-annotation %_4995 value)
       '(any . each-any)))))
($sc-put-cte
  'case
  (lambda (%_5000)
    ((lambda (%_5002)
       (if %_5002
         (apply (lambda (%_5003 %_5004 %_5005 %_5006)
                  ((lambda (%_5007)
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
                                       %_5004))
                           %_5007))
                   ((letrec ((%_5008
                               (lambda (%_5009 %_5010)
                                 (if (null? %_5010)
                                   ((lambda (%_5022)
                                      (if %_5022
                                        (apply (lambda (%_5030 %_5031)
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
                                                       (cons %_5030 %_5031)))
                                               %_5022)
                                        ((lambda (%_5023)
                                           (if %_5023
                                             (apply (lambda (%_5025
                                                             %_5026
                                                             %_5027)
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
                                                                        %_5025))
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
                                                                  (cons %_5026
                                                                        %_5027))))
                                                    %_5023)
                                             (syntax-error %_5000)))
                                         ($syntax-dispatch
                                           (compile-in-annotation %_5009 value)
                                           '(each-any any . each-any)))))
                                    ($syntax-dispatch
                                      (compile-in-annotation %_5009 value)
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
                                   ((lambda (%_5011)
                                      ((lambda (%_5014)
                                         (if %_5014
                                           (apply (lambda (%_5016
                                                           %_5017
                                                           %_5018)
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
                                                                      %_5016))
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
                                                                (cons %_5017
                                                                      %_5018))
                                                          %_5011))
                                                  %_5014)
                                           (syntax-error %_5000)))
                                       ($syntax-dispatch
                                         (compile-in-annotation %_5009 value)
                                         '(each-any any . each-any))))
                                    (%_5008 (car %_5010) (cdr %_5010)))))))
                      %_5008)
                    %_5005
                    %_5006)))
                %_5002)
         (syntax-error %_5000)))
     ($syntax-dispatch
       (compile-in-annotation %_5000 value)
       '(any any any . each-any)))))
($sc-put-cte
  'identifier-syntax
  (lambda (%_5035)
    ((lambda (%_5037)
       (if %_5037
         (apply (lambda (%_5051 %_5052)
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
                                          %_5052))
                              (list (cons %_5051
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
                                          (cons %_5052
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
                %_5037)
         ((lambda (%_5038)
            (if (if %_5038
                  (apply (lambda (%_5045 %_5046 %_5047 %_5048 %_5049 %_5050)
                           (if (identifier? %_5046)
                             (identifier? %_5048)
                             '#f))
                         %_5038)
                  '#f)
              (apply (lambda (%_5039 %_5040 %_5041 %_5042 %_5043 %_5044)
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
                                                     %_5042
                                                     %_5043)
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
                                                     %_5044))
                                         (list (cons %_5040
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
                                                     (cons %_5041
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
                                         (list %_5040
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
                                                           %_5040))
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
                                                     %_5041))))))
                     %_5038)
              (syntax-error %_5035)))
          ($syntax-dispatch
            (compile-in-annotation %_5035 value)
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
       (compile-in-annotation %_5035 value)
       '(any any)))))
