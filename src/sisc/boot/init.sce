(#%define for-each
  (#%lambda (|proc_xAxsNFJ9G|
             |ls1_xAbwPcJ9G|
             .
             |lists_xARzRLI9G|)
    (#%if (null? |ls1_xAbwPcJ9G|)
      #!void
      (#%begin
        (#%set! |lists_xARzRLI9G|
          (cons |ls1_xAbwPcJ9G| |lists_xARzRLI9G|))
        (apply |proc_xAxsNFJ9G|
               (map-car |lists_xARzRLI9G|))
        (apply for-each
               |proc_xAxsNFJ9G|
               (map-cdr |lists_xARzRLI9G|))))))
(#%define eof-object?
  (#%lambda (|x_xAToL6K9G|)
    (eq? |x_xAToL6K9G| #!eof)))
(#%define not
  (#%lambda (|x_xAdlJzK9G|)
    (#%if |x_xAdlJzK9G| #f #t)))
(#%define newline
  (#%lambda |port_xAzhH0L9G|
    (apply display #\newline |port_xAzhH0L9G|)))
(#%define reverse
  (#%letrec ((|iter_xAVdFtL9G|
               (#%lambda (|ls_xAB6BnM9G| |acc_xAX2zQM9G|)
                 (#%if (null? |ls_xAB6BnM9G|)
                   |acc_xAX2zQM9G|
                   (|iter_xAVdFtL9G|
                     (cdr |ls_xAB6BnM9G|)
                     (cons (car |ls_xAB6BnM9G|) |acc_xAX2zQM9G|))))))
    (#%lambda (|ls_xAfaDWL9G|)
      (|iter_xAVdFtL9G| |ls_xAfaDWL9G| ()))))
(#%define reverse!
  (#%letrec ((|iter_xAh_whN9G|
               (#%lambda (|s_xAZTsbO9G| |r_xAjQqEO9G|)
                 (#%if (null? |s_xAZTsbO9G|)
                   |r_xAjQqEO9G|
                   ((#%lambda (|d_xAFMo5P9G|)
                      (#%begin
                        (set-cdr! |s_xAZTsbO9G| |r_xAjQqEO9G|)
                        (|iter_xAh_whN9G| |d_xAFMo5P9G| |s_xAZTsbO9G|)))
                    (cdr |s_xAZTsbO9G|))))))
    (#%lambda (|s_xADXuKN9G|)
      (|iter_xAh_whN9G| |s_xADXuKN9G| ()))))
(#%define map-car
  (#%lambda (|ls_xA_ImyP9G|)
    (#%if (null? |ls_xA_ImyP9G|)
      ()
      (cons (caar |ls_xA_ImyP9G|)
            (map-car (cdr |ls_xA_ImyP9G|))))))
(#%define map-cdr
  (#%lambda (|ls_xAlFk_P9G|)
    (#%if (null? |ls_xAlFk_P9G|)
      ()
      (cons (cdar |ls_xAlFk_P9G|)
            (map-cdr (cdr |ls_xAlFk_P9G|))))))
(#%define map
  (#%letrec ((|map1_xAHBisQ9G|
               (#%lambda (|proc_xApj8JS9G|
                          |list_xALf6aT9G|
                          |acc_xA5c4DT9G|)
                 (#%if (null? |list_xALf6aT9G|)
                   (reverse |acc_xA5c4DT9G|)
                   (|map1_xAHBisQ9G|
                     |proc_xApj8JS9G|
                     (cdr |list_xALf6aT9G|)
                     (cons (|proc_xApj8JS9G| (car |list_xALf6aT9G|))
                           |acc_xA5c4DT9G|)))))
             (|loop_xA1ygVQ9G|
               (#%lambda (|proc_xAr824U9G|
                          |list1_xAN40xU9G|
                          |lists_xA71-ZU9G|
                          |c_xAtZXqV9G|)
                 (#%if (null? |list1_xAN40xU9G|)
                   (reverse |c_xAtZXqV9G|)
                   (|loop_xA1ygVQ9G|
                     |proc_xAr824U9G|
                     (cdr |list1_xAN40xU9G|)
                     (map-cdr |lists_xA71-ZU9G|)
                     (cons (apply |proc_xAr824U9G|
                                  (car |list1_xAN40xU9G|)
                                  (map-car |lists_xA71-ZU9G|))
                           |c_xAtZXqV9G|))))))
    (#%lambda (|proc_xA3nagS9G|
               |list1_xAJqcPR9G|
               .
               |lists_xAnuemR9G|)
      (#%if (null? |lists_xAnuemR9G|)
        (|map1_xAHBisQ9G|
          |proc_xA3nagS9G|
          |list1_xAJqcPR9G|
          ())
        (|loop_xA1ygVQ9G|
          |proc_xA3nagS9G|
          |list1_xAJqcPR9G|
          |lists_xAnuemR9G|
          ())))))
(#%define compose2
  (#%lambda (|f_xAPVVTV9G| |g_xA9STkW9G|)
    (#%lambda (|x_xAvORNW9G|)
      (|f_xAPVVTV9G| (|g_xA9STkW9G| |x_xAvORNW9G|)))))
(#%define assq (void))
(#%define assv (void))
(#%define assoc (void))
(#%define memq (void))
(#%define memv (void))
(#%define member (void))
(#%letrec ((|assn_xARKPeX9G|
             (#%lambda (|n_xAFXmA1aG| |obj_xA_Tk12aG| |alist_xAlQiu2aG|)
               (#%if (null? |alist_xAlQiu2aG|)
                 #f
                 (#%if (|n_xAFXmA1aG|
                         (caar |alist_xAlQiu2aG|)
                         |obj_xA_Tk12aG|)
                   (car |alist_xAlQiu2aG|)
                   (|assn_xARKPeX9G|
                     |n_xAFXmA1aG|
                     |obj_xA_Tk12aG|
                     (cdr |alist_xAlQiu2aG|))))))
           (|memn_xAbHNHX9G|
             (#%lambda (|n_xAHMgX2aG| |obj_xA1Jeo3aG| |list_xAnFcR3aG|)
               (#%if (null? |list_xAnFcR3aG|)
                 #f
                 (#%if (|n_xAHMgX2aG|
                         (car |list_xAnFcR3aG|)
                         |obj_xA1Jeo3aG|)
                   |list_xAnFcR3aG|
                   (|memn_xAbHNHX9G|
                     |n_xAHMgX2aG|
                     |obj_xA1Jeo3aG|
                     (cdr |list_xAnFcR3aG|)))))))
  (#%begin
    (#%set! assq
      (#%lambda (|obj_xAxDL8Y9G| |alist_xATzJBY9G|)
        (|assn_xARKPeX9G|
          eq?
          |obj_xAxDL8Y9G|
          |alist_xATzJBY9G|)))
    (#%set! assv
      (#%lambda (|obj_xAdwH2Z9G| |alist_xAzsFvZ9G|)
        (|assn_xARKPeX9G|
          eqv?
          |obj_xAdwH2Z9G|
          |alist_xAzsFvZ9G|)))
    (#%set! assoc
      (#%lambda (|obj_xAVoDYZ9G| |alist_xAflBp-9G|)
        (|assn_xARKPeX9G|
          equal?
          |obj_xAVoDYZ9G|
          |alist_xAflBp-9G|)))
    (#%set! memq
      (#%lambda (|obj_xABhzS-9G| |list_xAXdxj_9G|)
        (|memn_xAbHNHX9G|
          eq?
          |obj_xABhzS-9G|
          |list_xAXdxj_9G|)))
    (#%set! memv
      (#%lambda (|obj_xAhavM_9G| |list_xAD6td0aG|)
        (|memn_xAbHNHX9G|
          eqv?
          |obj_xAhavM_9G|
          |list_xAD6td0aG|)))
    (#%set! member
      (#%lambda (|obj_xAZ2rG0aG| |list_xAj_o71aG|)
        (|memn_xAbHNHX9G|
          equal?
          |obj_xAZ2rG0aG|
          |list_xAj_o71aG|)))))
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
  (#%lambda (|ls1_xAJBai4aG| |ls2_xA3y8L4aG|)
    (#%if (null? |ls1_xAJBai4aG|)
      |ls2_xA3y8L4aG|
      (cons (car |ls1_xAJBai4aG|)
            (append2 (cdr |ls1_xAJBai4aG|) |ls2_xA3y8L4aG|)))))
(#%define append append2)
(#%define list->string
  (#%letrec ((|l2s_xApu6c5aG|
               (#%lambda (|l_xA5n266aG| |s_xArj0z6aG| |n_xANf-_6aG|)
                 (#%if (null? |l_xA5n266aG|)
                   |s_xArj0z6aG|
                   (#%begin
                     (string-set!
                       |s_xArj0z6aG|
                       |n_xANf-_6aG|
                       (car |l_xA5n266aG|))
                     (|l2s_xApu6c5aG|
                       (cdr |l_xA5n266aG|)
                       |s_xArj0z6aG|
                       (+ |n_xANf-_6aG| 1)))))))
    (#%lambda (|l_xALq4F5aG|)
      (|l2s_xApu6c5aG|
        |l_xALq4F5aG|
        (make-string (length |l_xALq4F5aG|))
        0))))
(#%define string->list
  (#%letrec ((|s2l_xA7cYs7aG|
               (#%lambda (|s_xAP4Um8aG| |h_xA91SP8aG| |n_xAvZPg9aG|)
                 (#%if (< |n_xAvZPg9aG| 0)
                   |h_xA91SP8aG|
                   (|s2l_xA7cYs7aG|
                     |s_xAP4Um8aG|
                     (cons (string-ref |s_xAP4Um8aG| |n_xAvZPg9aG|)
                           |h_xA91SP8aG|)
                     (- |n_xAvZPg9aG| 1))))))
    (#%lambda (|s_xAt8WV7aG|)
      (|s2l_xA7cYs7aG|
        |s_xAt8WV7aG|
        ()
        (- (string-length |s_xAt8WV7aG|) 1)))))
(#%define list->vector
  (#%letrec ((|l2v_xARVNJ9aG|
               (#%lambda (|l_xAxOJDaaG| |v_xATKH4baG| |n_xAdHFxbaG|)
                 (#%if (null? |l_xAxOJDaaG|)
                   |v_xATKH4baG|
                   (#%begin
                     (vector-set!
                       |v_xATKH4baG|
                       |n_xAdHFxbaG|
                       (car |l_xAxOJDaaG|))
                     (|l2v_xARVNJ9aG|
                       (cdr |l_xAxOJDaaG|)
                       |v_xATKH4baG|
                       (+ |n_xAdHFxbaG| 1)))))))
    (#%lambda (|l_xAbSLaaaG|)
      (#%if (proper-list? |l_xAbSLaaaG|)
        (|l2v_xARVNJ9aG|
          |l_xAbSLaaaG|
          (make-vector (length |l_xAbSLaaaG|))
          0)
        (error (#%quote list->vector)
               "can only convert a proper list."
               |l_xAbSLaaaG|)))))
(#%define vector
  (#%lambda |elems_xAzDD-baG|
    (list->vector |elems_xAzDD-baG|)))
(#%define string
  (#%lambda |elems_xAVzBrcaG|
    (list->string |elems_xAVzBrcaG|)))
(#%define current-url (_make-parameter "file:."))
(#%define current-directory
  (#%lambda |rest_xAfwzUcaG|
    (#%if (null? |rest_xAfwzUcaG|)
      (normalize-url (current-url) ".")
      (current-url
        (normalize-url
          (current-url)
          ((#%lambda (|v_xABsxldaG|)
             ((#%lambda (|l_xAXovOdaG|)
                (#%if (eqv? (string-ref |v_xABsxldaG| (- |l_xAXovOdaG| 1))
                            #\/)
                  |v_xABsxldaG|
                  (string-append |v_xABsxldaG| "/")))
              (string-length |v_xABsxldaG|)))
           (car |rest_xAfwzUcaG|)))))))
(#%define file-handler (void))
(#%define add-file-handler (void))
((#%lambda (|*file-handlers*_xAhltfeaG|)
   (#%begin
     (#%set! add-file-handler
       (#%lambda (|extension_xADhrIeaG| |thunk_xAZdp9faG|)
         (#%if (assq |extension_xADhrIeaG|
                     |*file-handlers*_xAhltfeaG|)
           #!void
           (#%set! |*file-handlers*_xAhltfeaG|
             (cons (cons |extension_xADhrIeaG| |thunk_xAZdp9faG|)
                   |*file-handlers*_xAhltfeaG|)))))
     (#%set! file-handler
       ((#%lambda (|_load_xAjanCfaG|)
          (#%lambda (|extension_xAF6l3gaG|)
            ((#%lambda (|t_xA_2jwgaG|)
               (#%if |t_xA_2jwgaG|
                 (cdr |t_xA_2jwgaG|)
                 |_load_xAjanCfaG|))
             (assq (string->symbol
                     (string-downcase |extension_xAF6l3gaG|))
                   |*file-handlers*_xAhltfeaG|))))
        load))))
 ())
(#%define make-io-proc
  (#%lambda (|proc_xAl_gZgaG|)
    (#%lambda (|file_xA1UcThaG| . |rest_xAHXeqhaG|)
      (apply |proc_xAl_gZgaG|
             (normalize-url (current-url) |file_xA1UcThaG|)
             |rest_xAHXeqhaG|))))
((#%lambda (|file-extension_xAnQakiaG|)
   (#%begin
     (#%set! open-input-file
       (make-io-proc open-input-file))
     (#%set! open-source-input-file
       (make-io-proc open-source-input-file))
     (#%set! open-output-file
       (make-io-proc open-output-file))
     (#%set! load
       (#%lambda (|file_xAJM8NiaG|)
         (#%begin
           ((#%lambda (|previous-url_xA3J6ejaG|)
              (#%begin
                (current-url
                  (normalize-url
                    |previous-url_xA3J6ejaG|
                    |file_xAJM8NiaG|))
                (with-failure-continuation
                  (#%lambda (|m_xApF4HjaG| |e_xALB28kaG|)
                    (#%begin
                      (current-url |previous-url_xA3J6ejaG|)
                      (call-with-failure-continuation
                        (#%lambda (|fk_xA5y0BkaG|)
                          (|fk_xA5y0BkaG| |m_xApF4HjaG| |e_xALB28kaG|)))))
                  (#%lambda ()
                    ((#%lambda (|fe_xAru-1laG|)
                       ((file-handler
                          (#%if |fe_xAru-1laG| |fe_xAru-1laG| "scm"))
                        (current-url)))
                     (|file-extension_xAnQakiaG| (current-url)))))
                (current-url |previous-url_xA3J6ejaG|)))
            (current-url))
           (void))))))
 (#%lambda (|url_xANqYulaG|)
   ((#%letrec ((|loop_xA7nWXlaG|
                 (#%lambda (|x_xAtjUomaG| |acc_xAPfSRmaG|)
                   (#%if (null? |x_xAtjUomaG|)
                     #f
                     (#%if (equal? (car |x_xAtjUomaG|) #\.)
                       (list->string |acc_xAPfSRmaG|)
                       (|loop_xA7nWXlaG|
                         (cdr |x_xAtjUomaG|)
                         (cons (car |x_xAtjUomaG|) |acc_xAPfSRmaG|)))))))
      |loop_xA7nWXlaG|)
    (reverse! (string->list |url_xANqYulaG|))
    ())))
(#%define load-module
  (#%lambda (|str_xA9cQinaG|)
    ((#%lambda (|nl_xAv8OLnaG|)
       ((#%lambda (|binding-names_xAR4McoaG|)
          (for-each
            (#%lambda (|name_xAb1KFoaG|)
              (putprop
                |name_xAb1KFoaG|
                (native-library-binding
                  |nl_xAv8OLnaG|
                  |name_xAb1KFoaG|)))
            |binding-names_xAR4McoaG|))
        (native-library-binding-names |nl_xAv8OLnaG|)))
     (load-native-library |str_xA9cQinaG|))))
(#%define append
  (#%letrec ((|real-append_xAxZH6paG|
               (#%lambda (|ls1_xAzOBtqaG| . |lses_xAdSD0qaG|)
                 (#%if (null? |lses_xAdSD0qaG|)
                   |ls1_xAzOBtqaG|
                   (#%if (null? |ls1_xAzOBtqaG|)
                     (apply |real-append_xAxZH6paG| |lses_xAdSD0qaG|)
                     (apply |real-append_xAxZH6paG|
                            (append2 |ls1_xAzOBtqaG| (car |lses_xAdSD0qaG|))
                            (cdr |lses_xAdSD0qaG|)))))))
    (#%lambda |lses_xATVFzpaG|
      (#%if (null? |lses_xATVFzpaG|)
        ()
        (#%if (null? (cdr |lses_xATVFzpaG|))
          (car |lses_xATVFzpaG|)
          (apply |real-append_xAxZH6paG|
                 (car |lses_xATVFzpaG|)
                 (cdr |lses_xATVFzpaG|)))))))
(#%define proper-list?
  (#%lambda (|x_xAVKzWqaG|)
    ((#%letrec ((|lp_xAfHxnraG|
                  (#%lambda (|x_xABDvQraG| |lag_xAXzthsaG|)
                    (#%if (pair? |x_xABDvQraG|)
                      ((#%lambda (|x_xAhwrKsaG|)
                         (#%if (pair? |x_xAhwrKsaG|)
                           ((#%lambda (|x_xADspbtaG| |lag_xAZonEtaG|)
                              (#%if (eq? |x_xADspbtaG| |lag_xAZonEtaG|)
                                #f
                                (|lp_xAfHxnraG|
                                  |x_xADspbtaG|
                                  |lag_xAZonEtaG|)))
                            (cdr |x_xAhwrKsaG|)
                            (cdr |lag_xAXzthsaG|))
                           (null? |x_xAhwrKsaG|)))
                       (cdr |x_xABDvQraG|))
                      (null? |x_xABDvQraG|)))))
       |lp_xAfHxnraG|)
     |x_xAVKzWqaG|
     |x_xAVKzWqaG|)))
(#%define list? proper-list?)
(#%define expt
  (#%letrec ((|general-expt_xAjll5uaG|
               (#%lambda (|base_xA13bmwaG| |exponent_xAn_8PwaG|)
                 (exp (* |exponent_xAn_8PwaG| (log |base_xA13bmwaG|)))))
             (|rational-expt_xAFhjyuaG|
               (#%lambda (|base-numerator_xAJX6gxaG|
                          |base-denominator_xA3U4JxaG|
                          |exponent_xApQ2ayaG|)
                 (/ (expt |base-numerator_xAJX6gxaG|
                          |exponent_xApQ2ayaG|)
                    (expt |base-denominator_xA3U4JxaG|
                          |exponent_xApQ2ayaG|))))
             (|integer-expt_xA_dh_uaG|
               (#%lambda (|base_xALM0DyaG| |exponent_xA5J-3zaG|)
                 (#%if (negative? |exponent_xA5J-3zaG|)
                   (/ (|integer-expt_xA_dh_uaG|
                        |base_xALM0DyaG|
                        (abs |exponent_xA5J-3zaG|)))
                   (#%if (#%if (exact? |base_xALM0DyaG|)
                           (= |base_xALM0DyaG| 2)
                           #f)
                     (ashl 1 |exponent_xA5J-3zaG|)
                     ((#%letrec ((|loop_xArFYwzaG|
                                   (#%lambda (|rest_xANBWZzaG|
                                              |result_xA7yUqAaG|
                                              |squaring_xAtuSTAaG|)
                                     (#%if (zero? |rest_xANBWZzaG|)
                                       |result_xA7yUqAaG|
                                       (|loop_xArFYwzaG|
                                         (quotient |rest_xANBWZzaG| 2)
                                         (#%if (odd? |rest_xANBWZzaG|)
                                           (* |result_xA7yUqAaG|
                                              |squaring_xAtuSTAaG|)
                                           |result_xA7yUqAaG|)
                                         (* |squaring_xAtuSTAaG|
                                            |squaring_xAtuSTAaG|))))))
                        |loop_xArFYwzaG|)
                      |exponent_xA5J-3zaG|
                      1
                      |base_xALM0DyaG|))))))
    (#%lambda (|base_xAlafsvaG| |exponent_xAH6dVvaG|)
      (#%if (zero? |exponent_xAH6dVvaG|)
        (#%if (exact? |exponent_xAH6dVvaG|) 1 1.0)
        (#%if (zero? |base_xAlafsvaG|)
          (#%if (exact? |exponent_xAH6dVvaG|)
            |base_xAlafsvaG|
            0.0)
          (#%if (#%if (exact? |base_xAlafsvaG|)
                  (#%if (rational? |base_xAlafsvaG|)
                    (#%if (integer? |base_xAlafsvaG|) #f #t)
                    #f)
                  #f)
            (|rational-expt_xAFhjyuaG|
              (numerator |base_xAlafsvaG|)
              (denominator |base_xAlafsvaG|)
              |exponent_xAH6dVvaG|)
            (#%if (#%if (exact? |exponent_xAH6dVvaG|)
                    (integer? |exponent_xAH6dVvaG|)
                    #f)
              (|integer-expt_xA_dh_uaG|
                |base_xAlafsvaG|
                |exponent_xAH6dVvaG|)
              (|general-expt_xAjll5uaG|
                |base_xAlafsvaG|
                |exponent_xAH6dVvaG|))))))))
(#%define modpow
    (#%lambda (|x_PrRpqd4831| |y_PrbmoG4831| |n_Prxim75831|)
      (#%if (= |y_PrbmoG4831| 1)
        (modulo |x_PrRpqd4831| |n_Prxim75831|)
        (#%if (even? |y_PrbmoG4831|)
          ((#%lambda (|tmp_Prdbi16831|)
             (modulo
               (* |tmp_Prdbi16831| |tmp_Prdbi16831|)
               |n_Prxim75831|))
           (modpow
             |x_PrRpqd4831|
             (/ |y_PrbmoG4831| 2)
             |n_Prxim75831|))
          ((#%lambda (|tmp_PrTekA5831|)
             (modulo
               (* |x_PrRpqd4831|
                  (modulo
                    (* |tmp_PrTekA5831| |tmp_PrTekA5831|)
                    |n_Prxim75831|))
               |n_Prxim75831|))
           (modpow
             |x_PrRpqd4831|
             (/ (- |y_PrbmoG4831| 1) 2)
             |n_Prxim75831|))))))
(#%define integer?
  ((#%lambda (|oldint?_xAT4E2EaG|)
     (#%lambda (|n_xAd1CvEaG|)
       (#%if (|oldint?_xAT4E2EaG| |n_xAd1CvEaG|)
         #t
         (#%if (real? |n_xAd1CvEaG|)
           (= (round |n_xAd1CvEaG|) |n_xAd1CvEaG|)
           #f))))
   integer?))
(#%define real?
  ((#%lambda (|oldcomp?_xAzZzYEaG|)
     (#%lambda (|n_xAVVxpFaG|)
       (#%if (number? |n_xAVVxpFaG|)
         (#%if (|oldcomp?_xAzZzYEaG| |n_xAVVxpFaG|) #f #t)
         #f)))
   complex?))
(#%define rational? real?)
(#%define complex? number?)
(#%define abs
  (#%lambda (|num_xAfSvSFaG|)
    (#%if (real? |num_xAfSvSFaG|)
      (#%if (< |num_xAfSvSFaG| 0)
        (- |num_xAfSvSFaG|)
        |num_xAfSvSFaG|)
      ((#%lambda (|a_xABOtjGaG| |b_xAXKrMGaG|)
         (sqrt (+ (* |a_xABOtjGaG| |a_xABOtjGaG|)
                  (* |b_xAXKrMGaG| |b_xAXKrMGaG|))))
       (real-part |num_xAfSvSFaG|)
       (imag-part |num_xAfSvSFaG|)))))
(#%define min (void))
(#%define max (void))
(#%letrec ((|_min_max_xAhHpdHaG|
             (#%lambda (|proc_xA_ofuJaG|
                        |mv_xAlldXJaG|
                        |args_xAHhboKaG|
                        |inexact_xA1e9RKaG|)
               (#%if (null? |args_xAHhboKaG|)
                 (#%if (#%if |inexact_xA1e9RKaG|
                         (exact? |mv_xAlldXJaG|)
                         #f)
                   (exact->inexact |mv_xAlldXJaG|)
                   |mv_xAlldXJaG|)
                 (#%if (|proc_xA_ofuJaG|
                         (car |args_xAHhboKaG|)
                         |mv_xAlldXJaG|)
                   (|_min_max_xAhHpdHaG|
                     |proc_xA_ofuJaG|
                     (car |args_xAHhboKaG|)
                     (cdr |args_xAHhboKaG|)
                     (#%if |inexact_xA1e9RKaG|
                       #t
                       (inexact? (car |args_xAHhboKaG|))))
                   (|_min_max_xAhHpdHaG|
                     |proc_xA_ofuJaG|
                     |mv_xAlldXJaG|
                     (cdr |args_xAHhboKaG|)
                     |inexact_xA1e9RKaG|))))))
  (#%begin
    (#%set! min
      (#%lambda (|x1_xAZzl7IaG| . |args_xADDnGHaG|)
        (#%if (null? |args_xADDnGHaG|)
          |x1_xAZzl7IaG|
          (|_min_max_xAhHpdHaG|
            <
            |x1_xAZzl7IaG|
            |args_xADDnGHaG|
            (inexact? |x1_xAZzl7IaG|)))))
    (#%set! max
      (#%lambda (|x1_xAFsh1JaG| . |args_xAjwjAIaG|)
        (#%if (null? |args_xAjwjAIaG|)
          |x1_xAFsh1JaG|
          (|_min_max_xAhHpdHaG|
            >
            |x1_xAFsh1JaG|
            |args_xAjwjAIaG|
            (inexact? |x1_xAFsh1JaG|)))))))
(#%define negative?
  (#%lambda (|n_xAna7iLaG|) (< |n_xAna7iLaG| 0)))
(#%define positive?
  (#%lambda (|n_xAJ65LLaG|) (> |n_xAJ65LLaG| 0)))
(#%define even?
  (#%lambda (|n_xA333cMaG|)
    (= 0 (modulo |n_xA333cMaG| 2))))
(#%define odd?
  (#%lambda (|n_xAp_0FMaG|)
    (#%if (even? |n_xAp_0FMaG|) #f #t)))
(#%define zero?
  (#%lambda (|n_xALX-5NaG|) (= |n_xALX-5NaG| 0)))
(#%define add1
  (#%lambda (|n_xA5UYyNaG|) (+ |n_xA5UYyNaG| 1)))
(#%define sub1
  (#%lambda (|n_xArQW_NaG|) (- |n_xArQW_NaG| 1)))
(#%define >= (void))
(#%define <= (void))
((#%lambda (|_comp_help_xANMUsOaG| |_and2_xA7JSVOaG|)
   (#%begin
     (#%set! <=
       (|_comp_help_xANMUsOaG|
         (#%lambda (|a_xAtFQmPaG| |b_xAPBOPPaG|)
           (#%if (< |a_xAtFQmPaG| |b_xAPBOPPaG|)
             #t
             (= |a_xAtFQmPaG| |b_xAPBOPPaG|)))
         |_and2_xA7JSVOaG|
         #t))
     (#%set! >=
       (|_comp_help_xANMUsOaG|
         (#%lambda (|a_xA9yMgQaG| |b_xAvuKJQaG|)
           (#%if (> |a_xA9yMgQaG| |b_xAvuKJQaG|)
             #t
             (= |a_xA9yMgQaG| |b_xAvuKJQaG|)))
         |_and2_xA7JSVOaG|
         #t))))
 (#%lambda (|comparator_xARqIaRaG|
            |chainer_xAbnGDRaG|
            |endstate_xAxjE4SaG|)
   (#%lambda |args_xATfCxSaG|
     ((#%letrec ((|loop_xAdcA-SaG|
                   (#%lambda (|x_xAz8yrTaG|)
                     (#%if (null? |x_xAz8yrTaG|)
                       |endstate_xAxjE4SaG|
                       (#%if (null? (cdr |x_xAz8yrTaG|))
                         |endstate_xAxjE4SaG|
                         (|chainer_xAbnGDRaG|
                           (|comparator_xARqIaRaG|
                             (car |x_xAz8yrTaG|)
                             (cadr |x_xAz8yrTaG|))
                           (|loop_xAdcA-SaG| (cdr |x_xAz8yrTaG|))))))))
        |loop_xAdcA-SaG|)
      |args_xATfCxSaG|)))
 (#%lambda (|x_xAV4wUTaG| |y_xAf1ulUaG|)
   (#%if |x_xAV4wUTaG| |y_xAf1ulUaG| #f)))
((#%lambda (|_?=_xABZrOUaG|)
   (#%begin
     (#%set! >= (|_?=_xABZrOUaG| > >=))
     (#%set! <= (|_?=_xABZrOUaG| < <=))))
 (#%lambda (|comparator_xAXVpfVaG| |chainer_xAhSnIVaG|)
   (#%lambda |args_xADOl9WaG|
     (#%if (null? |args_xADOl9WaG|)
       #t
       (#%if (null? (cdr |args_xADOl9WaG|))
         #t
         (#%if (#%if (= (car |args_xADOl9WaG|)
                        (cadr |args_xADOl9WaG|))
                 #t
                 (|comparator_xAXVpfVaG|
                   (car |args_xADOl9WaG|)
                   (cadr |args_xADOl9WaG|)))
           (apply |chainer_xAhSnIVaG|
                  (cdr |args_xADOl9WaG|))
           #f))))))
(#%define gcd
  (#%lambda |args_xAjHh3XaG|
    (#%if (null? |args_xAjHh3XaG|)
      0
      (#%if (null? (cdr |args_xAjHh3XaG|))
        (car |args_xAjHh3XaG|)
        (_gcd (car |args_xAjHh3XaG|)
              (cadr |args_xAjHh3XaG|))))))
(#%define lcm
  (#%lambda |args_xAFDfwXaG|
    (#%if (null? |args_xAFDfwXaG|)
      1
      (#%if (null? (cdr |args_xAFDfwXaG|))
        (car |args_xAFDfwXaG|)
        (_lcm (car |args_xAFDfwXaG|)
              (cadr |args_xAFDfwXaG|))))))
(#%define modulo
  (#%lambda (|x_xA_zdZXaG| |y_xAlwbqYaG|)
    ((#%lambda (|r_xAHs9TYaG|)
       (#%if ((#%if (negative? |y_xAlwbqYaG|)
                positive?
                negative?)
              |r_xAHs9TYaG|)
         (+ |r_xAHs9TYaG| |y_xAlwbqYaG|)
         |r_xAHs9TYaG|))
     (remainder |x_xA_zdZXaG| |y_xAlwbqYaG|))))
(#%define string-append
  (#%lambda |args_73w3K4aLH|
    (#%if (null? |args_73w3K4aLH|)
          ""
          (#%if (null? (cdr |args_73w3K4aLH|))
                (car |args_73w3K4aLH|)
                (#%begin
                 #t
                 (apply string-append
                        (_string-append
                         (car |args_73w3K4aLH|)
                         (cadr |args_73w3K4aLH|))
                        (cddr |args_73w3K4aLH|)))))))
(#%define char-downcase
  ((#%lambda (|a_xA1p7kZaG|)
     ((#%lambda (|z_xAnl5NZaG|)
        ((#%lambda (|lc-offset_xAJh3e-aG|)
           (#%lambda (|c_xA3e1H-aG|)
             ((#%lambda (|cv_xApa_7_aG|)
                (#%if (#%if (>= |cv_xApa_7_aG| |a_xA1p7kZaG|)
                        (<= |cv_xApa_7_aG| |z_xAnl5NZaG|)
                        #f)
                  (integer->char
                    (+ |cv_xApa_7_aG| |lc-offset_xAJh3e-aG|))
                  |c_xA3e1H-aG|))
              (char->integer |c_xA3e1H-aG|))))
         (- (char->integer #\a) |a_xA1p7kZaG|)))
      (char->integer #\Z)))
   (char->integer #\A)))
(#%define char-upcase
  ((#%lambda (|a_xAL6ZA_aG|)
     ((#%lambda (|z_xA53X10bG|)
        ((#%lambda (|uc-offset_xAr_Uu0bG|)
           (#%lambda (|c_xANXSX0bG|)
             ((#%lambda (|cv_xA7UQo1bG|)
                (#%if (#%if (>= |cv_xA7UQo1bG| |a_xAL6ZA_aG|)
                        (<= |cv_xA7UQo1bG| |z_xA53X10bG|)
                        #f)
                  (integer->char
                    (- |cv_xA7UQo1bG| |uc-offset_xAr_Uu0bG|))
                  |c_xANXSX0bG|))
              (char->integer |c_xANXSX0bG|))))
         (- |a_xAL6ZA_aG| (char->integer #\A))))
      (char->integer #\z)))
   (char->integer #\a)))
(#%define char>?
  (#%lambda (|c1_xA9JKL2bG|
             |c2_xAPMMi2bG|
             .
             |args_xAtQOR1bG|)
    (apply >
           (char->integer |c1_xA9JKL2bG|)
           (char->integer |c2_xAPMMi2bG|)
           (map char->integer |args_xAtQOR1bG|))))
(#%define char<?
  (#%lambda (|c1_xAbyE64bG|
             |c2_xARBGF3bG|
             .
             |args_xAvFIc3bG|)
    (apply <
           (char->integer |c1_xAbyE64bG|)
           (char->integer |c2_xARBGF3bG|)
           (map char->integer |args_xAvFIc3bG|))))
(#%define char=? eqv?)
(#%define char>=?
  (#%lambda (|c1_xAxuCz4bG| |c2_xATqA05bG|)
    (#%if (char>? |c1_xAxuCz4bG| |c2_xATqA05bG|)
      #t
      (char=? |c1_xAxuCz4bG| |c2_xATqA05bG|))))
(#%define char<=?
  (#%lambda (|c1_xAdnyt5bG| |c2_xAzjwW5bG|)
    (#%if (char<? |c1_xAdnyt5bG| |c2_xAzjwW5bG|)
      #t
      (char=? |c1_xAdnyt5bG| |c2_xAzjwW5bG|))))
(#%define char-ci>?
  (#%lambda (|c1_xAB8qh7bG|
             |c2_xAfcsQ6bG|
             .
             |args_xAVfun6bG|)
    (apply char>?
           (char-downcase |c1_xAB8qh7bG|)
           (char-downcase |c2_xAfcsQ6bG|)
           (map char-downcase |args_xAVfun6bG|))))
(#%define char-ci<?
  (#%lambda (|c1_xADZjE8bG|
             |c2_xAh1mb8bG|
             .
             |args_xAX4oK7bG|)
    (apply char<?
           (char-downcase |c1_xADZjE8bG|)
           (char-downcase |c2_xAh1mb8bG|)
           (map char-downcase |args_xAX4oK7bG|))))
(#%define char-ci=?
  (#%lambda (|c1_xAFOd_9bG|
             |c2_xAjSfy9bG|
             .
             |args_xAZVh59bG|)
    (apply char=?
           (char-downcase |c1_xAFOd_9bG|)
           (char-downcase |c2_xAjSfy9bG|)
           (map char-downcase |args_xAZVh59bG|))))
(#%define char-ci>=?
  (#%lambda (|c1_xA_KbsabG| |c2_xAlH9VabG|)
    (#%if (char-ci>? |c1_xA_KbsabG| |c2_xAlH9VabG|)
      #t
      (char-ci=? |c1_xA_KbsabG| |c2_xAlH9VabG|))))
(#%define char-ci<=?
  (#%lambda (|c1_xAHD7mbbG| |c2_xA1A5PbbG|)
    (#%if (char-ci<? |c1_xAHD7mbbG| |c2_xA1A5PbbG|)
      #t
      (char-ci=? |c1_xAHD7mbbG| |c2_xA1A5PbbG|))))
(#%define char-alphabetic?
  (#%lambda (|c_xAnw3gcbG|)
    (#%if (char<? #\@ |c_xAnw3gcbG| #\[)
      #t
      (char<? #\` |c_xAnw3gcbG| #\{))))
(#%define char-numeric?
  (#%lambda (|c_xAJs1JcbG|)
    (char<? #\/ |c_xAJs1JcbG| #\:)))
(#%define char-whitespace?
  (#%lambda (|c_xA3p_9dbG|)
    (#%if (char=? |c_xA3p_9dbG| #\space)
      #t
      (#%if (char=? |c_xA3p_9dbG| #\tab)
        #t
        (#%if (char=? |c_xA3p_9dbG| #\newline)
          #t
          (char=? |c_xA3p_9dbG| #\return))))))
(#%define char-upper-case?
  (#%lambda (|c_xAplZCdbG|)
    (char<? #\@ |c_xAplZCdbG| #\[)))
(#%define char-lower-case?
  (#%lambda (|c_xALhX3ebG|)
    (char<? #\` |c_xALhX3ebG| #\{)))
(#%define string-downcase (void))
(#%define string-upcase (void))
(#%letrec ((|string-map_xA5eVwebG|
             (#%lambda (|strsrc_xAPXKNgbG|
                        |strdst_xA9UIehbG|
                        |proc_xAvQGHhbG|
                        |n_xARME8ibG|
                        |l_xAbJCBibG|)
               (#%if (< |n_xARME8ibG| |l_xAbJCBibG|)
                 (#%begin
                   (string-set!
                     |strdst_xA9UIehbG|
                     |n_xARME8ibG|
                     (|proc_xAvQGHhbG|
                       (string-ref |strsrc_xAPXKNgbG| |n_xARME8ibG|)))
                   (|string-map_xA5eVwebG|
                     |strsrc_xAPXKNgbG|
                     |strdst_xA9UIehbG|
                     |proc_xAvQGHhbG|
                     (+ |n_xARME8ibG| 1)
                     |l_xAbJCBibG|))
                 |strdst_xA9UIehbG|))))
  (#%begin
    (#%set! string-downcase
      (#%lambda (|str_xAraTZebG|)
        ((#%lambda (|newstr_xAN6RqfbG|)
           (|string-map_xA5eVwebG|
             |str_xAraTZebG|
             |newstr_xAN6RqfbG|
             char-downcase
             0
             (string-length |str_xAraTZebG|)))
         (make-string (string-length |str_xAraTZebG|)))))
    (#%set! string-upcase
      (#%lambda (|str_xA73PTfbG|)
        ((#%lambda (|newstr_xAt_MkgbG|)
           (|string-map_xA5eVwebG|
             |str_xA73PTfbG|
             |newstr_xAt_MkgbG|
             char-upcase
             0
             (string-length |str_xA73PTfbG|)))
         (make-string (string-length |str_xA73PTfbG|)))))))
(#%define string=? equal?)
(#%define string<?
  (#%letrec ((|s<?_xAxFA2jbG|
               (#%lambda (|s1_xAzuupkbG| |s2_xAVqsSkbG|)
                 (#%if (null? |s1_xAzuupkbG|)
                   (#%if (null? |s2_xAVqsSkbG|) #f #t)
                   (#%if (null? |s2_xAVqsSkbG|)
                     #f
                     ((#%lambda (|c1_xAfnqjlbG| |c2_xABjoMlbG|)
                        (#%if (char<? |c1_xAfnqjlbG| |c2_xABjoMlbG|)
                          #t
                          (#%if (char>? |c1_xAfnqjlbG| |c2_xABjoMlbG|)
                            #f
                            (|s<?_xAxFA2jbG|
                              (cdr |s1_xAzuupkbG|)
                              (cdr |s2_xAVqsSkbG|)))))
                      (car |s1_xAzuupkbG|)
                      (car |s2_xAVqsSkbG|)))))))
    (#%lambda (|s1_xATByvjbG| |s2_xAdywYjbG|)
      (|s<?_xAxFA2jbG|
        (string->list |s1_xATByvjbG|)
        (string->list |s2_xAdywYjbG|)))))
(#%define string>?
  (#%letrec ((|s>?_xAXfmdmbG|
               (#%lambda (|s1_xAZ4gAnbG| |s2_xAj1e1obG|)
                 (#%if (null? |s2_xAj1e1obG|)
                   (#%if (null? |s1_xAZ4gAnbG|) #f #t)
                   (#%if (null? |s1_xAZ4gAnbG|)
                     #f
                     ((#%lambda (|c1_xAFZbuobG| |c2_xA_V9XobG|)
                        (#%if (char>? |c1_xAFZbuobG| |c2_xA_V9XobG|)
                          #t
                          (#%if (char<? |c1_xAFZbuobG| |c2_xA_V9XobG|)
                            #f
                            (|s>?_xAXfmdmbG|
                              (cdr |s1_xAZ4gAnbG|)
                              (cdr |s2_xAj1e1obG|)))))
                      (car |s1_xAZ4gAnbG|)
                      (car |s2_xAj1e1obG|)))))))
    (#%lambda (|s1_xAhckGmbG| |s2_xAD8i7nbG|)
      (|s>?_xAXfmdmbG|
        (string->list |s1_xAhckGmbG|)
        (string->list |s2_xAD8i7nbG|)))))
(#%define string<=?
  (#%lambda (|s1_xAlS7opbG| |s2_xAHO5RpbG|)
    (#%if (string<? |s1_xAlS7opbG| |s2_xAHO5RpbG|)
      #t
      (string=? |s1_xAlS7opbG| |s2_xAHO5RpbG|))))
(#%define string>=?
  (#%lambda (|s1_xA1L3iqbG| |s2_xAnH1LqbG|)
    (#%if (string>? |s1_xA1L3iqbG| |s2_xAnH1LqbG|)
      #t
      (string=? |s1_xA1L3iqbG| |s2_xAnH1LqbG|))))
(#%define string-ci=?
  (#%lambda (|s1_xAJD_brbG| |s2_xA3AZErbG|)
    (string=?
      (string-downcase |s1_xAJD_brbG|)
      (string-downcase |s2_xA3AZErbG|))))
(#%define string-ci<?
  (#%lambda (|s1_xApwX5sbG| |s2_xALsVysbG|)
    (string<?
      (string-downcase |s1_xApwX5sbG|)
      (string-downcase |s2_xALsVysbG|))))
(#%define string-ci>?
  (#%lambda (|s1_xA5pT_sbG| |s2_xArlRstbG|)
    (string>?
      (string-downcase |s1_xA5pT_sbG|)
      (string-downcase |s2_xArlRstbG|))))
(#%define string-ci>=?
  (#%lambda (|s1_xANhPVtbG| |s2_xA7eNmubG|)
    (string>=?
      (string-downcase |s1_xANhPVtbG|)
      (string-downcase |s2_xA7eNmubG|))))
(#%define string-ci<=?
  (#%lambda (|s1_xAtaLPubG| |s2_xAP6JgvbG|)
    (string<=?
      (string-downcase |s1_xAtaLPubG|)
      (string-downcase |s2_xAP6JgvbG|))))
(#%define substring
  (#%letrec ((|fill-string_xA93HJvbG|
               (#%lambda (|sstr_xATMw-xbG|
                          |dstr_xAdJurybG|
                          |n_xAzFsUybG|
                          |s_xAVBqlzbG|
                          |e_xAfyoOzbG|)
                 (#%if (< |s_xAVBqlzbG| |e_xAfyoOzbG|)
                   (#%begin
                     (string-set!
                       |dstr_xAdJurybG|
                       |n_xAzFsUybG|
                       (string-ref |sstr_xATMw-xbG| |s_xAVBqlzbG|))
                     (|fill-string_xA93HJvbG|
                       |sstr_xATMw-xbG|
                       |dstr_xAdJurybG|
                       (+ |n_xAzFsUybG| 1)
                       (+ |s_xAVBqlzbG| 1)
                       |e_xAfyoOzbG|))
                   #!void))))
    (#%lambda (|str_xAv_EawbG|
               |start_xARXCDwbG|
               |end_xAbUA4xbG|)
      ((#%lambda (|newstr_xAxQyxxbG|)
         (#%begin
           (|fill-string_xA93HJvbG|
             |str_xAv_EawbG|
             |newstr_xAxQyxxbG|
             0
             |start_xARXCDwbG|
             |end_xAbUA4xbG|)
           |newstr_xAxQyxxbG|))
       (make-string
         (- |end_xAbUA4xbG| |start_xARXCDwbG|))))))
(#%define list-ref
  (#%lambda (|list_xABumfAbG| |n_xAXqkIAbG|)
    (#%if (zero? |n_xAXqkIAbG|)
      (car |list_xABumfAbG|)
      (list-ref
        (cdr |list_xABumfAbG|)
        (- |n_xAXqkIAbG| 1)))))
(#%define values
  (#%lambda |args_xAhni9BbG|
    (call-with-current-continuation
      (#%lambda (|k_xADjgCBbG|)
        (apply |k_xADjgCBbG| |args_xAhni9BbG|)))))
