#!void
(#%define for-each
  (#%lambda (|proc_u_TCelEA51|
             |ls1_u_xGgUDA51|
             .
             |lists_u_bKirDA51|)
    (#%if (null? |ls1_u_xGgUDA51|)
      #!void
      (#%begin
        (#%set! |lists_u_bKirDA51|
          (cons |ls1_u_xGgUDA51| |lists_u_bKirDA51|))
        (apply |proc_u_TCelEA51|
               (map-car |lists_u_bKirDA51|))
        (apply for-each
               |proc_u_TCelEA51|
               (map-cdr |lists_u_bKirDA51|))))))
(#%define eof-object?
  (#%lambda (|x_u_dzcOEA51|)
    (eq? |x_u_dzcOEA51| #!eof)))
(#%define not
  (#%lambda (|x_u_zvafFA51|)
    (#%if |x_u_zvafFA51| #f #t)))
(#%define newline
  (#%lambda |port_u_Vr8IFA51|
    (apply display #\newline |port_u_Vr8IFA51|)))
(#%define reverse
  (#%letrec ((|iter_u_fo69GA51|
               (#%lambda (|ls_u_Xg23HA51| |acc_u_hd0wHA51|)
                 (#%if (null? |ls_u_Xg23HA51|)
                   |acc_u_hd0wHA51|
                   (|iter_u_fo69GA51|
                     (cdr |ls_u_Xg23HA51|)
                     (cons (car |ls_u_Xg23HA51|) |acc_u_hd0wHA51|))))))
    (#%lambda (|ls_u_Bk4CGA51|)
      (|iter_u_fo69GA51| |ls_u_Bk4CGA51| ()))))
(#%define reverse!
  (#%letrec ((|iter_u_D9-YHA51|
               (#%lambda (|s_u_j2WSIA51| |r_u_F-TjJA51|)
                 (#%if (null? |s_u_j2WSIA51|)
                   |r_u_F-TjJA51|
                   ((#%lambda (|d_u__WRMJA51|)
                      (#%begin
                        (set-cdr! |s_u_j2WSIA51| |r_u_F-TjJA51|)
                        (|iter_u_D9-YHA51| |d_u__WRMJA51| |s_u_j2WSIA51|)))
                    (cdr |s_u_j2WSIA51|))))))
    (#%lambda (|s_u_Z5YpIA51|)
      (|iter_u_D9-YHA51| |s_u_Z5YpIA51| ()))))
(#%define map-car
  (#%lambda (|ls_u_lTPdKA51|)
    (#%if (null? |ls_u_lTPdKA51|)
      ()
      (cons (caar |ls_u_lTPdKA51|)
            (map-car (cdr |ls_u_lTPdKA51|))))))
(#%define map-cdr
  (#%lambda (|ls_u_HPNGKA51|)
    (#%if (null? |ls_u_HPNGKA51|)
      ()
      (cons (cdar |ls_u_HPNGKA51|)
            (map-cdr (cdr |ls_u_HPNGKA51|))))))
(#%define map
  (#%letrec ((|map1_u_1ML7LA51|
               (#%lambda (|proc_u_LtBoNA51|
                          |list_u_5qzRNA51|
                          |acc_u_rmxiOA51|)
                 (#%if (null? |list_u_5qzRNA51|)
                   (reverse |acc_u_rmxiOA51|)
                   (|map1_u_1ML7LA51|
                     |proc_u_LtBoNA51|
                     (cdr |list_u_5qzRNA51|)
                     (cons (|proc_u_LtBoNA51| (car |list_u_5qzRNA51|))
                           |acc_u_rmxiOA51|)))))
             (|loop_u_nIJALA51|
               (#%lambda (|proc_u_NivLOA51|
                          |list1_u_7ftcPA51|
                          |lists_u_tbrFPA51|
                          |c_u_P7p6QA51|)
                 (#%if (null? |list1_u_7ftcPA51|)
                   (reverse |c_u_P7p6QA51|)
                   (|loop_u_nIJALA51|
                     |proc_u_NivLOA51|
                     (cdr |list1_u_7ftcPA51|)
                     (map-cdr |lists_u_tbrFPA51|)
                     (cons (apply |proc_u_NivLOA51|
                                  (car |list1_u_7ftcPA51|)
                                  (map-car |lists_u_tbrFPA51|))
                           |c_u_P7p6QA51|))))))
    (#%lambda (|proc_u_pxDXMA51|
               |list1_u_3BFuMA51|
               .
               |lists_u_JEH1MA51|)
      (#%if (null? |lists_u_JEH1MA51|)
        (|map1_u_1ML7LA51|
          |proc_u_pxDXMA51|
          |list1_u_3BFuMA51|
          ())
        (|loop_u_nIJALA51|
          |proc_u_pxDXMA51|
          |list1_u_3BFuMA51|
          |lists_u_JEH1MA51|
          ())))))
(#%define compose2
  (#%lambda (|f_u_94nzQA51| |g_u_v0l0RA51|)
    (#%lambda (|x_u_RYitRA51|)
      (|f_u_94nzQA51| (|g_u_v0l0RA51| |x_u_RYitRA51|)))))
(#%define assq (void))
(#%define assv (void))
(#%define assoc (void))
(#%define memq (void))
(#%define memv (void))
(#%define member (void))
(#%letrec ((|assn_u_bVgWRA51|
             (#%lambda (|n_u__5QfYA51|
                        |obj_u_l2OIYA51|
                        |alist_u_H-L9ZA51|)
               (#%if (null? |alist_u_H-L9ZA51|)
                 #f
                 (#%if (|n_u__5QfYA51|
                         (caar |alist_u_H-L9ZA51|)
                         |obj_u_l2OIYA51|)
                   (car |alist_u_H-L9ZA51|)
                   (|assn_u_bVgWRA51|
                     |n_u__5QfYA51|
                     |obj_u_l2OIYA51|
                     (cdr |alist_u_H-L9ZA51|))))))
           (|memn_u_xRenSA51|
             (#%lambda (|n_u_1XJCZA51|
                        |obj_u_nTH3-A51|
                        |list_u_JPFw-A51|)
               (#%if (null? |list_u_JPFw-A51|)
                 #f
                 (#%if (|n_u_1XJCZA51|
                         (car |list_u_JPFw-A51|)
                         |obj_u_nTH3-A51|)
                   |list_u_JPFw-A51|
                   (|memn_u_xRenSA51|
                     |n_u_1XJCZA51|
                     |obj_u_nTH3-A51|
                     (cdr |list_u_JPFw-A51|)))))))
  (#%begin
    (#%set! assq
      (#%lambda (|obj_u_TNcQSA51| |alist_u_dKahTA51|)
        (|assn_u_bVgWRA51|
          eq?
          |obj_u_TNcQSA51|
          |alist_u_dKahTA51|)))
    (#%set! assv
      (#%lambda (|obj_u_zG8KTA51| |alist_u_VC6bUA51|)
        (|assn_u_bVgWRA51|
          eqv?
          |obj_u_zG8KTA51|
          |alist_u_VC6bUA51|)))
    (#%set! assoc
      (#%lambda (|obj_u_fz4EUA51| |alist_u_Bv25VA51|)
        (|assn_u_bVgWRA51|
          equal?
          |obj_u_fz4EUA51|
          |alist_u_Bv25VA51|)))
    (#%set! memq
      (#%lambda (|obj_u_Xr0yVA51| |list_u_ho--VA51|)
        (|memn_u_xRenSA51|
          eq?
          |obj_u_Xr0yVA51|
          |list_u_ho--VA51|)))
    (#%set! memv
      (#%lambda (|obj_u_DkYrWA51| |list_u_ZgWUWA51|)
        (|memn_u_xRenSA51|
          eqv?
          |obj_u_DkYrWA51|
          |list_u_ZgWUWA51|)))
    (#%set! member
      (#%lambda (|obj_u_jdUlXA51| |list_u_F9SOXA51|)
        (|memn_u_xRenSA51|
          equal?
          |obj_u_jdUlXA51|
          |list_u_F9SOXA51|)))))
(#%define cadr (compose2 car cdr))
(#%define cdar (compose2 cdr car))
(#%define cddr (compose2 cdr cdr))
(#%define caar (compose2 car car))
(#%define caaar (compose2 car caar))
(#%define caadr (compose2 car cadr))
(#%define cadar (compose2 car cdar))
(#%define caddr (compose2 car cddr))
(#%define cdaar (compose2 cdr caar))
(#%define cdadr (compose2 cdr cadr))
(#%define cddar (compose2 cdr cdar))
(#%define cdddr (compose2 cdr cddr))
(#%define caaaar (compose2 car caaar))
(#%define caaadr (compose2 car caadr))
(#%define caadar (compose2 car cadar))
(#%define caaddr (compose2 car caddr))
(#%define cadaar (compose2 car cdaar))
(#%define cadadr (compose2 car cdadr))
(#%define caddar (compose2 car cddar))
(#%define cadddr (compose2 car cdddr))
(#%define cdaaar (compose2 cdr caaar))
(#%define cdaadr (compose2 cdr caadr))
(#%define cdadar (compose2 cdr cadar))
(#%define cdaddr (compose2 cdr caddr))
(#%define cddaar (compose2 cdr cdaar))
(#%define cddadr (compose2 cdr cdadr))
(#%define cdddar (compose2 cdr cddar))
(#%define cddddr (compose2 cdr cdddr))
(#%define append2
  (#%lambda (|ls1_u_3MDZ-A51| |ls2_u_pIBq_A51|)
    (#%if (null? |ls1_u_3MDZ-A51|)
      |ls2_u_pIBq_A51|
      (cons (car |ls1_u_3MDZ-A51|)
            (append2 (cdr |ls1_u_3MDZ-A51|) |ls2_u_pIBq_A51|)))))
(#%define append append2)
(#%define list->string
  (#%letrec ((|l2s_u_LEzT_A51|
               (#%lambda (|l_u_rxvN0B51| |s_u_Ntte1B51| |n_u_7qrH1B51|)
                 (#%if (null? |l_u_rxvN0B51|)
                   |s_u_Ntte1B51|
                   (#%begin
                     (string-set!
                       |s_u_Ntte1B51|
                       |n_u_7qrH1B51|
                       (car |l_u_rxvN0B51|))
                     (|l2s_u_LEzT_A51|
                       (cdr |l_u_rxvN0B51|)
                       |s_u_Ntte1B51|
                       (+ |n_u_7qrH1B51| 1)))))))
    (#%lambda (|l_u_5Bxk0B51|)
      (|l2s_u_LEzT_A51|
        |l_u_5Bxk0B51|
        (make-string (length |l_u_5Bxk0B51|))
        0))))
(#%define string->list
  (#%letrec ((|s2l_u_tmp82B51|
               (#%lambda (|s_u_9fl23B51| |h_u_vbjv3B51| |n_u_R7hY3B51|)
                 (#%if (< |n_u_R7hY3B51| 0)
                   |h_u_vbjv3B51|
                   (|s2l_u_tmp82B51|
                     |s_u_9fl23B51|
                     (cons (string-ref |s_u_9fl23B51| |n_u_R7hY3B51|)
                           |h_u_vbjv3B51|)
                     (- |n_u_R7hY3B51| 1))))))
    (#%lambda (|s_u_PinB2B51|)
      (|s2l_u_tmp82B51|
        |s_u_PinB2B51|
        ()
        (- (string-length |s_u_PinB2B51|) 1)))))
(#%define list->vector
  (#%letrec ((|l2v_u_b4fp4B51|
               (#%lambda (|l_u_TYaj5B51| |v_u_dV8M5B51| |n_u_zR6d6B51|)
                 (#%if (null? |l_u_TYaj5B51|)
                   |v_u_dV8M5B51|
                   (#%begin
                     (vector-set!
                       |v_u_dV8M5B51|
                       |n_u_zR6d6B51|
                       (car |l_u_TYaj5B51|))
                     (|l2v_u_b4fp4B51|
                       (cdr |l_u_TYaj5B51|)
                       |v_u_dV8M5B51|
                       (+ |n_u_zR6d6B51| 1)))))))
    (#%lambda (|l_u_x0dS4B51|)
      (#%if (proper-list? |l_u_x0dS4B51|)
        (|l2v_u_b4fp4B51|
          |l_u_x0dS4B51|
          (make-vector (length |l_u_x0dS4B51|))
          0)
        (error (#%quote list->vector)
               "can only convert a proper list."
               |l_u_x0dS4B51|)))))
(#%define vector
  (#%lambda |elems_u_VN4G6B51|
    (list->vector |elems_u_VN4G6B51|)))
(#%define string
  (#%lambda |elems_u_fK277B51|
    (list->string |elems_u_fK277B51|)))
(#%define current-url (_make-parameter "file:."))
(#%define current-directory
  (#%lambda |rest_u_BG0A7B51|
    (#%if (null? |rest_u_BG0A7B51|)
      (normalize-url (current-url) ".")
      (current-url
        (normalize-url
          (current-url)
          ((#%lambda (|v_u_XC-08B51|)
             ((#%lambda (|l_u_hzYt8B51|)
                (#%if (eqv? (string-ref |v_u_XC-08B51| (- |l_u_hzYt8B51| 1))
                            #\/)
                  |v_u_XC-08B51|
                  (string-append |v_u_XC-08B51| "/")))
              (string-length |v_u_XC-08B51|)))
           (car |rest_u_BG0A7B51|)))))))
(#%define file-handler (void))
(#%define add-file-handler (void))
((#%lambda (|*file-handlers*_u_DvWW8B51|)
   (#%begin
     (#%set! add-file-handler
       (#%lambda (|extension_u_ZrUn9B51| |thunk_u_joSQ9B51|)
         (#%if (assq |extension_u_ZrUn9B51|
                     |*file-handlers*_u_DvWW8B51|)
           #!void
           (#%set! |*file-handlers*_u_DvWW8B51|
             (cons (cons |extension_u_ZrUn9B51| |thunk_u_joSQ9B51|)
                   |*file-handlers*_u_DvWW8B51|)))))
     (#%set! file-handler
       ((#%lambda (|_load_u_FkQhaB51|)
          (#%lambda (|extension_u__gOKaB51|)
            ((#%lambda (|t_u_ldMbbB51|)
               (#%if |t_u_ldMbbB51|
                 (cdr |t_u_ldMbbB51|)
                 |_load_u_FkQhaB51|))
             (assq (string->symbol
                     (string-downcase |extension_u__gOKaB51|))
                   |*file-handlers*_u_DvWW8B51|))))
        load))))
 ())
(#%define make-io-proc
  (#%lambda (|proc_u_H9KEbB51|)
    (#%lambda (|file_u_n2GycB51| . |rest_u_16I5cB51|)
      (apply |proc_u_H9KEbB51|
             (normalize-url (current-url) |file_u_n2GycB51|)
             |rest_u_16I5cB51|))))
((#%lambda (|file-extension_u_J-D_cB51|)
   (#%begin
     (#%set! open-input-file
       (make-io-proc open-input-file))
     (#%set! open-source-input-file
       (make-io-proc open-source-input-file))
     (#%set! open-output-file
       (make-io-proc open-output-file))
     (#%set! load
       (#%lambda (|file_u_3XBsdB51|)
         (#%begin
           ((#%lambda (|previous-url_u_pTzVdB51|)
              (#%begin
                (current-url
                  (normalize-url
                    |previous-url_u_pTzVdB51|
                    |file_u_3XBsdB51|))
                (with-failure-continuation
                  (#%lambda (|m_u_LPxmeB51| |e_u_5MvPeB51|)
                    (#%begin
                      (current-url |previous-url_u_pTzVdB51|)
                      (call-with-failure-continuation
                        (#%lambda (|fk_u_rItgfB51|)
                          (|fk_u_rItgfB51| |m_u_LPxmeB51| |e_u_5MvPeB51|)))))
                  (#%lambda ()
                    ((#%lambda (|fe_u_NErJfB51|)
                       ((file-handler
                          (#%if |fe_u_NErJfB51| |fe_u_NErJfB51| "scm"))
                        (current-url)))
                     (|file-extension_u_J-D_cB51| (current-url)))))
                (current-url |previous-url_u_pTzVdB51|)))
            (current-url))
           (void))))))
 (#%lambda (|url_u_7BpagB51|)
   ((#%letrec ((|loop_u_txnDgB51|
                 (#%lambda (|x_u_Ptl4hB51| |acc_u_9qjxhB51|)
                   (#%if (null? |x_u_Ptl4hB51|)
                     #f
                     (#%if (equal? (car |x_u_Ptl4hB51|) #\.)
                       (list->string |acc_u_9qjxhB51|)
                       (|loop_u_txnDgB51|
                         (cdr |x_u_Ptl4hB51|)
                         (cons (car |x_u_Ptl4hB51|) |acc_u_9qjxhB51|)))))))
      |loop_u_txnDgB51|)
    (reverse! (string->list |url_u_7BpagB51|))
    ())))
(#%define load-module
  (#%lambda (|str_u_vmh-hB51|)
    ((#%lambda (|nl_u_RifriB51|)
       ((#%lambda (|binding-names_u_bfdUiB51|)
          (for-each
            (#%lambda (|name_u_xbbljB51|)
              (putprop
                |name_u_xbbljB51|
                (native-library-binding
                  |nl_u_RifriB51|
                  |name_u_xbbljB51|)))
            |binding-names_u_bfdUiB51|))
        (native-library-binding-names |nl_u_RifriB51|)))
     (load-native-library |str_u_vmh-hB51|))))
(#%define append
  (#%letrec ((|real-append_u_T79OjB51|
               (#%lambda (|ls1_u_VY29lB51| . |lses_u_z05IkB51|)
                 (#%if (null? |lses_u_z05IkB51|)
                   |ls1_u_VY29lB51|
                   (#%if (null? |ls1_u_VY29lB51|)
                     (apply |real-append_u_T79OjB51|
                            |lses_u_z05IkB51|)
                     (apply |real-append_u_T79OjB51|
                            (append2
                              |ls1_u_VY29lB51|
                              (car |lses_u_z05IkB51|))
                            (cdr |lses_u_z05IkB51|)))))))
    (#%lambda |lses_u_d47fkB51|
      (#%if (null? |lses_u_d47fkB51|)
        ()
        (#%if (null? (cdr |lses_u_d47fkB51|))
          (car |lses_u_d47fkB51|)
          (apply |real-append_u_T79OjB51|
                 (car |lses_u_d47fkB51|)
                 (cdr |lses_u_d47fkB51|)))))))
(#%define proper-list?
  (#%lambda (|x_u_fV0ClB51|)
    ((#%letrec ((|lp_u_BR-2mB51|
                  (#%lambda (|x_u_XNYvmB51| |lag_u_hKWYmB51|)
                    (#%if (pair? |x_u_XNYvmB51|)
                      ((#%lambda (|x_u_DGUpnB51|)
                         (#%if (pair? |x_u_DGUpnB51|)
                           ((#%lambda (|x_u_ZCSSnB51| |lag_u_jzQjoB51|)
                              (#%if (eq? |x_u_ZCSSnB51| |lag_u_jzQjoB51|)
                                #f
                                (|lp_u_BR-2mB51|
                                  |x_u_ZCSSnB51|
                                  |lag_u_jzQjoB51|)))
                            (cdr |x_u_DGUpnB51|)
                            (cdr |lag_u_hKWYmB51|))
                           (null? |x_u_DGUpnB51|)))
                       (cdr |x_u_XNYvmB51|))
                      (null? |x_u_XNYvmB51|)))))
       |lp_u_BR-2mB51|)
     |x_u_fV0ClB51|
     |x_u_fV0ClB51|)))
(#%define list? proper-list?)
(#%define expt
  (#%letrec ((|general-expt_u_FvOMoB51|
               (#%lambda (|base_u_ndE1rB51| |exponent_u_J9CurB51|)
                 (exp (* |exponent_u_J9CurB51| (log |base_u_ndE1rB51|)))))
             (|rational-expt_u__rMdpB51|
               (#%lambda (|base-numerator_u_36AXrB51|
                          |base-denominator_u_p2yosB51|
                          |exponent_u_L-vRsB51|)
                 (/ (expt |base-numerator_u_36AXrB51|
                          |exponent_u_L-vRsB51|)
                    (expt |base-denominator_u_p2yosB51|
                          |exponent_u_L-vRsB51|))))
             (|integer-expt_u_loKGpB51|
               (#%lambda (|base_u_5XtitB51| |exponent_u_rTrLtB51|)
                 (#%if (negative? |exponent_u_rTrLtB51|)
                   (/ (|integer-expt_u_loKGpB51|
                        |base_u_5XtitB51|
                        (abs |exponent_u_rTrLtB51|)))
                   (#%if (#%if (exact? |base_u_5XtitB51|)
                           (= |base_u_5XtitB51| 2)
                           #f)
                     (ashl 1 |exponent_u_rTrLtB51|)
                     ((#%letrec ((|loop_u_NPpcuB51|
                                   (#%lambda (|rest_u_7MnFuB51|
                                              |result_u_tIl6vB51|
                                              |squaring_u_PEjzvB51|)
                                     (#%if (zero? |rest_u_7MnFuB51|)
                                       |result_u_tIl6vB51|
                                       (|loop_u_NPpcuB51|
                                         (quotient |rest_u_7MnFuB51| 2)
                                         (#%if (odd? |rest_u_7MnFuB51|)
                                           (* |result_u_tIl6vB51|
                                              |squaring_u_PEjzvB51|)
                                           |result_u_tIl6vB51|)
                                         (* |squaring_u_PEjzvB51|
                                            |squaring_u_PEjzvB51|))))))
                        |loop_u_NPpcuB51|)
                      |exponent_u_rTrLtB51|
                      1
                      |base_u_5XtitB51|))))))
    (#%lambda (|base_u_HkI7qB51| |exponent_u_1hGAqB51|)
      (#%if (zero? |exponent_u_1hGAqB51|)
        (#%if (exact? |exponent_u_1hGAqB51|) 1 1.0)
        (#%if (zero? |base_u_HkI7qB51|)
          (#%if (exact? |exponent_u_1hGAqB51|)
            |base_u_HkI7qB51|
            0.0)
          (#%if (#%if (exact? |base_u_HkI7qB51|)
                  (#%if (rational? |base_u_HkI7qB51|)
                    (#%if (integer? |base_u_HkI7qB51|) #f #t)
                    #f)
                  #f)
            (|rational-expt_u__rMdpB51|
              (numerator |base_u_HkI7qB51|)
              (denominator |base_u_HkI7qB51|)
              |exponent_u_1hGAqB51|)
            (#%if (#%if (exact? |exponent_u_1hGAqB51|)
                    (integer? |exponent_u_1hGAqB51|)
                    #f)
              (|integer-expt_u_loKGpB51|
                |base_u_HkI7qB51|
                |exponent_u_1hGAqB51|)
              (|general-expt_u_FvOMoB51|
                |base_u_HkI7qB51|
                |exponent_u_1hGAqB51|))))))))
(#%define modpow
  (#%lambda (|x_u_9Bh0wB51| |y_u_vxftwB51| |n_u_RtdWwB51|)
    (#%if (= |y_u_vxftwB51| 1)
      (modulo |x_u_9Bh0wB51| |n_u_RtdWwB51|)
      (#%if (even? |y_u_vxftwB51|)
        ((#%lambda (|tmp_u_Ti7hyB51|)
           (modulo
             (* |tmp_u_Ti7hyB51| |tmp_u_Ti7hyB51|)
             |n_u_RtdWwB51|))
         (modpow
           |x_u_9Bh0wB51|
           (/ |y_u_vxftwB51| 2)
           |n_u_RtdWwB51|))
        ((#%lambda (|tmp_u_xm9QxB51|)
           (#%begin
             (#%set! |tmp_u_xm9QxB51|
               (modulo
                 (* |tmp_u_xm9QxB51| |tmp_u_xm9QxB51|)
                 |n_u_RtdWwB51|))
             (modulo
               (* |x_u_9Bh0wB51| |tmp_u_xm9QxB51|)
               |n_u_RtdWwB51|)))
         (modpow
           |x_u_9Bh0wB51|
           (/ (- |y_u_vxftwB51| 1) 2)
           |n_u_RtdWwB51|))))))
(#%define integer?
  ((#%lambda (|oldint?_u_df5KyB51|)
     (#%lambda (|n_u_zb3bzB51|)
       (#%if (|oldint?_u_df5KyB51| |n_u_zb3bzB51|)
         #t
         (#%if (real? |n_u_zb3bzB51|)
           (= (round |n_u_zb3bzB51|) |n_u_zb3bzB51|)
           #f))))
   integer?))
(#%define real?
  ((#%lambda (|oldcomp?_u_V71EzB51|)
     (#%lambda (|n_u_f4_4AB51|)
       (#%if (number? |n_u_f4_4AB51|)
         (#%if (|oldcomp?_u_V71EzB51| |n_u_f4_4AB51|)
           #f
           #t)
         #f)))
   complex?))
(#%define rational? exact?)
(#%define complex? number?)
(#%define abs
  (#%lambda (|num_u_B0ZxAB51|)
    (#%if (real? |num_u_B0ZxAB51|)
      (#%if (< |num_u_B0ZxAB51| 0)
        (- |num_u_B0ZxAB51|)
        |num_u_B0ZxAB51|)
      ((#%lambda (|a_u_XYW-AB51| |b_u_hVUrBB51|)
         (sqrt (+ (* |a_u_XYW-AB51| |a_u_XYW-AB51|)
                  (* |b_u_hVUrBB51| |b_u_hVUrBB51|))))
       (real-part |num_u_B0ZxAB51|)
       (imag-part |num_u_B0ZxAB51|)))))
(#%define min (void))
(#%define max (void))
(#%letrec ((|_min_max_u_DRSUBB51|
             (#%lambda (|proc_u_lzI9EB51|
                        |mv_u_HvGCEB51|
                        |args_u_1sE3FB51|
                        |inexact_u_noCwFB51|)
               (#%if (null? |args_u_1sE3FB51|)
                 (#%if (#%if |inexact_u_noCwFB51|
                         (exact? |mv_u_HvGCEB51|)
                         #f)
                   (exact->inexact |mv_u_HvGCEB51|)
                   |mv_u_HvGCEB51|)
                 (#%if (|proc_u_lzI9EB51|
                         (car |args_u_1sE3FB51|)
                         |mv_u_HvGCEB51|)
                   (|_min_max_u_DRSUBB51|
                     |proc_u_lzI9EB51|
                     (car |args_u_1sE3FB51|)
                     (cdr |args_u_1sE3FB51|)
                     (#%if |inexact_u_noCwFB51|
                       #t
                       (inexact? (car |args_u_1sE3FB51|))))
                   (|_min_max_u_DRSUBB51|
                     |proc_u_lzI9EB51|
                     |mv_u_HvGCEB51|
                     (cdr |args_u_1sE3FB51|)
                     |inexact_u_noCwFB51|))))))
  (#%begin
    (#%set! min
      (#%lambda (|x1_u_jKOOCB51| . |args_u_ZNQlCB51|)
        (#%if (null? |args_u_ZNQlCB51|)
          |x1_u_jKOOCB51|
          (|_min_max_u_DRSUBB51|
            <
            |x1_u_jKOOCB51|
            |args_u_ZNQlCB51|
            (inexact? |x1_u_jKOOCB51|)))))
    (#%set! max
      (#%lambda (|x1_u__CKIDB51| . |args_u_FGMfDB51|)
        (#%if (null? |args_u_FGMfDB51|)
          |x1_u__CKIDB51|
          (|_min_max_u_DRSUBB51|
            >
            |x1_u__CKIDB51|
            |args_u_FGMfDB51|
            (inexact? |x1_u__CKIDB51|)))))))
(#%define negative?
  (#%lambda (|n_u_JkAZFB51|) (< |n_u_JkAZFB51| 0)))
(#%define positive?
  (#%lambda (|n_u_3hyqGB51|) (> |n_u_3hyqGB51| 0)))
(#%define even?
  (#%lambda (|n_u_pdwTGB51|)
    (= 0 (modulo |n_u_pdwTGB51| 2))))
(#%define odd?
  (#%lambda (|n_u_L9ukHB51|)
    (#%if (even? |n_u_L9ukHB51|) #f #t)))
(#%define zero?
  (#%lambda (|n_u_56sNHB51|) (= |n_u_56sNHB51| 0)))
(#%define add1
  (#%lambda (|n_u_r2qeIB51|) (+ |n_u_r2qeIB51| 1)))
(#%define sub1
  (#%lambda (|n_u_N-nHIB51|) (- |n_u_N-nHIB51| 1)))
(#%define >= (void))
(#%define <= (void))
((#%lambda (|_comp_help_u_7Xl8JB51| |_and2_u_tTjBJB51|)
   (#%begin
     (#%set! <=
       (|_comp_help_u_7Xl8JB51|
         (#%lambda (|a_u_PPh2KB51| |b_u_9MfvKB51|)
           (#%if (< |a_u_PPh2KB51| |b_u_9MfvKB51|)
             #t
             (= |a_u_PPh2KB51| |b_u_9MfvKB51|)))
         |_and2_u_tTjBJB51|
         #t))
     (#%set! >=
       (|_comp_help_u_7Xl8JB51|
         (#%lambda (|a_u_vIdYKB51| |b_u_REbpLB51|)
           (#%if (> |a_u_vIdYKB51| |b_u_REbpLB51|)
             #t
             (= |a_u_vIdYKB51| |b_u_REbpLB51|)))
         |_and2_u_tTjBJB51|
         #t))))
 (#%lambda (|comparator_u_bB9SLB51|
            |chainer_u_xx7jMB51|
            |endstate_u_Tt5MMB51|)
   (#%lambda |args_u_dq3dNB51|
     ((#%letrec ((|loop_u_zm1GNB51|
                   (#%lambda (|x_u_Vi_6OB51|)
                     (#%if (null? |x_u_Vi_6OB51|)
                       |endstate_u_Tt5MMB51|
                       (#%if (null? (cdr |x_u_Vi_6OB51|))
                         |endstate_u_Tt5MMB51|
                         (|chainer_u_xx7jMB51|
                           (|comparator_u_bB9SLB51|
                             (car |x_u_Vi_6OB51|)
                             (cadr |x_u_Vi_6OB51|))
                           (|loop_u_zm1GNB51| (cdr |x_u_Vi_6OB51|))))))))
        |loop_u_zm1GNB51|)
      |args_u_dq3dNB51|)))
 (#%lambda (|x_u_ffZzOB51| |y_u_BbX0PB51|)
   (#%if |x_u_ffZzOB51| |y_u_BbX0PB51| #f)))
((#%lambda (|_?=_u_X7VtPB51|)
   (#%begin
     (#%set! >= (|_?=_u_X7VtPB51| > >=))
     (#%set! <= (|_?=_u_X7VtPB51| < <=))))
 (#%lambda (|comparator_u_h4TWPB51| |chainer_u_D0RnQB51|)
   (#%lambda |args_u_ZYOQQB51|
     (#%if (null? |args_u_ZYOQQB51|)
       #t
       (#%if (null? (cdr |args_u_ZYOQQB51|))
         #t
         (#%if (#%if (= (car |args_u_ZYOQQB51|)
                        (cadr |args_u_ZYOQQB51|))
                 #t
                 (|comparator_u_h4TWPB51|
                   (car |args_u_ZYOQQB51|)
                   (cadr |args_u_ZYOQQB51|)))
           (apply |chainer_u_D0RnQB51|
                  (cdr |args_u_ZYOQQB51|))
           #f))))))
(#%define gcd
  (#%lambda |args_u_jVMhRB51|
    (#%if (null? |args_u_jVMhRB51|)
      0
      (#%if (null? (cdr |args_u_jVMhRB51|))
        (car |args_u_jVMhRB51|)
        (_gcd (car |args_u_jVMhRB51|)
              (cadr |args_u_jVMhRB51|))))))
(#%define lcm
  (#%lambda |args_u_FRKKRB51|
    (#%if (null? |args_u_FRKKRB51|)
      1
      (#%if (null? (cdr |args_u_FRKKRB51|))
        (car |args_u_FRKKRB51|)
        (_lcm (car |args_u_FRKKRB51|)
              (cadr |args_u_FRKKRB51|))))))
(#%define modulo
  (#%lambda (|x_u__NIbSB51| |y_u_lKGESB51|)
    ((#%lambda (|r_u_HGE5TB51|)
       (#%if (#%if (negative? |y_u_lKGESB51|)
               (positive? |r_u_HGE5TB51|)
               (negative? |r_u_HGE5TB51|))
         (+ |r_u_HGE5TB51| |y_u_lKGESB51|)
         |r_u_HGE5TB51|))
     (remainder |x_u__NIbSB51| |y_u_lKGESB51|))))
(#%define string-append
  (#%lambda |args_u_1DCyTB51|
    (#%if (null? |args_u_1DCyTB51|)
      ""
      (#%if (null? (cdr |args_u_1DCyTB51|))
        (car |args_u_1DCyTB51|)
        (apply string-append
               (_string-append
                 (car |args_u_1DCyTB51|)
                 (cadr |args_u_1DCyTB51|))
               (cddr |args_u_1DCyTB51|))))))
(#%define char-downcase
  ((#%lambda (|a_u_nzA_TB51|)
     ((#%lambda (|z_u_JvysUB51|)
        ((#%lambda (|lc-offset_u_3swVUB51|)
           (#%lambda (|c_u_poumVB51|)
             ((#%lambda (|cv_u_LksPVB51|)
                (#%if (#%if (>= |cv_u_LksPVB51| |a_u_nzA_TB51|)
                        (<= |cv_u_LksPVB51| |z_u_JvysUB51|)
                        #f)
                  (integer->char
                    (+ |cv_u_LksPVB51| |lc-offset_u_3swVUB51|))
                  |c_u_poumVB51|))
              (char->integer |c_u_poumVB51|))))
         (- (char->integer #\a) |a_u_nzA_TB51|)))
      (char->integer #\Z)))
   (char->integer #\A)))
(#%define char-upcase
  ((#%lambda (|a_u_5hqgWB51|)
     ((#%lambda (|z_u_rdoJWB51|)
        ((#%lambda (|uc-offset_u_N9maXB51|)
           (#%lambda (|c_u_76kDXB51|)
             ((#%lambda (|cv_u_t2i4YB51|)
                (#%if (#%if (>= |cv_u_t2i4YB51| |a_u_5hqgWB51|)
                        (<= |cv_u_t2i4YB51| |z_u_rdoJWB51|)
                        #f)
                  (integer->char
                    (- |cv_u_t2i4YB51| |uc-offset_u_N9maXB51|))
                  |c_u_76kDXB51|))
              (char->integer |c_u_76kDXB51|))))
         (- |a_u_5hqgWB51| (char->integer #\A))))
      (char->integer #\z)))
   (char->integer #\a)))
(#%define char>?
  (#%lambda (|c1_u_vTbrZB51|
             |c2_u_9Xd-YB51|
             .
             |args_u_P-fxYB51|)
    (apply >
           (char->integer |c1_u_vTbrZB51|)
           (char->integer |c2_u_9Xd-YB51|)
           (map char->integer |args_u_P-fxYB51|))))
(#%define char<?
  (#%lambda (|c1_u_xI5O-B51|
             |c2_u_bM7l-B51|
             .
             |args_u_RP9UZB51|)
    (apply <
           (char->integer |c1_u_xI5O-B51|)
           (char->integer |c2_u_bM7l-B51|)
           (map char->integer |args_u_RP9UZB51|))))
(#%define char=? eqv?)
(#%define char>=?
  (#%lambda (|c1_u_TE3f_B51| |c2_u_dB1I_B51|)
    (#%if (char>? |c1_u_TE3f_B51| |c2_u_dB1I_B51|)
      #t
      (char=? |c1_u_TE3f_B51| |c2_u_dB1I_B51|))))
(#%define char<=?
  (#%lambda (|c1_u_zx_80C51| |c2_u_VtZB0C51|)
    (#%if (char<? |c1_u_zx_80C51| |c2_u_VtZB0C51|)
      #t
      (char=? |c1_u_zx_80C51| |c2_u_VtZB0C51|))))
(#%define char-ci>?
  (#%lambda (|c1_u_XiTY1C51|
             |c2_u_BmVv1C51|
             .
             |args_u_fqX21C51|)
    (apply char>?
           (char-downcase |c1_u_XiTY1C51|)
           (char-downcase |c2_u_BmVv1C51|)
           (map char-downcase |args_u_fqX21C51|))))
(#%define char-ci<?
  (#%lambda (|c1_u_Z7Nj3C51|
             |c2_u_DbPS2C51|
             .
             |args_u_hfRp2C51|)
    (apply char<?
           (char-downcase |c1_u_Z7Nj3C51|)
           (char-downcase |c2_u_DbPS2C51|)
           (map char-downcase |args_u_hfRp2C51|))))
(#%define char-ci=?
  (#%lambda (|c1_u__YGG4C51|
             |c2_u_F0Jd4C51|
             .
             |args_u_j4LM3C51|)
    (apply char=?
           (char-downcase |c1_u__YGG4C51|)
           (char-downcase |c2_u_F0Jd4C51|)
           (map char-downcase |args_u_j4LM3C51|))))
(#%define char-ci>=?
  (#%lambda (|c1_u_lVE75C51| |c2_u_HRCA5C51|)
    (#%if (char-ci>? |c1_u_lVE75C51| |c2_u_HRCA5C51|)
      #t
      (char-ci=? |c1_u_lVE75C51| |c2_u_HRCA5C51|))))
(#%define char-ci<=?
  (#%lambda (|c1_u_1OA16C51| |c2_u_nKyu6C51|)
    (#%if (char-ci<? |c1_u_1OA16C51| |c2_u_nKyu6C51|)
      #t
      (char-ci=? |c1_u_1OA16C51| |c2_u_nKyu6C51|))))
(#%define char-alphabetic?
  (#%lambda (|c_u_JGwX6C51|)
    (#%if (char<? #\@ |c_u_JGwX6C51| #\[)
      #t
      (char<? #\` |c_u_JGwX6C51| #\{))))
(#%define char-numeric?
  (#%lambda (|c_u_3Duo7C51|)
    (char<? #\/ |c_u_3Duo7C51| #\:)))
(#%define char-whitespace?
  (#%lambda (|c_u_pzsR7C51|)
    (#%if (char=? |c_u_pzsR7C51| #\space)
      #t
      (#%if (char=? |c_u_pzsR7C51| #\tab)
        #t
        (#%if (char=? |c_u_pzsR7C51| #\newline)
          #t
          (char=? |c_u_pzsR7C51| #\return))))))
(#%define char-upper-case?
  (#%lambda (|c_u_Lvqi8C51|)
    (char<? #\@ |c_u_Lvqi8C51| #\[)))
(#%define char-lower-case?
  (#%lambda (|c_u_5soL8C51|)
    (char<? #\` |c_u_5soL8C51| #\{)))
(#%define string-downcase (void))
(#%define string-upcase (void))
(#%letrec ((|string-map_u_romc9C51|
             (#%lambda (|strsrc_u_96ctbC51|
                        |strdst_u_v2aWbC51|
                        |proc_u_R-7ncC51|
                        |n_u_bX5QcC51|
                        |l_u_xT3hdC51|)
               (#%if (< |n_u_bX5QcC51| |l_u_xT3hdC51|)
                 (#%begin
                   (string-set!
                     |strdst_u_v2aWbC51|
                     |n_u_bX5QcC51|
                     (|proc_u_R-7ncC51|
                       (string-ref |strsrc_u_96ctbC51| |n_u_bX5QcC51|)))
                   (|string-map_u_romc9C51|
                     |strsrc_u_96ctbC51|
                     |strdst_u_v2aWbC51|
                     |proc_u_R-7ncC51|
                     (+ |n_u_bX5QcC51| 1)
                     |l_u_xT3hdC51|))
                 |strdst_u_v2aWbC51|))))
  (#%begin
    (#%set! string-downcase
      (#%lambda (|str_u_NkkF9C51|)
        ((#%lambda (|newstr_u_7hi6aC51|)
           (|string-map_u_romc9C51|
             |str_u_NkkF9C51|
             |newstr_u_7hi6aC51|
             char-downcase
             0
             (string-length |str_u_NkkF9C51|)))
         (make-string (string-length |str_u_NkkF9C51|)))))
    (#%set! string-upcase
      (#%lambda (|str_u_tdgzaC51|)
        ((#%lambda (|newstr_u_P9e0bC51|)
           (|string-map_u_romc9C51|
             |str_u_tdgzaC51|
             |newstr_u_P9e0bC51|
             char-upcase
             0
             (string-length |str_u_tdgzaC51|)))
         (make-string (string-length |str_u_tdgzaC51|)))))))
(#%define string=? equal?)
(#%define string<?
  (#%letrec ((|s<?_u_TP1KdC51|
               (#%lambda (|s1_u_VEX4fC51| |s2_u_fBVxfC51|)
                 (#%if (null? |s1_u_VEX4fC51|)
                   (#%if (null? |s2_u_fBVxfC51|) #f #t)
                   (#%if (null? |s2_u_fBVxfC51|)
                     #f
                     ((#%lambda (|c1_u_BxT-fC51| |c2_u_XtRrgC51|)
                        (#%if (char<? |c1_u_BxT-fC51| |c2_u_XtRrgC51|)
                          #t
                          (#%if (char>? |c1_u_BxT-fC51| |c2_u_XtRrgC51|)
                            #f
                            (|s<?_u_TP1KdC51|
                              (cdr |s1_u_VEX4fC51|)
                              (cdr |s2_u_fBVxfC51|)))))
                      (car |s1_u_VEX4fC51|)
                      (car |s2_u_fBVxfC51|)))))))
    (#%lambda (|s1_u_dM_aeC51| |s2_u_zIZDeC51|)
      (|s<?_u_TP1KdC51|
        (string->list |s1_u_dM_aeC51|)
        (string->list |s2_u_zIZDeC51|)))))
(#%define string>?
  (#%letrec ((|s>?_u_hqPUgC51|
               (#%lambda (|s1_u_jfJfiC51| |s2_u_FbHIiC51|)
                 (#%if (null? |s2_u_FbHIiC51|)
                   (#%if (null? |s1_u_jfJfiC51|) #f #t)
                   (#%if (null? |s1_u_jfJfiC51|)
                     #f
                     ((#%lambda (|c1_u__7F9jC51| |c2_u_l4DCjC51|)
                        (#%if (char>? |c1_u__7F9jC51| |c2_u_l4DCjC51|)
                          #t
                          (#%if (char<? |c1_u__7F9jC51| |c2_u_l4DCjC51|)
                            #f
                            (|s>?_u_hqPUgC51|
                              (cdr |s1_u_jfJfiC51|)
                              (cdr |s2_u_FbHIiC51|)))))
                      (car |s1_u_jfJfiC51|)
                      (car |s2_u_FbHIiC51|)))))))
    (#%lambda (|s1_u_DmNlhC51| |s2_u_ZiLOhC51|)
      (|s>?_u_hqPUgC51|
        (string->list |s1_u_DmNlhC51|)
        (string->list |s2_u_ZiLOhC51|)))))
(#%define string<=?
  (#%lambda (|s1_u_H0B3kC51| |s2_u_1ZywkC51|)
    (#%if (string<? |s1_u_H0B3kC51| |s2_u_1ZywkC51|)
      #t
      (string=? |s1_u_H0B3kC51| |s2_u_1ZywkC51|))))
(#%define string>=?
  (#%lambda (|s1_u_nVwZkC51| |s2_u_JRuqlC51|)
    (#%if (string>? |s1_u_nVwZkC51| |s2_u_JRuqlC51|)
      #t
      (string=? |s1_u_nVwZkC51| |s2_u_JRuqlC51|))))
(#%define string-ci=?
  (#%lambda (|s1_u_3OsTlC51| |s2_u_pKqkmC51|)
    (string=?
      (string-downcase |s1_u_3OsTlC51|)
      (string-downcase |s2_u_pKqkmC51|))))
(#%define string-ci<?
  (#%lambda (|s1_u_LGoNmC51| |s2_u_5DmenC51|)
    (string<?
      (string-downcase |s1_u_LGoNmC51|)
      (string-downcase |s2_u_5DmenC51|))))
(#%define string-ci>?
  (#%lambda (|s1_u_rzkHnC51| |s2_u_Nvi8oC51|)
    (string>?
      (string-downcase |s1_u_rzkHnC51|)
      (string-downcase |s2_u_Nvi8oC51|))))
(#%define string-ci>=?
  (#%lambda (|s1_u_7sgBoC51| |s2_u_toe2pC51|)
    (string>=?
      (string-downcase |s1_u_7sgBoC51|)
      (string-downcase |s2_u_toe2pC51|))))
(#%define string-ci<=?
  (#%lambda (|s1_u_PkcvpC51| |s2_u_9haYpC51|)
    (string<=?
      (string-downcase |s1_u_PkcvpC51|)
      (string-downcase |s2_u_9haYpC51|))))
(#%define substring
  (#%letrec ((|fill-string_u_vd8pqC51|
               (#%lambda (|sstr_u_dXZFsC51|
                          |dstr_u_zTX6tC51|
                          |n_u_VPVztC51|
                          |s_u_fMT0uC51|
                          |e_u_BIRtuC51|)
                 (#%if (< |s_u_fMT0uC51| |e_u_BIRtuC51|)
                   (#%begin
                     (string-set!
                       |dstr_u_zTX6tC51|
                       |n_u_VPVztC51|
                       (string-ref |sstr_u_dXZFsC51| |s_u_fMT0uC51|))
                     (|fill-string_u_vd8pqC51|
                       |sstr_u_dXZFsC51|
                       |dstr_u_zTX6tC51|
                       (+ |n_u_VPVztC51| 1)
                       (+ |s_u_fMT0uC51| 1)
                       |e_u_BIRtuC51|))
                   #!void))))
    (#%lambda (|str_u_R96SqC51|
               |start_u_b64jrC51|
               |end_u_x22MrC51|)
      ((#%lambda (|newstr_u_T-_csC51|)
         (#%begin
           (|fill-string_u_vd8pqC51|
             |str_u_R96SqC51|
             |newstr_u_T-_csC51|
             0
             |start_u_b64jrC51|
             |end_u_x22MrC51|)
           |newstr_u_T-_csC51|))
       (make-string
         (- |end_u_x22MrC51| |start_u_b64jrC51|))))))
(#%define list-ref
  (#%lambda (|list_u_XEPWuC51| |n_u_hBNnvC51|)
    (#%if (zero? |n_u_hBNnvC51|)
      (car |list_u_XEPWuC51|)
      (list-ref
        (cdr |list_u_XEPWuC51|)
        (- |n_u_hBNnvC51| 1)))))
(#%define values
  (#%lambda |args_u_DxLQvC51|
    (call-with-current-continuation
      (#%lambda (|k_u_ZtJhwC51|)
        (apply |k_u_ZtJhwC51| |args_u_DxLQvC51|)))))
