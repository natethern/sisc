(#%program
  ((|rest_sSqTHm6uw| . 2)
   (map . 2)
   (|first_sS4XJV5uw| . 2)
   (|rest_sSOEza8uw| . 1)
   (|andmap_sSK-Ls5uw| . 2)
   (|xr_sS6MDg7uw| . 2)
   (|x_sSMPFP6uw| . 2)
   (cons . 2)
   (apply . 2)
   (|first_sSsIBJ7uw| . 2)
   (|first_sSI9S54uw| . 3)
   (cdr . 3)
   (|first_sSuxv49uw| . 2)
   (car . 3)
   (|andmap_sS8BxD8uw| . 2)
   (|x_sSQttx9uw| . 2)
   (|f_sS26Qy4uw| . 4)
   (|first_sSaqr-9uw| . 2)
   (|rest_sSmdUE3uw| . 2)
   (null? . 4)
   (|t_sSo2O_4uw| . 2))
  ((|andmap_sSK-Ls5uw| . 1)
   (|andmap_sS8BxD8uw| . 1))
  (map cons apply cdr car null?)
  (#%define andmap
    (#%lambda #t
      (|f_sS26Qy4uw|
        |first_sSI9S54uw|
        .
        |rest_sSmdUE3uw|)
      ()
      ((#%lambda #t
         (|t_sSo2O_4uw|)
         (|rest_sSmdUE3uw|
           |first_sSI9S54uw|
           |f_sS26Qy4uw|)
         (#%if |t_sSo2O_4uw|
           |t_sSo2O_4uw|
           (#%if (null? |rest_sSmdUE3uw|)
             ((#%letrec #t
                ((|andmap_sS8BxD8uw|
                   (#%lambda #t
                     (|first_sSuxv49uw|)
                     (|andmap_sS8BxD8uw| |f_sS26Qy4uw|)
                     ((#%lambda #t
                        (|x_sSQttx9uw| |first_sSaqr-9uw|)
                        (|andmap_sS8BxD8uw| |f_sS26Qy4uw|)
                        (#%if (null? |first_sSaqr-9uw|)
                          (|f_sS26Qy4uw| |x_sSQttx9uw|)
                          (#%if (|f_sS26Qy4uw| |x_sSQttx9uw|)
                            (|andmap_sS8BxD8uw| |first_sSaqr-9uw|)
                            #f)))
                      (car |first_sSuxv49uw|)
                      (cdr |first_sSuxv49uw|)))))
                (|f_sS26Qy4uw|)
                |andmap_sS8BxD8uw|)
              |first_sSI9S54uw|)
             ((#%letrec #t
                ((|andmap_sSK-Ls5uw|
                   (#%lambda #t
                     (|first_sS4XJV5uw| |rest_sSqTHm6uw|)
                     (|andmap_sSK-Ls5uw| |f_sS26Qy4uw|)
                     ((#%lambda #t
                        (|x_sSMPFP6uw|
                          |xr_sS6MDg7uw|
                          |first_sSsIBJ7uw|
                          |rest_sSOEza8uw|)
                        (|andmap_sSK-Ls5uw| |f_sS26Qy4uw|)
                        (#%if (null? |first_sSsIBJ7uw|)
                          (apply |f_sS26Qy4uw|
                                 (cons |x_sSMPFP6uw| |xr_sS6MDg7uw|))
                          (#%if (apply |f_sS26Qy4uw|
                                       (cons |x_sSMPFP6uw| |xr_sS6MDg7uw|))
                            (|andmap_sSK-Ls5uw|
                              |first_sSsIBJ7uw|
                              |rest_sSOEza8uw|)
                            #f)))
                      (car |first_sS4XJV5uw|)
                      (map car |rest_sSqTHm6uw|)
                      (cdr |first_sS4XJV5uw|)
                      (map cdr |rest_sSqTHm6uw|)))))
                (|f_sS26Qy4uw|)
                |andmap_sSK-Ls5uw|)
              |first_sSI9S54uw|
              |rest_sSmdUE3uw|))))
       (null? |first_sSI9S54uw|)))))
(#%program
  ((gensym . 2)
   (symbol->string . 2)
   (string-append . 1)
   (string->symbol . 1)
   (|base_sSwmprauw| . 2))
  ()
  (string->symbol
    gensym
    symbol->string
    string-append)
  (#%define gen-sym
    (#%lambda #t
      (|base_sSwmprauw|)
      ()
      (#%if |base_sSwmprauw|
        (string->symbol
          (string-append
            (symbol->string |base_sSwmprauw|)
            "_"
            (symbol->string (gensym))))
        (gensym)))))
(#%program
  ((car . 1)
   (cdr . 1)
   (|proc_sSSinUauw| . 2)
   (ormap . 1)
   (|t_sSybjObuw| . 2)
   (|list1_sScfllbuw| . 3)
   (null? . 1)
   (not . 1))
  ()
  (ormap cdr car not null?)
  (#%define ormap
    (#%lambda #t
      (|proc_sSSinUauw| |list1_sScfllbuw|)
      ()
      (#%if (not (null? |list1_sScfllbuw|))
        ((#%lambda #t
           (|t_sSybjObuw|)
           (|list1_sScfllbuw| |proc_sSSinUauw|)
           (#%if |t_sSybjObuw|
             |t_sSybjObuw|
             (ormap |proc_sSSinUauw| (cdr |list1_sScfllbuw|))))
         (|proc_sSSinUauw| (car |list1_sScfllbuw|)))
        #f))))
(#%program
  ((cons . 1)
   (cdr . 2)
   (remq . 2)
   (car . 2)
   (|o_sSU7hfcuw| . 3)
   (eq? . 1)
   (|lst_sSe4fIcuw| . 5)
   (null? . 1))
  ()
  (car eq? cdr remq cons null?)
  (#%define remq
    (#%lambda #t
      (|o_sSU7hfcuw| |lst_sSe4fIcuw|)
      ()
      (#%if (null? |lst_sSe4fIcuw|)
        ()
        (#%if (eq? |o_sSU7hfcuw| (car |lst_sSe4fIcuw|))
          (remq |o_sSU7hfcuw| (cdr |lst_sSe4fIcuw|))
          (cons (car |lst_sSe4fIcuw|)
                (remq |o_sSU7hfcuw| (cdr |lst_sSe4fIcuw|))))))))
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
  ((|args_sSA0d9duw| . 1) (error . 1) (apply . 1))
  ()
  (error apply)
  (#%define throw
    (#%lambda #t
      |args_sSA0d9duw|
      ()
      (apply error |args_sSA0d9duw|))))
(#%program
  ((newline . 1)
   (|args_sSWYaCduw| . 1)
   (|arg_sSgV83euw| . 1)
   (|display| . 2)
   (for-each . 1))
  ()
  (newline for-each |display|)
  (#%define error
    (#%lambda #t
      |args_sSWYaCduw|
      ()
      (#%begin
        (for-each
          (#%lambda #t
            (|arg_sSgV83euw|)
            ()
            (#%begin
              (|display| |arg_sSgV83euw|)
              (|display| #\space)))
          |args_sSWYaCduw|)
        (newline)))))
(#%program
  ((_make-native-parameter . 1))
  ()
  (_make-native-parameter)
  (#%define strict-r5rs-compliance
    (_make-native-parameter "strictR5RSCompliance")))
(#%program
  ((pair? . 1)
   (|v_sSCR6weuw| . 2)
   (symbol? . 1)
   (|t_sSYN4Zeuw| . 2)
   (not . 1))
  ()
  (symbol? pair? not)
  (#%define atom?
    (#%lambda #t
      (|v_sSCR6weuw|)
      ()
      (not ((#%lambda #t
              (|t_sSYN4Zeuw|)
              (|v_sSCR6weuw|)
              (#%if |t_sSYN4Zeuw|
                |t_sSYN4Zeuw|
                (symbol? |v_sSCR6weuw|)))
            (pair? |v_sSCR6weuw|))))))
(#%program
  ()
  ()
  ()
  (#%define make-false
    (#%lambda #t (|v_sSiK2qfuw|) () #f)))
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
