#!void
(#%define for-each
  (#%lambda (|proc_8uLU8XEbH|
             |ls1_8upYauEbH|
             .
             |lists_8u30d1EbH|)
    (#%if (null? |ls1_8upYauEbH|)
      #!void
      (#%begin
        (#%set! |lists_8u30d1EbH|
          (cons |ls1_8upYauEbH| |lists_8u30d1EbH|))
        (apply |proc_8uLU8XEbH|
               (map-car |lists_8u30d1EbH|))
        (apply for-each
               |proc_8uLU8XEbH|
               (map-cdr |lists_8u30d1EbH|))))))
(#%define eof-object?
  (#%lambda (|x_8u5R6oFbH|)
    (eq? |x_8u5R6oFbH| #!eof)))
(#%define not
  (#%lambda (|x_8urN4RFbH|)
    (#%if |x_8urN4RFbH| #f #t)))
(#%define newline
  (#%lambda |port_8uNJ2iGbH|
    (apply display #\newline |port_8uNJ2iGbH|)))
(#%define reverse
  (#%letrec ((|iter_8u7G0LGbH|
               (#%lambda (|ls_8uPyYEHbH| |acc_8u9vW5IbH|)
                 (#%if (null? |ls_8uPyYEHbH|)
                   |acc_8u9vW5IbH|
                   (|iter_8u7G0LGbH|
                     (cdr |ls_8uPyYEHbH|)
                     (cons (car |ls_8uPyYEHbH|) |acc_8u9vW5IbH|))))))
    (#%lambda (|ls_8utC-bHbH|)
      (|iter_8u7G0LGbH| |ls_8utC-bHbH| ()))))
(#%define reverse!
  (#%letrec ((|iter_8uvrUyIbH|
               (#%lambda (|s_8ubkQsJbH| |r_8uxgOVJbH|)
                 (#%if (null? |s_8ubkQsJbH|)
                   |r_8uxgOVJbH|
                   ((#%lambda (|d_8uTcMmKbH|)
                      (#%begin
                        (set-cdr! |s_8ubkQsJbH| |r_8uxgOVJbH|)
                        (|iter_8uvrUyIbH| |d_8uTcMmKbH| |s_8ubkQsJbH|)))
                    (cdr |s_8ubkQsJbH|))))))
    (#%lambda (|s_8uRnS_IbH|)
      (|iter_8uvrUyIbH| |s_8uRnS_IbH| ()))))
(#%define map-car
  (#%lambda (|ls_8ud9KPKbH|)
    (#%if (null? |ls_8ud9KPKbH|)
      ()
      (cons (caar |ls_8ud9KPKbH|)
            (map-car (cdr |ls_8ud9KPKbH|))))))
(#%define map-cdr
  (#%lambda (|ls_8uz5IgLbH|)
    (#%if (null? |ls_8uz5IgLbH|)
      ()
      (cons (cdar |ls_8uz5IgLbH|)
            (map-cdr (cdr |ls_8uz5IgLbH|))))))
(#%define map
  (#%letrec ((|map1_8uV1GJLbH|
               (#%lambda (|proc_8uDLv-NbH|
                          |list_8uZHtrObH|
                          |acc_8ujErUObH|)
                 (#%if (null? |list_8uZHtrObH|)
                   (reverse |acc_8ujErUObH|)
                   (|map1_8uV1GJLbH|
                     |proc_8uDLv-NbH|
                     (cdr |list_8uZHtrObH|)
                     (cons (|proc_8uDLv-NbH| (car |list_8uZHtrObH|))
                           |acc_8ujErUObH|)))))
             (|loop_8uf-DaMbH|
               (#%lambda (|proc_8uFAplPbH|
                          |list1_8u_wnOPbH|
                          |lists_8ultlfQbH|
                          |c_8uHpjIQbH|)
                 (#%if (null? |list1_8u_wnOPbH|)
                   (reverse |c_8uHpjIQbH|)
                   (|loop_8uf-DaMbH|
                     |proc_8uFAplPbH|
                     (cdr |list1_8u_wnOPbH|)
                     (map-cdr |lists_8ultlfQbH|)
                     (cons (apply |proc_8uFAplPbH|
                                  (car |list1_8u_wnOPbH|)
                                  (map-car |lists_8ultlfQbH|))
                           |c_8uHpjIQbH|))))))
    (#%lambda (|proc_8uhPxxNbH|
               |list1_8uXSz4NbH|
               .
               |lists_8uBWBDMbH|)
      (#%if (null? |lists_8uBWBDMbH|)
        (|map1_8uV1GJLbH|
          |proc_8uhPxxNbH|
          |list1_8uXSz4NbH|
          ())
        (|loop_8uf-DaMbH|
          |proc_8uhPxxNbH|
          |list1_8uXSz4NbH|
          |lists_8uBWBDMbH|
          ())))))
(#%define compose2
  (#%lambda (|f_8u1mh9RbH| |g_8unifCRbH|)
    (#%lambda (|x_8uJed3SbH|)
      (|f_8u1mh9RbH| (|g_8unifCRbH| |x_8uJed3SbH|)))))
(#%define assq (void))
(#%define assv (void))
(#%define assoc (void))
(#%define memq (void))
(#%define memv (void))
(#%define member (void))
(#%letrec ((|assn_8u3bbwSbH|
             (#%lambda (|n_8uTnKRYbH| |obj_8udkIiZbH| |alist_8uzgGLZbH|)
               (#%if (null? |alist_8uzgGLZbH|)
                 #f
                 (#%if (|n_8uTnKRYbH|
                         (caar |alist_8uzgGLZbH|)
                         |obj_8udkIiZbH|)
                   (car |alist_8uzgGLZbH|)
                   (|assn_8u3bbwSbH|
                     |n_8uTnKRYbH|
                     |obj_8udkIiZbH|
                     (cdr |alist_8uzgGLZbH|))))))
           (|memn_8up79ZSbH|
             (#%lambda (|n_8uVcEc-bH| |obj_8uf9CF-bH| |list_8uB5A6_bH|)
               (#%if (null? |list_8uB5A6_bH|)
                 #f
                 (#%if (|n_8uVcEc-bH|
                         (car |list_8uB5A6_bH|)
                         |obj_8uf9CF-bH|)
                   |list_8uB5A6_bH|
                   (|memn_8up79ZSbH|
                     |n_8uVcEc-bH|
                     |obj_8uf9CF-bH|
                     (cdr |list_8uB5A6_bH|)))))))
  (#%begin
    (#%set! assq
      (#%lambda (|obj_8uL37qTbH| |alist_8u505TTbH|)
        (|assn_8u3bbwSbH|
          eq?
          |obj_8uL37qTbH|
          |alist_8u505TTbH|)))
    (#%set! assv
      (#%lambda (|obj_8urY2kUbH| |alist_8uNU0NUbH|)
        (|assn_8u3bbwSbH|
          eqv?
          |obj_8urY2kUbH|
          |alist_8uNU0NUbH|)))
    (#%set! assoc
      (#%lambda (|obj_8u7R-dVbH| |alist_8utNYGVbH|)
        (|assn_8u3bbwSbH|
          equal?
          |obj_8u7R-dVbH|
          |alist_8utNYGVbH|)))
    (#%set! memq
      (#%lambda (|obj_8uPJW7WbH| |list_8u9GUAWbH|)
        (|memn_8up79ZSbH|
          eq?
          |obj_8uPJW7WbH|
          |list_8u9GUAWbH|)))
    (#%set! memv
      (#%lambda (|obj_8uvCS1XbH| |list_8uRyQuXbH|)
        (|memn_8up79ZSbH|
          eqv?
          |obj_8uvCS1XbH|
          |list_8uRyQuXbH|)))
    (#%set! member
      (#%lambda (|obj_8ubvOXXbH| |list_8uxrMoYbH|)
        (|memn_8up79ZSbH|
          equal?
          |obj_8ubvOXXbH|
          |list_8uxrMoYbH|)))))
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
  (#%lambda (|ls1_8uX1yz_bH| |ls2_8uh-v00cH|)
    (#%if (null? |ls1_8uX1yz_bH|)
      |ls2_8uh-v00cH|
      (cons (car |ls1_8uX1yz_bH|)
            (append2 (cdr |ls1_8uX1yz_bH|) |ls2_8uh-v00cH|)))))
(#%define append append2)
(#%define list->string
  (#%letrec ((|l2s_8uDWtt0cH|
               (#%lambda (|l_8ujPpn1cH| |s_8uFLnQ1cH| |n_8u_Hlh2cH|)
                 (#%if (null? |l_8ujPpn1cH|)
                   |s_8uFLnQ1cH|
                   (#%begin
                     (string-set!
                       |s_8uFLnQ1cH|
                       |n_8u_Hlh2cH|
                       (car |l_8ujPpn1cH|))
                     (|l2s_8uDWtt0cH|
                       (cdr |l_8ujPpn1cH|)
                       |s_8uFLnQ1cH|
                       (+ |n_8u_Hlh2cH| 1)))))))
    (#%lambda (|l_8uZSrW0cH|)
      (|l2s_8uDWtt0cH|
        |l_8uZSrW0cH|
        (make-string (length |l_8uZSrW0cH|))
        0))))
(#%define string->list
  (#%letrec ((|s2l_8ulEjK2cH|
               (#%lambda (|s_8u1xfE3cH| |h_8untd54cH| |n_8uJpby4cH|)
                 (#%if (< |n_8uJpby4cH| 0)
                   |h_8untd54cH|
                   (|s2l_8ulEjK2cH|
                     |s_8u1xfE3cH|
                     (cons (string-ref |s_8u1xfE3cH| |n_8uJpby4cH|)
                           |h_8untd54cH|)
                     (- |n_8uJpby4cH| 1))))))
    (#%lambda (|s_8uHAhb3cH|)
      (|s2l_8ulEjK2cH|
        |s_8uHAhb3cH|
        ()
        (- (string-length |s_8uHAhb3cH|) 1)))))
(#%define list->vector
  (#%letrec ((|l2v_8u3m9_4cH|
               (#%lambda (|l_8uLe5V5cH| |v_8u5b3m6cH| |n_8ur71P6cH|)
                 (#%if (null? |l_8uLe5V5cH|)
                   |v_8u5b3m6cH|
                   (#%begin
                     (vector-set!
                       |v_8u5b3m6cH|
                       |n_8ur71P6cH|
                       (car |l_8uLe5V5cH|))
                     (|l2v_8u3m9_4cH|
                       (cdr |l_8uLe5V5cH|)
                       |v_8u5b3m6cH|
                       (+ |n_8ur71P6cH| 1)))))))
    (#%lambda (|l_8upi7s5cH|)
      (#%if (proper-list? |l_8upi7s5cH|)
        (|l2v_8u3m9_4cH|
          |l_8upi7s5cH|
          (make-vector (length |l_8upi7s5cH|))
          0)
        (error (#%quote list->vector)
               "can only convert a proper list."
               |l_8upi7s5cH|)))))
(#%define vector
  (#%lambda |elems_8uN3_f7cH|
    (list->vector |elems_8uN3_f7cH|)))
(#%define string
  (#%lambda |elems_8u70ZI7cH|
    (list->string |elems_8u70ZI7cH|)))
(#%define current-url (_make-parameter "file:."))
(#%define current-directory
  (#%lambda |rest_8utYW98cH|
    (#%if (null? |rest_8utYW98cH|)
      (normalize-url (current-url) ".")
      (current-url
        (normalize-url
          (current-url)
          ((#%lambda (|v_8uPUUC8cH|)
             ((#%lambda (|l_8u9RS39cH|)
                (#%if (eqv? (string-ref |v_8uPUUC8cH| (- |l_8u9RS39cH| 1))
                            #\/)
                  |v_8uPUUC8cH|
                  (string-append |v_8uPUUC8cH| "/")))
              (string-length |v_8uPUUC8cH|)))
           (car |rest_8utYW98cH|)))))))
(#%define file-handler (void))
(#%define add-file-handler (void))
((#%lambda (|*file-handlers*_8uvNQw9cH|)
   (#%begin
     (#%set! add-file-handler
       (#%lambda (|extension_8uRJOZ9cH| |thunk_8ubGMqacH|)
         (#%if (assq |extension_8uRJOZ9cH|
                     |*file-handlers*_8uvNQw9cH|)
           #!void
           (#%set! |*file-handlers*_8uvNQw9cH|
             (cons (cons |extension_8uRJOZ9cH| |thunk_8ubGMqacH|)
                   |*file-handlers*_8uvNQw9cH|)))))
     (#%set! file-handler
       ((#%lambda (|_load_8uxCKTacH|)
          (#%lambda (|extension_8uTyIkbcH|)
            ((#%lambda (|t_8udvGNbcH|)
               (#%if |t_8udvGNbcH|
                 (cdr |t_8udvGNbcH|)
                 |_load_8uxCKTacH|))
             (assq (string->symbol
                     (string-downcase |extension_8uTyIkbcH|))
                   |*file-handlers*_8uvNQw9cH|))))
        load))))
 ())
(#%define make-io-proc
  (#%lambda (|proc_8uzrEeccH|)
    (#%lambda (|file_8ufkA8dcH| . |rest_8uVnCHccH|)
      (apply |proc_8uzrEeccH|
             (normalize-url (current-url) |file_8ufkA8dcH|)
             |rest_8uVnCHccH|))))
((#%lambda (|file-extension_8uBgyBdcH|)
   (#%begin
     (#%set! open-input-file
       (make-io-proc open-input-file))
     (#%set! open-source-input-file
       (make-io-proc open-source-input-file))
     (#%set! open-output-file
       (make-io-proc open-output-file))
     (#%set! load
       (#%lambda (|file_8uXcw2ecH|)
         (#%begin
           ((#%lambda (|previous-url_8uh9uvecH|)
              (#%begin
                (current-url
                  (normalize-url
                    |previous-url_8uh9uvecH|
                    |file_8uXcw2ecH|))
                (with-failure-continuation
                  (#%lambda (|m_8uD5sYecH| |e_8uZ1qpfcH|)
                    (#%begin
                      (current-url |previous-url_8uh9uvecH|)
                      (call-with-failure-continuation
                        (#%lambda (|fk_8uj-nSfcH|)
                          (|fk_8uj-nSfcH| |m_8uD5sYecH| |e_8uZ1qpfcH|)))))
                  (#%lambda ()
                    ((#%lambda (|fe_8uFWljgcH|)
                       ((file-handler
                          (#%if |fe_8uFWljgcH| |fe_8uFWljgcH| "scm"))
                        (current-url)))
                     (|file-extension_8uBgyBdcH| (current-url)))))
                (current-url |previous-url_8uh9uvecH|)))
            (current-url))
           (void))))))
 (#%lambda (|url_8u_SjMgcH|)
   ((#%letrec ((|loop_8ulPhdhcH|
                 (#%lambda (|x_8uHLfGhcH| |acc_8u1Id7icH|)
                   (#%if (null? |x_8uHLfGhcH|)
                     #f
                     (#%if (equal? (car |x_8uHLfGhcH|) #\.)
                       (list->string |acc_8u1Id7icH|)
                       (|loop_8ulPhdhcH|
                         (cdr |x_8uHLfGhcH|)
                         (cons (car |x_8uHLfGhcH|) |acc_8u1Id7icH|)))))))
      |loop_8ulPhdhcH|)
    (reverse! (string->list |url_8u_SjMgcH|))
    ())))
(#%define load-module
  (#%lambda (|str_8unEbAicH|)
    ((#%lambda (|nl_8uJA91jcH|)
       ((#%lambda (|binding-names_8u3x7ujcH|)
          (for-each
            (#%lambda (|name_8upt5XjcH|)
              (putprop
                |name_8upt5XjcH|
                (native-library-binding
                  |nl_8uJA91jcH|
                  |name_8upt5XjcH|)))
            |binding-names_8u3x7ujcH|))
        (native-library-binding-names |nl_8uJA91jcH|)))
     (load-native-library |str_8unEbAicH|))))
(#%define append
  (#%letrec ((|real-append_8uLp3okcH|
               (#%lambda (|ls1_8uNeZKlcH| . |lses_8uri_hlcH|)
                 (#%if (null? |lses_8uri_hlcH|)
                   |ls1_8uNeZKlcH|
                   (#%if (null? |ls1_8uNeZKlcH|)
                     (apply |real-append_8uLp3okcH| |lses_8uri_hlcH|)
                     (apply |real-append_8uLp3okcH|
                            (append2 |ls1_8uNeZKlcH| (car |lses_8uri_hlcH|))
                            (cdr |lses_8uri_hlcH|)))))))
    (#%lambda |lses_8u5m1RkcH|
      (#%if (null? |lses_8u5m1RkcH|)
        ()
        (#%if (null? (cdr |lses_8u5m1RkcH|))
          (car |lses_8u5m1RkcH|)
          (apply |real-append_8uLp3okcH|
                 (car |lses_8u5m1RkcH|)
                 (cdr |lses_8u5m1RkcH|)))))))
(#%define proper-list?
  (#%lambda (|x_8u7bXbmcH|)
    ((#%letrec ((|lp_8ut7VEmcH|
                  (#%lambda (|x_8uP3T5ncH| |lag_8u90RyncH|)
                    (#%if (pair? |x_8uP3T5ncH|)
                      ((#%lambda (|x_8uvYO_ncH|)
                         (#%if (pair? |x_8uvYO_ncH|)
                           ((#%lambda (|x_8uRUMsocH| |lag_8ubRKVocH|)
                              (#%if (eq? |x_8uRUMsocH| |lag_8ubRKVocH|)
                                #f
                                (|lp_8ut7VEmcH|
                                  |x_8uRUMsocH|
                                  |lag_8ubRKVocH|)))
                            (cdr |x_8uvYO_ncH|)
                            (cdr |lag_8u90RyncH|))
                           (null? |x_8uvYO_ncH|)))
                       (cdr |x_8uP3T5ncH|))
                      (null? |x_8uP3T5ncH|)))))
       |lp_8ut7VEmcH|)
     |x_8u7bXbmcH|
     |x_8u7bXbmcH|)))
(#%define list? proper-list?)
(#%define expt
  (#%letrec ((|general-expt_8uxNImpcH|
               (#%lambda (|base_8ufvyDrcH| |exponent_8uBrw4scH|)
                 (exp (* |exponent_8uBrw4scH| (log |base_8ufvyDrcH|)))))
             (|rational-expt_8uTJGPpcH|
               (#%lambda (|base-numerator_8uXnuxscH|
                          |base-denominator_8uhks-scH|
                          |exponent_8uDgqrtcH|)
                 (/ (expt |base-numerator_8uXnuxscH|
                          |exponent_8uDgqrtcH|)
                    (expt |base-denominator_8uhks-scH|
                          |exponent_8uDgqrtcH|))))
             (|integer-expt_8udGEgqcH|
               (#%lambda (|base_8uZcoUtcH| |exponent_8uj9mlucH|)
                 (#%if (negative? |exponent_8uj9mlucH|)
                   (/ (|integer-expt_8udGEgqcH|
                        |base_8uZcoUtcH|
                        (abs |exponent_8uj9mlucH|)))
                   (#%if (#%if (exact? |base_8uZcoUtcH|)
                           (= |base_8uZcoUtcH| 2)
                           #f)
                     (ashl 1 |exponent_8uj9mlucH|)
                     ((#%letrec ((|loop_8uF5kOucH|
                                   (#%lambda (|rest_8u_1ifvcH|
                                              |result_8ul-fIvcH|
                                              |squaring_8uHWd9wcH|)
                                     (#%if (zero? |rest_8u_1ifvcH|)
                                       |result_8ul-fIvcH|
                                       (|loop_8uF5kOucH|
                                         (quotient |rest_8u_1ifvcH| 2)
                                         (#%if (odd? |rest_8u_1ifvcH|)
                                           (* |result_8ul-fIvcH|
                                              |squaring_8uHWd9wcH|)
                                           |result_8ul-fIvcH|)
                                         (* |squaring_8uHWd9wcH|
                                            |squaring_8uHWd9wcH|))))))
                        |loop_8uF5kOucH|)
                      |exponent_8uj9mlucH|
                      1
                      |base_8uZcoUtcH|))))))
    (#%lambda (|base_8uzCCJqcH| |exponent_8uVyAarcH|)
      (#%if (zero? |exponent_8uVyAarcH|)
        (#%if (exact? |exponent_8uVyAarcH|) 1 1.0)
        (#%if (zero? |base_8uzCCJqcH|)
          (#%if (exact? |exponent_8uVyAarcH|)
            |base_8uzCCJqcH|
            0.0)
          (#%if (#%if (exact? |base_8uzCCJqcH|)
                  (#%if (rational? |base_8uzCCJqcH|)
                    (#%if (integer? |base_8uzCCJqcH|) #f #t)
                    #f)
                  #f)
            (|rational-expt_8uTJGPpcH|
              (numerator |base_8uzCCJqcH|)
              (denominator |base_8uzCCJqcH|)
              |exponent_8uVyAarcH|)
            (#%if (#%if (exact? |exponent_8uVyAarcH|)
                    (integer? |exponent_8uVyAarcH|)
                    #f)
              (|integer-expt_8udGEgqcH|
                |base_8uzCCJqcH|
                |exponent_8uVyAarcH|)
              (|general-expt_8uxNImpcH|
                |base_8uzCCJqcH|
                |exponent_8uVyAarcH|))))))))
(#%define modpow
  (#%lambda (|x_8u1TbCwcH| |y_8unP93xcH| |n_8uJL7wxcH|)
    (#%if (= |y_8unP93xcH| 1)
      (modulo |x_8u1TbCwcH| |n_8uJL7wxcH|)
      (#%if (even? |y_8unP93xcH|)
        ((#%lambda (|tmp_8uLA1TycH|)
           (modulo
             (* |tmp_8uLA1TycH| |tmp_8uLA1TycH|)
             |n_8uJL7wxcH|))
         (modpow
           |x_8u1TbCwcH|
           (/ |y_8unP93xcH| 2)
           |n_8uJL7wxcH|))
        ((#%lambda (|tmp_8upE3qycH|)
           (#%begin
             (#%set! |tmp_8upE3qycH|
               (modulo
                 (* |tmp_8upE3qycH| |tmp_8upE3qycH|)
                 |n_8uJL7wxcH|))
             (modulo
               (* |x_8u1TbCwcH| |tmp_8upE3qycH|)
               |n_8uJL7wxcH|)))
         (modpow
           |x_8u1TbCwcH|
           (/ (- |y_8unP93xcH| 1) 2)
           |n_8uJL7wxcH|))))))
(#%define integer?
  ((#%lambda (|oldint?_8u5x_jzcH|)
     (#%lambda (|n_8urtZMzcH|)
       (#%if (|oldint?_8u5x_jzcH| |n_8urtZMzcH|)
         #t
         (#%if (real? |n_8urtZMzcH|)
           (= (round |n_8urtZMzcH|) |n_8urtZMzcH|)
           #f))))
   integer?))
(#%define real?
  ((#%lambda (|oldcomp?_8uNpXdAcH|)
     (#%lambda (|n_8u7mVGAcH|)
       (#%if (number? |n_8u7mVGAcH|)
         (#%if (|oldcomp?_8uNpXdAcH| |n_8u7mVGAcH|) #f #t)
         #f)))
   complex?))
(#%define rational? real?)
(#%define complex? number?)
(#%define abs
  (#%lambda (|num_8utiT7BcH|)
    (#%if (real? |num_8utiT7BcH|)
      (#%if (< |num_8utiT7BcH| 0)
        (- |num_8utiT7BcH|)
        |num_8utiT7BcH|)
      ((#%lambda (|a_8uPeRABcH| |b_8u9bP1CcH|)
         (sqrt (+ (* |a_8uPeRABcH| |a_8uPeRABcH|)
                  (* |b_8u9bP1CcH| |b_8u9bP1CcH|))))
       (real-part |num_8utiT7BcH|)
       (imag-part |num_8utiT7BcH|)))))
(#%define min (void))
(#%define max (void))
(#%letrec ((|_min_max_8uv7NuCcH|
             (#%lambda (|proc_8udRCLEcH|
                        |mv_8uzNAcFcH|
                        |args_8uVJyFFcH|
                        |inexact_8ufGw6GcH|)
               (#%if (null? |args_8uVJyFFcH|)
                 (#%if (#%if |inexact_8ufGw6GcH|
                         (exact? |mv_8uzNAcFcH|)
                         #f)
                   (exact->inexact |mv_8uzNAcFcH|)
                   |mv_8uzNAcFcH|)
                 (#%if (|proc_8udRCLEcH|
                         (car |args_8uVJyFFcH|)
                         |mv_8uzNAcFcH|)
                   (|_min_max_8uv7NuCcH|
                     |proc_8udRCLEcH|
                     (car |args_8uVJyFFcH|)
                     (cdr |args_8uVJyFFcH|)
                     (#%if |inexact_8ufGw6GcH|
                       #t
                       (inexact? (car |args_8uVJyFFcH|))))
                   (|_min_max_8uv7NuCcH|
                     |proc_8udRCLEcH|
                     |mv_8uzNAcFcH|
                     (cdr |args_8uVJyFFcH|)
                     |inexact_8ufGw6GcH|))))))
  (#%begin
    (#%set! min
      (#%lambda (|x1_8ub0JoDcH| . |args_8uR3LXCcH|)
        (#%if (null? |args_8uR3LXCcH|)
          |x1_8ub0JoDcH|
          (|_min_max_8uv7NuCcH|
            <
            |x1_8ub0JoDcH|
            |args_8uR3LXCcH|
            (inexact? |x1_8ub0JoDcH|)))))
    (#%set! max
      (#%lambda (|x1_8uTUEiEcH| . |args_8uxYGRDcH|)
        (#%if (null? |args_8uxYGRDcH|)
          |x1_8uTUEiEcH|
          (|_min_max_8uv7NuCcH|
            >
            |x1_8uTUEiEcH|
            |args_8uxYGRDcH|
            (inexact? |x1_8uTUEiEcH|)))))))
(#%define negative?
  (#%lambda (|n_8uBCuzGcH|) (< |n_8uBCuzGcH| 0)))
(#%define positive?
  (#%lambda (|n_8uXys0HcH|) (> |n_8uXys0HcH| 0)))
(#%define even?
  (#%lambda (|n_8uhvqtHcH|)
    (= 0 (modulo |n_8uhvqtHcH| 2))))
(#%define odd?
  (#%lambda (|n_8uDroWHcH|)
    (#%if (even? |n_8uDroWHcH|) #f #t)))
(#%define zero?
  (#%lambda (|n_8uZnmnIcH|) (= |n_8uZnmnIcH| 0)))
(#%define add1
  (#%lambda (|n_8ujkkQIcH|) (+ |n_8ujkkQIcH| 1)))
(#%define sub1
  (#%lambda (|n_8uFgihJcH|) (- |n_8uFgihJcH| 1)))
(#%define >= (void))
(#%define <= (void))
((#%lambda (|_comp_help_8u_cgKJcH| |_and2_8ul9ebKcH|)
   (#%begin
     (#%set! <=
       (|_comp_help_8u_cgKJcH|
         (#%lambda (|a_8uH5cEKcH| |b_8u12a5LcH|)
           (#%if (< |a_8uH5cEKcH| |b_8u12a5LcH|)
             #t
             (= |a_8uH5cEKcH| |b_8u12a5LcH|)))
         |_and2_8ul9ebKcH|
         #t))
     (#%set! >=
       (|_comp_help_8u_cgKJcH|
         (#%lambda (|a_8un-7yLcH| |b_8uJW5_LcH|)
           (#%if (> |a_8un-7yLcH| |b_8uJW5_LcH|)
             #t
             (= |a_8un-7yLcH| |b_8uJW5_LcH|)))
         |_and2_8ul9ebKcH|
         #t))))
 (#%lambda (|comparator_8u3T3sMcH|
            |chainer_8upP1VMcH|
            |endstate_8uLL_lNcH|)
   (#%lambda |args_8u5IZONcH|
     ((#%letrec ((|loop_8urEXfOcH|
                   (#%lambda (|x_8uNAVIOcH|)
                     (#%if (null? |x_8uNAVIOcH|)
                       |endstate_8uLL_lNcH|
                       (#%if (null? (cdr |x_8uNAVIOcH|))
                         |endstate_8uLL_lNcH|
                         (|chainer_8upP1VMcH|
                           (|comparator_8u3T3sMcH|
                             (car |x_8uNAVIOcH|)
                             (cadr |x_8uNAVIOcH|))
                           (|loop_8urEXfOcH| (cdr |x_8uNAVIOcH|))))))))
        |loop_8urEXfOcH|)
      |args_8u5IZONcH|)))
 (#%lambda (|x_8u7xT9PcH| |y_8uttRCPcH|)
   (#%if |x_8u7xT9PcH| |y_8uttRCPcH| #f)))
((#%lambda (|_?=_8uPpP3QcH|)
   (#%begin
     (#%set! >= (|_?=_8uPpP3QcH| > >=))
     (#%set! <= (|_?=_8uPpP3QcH| < <=))))
 (#%lambda (|comparator_8u9mNwQcH| |chainer_8uviLZQcH|)
   (#%lambda |args_8uReJqRcH|
     (#%if (null? |args_8uReJqRcH|)
       #t
       (#%if (null? (cdr |args_8uReJqRcH|))
         #t
         (#%if (#%if (= (car |args_8uReJqRcH|)
                        (cadr |args_8uReJqRcH|))
                 #t
                 (|comparator_8u9mNwQcH|
                   (car |args_8uReJqRcH|)
                   (cadr |args_8uReJqRcH|)))
           (apply |chainer_8uviLZQcH|
                  (cdr |args_8uReJqRcH|))
           #f))))))
(#%define gcd
  (#%lambda |args_8ubbHTRcH|
    (#%if (null? |args_8ubbHTRcH|)
      0
      (#%if (null? (cdr |args_8ubbHTRcH|))
        (car |args_8ubbHTRcH|)
        (_gcd (car |args_8ubbHTRcH|)
              (cadr |args_8ubbHTRcH|))))))
(#%define lcm
  (#%lambda |args_8ux7FkScH|
    (#%if (null? |args_8ux7FkScH|)
      1
      (#%if (null? (cdr |args_8ux7FkScH|))
        (car |args_8ux7FkScH|)
        (_lcm (car |args_8ux7FkScH|)
              (cadr |args_8ux7FkScH|))))))
(#%define modulo
  (#%lambda (|x_8uT3DNScH| |y_8ud0BeTcH|)
    ((#%lambda (|r_8uzYyHTcH|)
       (#%if (#%if (negative? |y_8ud0BeTcH|)
               (positive? |r_8uzYyHTcH|)
               (negative? |r_8uzYyHTcH|))
         (+ |r_8uzYyHTcH| |y_8ud0BeTcH|)
         |r_8uzYyHTcH|))
     (remainder |x_8uT3DNScH| |y_8ud0BeTcH|))))
(#%define string-append
  (#%lambda |args_8uVUw8UcH|
    (#%if (null? |args_8uVUw8UcH|)
      ""
      (#%if (null? (cdr |args_8uVUw8UcH|))
        (car |args_8uVUw8UcH|)
        (apply string-append
               (_string-append
                 (car |args_8uVUw8UcH|)
                 (cadr |args_8uVUw8UcH|))
               (cddr |args_8uVUw8UcH|))))))
(#%define char-downcase
  ((#%lambda (|a_8ufRuBUcH|)
     ((#%lambda (|z_8uBNs2VcH|)
        ((#%lambda (|lc-offset_8uXJqvVcH|)
           (#%lambda (|c_8uhGoYVcH|)
             ((#%lambda (|cv_8uDCmpWcH|)
                (#%if (#%if (>= |cv_8uDCmpWcH| |a_8ufRuBUcH|)
                        (<= |cv_8uDCmpWcH| |z_8uBNs2VcH|)
                        #f)
                  (integer->char
                    (+ |cv_8uDCmpWcH| |lc-offset_8uXJqvVcH|))
                  |c_8uhGoYVcH|))
              (char->integer |c_8uhGoYVcH|))))
         (- (char->integer #\a) |a_8ufRuBUcH|)))
      (char->integer #\Z)))
   (char->integer #\A)))
(#%define char-upcase
  ((#%lambda (|a_8uZykSWcH|)
     ((#%lambda (|z_8ujvijXcH|)
        ((#%lambda (|uc-offset_8uFrgMXcH|)
           (#%lambda (|c_8u_nedYcH|)
             ((#%lambda (|cv_8ulkcGYcH|)
                (#%if (#%if (>= |cv_8ulkcGYcH| |a_8uZykSWcH|)
                        (<= |cv_8ulkcGYcH| |z_8ujvijXcH|)
                        #f)
                  (integer->char
                    (- |cv_8ulkcGYcH| |uc-offset_8uFrgMXcH|))
                  |c_8u_nedYcH|))
              (char->integer |c_8u_nedYcH|))))
         (- |a_8uZykSWcH| (char->integer #\A))))
      (char->integer #\z)))
   (char->integer #\a)))
(#%define char>?
  (#%lambda (|c1_8uHga7ZcH| |c2_8u1d8AZcH|)
    (> (char->integer |c1_8uHga7ZcH|)
       (char->integer |c2_8u1d8AZcH|))))
(#%define char<?
  (#%lambda (|c1_8un961-cH| |c2_8uJ54u-cH|)
    (< (char->integer |c1_8un961-cH|)
       (char->integer |c2_8uJ54u-cH|))))
(#%define char=? eqv?)
(#%define char>=?
  (#%lambda (|c1_8u322X-cH| |c2_8up-_n_cH|)
    (#%if (char>? |c1_8u322X-cH| |c2_8up-_n_cH|)
      #t
      (char=? |c1_8u322X-cH| |c2_8up-_n_cH|))))
(#%define char<=?
  (#%lambda (|c1_8uLWZQ_cH| |c2_8u5TXh0dH|)
    (#%if (char<? |c1_8uLWZQ_cH| |c2_8u5TXh0dH|)
      #t
      (char=? |c1_8uLWZQ_cH| |c2_8u5TXh0dH|))))
(#%define char-ci>?
  (#%lambda (|c1_8urPVK0dH| |c2_8uNLTb1dH|)
    (char>?
      (char-downcase |c1_8urPVK0dH|)
      (char-downcase |c2_8uNLTb1dH|))))
(#%define char-ci<?
  (#%lambda (|c1_8u7IRE1dH| |c2_8utEP52dH|)
    (char<?
      (char-downcase |c1_8u7IRE1dH|)
      (char-downcase |c2_8utEP52dH|))))
(#%define char-ci=?
  (#%lambda (|c1_8uPANy2dH| |c2_8u9xL_2dH|)
    (char=?
      (char-downcase |c1_8uPANy2dH|)
      (char-downcase |c2_8u9xL_2dH|))))
(#%define char-ci>=?
  (#%lambda (|c1_8uvtJs3dH| |c2_8uRpHV3dH|)
    (#%if (char-ci>? |c1_8uvtJs3dH| |c2_8uRpHV3dH|)
      #t
      (char-ci=? |c1_8uvtJs3dH| |c2_8uRpHV3dH|))))
(#%define char-ci<=?
  (#%lambda (|c1_8ubmFm4dH| |c2_8uxiDP4dH|)
    (#%if (char-ci<? |c1_8ubmFm4dH| |c2_8uxiDP4dH|)
      #t
      (char-ci=? |c1_8ubmFm4dH| |c2_8uxiDP4dH|))))
(#%define char-alphabetic?
  (#%lambda (|c_8uTeBg5dH|)
    (#%if (char-ci>? |c_8uTeBg5dH| #\`)
      (char-ci<? |c_8uTeBg5dH| #\{)
      #f)))
(#%define char-numeric?
  (#%lambda (|c_8udbzJ5dH|)
    (#%if (char-ci>? |c_8udbzJ5dH| #\/)
      (char-ci<? |c_8udbzJ5dH| #\:)
      #f)))
(#%define char-whitespace?
  (#%lambda (|c_8uz7xa6dH|)
    (#%if (memv |c_8uz7xa6dH|
                (#%quote (#\space #\tab #\newline #\return)))
      #t
      #f)))
(#%define char-upper-case?
  (#%lambda (|c_8uV3vD6dH|)
    (#%if (char-alphabetic? |c_8uV3vD6dH|)
      (char<? |c_8uV3vD6dH| #\a)
      #f)))
(#%define char-lower-case?
  (#%lambda (|c_8uf0t47dH|)
    (#%if (char-alphabetic? |c_8uf0t47dH|)
      (char>? |c_8uf0t47dH| #\Z)
      #f)))
(#%define string-downcase (void))
(#%define string-upcase (void))
(#%letrec ((|string-map_8uBYqx7dH|
             (#%lambda (|strsrc_8ujGgO9dH|
                        |strdst_8uFCefadH|
                        |proc_8u_ycIadH|
                        |n_8ulva9bdH|
                        |l_8uHr8CbdH|)
               (#%if (< |n_8ulva9bdH| |l_8uHr8CbdH|)
                 (#%begin
                   (string-set!
                     |strdst_8uFCefadH|
                     |n_8ulva9bdH|
                     (|proc_8u_ycIadH|
                       (string-ref |strsrc_8ujGgO9dH| |n_8ulva9bdH|)))
                   (|string-map_8uBYqx7dH|
                     |strsrc_8ujGgO9dH|
                     |strdst_8uFCefadH|
                     |proc_8u_ycIadH|
                     (+ |n_8ulva9bdH| 1)
                     |l_8uHr8CbdH|))
                 |strdst_8uFCefadH|))))
  (#%begin
    (#%set! string-downcase
      (#%lambda (|str_8uXUo-7dH|)
        ((#%lambda (|newstr_8uhRmr8dH|)
           (|string-map_8uBYqx7dH|
             |str_8uXUo-7dH|
             |newstr_8uhRmr8dH|
             char-downcase
             0
             (string-length |str_8uXUo-7dH|)))
         (make-string (string-length |str_8uXUo-7dH|)))))
    (#%set! string-upcase
      (#%lambda (|str_8uDNkU8dH|)
        ((#%lambda (|newstr_8uZJil9dH|)
           (|string-map_8uBYqx7dH|
             |str_8uDNkU8dH|
             |newstr_8uZJil9dH|
             char-upcase
             0
             (string-length |str_8uDNkU8dH|)))
         (make-string (string-length |str_8uDNkU8dH|)))))))
(#%define string=? equal?)
(#%define string<?
  (#%letrec ((|s<?_8u1o63cdH|
               (#%lambda (|s1_8u3d0qddH| |s2_8up9-SddH|)
                 (#%if (null? |s1_8u3d0qddH|)
                   (#%if (null? |s2_8up9-SddH|) #f #t)
                   (#%if (null? |s2_8up9-SddH|)
                     #f
                     ((#%lambda (|c1_8uL5YjedH| |c2_8u52WMedH|)
                        (#%if (char<? |c1_8uL5YjedH| |c2_8u52WMedH|)
                          #t
                          (#%if (char>? |c1_8uL5YjedH| |c2_8u52WMedH|)
                            #f
                            (|s<?_8u1o63cdH|
                              (cdr |s1_8u3d0qddH|)
                              (cdr |s2_8up9-SddH|)))))
                      (car |s1_8u3d0qddH|)
                      (car |s2_8up9-SddH|)))))))
    (#%lambda (|s1_8unk4wcdH| |s2_8uJg2ZcdH|)
      (|s<?_8u1o63cdH|
        (string->list |s1_8unk4wcdH|)
        (string->list |s2_8uJg2ZcdH|)))))
(#%define string>?
  (#%letrec ((|s>?_8ur-TdfdH|
               (#%lambda (|s1_8utPNAgdH| |s2_8uPLL1hdH|)
                 (#%if (null? |s2_8uPLL1hdH|)
                   (#%if (null? |s1_8utPNAgdH|) #f #t)
                   (#%if (null? |s1_8utPNAgdH|)
                     #f
                     ((#%lambda (|c1_8u9IJuhdH| |c2_8uvEHXhdH|)
                        (#%if (char>? |c1_8u9IJuhdH| |c2_8uvEHXhdH|)
                          #t
                          (#%if (char<? |c1_8u9IJuhdH| |c2_8uvEHXhdH|)
                            #f
                            (|s>?_8ur-TdfdH|
                              (cdr |s1_8utPNAgdH|)
                              (cdr |s2_8uPLL1hdH|)))))
                      (car |s1_8utPNAgdH|)
                      (car |s2_8uPLL1hdH|)))))))
    (#%lambda (|s1_8uNWRGfdH| |s2_8u7TP7gdH|)
      (|s>?_8ur-TdfdH|
        (string->list |s1_8uNWRGfdH|)
        (string->list |s2_8u7TP7gdH|)))))
(#%define string<=?
  (#%lambda (|s1_8uRAFoidH| |s2_8ubxDRidH|)
    (#%if (string<? |s1_8uRAFoidH| |s2_8ubxDRidH|)
      #t
      (string=? |s1_8uRAFoidH| |s2_8ubxDRidH|))))
(#%define string>=?
  (#%lambda (|s1_8uxtBijdH| |s2_8uTpzLjdH|)
    (#%if (string>? |s1_8uxtBijdH| |s2_8uTpzLjdH|)
      #t
      (string=? |s1_8uxtBijdH| |s2_8uTpzLjdH|))))
(#%define string-ci=?
  (#%lambda (|s1_8udmxckdH| |s2_8uzivFkdH|)
    (string=?
      (string-downcase |s1_8udmxckdH|)
      (string-downcase |s2_8uzivFkdH|))))
(#%define string-ci<?
  (#%lambda (|s1_8uVet6ldH| |s2_8ufbrzldH|)
    (string<?
      (string-downcase |s1_8uVet6ldH|)
      (string-downcase |s2_8ufbrzldH|))))
(#%define string-ci>?
  (#%lambda (|s1_8uB7p0mdH| |s2_8uX3ntmdH|)
    (string>?
      (string-downcase |s1_8uB7p0mdH|)
      (string-downcase |s2_8uX3ntmdH|))))
(#%define string-ci>=?
  (#%lambda (|s1_8uh0lWmdH| |s2_8uDYinndH|)
    (string>=?
      (string-downcase |s1_8uh0lWmdH|)
      (string-downcase |s2_8uDYinndH|))))
(#%define string-ci<=?
  (#%lambda (|s1_8uZUgQndH| |s2_8ujRehodH|)
    (string<=?
      (string-downcase |s1_8uZUgQndH|)
      (string-downcase |s2_8ujRehodH|))))
(#%define substring
  (#%letrec ((|fill-string_8uFNcKodH|
               (#%lambda (|sstr_8unv2_qdH|
                          |dstr_8uJr0srdH|
                          |n_8u3o-UrdH|
                          |s_8upkYlsdH|
                          |e_8uLgWOsdH|)
                 (#%if (< |s_8upkYlsdH| |e_8uLgWOsdH|)
                   (#%begin
                     (string-set!
                       |dstr_8uJr0srdH|
                       |n_8u3o-UrdH|
                       (string-ref |sstr_8unv2_qdH| |s_8upkYlsdH|))
                     (|fill-string_8uFNcKodH|
                       |sstr_8unv2_qdH|
                       |dstr_8uJr0srdH|
                       (+ |n_8u3o-UrdH| 1)
                       (+ |s_8upkYlsdH| 1)
                       |e_8uLgWOsdH|))
                   #!void))))
    (#%lambda (|str_8u_JabpdH|
               |start_8ulG8EpdH|
               |end_8uHC65qdH|)
      ((#%lambda (|newstr_8u1z4yqdH|)
         (#%begin
           (|fill-string_8uFNcKodH|
             |str_8u_JabpdH|
             |newstr_8u1z4yqdH|
             0
             |start_8ulG8EpdH|
             |end_8uHC65qdH|)
           |newstr_8u1z4yqdH|))
       (make-string
         (- |end_8uHC65qdH| |start_8ulG8EpdH|))))))
(#%define list-ref
  (#%lambda (|list_8u5dUftdH| |n_8ur9SItdH|)
    (#%if (zero? |n_8ur9SItdH|)
      (car |list_8u5dUftdH|)
      (list-ref
        (cdr |list_8u5dUftdH|)
        (- |n_8ur9SItdH| 1)))))
(#%define values
  (#%lambda |args_8uN5Q9udH|
    (call-with-current-continuation
      (#%lambda (|k_8u72OCudH|)
        (apply |k_8u72OCudH| |args_8uN5Q9udH|)))))
