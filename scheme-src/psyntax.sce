(letrec ((%_2952
           (lambda (%_3797)
             (eval (list '"noexpand" %_3797))))
         (%_2953
           (lambda (%_3798)
             (eval (list '"noexpand" %_3798))))
         (%_2954
           (lambda (%_3799 %_3800 %_3801)
             (error %_3799 '"~a ~s" %_3800 %_3801)))
         (%_2959
           (lambda (%_3802 %_3803)
             ($sc-put-cte %_3802 %_3803)))
         (%_2960
           (lambda (%_3804) (getprop %_3804 '*sc-expander*)))
         (%_2961
           (lambda (%_3805 %_3806) (getprop %_3805 %_3806)))
         (%_2962
           ((lambda (%_3808)
              (letrec ((%_3811
                         (lambda (%_3815)
                           ((letrec ((%_3816
                                       (lambda (%_3817 %_3818)
                                         (if (< %_3817 %_3808)
                                           (list->string
                                             (cons (%_3810 %_3817) %_3818))
                                           ((lambda (%_3819 %_3820)
                                              (%_3816
                                                %_3820
                                                (cons (%_3810 %_3819) %_3818)))
                                            (modulo %_3817 %_3808)
                                            (quotient %_3817 %_3808))))))
                              %_3816)
                            %_3815
                            '())))
                       (%_3810
                         (lambda (%_3814)
                           (string-ref
                             '"0123456789abcdefghijklmnopqrstuvwxyz"
                             %_3814))))
                ((lambda (%_3812)
                   (lambda (%_3813)
                     (begin
                       (set! %_3812 (+ %_3812 '1))
                       (string->symbol
                         (string-append
                           (symbol->string %_3813)
                           '"_"
                           (%_3811 %_3812))))))
                 '-1)))
            (string-length
              '"0123456789abcdefghijklmnopqrstuvwxyz")))
         (%_3061
           (lambda (%_3821 %_3822)
             (if (null? %_3822)
               '(if '#f '#f)
               (if (equal? '(void) (car %_3822))
                 (%_3061 %_3821 (cdr %_3822))
                 (if (null? (cdr %_3822))
                   (if %_3821
                     (list 'compile-in-annotation (car %_3822) %_3821)
                     (car %_3822))
                   (if %_3821
                     (list 'compile-in-annotation
                           (cons 'begin %_3822)
                           %_3821)
                     (cons 'begin %_3822)))))))
         (%_3062
           (lambda (%_3823 %_3824 %_3825 %_3826)
             (if (null? %_3824)
               (if %_3823
                 (list 'compile-in-annotation %_3826 %_3823)
                 %_3826)
               (if %_3823
                 (list 'compile-in-annotation
                       (list 'letrec (map list %_3824 %_3825) %_3826)
                       %_3823)
                 (list 'letrec (map list %_3824 %_3825) %_3826)))))
         (%_3063
           (lambda (%_3827 %_3828 %_3829 %_3830)
             (%_3062 %_3827 %_3828 %_3829 %_3830)))
         (%_3075
           (lambda (%_3831 %_3832)
             (vector 'syntax-object %_3831 %_3832)))
         (%_3076
           (lambda (%_3833)
             (if (vector? %_3833)
               (if (= (vector-length %_3833) '3)
                 (eq? (vector-ref %_3833 '0) 'syntax-object)
                 '#f)
               '#f)))
         (%_3077 (lambda (%_3834) (vector-ref %_3834 '1)))
         (%_3078 (lambda (%_3835) (vector-ref %_3835 '2)))
         (%_3079
           (lambda (%_3836 %_3837)
             (vector-set! %_3836 '1 %_3837)))
         (%_3080
           (lambda (%_3838 %_3839)
             (vector-set! %_3838 '2 %_3839)))
         (%_3095
           (lambda (%_3840)
             (if (annotation? %_3840)
               (annotation-source %_3840)
               (if (%_3076 %_3840) (%_3095 (%_3077 %_3840)) '#f))))
         (%_3103
           (lambda (%_3841 %_3842) (cons %_3841 %_3842)))
         (%_3108
           (lambda (%_3843)
             (if (pair? %_3843) (symbol? (car %_3843)) '#f)))
         (%_3118
           (lambda (%_3844 %_3845 %_3846)
             (cons (cons %_3844 %_3845) %_3846)))
         (%_3119
           (lambda (%_3847 %_3848 %_3849)
             (if (null? %_3847)
               %_3849
               (%_3119
                 (cdr %_3847)
                 (cdr %_3848)
                 (%_3118 (car %_3847) (car %_3848) %_3849)))))
         (%_3120
           (lambda (%_3850 %_3851 %_3852)
             (if (null? %_3850)
               %_3852
               (%_3120
                 (cdr %_3850)
                 (cdr %_3851)
                 (%_3118
                   (car %_3850)
                   (%_3103 'lexical (car %_3851))
                   %_3852)))))
         (%_3121
           (lambda (%_3853)
             (if (null? %_3853)
               '()
               ((lambda (%_3854)
                  (if (eq? (cadr %_3854) 'lexical)
                    (%_3121 (cdr %_3853))
                    (cons %_3854 (%_3121 (cdr %_3853)))))
                (car %_3853)))))
         (%_3122
           (lambda (%_3855)
             (syntax-error
               %_3855
               (if (%_3226 %_3855 '(()))
                 '"identifier out of context"
                 '"identifier not visible"))))
         (%_3123
           (lambda (%_3856 %_3857)
             ((lambda (%_3858)
                (if %_3858
                  (cdr %_3858)
                  (if (symbol? %_3856)
                    ((lambda (%_3859)
                       (if %_3859 %_3859 (%_3103 'global %_3856)))
                     (%_2960 %_3856))
                    (%_3103 'displaced-lexical '#f))))
              (assq %_3856 %_3857))))
         (%_3124
           (lambda (%_3860)
             (if (procedure? %_3860)
               (%_3103 'macro %_3860)
               (if (%_3108 %_3860)
                 ((lambda (%_3861)
                    (if (memv %_3861 '(core macro macro!))
                      (if (procedure? (cdr %_3860)) %_3860 '#f)
                      (if (memv %_3861 '(module))
                        (if (%_3249 (cdr %_3860)) %_3860 '#f)
                        %_3860)))
                  (car %_3860))
                 '#f))))
         (%_3125
           (lambda (%_3862 %_3863)
             (letrec ((%_3864
                        (lambda (%_3870 %_3871)
                          (begin
                            (set-car! %_3870 (car %_3871))
                            (set-cdr! %_3870 (cdr %_3871))))))
               ((lambda (%_3865)
                  ((lambda (%_3866)
                     (if (memv %_3866 '(deferred))
                       (begin
                         (%_3864
                           %_3865
                           ((lambda (%_3867)
                              ((lambda (%_3868)
                                 (if %_3868
                                   %_3868
                                   (syntax-error
                                     %_3867
                                     '"invalid transformer")))
                               (%_3124 %_3867)))
                            (%_2953 (cdr %_3865))))
                         ((lambda (%_3869) %_3865) (car %_3865)))
                       %_3865))
                   (car %_3865)))
                (%_3123 %_3862 %_3863)))))
         (%_3126
           (lambda (%_3872 %_3873 %_3874)
             (%_2959 %_3873 (%_3103 %_3872 %_3874))))
         (%_3127
           (lambda (%_3875)
             (if (%_3076 %_3875)
               (symbol?
                 ((lambda (%_3876)
                    (if (annotation? %_3876)
                      (annotation-expression %_3876)
                      %_3876))
                  (%_3077 %_3875)))
               '#f)))
         (%_3133
           (lambda (%_3877)
             (if (symbol? %_3877)
               '#t
               (if (%_3076 %_3877)
                 (symbol?
                   ((lambda (%_3878)
                      (if (annotation? %_3878)
                        (annotation-expression %_3878)
                        %_3878))
                    (%_3077 %_3877)))
                 (if (annotation? %_3877)
                   (symbol? (annotation-expression %_3877))
                   '#f)))))
         (%_3139
           (lambda (%_3879 %_3880)
             (if (%_3076 %_3879)
               (values
                 ((lambda (%_3882)
                    (if (annotation? %_3882)
                      (annotation-expression %_3882)
                      %_3882))
                  (%_3077 %_3879))
                 (%_3221 (car %_3880) (car (%_3078 %_3879))))
               (values
                 (if (annotation? %_3879)
                   (annotation-expression %_3879)
                   %_3879)
                 (car %_3880)))))
         (%_3177
           (lambda (%_3883 %_3884) (%_3174 %_3883 %_3884)))
         (%_3176 (lambda (%_3885) (%_3173 %_3885)))
         (%_3175 (lambda () (%_3171 (%_3178))))
         (%_3174
           (lambda (%_3886 %_3887)
             (vector-set! %_3886 '1 %_3887)))
         (%_3173 (lambda (%_3888) (vector-ref %_3888 '1)))
         (%_3172
           (lambda (%_3889)
             (if (vector? %_3889)
               (if (= (vector-length %_3889) '2)
                 (eq? (vector-ref %_3889 '0) 'indirect-label)
                 '#f)
               '#f)))
         (%_3171
           (lambda (%_3890) (vector 'indirect-label %_3890)))
         (%_3178 (lambda () (string '#\i)))
         (%_3179
           (lambda (%_3891)
             ((lambda (%_3892)
                (if %_3892
                  %_3892
                  ((lambda (%_3893)
                     (if %_3893 %_3893 (%_3172 %_3891)))
                   (symbol? %_3891))))
              (string? %_3891))))
         (%_3180
           (lambda (%_3894)
             (if (null? %_3894)
               '()
               (cons (%_3178) (%_3180 (cdr %_3894))))))
         (%_3181
           (lambda (%_3895 %_3896 %_3897)
             (vector 'ribcage %_3895 %_3896 %_3897)))
         (%_3182
           (lambda (%_3898)
             (if (vector? %_3898)
               (if (= (vector-length %_3898) '4)
                 (eq? (vector-ref %_3898 '0) 'ribcage)
                 '#f)
               '#f)))
         (%_3183 (lambda (%_3899) (vector-ref %_3899 '1)))
         (%_3184 (lambda (%_3900) (vector-ref %_3900 '2)))
         (%_3185 (lambda (%_3901) (vector-ref %_3901 '3)))
         (%_3186
           (lambda (%_3902 %_3903)
             (vector-set! %_3902 '1 %_3903)))
         (%_3187
           (lambda (%_3904 %_3905)
             (vector-set! %_3904 '2 %_3905)))
         (%_3188
           (lambda (%_3906 %_3907)
             (vector-set! %_3906 '3 %_3907)))
         (%_3198
           (lambda (%_3908)
             (cons (cons '#f (car %_3908))
                   (cons 'shift (cdr %_3908)))))
         (%_3204
           (lambda (%_3909) (vector 'import-token %_3909)))
         (%_3205
           (lambda (%_3910)
             (if (vector? %_3910)
               (if (= (vector-length %_3910) '2)
                 (eq? (vector-ref %_3910 '0) 'import-token)
                 '#f)
               '#f)))
         (%_3206 (lambda (%_3911) (vector-ref %_3911 '1)))
         (%_3207
           (lambda (%_3912 %_3913)
             (vector-set! %_3912 '1 %_3913)))
         (%_3212
           (lambda (%_3914 %_3915 %_3916)
             (begin
               (%_3186
                 %_3914
                 (cons ((lambda (%_3917)
                          (if (annotation? %_3917)
                            (annotation-expression %_3917)
                            %_3917))
                        (%_3077 %_3915))
                       (%_3183 %_3914)))
               (%_3187
                 %_3914
                 (cons (car (%_3078 %_3915)) (%_3184 %_3914)))
               (%_3188 %_3914 (cons %_3916 (%_3185 %_3914))))))
         (%_3213
           (lambda (%_3918 %_3919)
             (%_3214 %_3918 (%_3078 %_3919))))
         (%_3214
           (lambda (%_3920 %_3921)
             (begin
               (%_3186 %_3920 (cons '#f (%_3183 %_3920)))
               (%_3187
                 %_3920
                 (cons (car %_3921) (%_3184 %_3920))))))
         (%_3215
           (lambda (%_3922 %_3923)
             (%_3186
               %_3922
               (cons (%_3204 %_3923) (%_3183 %_3922)))))
         (%_3216
           (lambda (%_3924 %_3925 %_3926)
             ((lambda (%_3927)
                (if %_3927
                  ((letrec ((%_3928
                              (lambda (%_3929)
                                (if (pair? %_3929)
                                  ((lambda (%_3930)
                                     (if %_3930 %_3930 (%_3928 (cdr %_3929))))
                                   (%_3928 (car %_3929)))
                                  (if (symbol? %_3929)
                                    (if (%_3222 %_3926 (car '((top))))
                                      %_3929
                                      '#f)
                                    (if (%_3222 %_3926 (car (%_3078 %_3929)))
                                      %_3929
                                      '#f))))))
                     %_3928)
                   %_3927)
                  '#f))
              (%_2961 %_3924 %_3925))))
         (%_3217
           (lambda (%_3931 %_3932 %_3933)
             (if (null? %_3931)
               %_3933
               (cons (car %_3933)
                     (cons ((lambda (%_3934)
                              ((lambda (%_3935)
                                 ((lambda (%_3937 %_3936)
                                    (begin
                                      ((letrec ((%_3938
                                                  (lambda (%_3939 %_3940)
                                                    (if (not (null? %_3939))
                                                      (call-with-values
                                                        (lambda ()
                                                          (%_3139
                                                            (car %_3939)
                                                            %_3933))
                                                        (lambda (%_3941 %_3942)
                                                          (begin
                                                            (vector-set!
                                                              %_3936
                                                              %_3940
                                                              %_3941)
                                                            (vector-set!
                                                              %_3937
                                                              %_3940
                                                              %_3942)
                                                            (%_3938
                                                              (cdr %_3939)
                                                              (+ %_3940 '1)))))
                                                      (void)))))
                                         %_3938)
                                       %_3931
                                       '0)
                                      (%_3181 %_3936 %_3937 %_3934)))
                                  (make-vector %_3935)
                                  (make-vector %_3935)))
                               (vector-length %_3934)))
                            (list->vector %_3932))
                           (cdr %_3933))))))
         (%_3218
           (lambda (%_3943)
             (call-with-values
               (lambda () (%_3224 %_3943 '(())))
               (lambda (%_3944 %_3945)
                 (begin
                   (if (not %_3944)
                     (syntax-error
                       %_3943
                       '"identifier not visible for export")
                     (void))
                   ((lambda (%_3946)
                      (%_3075
                        %_3946
                        (cons %_3945
                              (list (%_3181
                                      (vector %_3946)
                                      (vector %_3945)
                                      (vector %_3944))))))
                    ((lambda (%_3948)
                       (if (annotation? %_3948)
                         (annotation-expression %_3948)
                         %_3948))
                     (if (%_3076 %_3943) (%_3077 %_3943) %_3943))))))))
         (%_3219
           (lambda (%_3949 %_3950)
             (if (null? %_3950) %_3949 (append %_3949 %_3950))))
         (%_3220
           (lambda (%_3951 %_3952)
             ((lambda (%_3954 %_3953)
                (if (null? %_3953)
                  (if (null? %_3954)
                    %_3952
                    (cons (car %_3952) (%_3219 %_3954 (cdr %_3952))))
                  (cons (%_3219 %_3953 (car %_3952))
                        (%_3219 %_3954 (cdr %_3952)))))
              (cdr %_3951)
              (car %_3951))))
         (%_3221
           (lambda (%_3955 %_3956) (%_3219 %_3955 %_3956)))
         (%_3222
           (lambda (%_3957 %_3958)
             ((lambda (%_3959)
                (if %_3959
                  %_3959
                  (if (not (null? %_3957))
                    (if (not (null? %_3958))
                      (if (eq? (car %_3957) (car %_3958))
                        (%_3222 (cdr %_3957) (cdr %_3958))
                        '#f)
                      '#f)
                    '#f)))
              (eq? %_3957 %_3958))))
         (%_3223
           (lambda (%_3960 %_3961)
             (letrec ((%_3964
                        (lambda (%_3987 %_3988 %_3989 %_3990 %_3991)
                          ((lambda (%_3992)
                             ((letrec ((%_3993
                                         (lambda (%_3994)
                                           (if (= %_3994 %_3992)
                                             (%_3962
                                               %_3987
                                               (cdr %_3988)
                                               %_3989)
                                             (if (if (eq? (vector-ref
                                                            %_3990
                                                            %_3994)
                                                          %_3987)
                                                   (%_3222
                                                     %_3989
                                                     (vector-ref
                                                       (%_3184 %_3991)
                                                       %_3994))
                                                   '#f)
                                               (values
                                                 (vector-ref
                                                   (%_3185 %_3991)
                                                   %_3994)
                                                 %_3989)
                                               (%_3993 (+ %_3994 '1)))))))
                                %_3993)
                              '0))
                           (vector-length %_3990))))
                      (%_3963
                        (lambda (%_3977 %_3978 %_3979 %_3980 %_3981)
                          ((letrec ((%_3982
                                      (lambda (%_3983 %_3984)
                                        (if (null? %_3983)
                                          (%_3962 %_3977 (cdr %_3978) %_3979)
                                          (if (if (eq? (car %_3983) %_3977)
                                                (%_3222
                                                  %_3979
                                                  (list-ref
                                                    (%_3184 %_3981)
                                                    %_3984))
                                                '#f)
                                            (values
                                              (list-ref (%_3185 %_3981) %_3984)
                                              %_3979)
                                            (if (%_3205 (car %_3983))
                                              ((lambda (%_3985)
                                                 (if %_3985
                                                   (if (symbol? %_3985)
                                                     (values %_3985 %_3979)
                                                     (%_3224 %_3985 '(())))
                                                   (%_3982
                                                     (cdr %_3983)
                                                     %_3984)))
                                               (%_3216
                                                 %_3977
                                                 (%_3206 (car %_3983))
                                                 %_3979))
                                              (if (if (eq? (car %_3983) '#f)
                                                    (%_3222
                                                      %_3979
                                                      (list-ref
                                                        (%_3184 %_3981)
                                                        %_3984))
                                                    '#f)
                                                (values '#f %_3979)
                                                (%_3982
                                                  (cdr %_3983)
                                                  (+ %_3984 '1)))))))))
                             %_3982)
                           %_3980
                           '0)))
                      (%_3962
                        (lambda (%_3972 %_3973 %_3974)
                          (if (null? %_3973)
                            (values %_3972 %_3974)
                            ((lambda (%_3975)
                               (if (eq? %_3975 'shift)
                                 (%_3962 %_3972 (cdr %_3973) (cdr %_3974))
                                 ((lambda (%_3976)
                                    (if (vector? %_3976)
                                      (%_3964
                                        %_3972
                                        %_3973
                                        %_3974
                                        %_3976
                                        %_3975)
                                      (%_3963
                                        %_3972
                                        %_3973
                                        %_3974
                                        %_3976
                                        %_3975)))
                                  (%_3183 %_3975))))
                             (car %_3973))))))
               (if (symbol? %_3960)
                 (%_3962 %_3960 (cdr %_3961) (car %_3961))
                 (if (%_3076 %_3960)
                   ((lambda (%_3967 %_3966)
                      ((lambda (%_3968)
                         (call-with-values
                           (lambda () (%_3962 %_3966 (cdr %_3961) %_3968))
                           (lambda (%_3969 %_3970)
                             (if (eq? %_3969 %_3966)
                               (%_3962 %_3966 (cdr %_3967) %_3970)
                               (values %_3969 %_3970)))))
                       (%_3221 (car %_3961) (car %_3967))))
                    (%_3078 %_3960)
                    ((lambda (%_3971)
                       (if (annotation? %_3971)
                         (annotation-expression %_3971)
                         %_3971))
                     (%_3077 %_3960)))
                   (if (annotation? %_3960)
                     (%_3962
                       (if (annotation? %_3960)
                         (annotation-expression %_3960)
                         %_3960)
                       (cdr %_3961)
                       (car %_3961))
                     (%_2954 'id-var-name '"invalid id" %_3960)))))))
         (%_3224
           (lambda (%_3995 %_3996)
             (call-with-values
               (lambda () (%_3223 %_3995 %_3996))
               (lambda (%_3997 %_3998)
                 (values
                   (if (%_3172 %_3997) (%_3176 %_3997) %_3997)
                   %_3998)))))
         (%_3225
           (lambda (%_3999 %_4000)
             (call-with-values
               (lambda () (%_3223 %_3999 %_4000))
               (lambda (%_4001 %_4002) %_4001))))
         (%_3226
           (lambda (%_4003 %_4004)
             (call-with-values
               (lambda () (%_3223 %_4003 %_4004))
               (lambda (%_4005 %_4006)
                 (if (%_3172 %_4005) (%_3176 %_4005) %_4005)))))
         (%_3227
           (lambda (%_4007 %_4008)
             (if (eq? ((lambda (%_4010)
                         (if (annotation? %_4010)
                           (annotation-expression %_4010)
                           %_4010))
                       (if (%_3076 %_4007) (%_3077 %_4007) %_4007))
                      ((lambda (%_4012)
                         (if (annotation? %_4012)
                           (annotation-expression %_4012)
                           %_4012))
                       (if (%_3076 %_4008) (%_3077 %_4008) %_4008)))
               (eq? (%_3226 %_4007 '(())) (%_3226 %_4008 '(())))
               '#f)))
         (%_3228
           (lambda (%_4013 %_4014)
             (if (eq? ((lambda (%_4021)
                         (if (annotation? %_4021)
                           (annotation-expression %_4021)
                           %_4021))
                       (if (%_3076 %_4013) (%_3077 %_4013) %_4013))
                      ((lambda (%_4023)
                         (if (annotation? %_4023)
                           (annotation-expression %_4023)
                           %_4023))
                       (if (%_3076 %_4014) (%_3077 %_4014) %_4014)))
               ((lambda (%_4016 %_4015)
                  ((lambda (%_4017)
                     (if %_4017
                       %_4017
                       (if ((lambda (%_4019)
                              (if %_4019 %_4019 (symbol? %_4015)))
                            (not %_4015))
                         ((lambda (%_4018)
                            (if %_4018 %_4018 (symbol? %_4016)))
                          (not %_4016))
                         '#f)))
                   (eq? %_4015 %_4016)))
                (%_3226 %_4014 '(()))
                (%_3226 %_4013 '(())))
               '#f)))
         (%_3229
           (lambda (%_4024 %_4025)
             (if (if (%_3076 %_4024) (%_3076 %_4025) '#f)
               (if (eq? ((lambda (%_4028)
                           (if (annotation? %_4028)
                             (annotation-expression %_4028)
                             %_4028))
                         (%_3077 %_4024))
                        ((lambda (%_4029)
                           (if (annotation? %_4029)
                             (annotation-expression %_4029)
                             %_4029))
                         (%_3077 %_4025)))
                 (%_3222
                   (car (%_3078 %_4024))
                   (car (%_3078 %_4025)))
                 '#f)
               (eq? (if (annotation? %_4024)
                      (annotation-expression %_4024)
                      %_4024)
                    (if (annotation? %_4025)
                      (annotation-expression %_4025)
                      %_4025)))))
         (%_3230
           (lambda (%_4030)
             (if ((letrec ((%_4031
                             (lambda (%_4032)
                               ((lambda (%_4033)
                                  (if %_4033
                                    %_4033
                                    (if (%_3133 (car %_4032))
                                      (%_4031 (cdr %_4032))
                                      '#f)))
                                (null? %_4032)))))
                    %_4031)
                  %_4030)
               (%_3236 %_4030)
               '#f)))
         (%_3236
           (lambda (%_4034)
             ((letrec ((%_4035
                         (lambda (%_4036)
                           ((lambda (%_4037)
                              (if %_4037
                                %_4037
                                (if (not (%_3238 (car %_4036) (cdr %_4036)))
                                  (%_4035 (cdr %_4036))
                                  '#f)))
                            (null? %_4036)))))
                %_4035)
              %_4034)))
         (%_3237
           (lambda (%_4038 %_4039 %_4040)
             ((letrec ((%_4041
                         (lambda (%_4042 %_4043)
                           (if (null? %_4042)
                             (syntax-error %_4039)
                             (if (%_3133 (car %_4042))
                               (if (%_3238 (car %_4042) %_4043)
                                 (syntax-error
                                   (car %_4042)
                                   '"duplicate "
                                   %_4040)
                                 (%_4041
                                   (cdr %_4042)
                                   (cons (car %_4042) %_4043)))
                               (syntax-error
                                 (car %_4042)
                                 '"invalid "
                                 %_4040))))))
                %_4041)
              %_4038
              '())))
         (%_3238
           (lambda (%_4044 %_4045)
             (if (not (null? %_4045))
               ((lambda (%_4046)
                  (if %_4046 %_4046 (%_3238 %_4044 (cdr %_4045))))
                (%_3229 %_4044 (car %_4045)))
               '#f)))
         (%_3239
           (lambda (%_4047 %_4048)
             (if (if (null? (car %_4048))
                   (null? (cdr %_4048))
                   '#f)
               %_4047
               (if (%_3076 %_4047)
                 (%_3075
                   (%_3077 %_4047)
                   (%_3220 %_4048 (%_3078 %_4047)))
                 (if (null? %_4047) %_4047 (%_3075 %_4047 %_4048))))))
         (%_3240
           (lambda (%_4049 %_4050 %_4051)
             (%_3239
               (if %_4051
                 (make-annotation %_4049 %_4051 '#f)
                 %_4049)
               %_4050)))
         (%_3241
           (lambda (%_4052 %_4053 %_4054 %_4055)
             (%_3061
               %_4055
               ((letrec ((%_4056
                           (lambda (%_4057 %_4058 %_4059)
                             (if (null? %_4057)
                               '()
                               ((lambda (%_4060)
                                  (cons %_4060
                                        (%_4056 (cdr %_4057) %_4058 %_4059)))
                                (%_3281 (car %_4057) %_4058 %_4059))))))
                  %_4056)
                %_4052
                %_4053
                %_4054))))
         (%_3242
           (lambda (%_4061
                    %_4062
                    %_4063
                    %_4064
                    %_4065
                    %_4066
                    %_4067)
             (%_3061
               %_4064
               ((letrec ((%_4068
                           (lambda (%_4069 %_4070 %_4071 %_4072 %_4073)
                             (if (null? %_4069)
                               '()
                               ((lambda (%_4074)
                                  (cons %_4074
                                        (%_4068
                                          (cdr %_4069)
                                          %_4070
                                          %_4071
                                          %_4072
                                          %_4073)))
                                (%_3246
                                  (car %_4069)
                                  %_4070
                                  %_4071
                                  %_4072
                                  %_4073
                                  %_4067))))))
                  %_4068)
                %_4061
                %_4062
                %_4063
                %_4065
                %_4066))))
         (%_3243
           (lambda (%_4075 %_4076)
             (map (lambda (%_4077)
                    (if (%_3228
                          %_4077
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
                      (if (%_3228
                            %_4077
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
                        (if (%_3228
                              %_4077
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
                          (if (%_3228
                                %_4077
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
                            (if (%_3228
                                  %_4077
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
                                (%_3239 %_4077 %_4076)
                                '"invalid eval-when situation")))))))
                  %_4075)))
         (%_3244
           (lambda (%_4078 %_4079 %_4080 %_4081 %_4082)
             (if (symbol? %_4078)
               ((lambda (%_4090)
                  ((lambda (%_4091)
                     ((lambda (%_4092)
                        (if (memv %_4092 '(lexical))
                          (values %_4092 (cdr %_4091) %_4078 %_4080 %_4081)
                          (if (memv %_4092 '(global))
                            (values %_4092 (cdr %_4091) %_4078 %_4080 %_4081)
                            (if (memv %_4092 '(macro macro!))
                              (%_3244
                                (%_3285
                                  (cdr %_4091)
                                  %_4078
                                  %_4079
                                  %_4080
                                  %_4081
                                  %_4082)
                                %_4079
                                '(())
                                '#f
                                %_4082)
                              (values
                                %_4092
                                (cdr %_4091)
                                %_4078
                                %_4080
                                %_4081)))))
                      (car %_4091)))
                   (%_3125 %_4090 %_4079)))
                (%_3226 %_4078 %_4080))
               (if (pair? %_4078)
                 ((lambda (%_4085)
                    (if (%_3133 %_4085)
                      ((lambda (%_4086)
                         ((lambda (%_4087)
                            ((lambda (%_4088)
                               (if (memv %_4088 '(lexical))
                                 (values
                                   'lexical-call
                                   (cdr %_4087)
                                   %_4078
                                   %_4080
                                   %_4081)
                                 (if (memv %_4088 '(macro macro!))
                                   (%_3244
                                     (%_3285
                                       (cdr %_4087)
                                       %_4078
                                       %_4079
                                       %_4080
                                       %_4081
                                       %_4082)
                                     %_4079
                                     '(())
                                     '#f
                                     %_4082)
                                   (if (memv %_4088 '(core))
                                     (values
                                       %_4088
                                       (cdr %_4087)
                                       %_4078
                                       %_4080
                                       %_4081)
                                     (if (memv %_4088 '(local-syntax))
                                       (values
                                         'local-syntax-form
                                         (cdr %_4087)
                                         %_4078
                                         %_4080
                                         %_4081)
                                       (if (memv %_4088 '(begin))
                                         (values
                                           'begin-form
                                           '#f
                                           %_4078
                                           %_4080
                                           %_4081)
                                         (if (memv %_4088 '(eval-when))
                                           (values
                                             'eval-when-form
                                             '#f
                                             %_4078
                                             %_4080
                                             %_4081)
                                           (if (memv %_4088 '(define))
                                             (values
                                               'define-form
                                               '#f
                                               %_4078
                                               %_4080
                                               %_4081)
                                             (if (memv %_4088 '(define-syntax))
                                               (values
                                                 'define-syntax-form
                                                 '#f
                                                 %_4078
                                                 %_4080
                                                 %_4081)
                                               (if (memv %_4088 '(module-key))
                                                 (values
                                                   'module-form
                                                   '#f
                                                   %_4078
                                                   %_4080
                                                   %_4081)
                                                 (if (memv %_4088 '(import))
                                                   (values
                                                     'import-form
                                                     (if (cdr %_4087)
                                                       (%_3239 %_4085 %_4080)
                                                       '#f)
                                                     %_4078
                                                     %_4080
                                                     %_4081)
                                                   (if (memv %_4088 '(set!))
                                                     (%_3284
                                                       %_4078
                                                       %_4079
                                                       %_4080
                                                       %_4081
                                                       %_4082)
                                                     (values
                                                       'call
                                                       '#f
                                                       %_4078
                                                       %_4080
                                                       %_4081)))))))))))))
                             (car %_4087)))
                          (%_3125 %_4086 %_4079)))
                       (%_3226 %_4085 %_4080))
                      (values 'call '#f %_4078 %_4080 %_4081)))
                  (car %_4078))
                 (if (%_3076 %_4078)
                   (%_3244
                     (%_3077 %_4078)
                     %_4079
                     (%_3220 %_4080 (%_3078 %_4078))
                     '#f
                     %_4082)
                   (if (annotation? %_4078)
                     (%_3244
                       (annotation-expression %_4078)
                       %_4079
                       %_4080
                       (annotation-source %_4078)
                       %_4082)
                     (if (not ((lambda (%_4084)
                                 (if %_4084 %_4084 (vector? %_4078)))
                               (pair? %_4078)))
                       (values 'constant '#f %_4078 %_4080 %_4081)
                       (values 'other '#f %_4078 %_4080 %_4081))))))))
         (%_3245
           (lambda (%_4094 %_4095 %_4096 %_4097)
             (call-with-values
               (lambda ()
                 (%_3244 %_4094 %_4095 %_4096 '#f %_4097))
               (lambda (%_4098 %_4099 %_4100 %_4101 %_4102)
                 (%_3282
                   %_4098
                   %_4099
                   %_4100
                   %_4095
                   %_4101
                   %_4102)))))
         (%_3246
           (lambda (%_4103 %_4104 %_4105 %_4106 %_4107 %_4108)
             (call-with-values
               (lambda ()
                 (%_3244 %_4103 %_4104 %_4105 '#f %_4108))
               (lambda (%_4109 %_4110 %_4111 %_4112 %_4113)
                 (if (memv %_4109 '(begin-form))
                   ((lambda (%_4166)
                      (if %_4166
                        (apply (lambda (%_4172) (%_3295)) %_4166)
                        ((lambda (%_4167)
                           (if %_4167
                             (apply (lambda (%_4168 %_4169 %_4170)
                                      (%_3242
                                        (cons %_4169 %_4170)
                                        %_4104
                                        %_4112
                                        %_4113
                                        %_4106
                                        %_4107
                                        %_4108))
                                    %_4167)
                             (syntax-error %_4111)))
                         ($syntax-dispatch
                           (compile-in-annotation %_4111 value)
                           '(any any . each-any)))))
                    ($syntax-dispatch
                      (compile-in-annotation %_4111 value)
                      '(any)))
                   (if (memv %_4109 '(local-syntax-form))
                     (%_3294
                       %_4110
                       %_4111
                       %_4104
                       %_4112
                       %_4113
                       (lambda (%_4161 %_4162 %_4163 %_4164)
                         (%_3242
                           %_4161
                           %_4162
                           %_4163
                           %_4164
                           %_4106
                           %_4107
                           %_4108)))
                     (if (memv %_4109 '(eval-when-form))
                       ((lambda (%_4150)
                          (if %_4150
                            (apply (lambda (%_4151 %_4152 %_4153 %_4154)
                                     ((lambda (%_4156 %_4155)
                                        ((lambda (%_4158 %_4157)
                                           (if (if (null? %_4157)
                                                 (null? %_4158)
                                                 '#f)
                                             (%_3295)
                                             (%_3242
                                               %_4156
                                               %_4104
                                               %_4112
                                               %_4113
                                               %_4157
                                               %_4158
                                               %_4108)))
                                         (%_3277 %_4155 %_4107)
                                         (%_3277 %_4155 %_4106)))
                                      (cons %_4153 %_4154)
                                      (%_3243 %_4152 %_4112)))
                                   %_4150)
                            (syntax-error %_4111)))
                        ($syntax-dispatch
                          (compile-in-annotation %_4111 value)
                          '(any each-any any . each-any)))
                       (if (memv %_4109 '(define-syntax-form))
                         (%_3292
                           %_4111
                           %_4112
                           %_4113
                           (lambda (%_4138 %_4139 %_4140)
                             ((lambda (%_4141)
                                (begin
                                  ((lambda (%_4142)
                                     ((lambda (%_4143)
                                        ((lambda (%_4144)
                                           (if (memv %_4144
                                                     '(displaced-lexical))
                                             (%_3122 %_4141)
                                             (void)))
                                         (car %_4143)))
                                      (%_3125 %_4142 %_4104)))
                                   (%_3226 %_4141 '(())))
                                  (%_3280
                                    %_4106
                                    (lambda ()
                                      (list '$sc-put-cte
                                            (list 'quote
                                                  ((lambda (%_4145)
                                                     (if (%_3222
                                                           (car (%_3078
                                                                  %_4141))
                                                           (car '((top))))
                                                       %_4145
                                                       ((lambda (%_4146)
                                                          (%_3075
                                                            %_4145
                                                            (cons %_4146
                                                                  (list (%_3181
                                                                          (vector
                                                                            %_4145)
                                                                          (vector
                                                                            %_4146)
                                                                          (vector
                                                                            (%_2962
                                                                              %_4145)))))))
                                                        (car (%_3078
                                                               %_4141)))))
                                                   ((lambda (%_4148)
                                                      (if (annotation? %_4148)
                                                        (annotation-expression
                                                          %_4148)
                                                        %_4148))
                                                    (if (%_3076 %_4141)
                                                      (%_3077 %_4141)
                                                      %_4141))))
                                            (%_3281
                                              %_4139
                                              (%_3121 %_4104)
                                              %_4140))))))
                              (%_3239 %_4138 %_4140))))
                         (if (memv %_4109 '(define-form))
                           (%_3291
                             %_4111
                             %_4112
                             %_4113
                             (lambda (%_4126 %_4127 %_4128)
                               ((lambda (%_4129)
                                  (begin
                                    ((lambda (%_4130)
                                       ((lambda (%_4131)
                                          ((lambda (%_4132)
                                             (if (memv %_4132
                                                       '(displaced-lexical))
                                               (%_3122 %_4129)
                                               (void)))
                                           (car %_4131)))
                                        (%_3125 %_4130 %_4104)))
                                     (%_3226 %_4129 '(())))
                                    ((lambda (%_4133)
                                       ((lambda (%_4134)
                                          (%_3061
                                            '#f
                                            (list (%_3280
                                                    %_4106
                                                    (lambda ()
                                                      (list '$sc-put-cte
                                                            (list 'quote
                                                                  (if (eq? %_4133
                                                                           %_4134)
                                                                    %_4133
                                                                    ((lambda (%_4135)
                                                                       (%_3075
                                                                         %_4133
                                                                         (cons %_4135
                                                                               (list (%_3181
                                                                                       (vector
                                                                                         %_4133)
                                                                                       (vector
                                                                                         %_4135)
                                                                                       (vector
                                                                                         %_4134))))))
                                                                     (car (%_3078
                                                                            %_4129)))))
                                                            (list 'quote
                                                                  (%_3103
                                                                    'global
                                                                    %_4134)))))
                                                  (%_3279
                                                    %_4107
                                                    (lambda ()
                                                      (if %_4113
                                                        (list 'compile-in-annotation
                                                              (list 'define
                                                                    %_4134
                                                                    (%_3281
                                                                      %_4127
                                                                      %_4104
                                                                      %_4128))
                                                              %_4113)
                                                        (list 'define
                                                              %_4134
                                                              (%_3281
                                                                %_4127
                                                                %_4104
                                                                %_4128))))))))
                                        (if (%_3222
                                              (car (%_3078 %_4129))
                                              (car '((top))))
                                          %_4133
                                          (%_2962 %_4133))))
                                     ((lambda (%_4137)
                                        (if (annotation? %_4137)
                                          (annotation-expression %_4137)
                                          %_4137))
                                      (if (%_3076 %_4129)
                                        (%_3077 %_4129)
                                        %_4129)))))
                                (%_3239 %_4126 %_4128))))
                           (if (memv %_4109 '(module-form))
                             ((lambda (%_4119 %_4118)
                                (%_3289
                                  %_4111
                                  %_4112
                                  %_4113
                                  (cons (car %_4112)
                                        (cons %_4119 (cdr %_4112)))
                                  (lambda (%_4120 %_4121 %_4122)
                                    (if %_4120
                                      (begin
                                        ((lambda (%_4123)
                                           ((lambda (%_4124)
                                              ((lambda (%_4125)
                                                 (if (memv %_4125
                                                           '(displaced-lexical))
                                                   (%_3122
                                                     (%_3239 %_4120 %_4112))
                                                   (void)))
                                               (car %_4124)))
                                            (%_3125 %_4123 %_4118)))
                                         (%_3226 %_4120 '(())))
                                        (%_3268
                                          %_4111
                                          %_4118
                                          %_4119
                                          %_4112
                                          %_4113
                                          %_4106
                                          %_4107
                                          %_4120
                                          %_4121
                                          %_4122))
                                      (%_3268
                                        %_4111
                                        %_4118
                                        %_4119
                                        %_4112
                                        %_4113
                                        %_4106
                                        %_4107
                                        '#f
                                        %_4121
                                        %_4122)))))
                              (%_3181 '() '() '())
                              (cons '("top-level module placeholder"
                                      placeholder)
                                    %_4104))
                             (if (memv %_4109 '(import-form))
                               (%_3290
                                 %_4111
                                 %_4112
                                 %_4113
                                 (lambda (%_4115)
                                   (%_3280
                                     %_4106
                                     (lambda ()
                                       (begin
                                         (if %_4110
                                           (syntax-error
                                             (%_3240 %_4111 %_4112 %_4113)
                                             '"not valid at top-level")
                                           (void))
                                         ((lambda (%_4116)
                                            ((lambda (%_4117)
                                               (if (memv %_4117 '(module))
                                                 (%_3276
                                                   %_4115
                                                   (%_3251 (cdr %_4116)))
                                                 (if (memv %_4117
                                                           '(displaced-lexical))
                                                   (%_3122 %_4115)
                                                   (syntax-error
                                                     %_4115
                                                     '"import from unknown module"))))
                                             (car %_4116)))
                                          (%_3125
                                            (%_3226 %_4115 '(()))
                                            '())))))))
                               (%_3279
                                 %_4107
                                 (lambda ()
                                   (%_3282
                                     %_4109
                                     %_4110
                                     %_4111
                                     %_4104
                                     %_4112
                                     %_4113))))))))))))))
         (%_3247
           (lambda (%_4173)
             ((letrec ((%_4174
                         (lambda (%_4175 %_4176)
                           (if (null? %_4175)
                             %_4176
                             (%_4174
                               (cdr %_4175)
                               (if (pair? (car %_4175))
                                 (%_4174 (car %_4175) %_4176)
                                 (cons (car %_4175) %_4176)))))))
                %_4174)
              %_4173
              '())))
         (%_3248
           (lambda (%_4177 %_4178)
             (vector 'interface %_4177 %_4178)))
         (%_3249
           (lambda (%_4179)
             (if (vector? %_4179)
               (if (= (vector-length %_4179) '3)
                 (eq? (vector-ref %_4179 '0) 'interface)
                 '#f)
               '#f)))
         (%_3250 (lambda (%_4180) (vector-ref %_4180 '1)))
         (%_3251 (lambda (%_4181) (vector-ref %_4181 '2)))
         (%_3252
           (lambda (%_4182 %_4183)
             (vector-set! %_4182 '1 %_4183)))
         (%_3253
           (lambda (%_4184 %_4185)
             (vector-set! %_4184 '2 %_4185)))
         (%_3254
           (lambda (%_4186)
             (%_3248
               (list->vector
                 (map (lambda (%_4187)
                        (if (pair? %_4187) (car %_4187) %_4187))
                      %_4186))
               '#f)))
         (%_3255
           (lambda (%_4188 %_4189)
             (%_3248
               (list->vector
                 (map (lambda (%_4190)
                        (%_3218 (if (pair? %_4190) (car %_4190) %_4190)))
                      %_4188))
               %_4189)))
         (%_3256
           (lambda (%_4191 %_4192 %_4193 %_4194 %_4195)
             (vector
               'module-binding
               %_4191
               %_4192
               %_4193
               %_4194
               %_4195)))
         (%_3257
           (lambda (%_4196)
             (if (vector? %_4196)
               (if (= (vector-length %_4196) '6)
                 (eq? (vector-ref %_4196 '0) 'module-binding)
                 '#f)
               '#f)))
         (%_3258 (lambda (%_4197) (vector-ref %_4197 '1)))
         (%_3259 (lambda (%_4198) (vector-ref %_4198 '2)))
         (%_3260 (lambda (%_4199) (vector-ref %_4199 '3)))
         (%_3261 (lambda (%_4200) (vector-ref %_4200 '4)))
         (%_3262 (lambda (%_4201) (vector-ref %_4201 '5)))
         (%_3263
           (lambda (%_4202 %_4203)
             (vector-set! %_4202 '1 %_4203)))
         (%_3264
           (lambda (%_4204 %_4205)
             (vector-set! %_4204 '2 %_4205)))
         (%_3265
           (lambda (%_4206 %_4207)
             (vector-set! %_4206 '3 %_4207)))
         (%_3266
           (lambda (%_4208 %_4209)
             (vector-set! %_4208 '4 %_4209)))
         (%_3267
           (lambda (%_4210 %_4211)
             (vector-set! %_4210 '5 %_4211)))
         (%_3268
           (lambda (%_4212
                    %_4213
                    %_4214
                    %_4215
                    %_4216
                    %_4217
                    %_4218
                    %_4219
                    %_4220
                    %_4221)
             ((lambda (%_4222)
                (%_3273
                  %_4214
                  (%_3240 %_4212 %_4215 %_4216)
                  (map (lambda (%_4223) (cons %_4213 %_4223))
                       %_4221)
                  %_4213
                  %_4220
                  %_4222
                  %_4217
                  (lambda (%_4224 %_4225)
                    ((letrec ((%_4226
                                (lambda (%_4227 %_4228 %_4229 %_4230 %_4231)
                                  (if (null? %_4227)
                                    ((letrec ((%_4253
                                                (lambda (%_4254 %_4255 %_4256)
                                                  (if (null? %_4254)
                                                    ((lambda (%_4260
                                                              %_4261
                                                              %_4262)
                                                       (begin
                                                         (for-each
                                                           (lambda (%_4263)
                                                             (apply (lambda (%_4264
                                                                             %_4265
                                                                             %_4266
                                                                             %_4267)
                                                                      (if %_4265
                                                                        (%_3177
                                                                          %_4265
                                                                          %_4266)
                                                                        (void)))
                                                                    %_4263))
                                                           %_4231)
                                                         (%_3061
                                                           '#f
                                                           (list (%_3280
                                                                   %_4217
                                                                   (lambda ()
                                                                     (if (null? %_4231)
                                                                       (%_3295)
                                                                       (%_3061
                                                                         '#f
                                                                         (map (lambda (%_4268)
                                                                                (apply (lambda (%_4269
                                                                                                %_4270
                                                                                                %_4271
                                                                                                %_4272)
                                                                                         (list '$sc-put-cte
                                                                                               (list 'quote
                                                                                                     %_4271)
                                                                                               (if (eq? %_4269
                                                                                                        'define-syntax-form)
                                                                                                 %_4272
                                                                                                 (list 'quote
                                                                                                       (%_3103
                                                                                                         'module
                                                                                                         (%_3255
                                                                                                           %_4272
                                                                                                           %_4271))))))
                                                                                       %_4268))
                                                                              %_4231)))))
                                                                 (%_3280
                                                                   %_4217
                                                                   (lambda ()
                                                                     ((lambda (%_4273)
                                                                        ((lambda (%_4274)
                                                                           ((lambda (%_4275)
                                                                              (if %_4273
                                                                                (list '$sc-put-cte
                                                                                      (list 'quote
                                                                                            (if (%_3222
                                                                                                  (car (%_3078
                                                                                                         %_4219))
                                                                                                  (car '((top))))
                                                                                              %_4273
                                                                                              ((lambda (%_4277)
                                                                                                 (%_3075
                                                                                                   %_4273
                                                                                                   (cons %_4277
                                                                                                         (list (%_3181
                                                                                                                 (vector
                                                                                                                   %_4273)
                                                                                                                 (vector
                                                                                                                   %_4277)
                                                                                                                 (vector
                                                                                                                   (%_2962
                                                                                                                     %_4273)))))))
                                                                                               (car (%_3078
                                                                                                      %_4219)))))
                                                                                      %_4275)
                                                                                ((lambda (%_4276)
                                                                                   (%_3061
                                                                                     '#f
                                                                                     (list (list '$sc-put-cte
                                                                                                 (list 'quote
                                                                                                       %_4276)
                                                                                                 %_4275)
                                                                                           (%_3276
                                                                                             %_4276
                                                                                             %_4274))))
                                                                                 (%_2962
                                                                                   'tmp))))
                                                                            (list 'quote
                                                                                  (%_3103
                                                                                    'module
                                                                                    (%_3255
                                                                                      %_4220
                                                                                      %_4274)))))
                                                                         (%_2962
                                                                           %_4273)))
                                                                      (if %_4219
                                                                        ((lambda (%_4279)
                                                                           (if (annotation?
                                                                                 %_4279)
                                                                             (annotation-expression
                                                                               %_4279)
                                                                             %_4279))
                                                                         (if (%_3076
                                                                               %_4219)
                                                                           (%_3077
                                                                             %_4219)
                                                                           %_4219))
                                                                        '#f))))
                                                                 (if (null? %_4229)
                                                                   (%_3295)
                                                                   (%_3061
                                                                     '#f
                                                                     (map (lambda (%_4280)
                                                                            (list 'define
                                                                                  %_4280
                                                                                  (%_3295)))
                                                                          %_4229)))
                                                                 (%_3279
                                                                   %_4218
                                                                   (lambda ()
                                                                     (%_3063
                                                                       '#f
                                                                       %_4255
                                                                       %_4261
                                                                       (%_3061
                                                                         '#f
                                                                         (list (if (null? %_4229)
                                                                                 (%_3295)
                                                                                 (%_3061
                                                                                   '#f
                                                                                   (map (lambda (%_4281
                                                                                                 %_4282)
                                                                                          (list 'set!
                                                                                                %_4281
                                                                                                %_4282))
                                                                                        %_4229
                                                                                        %_4260)))
                                                                               (if (null? %_4262)
                                                                                 (%_3295)
                                                                                 (%_3061
                                                                                   '#f
                                                                                   %_4262)))))))
                                                                 (%_3295)))))
                                                     (map (lambda (%_4283)
                                                            (%_3281
                                                              (cdr %_4283)
                                                              (car %_4283)
                                                              '(())))
                                                          %_4230)
                                                     (map (lambda (%_4284)
                                                            (%_3281
                                                              (cdr %_4284)
                                                              (car %_4284)
                                                              '(())))
                                                          %_4256)
                                                     (map (lambda (%_4285)
                                                            (%_3281
                                                              (cdr %_4285)
                                                              (car %_4285)
                                                              '(())))
                                                          %_4225))
                                                    ((lambda (%_4257)
                                                       ((lambda (%_4258)
                                                          (if (memv %_4258
                                                                    '(define-form))
                                                            ((lambda (%_4259)
                                                               (begin
                                                                 (%_3270
                                                                   %_4213
                                                                   (%_3176
                                                                     (%_3260
                                                                       %_4257))
                                                                   (%_3103
                                                                     'lexical
                                                                     %_4259))
                                                                 (%_4253
                                                                   (cdr %_4254)
                                                                   (cons %_4259
                                                                         %_4255)
                                                                   (cons (%_3262
                                                                           %_4257)
                                                                         %_4256))))
                                                             (%_3300
                                                               (%_3259
                                                                 %_4257)))
                                                            (if (memv %_4258
                                                                      '(define-syntax-form
                                                                         module-form))
                                                              (%_4253
                                                                (cdr %_4254)
                                                                %_4255
                                                                %_4256)
                                                              (error 'sc-expand-internal
                                                                     '"unexpected module binding type"))))
                                                        (%_3258 %_4257)))
                                                     (car %_4254))))))
                                       %_4253)
                                     %_4228
                                     '()
                                     '())
                                    ((lambda (%_4232 %_4233)
                                       (letrec ((%_4234
                                                  (lambda (%_4246
                                                           %_4247
                                                           %_4248
                                                           %_4249)
                                                    ((letrec ((%_4250
                                                                (lambda (%_4251
                                                                         %_4252)
                                                                  (if (null? %_4251)
                                                                    (%_4249)
                                                                    (if (%_3227
                                                                          (%_3259
                                                                            (car %_4251))
                                                                          %_4246)
                                                                      (%_4248
                                                                        (car %_4251)
                                                                        (%_3219
                                                                          (reverse
                                                                            %_4252)
                                                                          (cdr %_4251)))
                                                                      (%_4250
                                                                        (cdr %_4251)
                                                                        (cons (car %_4251)
                                                                              %_4252)))))))
                                                       %_4250)
                                                     %_4247
                                                     '()))))
                                         (%_4234
                                           %_4232
                                           %_4228
                                           (lambda (%_4235 %_4236)
                                             ((lambda (%_4237 %_4238 %_4239)
                                                ((lambda (%_4240 %_4241)
                                                   (if (memv %_4237
                                                             '(define-form))
                                                     (begin
                                                       (%_3177 %_4238 %_4241)
                                                       (%_4226
                                                         %_4240
                                                         %_4236
                                                         (cons %_4241 %_4229)
                                                         (cons (%_3262 %_4235)
                                                               %_4230)
                                                         %_4231))
                                                     (if (memv %_4237
                                                               '(define-syntax-form))
                                                       (%_4226
                                                         %_4240
                                                         %_4236
                                                         %_4229
                                                         %_4230
                                                         (cons (list %_4237
                                                                     %_4238
                                                                     %_4241
                                                                     (%_3262
                                                                       %_4235))
                                                               %_4231))
                                                       (if (memv %_4237
                                                                 '(module-form))
                                                         ((lambda (%_4243)
                                                            (%_4226
                                                              (append
                                                                (%_3247 %_4243)
                                                                %_4240)
                                                              %_4236
                                                              %_4229
                                                              %_4230
                                                              (cons (list %_4237
                                                                          %_4238
                                                                          %_4241
                                                                          %_4243)
                                                                    %_4231)))
                                                          (%_3262 %_4235))
                                                         (error 'sc-expand-internal
                                                                '"unexpected module binding type")))))
                                                 (append %_4239 %_4233)
                                                 (%_2962
                                                   ((lambda (%_4245)
                                                      (if (annotation? %_4245)
                                                        (annotation-expression
                                                          %_4245)
                                                        %_4245))
                                                    (if (%_3076 %_4232)
                                                      (%_3077 %_4232)
                                                      %_4232)))))
                                              (%_3258 %_4235)
                                              (%_3260 %_4235)
                                              (%_3261 %_4235)))
                                           (lambda ()
                                             (%_4226
                                               %_4233
                                               %_4228
                                               %_4229
                                               %_4230
                                               %_4231)))))
                                     (car %_4227)
                                     (cdr %_4227))))))
                       %_4226)
                     %_4222
                     %_4224
                     '()
                     '()
                     '()))))
              (%_3247 %_4220))))
         (%_3269
           (lambda (%_4286 %_4287)
             (if (null? %_4286)
               '()
               (if (%_3238 (car %_4286) %_4287)
                 (%_3269 (cdr %_4286) %_4287)
                 (cons (car %_4286) (%_3269 (cdr %_4286) %_4287))))))
         (%_3270
           (lambda (%_4288 %_4289 %_4290)
             (set-cdr!
               %_4288
               (%_3118 %_4289 %_4290 (cdr %_4288)))))
         (%_3271
           (lambda (%_4291 %_4292 %_4293)
             (letrec ((%_4294
                        (lambda (%_4300 %_4301)
                          (ormap (lambda (%_4302)
                                   (if (%_3249 %_4302)
                                     ((lambda (%_4303)
                                        (if %_4303
                                          (%_3216
                                            ((lambda (%_4309)
                                               (if (annotation? %_4309)
                                                 (annotation-expression %_4309)
                                                 %_4309))
                                             (if (%_3076 %_4300)
                                               (%_3077 %_4300)
                                               %_4300))
                                            %_4303
                                            (car (%_3078 %_4300)))
                                          ((lambda (%_4304)
                                             ((letrec ((%_4305
                                                         (lambda (%_4306)
                                                           (if (>= %_4306 '0)
                                                             ((lambda (%_4307)
                                                                (if %_4307
                                                                  %_4307
                                                                  (%_4305
                                                                    (- %_4306
                                                                       '1))))
                                                              (%_3229
                                                                %_4300
                                                                (vector-ref
                                                                  %_4304
                                                                  %_4306)))
                                                             '#f))))
                                                %_4305)
                                              (- (vector-length %_4304) '1)))
                                           (%_3250 %_4302))))
                                      (%_3251 %_4302))
                                     (%_3229 %_4300 %_4302)))
                                 %_4301))))
               ((letrec ((%_4295
                           (lambda (%_4296 %_4297)
                             (if (null? %_4296)
                               (if (not (null? %_4297))
                                 (syntax-error
                                   %_4297
                                   '"missing definition for export(s)")
                                 (void))
                               ((lambda (%_4298 %_4299)
                                  (if (%_4294 %_4298 %_4293)
                                    (%_4295 %_4299 %_4297)
                                    (%_4295 %_4299 (cons %_4298 %_4297))))
                                (car %_4296)
                                (cdr %_4296))))))
                  %_4295)
                %_4292
                '()))))
         (%_3272
           (lambda (%_4310 %_4311)
             (letrec ((%_4315
                        (lambda (%_4346 %_4347 %_4348)
                          ((lambda (%_4349)
                             (if %_4349
                               (if (%_3216
                                     ((lambda (%_4353)
                                        (if (annotation? %_4353)
                                          (annotation-expression %_4353)
                                          %_4353))
                                      (if (%_3076 %_4346)
                                        (%_3077 %_4346)
                                        %_4346))
                                     %_4349
                                     (if (symbol? %_4346)
                                       (car '((top)))
                                       (car (%_3078 %_4346))))
                                 (cons %_4346 %_4348)
                                 %_4348)
                               (%_4313
                                 (%_3250 %_4347)
                                 (lambda (%_4350 %_4351)
                                   (if (%_4312 %_4350 %_4346)
                                     (cons %_4350 %_4351)
                                     %_4351))
                                 %_4348)))
                           (%_3251 %_4347))))
                      (%_4314
                        (lambda (%_4337 %_4338 %_4339)
                          (if (%_3249 %_4337)
                            (if (%_3249 %_4338)
                              (call-with-values
                                (lambda ()
                                  ((lambda (%_4340 %_4341)
                                     (if (> (vector-length %_4340)
                                            (vector-length %_4341))
                                       (values %_4337 %_4341)
                                       (values %_4338 %_4340)))
                                   (%_3250 %_4337)
                                   (%_3250 %_4338)))
                                (lambda (%_4342 %_4343)
                                  (%_4313
                                    %_4343
                                    (lambda (%_4344 %_4345)
                                      (%_4315 %_4344 %_4342 %_4345))
                                    %_4339)))
                              (%_4315 %_4338 %_4337 %_4339))
                            (if (%_3249 %_4338)
                              (%_4315 %_4337 %_4338 %_4339)
                              (if (%_4312 %_4337 %_4338)
                                (cons %_4337 %_4339)
                                %_4339)))))
                      (%_4313
                        (lambda (%_4330 %_4331 %_4332)
                          ((lambda (%_4333)
                             ((letrec ((%_4334
                                         (lambda (%_4335 %_4336)
                                           (if (= %_4335 %_4333)
                                             %_4336
                                             (%_4334
                                               (+ %_4335 '1)
                                               (%_4331
                                                 (vector-ref %_4330 %_4335)
                                                 %_4336))))))
                                %_4334)
                              '0
                              %_4332))
                           (vector-length %_4330))))
                      (%_4312
                        (lambda (%_4324 %_4325)
                          (if (symbol? %_4324)
                            (if (symbol? %_4325)
                              (eq? %_4324 %_4325)
                              (if (eq? %_4324
                                       ((lambda (%_4329)
                                          (if (annotation? %_4329)
                                            (annotation-expression %_4329)
                                            %_4329))
                                        (if (%_3076 %_4325)
                                          (%_3077 %_4325)
                                          %_4325)))
                                (%_3222 (car (%_3078 %_4325)) (car '((top))))
                                '#f))
                            (if (symbol? %_4325)
                              (if (eq? %_4325
                                       ((lambda (%_4327)
                                          (if (annotation? %_4327)
                                            (annotation-expression %_4327)
                                            %_4327))
                                        (if (%_3076 %_4324)
                                          (%_3077 %_4324)
                                          %_4324)))
                                (%_3222 (car (%_3078 %_4324)) (car '((top))))
                                '#f)
                              (%_3229 %_4324 %_4325))))))
               (if (not (null? %_4311))
                 ((letrec ((%_4316
                             (lambda (%_4317 %_4318 %_4319)
                               (if (null? %_4318)
                                 (if (not (null? %_4319))
                                   ((lambda (%_4323)
                                      (syntax-error
                                        %_4310
                                        '"duplicate definition for "
                                        (symbol->string (car %_4323))
                                        '" in"))
                                    (syntax-object->datum %_4319))
                                   (void))
                                 ((letrec ((%_4320
                                             (lambda (%_4321 %_4322)
                                               (if (null? %_4321)
                                                 (%_4316
                                                   (car %_4318)
                                                   (cdr %_4318)
                                                   %_4322)
                                                 (%_4320
                                                   (cdr %_4321)
                                                   (%_4314
                                                     %_4317
                                                     (car %_4321)
                                                     %_4322))))))
                                    %_4320)
                                  %_4318
                                  %_4319)))))
                    %_4316)
                  (car %_4311)
                  (cdr %_4311)
                  '())
                 (void)))))
         (%_3273
           (lambda (%_4354
                    %_4355
                    %_4356
                    %_4357
                    %_4358
                    %_4359
                    %_4360
                    %_4361)
             (letrec ((%_4364
                        (lambda (%_4437 %_4438)
                          ((lambda (%_4439)
                             (map (lambda (%_4440)
                                    ((lambda (%_4441)
                                       (if (not (%_3238 %_4441 %_4439))
                                         %_4440
                                         (%_3256
                                           (%_3258 %_4440)
                                           %_4441
                                           (%_3260 %_4440)
                                           (append
                                             (%_4363 %_4441)
                                             (%_3261 %_4440))
                                           (%_3262 %_4440))))
                                     (%_3259 %_4440)))
                                  %_4437))
                           (map (lambda (%_4442)
                                  (if (pair? %_4442) (car %_4442) %_4442))
                                %_4438))))
                      (%_4363
                        (lambda (%_4434)
                          ((letrec ((%_4435
                                      (lambda (%_4436)
                                        (if (null? %_4436)
                                          '()
                                          (if (if (pair? (car %_4436))
                                                (%_3229 %_4434 (caar %_4436))
                                                '#f)
                                            (%_3247 (cdar %_4436))
                                            (%_4435 (cdr %_4436)))))))
                             %_4435)
                           %_4358)))
                      (%_4362
                        (lambda (%_4431 %_4432 %_4433)
                          (begin
                            (%_3272 %_4355 %_4432)
                            (%_3271 %_4355 %_4359 %_4432)
                            (%_4361 %_4431 %_4433)))))
               ((letrec ((%_4365
                           (lambda (%_4366 %_4367 %_4368 %_4369)
                             (if (null? %_4366)
                               (%_4362 %_4368 %_4367 %_4369)
                               ((lambda (%_4370 %_4371)
                                  (call-with-values
                                    (lambda ()
                                      (%_3244 %_4370 %_4371 '(()) '#f %_4354))
                                    (lambda (%_4372
                                             %_4373
                                             %_4374
                                             %_4375
                                             %_4376)
                                      (if (memv %_4372 '(define-form))
                                        (%_3291
                                          %_4374
                                          %_4375
                                          %_4376
                                          (lambda (%_4425 %_4426 %_4427)
                                            ((lambda (%_4428)
                                               ((lambda (%_4429)
                                                  ((lambda (%_4430)
                                                     (begin
                                                       (%_3212
                                                         %_4354
                                                         %_4428
                                                         %_4429)
                                                       (%_4365
                                                         (cdr %_4366)
                                                         (cons %_4428 %_4367)
                                                         (cons (%_3256
                                                                 %_4372
                                                                 %_4428
                                                                 %_4429
                                                                 %_4430
                                                                 (cons %_4371
                                                                       (%_3239
                                                                         %_4426
                                                                         %_4427)))
                                                               %_4368)
                                                         %_4369)))
                                                   (%_4363 %_4428)))
                                                (%_3175)))
                                             (%_3239 %_4425 %_4427))))
                                        (if (memv %_4372 '(define-syntax-form))
                                          (%_3292
                                            %_4374
                                            %_4375
                                            %_4376
                                            (lambda (%_4418 %_4419 %_4420)
                                              ((lambda (%_4421)
                                                 ((lambda (%_4422)
                                                    ((lambda (%_4423)
                                                       ((lambda (%_4424)
                                                          (begin
                                                            (%_3270
                                                              %_4357
                                                              (%_3176 %_4422)
                                                              (cons 'deferred
                                                                    %_4424))
                                                            (%_3212
                                                              %_4354
                                                              %_4421
                                                              %_4422)
                                                            (%_4365
                                                              (cdr %_4366)
                                                              (cons %_4421
                                                                    %_4367)
                                                              (cons (%_3256
                                                                      %_4372
                                                                      %_4421
                                                                      %_4422
                                                                      %_4423
                                                                      %_4424)
                                                                    %_4368)
                                                              %_4369)))
                                                        (%_3281
                                                          %_4419
                                                          (%_3121 %_4371)
                                                          %_4420)))
                                                     (%_4363 %_4421)))
                                                  (%_3175)))
                                               (%_3239 %_4418 %_4420))))
                                          (if (memv %_4372 '(module-form))
                                            ((lambda (%_4405)
                                               ((lambda (%_4406)
                                                  (%_3289
                                                    %_4374
                                                    %_4375
                                                    %_4376
                                                    %_4406
                                                    (lambda (%_4407
                                                             %_4408
                                                             %_4409)
                                                      (%_3273
                                                        %_4405
                                                        (%_3240
                                                          %_4374
                                                          %_4375
                                                          %_4376)
                                                        (map (lambda (%_4410)
                                                               (cons %_4371
                                                                     %_4410))
                                                             %_4409)
                                                        %_4357
                                                        %_4408
                                                        (%_3247 %_4408)
                                                        %_4360
                                                        (lambda (%_4411 %_4412)
                                                          ((lambda (%_4413)
                                                             ((lambda (%_4414)
                                                                ((lambda (%_4415)
                                                                   (if %_4407
                                                                     ((lambda (%_4416
                                                                               %_4417)
                                                                        (begin
                                                                          (%_3270
                                                                            %_4357
                                                                            (%_3176
                                                                              %_4416)
                                                                            (%_3103
                                                                              'module
                                                                              %_4413))
                                                                          (%_3212
                                                                            %_4354
                                                                            %_4407
                                                                            %_4416)
                                                                          (%_4365
                                                                            (cdr %_4366)
                                                                            (cons %_4407
                                                                                  %_4367)
                                                                            (cons (%_3256
                                                                                    %_4372
                                                                                    %_4407
                                                                                    %_4416
                                                                                    %_4417
                                                                                    %_4408)
                                                                                  %_4414)
                                                                            %_4415)))
                                                                      (%_3175)
                                                                      (%_4363
                                                                        %_4407))
                                                                     (begin
                                                                       (%_3288
                                                                         %_4413
                                                                         %_4354)
                                                                       (%_4365
                                                                         (cdr %_4366)
                                                                         (cons %_4413
                                                                               %_4367)
                                                                         %_4414
                                                                         %_4415))))
                                                                 (append
                                                                   %_4369
                                                                   %_4412)))
                                                              (append
                                                                (if %_4407
                                                                  %_4411
                                                                  (%_4364
                                                                    %_4411
                                                                    %_4408))
                                                                %_4368)))
                                                           (%_3254
                                                             %_4408)))))))
                                                (cons (car %_4375)
                                                      (cons %_4405
                                                            (cdr %_4375)))))
                                             (%_3181 '() '() '()))
                                            (if (memv %_4372 '(import-form))
                                              (%_3290
                                                %_4374
                                                %_4375
                                                %_4376
                                                (lambda (%_4400)
                                                  ((lambda (%_4401)
                                                     ((lambda (%_4402)
                                                        ((lambda (%_4403)
                                                           (if (memv %_4403
                                                                     '(module))
                                                             ((lambda (%_4404)
                                                                (begin
                                                                  (if %_4373
                                                                    (%_3213
                                                                      %_4354
                                                                      %_4373)
                                                                    (void))
                                                                  (%_3288
                                                                    %_4404
                                                                    %_4354)
                                                                  (%_4365
                                                                    (cdr %_4366)
                                                                    (cons %_4404
                                                                          %_4367)
                                                                    (%_4364
                                                                      %_4368
                                                                      (vector->list
                                                                        (%_3250
                                                                          %_4404)))
                                                                    %_4369)))
                                                              (cdr %_4402))
                                                             (if (memv %_4403
                                                                       '(displaced-lexical))
                                                               (%_3122 %_4400)
                                                               (syntax-error
                                                                 %_4400
                                                                 '"import from unknown module"))))
                                                         (car %_4402)))
                                                      (%_3125 %_4401 %_4357)))
                                                   (%_3226 %_4400 '(())))))
                                              (if (memv %_4372 '(begin-form))
                                                ((lambda (%_4394)
                                                   (if %_4394
                                                     (apply (lambda (%_4395
                                                                     %_4396)
                                                              (%_4365
                                                                ((letrec ((%_4397
                                                                            (lambda (%_4398)
                                                                              (if (null? %_4398)
                                                                                (cdr %_4366)
                                                                                (cons (cons %_4371
                                                                                            (%_3239
                                                                                              (car %_4398)
                                                                                              %_4375))
                                                                                      (%_4397
                                                                                        (cdr %_4398)))))))
                                                                   %_4397)
                                                                 %_4396)
                                                                %_4367
                                                                %_4368
                                                                %_4369))
                                                            %_4394)
                                                     (syntax-error %_4374)))
                                                 ($syntax-dispatch
                                                   (compile-in-annotation
                                                     %_4374
                                                     value)
                                                   '(any . each-any)))
                                                (if (memv %_4372
                                                          '(eval-when-form))
                                                  ((lambda (%_4385)
                                                     (if %_4385
                                                       (apply (lambda (%_4386
                                                                       %_4387
                                                                       %_4388)
                                                                (%_4365
                                                                  (if (memq 'eval
                                                                            (%_3243
                                                                              %_4387
                                                                              %_4375))
                                                                    ((letrec ((%_4389
                                                                                (lambda (%_4390)
                                                                                  (if (null? %_4390)
                                                                                    (cdr %_4366)
                                                                                    (cons (cons %_4371
                                                                                                (%_3239
                                                                                                  (car %_4390)
                                                                                                  %_4375))
                                                                                          (%_4389
                                                                                            (cdr %_4390)))))))
                                                                       %_4389)
                                                                     %_4388)
                                                                    (cdr %_4366))
                                                                  %_4367
                                                                  %_4368
                                                                  %_4369))
                                                              %_4385)
                                                       (syntax-error %_4374)))
                                                   ($syntax-dispatch
                                                     (compile-in-annotation
                                                       %_4374
                                                       value)
                                                     '(any each-any
                                                           .
                                                           each-any)))
                                                  (if (memv %_4372
                                                            '(local-syntax-form))
                                                    (%_3294
                                                      %_4373
                                                      %_4374
                                                      %_4371
                                                      %_4375
                                                      %_4376
                                                      (lambda (%_4378
                                                               %_4379
                                                               %_4380
                                                               %_4381)
                                                        (%_4365
                                                          ((letrec ((%_4382
                                                                      (lambda (%_4383)
                                                                        (if (null? %_4383)
                                                                          (cdr %_4366)
                                                                          (cons (cons %_4379
                                                                                      (%_3239
                                                                                        (car %_4383)
                                                                                        %_4380))
                                                                                (%_4382
                                                                                  (cdr %_4383)))))))
                                                             %_4382)
                                                           %_4378)
                                                          %_4367
                                                          %_4368
                                                          %_4369)))
                                                    (%_4362
                                                      %_4368
                                                      %_4367
                                                      (append
                                                        %_4369
                                                        (cons (cons %_4371
                                                                    (%_3240
                                                                      %_4374
                                                                      %_4375
                                                                      %_4376))
                                                              (cdr %_4366))))))))))))))
                                (cdar %_4366)
                                (caar %_4366))))))
                  %_4365)
                %_4356
                '()
                '()
                '()))))
         (%_3274
           (lambda (%_4443 %_4444)
             ((letrec ((%_4445
                         (lambda (%_4446 %_4447)
                           (if (< %_4446 '0)
                             %_4447
                             (%_4445
                               (- %_4446 '1)
                               (cons (%_4443 (vector-ref %_4444 %_4446))
                                     %_4447))))))
                %_4445)
              (- (vector-length %_4444) '1)
              '())))
         (%_3275
           (lambda (%_4448 %_4449)
             ((lambda (%_4450)
                ((letrec ((%_4451
                            (lambda (%_4452)
                              (if (not (= %_4452 %_4450))
                                (begin
                                  (%_4448 (vector-ref %_4449 %_4452))
                                  (%_4451 (+ %_4452 '1)))
                                (void)))))
                   %_4451)
                 '0))
              (vector-length %_4449))))
         (%_3276
           (lambda (%_4453 %_4454)
             (list '$sc-put-cte
                   (list 'quote %_4453)
                   (list 'quote (%_3103 'do-import %_4454)))))
         (%_3277
           (lambda (%_4456 %_4457)
             (remq '-
                   (apply append
                          (map (lambda (%_4458)
                                 ((lambda (%_4459)
                                    (map (lambda (%_4460)
                                           (cdr (assq %_4460 %_4459)))
                                         %_4456))
                                  (cdr (assq %_4458
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
                               %_4457)))))
         (%_3278
           (lambda (%_4461 %_4462)
             (apply append
                    (map (lambda (%_4463)
                           (if %_4462
                             (if (memv %_4463 '(compile))
                               '(c)
                               (if (memv %_4463 '(load))
                                 '(l)
                                 (if (memv %_4463 '(visit))
                                   '(v)
                                   (if (memv %_4463 '(revisit)) '(r) '()))))
                             (if (memv %_4463 '(eval)) '(e) '())))
                         %_4461))))
         (%_3279
           (lambda (%_4466 %_4467)
             (if (memq 'e %_4466)
               (%_4467)
               ((lambda (%_4468)
                  (if (memq 'v %_4466)
                    (if ((lambda (%_4470)
                           (if %_4470 %_4470 (memq 'r %_4466)))
                         (memq 'l %_4466))
                      (%_4468)
                      (%_4468))
                    (if ((lambda (%_4469)
                           (if %_4469 %_4469 (memq 'r %_4466)))
                         (memq 'l %_4466))
                      (%_4468)
                      (%_3295))))
                (if (memq 'c %_4466)
                  ((lambda (%_4471)
                     (begin (%_2952 %_4471) (lambda () %_4471)))
                   (%_4467))
                  %_4467)))))
         (%_3280
           (lambda (%_4472 %_4473)
             (if (memq 'e %_4472)
               (begin (%_2952 (%_4473)) (%_3295))
               ((lambda (%_4474)
                  (if (memq 'r %_4472)
                    (if ((lambda (%_4476)
                           (if %_4476 %_4476 (memq 'v %_4472)))
                         (memq 'l %_4472))
                      (%_4474)
                      (%_4474))
                    (if ((lambda (%_4475)
                           (if %_4475 %_4475 (memq 'v %_4472)))
                         (memq 'l %_4472))
                      (%_4474)
                      (%_3295))))
                (if (memq 'c %_4472)
                  ((lambda (%_4477)
                     (begin (%_2952 %_4477) (lambda () %_4477)))
                   (%_4473))
                  %_4473)))))
         (%_3281
           (lambda (%_4478 %_4479 %_4480)
             (call-with-values
               (lambda () (%_3244 %_4478 %_4479 %_4480 '#f '#f))
               (lambda (%_4481 %_4482 %_4483 %_4484 %_4485)
                 (%_3282
                   %_4481
                   %_4482
                   %_4483
                   %_4479
                   %_4484
                   %_4485)))))
         (%_3282
           (lambda (%_4486 %_4487 %_4488 %_4489 %_4490 %_4491)
             (if (memv %_4486 '(lexical))
               (if %_4491
                 (list 'compile-in-annotation %_4487 %_4491)
                 %_4487)
               (if (memv %_4486 '(core))
                 (%_4487 %_4488 %_4489 %_4490 %_4491)
                 (if (memv %_4486 '(lexical-call))
                   (%_3283
                     (if (%_3095 (car %_4488))
                       (list 'compile-in-annotation
                             %_4487
                             (%_3095 (car %_4488)))
                       %_4487)
                     %_4488
                     %_4489
                     %_4490
                     %_4491)
                   (if (memv %_4486 '(constant))
                     (if %_4491
                       (list 'compile-in-annotation
                             (list 'quote
                                   (%_3299
                                     (%_3240 %_4488 %_4490 %_4491)
                                     '(())))
                             %_4491)
                       (list 'quote
                             (%_3299 (%_3240 %_4488 %_4490 %_4491) '(()))))
                     (if (memv %_4486 '(global))
                       (if %_4491
                         (list 'compile-in-annotation %_4487 %_4491)
                         %_4487)
                       (if (memv %_4486 '(call))
                         (%_3283
                           (%_3281 (car %_4488) %_4489 %_4490)
                           %_4488
                           %_4489
                           %_4490
                           %_4491)
                         (if (memv %_4486 '(begin-form))
                           ((lambda (%_4502)
                              (if %_4502
                                (apply (lambda (%_4503 %_4504 %_4505)
                                         (%_3241
                                           (cons %_4504 %_4505)
                                           %_4489
                                           %_4490
                                           %_4491))
                                       %_4502)
                                (syntax-error %_4488)))
                            ($syntax-dispatch
                              (compile-in-annotation %_4488 value)
                              '(any any . each-any)))
                           (if (memv %_4486 '(local-syntax-form))
                             (%_3294
                               %_4487
                               %_4488
                               %_4489
                               %_4490
                               %_4491
                               %_3241)
                             (if (memv %_4486 '(eval-when-form))
                               ((lambda (%_4494)
                                  (if %_4494
                                    (apply (lambda (%_4495
                                                    %_4496
                                                    %_4497
                                                    %_4498)
                                             (if (memq 'eval
                                                       (%_3243 %_4496 %_4490))
                                               (%_3241
                                                 (cons %_4497 %_4498)
                                                 %_4489
                                                 %_4490
                                                 %_4491)
                                               (%_3295)))
                                           %_4494)
                                    (syntax-error %_4488)))
                                ($syntax-dispatch
                                  (compile-in-annotation %_4488 value)
                                  '(any each-any any . each-any)))
                               (if (memv %_4486
                                         '(define-form
                                            define-syntax-form
                                            module-form
                                            import-form))
                                 (syntax-error
                                   (%_3240 %_4488 %_4490 %_4491)
                                   '"invalid context for definition")
                                 (if (memv %_4486 '(syntax))
                                   (syntax-error
                                     (%_3240 %_4488 %_4490 %_4491)
                                     '"reference to pattern variable outside syntax form")
                                   (if (memv %_4486 '(displaced-lexical))
                                     (%_3122 (%_3240 %_4488 %_4490 %_4491))
                                     (syntax-error
                                       (%_3240
                                         %_4488
                                         %_4490
                                         %_4491))))))))))))))))
         (%_3283
           (lambda (%_4507 %_4508 %_4509 %_4510 %_4511)
             ((lambda (%_4513)
                (if %_4513
                  (apply (lambda (%_4515 %_4516)
                           (if %_4511
                             (list 'compile-in-annotation
                                   (cons %_4507
                                         (map (lambda (%_4519)
                                                (%_3281 %_4519 %_4509 %_4510))
                                              %_4516))
                                   %_4511)
                             (cons %_4507
                                   (map (lambda (%_4517)
                                          (%_3281 %_4517 %_4509 %_4510))
                                        %_4516))))
                         %_4513)
                  (syntax-error (%_3240 %_4508 %_4510 %_4511))))
              ($syntax-dispatch
                (compile-in-annotation %_4508 value)
                '(any . each-any)))))
         (%_3284
           (lambda (%_4521 %_4522 %_4523 %_4524 %_4525)
             ((lambda (%_4527)
                (if (if %_4527
                      (apply (lambda (%_4545 %_4546 %_4547) (%_3133 %_4546))
                             %_4527)
                      '#f)
                  (apply (lambda (%_4529 %_4530 %_4531)
                           ((lambda (%_4532)
                              ((lambda (%_4533)
                                 ((lambda (%_4534)
                                    (if (memv %_4534 '(macro!))
                                      ((lambda (%_4544 %_4543)
                                         (%_3244
                                           (%_3285
                                             (cdr %_4533)
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
                                                   %_4543
                                                   %_4544)
                                             %_4522
                                             '(())
                                             %_4524
                                             %_4525)
                                           %_4522
                                           '(())
                                           %_4524
                                           %_4525))
                                       (%_3239 %_4531 %_4523)
                                       (%_3239 %_4530 %_4523))
                                      (values
                                        'core
                                        (lambda (%_4535 %_4536 %_4537 %_4538)
                                          ((lambda (%_4540 %_4539)
                                             ((lambda (%_4541)
                                                ((lambda (%_4542)
                                                   (if (memv %_4542 '(lexical))
                                                     (if %_4538
                                                       (list 'compile-in-annotation
                                                             (list 'set!
                                                                   (cdr %_4541)
                                                                   %_4539)
                                                             %_4538)
                                                       (list 'set!
                                                             (cdr %_4541)
                                                             %_4539))
                                                     (if (memv %_4542
                                                               '(global))
                                                       (if %_4538
                                                         (list 'compile-in-annotation
                                                               (list 'set!
                                                                     (cdr %_4541)
                                                                     %_4539)
                                                               %_4538)
                                                         (list 'set!
                                                               (cdr %_4541)
                                                               %_4539))
                                                       (if (memv %_4542
                                                                 '(displaced-lexical))
                                                         (syntax-error
                                                           (%_3239
                                                             %_4530
                                                             %_4537)
                                                           '"identifier out of context")
                                                         (syntax-error
                                                           (%_3240
                                                             %_4535
                                                             %_4537
                                                             %_4538))))))
                                                 (car %_4541)))
                                              (%_3125 %_4540 %_4536)))
                                           (%_3226 %_4530 %_4537)
                                           (%_3281 %_4531 %_4536 %_4537)))
                                        %_4521
                                        %_4523
                                        %_4524)))
                                  (car %_4533)))
                               (%_3125 %_4532 %_4522)))
                            (%_3226 %_4530 %_4523)))
                         %_4527)
                  (syntax-error (%_3240 %_4521 %_4523 %_4524))))
              ($syntax-dispatch
                (compile-in-annotation %_4521 value)
                '(any any any)))))
         (%_3285
           (lambda (%_4548 %_4549 %_4550 %_4551 %_4552 %_4553)
             (letrec ((%_4554
                        (lambda (%_4557 %_4558)
                          (if (pair? %_4557)
                            (cons (%_4554 (car %_4557) %_4558)
                                  (%_4554 (cdr %_4557) %_4558))
                            (if (%_3076 %_4557)
                              ((lambda (%_4563)
                                 ((lambda (%_4564 %_4565)
                                    (%_3075
                                      (%_3077 %_4557)
                                      (if (if (pair? %_4564)
                                            (eq? (car %_4564) '#f)
                                            '#f)
                                        (cons (cdr %_4564)
                                              (if %_4553
                                                (cons %_4553 (cdr %_4565))
                                                (cdr %_4565)))
                                        (cons (cons %_4558 %_4564)
                                              (if %_4553
                                                (cons %_4553
                                                      (cons 'shift %_4565))
                                                (cons 'shift %_4565))))))
                                  (car %_4563)
                                  (cdr %_4563)))
                               (%_3078 %_4557))
                              (if (vector? %_4557)
                                ((lambda (%_4559)
                                   ((lambda (%_4560)
                                      ((letrec ((%_4561
                                                  (lambda (%_4562)
                                                    (if (= %_4562 %_4559)
                                                      %_4560
                                                      (begin
                                                        (vector-set!
                                                          %_4560
                                                          %_4562
                                                          (%_4554
                                                            (vector-ref
                                                              %_4557
                                                              %_4562)
                                                            %_4558))
                                                        (%_4561
                                                          (+ %_4562 '1)))))))
                                         %_4561)
                                       '0))
                                    (make-vector %_4559)))
                                 (vector-length %_4557))
                                (if (symbol? %_4557)
                                  (syntax-error
                                    (%_3240 %_4549 %_4551 %_4552)
                                    '"encountered raw symbol "
                                    (format '"~s" %_4557)
                                    '" in output of macro")
                                  %_4557)))))))
               (%_4554
                 ((lambda (%_4555)
                    (if (procedure? %_4555)
                      (%_4555
                        (lambda (%_4556)
                          (begin
                            (if (not (identifier? %_4556))
                              (syntax-error
                                %_4556
                                '"environment argument is not an identifier")
                              (void))
                            (%_3125 (%_3226 %_4556 '(())) %_4550))))
                      %_4555))
                  (%_4548 (%_3240 %_4549 (%_3198 %_4551) %_4552)))
                 (string '#\m)))))
         (%_3286
           (lambda (%_4566 %_4567 %_4568 %_4569)
             ((lambda (%_4570)
                ((lambda (%_4571)
                   ((lambda (%_4572)
                      ((lambda (%_4573)
                         (%_3287
                           %_4571
                           %_4567
                           %_4573
                           %_4570
                           (lambda (%_4574 %_4575 %_4576 %_4577 %_4578)
                             (begin
                               (if (null? %_4574)
                                 (syntax-error
                                   %_4567
                                   '"no expressions in body")
                                 (void))
                               (%_3063
                                 '#f
                                 %_4576
                                 (map (lambda (%_4579)
                                        (%_3281
                                          (cdr %_4579)
                                          (car %_4579)
                                          '(())))
                                      %_4577)
                                 (%_3061
                                   '#f
                                   (map (lambda (%_4580)
                                          (%_3281
                                            (cdr %_4580)
                                            (car %_4580)
                                            '(())))
                                        (append %_4578 %_4574))))))))
                       (map (lambda (%_4581)
                              (cons %_4570 (%_3239 %_4581 %_4572)))
                            %_4566)))
                    (cons (car %_4569) (cons %_4571 (cdr %_4569)))))
                 (%_3181 '() '() '())))
              (cons '("placeholder" placeholder) %_4568))))
         (%_3287
           (lambda (%_4582 %_4583 %_4584 %_4585 %_4586)
             (letrec ((%_4587
                        (lambda (%_4657 %_4658 %_4659 %_4660 %_4661)
                          (begin
                            (%_3272 %_4583 %_4658)
                            (%_4586
                              %_4657
                              %_4658
                              (reverse %_4659)
                              (reverse %_4660)
                              %_4661)))))
               ((letrec ((%_4588
                           (lambda (%_4589 %_4590 %_4591 %_4592 %_4593)
                             (if (null? %_4589)
                               (%_4587 %_4589 %_4590 %_4591 %_4592 %_4593)
                               ((lambda (%_4594 %_4595)
                                  (call-with-values
                                    (lambda ()
                                      (%_3244 %_4594 %_4595 '(()) '#f %_4582))
                                    (lambda (%_4596
                                             %_4597
                                             %_4598
                                             %_4599
                                             %_4600)
                                      (if (memv %_4596 '(define-form))
                                        (%_3291
                                          %_4598
                                          %_4599
                                          %_4600
                                          (lambda (%_4651 %_4652 %_4653)
                                            ((lambda (%_4654 %_4655)
                                               ((lambda (%_4656)
                                                  (begin
                                                    (%_3212
                                                      %_4582
                                                      %_4654
                                                      %_4655)
                                                    (%_3270
                                                      %_4585
                                                      %_4655
                                                      (%_3103 'lexical %_4656))
                                                    (%_4588
                                                      (cdr %_4589)
                                                      (cons %_4654 %_4590)
                                                      (cons %_4656 %_4591)
                                                      (cons (cons %_4595
                                                                  (%_3239
                                                                    %_4652
                                                                    %_4653))
                                                            %_4592)
                                                      %_4593)))
                                                (%_3300 %_4654)))
                                             (%_3239 %_4651 %_4653)
                                             (%_3178))))
                                        (if (memv %_4596 '(define-syntax-form))
                                          (%_3292
                                            %_4598
                                            %_4599
                                            %_4600
                                            (lambda (%_4645 %_4646 %_4647)
                                              ((lambda (%_4648 %_4649 %_4650)
                                                 (begin
                                                   (%_3212
                                                     %_4582
                                                     %_4648
                                                     %_4649)
                                                   (%_3270
                                                     %_4585
                                                     %_4649
                                                     (%_3103 'deferred %_4650))
                                                   (%_4588
                                                     (cdr %_4589)
                                                     (cons %_4648 %_4590)
                                                     %_4591
                                                     %_4592
                                                     %_4593)))
                                               (%_3239 %_4645 %_4647)
                                               (%_3178)
                                               (%_3281
                                                 %_4646
                                                 (%_3121 %_4595)
                                                 %_4647))))
                                          (if (memv %_4596 '(module-form))
                                            ((lambda (%_4629)
                                               ((lambda (%_4630)
                                                  (%_3289
                                                    %_4598
                                                    %_4599
                                                    %_4600
                                                    %_4630
                                                    (lambda (%_4631
                                                             %_4632
                                                             %_4633)
                                                      (%_3287
                                                        %_4629
                                                        (%_3240
                                                          %_4598
                                                          %_4599
                                                          %_4600)
                                                        (map (lambda (%_4634)
                                                               (cons %_4595
                                                                     %_4634))
                                                             %_4633)
                                                        %_4585
                                                        (lambda (%_4635
                                                                 %_4636
                                                                 %_4637
                                                                 %_4638
                                                                 %_4639)
                                                          (begin
                                                            (%_3271
                                                              %_4583
                                                              (%_3247 %_4632)
                                                              %_4636)
                                                            ((lambda (%_4640
                                                                      %_4641
                                                                      %_4642
                                                                      %_4643)
                                                               (if %_4631
                                                                 ((lambda (%_4644)
                                                                    (begin
                                                                      (%_3212
                                                                        %_4582
                                                                        %_4631
                                                                        %_4644)
                                                                      (%_3270
                                                                        %_4585
                                                                        %_4644
                                                                        (%_3103
                                                                          'module
                                                                          %_4640))
                                                                      (%_4588
                                                                        (cdr %_4589)
                                                                        (cons %_4631
                                                                              %_4590)
                                                                        %_4641
                                                                        %_4642
                                                                        %_4643)))
                                                                  (%_3178))
                                                                 (begin
                                                                   (%_3288
                                                                     %_4640
                                                                     %_4582)
                                                                   (%_4588
                                                                     (cdr %_4589)
                                                                     (cons %_4640
                                                                           %_4590)
                                                                     %_4641
                                                                     %_4642
                                                                     %_4643))))
                                                             (%_3254 %_4632)
                                                             (append
                                                               %_4637
                                                               %_4591)
                                                             (append
                                                               %_4638
                                                               %_4592)
                                                             (append
                                                               %_4593
                                                               %_4639
                                                               %_4635))))))))
                                                (cons (car %_4599)
                                                      (cons %_4629
                                                            (cdr %_4599)))))
                                             (%_3181 '() '() '()))
                                            (if (memv %_4596 '(import-form))
                                              (%_3290
                                                %_4598
                                                %_4599
                                                %_4600
                                                (lambda (%_4624)
                                                  ((lambda (%_4625)
                                                     ((lambda (%_4626)
                                                        ((lambda (%_4627)
                                                           (if (memv %_4627
                                                                     '(module))
                                                             ((lambda (%_4628)
                                                                (begin
                                                                  (if %_4597
                                                                    (%_3213
                                                                      %_4582
                                                                      %_4597)
                                                                    (void))
                                                                  (%_3288
                                                                    %_4628
                                                                    %_4582)
                                                                  (%_4588
                                                                    (cdr %_4589)
                                                                    (cons %_4628
                                                                          %_4590)
                                                                    %_4591
                                                                    %_4592
                                                                    %_4593)))
                                                              (cdr %_4626))
                                                             (if (memv %_4627
                                                                       '(displaced-lexical))
                                                               (%_3122 %_4624)
                                                               (syntax-error
                                                                 %_4624
                                                                 '"import from unknown module"))))
                                                         (car %_4626)))
                                                      (%_3125 %_4625 %_4585)))
                                                   (%_3226 %_4624 '(())))))
                                              (if (memv %_4596 '(begin-form))
                                                ((lambda (%_4618)
                                                   (if %_4618
                                                     (apply (lambda (%_4619
                                                                     %_4620)
                                                              (%_4588
                                                                ((letrec ((%_4621
                                                                            (lambda (%_4622)
                                                                              (if (null? %_4622)
                                                                                (cdr %_4589)
                                                                                (cons (cons %_4595
                                                                                            (%_3239
                                                                                              (car %_4622)
                                                                                              %_4599))
                                                                                      (%_4621
                                                                                        (cdr %_4622)))))))
                                                                   %_4621)
                                                                 %_4620)
                                                                %_4590
                                                                %_4591
                                                                %_4592
                                                                %_4593))
                                                            %_4618)
                                                     (syntax-error %_4598)))
                                                 ($syntax-dispatch
                                                   (compile-in-annotation
                                                     %_4598
                                                     value)
                                                   '(any . each-any)))
                                                (if (memv %_4596
                                                          '(eval-when-form))
                                                  ((lambda (%_4609)
                                                     (if %_4609
                                                       (apply (lambda (%_4610
                                                                       %_4611
                                                                       %_4612)
                                                                (%_4588
                                                                  (if (memq 'eval
                                                                            (%_3243
                                                                              %_4611
                                                                              %_4599))
                                                                    ((letrec ((%_4613
                                                                                (lambda (%_4614)
                                                                                  (if (null? %_4614)
                                                                                    (cdr %_4589)
                                                                                    (cons (cons %_4595
                                                                                                (%_3239
                                                                                                  (car %_4614)
                                                                                                  %_4599))
                                                                                          (%_4613
                                                                                            (cdr %_4614)))))))
                                                                       %_4613)
                                                                     %_4612)
                                                                    (cdr %_4589))
                                                                  %_4590
                                                                  %_4591
                                                                  %_4592
                                                                  %_4593))
                                                              %_4609)
                                                       (syntax-error %_4598)))
                                                   ($syntax-dispatch
                                                     (compile-in-annotation
                                                       %_4598
                                                       value)
                                                     '(any each-any
                                                           .
                                                           each-any)))
                                                  (if (memv %_4596
                                                            '(local-syntax-form))
                                                    (%_3294
                                                      %_4597
                                                      %_4598
                                                      %_4595
                                                      %_4599
                                                      %_4600
                                                      (lambda (%_4602
                                                               %_4603
                                                               %_4604
                                                               %_4605)
                                                        (%_4588
                                                          ((letrec ((%_4606
                                                                      (lambda (%_4607)
                                                                        (if (null? %_4607)
                                                                          (cdr %_4589)
                                                                          (cons (cons %_4603
                                                                                      (%_3239
                                                                                        (car %_4607)
                                                                                        %_4604))
                                                                                (%_4606
                                                                                  (cdr %_4607)))))))
                                                             %_4606)
                                                           %_4602)
                                                          %_4590
                                                          %_4591
                                                          %_4592
                                                          %_4593)))
                                                    (%_4587
                                                      (cons (cons %_4595
                                                                  (%_3240
                                                                    %_4598
                                                                    %_4599
                                                                    %_4600))
                                                            (cdr %_4589))
                                                      %_4590
                                                      %_4591
                                                      %_4592
                                                      %_4593)))))))))))
                                (cdar %_4589)
                                (caar %_4589))))))
                  %_4588)
                %_4584
                '()
                '()
                '()
                '()))))
         (%_3288
           (lambda (%_4662 %_4663)
             ((lambda (%_4664)
                (if %_4664
                  (%_3215 %_4663 %_4664)
                  (%_3275
                    (lambda (%_4665)
                      ((lambda (%_4666)
                         (begin
                           (if (not %_4666)
                             (syntax-error
                               %_4665
                               '"exported identifier not visible")
                             (void))
                           (%_3212 %_4663 %_4665 %_4666)))
                       (%_3225 %_4665 '(()))))
                    (%_3250 %_4662))))
              (%_3251 %_4662))))
         (%_3289
           (lambda (%_4667 %_4668 %_4669 %_4670 %_4671)
             (letrec ((%_4673
                        (lambda (%_4699 %_4700 %_4701)
                          (%_4671
                            %_4699
                            (%_4672 %_4700)
                            (map (lambda (%_4702) (%_3239 %_4702 %_4670))
                                 %_4701))))
                      (%_4672
                        (lambda (%_4693)
                          (if (null? %_4693)
                            '()
                            (cons ((lambda (%_4694)
                                     ((lambda (%_4695)
                                        (if %_4695
                                          (apply (lambda (%_4697)
                                                   (%_4672 %_4697))
                                                 %_4695)
                                          (if (%_3133 %_4694)
                                            (%_3239 %_4694 %_4670)
                                            (syntax-error
                                              (%_3240 %_4667 %_4668 %_4669)
                                              '"invalid exports list in"))))
                                      ($syntax-dispatch
                                        (compile-in-annotation %_4694 value)
                                        'each-any)))
                                   (car %_4693))
                                  (%_4672 (cdr %_4693)))))))
               ((lambda (%_4675)
                  (if %_4675
                    (apply (lambda (%_4688 %_4689 %_4690)
                             (%_4673 '#f %_4689 %_4690))
                           %_4675)
                    ((lambda (%_4676)
                       (if (if %_4676
                             (apply (lambda (%_4684 %_4685 %_4686 %_4687)
                                      (%_3133 %_4685))
                                    %_4676)
                             '#f)
                         (apply (lambda (%_4678 %_4679 %_4680 %_4681)
                                  (%_4673
                                    (%_3239 %_4679 %_4668)
                                    %_4680
                                    %_4681))
                                %_4676)
                         (syntax-error (%_3240 %_4667 %_4668 %_4669))))
                     ($syntax-dispatch
                       (compile-in-annotation %_4667 value)
                       '(any any each-any . each-any)))))
                ($syntax-dispatch
                  (compile-in-annotation %_4667 value)
                  '(any each-any . each-any))))))
         (%_3290
           (lambda (%_4703 %_4704 %_4705 %_4706)
             ((lambda (%_4708)
                (if (if %_4708
                      (apply (lambda (%_4712 %_4713) (%_3133 %_4713))
                             %_4708)
                      '#f)
                  (apply (lambda (%_4710 %_4711)
                           (%_4706 (%_3239 %_4711 %_4704)))
                         %_4708)
                  (syntax-error (%_3240 %_4703 %_4704 %_4705))))
              ($syntax-dispatch
                (compile-in-annotation %_4703 value)
                '(any any)))))
         (%_3291
           (lambda (%_4714 %_4715 %_4716 %_4717)
             ((lambda (%_4719)
                (if (if %_4719
                      (apply (lambda (%_4741 %_4742 %_4743) (%_3133 %_4742))
                             %_4719)
                      '#f)
                  (apply (lambda (%_4738 %_4739 %_4740)
                           (%_4717 %_4739 %_4740 %_4715))
                         %_4719)
                  ((lambda (%_4720)
                     (if (if %_4720
                           (apply (lambda (%_4733 %_4734 %_4735 %_4736 %_4737)
                                    (if (%_3133 %_4734)
                                      (%_3230 (%_3301 %_4735))
                                      '#f))
                                  %_4720)
                           '#f)
                       (apply (lambda (%_4727 %_4728 %_4729 %_4730 %_4731)
                                (%_4717
                                  (%_3239 %_4728 %_4715)
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
                                        (%_3239
                                          (cons %_4729 (cons %_4730 %_4731))
                                          %_4715))
                                  '(())))
                              %_4720)
                       ((lambda (%_4721)
                          (if (if %_4721
                                (apply (lambda (%_4725 %_4726) (%_3133 %_4726))
                                       %_4721)
                                '#f)
                            (apply (lambda (%_4723 %_4724)
                                     (%_4717
                                       (%_3239 %_4724 %_4715)
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
                                   %_4721)
                            (syntax-error (%_3240 %_4714 %_4715 %_4716))))
                        ($syntax-dispatch
                          (compile-in-annotation %_4714 value)
                          '(any any)))))
                   ($syntax-dispatch
                     (compile-in-annotation %_4714 value)
                     '(any (any . any) any . each-any)))))
              ($syntax-dispatch
                (compile-in-annotation %_4714 value)
                '(any any any)))))
         (%_3292
           (lambda (%_4744 %_4745 %_4746 %_4747)
             ((lambda (%_4749)
                (if (if %_4749
                      (apply (lambda (%_4754 %_4755 %_4756) (%_3133 %_4755))
                             %_4749)
                      '#f)
                  (apply (lambda (%_4751 %_4752 %_4753)
                           (%_4747 %_4752 %_4753 %_4745))
                         %_4749)
                  (syntax-error (%_3240 %_4744 %_4745 %_4746))))
              ($syntax-dispatch
                (compile-in-annotation %_4744 value)
                '(any any any)))))
         (%_3293
           (lambda (%_4757 %_4758 %_4759 %_4760 %_4761)
             ((lambda (%_4763)
                (if %_4763
                  (apply (lambda (%_4776 %_4777 %_4778)
                           (if (not (%_3230 %_4776))
                             (syntax-error
                               %_4757
                               '"invalid parameter list in")
                             ((lambda (%_4781 %_4780)
                                (%_4761
                                  %_4781
                                  (%_3286
                                    (cons %_4777 %_4778)
                                    %_4757
                                    (%_3120 %_4780 %_4781 %_4759)
                                    (%_3217 %_4776 %_4780 %_4760))))
                              (map %_3300 %_4776)
                              (%_3180 %_4776))))
                         %_4763)
                  ((lambda (%_4764)
                     (if %_4764
                       (apply (lambda (%_4766 %_4767 %_4768)
                                ((lambda (%_4769)
                                   (if (not (%_3230 %_4769))
                                     (syntax-error
                                       %_4757
                                       '"invalid parameter list in")
                                     ((lambda (%_4771 %_4770)
                                        (%_4761
                                          ((letrec ((%_4772
                                                      (lambda (%_4773 %_4774)
                                                        (if (null? %_4773)
                                                          %_4774
                                                          (%_4772
                                                            (cdr %_4773)
                                                            (cons (car %_4773)
                                                                  %_4774))))))
                                             %_4772)
                                           (cdr %_4771)
                                           (car %_4771))
                                          (%_3286
                                            (cons %_4767 %_4768)
                                            %_4757
                                            (%_3120 %_4770 %_4771 %_4759)
                                            (%_3217 %_4769 %_4770 %_4760))))
                                      (map %_3300 %_4769)
                                      (%_3180 %_4769))))
                                 (%_3301 %_4766)))
                              %_4764)
                       (syntax-error %_4757)))
                   ($syntax-dispatch
                     (compile-in-annotation %_4758 value)
                     '(any any . each-any)))))
              ($syntax-dispatch
                (compile-in-annotation %_4758 value)
                '(each-any any . each-any)))))
         (%_3294
           (lambda (%_4784 %_4785 %_4786 %_4787 %_4788 %_4789)
             ((lambda (%_4791)
                (if %_4791
                  (apply (lambda (%_4793 %_4794 %_4795 %_4796 %_4797)
                           (if (not (%_3230 %_4794))
                             (%_3237
                               (map (lambda (%_4806) (%_3239 %_4806 %_4787))
                                    %_4794)
                               (%_3240 %_4785 %_4787 %_4788)
                               '"keyword")
                             ((lambda (%_4799)
                                ((lambda (%_4800)
                                   (%_4789
                                     (cons %_4796 %_4797)
                                     (%_3119
                                       %_4799
                                       ((lambda (%_4803 %_4802)
                                          (map (lambda (%_4804)
                                                 (%_3103
                                                   'deferred
                                                   (%_3281
                                                     %_4804
                                                     %_4803
                                                     %_4802)))
                                               %_4795))
                                        (%_3121 %_4786)
                                        (if %_4784 %_4800 %_4787))
                                       %_4786)
                                     %_4800
                                     %_4788))
                                 (%_3217 %_4794 %_4799 %_4787)))
                              (%_3180 %_4794))))
                         %_4791)
                  (syntax-error (%_3240 %_4785 %_4787 %_4788))))
              ($syntax-dispatch
                (compile-in-annotation %_4785 value)
                '(any #2(each (any any)) any . each-any)))))
         (%_3295 (lambda () (list 'void)))
         (%_3296
           (lambda (%_4808)
             (if (%_3127 %_4808)
               (%_3228
                 %_4808
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
         (%_3297
           (lambda (%_4809 %_4810)
             (if (pair? %_4809)
               ((lambda (%_4815)
                  (begin
                    (if %_4810
                      (set-annotation-stripped! %_4810 %_4815)
                      (void))
                    (set-car! %_4815 (%_3297 (car %_4809) '#f))
                    (set-cdr! %_4815 (%_3297 (cdr %_4809) '#f))
                    %_4815))
                (cons '#f '#f))
               (if (annotation? %_4809)
                 ((lambda (%_4814)
                    (if %_4814
                      %_4814
                      (%_3297 (annotation-expression %_4809) %_4809)))
                  (annotation-stripped %_4809))
                 (if (vector? %_4809)
                   ((lambda (%_4811)
                      (begin
                        (if %_4810
                          (set-annotation-stripped! %_4810 %_4811)
                          (void))
                        ((letrec ((%_4812
                                    (lambda (%_4813)
                                      (if (not (< %_4813 '0))
                                        (begin
                                          (vector-set!
                                            %_4811
                                            %_4813
                                            (%_3297
                                              (vector-ref %_4809 %_4813)
                                              '#f))
                                          (%_4812 (- %_4813 '1)))
                                        (void)))))
                           %_4812)
                         (- (vector-length %_4809) '1))
                        %_4811))
                    (make-vector (vector-length %_4809)))
                   %_4809)))))
         (%_3298
           (lambda (%_4816 %_4817 %_4818)
             (if (memq 'top (car %_4817))
               (%_4818 %_4816)
               ((letrec ((%_4819
                           (lambda (%_4820)
                             (if (%_3076 %_4820)
                               (%_3298 (%_3077 %_4820) (%_3078 %_4820) %_4818)
                               (if (pair? %_4820)
                                 ((lambda (%_4823 %_4824)
                                    (if (if (eq? %_4823 (car %_4820))
                                          (eq? %_4824 (cdr %_4820))
                                          '#f)
                                      %_4820
                                      (cons %_4823 %_4824)))
                                  (%_4819 (car %_4820))
                                  (%_4819 (cdr %_4820)))
                                 (if (vector? %_4820)
                                   ((lambda (%_4821)
                                      ((lambda (%_4822)
                                         (if (andmap eq? %_4821 %_4822)
                                           %_4820
                                           (list->vector %_4822)))
                                       (map %_4819 %_4821)))
                                    (vector->list %_4820))
                                   %_4820))))))
                  %_4819)
                %_4816))))
         (%_3299
           (lambda (%_4825 %_4826)
             (%_3298
               %_4825
               %_4826
               (lambda (%_4827)
                 (if ((lambda (%_4828)
                        (if %_4828
                          %_4828
                          (if (pair? %_4827)
                            (annotation? (car %_4827))
                            '#f)))
                      (annotation? %_4827))
                   (%_3297 %_4827 '#f)
                   %_4827)))))
         (%_3300
           (lambda (%_4829)
             ((lambda (%_4830)
                (if (annotation? %_4830)
                  (if (annotation-source %_4830)
                    (list 'compile-in-annotation
                          (gensym)
                          (annotation-source %_4830))
                    (gensym))
                  (gensym)))
              (if (%_3076 %_4829) (%_3077 %_4829) %_4829))))
         (%_3301
           (lambda (%_4831)
             ((letrec ((%_4832
                         (lambda (%_4833 %_4834 %_4835)
                           (if (pair? %_4833)
                             (%_4832
                               (cdr %_4833)
                               (cons (%_3239 (car %_4833) %_4835) %_4834)
                               %_4835)
                             (if (%_3133 %_4833)
                               (cons (%_3239 %_4833 %_4835) %_4834)
                               (if (null? %_4833)
                                 %_4834
                                 (if (%_3076 %_4833)
                                   (%_4832
                                     (%_3077 %_4833)
                                     %_4834
                                     (%_3220 %_4835 (%_3078 %_4833)))
                                   (if (annotation? %_4833)
                                     (%_4832
                                       (annotation-expression %_4833)
                                       %_4834
                                       %_4835)
                                     (cons %_4833 %_4834)))))))))
                %_4832)
              %_4831
              '()
              '(())))))
  (begin
    (set! $sc-put-cte
      (lambda (%_3302 %_3303)
        (letrec ((%_3306
                   (lambda (%_3331 %_3332)
                     (begin
                       (%_3304 %_3331 '*top*)
                       ((lambda (%_3333)
                          (putprop %_3333 '*sc-expander* %_3332))
                        (if (symbol? %_3331)
                          %_3331
                          (%_3226 %_3331 '(())))))))
                 (%_3305
                   (lambda (%_3328 %_3329)
                     (%_3275
                       (lambda (%_3330) (%_3304 %_3330 %_3329))
                       %_3328)))
                 (%_3304
                   (lambda (%_3315 %_3316)
                     (letrec ((%_3317
                                (lambda (%_3323 %_3324)
                                  (if (not %_3324)
                                    %_3323
                                    (cons %_3323 %_3324))))
                              (%_3318
                                (lambda (%_3325 %_3326)
                                  (if (pair? %_3326)
                                    (if (%_3229 (car %_3326) %_3325)
                                      (%_3318 %_3325 (cdr %_3326))
                                      (%_3317
                                        (car %_3326)
                                        (%_3318 %_3325 (cdr %_3326))))
                                    (if ((lambda (%_3327)
                                           (if %_3327
                                             %_3327
                                             (%_3229 %_3326 %_3325)))
                                         (not %_3326))
                                      '#f
                                      %_3326)))))
                       ((lambda (%_3319)
                          ((lambda (%_3320)
                             (if (if (not %_3320) (symbol? %_3315) '#f)
                               (remprop %_3319 %_3316)
                               (putprop %_3319 %_3316 (%_3317 %_3315 %_3320))))
                           (%_3318 %_3315 (getprop %_3319 %_3316))))
                        ((lambda (%_3322)
                           (if (annotation? %_3322)
                             (annotation-expression %_3322)
                             %_3322))
                         (if (%_3076 %_3315) (%_3077 %_3315) %_3315)))))))
          ((lambda (%_3307)
             ((lambda (%_3308)
                (if (memv %_3308 '(module))
                  (begin
                    ((lambda (%_3313)
                       (%_3305 (%_3250 %_3313) (%_3251 %_3313)))
                     (cdr %_3307))
                    (%_3306 %_3302 %_3307))
                  (if (memv %_3308 '(do-import))
                    ((lambda (%_3309)
                       ((lambda (%_3310)
                          ((lambda (%_3311)
                             (if (memv %_3311 '(module))
                               ((lambda (%_3312)
                                  (begin
                                    (if (not (eq? (%_3251 %_3312) %_3309))
                                      (syntax-error
                                        %_3302
                                        '"import mismatch for module")
                                      (void))
                                    (%_3305 (%_3250 %_3312) '*top*)))
                                (cdr %_3310))
                               (syntax-error
                                 %_3302
                                 '"import from unknown module")))
                           (car %_3310)))
                        (%_3125 (%_3226 %_3302 '(())) '())))
                     (cdr %_3303))
                    (%_3306 %_3302 %_3307))))
              (car %_3307)))
           ((lambda (%_3314)
              (if %_3314
                %_3314
                (error 'define-syntax
                       '"invalid transformer ~s"
                       %_3303)))
            (%_3124 %_3303))))))
    (%_3126 'local-syntax 'letrec-syntax '#t)
    (%_3126 'local-syntax 'let-syntax '#f)
    (%_3126
      'core
      'fluid-let-syntax
      (lambda (%_3334 %_3335 %_3336 %_3337)
        ((lambda (%_3339)
           (if (if %_3339
                 (apply (lambda (%_3357 %_3358 %_3359 %_3360 %_3361)
                          (%_3230 %_3358))
                        %_3339)
                 '#f)
             (apply (lambda (%_3341 %_3342 %_3343 %_3344 %_3345)
                      ((lambda (%_3346)
                         (begin
                           (for-each
                             (lambda (%_3347 %_3348)
                               ((lambda (%_3349)
                                  (if (memv %_3349 '(displaced-lexical))
                                    (%_3122 (%_3239 %_3347 %_3336))
                                    (void)))
                                (car (%_3125 %_3348 %_3335))))
                             %_3342
                             %_3346)
                           (%_3286
                             (cons %_3344 %_3345)
                             (%_3240 %_3334 %_3336 %_3337)
                             (%_3119
                               %_3346
                               ((lambda (%_3352)
                                  (map (lambda (%_3353)
                                         (%_3103
                                           'deferred
                                           (%_3281 %_3353 %_3352 %_3336)))
                                       %_3343))
                                (%_3121 %_3335))
                               %_3335)
                             %_3336)))
                       (map (lambda (%_3355) (%_3226 %_3355 %_3336))
                            %_3342)))
                    %_3339)
             (syntax-error (%_3240 %_3334 %_3336 %_3337))))
         ($syntax-dispatch
           (compile-in-annotation %_3334 value)
           '(any #2(each (any any)) any . each-any)))))
    (%_3126
      'core
      'quote
      (lambda (%_3363 %_3364 %_3365 %_3366)
        ((lambda (%_3368)
           (if %_3368
             (apply (lambda (%_3370 %_3371)
                      (if %_3366
                        (list 'compile-in-annotation
                              (list 'quote (%_3299 %_3371 %_3365))
                              %_3366)
                        (list 'quote (%_3299 %_3371 %_3365))))
                    %_3368)
             (syntax-error (%_3240 %_3363 %_3365 %_3366))))
         ($syntax-dispatch
           (compile-in-annotation %_3363 value)
           '(any any)))))
    (%_3126
      'core
      'syntax
      (letrec ((%_3379
                 (lambda (%_3482)
                   ((lambda (%_3483)
                      (if (memv %_3483 '(ref))
                        (cadr %_3482)
                        (if (memv %_3483 '(primitive))
                          (cadr %_3482)
                          (if (memv %_3483 '(quote))
                            (list 'quote (cadr %_3482))
                            (if (memv %_3483 '(lambda))
                              (list 'lambda
                                    (cadr %_3482)
                                    (%_3379 (caddr %_3482)))
                              (if (memv %_3483 '(map))
                                ((lambda (%_3484)
                                   (cons (if (= (length %_3484) '2) 'map 'map)
                                         %_3484))
                                 (map %_3379 (cdr %_3482)))
                                (cons (car %_3482)
                                      (map %_3379 (cdr %_3482)))))))))
                    (car %_3482))))
               (%_3378
                 (lambda (%_3479 %_3480 %_3481)
                   (if (eq? (car %_3481) 'quote)
                     (if (eq? (cadr %_3481) %_3480)
                       (list 'quote %_3479)
                       (list 'quote (list->vector (cadr %_3481))))
                     (if (eq? (car %_3481) 'list)
                       (cons 'vector (cdr %_3481))
                       (list 'list->vector %_3481)))))
               (%_3377
                 (lambda (%_3471 %_3472 %_3473 %_3474 %_3475)
                   ((lambda (%_3476)
                      (if (memv %_3476 '(quote))
                        (if (eq? (car %_3474) 'quote)
                          ((lambda (%_3477 %_3478)
                             (if (if (eq? %_3477 %_3472)
                                   (eq? %_3478 %_3473)
                                   '#f)
                               (list 'quote %_3471)
                               (list 'quote (cons %_3477 %_3478))))
                           (cadr %_3474)
                           (cadr %_3475))
                          (if (eq? (cadr %_3475) '())
                            (list 'list %_3474)
                            (list 'cons %_3474 %_3475)))
                        (if (memv %_3476 '(list))
                          (cons 'list (cons %_3474 (cdr %_3475)))
                          (list 'cons %_3474 %_3475))))
                    (car %_3475))))
               (%_3376
                 (lambda (%_3463 %_3464)
                   ((lambda (%_3465 %_3466)
                      (if (eq? (car %_3463) 'ref)
                        (car %_3466)
                        (if (andmap
                              (lambda (%_3469)
                                (if (eq? (car %_3469) 'ref)
                                  (memq (cadr %_3469) %_3465)
                                  '#f))
                              (cdr %_3463))
                          (cons 'map
                                (cons (list 'primitive (car %_3463))
                                      (map ((lambda (%_3467)
                                              (lambda (%_3468)
                                                (cdr (assq (cadr %_3468)
                                                           %_3467))))
                                            (map cons %_3465 %_3466))
                                           (cdr %_3463))))
                          (cons 'map
                                (cons (list 'lambda %_3465 %_3463) %_3466)))))
                    (map cdr %_3464)
                    (map (lambda (%_3470) (list 'ref (car %_3470)))
                         %_3464))))
               (%_3375
                 (lambda (%_3461 %_3462)
                   (list 'apply
                         '(primitive append)
                         (%_3376 %_3461 %_3462))))
               (%_3374
                 (lambda (%_3459 %_3460)
                   (if (equal? %_3460 ''())
                     %_3459
                     (list 'append %_3459 %_3460))))
               (%_3373
                 (lambda (%_3451 %_3452 %_3453 %_3454)
                   (if (= %_3453 '0)
                     (values %_3452 %_3454)
                     (if (null? %_3454)
                       (syntax-error
                         %_3451
                         '"missing ellipsis in syntax form")
                       (call-with-values
                         (lambda ()
                           (%_3373 %_3451 %_3452 (- %_3453 '1) (cdr %_3454)))
                         (lambda (%_3455 %_3456)
                           ((lambda (%_3457)
                              (if %_3457
                                (values (cdr %_3457) %_3454)
                                ((lambda (%_3458)
                                   (values
                                     %_3458
                                     (cons (cons (cons %_3455 %_3458)
                                                 (car %_3454))
                                           %_3456)))
                                 (%_3300 'tmp))))
                            (assq %_3455 (car %_3454)))))))))
               (%_3372
                 (lambda (%_3392 %_3393 %_3394 %_3395 %_3396)
                   (if (%_3133 %_3393)
                     ((lambda (%_3446)
                        ((lambda (%_3447)
                           (if (eq? (car %_3447) 'syntax)
                             (call-with-values
                               (lambda ()
                                 ((lambda (%_3448)
                                    (%_3373
                                      %_3392
                                      (car %_3448)
                                      (cdr %_3448)
                                      %_3395))
                                  (cdr %_3447)))
                               (lambda (%_3449 %_3450)
                                 (values (list 'ref %_3449) %_3450)))
                             (if (%_3396 %_3393)
                               (syntax-error
                                 %_3392
                                 '"misplaced ellipsis in syntax form")
                               (values (list 'quote %_3393) %_3395))))
                         (%_3125 %_3446 %_3394)))
                      (%_3226 %_3393 '(())))
                     ((lambda (%_3398)
                        (if (if %_3398
                              (apply (lambda (%_3444 %_3445) (%_3396 %_3444))
                                     %_3398)
                              '#f)
                          (apply (lambda (%_3441 %_3442)
                                   (%_3372
                                     %_3392
                                     %_3442
                                     %_3394
                                     %_3395
                                     (lambda (%_3443) '#f)))
                                 %_3398)
                          ((lambda (%_3399)
                             (if (if %_3399
                                   (apply (lambda (%_3438 %_3439 %_3440)
                                            (%_3396 %_3439))
                                          %_3399)
                                   '#f)
                               (apply (lambda (%_3415 %_3416 %_3417)
                                        ((letrec ((%_3418
                                                    (lambda (%_3419 %_3420)
                                                      ((lambda (%_3422)
                                                         (if (if %_3422
                                                               (apply (lambda (%_3433
                                                                               %_3434)
                                                                        (%_3396
                                                                          %_3433))
                                                                      %_3422)
                                                               '#f)
                                                           (apply (lambda (%_3428
                                                                           %_3429)
                                                                    (%_3418
                                                                      %_3429
                                                                      (lambda (%_3430)
                                                                        (call-with-values
                                                                          (lambda ()
                                                                            (%_3420
                                                                              (cons '()
                                                                                    %_3430)))
                                                                          (lambda (%_3431
                                                                                   %_3432)
                                                                            (if (null? (car %_3432))
                                                                              (syntax-error
                                                                                %_3392
                                                                                '"extra ellipsis in syntax form")
                                                                              (values
                                                                                (%_3375
                                                                                  %_3431
                                                                                  (car %_3432))
                                                                                (cdr %_3432))))))))
                                                                  %_3422)
                                                           (call-with-values
                                                             (lambda ()
                                                               (%_3372
                                                                 %_3392
                                                                 %_3419
                                                                 %_3394
                                                                 %_3395
                                                                 %_3396))
                                                             (lambda (%_3424
                                                                      %_3425)
                                                               (call-with-values
                                                                 (lambda ()
                                                                   (%_3420
                                                                     %_3425))
                                                                 (lambda (%_3426
                                                                          %_3427)
                                                                   (values
                                                                     (%_3374
                                                                       %_3426
                                                                       %_3424)
                                                                     %_3427)))))))
                                                       ($syntax-dispatch
                                                         (compile-in-annotation
                                                           %_3419
                                                           value)
                                                         '(any . any))))))
                                           %_3418)
                                         %_3417
                                         (lambda (%_3435)
                                           (call-with-values
                                             (lambda ()
                                               (%_3372
                                                 %_3392
                                                 %_3415
                                                 %_3394
                                                 (cons '() %_3435)
                                                 %_3396))
                                             (lambda (%_3436 %_3437)
                                               (if (null? (car %_3437))
                                                 (syntax-error
                                                   %_3392
                                                   '"extra ellipsis in syntax form")
                                                 (values
                                                   (%_3376 %_3436 (car %_3437))
                                                   (cdr %_3437))))))))
                                      %_3399)
                               ((lambda (%_3400)
                                  (if %_3400
                                    (apply (lambda (%_3409 %_3410)
                                             (call-with-values
                                               (lambda ()
                                                 (%_3372
                                                   %_3392
                                                   %_3409
                                                   %_3394
                                                   %_3395
                                                   %_3396))
                                               (lambda (%_3411 %_3412)
                                                 (call-with-values
                                                   (lambda ()
                                                     (%_3372
                                                       %_3392
                                                       %_3410
                                                       %_3394
                                                       %_3412
                                                       %_3396))
                                                   (lambda (%_3413 %_3414)
                                                     (values
                                                       (%_3377
                                                         %_3393
                                                         %_3409
                                                         %_3410
                                                         %_3411
                                                         %_3413)
                                                       %_3414))))))
                                           %_3400)
                                    ((lambda (%_3401)
                                       (if %_3401
                                         (apply (lambda (%_3403 %_3404)
                                                  ((lambda (%_3405)
                                                     (call-with-values
                                                       (lambda ()
                                                         (%_3372
                                                           %_3392
                                                           %_3405
                                                           %_3394
                                                           %_3395
                                                           %_3396))
                                                       (lambda (%_3406 %_3407)
                                                         (values
                                                           (%_3378
                                                             %_3393
                                                             %_3405
                                                             %_3406)
                                                           %_3407))))
                                                   (cons %_3403 %_3404)))
                                                %_3401)
                                         (values (list 'quote %_3393) %_3395)))
                                     ($syntax-dispatch
                                       (compile-in-annotation %_3393 value)
                                       '#2(vector (any . each-any))))))
                                ($syntax-dispatch
                                  (compile-in-annotation %_3393 value)
                                  '(any . any)))))
                           ($syntax-dispatch
                             (compile-in-annotation %_3393 value)
                             '(any any . any)))))
                      ($syntax-dispatch
                        (compile-in-annotation %_3393 value)
                        '(any any)))))))
        (lambda (%_3380 %_3381 %_3382 %_3383)
          ((lambda (%_3384)
             ((lambda (%_3386)
                (if %_3386
                  (apply (lambda (%_3388 %_3389)
                           (call-with-values
                             (lambda ()
                               (%_3372 %_3384 %_3389 %_3381 '() %_3296))
                             (lambda (%_3390 %_3391) (%_3379 %_3390))))
                         %_3386)
                  (syntax-error %_3384)))
              ($syntax-dispatch
                (compile-in-annotation %_3384 value)
                '(any any))))
           (%_3240 %_3380 %_3382 %_3383)))))
    (%_3126
      'core
      'lambda
      (lambda (%_3485 %_3486 %_3487 %_3488)
        ((lambda (%_3490)
           (if %_3490
             (apply (lambda (%_3491 %_3492)
                      (%_3293
                        (%_3240 %_3485 %_3487 %_3488)
                        %_3492
                        %_3486
                        %_3487
                        (lambda (%_3493 %_3494)
                          (if %_3488
                            (list 'compile-in-annotation
                                  (list 'lambda %_3493 %_3494)
                                  %_3488)
                            (list 'lambda %_3493 %_3494)))))
                    %_3490)
             (syntax-error %_3485)))
         ($syntax-dispatch
           (compile-in-annotation %_3485 value)
           '(any . any)))))
    (%_3126
      'core
      'letrec
      (lambda (%_3495 %_3496 %_3497 %_3498)
        ((lambda (%_3500)
           (if %_3500
             (apply (lambda (%_3502 %_3503 %_3504 %_3505 %_3506)
                      (if (not (%_3230 %_3503))
                        (%_3237
                          (map (lambda (%_3515) (%_3239 %_3515 %_3497))
                               %_3503)
                          (%_3240 %_3495 %_3497 %_3498)
                          '"bound variable")
                        ((lambda (%_3509 %_3508)
                           ((lambda (%_3511 %_3510)
                              (%_3062
                                %_3498
                                %_3509
                                (map (lambda (%_3512)
                                       (%_3281 %_3512 %_3511 %_3510))
                                     %_3504)
                                (%_3286
                                  (cons %_3505 %_3506)
                                  (%_3240 %_3495 %_3510 %_3498)
                                  %_3511
                                  %_3510)))
                            (%_3120 %_3508 %_3509 %_3496)
                            (%_3217 %_3503 %_3508 %_3497)))
                         (map %_3300 %_3503)
                         (%_3180 %_3503))))
                    %_3500)
             (syntax-error (%_3240 %_3495 %_3497 %_3498))))
         ($syntax-dispatch
           (compile-in-annotation %_3495 value)
           '(any #2(each (any any)) any . each-any)))))
    (%_3126
      'core
      'if
      (lambda (%_3517 %_3518 %_3519 %_3520)
        ((lambda (%_3522)
           (if %_3522
             (apply (lambda (%_3529 %_3530 %_3531)
                      (if %_3520
                        (list 'compile-in-annotation
                              (list 'if
                                    (%_3281 %_3530 %_3518 %_3519)
                                    (%_3281 %_3531 %_3518 %_3519)
                                    (%_3295))
                              %_3520)
                        (list 'if
                              (%_3281 %_3530 %_3518 %_3519)
                              (%_3281 %_3531 %_3518 %_3519)
                              (%_3295))))
                    %_3522)
             ((lambda (%_3523)
                (if %_3523
                  (apply (lambda (%_3525 %_3526 %_3527 %_3528)
                           (if %_3520
                             (list 'compile-in-annotation
                                   (list 'if
                                         (%_3281 %_3526 %_3518 %_3519)
                                         (%_3281 %_3527 %_3518 %_3519)
                                         (%_3281 %_3528 %_3518 %_3519))
                                   %_3520)
                             (list 'if
                                   (%_3281 %_3526 %_3518 %_3519)
                                   (%_3281 %_3527 %_3518 %_3519)
                                   (%_3281 %_3528 %_3518 %_3519))))
                         %_3523)
                  (syntax-error (%_3240 %_3517 %_3519 %_3520))))
              ($syntax-dispatch
                (compile-in-annotation %_3517 value)
                '(any any any any)))))
         ($syntax-dispatch
           (compile-in-annotation %_3517 value)
           '(any any any)))))
    (%_3126 'set! 'set! '())
    (%_3126 'begin 'begin '())
    (%_3126 'module-key 'module '())
    (%_3126 'import 'import '#f)
    (%_3126 'import 'import-only '#t)
    (%_3126 'define 'define '())
    (%_3126 'define-syntax 'define-syntax '())
    (%_3126 'eval-when 'eval-when '())
    (%_3126
      'core
      'syntax-case
      (letrec ((%_3535
                 (lambda (%_3697 %_3698 %_3699 %_3700)
                   (if (null? %_3699)
                     (list 'syntax-error %_3697)
                     ((lambda (%_3701)
                        ((lambda (%_3702)
                           (if %_3702
                             (apply (lambda (%_3708 %_3709)
                                      (if (if (%_3133 %_3708)
                                            (if (not (%_3238 %_3708 %_3698))
                                              (not (%_3296 %_3708))
                                              '#f)
                                            '#f)
                                        ((lambda (%_3710 %_3711)
                                           (list (list 'lambda
                                                       (list %_3711)
                                                       (%_3281
                                                         %_3709
                                                         (%_3118
                                                           %_3710
                                                           (%_3103
                                                             'syntax
                                                             (cons %_3711 '0))
                                                           %_3700)
                                                         (%_3217
                                                           (list %_3708)
                                                           (list %_3710)
                                                           '(()))))
                                                 %_3697))
                                         (%_3178)
                                         (%_3300 %_3708))
                                        (%_3534
                                          %_3697
                                          %_3698
                                          (cdr %_3699)
                                          %_3700
                                          %_3708
                                          '#t
                                          %_3709)))
                                    %_3702)
                             ((lambda (%_3703)
                                (if %_3703
                                  (apply (lambda (%_3705 %_3706 %_3707)
                                           (%_3534
                                             %_3697
                                             %_3698
                                             (cdr %_3699)
                                             %_3700
                                             %_3705
                                             %_3706
                                             %_3707))
                                         %_3703)
                                  (syntax-error
                                    (car %_3699)
                                    '"invalid syntax-case clause")))
                              ($syntax-dispatch
                                (compile-in-annotation %_3701 value)
                                '(any any any)))))
                         ($syntax-dispatch
                           (compile-in-annotation %_3701 value)
                           '(any any))))
                      (car %_3699)))))
               (%_3534
                 (lambda (%_3626
                          %_3627
                          %_3628
                          %_3629
                          %_3630
                          %_3631
                          %_3632)
                   (call-with-values
                     (lambda () (%_3532 %_3630 %_3627))
                     (lambda (%_3633 %_3634)
                       (if (not (%_3236 (map car %_3634)))
                         (%_3237
                           (map car %_3634)
                           %_3630
                           '"pattern variable")
                         (if (not (andmap
                                    (lambda (%_3696)
                                      (not (%_3296 (car %_3696))))
                                    %_3634))
                           (syntax-error
                             %_3630
                             '"misplaced ellipsis in syntax-case pattern")
                           ((lambda (%_3635)
                              (list (list 'lambda
                                          (list %_3635)
                                          (list 'if
                                                ((lambda (%_3646)
                                                   (if %_3646
                                                     (apply (lambda () %_3635)
                                                            %_3646)
                                                     (list 'if
                                                           %_3635
                                                           (%_3533
                                                             %_3634
                                                             %_3631
                                                             %_3635
                                                             %_3629)
                                                           (list 'quote '#f))))
                                                 ($syntax-dispatch
                                                   (compile-in-annotation
                                                     %_3631
                                                     value)
                                                   '#2(atom #t)))
                                                (%_3533
                                                  %_3634
                                                  %_3632
                                                  %_3635
                                                  %_3629)
                                                (%_3535
                                                  %_3626
                                                  %_3627
                                                  %_3628
                                                  %_3629)))
                                    (if (eq? %_3633 'any)
                                      (list 'list
                                            (cons 'compile-in-annotation
                                                  (cons %_3626 '(value))))
                                      (list '$syntax-dispatch
                                            (cons 'compile-in-annotation
                                                  (cons %_3626 '(value)))
                                            (list 'quote %_3633)))))
                            (%_3300 'tmp))))))))
               (%_3533
                 (lambda (%_3610 %_3611 %_3612 %_3613)
                   ((lambda (%_3614 %_3615)
                      ((lambda (%_3616 %_3617)
                         (list 'apply
                               (list 'lambda
                                     %_3617
                                     (%_3281
                                       %_3611
                                       (%_3119
                                         %_3616
                                         (map (lambda (%_3618 %_3619)
                                                (%_3103
                                                  'syntax
                                                  (cons %_3618 %_3619)))
                                              %_3617
                                              (map cdr %_3610))
                                         %_3613)
                                       (%_3217 %_3614 %_3616 '(()))))
                               %_3612))
                       (%_3180 %_3614)
                       (map %_3300 %_3614)))
                    (map car %_3610)
                    (map cdr %_3610))))
               (%_3532
                 (lambda (%_3558 %_3559)
                   (letrec ((%_3560
                              (lambda (%_3562 %_3563 %_3564)
                                (if (null? %_3562)
                                  (values '() %_3564)
                                  (call-with-values
                                    (lambda ()
                                      (%_3560 (cdr %_3562) %_3563 %_3564))
                                    (lambda (%_3565 %_3566)
                                      (call-with-values
                                        (lambda ()
                                          (%_3561 (car %_3562) %_3563 %_3566))
                                        (lambda (%_3567 %_3568)
                                          (values
                                            (cons %_3567 %_3565)
                                            %_3568))))))))
                            (%_3561
                              (lambda (%_3569 %_3570 %_3571)
                                (if (%_3133 %_3569)
                                  (if (%_3238 %_3569 %_3559)
                                    (values (vector 'free-id %_3569) %_3571)
                                    (values
                                      'any
                                      (cons (cons %_3569 %_3570) %_3571)))
                                  ((lambda (%_3573)
                                     (if (if %_3573
                                           (apply (lambda (%_3608 %_3609)
                                                    (%_3296 %_3609))
                                                  %_3573)
                                           '#f)
                                       (apply (lambda (%_3604 %_3605)
                                                (call-with-values
                                                  (lambda ()
                                                    (%_3561
                                                      %_3604
                                                      (+ %_3570 '1)
                                                      %_3571))
                                                  (lambda (%_3606 %_3607)
                                                    (values
                                                      (if (eq? %_3606 'any)
                                                        'each-any
                                                        (vector 'each %_3606))
                                                      %_3607))))
                                              %_3573)
                                       ((lambda (%_3574)
                                          (if (if %_3574
                                                (apply (lambda (%_3600
                                                                %_3601
                                                                %_3602
                                                                %_3603)
                                                         (%_3296 %_3601))
                                                       %_3574)
                                                '#f)
                                            (apply (lambda (%_3589
                                                            %_3590
                                                            %_3591
                                                            %_3592)
                                                     (call-with-values
                                                       (lambda ()
                                                         (%_3561
                                                           %_3592
                                                           %_3570
                                                           %_3571))
                                                       (lambda (%_3593 %_3594)
                                                         (call-with-values
                                                           (lambda ()
                                                             (%_3560
                                                               %_3591
                                                               %_3570
                                                               %_3594))
                                                           (lambda (%_3596
                                                                    %_3597)
                                                             (call-with-values
                                                               (lambda ()
                                                                 (%_3561
                                                                   %_3589
                                                                   (+ %_3570
                                                                      '1)
                                                                   %_3597))
                                                               (lambda (%_3598
                                                                        %_3599)
                                                                 (values
                                                                   (vector
                                                                     'each+
                                                                     %_3598
                                                                     (reverse
                                                                       %_3596)
                                                                     %_3593)
                                                                   %_3599))))))))
                                                   %_3574)
                                            ((lambda (%_3575)
                                               (if %_3575
                                                 (apply (lambda (%_3583 %_3584)
                                                          (call-with-values
                                                            (lambda ()
                                                              (%_3561
                                                                %_3584
                                                                %_3570
                                                                %_3571))
                                                            (lambda (%_3585
                                                                     %_3586)
                                                              (call-with-values
                                                                (lambda ()
                                                                  (%_3561
                                                                    %_3583
                                                                    %_3570
                                                                    %_3586))
                                                                (lambda (%_3587
                                                                         %_3588)
                                                                  (values
                                                                    (cons %_3587
                                                                          %_3585)
                                                                    %_3588))))))
                                                        %_3575)
                                                 ((lambda (%_3576)
                                                    (if %_3576
                                                      (apply (lambda ()
                                                               (values
                                                                 '()
                                                                 %_3571))
                                                             %_3576)
                                                      ((lambda (%_3577)
                                                         (if %_3577
                                                           (apply (lambda (%_3579)
                                                                    (call-with-values
                                                                      (lambda ()
                                                                        (%_3561
                                                                          %_3579
                                                                          %_3570
                                                                          %_3571))
                                                                      (lambda (%_3581
                                                                               %_3582)
                                                                        (values
                                                                          (vector
                                                                            'vector
                                                                            %_3581)
                                                                          %_3582))))
                                                                  %_3577)
                                                           (values
                                                             (vector
                                                               'atom
                                                               (%_3299
                                                                 %_3569
                                                                 '(())))
                                                             %_3571)))
                                                       ($syntax-dispatch
                                                         (compile-in-annotation
                                                           %_3569
                                                           value)
                                                         '#2(vector
                                                             each-any)))))
                                                  ($syntax-dispatch
                                                    (compile-in-annotation
                                                      %_3569
                                                      value)
                                                    '()))))
                                             ($syntax-dispatch
                                               (compile-in-annotation
                                                 %_3569
                                                 value)
                                               '(any . any)))))
                                        ($syntax-dispatch
                                          (compile-in-annotation %_3569 value)
                                          '(any any . #4(each+ any () any))))))
                                   ($syntax-dispatch
                                     (compile-in-annotation %_3569 value)
                                     '(any any)))))))
                     (%_3561 %_3558 '0 '())))))
        (lambda (%_3536 %_3537 %_3538 %_3539)
          ((lambda (%_3540)
             ((lambda (%_3542)
                (if %_3542
                  (apply (lambda (%_3543 %_3544 %_3545 %_3546)
                           (if (andmap
                                 (lambda (%_3556)
                                   (if (%_3133 %_3556)
                                     (not (%_3296 %_3556))
                                     '#f))
                                 %_3545)
                             ((lambda (%_3547)
                                (if %_3539
                                  (list 'compile-in-annotation
                                        (list (list 'lambda
                                                    (list %_3547)
                                                    (%_3535
                                                      %_3547
                                                      %_3545
                                                      %_3546
                                                      %_3537))
                                              (%_3281 %_3544 %_3537 '(())))
                                        %_3539)
                                  (list (list 'lambda
                                              (list %_3547)
                                              (%_3535
                                                %_3547
                                                %_3545
                                                %_3546
                                                %_3537))
                                        (%_3281 %_3544 %_3537 '(())))))
                              (%_3300 'tmp))
                             (syntax-error
                               %_3540
                               '"invalid literals list in")))
                         %_3542)
                  (syntax-error %_3540)))
              ($syntax-dispatch
                (compile-in-annotation %_3540 value)
                '(any any each-any . each-any))))
           (%_3240 %_3536 %_3538 %_3539)))))
    (set! sc-expand
      ((lambda (%_3714)
         ((lambda (%_3715)
            (lambda (%_3717 . %_3716)
              (if (if (pair? %_3717)
                    (equal? (car %_3717) '"noexpand")
                    '#f)
                (cadr %_3717)
                (if (null? %_3716)
                  (%_3246 %_3717 '() %_3715 '(l c) '(l) %_3714)
                  (%_3246
                    %_3717
                    '()
                    %_3715
                    (car %_3716)
                    (cadr %_3716)
                    %_3714)))))
          (cons (car '((top)))
                (cons %_3714 (cdr '((top)))))))
       ((lambda (%_3718)
          (begin (%_3215 %_3718 '*top*) %_3718))
        (%_3181 '() '() '()))))
    (set! identifier?
      (lambda (%_3719) (%_3127 %_3719)))
    (set! datum->syntax-object
      (lambda (%_3720 %_3721)
        (begin
          (if (not (%_3127 %_3720))
            (%_2954
              'datum->syntax-object
              '"invalid argument"
              %_3720)
            (void))
          (%_3075 %_3721 (%_3078 %_3720)))))
    (set! syntax-object->datum
      (lambda (%_3723) (%_3299 %_3723 '(()))))
    (set! generate-temporaries
      (lambda (%_3724)
        (begin
          (if (not (list? %_3724))
            (%_2954
              'generate-temporaries
              '"invalid argument"
              %_3724)
            (void))
          (map (lambda (%_3726) (%_3239 (gensym) '((top))))
               %_3724))))
    (set! free-identifier=?
      (lambda (%_3727 %_3728)
        (begin
          (if (not (%_3127 %_3727))
            (%_2954
              'free-identifier=?
              '"invalid argument"
              %_3727)
            (void))
          (if (not (%_3127 %_3728))
            (%_2954
              'free-identifier=?
              '"invalid argument"
              %_3728)
            (void))
          (%_3227 %_3727 %_3728))))
    (set! bound-identifier=?
      (lambda (%_3731 %_3732)
        (begin
          (if (not (%_3127 %_3731))
            (%_2954
              'bound-identifier=?
              '"invalid argument"
              %_3731)
            (void))
          (if (not (%_3127 %_3732))
            (%_2954
              'bound-identifier=?
              '"invalid argument"
              %_3732)
            (void))
          (%_3229 %_3731 %_3732))))
    (set! literal-identifier=?
      (lambda (%_3735 %_3736)
        (begin
          (if (not (%_3127 %_3735))
            (%_2954
              'literal-identifier=?
              '"invalid argument"
              %_3735)
            (void))
          (if (not (%_3127 %_3736))
            (%_2954
              'literal-identifier=?
              '"invalid argument"
              %_3736)
            (void))
          (%_3228 %_3735 %_3736))))
    (set! syntax-error
      (lambda (%_3740 . %_3739)
        (begin
          (for-each
            (lambda (%_3741)
              (if (not (string? %_3741))
                (%_2954 'syntax-error '"invalid argument" %_3741)
                (void)))
            %_3739)
          ((lambda (%_3743)
             (%_2954 '#f %_3743 (%_3299 %_3740 '(()))))
           (if (null? %_3739)
             '"invalid syntax"
             (apply string-append %_3739))))))
    (letrec ((%_3750
               (lambda (%_3791 %_3792 %_3793 %_3794)
                 (if (not %_3794)
                   '#f
                   (if (eq? %_3792 'any)
                     (cons (%_3239 %_3791 %_3793) %_3794)
                     (if (%_3076 %_3791)
                       (%_3749
                         ((lambda (%_3796)
                            (if (annotation? %_3796)
                              (annotation-expression %_3796)
                              %_3796))
                          (%_3077 %_3791))
                         %_3792
                         (%_3220 %_3793 (%_3078 %_3791))
                         %_3794)
                       (%_3749
                         (if (annotation? %_3791)
                           (annotation-expression %_3791)
                           %_3791)
                         %_3792
                         %_3793
                         %_3794))))))
             (%_3749
               (lambda (%_3781 %_3782 %_3783 %_3784)
                 (if (null? %_3782)
                   (if (null? %_3781) %_3784 '#f)
                   (if (pair? %_3782)
                     (if (pair? %_3781)
                       (%_3750
                         (car %_3781)
                         (car %_3782)
                         %_3783
                         (%_3750 (cdr %_3781) (cdr %_3782) %_3783 %_3784))
                       '#f)
                     (if (eq? %_3782 'each-any)
                       ((lambda (%_3790)
                          (if %_3790 (cons %_3790 %_3784) '#f))
                        (%_3746 %_3781 %_3783))
                       ((lambda (%_3785)
                          (if (memv %_3785 '(each))
                            (if (null? %_3781)
                              (%_3747 (vector-ref %_3782 '1) %_3784)
                              ((lambda (%_3789)
                                 (if %_3789 (%_3748 %_3789 %_3784) '#f))
                               (%_3744 %_3781 (vector-ref %_3782 '1) %_3783)))
                            (if (memv %_3785 '(free-id))
                              (if (%_3133 %_3781)
                                (if (%_3228
                                      (%_3239 %_3781 %_3783)
                                      (vector-ref %_3782 '1))
                                  %_3784
                                  '#f)
                                '#f)
                              (if (memv %_3785 '(each+))
                                (call-with-values
                                  (lambda ()
                                    (%_3745
                                      %_3781
                                      (vector-ref %_3782 '1)
                                      (vector-ref %_3782 '2)
                                      (vector-ref %_3782 '3)
                                      %_3783
                                      %_3784))
                                  (lambda (%_3786 %_3787 %_3788)
                                    (if %_3788
                                      (if (null? %_3787)
                                        (if (null? %_3786)
                                          (%_3747
                                            (vector-ref %_3782 '1)
                                            %_3788)
                                          (%_3748 %_3786 %_3788))
                                        '#f)
                                      '#f)))
                                (if (memv %_3785 '(atom))
                                  (if (equal?
                                        (vector-ref %_3782 '1)
                                        (%_3299 %_3781 %_3783))
                                    %_3784
                                    '#f)
                                  (if (memv %_3785 '(vector))
                                    (if (vector? %_3781)
                                      (%_3750
                                        (vector->list %_3781)
                                        (vector-ref %_3782 '1)
                                        %_3783
                                        %_3784)
                                      '#f)
                                    (void)))))))
                        (vector-ref %_3782 '0)))))))
             (%_3748
               (lambda (%_3779 %_3780)
                 (if (null? (car %_3779))
                   %_3780
                   (cons (map car %_3779)
                         (%_3748 (map cdr %_3779) %_3780)))))
             (%_3747
               (lambda (%_3776 %_3777)
                 (if (null? %_3776)
                   %_3777
                   (if (eq? %_3776 'any)
                     (cons '() %_3777)
                     (if (pair? %_3776)
                       (%_3747
                         (car %_3776)
                         (%_3747 (cdr %_3776) %_3777))
                       (if (eq? %_3776 'each-any)
                         (cons '() %_3777)
                         ((lambda (%_3778)
                            (if (memv %_3778 '(each))
                              (%_3747 (vector-ref %_3776 '1) %_3777)
                              (if (memv %_3778 '(each+))
                                (%_3747
                                  (vector-ref %_3776 '1)
                                  (%_3747
                                    (reverse (vector-ref %_3776 '2))
                                    (%_3747 (vector-ref %_3776 '3) %_3777)))
                                (if (memv %_3778 '(free-id atom))
                                  %_3777
                                  (if (memv %_3778 '(vector))
                                    (%_3747 (vector-ref %_3776 '1) %_3777)
                                    (void))))))
                          (vector-ref %_3776 '0))))))))
             (%_3746
               (lambda (%_3773 %_3774)
                 (if (annotation? %_3773)
                   (%_3746 (annotation-expression %_3773) %_3774)
                   (if (pair? %_3773)
                     ((lambda (%_3775)
                        (if %_3775
                          (cons (%_3239 (car %_3773) %_3774) %_3775)
                          '#f))
                      (%_3746 (cdr %_3773) %_3774))
                     (if (null? %_3773)
                       '()
                       (if (%_3076 %_3773)
                         (%_3746
                           (%_3077 %_3773)
                           (%_3220 %_3774 (%_3078 %_3773)))
                         '#f))))))
             (%_3745
               (lambda (%_3760 %_3761 %_3762 %_3763 %_3764 %_3765)
                 ((letrec ((%_3766
                             (lambda (%_3767 %_3768)
                               (if (pair? %_3767)
                                 (call-with-values
                                   (lambda () (%_3766 (cdr %_3767) %_3768))
                                   (lambda (%_3769 %_3770 %_3771)
                                     (if %_3771
                                       (if (null? %_3770)
                                         ((lambda (%_3772)
                                            (if %_3772
                                              (values
                                                (cons %_3772 %_3769)
                                                %_3770
                                                %_3771)
                                              (values '#f '#f '#f)))
                                          (%_3750
                                            (car %_3767)
                                            %_3761
                                            %_3768
                                            '()))
                                         (values
                                           '()
                                           (cdr %_3770)
                                           (%_3750
                                             (car %_3767)
                                             (car %_3770)
                                             %_3768
                                             %_3771)))
                                       (values '#f '#f '#f))))
                                 (if (annotation? %_3767)
                                   (%_3766
                                     (annotation-expression %_3767)
                                     %_3768)
                                   (if (%_3076 %_3767)
                                     (%_3766
                                       (%_3077 %_3767)
                                       (%_3220 %_3768 (%_3078 %_3767)))
                                     (values
                                       '()
                                       %_3762
                                       (%_3750
                                         %_3767
                                         %_3763
                                         %_3768
                                         %_3765))))))))
                    %_3766)
                  %_3760
                  %_3764)))
             (%_3744
               (lambda (%_3755 %_3756 %_3757)
                 (if (annotation? %_3755)
                   (%_3744
                     (annotation-expression %_3755)
                     %_3756
                     %_3757)
                   (if (pair? %_3755)
                     ((lambda (%_3758)
                        (if %_3758
                          ((lambda (%_3759)
                             (if %_3759 (cons %_3758 %_3759) '#f))
                           (%_3744 (cdr %_3755) %_3756 %_3757))
                          '#f))
                      (%_3750 (car %_3755) %_3756 %_3757 '()))
                     (if (null? %_3755)
                       '()
                       (if (%_3076 %_3755)
                         (%_3744
                           (%_3077 %_3755)
                           %_3756
                           (%_3220 %_3757 (%_3078 %_3755)))
                         '#f)))))))
      (set! $syntax-dispatch
        (lambda (%_3751 %_3752)
          (if (eq? %_3752 'any)
            (list %_3751)
            (if (%_3076 %_3751)
              (%_3749
                ((lambda (%_3754)
                   (if (annotation? %_3754)
                     (annotation-expression %_3754)
                     %_3754))
                 (%_3077 %_3751))
                %_3752
                (%_3078 %_3751)
                '())
              (%_3749
                (if (annotation? %_3751)
                  (annotation-expression %_3751)
                  %_3751)
                %_3752
                '(())
                '()))))))))
($sc-put-cte
  'with-syntax
  (lambda (%_4836)
    ((lambda (%_4838)
       (if %_4838
         (apply (lambda (%_4855 %_4856 %_4857)
                  (cons '#3(syntax-object
                            begin
                            ((top)
                             #4(ribcage #3(_ e1 e2) #3((top)) #3("i" "i" "i"))
                             #4(ribcage ())
                             #4(ribcage #1(x) #1((top)) #1("i"))
                             #4(ribcage (#2(import-token *top*)) ())))
                        (cons %_4856 %_4857)))
                %_4838)
         ((lambda (%_4839)
            (if %_4839
              (apply (lambda (%_4849 %_4850 %_4851 %_4852 %_4853)
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
                             %_4851
                             '()
                             (list %_4850
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
                                         (cons %_4852 %_4853)))))
                     %_4839)
              ((lambda (%_4840)
                 (if %_4840
                   (apply (lambda (%_4841 %_4842 %_4843 %_4844 %_4845)
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
                                        %_4843)
                                  '()
                                  (list %_4842
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
                                              (cons %_4844 %_4845)))))
                          %_4840)
                   (syntax-error %_4836)))
               ($syntax-dispatch
                 (compile-in-annotation %_4836 value)
                 '(any #2(each (any any)) any . each-any)))))
          ($syntax-dispatch
            (compile-in-annotation %_4836 value)
            '(any ((any any)) any . each-any)))))
     ($syntax-dispatch
       (compile-in-annotation %_4836 value)
       '(any () any . each-any)))))
($sc-put-cte
  'syntax-rules
  (lambda (%_4859)
    ((lambda (%_4861)
       (if %_4861
         (apply (lambda (%_4862 %_4863 %_4864 %_4865 %_4866)
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
                                    (cons %_4863
                                          (map (lambda (%_4869 %_4868)
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
                                                             %_4868)
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
                                                             %_4869)))
                                               %_4866
                                               %_4865))))))
                %_4861)
         (syntax-error %_4859)))
     ($syntax-dispatch
       (compile-in-annotation %_4859 value)
       '(any each-any . #2(each ((any . any) any)))))))
($sc-put-cte
  'or
  (lambda (%_4870)
    ((lambda (%_4872)
       (if %_4872
         (apply (lambda (%_4882)
                  '#3(syntax-object
                      #f
                      ((top)
                       #4(ribcage #1(_) #1((top)) #1("i"))
                       #4(ribcage ())
                       #4(ribcage #1(x) #1((top)) #1("i"))
                       #4(ribcage (#2(import-token *top*)) ()))))
                %_4872)
         ((lambda (%_4873)
            (if %_4873
              (apply (lambda (%_4880 %_4881) %_4881) %_4873)
              ((lambda (%_4874)
                 (if %_4874
                   (apply (lambda (%_4875 %_4876 %_4877 %_4878)
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
                                              %_4876))
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
                                              (cons %_4877 %_4878)))))
                          %_4874)
                   (syntax-error %_4870)))
               ($syntax-dispatch
                 (compile-in-annotation %_4870 value)
                 '(any any any . each-any)))))
          ($syntax-dispatch
            (compile-in-annotation %_4870 value)
            '(any any)))))
     ($syntax-dispatch
       (compile-in-annotation %_4870 value)
       '(any)))))
($sc-put-cte
  'and
  (lambda (%_4883)
    ((lambda (%_4885)
       (if %_4885
         (apply (lambda (%_4891 %_4892 %_4893 %_4894)
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
                        (cons %_4892
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
                                          (cons %_4893 %_4894))
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
                %_4885)
         ((lambda (%_4886)
            (if %_4886
              (apply (lambda (%_4889 %_4890) %_4890) %_4886)
              ((lambda (%_4887)
                 (if %_4887
                   (apply (lambda (%_4888)
                            '#3(syntax-object
                                #t
                                ((top)
                                 #4(ribcage #1(_) #1((top)) #1("i"))
                                 #4(ribcage ())
                                 #4(ribcage #1(x) #1((top)) #1("i"))
                                 #4(ribcage (#2(import-token *top*)) ()))))
                          %_4887)
                   (syntax-error %_4883)))
               ($syntax-dispatch
                 (compile-in-annotation %_4883 value)
                 '(any)))))
          ($syntax-dispatch
            (compile-in-annotation %_4883 value)
            '(any any)))))
     ($syntax-dispatch
       (compile-in-annotation %_4883 value)
       '(any any any . each-any)))))
($sc-put-cte
  'let
  (lambda (%_4896)
    ((lambda (%_4898)
       (if (if %_4898
             (apply (lambda (%_4924 %_4925 %_4926 %_4927 %_4928)
                      (andmap identifier? %_4925))
                    %_4898)
             '#f)
         (apply (lambda (%_4916 %_4917 %_4918 %_4919 %_4920)
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
                              (cons %_4917 (cons %_4919 %_4920)))
                        %_4918))
                %_4898)
         ((lambda (%_4899)
            (if (if %_4899
                  (apply (lambda (%_4909 %_4910 %_4911 %_4912 %_4913 %_4914)
                           (andmap identifier? (cons %_4910 %_4911)))
                         %_4899)
                  '#f)
              (apply (lambda (%_4900 %_4901 %_4902 %_4903 %_4904 %_4905)
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
                                   (list (list %_4901
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
                                                     (cons %_4902
                                                           (cons %_4904
                                                                 %_4905)))))
                                   %_4901)
                             %_4903))
                     %_4899)
              (syntax-error %_4896)))
          ($syntax-dispatch
            (compile-in-annotation %_4896 value)
            '(any any #2(each (any any)) any . each-any)))))
     ($syntax-dispatch
       (compile-in-annotation %_4896 value)
       '(any #2(each (any any)) any . each-any)))))
($sc-put-cte
  'let*
  (lambda (%_4930)
    ((lambda (%_4932)
       (if (if %_4932
             (apply (lambda (%_4947 %_4948 %_4949 %_4950 %_4951)
                      (andmap identifier? %_4948))
                    %_4932)
             '#f)
         (apply (lambda (%_4933 %_4934 %_4935 %_4936 %_4937)
                  ((letrec ((%_4938
                              (lambda (%_4939)
                                (if (null? %_4939)
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
                                        (cons '() (cons %_4936 %_4937)))
                                  ((lambda (%_4940)
                                     ((lambda (%_4941)
                                        (if %_4941
                                          (apply (lambda (%_4942 %_4943)
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
                                                         (list %_4943)
                                                         %_4942))
                                                 %_4941)
                                          (syntax-error %_4940)))
                                      ($syntax-dispatch
                                        (compile-in-annotation %_4940 value)
                                        '(any any))))
                                   (list (%_4938 (cdr %_4939))
                                         (car %_4939)))))))
                     %_4938)
                   (map list %_4934 %_4935)))
                %_4932)
         (syntax-error %_4930)))
     ($syntax-dispatch
       (compile-in-annotation %_4930 value)
       '(any #2(each (any any)) any . each-any)))))
($sc-put-cte
  'cond
  (lambda (%_4953)
    ((lambda (%_4955)
       (if %_4955
         (apply (lambda (%_4956 %_4957 %_4958)
                  ((letrec ((%_4959
                              (lambda (%_4960 %_4961)
                                (if (null? %_4961)
                                  ((lambda (%_4977)
                                     (if %_4977
                                       (apply (lambda (%_4989 %_4990)
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
                                                      (cons %_4989 %_4990)))
                                              %_4977)
                                       ((lambda (%_4978)
                                          (if %_4978
                                            (apply (lambda (%_4988)
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
                                                                             %_4988))
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
                                                   %_4978)
                                            ((lambda (%_4979)
                                               (if %_4979
                                                 (apply (lambda (%_4986 %_4987)
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
                                                                            %_4986))
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
                                                                      (cons %_4987
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
                                                        %_4979)
                                                 ((lambda (%_4980)
                                                    (if %_4980
                                                      (apply (lambda (%_4982
                                                                      %_4983
                                                                      %_4984)
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
                                                                     %_4982
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
                                                                           (cons %_4983
                                                                                 %_4984))))
                                                             %_4980)
                                                      (syntax-error %_4953)))
                                                  ($syntax-dispatch
                                                    (compile-in-annotation
                                                      %_4960
                                                      value)
                                                    '(any any . each-any)))))
                                             ($syntax-dispatch
                                               (compile-in-annotation
                                                 %_4960
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
                                          (compile-in-annotation %_4960 value)
                                          '(any)))))
                                   ($syntax-dispatch
                                     (compile-in-annotation %_4960 value)
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
                                  ((lambda (%_4962)
                                     ((lambda (%_4965)
                                        (if %_4965
                                          (apply (lambda (%_4975)
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
                                                                     %_4975))
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
                                                               %_4962)))
                                                 %_4965)
                                          ((lambda (%_4966)
                                             (if %_4966
                                               (apply (lambda (%_4973 %_4974)
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
                                                                          %_4973))
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
                                                                    (cons %_4974
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
                                                                    %_4962)))
                                                      %_4966)
                                               ((lambda (%_4967)
                                                  (if %_4967
                                                    (apply (lambda (%_4969
                                                                    %_4970
                                                                    %_4971)
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
                                                                   %_4969
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
                                                                         (cons %_4970
                                                                               %_4971))
                                                                   %_4962))
                                                           %_4967)
                                                    (syntax-error %_4953)))
                                                ($syntax-dispatch
                                                  (compile-in-annotation
                                                    %_4960
                                                    value)
                                                  '(any any . each-any)))))
                                           ($syntax-dispatch
                                             (compile-in-annotation
                                               %_4960
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
                                        (compile-in-annotation %_4960 value)
                                        '(any))))
                                   (%_4959 (car %_4961) (cdr %_4961)))))))
                     %_4959)
                   %_4957
                   %_4958))
                %_4955)
         (syntax-error %_4953)))
     ($syntax-dispatch
       (compile-in-annotation %_4953 value)
       '(any any . each-any)))))
($sc-put-cte
  'do
  (lambda (%_4993)
    ((lambda (%_4995)
       (if %_4995
         (apply (lambda (%_4996
                         %_4997
                         %_4998
                         %_4999
                         %_5000
                         %_5001
                         %_5002)
                  ((lambda (%_5003)
                     ((lambda (%_5013)
                        (if %_5013
                          (apply (lambda (%_5014)
                                   ((lambda (%_5017)
                                      (if %_5017
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
                                                       (map list %_4997 %_4998)
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
                                                                   %_5000)
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
                                                                     %_5002
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
                                                                                 %_5014)))))))
                                               %_5017)
                                        ((lambda (%_5018)
                                           (if %_5018
                                             (apply (lambda (%_5019 %_5020)
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
                                                                 %_4997
                                                                 %_4998)
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
                                                                  %_5000
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
                                                                        (cons %_5019
                                                                              %_5020))
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
                                                                          %_5002
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
                                                                                      %_5014)))))))
                                                    %_5018)
                                             (syntax-error %_5001)))
                                         ($syntax-dispatch
                                           (compile-in-annotation %_5001 value)
                                           '(any . each-any)))))
                                    ($syntax-dispatch
                                      (compile-in-annotation %_5001 value)
                                      '())))
                                 %_5013)
                          (syntax-error %_5003)))
                      ($syntax-dispatch
                        (compile-in-annotation %_5003 value)
                        'each-any)))
                   (map (lambda (%_5004 %_5005)
                          ((lambda (%_5007)
                             (if %_5007
                               (apply (lambda () %_5004) %_5007)
                               ((lambda (%_5008)
                                  (if %_5008
                                    (apply (lambda (%_5010) %_5010) %_5008)
                                    (syntax-error %_4993)))
                                ($syntax-dispatch
                                  (compile-in-annotation %_5005 value)
                                  '(any)))))
                           ($syntax-dispatch
                             (compile-in-annotation %_5005 value)
                             '())))
                        %_4997
                        %_4999)))
                %_4995)
         (syntax-error %_4993)))
     ($syntax-dispatch
       (compile-in-annotation %_4993 value)
       '(any #2(each (any any . any))
             (any . each-any)
             .
             each-any)))))
($sc-put-cte
  'quasiquote
  (letrec ((%_5038
             (lambda (%_5127 %_5128)
               ((lambda (%_5130)
                  (if %_5130
                    (apply (lambda (%_5150)
                             (if (= %_5128 '0)
                               %_5150
                               (%_5035
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
                                 (%_5038 (list %_5150) (- %_5128 '1)))))
                           %_5130)
                    ((lambda (%_5131)
                       (if %_5131
                         (apply (lambda (%_5146 %_5147)
                                  (if (= %_5128 '0)
                                    (%_5034 %_5146 (%_5038 %_5147 %_5128))
                                    (%_5035
                                      (%_5035
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
                                        (%_5038 %_5146 (- %_5128 '1)))
                                      (%_5038 %_5147 %_5128))))
                                %_5131)
                         ((lambda (%_5132)
                            (if %_5132
                              (apply (lambda (%_5142 %_5143)
                                       (if (= %_5128 '0)
                                         (%_5036 %_5142 (%_5038 %_5143 %_5128))
                                         (%_5035
                                           (%_5035
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
                                             (%_5038 %_5142 (- %_5128 '1)))
                                           (%_5038 %_5143 %_5128))))
                                     %_5132)
                              ((lambda (%_5133)
                                 (if %_5133
                                   (apply (lambda (%_5141)
                                            (%_5035
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
                                              (%_5038
                                                (list %_5141)
                                                (+ %_5128 '1))))
                                          %_5133)
                                   ((lambda (%_5134)
                                      (if %_5134
                                        (apply (lambda (%_5139 %_5140)
                                                 (%_5035
                                                   (%_5038 %_5139 %_5128)
                                                   (%_5038 %_5140 %_5128)))
                                               %_5134)
                                        ((lambda (%_5135)
                                           (if %_5135
                                             (apply (lambda (%_5137)
                                                      (%_5037
                                                        (%_5038
                                                          %_5137
                                                          %_5128)))
                                                    %_5135)
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
                                                   %_5127)))
                                         ($syntax-dispatch
                                           (compile-in-annotation %_5127 value)
                                           '#2(vector each-any)))))
                                    ($syntax-dispatch
                                      (compile-in-annotation %_5127 value)
                                      '(any . any)))))
                               ($syntax-dispatch
                                 (compile-in-annotation %_5127 value)
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
                            (compile-in-annotation %_5127 value)
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
                       (compile-in-annotation %_5127 value)
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
                  (compile-in-annotation %_5127 value)
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
           (%_5037
             (lambda (%_5090)
               ((lambda (%_5094)
                  (if (if %_5094
                        (apply (lambda (%_5125 %_5126) (%_5030 %_5125))
                               %_5094)
                        '#f)
                    (apply (lambda (%_5122 %_5123)
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
                                   (list->vector %_5123)))
                           %_5094)
                    ((letrec ((%_5096
                                (lambda (%_5097 %_5098)
                                  ((lambda (%_5100)
                                     (if (if %_5100
                                           (apply (lambda (%_5119 %_5120)
                                                    (%_5030 %_5119))
                                                  %_5100)
                                           '#f)
                                       (apply (lambda (%_5116 %_5117)
                                                (%_5098
                                                  (map (lambda (%_5118)
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
                                                               %_5118))
                                                       %_5117)))
                                              %_5100)
                                       ((lambda (%_5101)
                                          (if (if %_5101
                                                (apply (lambda (%_5114 %_5115)
                                                         (%_5031 %_5114))
                                                       %_5101)
                                                '#f)
                                            (apply (lambda (%_5111 %_5112)
                                                     (%_5098 %_5112))
                                                   %_5101)
                                            ((lambda (%_5102)
                                               (if (if %_5102
                                                     (apply (lambda (%_5108
                                                                     %_5109
                                                                     %_5110)
                                                              (%_5032 %_5108))
                                                            %_5102)
                                                     '#f)
                                                 (apply (lambda (%_5104
                                                                 %_5105
                                                                 %_5106)
                                                          (%_5096
                                                            %_5106
                                                            (lambda (%_5107)
                                                              (%_5098
                                                                (cons %_5105
                                                                      %_5107)))))
                                                        %_5102)
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
                                                       %_5090)))
                                             ($syntax-dispatch
                                               (compile-in-annotation
                                                 %_5097
                                                 value)
                                               '(any any any)))))
                                        ($syntax-dispatch
                                          (compile-in-annotation %_5097 value)
                                          '(any . each-any)))))
                                   ($syntax-dispatch
                                     (compile-in-annotation %_5097 value)
                                     '(any each-any))))))
                       %_5096)
                     %_5090
                     (lambda (%_5121)
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
                             %_5121)))))
                ($syntax-dispatch
                  (compile-in-annotation %_5090 value)
                  '(any each-any)))))
           (%_5036
             (lambda (%_5081 %_5082)
               ((lambda (%_5083)
                  (if (null? %_5083)
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
                    (if (null? (cdr %_5083))
                      (car %_5083)
                      ((lambda (%_5085)
                         (if %_5085
                           (apply (lambda (%_5086)
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
                                          %_5086))
                                  %_5085)
                           (syntax-error %_5083)))
                       ($syntax-dispatch
                         (compile-in-annotation %_5083 value)
                         'each-any)))))
                ((letrec ((%_5088
                            (lambda (%_5089)
                              (if (null? %_5089)
                                (if (%_5033 %_5082) '() (list %_5082))
                                (if (%_5033 (car %_5089))
                                  (%_5088 (cdr %_5089))
                                  (cons (car %_5089)
                                        (%_5088 (cdr %_5089))))))))
                   %_5088)
                 %_5081))))
           (%_5035
             (lambda (%_5056 %_5057)
               ((lambda (%_5058)
                  ((lambda (%_5059)
                     (if %_5059
                       (apply (lambda (%_5060 %_5061)
                                ((lambda (%_5063)
                                   (if (if %_5063
                                         (apply (lambda (%_5079 %_5080)
                                                  (%_5030 %_5079))
                                                %_5063)
                                         '#f)
                                     (apply (lambda (%_5070 %_5071)
                                              ((lambda (%_5073)
                                                 (if (if %_5073
                                                       (apply (lambda (%_5077
                                                                       %_5078)
                                                                (%_5030
                                                                  %_5077))
                                                              %_5073)
                                                       '#f)
                                                   (apply (lambda (%_5075
                                                                   %_5076)
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
                                                                  (cons %_5076
                                                                        %_5071)))
                                                          %_5073)
                                                   (if (null? %_5071)
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
                                                           %_5060)
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
                                                           %_5060
                                                           %_5061))))
                                               ($syntax-dispatch
                                                 (compile-in-annotation
                                                   %_5060
                                                   value)
                                                 '(any any))))
                                            %_5063)
                                     ((lambda (%_5064)
                                        (if (if %_5064
                                              (apply (lambda (%_5068 %_5069)
                                                       (%_5031 %_5068))
                                                     %_5064)
                                              '#f)
                                          (apply (lambda (%_5066 %_5067)
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
                                                         (cons %_5060 %_5067)))
                                                 %_5064)
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
                                                %_5060
                                                %_5061)))
                                      ($syntax-dispatch
                                        (compile-in-annotation %_5061 value)
                                        '(any . any)))))
                                 ($syntax-dispatch
                                   (compile-in-annotation %_5061 value)
                                   '(any any))))
                              %_5059)
                       (syntax-error %_5058)))
                   ($syntax-dispatch
                     (compile-in-annotation %_5058 value)
                     '(any any))))
                (list %_5056 %_5057))))
           (%_5034
             (lambda (%_5052 %_5053)
               ((letrec ((%_5054
                           (lambda (%_5055)
                             (if (null? %_5055)
                               %_5053
                               (%_5035 (car %_5055) (%_5054 (cdr %_5055)))))))
                  %_5054)
                %_5052)))
           (%_5033
             (lambda (%_5047)
               ((lambda (%_5049)
                  (if %_5049
                    (apply (lambda (%_5051) (%_5030 %_5051)) %_5049)
                    '#f))
                ($syntax-dispatch
                  (compile-in-annotation %_5047 value)
                  '(any ())))))
           (%_5032
             (lambda (%_5046)
               (if (identifier? %_5046)
                 (free-identifier=?
                   %_5046
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
           (%_5031
             (lambda (%_5045)
               (if (identifier? %_5045)
                 (free-identifier=?
                   %_5045
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
           (%_5030
             (lambda (%_5044)
               (if (identifier? %_5044)
                 (free-identifier=?
                   %_5044
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
    (lambda (%_5039)
      ((lambda (%_5041)
         (if %_5041
           (apply (lambda (%_5042 %_5043) (%_5038 %_5043 '0))
                  %_5041)
           (syntax-error %_5039)))
       ($syntax-dispatch
         (compile-in-annotation %_5039 value)
         '(any any))))))
($sc-put-cte
  'include
  (lambda (%_5151)
    (letrec ((%_5152
               (lambda (%_5162 %_5163)
                 ((lambda (%_5164)
                    ((letrec ((%_5165
                                (lambda (%_5166)
                                  ((lambda (%_5167)
                                     (if (eof-object? %_5167)
                                       (begin
                                         (close-input-port %_5164)
                                         (reverse %_5166))
                                       (%_5165
                                         (cons (datum->syntax-object
                                                 %_5163
                                                 %_5167)
                                               %_5166))))
                                   (read-code %_5164)))))
                       %_5165)
                     '()))
                  (open-source-input-file %_5162)))))
      ((lambda (%_5154)
         (if %_5154
           (apply (lambda (%_5155 %_5156)
                    ((lambda (%_5157)
                       ((lambda (%_5158)
                          ((lambda (%_5159)
                             (if %_5159
                               (apply (lambda (%_5160)
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
                                              %_5160))
                                      %_5159)
                               (syntax-error %_5158)))
                           ($syntax-dispatch
                             (compile-in-annotation %_5158 value)
                             'each-any)))
                        (%_5152 %_5157 %_5155)))
                     (syntax-object->datum %_5156)))
                  %_5154)
           (syntax-error %_5151)))
       ($syntax-dispatch
         (compile-in-annotation %_5151 value)
         '(any any))))))
($sc-put-cte
  'unquote
  (lambda (%_5168)
    ((lambda (%_5170)
       (if %_5170
         (apply (lambda (%_5171 %_5172)
                  (syntax-error
                    %_5168
                    '"expression not valid outside of quasiquote"))
                %_5170)
         (syntax-error %_5168)))
     ($syntax-dispatch
       (compile-in-annotation %_5168 value)
       '(any . each-any)))))
($sc-put-cte
  'unquote-splicing
  (lambda (%_5173)
    ((lambda (%_5175)
       (if %_5175
         (apply (lambda (%_5176 %_5177)
                  (syntax-error
                    %_5173
                    '"expression not valid outside of quasiquote"))
                %_5175)
         (syntax-error %_5173)))
     ($syntax-dispatch
       (compile-in-annotation %_5173 value)
       '(any . each-any)))))
($sc-put-cte
  'case
  (lambda (%_5178)
    ((lambda (%_5180)
       (if %_5180
         (apply (lambda (%_5181 %_5182 %_5183 %_5184)
                  ((lambda (%_5185)
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
                                       %_5182))
                           %_5185))
                   ((letrec ((%_5186
                               (lambda (%_5187 %_5188)
                                 (if (null? %_5188)
                                   ((lambda (%_5200)
                                      (if %_5200
                                        (apply (lambda (%_5208 %_5209)
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
                                                       (cons %_5208 %_5209)))
                                               %_5200)
                                        ((lambda (%_5201)
                                           (if %_5201
                                             (apply (lambda (%_5203
                                                             %_5204
                                                             %_5205)
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
                                                                        %_5203))
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
                                                                  (cons %_5204
                                                                        %_5205))))
                                                    %_5201)
                                             (syntax-error %_5178)))
                                         ($syntax-dispatch
                                           (compile-in-annotation %_5187 value)
                                           '(each-any any . each-any)))))
                                    ($syntax-dispatch
                                      (compile-in-annotation %_5187 value)
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
                                   ((lambda (%_5189)
                                      ((lambda (%_5192)
                                         (if %_5192
                                           (apply (lambda (%_5194
                                                           %_5195
                                                           %_5196)
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
                                                                      %_5194))
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
                                                                (cons %_5195
                                                                      %_5196))
                                                          %_5189))
                                                  %_5192)
                                           (syntax-error %_5178)))
                                       ($syntax-dispatch
                                         (compile-in-annotation %_5187 value)
                                         '(each-any any . each-any))))
                                    (%_5186 (car %_5188) (cdr %_5188)))))))
                      %_5186)
                    %_5183
                    %_5184)))
                %_5180)
         (syntax-error %_5178)))
     ($syntax-dispatch
       (compile-in-annotation %_5178 value)
       '(any any any . each-any)))))
($sc-put-cte
  'identifier-syntax
  (lambda (%_5213)
    ((lambda (%_5215)
       (if %_5215
         (apply (lambda (%_5229 %_5230)
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
                                          %_5230))
                              (list (cons %_5229
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
                                          (cons %_5230
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
                %_5215)
         ((lambda (%_5216)
            (if (if %_5216
                  (apply (lambda (%_5223 %_5224 %_5225 %_5226 %_5227 %_5228)
                           (if (identifier? %_5224)
                             (identifier? %_5226)
                             '#f))
                         %_5216)
                  '#f)
              (apply (lambda (%_5217 %_5218 %_5219 %_5220 %_5221 %_5222)
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
                                                     %_5220
                                                     %_5221)
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
                                                     %_5222))
                                         (list (cons %_5218
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
                                                     (cons %_5219
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
                                         (list %_5218
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
                                                           %_5218))
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
                                                     %_5219))))))
                     %_5216)
              (syntax-error %_5213)))
          ($syntax-dispatch
            (compile-in-annotation %_5213 value)
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
       (compile-in-annotation %_5213 value)
       '(any any)))))
