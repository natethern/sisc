(#%program
  ((|rest_XieJJ7TYd| . 2)
   (map . 2)
   (|first_XiUMLGSYd| . 2)
   (|rest_XiCuBXUYd| . 1)
   (|andmap_XiyQNdSYd| . 2)
   (|xr_XiWBF1UYd| . 2)
   (|x_XiAFHATYd| . 2)
   (cons . 2)
   (apply . 2)
   (|first_XigyDuUYd| . 2)
   (|first_Xiw_TSQYd| . 3)
   (cdr . 3)
   (|first_XiinxRVYd| . 2)
   (car . 3)
   (|andmap_XiYqzoVYd| . 2)
   (|x_XiEjviWYd| . 2)
   (|f_XiSXRjRYd| . 4)
   (|first_Xi-ftLWYd| . 2)
   (|rest_Xia3WpQYd| . 2)
   (null? . 4)
   (|t_XicUPMRYd| . 2))
  ((|andmap_XiyQNdSYd| . 1)
   (|andmap_XiYqzoVYd| . 1))
  (map cons apply cdr car null?)
  (#%define andmap
    (#%lambda #t
      (|f_XiSXRjRYd|
        |first_Xiw_TSQYd|
        .
        |rest_Xia3WpQYd|)
      ()
      ((#%lambda #t
         (|t_XicUPMRYd|)
         (|rest_Xia3WpQYd|
           |first_Xiw_TSQYd|
           |f_XiSXRjRYd|)
         (#%if |t_XicUPMRYd|
           |t_XicUPMRYd|
           (#%if (null? |rest_Xia3WpQYd|)
             ((#%letrec #t
                ((|andmap_XiYqzoVYd|
                   (#%lambda #t
                     (|first_XiinxRVYd|)
                     (|andmap_XiYqzoVYd| |f_XiSXRjRYd|)
                     ((#%lambda #t
                        (|x_XiEjviWYd| |first_Xi-ftLWYd|)
                        (|andmap_XiYqzoVYd| |f_XiSXRjRYd|)
                        (#%if (null? |first_Xi-ftLWYd|)
                          (|f_XiSXRjRYd| |x_XiEjviWYd|)
                          (#%if (|f_XiSXRjRYd| |x_XiEjviWYd|)
                            (|andmap_XiYqzoVYd| |first_Xi-ftLWYd|)
                            #f)))
                      (car |first_XiinxRVYd|)
                      (cdr |first_XiinxRVYd|)))))
                (|f_XiSXRjRYd|)
                |andmap_XiYqzoVYd|)
              |first_Xiw_TSQYd|)
             ((#%letrec #t
                ((|andmap_XiyQNdSYd|
                   (#%lambda #t
                     (|first_XiUMLGSYd| |rest_XieJJ7TYd|)
                     (|andmap_XiyQNdSYd| |f_XiSXRjRYd|)
                     ((#%lambda #t
                        (|x_XiAFHATYd|
                          |xr_XiWBF1UYd|
                          |first_XigyDuUYd|
                          |rest_XiCuBXUYd|)
                        (|andmap_XiyQNdSYd| |f_XiSXRjRYd|)
                        (#%if (null? |first_XigyDuUYd|)
                          (apply |f_XiSXRjRYd|
                                 (cons |x_XiAFHATYd| |xr_XiWBF1UYd|))
                          (#%if (apply |f_XiSXRjRYd|
                                       (cons |x_XiAFHATYd| |xr_XiWBF1UYd|))
                            (|andmap_XiyQNdSYd|
                              |first_XigyDuUYd|
                              |rest_XiCuBXUYd|)
                            #f)))
                      (car |first_XiUMLGSYd|)
                      (map car |rest_XieJJ7TYd|)
                      (cdr |first_XiUMLGSYd|)
                      (map cdr |rest_XieJJ7TYd|)))))
                (|f_XiSXRjRYd|)
                |andmap_XiyQNdSYd|)
              |first_Xiw_TSQYd|
              |rest_Xia3WpQYd|))))
       (null? |first_Xiw_TSQYd|)))))
(#%program
  ((gensym . 2)
   (symbol->string . 2)
   (string-append . 1)
   (string->symbol . 1)
   (|base_XikcrcXYd| . 2))
  ()
  (string->symbol
    gensym
    symbol->string
    string-append)
  (#%define gen-sym
    (#%lambda #t
      (|base_XikcrcXYd|)
      ()
      (#%if |base_XikcrcXYd|
        (string->symbol
          (string-append
            (symbol->string |base_XikcrcXYd|)
            "_"
            (symbol->string (gensym))))
        (gensym)))))
(#%program
  ((car . 1)
   (cdr . 1)
   (|proc_XiG8pFXYd| . 2)
   (ormap . 1)
   (|t_Xim1lzYYd| . 2)
   (|list1_Xi05n6YYd| . 3)
   (null? . 1)
   (not . 1))
  ()
  (ormap cdr car not null?)
  (#%define ormap
    (#%lambda #t
      (|proc_XiG8pFXYd| |list1_Xi05n6YYd|)
      ()
      (#%if (not (null? |list1_Xi05n6YYd|))
        ((#%lambda #t
           (|t_Xim1lzYYd|)
           (|list1_Xi05n6YYd| |proc_XiG8pFXYd|)
           (#%if |t_Xim1lzYYd|
             |t_Xim1lzYYd|
             (ormap |proc_XiG8pFXYd| (cdr |list1_Xi05n6YYd|))))
         (|proc_XiG8pFXYd| (car |list1_Xi05n6YYd|)))
        #f))))
(#%program
  ((cons . 1)
   (cdr . 2)
   (remq . 2)
   (car . 2)
   (|o_XiIZi0ZYd| . 3)
   (eq? . 1)
   (|lst_Xi2WgtZYd| . 5)
   (null? . 1))
  ()
  (car eq? cdr remq cons null?)
  (#%define remq
    (#%lambda #t
      (|o_XiIZi0ZYd| |lst_Xi2WgtZYd|)
      ()
      (#%if (null? |lst_Xi2WgtZYd|)
        ()
        (#%if (eq? |o_XiIZi0ZYd| (car |lst_Xi2WgtZYd|))
          (remq |o_XiIZi0ZYd| (cdr |lst_Xi2WgtZYd|))
          (cons (car |lst_Xi2WgtZYd|)
                (remq |o_XiIZi0ZYd| (cdr |lst_Xi2WgtZYd|))))))))
(#%program
  ((void . 1))
  ()
  ()
  (#%define $sc-put-cte (void)))
(#%program
  ((void . 1))
  ()
  ()
  (#%define identifier? (void)))
(#%program
  ((void . 1))
  ()
  ()
  (#%define sc-expand (void)))
(#%program
  ((void . 1))
  ()
  ()
  (#%define datum->syntax-object (void)))
(#%program
  ((void . 1))
  ()
  ()
  (#%define syntax-object->datum (void)))
(#%program
  ((void . 1))
  ()
  ()
  (#%define generate-temporaries (void)))
(#%program
  ((void . 1))
  ()
  ()
  (#%define free-identifier=? (void)))
(#%program
  ((void . 1))
  ()
  ()
  (#%define bound-identifier=? (void)))
(#%program
  ((void . 1))
  ()
  ()
  (#%define literal-identifier=? (void)))
(#%program
  ((void . 1))
  ()
  ()
  (#%define syntax-error (void)))
(#%program
  ((void . 1))
  ()
  ()
  (#%define $syntax-dispatch (void)))
(#%program
  ((void . 1))
  ()
  ()
  (#%define $make-environment (void)))
(#%program
  ((|args_XioSeWZYd| . 1) (error . 1) (apply . 1))
  ()
  (error apply)
  (#%define throw
    (#%lambda #t
      |args_XioSeWZYd|
      ()
      (apply error |args_XioSeWZYd|))))
(#%program
  ((newline . 1)
   (|args_XiKOcn-Yd| . 1)
   (|arg_Xi4LaQ-Yd| . 1)
   (display . 2)
   (for-each . 1))
  ()
  (newline for-each display)
  (#%define error
    (#%lambda #t
      |args_XiKOcn-Yd|
      ()
      (#%begin
        (for-each
          (#%lambda #t
            (|arg_Xi4LaQ-Yd|)
            ()
            (#%begin
              (display |arg_Xi4LaQ-Yd|)
              (display #\space)))
          |args_XiKOcn-Yd|)
        (newline)))))
(#%program
  ((_make-native-parameter . 1))
  ()
  ()
  (#%define strict-r5rs-compliance
    (_make-native-parameter "strictR5RSCompliance")))
(#%program
  ((pair? . 1)
   (|v_XiqH8h_Yd| . 2)
   (symbol? . 1)
   (|t_XiMD6K_Yd| . 2)
   (not . 1))
  ()
  (symbol? pair? not)
  (#%define atom?
    (#%lambda #t
      (|v_XiqH8h_Yd|)
      ()
      (not ((#%lambda #t
              (|t_XiMD6K_Yd|)
              (|v_XiqH8h_Yd|)
              (#%if |t_XiMD6K_Yd|
                |t_XiMD6K_Yd|
                (symbol? |v_XiqH8h_Yd|)))
            (pair? |v_XiqH8h_Yd|))))))
(#%program
  ()
  ()
  ()
  (#%define make-false
    (#%lambda #t (|v_Xi6A4b0Zd|) () #f)))
(#%program
  ((load-module . 1)
   (for-each . 1)
   (get-symbolic-environment . 1)
   (getprop . 1)
   (not . 1))
  ()
  ()
  (#%if (not (getprop
               (#%quote lite)
               (get-symbolic-environment (#%quote *sisc*))))
    (for-each
      load-module
      (#%quote ("sisc.modules.SNative$Index")))
    #!void))
