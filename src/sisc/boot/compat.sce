(#%program
  ((|rest_Wiy0wQ2KQ| . 2)
   (map . 2)
   (|first_Wic4yn2KQ| . 2)
   (|rest_WiWNnE4KQ| . 1)
   (|andmap_WiS7AW1KQ| . 2)
   (|xr_WieVrK3KQ| . 2)
   (|x_WiUYth3KQ| . 2)
   (cons . 2)
   (apply . 2)
   (|first_WiARpb4KQ| . 2)
   (|first_WiQiGz0KQ| . 3)
   (cdr . 3)
   (|first_WiCGjy5KQ| . 2)
   (car . 3)
   (|andmap_WigKl55KQ| . 2)
   (|x_WiYCh_5KQ| . 2)
   (|f_WiafE01KQ| . 4)
   (|first_Wiizfs6KQ| . 2)
   (|rest_WiumI60KQ| . 2)
   (null? . 4)
   (|t_WiwbCt1KQ| . 2))
  ((|andmap_WiS7AW1KQ| . 1)
   (|andmap_WigKl55KQ| . 1))
  (map cons apply cdr car null?)
  (#%define andmap
    (#%lambda #t
      (|f_WiafE01KQ|
        |first_WiQiGz0KQ|
        .
        |rest_WiumI60KQ|)
      ()
      ((#%lambda #t
         (|t_WiwbCt1KQ|)
         (|rest_WiumI60KQ|
           |first_WiQiGz0KQ|
           |f_WiafE01KQ|)
         (#%if |t_WiwbCt1KQ|
           |t_WiwbCt1KQ|
           (#%if (null? |rest_WiumI60KQ|)
             ((#%letrec #t
                ((|andmap_WigKl55KQ|
                   (#%lambda #t
                     (|first_WiCGjy5KQ|)
                     (|andmap_WigKl55KQ| |f_WiafE01KQ|)
                     ((#%lambda #t
                        (|x_WiYCh_5KQ| |first_Wiizfs6KQ|)
                        (|andmap_WigKl55KQ| |f_WiafE01KQ|)
                        (#%if (null? |first_Wiizfs6KQ|)
                          (|f_WiafE01KQ| |x_WiYCh_5KQ|)
                          (#%if (|f_WiafE01KQ| |x_WiYCh_5KQ|)
                            (|andmap_WigKl55KQ| |first_Wiizfs6KQ|)
                            #f)))
                      (car |first_WiCGjy5KQ|)
                      (cdr |first_WiCGjy5KQ|)))))
                (|f_WiafE01KQ|)
                |andmap_WigKl55KQ|)
              |first_WiQiGz0KQ|)
             ((#%letrec #t
                ((|andmap_WiS7AW1KQ|
                   (#%lambda #t
                     (|first_Wic4yn2KQ| |rest_Wiy0wQ2KQ|)
                     (|andmap_WiS7AW1KQ| |f_WiafE01KQ|)
                     ((#%lambda #t
                        (|x_WiUYth3KQ|
                          |xr_WieVrK3KQ|
                          |first_WiARpb4KQ|
                          |rest_WiWNnE4KQ|)
                        (|andmap_WiS7AW1KQ| |f_WiafE01KQ|)
                        (#%if (null? |first_WiARpb4KQ|)
                          (apply |f_WiafE01KQ|
                                 (cons |x_WiUYth3KQ| |xr_WieVrK3KQ|))
                          (#%if (apply |f_WiafE01KQ|
                                       (cons |x_WiUYth3KQ| |xr_WieVrK3KQ|))
                            (|andmap_WiS7AW1KQ|
                              |first_WiARpb4KQ|
                              |rest_WiWNnE4KQ|)
                            #f)))
                      (car |first_Wic4yn2KQ|)
                      (map car |rest_Wiy0wQ2KQ|)
                      (cdr |first_Wic4yn2KQ|)
                      (map cdr |rest_Wiy0wQ2KQ|)))))
                (|f_WiafE01KQ|)
                |andmap_WiS7AW1KQ|)
              |first_WiQiGz0KQ|
              |rest_WiumI60KQ|))))
       (null? |first_WiQiGz0KQ|)))))
(#%program
  ((gensym . 2)
   (symbol->string . 2)
   (string-append . 1)
   (string->symbol . 1)
   (|base_WiEvdV6KQ| . 2))
  ()
  (string->symbol
    gensym
    symbol->string
    string-append)
  (#%define gen-sym
    (#%lambda #t
      (|base_WiEvdV6KQ|)
      ()
      (#%if |base_WiEvdV6KQ|
        (string->symbol
          (string-append
            (symbol->string |base_WiEvdV6KQ|)
            "_"
            (symbol->string (gensym))))
        (gensym)))))
(#%program
  ((car . 1)
   (cdr . 1)
   (|proc_Wi-rbm7KQ| . 2)
   (ormap . 1)
   (|t_WiGk7g8KQ| . 2)
   (|list1_Wiko9P7KQ| . 3)
   (null? . 1))
  ()
  (ormap cdr car null?)
  (#%define ormap
    (#%lambda #t
      (|proc_Wi-rbm7KQ| |list1_Wiko9P7KQ|)
      ()
      (#%if (null? |list1_Wiko9P7KQ|)
        #f
        ((#%lambda #t
           (|t_WiGk7g8KQ|)
           (|list1_Wiko9P7KQ| |proc_Wi-rbm7KQ|)
           (#%if |t_WiGk7g8KQ|
             |t_WiGk7g8KQ|
             (ormap |proc_Wi-rbm7KQ| (cdr |list1_Wiko9P7KQ|))))
         (|proc_Wi-rbm7KQ| (car |list1_Wiko9P7KQ|)))))))
(#%program
  ((cons . 1)
   (cdr . 2)
   (remq . 2)
   (car . 2)
   (|o_Wi0h5J8KQ| . 3)
   (eq? . 1)
   (|lst_Wimd3a9KQ| . 5)
   (null? . 1))
  ()
  (car eq? cdr remq cons null?)
  (#%define remq
    (#%lambda #t
      (|o_Wi0h5J8KQ| |lst_Wimd3a9KQ|)
      ()
      (#%if (null? |lst_Wimd3a9KQ|)
        ()
        (#%if (eq? |o_Wi0h5J8KQ| (car |lst_Wimd3a9KQ|))
          (remq |o_Wi0h5J8KQ| (cdr |lst_Wimd3a9KQ|))
          (cons (car |lst_Wimd3a9KQ|)
                (remq |o_Wi0h5J8KQ| (cdr |lst_Wimd3a9KQ|))))))))
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
  ((|args_WiI91D9KQ| . 1) (error . 1) (apply . 1))
  ()
  (error apply)
  (#%define throw
    (#%lambda #t
      |args_WiI91D9KQ|
      ()
      (apply error |args_WiI91D9KQ|))))
(#%program
  ((newline . 1)
   (|args_Wi26_3aKQ| . 1)
   (|arg_Wio2ZwaKQ| . 1)
   (display . 2)
   (for-each . 1))
  ()
  (newline for-each display)
  (#%define error
    (#%lambda #t
      |args_Wi26_3aKQ|
      ()
      (#%begin
        (for-each
          (#%lambda #t
            (|arg_Wio2ZwaKQ|)
            ()
            (#%begin
              (display |arg_Wio2ZwaKQ|)
              (display #\space)))
          |args_Wi26_3aKQ|)
        (newline)))))
(#%program
  ((_make-native-parameter . 1))
  ()
  (_make-native-parameter)
  (#%define strict-r5rs-compliance
    (_make-native-parameter "strictR5RSCompliance")))
(#%program
  ((symbol? . 1) (|v_WiK-WZaKQ| . 2) (pair? . 1))
  ()
  (pair? symbol?)
  (#%define atom?
    (#%lambda #t
      (|v_WiK-WZaKQ|)
      ()
      (#%if (#%if (pair? |v_WiK-WZaKQ|)
              #t
              (symbol? |v_WiK-WZaKQ|))
        #f
        #t))))
(#%program
  ()
  ()
  ()
  (#%define make-false
    (#%lambda #t (|v_WiqTSTbKQ|) () #f)))
(#%program
  ((load-module . 1)
   (for-each . 1)
   (get-symbolic-environment . 1)
   (getprop . 1))
  ()
  (load-module
    for-each
    get-symbolic-environment
    getprop)
  (#%if (getprop
          (#%quote lite)
          (get-symbolic-environment (#%quote *sisc*)))
    #!void
    (for-each
      load-module
      (#%quote ("sisc.modules.SNative$Index")))))
