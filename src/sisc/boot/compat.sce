(#%program
  ((|rest_1QHLKCjPN| . 2)
   (map . 2)
   (|first_1QlPM9jPN| . 2)
   (|rest_1Q3xCqlPN| . 1)
   (|andmap_1Q_SOIiPN| . 2)
   (|xr_1QnEGwkPN| . 2)
   (|x_1Q1II3kPN| . 2)
   (cons . 2)
   (apply . 2)
   (|first_1QJAEZkPN| . 2)
   (|first_1QZ1VlhPN| . 3)
   (cdr . 3)
   (|first_1QLpykmPN| . 2)
   (car . 3)
   (|andmap_1QptATlPN| . 2)
   (|x_1Q5mwNmPN| . 2)
   (|f_1Qj-SOhPN| . 4)
   (|first_1QriuenPN| . 2)
   (|rest_1QD5XUgPN| . 2)
   (null? . 4)
   (|t_1QFWQfiPN| . 2))
  ((|andmap_1Q_SOIiPN| . 1)
   (|andmap_1QptATlPN| . 1))
  (map cons apply cdr car null?)
  (#%define andmap
    (#%lambda #t
      (|f_1Qj-SOhPN|
        |first_1QZ1VlhPN|
        .
        |rest_1QD5XUgPN|)
      ()
      ((#%lambda #t
         (|t_1QFWQfiPN|)
         (|rest_1QD5XUgPN|
           |first_1QZ1VlhPN|
           |f_1Qj-SOhPN|)
         (#%if |t_1QFWQfiPN|
           |t_1QFWQfiPN|
           (#%if (null? |rest_1QD5XUgPN|)
             ((#%letrec #t
                ((|andmap_1QptATlPN|
                   (#%lambda #t
                     (|first_1QLpykmPN|)
                     (|andmap_1QptATlPN| |f_1Qj-SOhPN|)
                     ((#%lambda #t
                        (|x_1Q5mwNmPN| |first_1QriuenPN|)
                        (|andmap_1QptATlPN| |f_1Qj-SOhPN|)
                        (#%if (null? |first_1QriuenPN|)
                          (|f_1Qj-SOhPN| |x_1Q5mwNmPN|)
                          (#%if (|f_1Qj-SOhPN| |x_1Q5mwNmPN|)
                            (|andmap_1QptATlPN| |first_1QriuenPN|)
                            #f)))
                      (car |first_1QLpykmPN|)
                      (cdr |first_1QLpykmPN|)))))
                (|f_1Qj-SOhPN|)
                |andmap_1QptATlPN|)
              |first_1QZ1VlhPN|)
             ((#%letrec #t
                ((|andmap_1Q_SOIiPN|
                   (#%lambda #t
                     (|first_1QlPM9jPN| |rest_1QHLKCjPN|)
                     (|andmap_1Q_SOIiPN| |f_1Qj-SOhPN|)
                     ((#%lambda #t
                        (|x_1Q1II3kPN|
                          |xr_1QnEGwkPN|
                          |first_1QJAEZkPN|
                          |rest_1Q3xCqlPN|)
                        (|andmap_1Q_SOIiPN| |f_1Qj-SOhPN|)
                        (#%if (null? |first_1QJAEZkPN|)
                          (apply |f_1Qj-SOhPN|
                                 (cons |x_1Q1II3kPN| |xr_1QnEGwkPN|))
                          (#%if (apply |f_1Qj-SOhPN|
                                       (cons |x_1Q1II3kPN| |xr_1QnEGwkPN|))
                            (|andmap_1Q_SOIiPN|
                              |first_1QJAEZkPN|
                              |rest_1Q3xCqlPN|)
                            #f)))
                      (car |first_1QlPM9jPN|)
                      (map car |rest_1QHLKCjPN|)
                      (cdr |first_1QlPM9jPN|)
                      (map cdr |rest_1QHLKCjPN|)))))
                (|f_1Qj-SOhPN|)
                |andmap_1Q_SOIiPN|)
              |first_1QZ1VlhPN|
              |rest_1QD5XUgPN|))))
       (null? |first_1QZ1VlhPN|)))))
(#%program
  ((gensym . 2)
   (symbol->string . 2)
   (string-append . 1)
   (string->symbol . 1)
   (|base_1QNesHnPN| . 2))
  ()
  (string->symbol
    gensym
    symbol->string
    string-append)
  (#%define gen-sym
    (#%lambda #t
      (|base_1QNesHnPN|)
      ()
      (#%if |base_1QNesHnPN|
        (string->symbol
          (string-append
            (symbol->string |base_1QNesHnPN|)
            "_"
            (symbol->string (gensym))))
        (gensym)))))
(#%program
  ((car . 1)
   (cdr . 1)
   (|proc_1Q7bq8oPN| . 2)
   (ormap . 1)
   (|t_1QP3m2pPN| . 2)
   (|list1_1Qt7oBoPN| . 3)
   (null? . 1)
   (not . 1))
  ()
  (ormap cdr car not null?)
  (#%define ormap
    (#%lambda #t
      (|proc_1Q7bq8oPN| |list1_1Qt7oBoPN|)
      ()
      (#%if (not (null? |list1_1Qt7oBoPN|))
        ((#%lambda #t
           (|t_1QP3m2pPN|)
           (|list1_1Qt7oBoPN| |proc_1Q7bq8oPN|)
           (#%if |t_1QP3m2pPN|
             |t_1QP3m2pPN|
             (ormap |proc_1Q7bq8oPN| (cdr |list1_1Qt7oBoPN|))))
         (|proc_1Q7bq8oPN| (car |list1_1Qt7oBoPN|)))
        #f))))
(#%program
  ((cons . 1)
   (cdr . 2)
   (remq . 2)
   (car . 2)
   (|o_1Q90kvpPN| . 3)
   (eq? . 1)
   (|lst_1QvYhYpPN| . 5)
   (null? . 1))
  ()
  (car eq? cdr remq cons null?)
  (#%define remq
    (#%lambda #t
      (|o_1Q90kvpPN| |lst_1QvYhYpPN|)
      ()
      (#%if (null? |lst_1QvYhYpPN|)
        ()
        (#%if (eq? |o_1Q90kvpPN| (car |lst_1QvYhYpPN|))
          (remq |o_1Q90kvpPN| (cdr |lst_1QvYhYpPN|))
          (cons (car |lst_1QvYhYpPN|)
                (remq |o_1Q90kvpPN| (cdr |lst_1QvYhYpPN|))))))))
(#%program
  ((void . 1))
  ()
  (void)
  (#%define $sc-put-cte (void)))
(#%program
  ((void . 1))
  ()
  (void)
  (#%define identifier? (void)))
(#%program
  ((void . 1))
  ()
  (void)
  (#%define sc-expand (void)))
(#%program
  ((void . 1))
  ()
  (void)
  (#%define datum->syntax-object (void)))
(#%program
  ((void . 1))
  ()
  (void)
  (#%define syntax-object->datum (void)))
(#%program
  ((void . 1))
  ()
  (void)
  (#%define generate-temporaries (void)))
(#%program
  ((void . 1))
  ()
  (void)
  (#%define free-identifier=? (void)))
(#%program
  ((void . 1))
  ()
  (void)
  (#%define bound-identifier=? (void)))
(#%program
  ((void . 1))
  ()
  (void)
  (#%define literal-identifier=? (void)))
(#%program
  ((void . 1))
  ()
  (void)
  (#%define syntax-error (void)))
(#%program
  ((void . 1))
  ()
  (void)
  (#%define $syntax-dispatch (void)))
(#%program
  ((void . 1))
  ()
  (void)
  (#%define $make-environment (void)))
(#%program
  ((|args_1QRUfpqPN| . 1) (error . 1) (apply . 1))
  ()
  (error apply)
  (#%define throw
    (#%lambda #t
      |args_1QRUfpqPN|
      ()
      (apply error |args_1QRUfpqPN|))))
(#%program
  ((newline . 1)
   (|args_1QbRdSqPN| . 1)
   (|arg_1QxNbjrPN| . 1)
   (display . 2)
   (for-each . 1))
  ()
  (newline for-each display)
  (#%define error
    (#%lambda #t
      |args_1QbRdSqPN|
      ()
      (#%begin
        (for-each
          (#%lambda #t
            (|arg_1QxNbjrPN|)
            ()
            (#%begin
              (display |arg_1QxNbjrPN|)
              (display #\space)))
          |args_1QbRdSqPN|)
        (newline)))))
(#%program
  ((_make-native-parameter . 1))
  ()
  (_make-native-parameter)
  (#%define strict-r5rs-compliance
    (_make-native-parameter "strictR5RSCompliance")))
(#%program
  ((pair? . 1)
   (|v_1QTJ9MrPN| . 2)
   (symbol? . 1)
   (|t_1QdG7dsPN| . 2)
   (not . 1))
  ()
  (symbol? pair? not)
  (#%define atom?
    (#%lambda #t
      (|v_1QTJ9MrPN|)
      ()
      (not ((#%lambda #t
              (|t_1QdG7dsPN|)
              (|v_1QTJ9MrPN|)
              (#%if |t_1QdG7dsPN|
                |t_1QdG7dsPN|
                (symbol? |v_1QTJ9MrPN|)))
            (pair? |v_1QTJ9MrPN|))))))
(#%program
  ()
  ()
  ()
  (#%define make-false
    (#%lambda #t (|v_1QzC5GsPN|) () #f)))
(#%program
  ((load-module . 1)
   (for-each . 1)
   (get-symbolic-environment . 1)
   (getprop . 1)
   (not . 1))
  ()
  (load-module
    for-each
    get-symbolic-environment
    getprop
    not)
  (#%if (not (getprop
               (#%quote lite)
               (get-symbolic-environment (#%quote *sisc*))))
    (for-each
      load-module
      (#%quote ("sisc.modules.SNative$Index")))
    #!void))
