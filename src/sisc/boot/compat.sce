(#%program
  ((|x_PizjrzPNw| . 2)
   (|andmap_PitQJuLNw| . 2)
   (|andmap_PiTqvFONw| . 2)
   (|xr_PiRBBiNNw| . 2)
   (|first_PibyzLNNw| . 2)
   (car . 3)
   (|first_Pir_P7KNw| . 3)
   (|first_Pidnt6PNw| . 2)
   (|f_PiNXNAKNw| . 4)
   (|first_PiPMHXLNw| . 2)
   (apply . 2)
   (|x_PivFDRMNw| . 2)
   (|rest_Pi53SGJNw| . 2)
   (|first_PiVfp0QNw| . 2)
   (cdr . 3)
   (cons . 2)
   (|rest_PixuxcONw| . 1)
   (|t_Pi7UL1LNw| . 2)
   (map . 2)
   (|rest_Pi9JFoMNw| . 2)
   (null? . 4))
  ((|andmap_PitQJuLNw| . 1)
   (|andmap_PiTqvFONw| . 1))
  (cdr cons map null? car apply)
  (#%define andmap
    (#%lambda #t
      (|f_PiNXNAKNw|
        |first_Pir_P7KNw|
        .
        |rest_Pi53SGJNw|)
      ()
      ((#%lambda #t
         (|t_Pi7UL1LNw|)
         (|f_PiNXNAKNw|
           |first_Pir_P7KNw|
           |rest_Pi53SGJNw|)
         (#%if |t_Pi7UL1LNw|
           |t_Pi7UL1LNw|
           (#%if (null? |rest_Pi53SGJNw|)
             ((#%letrec #t
                ((|andmap_PiTqvFONw|
                   (#%lambda #t
                     (|first_Pidnt6PNw|)
                     (|andmap_PiTqvFONw| |f_PiNXNAKNw|)
                     ((#%lambda #t
                        (|x_PizjrzPNw| |first_PiVfp0QNw|)
                        (|andmap_PiTqvFONw| |f_PiNXNAKNw|)
                        (#%if (null? |first_PiVfp0QNw|)
                          (|f_PiNXNAKNw| |x_PizjrzPNw|)
                          (#%if (|f_PiNXNAKNw| |x_PizjrzPNw|)
                            (|andmap_PiTqvFONw| |first_PiVfp0QNw|)
                            #f)))
                      (car |first_Pidnt6PNw|)
                      (cdr |first_Pidnt6PNw|)))))
                (|f_PiNXNAKNw|)
                |andmap_PiTqvFONw|)
              |first_Pir_P7KNw|)
             ((#%letrec #t
                ((|andmap_PitQJuLNw|
                   (#%lambda #t
                     (|first_PiPMHXLNw| |rest_Pi9JFoMNw|)
                     (|andmap_PitQJuLNw| |f_PiNXNAKNw|)
                     ((#%lambda #t
                        (|x_PivFDRMNw|
                          |xr_PiRBBiNNw|
                          |first_PibyzLNNw|
                          |rest_PixuxcONw|)
                        (|andmap_PitQJuLNw| |f_PiNXNAKNw|)
                        (#%if (null? |first_PibyzLNNw|)
                          (apply |f_PiNXNAKNw|
                                 (cons |x_PivFDRMNw| |xr_PiRBBiNNw|))
                          (#%if (apply |f_PiNXNAKNw|
                                       (cons |x_PivFDRMNw| |xr_PiRBBiNNw|))
                            (|andmap_PitQJuLNw|
                              |first_PibyzLNNw|
                              |rest_PixuxcONw|)
                            #f)))
                      (car |first_PiPMHXLNw|)
                      (map car |rest_Pi9JFoMNw|)
                      (cdr |first_PiPMHXLNw|)
                      (map cdr |rest_Pi9JFoMNw|)))))
                (|f_PiNXNAKNw|)
                |andmap_PitQJuLNw|)
              |first_Pir_P7KNw|
              |rest_Pi53SGJNw|))))
       (null? |first_Pir_P7KNw|)))))
(#%program
  ((|base_PifcntQNw| . 2)
   (gensym . 2)
   (string->symbol . 1)
   (string-append . 1)
   (symbol->string . 2))
  ()
  (gensym
    string->symbol
    string-append
    symbol->string)
  (#%define gen-sym
    (#%lambda #t
      (|base_PifcntQNw|)
      ()
      (#%if |base_PifcntQNw|
        (string->symbol
          (string-append
            (symbol->string |base_PifcntQNw|)
            "_"
            (symbol->string (gensym))))
        (gensym)))))
(#%program
  ((not . 1)
   (|list1_PiX4jnRNw| . 3)
   (ormap . 1)
   (|t_Pih1hQRNw| . 2)
   (cdr . 1)
   (null? . 1)
   (|proc_PiB8lWQNw| . 2)
   (car . 1))
  ()
  (not ormap cdr null? car)
  (#%define ormap
    (#%lambda #t
      (|proc_PiB8lWQNw| |list1_PiX4jnRNw|)
      ()
      (#%if (null? |list1_PiX4jnRNw|)
        #f
        ((#%lambda #t
           (|t_Pih1hQRNw|)
           (|proc_PiB8lWQNw| |list1_PiX4jnRNw|)
           (#%if |t_Pih1hQRNw|
             |t_Pih1hQRNw|
             (ormap |proc_PiB8lWQNw| (cdr |list1_PiX4jnRNw|))))
         (|proc_PiB8lWQNw| (car |list1_PiX4jnRNw|)))))))
(#%program
  ((|lst_PiZVcKSNw| . 5)
   (|o_PiDZehSNw| . 3)
   (cdr . 2)
   (cons . 1)
   (null? . 1)
   (remq . 2)
   (eq? . 1)
   (car . 2))
  ()
  (cdr cons null? remq car eq?)
  (#%define remq
    (#%lambda #t
      (|o_PiDZehSNw| |lst_PiZVcKSNw|)
      ()
      (#%if (null? |lst_PiZVcKSNw|)
        ()
        (#%if (eq? |o_PiDZehSNw| (car |lst_PiZVcKSNw|))
          (remq |o_PiDZehSNw| (cdr |lst_PiZVcKSNw|))
          (cons (car |lst_PiZVcKSNw|)
                (remq |o_PiDZehSNw| (cdr |lst_PiZVcKSNw|))))))))
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
  ((|args_PijSabTNw| . 1) (error . 1) (apply . 1))
  ()
  (error apply)
  (#%define throw
    (#%lambda #t
      |args_PijSabTNw|
      ()
      (apply error |args_PijSabTNw|))))
(#%program
  ((for-each . 1)
   (|arg_Pi_K65UNw| . 1)
   (newline . 1)
   (display . 2)
   (|args_PiFO8ETNw| . 1))
  ()
  (for-each newline display)
  (#%define error
    (#%lambda #t
      |args_PiFO8ETNw|
      ()
      (#%begin
        (for-each
          (#%lambda #t
            (|arg_Pi_K65UNw|)
            ()
            (#%begin
              (display |arg_Pi_K65UNw|)
              (display #\space)))
          |args_PiFO8ETNw|)
        (newline)))))
(#%program
  ((_make-native-parameter . 1))
  ()
  ()
  (#%define strict-r5rs-compliance
    (_make-native-parameter "strictR5RSCompliance")))
(#%program
  ((not . 1)
   (pair? . 1)
   (|v_PilH4yUNw| . 2)
   (|t_PiHD2_UNw| . 2)
   (symbol? . 1))
  ()
  (not pair? symbol?)
  (#%define atom?
    (#%lambda #t
      (|v_PilH4yUNw|)
      ()
      (#%if ((#%lambda #t
               (|t_PiHD2_UNw|)
               (|v_PilH4yUNw|)
               (#%if |t_PiHD2_UNw|
                 |t_PiHD2_UNw|
                 (symbol? |v_PilH4yUNw|)))
             (pair? |v_PilH4yUNw|))
        #f
        #t))))
(#%program
  ()
  ()
  ()
  (#%define make-false
    (#%lambda #t (|v_Pi1A0sVNw|) () #f)))
(#%program
  ((not . 1)
   (for-each . 1)
   (getprop . 1)
   (get-symbolic-environment . 1)
   (load-module . 1))
  ()
  ()
  (#%if (getprop
          (#%quote lite)
          (get-symbolic-environment (#%quote *sisc*)))
    #!void
    (for-each
      load-module
      (#%quote ("sisc.modules.SNative$Index")))))
