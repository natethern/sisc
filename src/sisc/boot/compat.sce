(#%program
  ((|%%_ii-VdOrUv_rest| . 2)
   (map . 2)
   (|%%_iiEZflrUv_first| . 2)
   (|%%_iimH5CtUv_rest| . 1)
   (|%%_iii1iUqUv_andmap| . 2)
   (|%%_iiGO9IsUv_xr| . 2)
   (|%%_iikSbfsUv_x| . 2)
   (cons . 2)
   (apply . 2)
   (|%%_ii0L79tUv_first| . 2)
   (|%%_iigcoxpUv_first| . 3)
   (cdr . 3)
   (|%%_ii2A1wuUv_first| . 2)
   (car . 3)
   (|%%_iiID33uUv_andmap| . 2)
   (|%%_iiow_YuUv_x| . 2)
   (|%%_iiC8m-pUv_f| . 4)
   (|%%_iiKsZpvUv_first| . 2)
   (|%%_iiWfq4pUv_rest| . 2)
   (null? . 4)
   (|%%_iiY4krqUv_t| . 2))
  ((|%%_iii1iUqUv_andmap| . 1)
   (|%%_iiID33uUv_andmap| . 1))
  (map cons apply cdr car null?)
  (#%define andmap
    (#%lambda #t
      (|%%_iiC8m-pUv_f|
        |%%_iigcoxpUv_first|
        .
        |%%_iiWfq4pUv_rest|)
      ()
      ((#%lambda #t
         (|%%_iiY4krqUv_t|)
         (|%%_iiWfq4pUv_rest|
           |%%_iigcoxpUv_first|
           |%%_iiC8m-pUv_f|)
         (#%if |%%_iiY4krqUv_t|
           |%%_iiY4krqUv_t|
           (#%if (null? |%%_iiWfq4pUv_rest|)
             ((#%letrec #t
                ((|%%_iiID33uUv_andmap|
                   (#%lambda #t
                     (|%%_ii2A1wuUv_first|)
                     (|%%_iiID33uUv_andmap| |%%_iiC8m-pUv_f|)
                     ((#%lambda #t
                        (|%%_iiow_YuUv_x| |%%_iiKsZpvUv_first|)
                        (|%%_iiID33uUv_andmap| |%%_iiC8m-pUv_f|)
                        (#%if (null? |%%_iiKsZpvUv_first|)
                          (|%%_iiC8m-pUv_f| |%%_iiow_YuUv_x|)
                          (#%if (|%%_iiC8m-pUv_f| |%%_iiow_YuUv_x|)
                            (|%%_iiID33uUv_andmap| |%%_iiKsZpvUv_first|)
                            #f)))
                      (car |%%_ii2A1wuUv_first|)
                      (cdr |%%_ii2A1wuUv_first|)))))
                (|%%_iiC8m-pUv_f|)
                |%%_iiID33uUv_andmap|)
              |%%_iigcoxpUv_first|)
             ((#%letrec #t
                ((|%%_iii1iUqUv_andmap|
                   (#%lambda #t
                     (|%%_iiEZflrUv_first| |%%_ii-VdOrUv_rest|)
                     (|%%_iii1iUqUv_andmap| |%%_iiC8m-pUv_f|)
                     ((#%lambda #t
                        (|%%_iikSbfsUv_x|
                          |%%_iiGO9IsUv_xr|
                          |%%_ii0L79tUv_first|
                          |%%_iimH5CtUv_rest|)
                        (|%%_iii1iUqUv_andmap| |%%_iiC8m-pUv_f|)
                        (#%if (null? |%%_ii0L79tUv_first|)
                          (apply |%%_iiC8m-pUv_f|
                                 (cons |%%_iikSbfsUv_x| |%%_iiGO9IsUv_xr|))
                          (#%if (apply |%%_iiC8m-pUv_f|
                                       (cons |%%_iikSbfsUv_x|
                                             |%%_iiGO9IsUv_xr|))
                            (|%%_iii1iUqUv_andmap|
                              |%%_ii0L79tUv_first|
                              |%%_iimH5CtUv_rest|)
                            #f)))
                      (car |%%_iiEZflrUv_first|)
                      (map car |%%_ii-VdOrUv_rest|)
                      (cdr |%%_iiEZflrUv_first|)
                      (map cdr |%%_ii-VdOrUv_rest|)))))
                (|%%_iiC8m-pUv_f|)
                |%%_iii1iUqUv_andmap|)
              |%%_iigcoxpUv_first|
              |%%_iiWfq4pUv_rest|))))
       (null? |%%_iigcoxpUv_first|)))))
(#%program
  ((gensym . 2)
   (symbol->string . 2)
   (string-append . 1)
   (string->symbol . 1)
   (|%%_ii4pXSvUv_base| . 2))
  ()
  (string->symbol
    symbol->string
    gensym
    string-append)
  (#%define gen-sym
    (#%lambda #t
      (|%%_ii4pXSvUv_base|)
      ()
      (#%if |%%_ii4pXSvUv_base|
        (string->symbol
          (string-append
            (symbol->string (gensym))
            "_"
            (symbol->string |%%_ii4pXSvUv_base|)))
        (gensym)))))
(#%program
  ((car . 1)
   (cdr . 1)
   (|%%_iiqlVjwUv_proc| . 2)
   (ormap . 1)
   (|%%_ii6eRdxUv_t| . 2)
   (|%%_iiMhTMwUv_list1| . 3)
   (null? . 1))
  ()
  (ormap cdr car null?)
  (#%define ormap
    (#%lambda #t
      (|%%_iiqlVjwUv_proc| |%%_iiMhTMwUv_list1|)
      ()
      (#%if (null? |%%_iiMhTMwUv_list1|)
        #f
        ((#%lambda #t
           (|%%_ii6eRdxUv_t|)
           (|%%_iiMhTMwUv_list1| |%%_iiqlVjwUv_proc|)
           (#%if |%%_ii6eRdxUv_t|
             |%%_ii6eRdxUv_t|
             (ormap |%%_iiqlVjwUv_proc|
                    (cdr |%%_iiMhTMwUv_list1|))))
         (|%%_iiqlVjwUv_proc| (car |%%_iiMhTMwUv_list1|)))))))
(#%program
  ((cons . 1)
   (cdr . 2)
   (remq . 2)
   (car . 2)
   (|%%_iisaPGxUv_o| . 3)
   (eq? . 1)
   (|%%_iiO6N7yUv_lst| . 5)
   (null? . 1))
  ()
  (car eq? cdr remq cons null?)
  (#%define remq
    (#%lambda #t
      (|%%_iisaPGxUv_o| |%%_iiO6N7yUv_lst|)
      ()
      (#%if (null? |%%_iiO6N7yUv_lst|)
        ()
        (#%if (eq? |%%_iisaPGxUv_o| (car |%%_iiO6N7yUv_lst|))
          (remq |%%_iisaPGxUv_o| (cdr |%%_iiO6N7yUv_lst|))
          (cons (car |%%_iiO6N7yUv_lst|)
                (remq |%%_iisaPGxUv_o| (cdr |%%_iiO6N7yUv_lst|))))))))
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
  ((|%%_ii83LAyUv_args| . 1)
   (error . 1)
   (apply . 1))
  ()
  (error apply)
  (#%define throw
    (#%lambda #t
      |%%_ii83LAyUv_args|
      ()
      (apply error |%%_ii83LAyUv_args|))))
(#%program
  ((newline . 1)
   (|%%_iiu_I1zUv_args| . 1)
   (|%%_iiQXGuzUv_arg| . 1)
   (display . 2)
   (for-each . 1))
  ()
  (newline for-each display)
  (#%define error
    (#%lambda #t
      |%%_iiu_I1zUv_args|
      ()
      (#%begin
        (for-each
          (#%lambda #t
            (|%%_iiQXGuzUv_arg|)
            ()
            (#%begin
              (display |%%_iiQXGuzUv_arg|)
              (display #\space)))
          |%%_iiu_I1zUv_args|)
        (newline)))))
(#%program
  ((_make-native-parameter . 1))
  ()
  (_make-native-parameter)
  (#%define strict-r5rs-compliance
    (_make-native-parameter "strictR5RSCompliance")))
(#%program
  ((symbol? . 1)
   (|%%_iiaUEXzUv_v| . 2)
   (pair? . 1))
  ()
  (pair? symbol?)
  (#%define atom?
    (#%lambda #t
      (|%%_iiaUEXzUv_v|)
      ()
      (#%if (#%if (pair? |%%_iiaUEXzUv_v|)
              #t
              (symbol? |%%_iiaUEXzUv_v|))
        #f
        #t))))
(#%program
  ()
  ()
  ()
  (#%define make-false
    (#%lambda #t (|%%_iiSMARAUv_v|) () #f)))
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
      (#%quote ("sisc.modules.OptionalPrimitives$Index")))))
