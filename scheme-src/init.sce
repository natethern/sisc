(define for-each
  (lambda (|proc_SuKNX8TRU|
           |ls1_SuoRZHSRU|
           .
           |lists_Su2V_eSRU|)
    (if (null? |ls1_SuoRZHSRU|)
      (compile-in-annotation
        (void)
        ((line-number . 404)
         (column-number . 13)
         (source-file . "file:init2.scm")))
      (begin
        (set! |lists_Su2V_eSRU|
          (cons |ls1_SuoRZHSRU| |lists_Su2V_eSRU|))
        (apply |proc_SuKNX8TRU|
               (map-car |lists_Su2V_eSRU|))
        (apply for-each
               |proc_SuKNX8TRU|
               (map-cdr |lists_Su2V_eSRU|))))))
(define eof-object?
  (lambda (|x_Su4KVBTRU|)
    (eq? |x_Su4KVBTRU| '#!eof)))
(define not
  (lambda (|x_SuqGT2URU|)
    (if |x_SuqGT2URU| '#f '#t)))
(define newline
  (lambda |port_SuMCRvURU|
    (apply display '#\newline |port_SuMCRvURU|)))
(define reverse
  (letrec ((|iter_Su6zPYURU|
             (lambda (|ls_SuOrLSVRU| |acc_Su8oJjWRU|)
               (if (null? |ls_SuOrLSVRU|)
                 |acc_Su8oJjWRU|
                 (|iter_Su6zPYURU|
                   (cdr |ls_SuOrLSVRU|)
                   (cons (car |ls_SuOrLSVRU|) |acc_Su8oJjWRU|))))))
    (lambda (|ls_SusvNpVRU|)
      (|iter_Su6zPYURU| |ls_SusvNpVRU| '()))))
(define map-car
  (lambda (|ls_SuukHMWRU|)
    (if (null? |ls_SuukHMWRU|)
      '()
      (cons (caar |ls_SuukHMWRU|)
            (map-car (cdr |ls_SuukHMWRU|))))))
(define map-cdr
  (lambda (|ls_SuQgFdXRU|)
    (if (null? |ls_SuQgFdXRU|)
      '()
      (cons (cdar |ls_SuQgFdXRU|)
            (map-cdr (cdr |ls_SuQgFdXRU|))))))
(define map
  (letrec ((|map1_SuadDGXRU|
             (lambda (|proc_SuUWsXZRU|
                      |list_SueTqo-RU|
                      |acc_SuAPoR-RU|)
               (if (null? |list_SueTqo-RU|)
                 (reverse |acc_SuAPoR-RU|)
                 (|map1_SuadDGXRU|
                   |proc_SuUWsXZRU|
                   (cdr |list_SueTqo-RU|)
                   (cons (|proc_SuUWsXZRU| (car |list_SueTqo-RU|))
                         |acc_SuAPoR-RU|)))))
           (|loop_Suw9B7YRU|
             (lambda (|proc_SuWLmi_RU|
                      |list1_SugIkL_RU|
                      |lists_SuCEic0SU|
                      |c_SuYAgF0SU|)
               (if (null? |list1_SugIkL_RU|)
                 (reverse |c_SuYAgF0SU|)
                 (|loop_Suw9B7YRU|
                   |proc_SuWLmi_RU|
                   (cdr |list1_SugIkL_RU|)
                   (map-cdr |lists_SuCEic0SU|)
                   (cons (apply |proc_SuWLmi_RU|
                                (car |list1_SugIkL_RU|)
                                (map-car |lists_SuCEic0SU|))
                         |c_SuYAgF0SU|))))))
    (lambda (|proc_Suy-uuZRU|
             |list1_Suc2x1ZRU|
             .
             |lists_SuS5zAYRU|)
      (if (null? |lists_SuS5zAYRU|)
        (|map1_SuadDGXRU|
          |proc_Suy-uuZRU|
          |list1_Suc2x1ZRU|
          '())
        (|loop_Suw9B7YRU|
          |proc_Suy-uuZRU|
          |list1_Suc2x1ZRU|
          |lists_SuS5zAYRU|
          '())))))
(define compose
  (lambda |rest_Suixe61SU|
    (if (null? |rest_Suixe61SU|)
      (lambda (|x_SuGi6W2SU|) |x_SuGi6W2SU|)
      ((lambda (|f_SuEtcz1SU| |g_Su-pa02SU|)
         (lambda (|x_Sukm8t2SU|)
           (|f_SuEtcz1SU| (|g_Su-pa02SU| |x_Sukm8t2SU|))))
       (car |rest_Suixe61SU|)
       (apply compose (cdr |rest_Suixe61SU|))))))
(define compose2
  (lambda (|f_Su0f4n3SU| |g_Sumb2Q3SU|)
    (lambda (|x_SuI70h4SU|)
      (|f_Su0f4n3SU| (|g_Sumb2Q3SU| |x_SuI70h4SU|)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
(letrec ((|assn_Su24-J4SU|
           (lambda (|n_SuSgx3bSU| |obj_SucdvwbSU| |alist_Suy9tZbSU|)
             (if (null? |alist_Suy9tZbSU|)
               '#f
               (if (|n_SuSgx3bSU|
                     (caar |alist_Suy9tZbSU|)
                     |obj_SucdvwbSU|)
                 (car |alist_Suy9tZbSU|)
                 (|assn_Su24-J4SU|
                   |n_SuSgx3bSU|
                   |obj_SucdvwbSU|
                   (cdr |alist_Suy9tZbSU|))))))
         (|memn_Suo0Ya5SU|
           (lambda (|n_SuU5rqcSU| |obj_Sue2pTcSU| |list_SuA-mkdSU|)
             (if (null? |list_SuA-mkdSU|)
               '#f
               (if (|n_SuU5rqcSU|
                     (car |list_SuA-mkdSU|)
                     |obj_Sue2pTcSU|)
                 |list_SuA-mkdSU|
                 (|memn_Suo0Ya5SU|
                   |n_SuU5rqcSU|
                   |obj_Sue2pTcSU|
                   (cdr |list_SuA-mkdSU|)))))))
  (begin
    (set! assq
      (lambda (|obj_SuKYVD5SU| |alist_Su4VT46SU|)
        (|assn_Su24-J4SU|
          eq?
          |obj_SuKYVD5SU|
          |alist_Su4VT46SU|)))
    (set! assv
      (lambda (|obj_SuqRRx6SU| |alist_SuMNP-6SU|)
        (|assn_Su24-J4SU|
          eqv?
          |obj_SuqRRx6SU|
          |alist_SuMNP-6SU|)))
    (set! assoc
      (lambda (|obj_Su6KNr7SU| |alist_SusGLU7SU|)
        (|assn_Su24-J4SU|
          equal?
          |obj_Su6KNr7SU|
          |alist_SusGLU7SU|)))
    (set! memq
      (lambda (|obj_SuOCJl8SU| |list_Su8zHO8SU|)
        (|memn_Suo0Ya5SU|
          eq?
          |obj_SuOCJl8SU|
          |list_Su8zHO8SU|)))
    (set! memv
      (lambda (|obj_SuuvFf9SU| |list_SuQrDI9SU|)
        (|memn_Suo0Ya5SU|
          eqv?
          |obj_SuuvFf9SU|
          |list_SuQrDI9SU|)))
    (set! member
      (lambda (|obj_SuaoB9aSU| |list_SuwkzCaSU|)
        (|memn_Suo0Ya5SU|
          equal?
          |obj_SuaoB9aSU|
          |list_SuwkzCaSU|)))))
(define cadr (compose2 car cdr))
(define cdar (compose2 cdr car))
(define cddr (compose2 cdr cdr))
(define caar (compose2 car car))
(define caaar (compose2 car caar))
(define caadr (compose2 car cadr))
(define cadar (compose2 car cdar))
(define caddr (compose2 car cddr))
(define cdaar (compose2 cdr caar))
(define cdadr (compose2 cdr cadr))
(define cddar (compose2 cdr cdar))
(define cdddr (compose2 cdr cddr))
(define caaaar (compose2 car caaar))
(define caaadr (compose2 car caadr))
(define caadar (compose2 car cadar))
(define caaddr (compose2 car caddr))
(define cadaar (compose2 car cdaar))
(define cadadr (compose2 car cdadr))
(define caddar (compose2 car cddar))
(define cadddr (compose2 car cdddr))
(define cdaaar (compose2 cdr caaar))
(define cdaadr (compose2 cdr caadr))
(define cdadar (compose2 cdr cadar))
(define cdaddr (compose2 cdr caddr))
(define cddaar (compose2 cdr cdaar))
(define cddadr (compose2 cdr cdadr))
(define cdddar (compose2 cdr cddar))
(define cddddr (compose2 cdr cdddr))
(define append2
  (lambda (|ls1_SuWWkNdSU| |ls2_SugTieeSU|)
    (if (null? |ls1_SuWWkNdSU|)
      |ls2_SugTieeSU|
      (cons (car |ls1_SuWWkNdSU|)
            (append2 (cdr |ls1_SuWWkNdSU|) |ls2_SugTieeSU|)))))
(define append append2)
(define list->string
  (letrec ((|l2s_SuCPgHeSU|
             (lambda (|l_SuiIcBfSU| |s_SuEEa2gSU| |n_Su-A8vgSU|)
               (if (null? |l_SuiIcBfSU|)
                 |s_SuEEa2gSU|
                 (begin
                   (string-set!
                     |s_SuEEa2gSU|
                     |n_Su-A8vgSU|
                     (car |l_SuiIcBfSU|))
                   (|l2s_SuCPgHeSU|
                     (cdr |l_SuiIcBfSU|)
                     |s_SuEEa2gSU|
                     (+ |n_Su-A8vgSU| '1)))))))
    (lambda (|l_SuYLe8fSU|)
      (|l2s_SuCPgHeSU|
        |l_SuYLe8fSU|
        (make-string (length |l_SuYLe8fSU|))
        '0))))
(define string->list
  (letrec ((|s2l_Sukx6YgSU|
             (lambda (|s_Su0q2ShSU| |h_Summ0jiSU| |n_SuIi-LiSU|)
               (if (< |n_SuIi-LiSU| '0)
                 |h_Summ0jiSU|
                 (|s2l_Sukx6YgSU|
                   |s_Su0q2ShSU|
                   (cons (string-ref |s_Su0q2ShSU| |n_SuIi-LiSU|)
                         |h_Summ0jiSU|)
                   (- |n_SuIi-LiSU| '1))))))
    (lambda (|s_SuGt4phSU|)
      (|s2l_Sukx6YgSU|
        |s_SuGt4phSU|
        '()
        (- (string-length |s_SuGt4phSU|) '1)))))
(define list->vector
  (letrec ((|l2v_Su2fYcjSU|
             (lambda (|l_SuK7U6kSU| |v_Su44SzkSU| |n_Suq0Q0lSU|)
               (if (null? |l_SuK7U6kSU|)
                 |v_Su44SzkSU|
                 (begin
                   (vector-set!
                     |v_Su44SzkSU|
                     |n_Suq0Q0lSU|
                     (car |l_SuK7U6kSU|))
                   (|l2v_Su2fYcjSU|
                     (cdr |l_SuK7U6kSU|)
                     |v_Su44SzkSU|
                     (+ |n_Suq0Q0lSU| '1)))))))
    (lambda (|l_SuobWFjSU|)
      (if (proper-list? |l_SuobWFjSU|)
        (|l2v_Su2fYcjSU|
          |l_SuobWFjSU|
          (make-vector (length |l_SuobWFjSU|))
          '0)
        (error 'list->vector
               '"can only convert a proper list."
               |l_SuobWFjSU|)))))
(define vector
  (lambda |elems_SuMYNtlSU|
    (list->vector |elems_SuMYNtlSU|)))
(define string
  (lambda |elems_Su6VLWlSU|
    (list->string |elems_Su6VLWlSU|)))
(define detect-os
  (lambda ()
    ((lambda (|osn_SusRJnmSU|)
       (if (> (string-length |osn_SusRJnmSU|) '3)
         (if (equal? (substring |osn_SusRJnmSU| '0 '3) '"mac")
           'macos
           (if (equal? (substring |osn_SusRJnmSU| '0 '3) '"win")
             'ms-dos
             (if (equal? (substring |osn_SusRJnmSU| '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring |osn_SusRJnmSU| '0 '3) '"uni")
                 'unix
                 (if (equal? (substring |osn_SusRJnmSU| '0 '3) '"lin")
                   'unix
                   (if (equal?
                         (substring |osn_SusRJnmSU| '0 '4)
                         '"os/2")
                     'os2
                     (if (equal? (substring |osn_SusRJnmSU| '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase
       (getprop 'os.name '*environment-variables*)))))
(define current-url (make-parameter '"file:."))
(define current-directory
  (lambda |rest_SuONHQmSU|
    (if (null? |rest_SuONHQmSU|)
      (normalize-url (current-url) '".")
      (current-url
        (normalize-url
          (current-url)
          ((lambda (|v_Su8KFhnSU|)
             ((lambda (|l_SuuGDKnSU|)
                (if (eqv? (string-ref |v_Su8KFhnSU| (- |l_SuuGDKnSU| '1))
                          '#\/)
                  |v_Su8KFhnSU|
                  (string-append |v_Su8KFhnSU| '"/")))
              (string-length |v_Su8KFhnSU|)))
           (car |rest_SuONHQmSU|)))))))
(define load-expanded load)
((lambda (|_load_SuQCBboSU|)
   ((lambda (|normalize_SuazzEoSU|
             |file-handler_Suwvx5pSU|
             |file-extension_SuSrvypSU|)
      (begin
        (set! open-input-file
          (|normalize_SuazzEoSU| open-input-file))
        (set! open-source-input-file
          (|normalize_SuazzEoSU| open-source-input-file))
        (set! open-output-file
          (|normalize_SuazzEoSU| open-output-file))
        (set! load
          (lambda (|file_Sucot_pSU|)
            (begin
              ((lambda (|previous-url_SuykrsqSU|)
                 (begin
                   (current-url
                     (normalize-url
                       |previous-url_SuykrsqSU|
                       |file_Sucot_pSU|))
                   (with-failure-continuation
                     (lambda (|m_SuUgpVqSU| |e_SuednmrSU|)
                       (begin
                         (current-url |previous-url_SuykrsqSU|)
                         (call-with-failure-continuation
                           (lambda (|fk_SuA9lPrSU|)
                             (|fk_SuA9lPrSU| |m_SuUgpVqSU| |e_SuednmrSU|)))))
                     (lambda ()
                       ((lambda (|fe_SuW5jgsSU|)
                          ((|file-handler_Suwvx5pSU|
                             (if |fe_SuW5jgsSU| |fe_SuW5jgsSU| '"scm"))
                           (current-url)))
                        (|file-extension_SuSrvypSU| (current-url)))))
                   (current-url |previous-url_SuykrsqSU|)))
               (current-url))
              (void))))))
    (lambda (|proc_Sug2hJsSU|)
      (lambda (|file_SuYWcDtSU| . |rest_SuC-eatSU|)
        (apply |proc_Sug2hJsSU|
               (normalize-url (current-url) |file_SuYWcDtSU|)
               |rest_SuC-eatSU|)))
    (lambda (|extension_SuiTa4uSU|)
      ((lambda (|t_SuEP8xuSU|)
         (if (memv |t_SuEP8xuSU| '(sce pp))
           load-expanded
           (if (eqv? |t_SuEP8xuSU| 'sll)
             (with-failure-continuation
               (lambda (|m_Su-L6-uSU| |e_SukI4rvSU|)
                 (lambda (|name_SuGE2UvSU|)
                   (error 'load
                          '"shared libraries not supported in this build.")))
               (lambda ()
                 (eval '(lambda (name)
                          (import compiled-libraries)
                          (link-library (open-library name))))))
             |_load_SuQCBboSU|)))
       (string->symbol
         (string-downcase |extension_SuiTa4uSU|))))
    (lambda (|url_Su0B0lwSU|)
      ((letrec ((|loop_Sumx-NwSU|
                  (lambda (|x_SuItYexSU| |acc_Su2qWHxSU|)
                    (if (null? |x_SuItYexSU|)
                      '#f
                      (if (equal? (car |x_SuItYexSU|) '#\.)
                        (list->string |acc_Su2qWHxSU|)
                        (|loop_Sumx-NwSU|
                          (cdr |x_SuItYexSU|)
                          (cons (car |x_SuItYexSU|) |acc_Su2qWHxSU|)))))))
         |loop_Sumx-NwSU|)
       (reverse (string->list |url_Su0B0lwSU|))
       '()))))
 load)
(define load-module
  (lambda (|str_SuomU8ySU|)
    ((lambda (|nl_SuKiSBySU|)
       ((lambda (|binding-names_Su4fQ2zSU|)
          (for-each
            (lambda (|name_SuqbOvzSU|)
              (putprop
                |name_SuqbOvzSU|
                '*toplevel*
                (native-library-binding
                  |nl_SuKiSBySU|
                  |name_SuqbOvzSU|)))
            |binding-names_Su4fQ2zSU|))
        (native-library-binding-names |nl_SuKiSBySU|)))
     (load-native-library |str_SuomU8ySU|))))
(define append
  (letrec ((|real-append_SuM7MYzSU|
             (lambda (|ls1_SuOYFjBSU| . |lses_Sus0ISASU|)
               (if (null? |lses_Sus0ISASU|)
                 |ls1_SuOYFjBSU|
                 (if (null? |ls1_SuOYFjBSU|)
                   (apply |real-append_SuM7MYzSU| |lses_Sus0ISASU|)
                   (apply |real-append_SuM7MYzSU|
                          (append2 |ls1_SuOYFjBSU| (car |lses_Sus0ISASU|))
                          (cdr |lses_Sus0ISASU|)))))))
    (lambda |lses_Su64KpASU|
      (if (null? |lses_Su64KpASU|)
        '()
        (if (null? (cdr |lses_Su64KpASU|))
          (car |lses_Su64KpASU|)
          (apply |real-append_SuM7MYzSU|
                 (car |lses_Su64KpASU|)
                 (cdr |lses_Su64KpASU|)))))))
(define proper-list?
  (lambda (|x_Su8VDMBSU|)
    ((letrec ((|lp_SuuRBdCSU|
                (lambda (|x_SuQNzGCSU| |lag_SuaKx7DSU|)
                  (if (pair? |x_SuQNzGCSU|)
                    ((lambda (|x_SuwGvADSU|)
                       (if (pair? |x_SuwGvADSU|)
                         ((lambda (|x_SuSCt1ESU| |lag_SuczruESU|)
                            (if (eq? |x_SuSCt1ESU| |lag_SuczruESU|)
                              '#f
                              (|lp_SuuRBdCSU| |x_SuSCt1ESU| |lag_SuczruESU|)))
                          (cdr |x_SuwGvADSU|)
                          (cdr |lag_SuaKx7DSU|))
                         (null? |x_SuwGvADSU|)))
                     (cdr |x_SuQNzGCSU|))
                    (null? |x_SuQNzGCSU|)))))
       |lp_SuuRBdCSU|)
     |x_Su8VDMBSU|
     |x_Su8VDMBSU|)))
(define list? proper-list?)
(define expt
  (letrec ((|general-expt_SuyvpXESU|
             (lambda (|base_SuWghLGSU| |exponent_SugdfcHSU|)
               (exp (* |exponent_SugdfcHSU| (log |base_SuWghLGSU|)))))
           (|integer-expt_SuUrnoFSU|
             (lambda (|base_SuC9dFHSU| |exponent_SuY5b6ISU|)
               (if (negative? |exponent_SuY5b6ISU|)
                 (/ (|integer-expt_SuUrnoFSU|
                      |base_SuC9dFHSU|
                      (abs |exponent_SuY5b6ISU|)))
                 (if (if (exact? |base_SuC9dFHSU|)
                       (= |base_SuC9dFHSU| '2)
                       '#f)
                   (ashl '1 |exponent_SuY5b6ISU|)
                   ((letrec ((|loop_Sui29zISU|
                               (lambda (|rest_SuE-60JSU|
                                        |result_Su-W4tJSU|
                                        |squaring_SukT2WJSU|)
                                 (if (zero? |rest_SuE-60JSU|)
                                   |result_Su-W4tJSU|
                                   (|loop_Sui29zISU|
                                     (quotient |rest_SuE-60JSU| '2)
                                     (if (odd? |rest_SuE-60JSU|)
                                       (* |result_Su-W4tJSU|
                                          |squaring_SukT2WJSU|)
                                       |result_Su-W4tJSU|)
                                     (* |squaring_SukT2WJSU|
                                        |squaring_SukT2WJSU|))))))
                      |loop_Sui29zISU|)
                    |exponent_SuY5b6ISU|
                    '1
                    |base_SuC9dFHSU|))))))
    (lambda (|base_SueolRFSU| |exponent_SuAkjiGSU|)
      (if (zero? |exponent_SuAkjiGSU|)
        (if (exact? |exponent_SuAkjiGSU|) '1 '1.0)
        (if (zero? |base_SueolRFSU|)
          (if (exact? |exponent_SuAkjiGSU|)
            |base_SueolRFSU|
            '0.0)
          (if (if (exact? |exponent_SuAkjiGSU|)
                (integer? |exponent_SuAkjiGSU|)
                '#f)
            (|integer-expt_SuUrnoFSU|
              |base_SueolRFSU|
              |exponent_SuAkjiGSU|)
            (|general-expt_SuyvpXESU|
              |base_SueolRFSU|
              |exponent_SuAkjiGSU|)))))))
(define modpow
  (lambda (|x_SuGP0nKSU| |y_Su0M-PKSU| |n_SumIYgLSU|)
    (if (= |y_Su0M-PKSU| '1)
      (modulo |x_SuGP0nKSU| |n_SumIYgLSU|)
      (if (even? |y_Su0M-PKSU|)
        ((lambda (|tmp_SuoxSDMSU|)
           (modulo
             (* |tmp_SuoxSDMSU| |tmp_SuoxSDMSU|)
             |n_SumIYgLSU|))
         (modpow
           |x_SuGP0nKSU|
           (/ |y_Su0M-PKSU| '2)
           |n_SumIYgLSU|))
        ((lambda (|tmp_Su2BUaMSU|)
           (begin
             (set! |tmp_Su2BUaMSU|
               (modulo
                 (* |tmp_Su2BUaMSU| |tmp_Su2BUaMSU|)
                 |n_SumIYgLSU|))
             (modulo
               (* |x_SuGP0nKSU| |tmp_Su2BUaMSU|)
               |n_SumIYgLSU|)))
         (modpow
           |x_SuGP0nKSU|
           (/ (- |y_Su0M-PKSU| '1) '2)
           |n_SumIYgLSU|))))))
(define integer?
  ((lambda (|oldint?_SuKtQ4NSU|)
     (lambda (|n_Su4qOxNSU|)
       ((lambda (|t_SuqmM-NSU|)
          (if |t_SuqmM-NSU|
            |t_SuqmM-NSU|
            (if (real? |n_Su4qOxNSU|)
              (= (round |n_Su4qOxNSU|) |n_Su4qOxNSU|)
              '#f)))
        (|oldint?_SuKtQ4NSU| |n_Su4qOxNSU|))))
   integer?))
(define real?
  ((lambda (|oldcomp?_SuMiKrOSU|)
     (lambda (|n_Su6fIUOSU|)
       (if (number? |n_Su6fIUOSU|)
         (if (|oldcomp?_SuMiKrOSU| |n_Su6fIUOSU|) '#f '#t)
         '#f)))
   complex?))
(define rational? real?)
(define complex? number?)
(define abs
  (lambda (|num_SusbGlPSU|)
    (if (real? |num_SusbGlPSU|)
      (if (< |num_SusbGlPSU| '0)
        (- |num_SusbGlPSU|)
        |num_SusbGlPSU|)
      ((lambda (|a_SuO7EOPSU| |b_Su84CfQSU|)
         (sqrt (+ (* |a_SuO7EOPSU| |a_SuO7EOPSU|)
                  (* |b_Su84CfQSU| |b_Su84CfQSU|))))
       (real-part |num_SusbGlPSU|)
       (imag-part |num_SusbGlPSU|)))))
(define min (void))
(define max (void))
(letrec ((|_min_max_Suu0AIQSU|
           (lambda (|proc_SucKpZSSU|
                    |mv_SuyGnqTSU|
                    |args_SuUClTTSU|
                    |inexact_SuezjkUSU|)
             (if (null? |args_SuUClTTSU|)
               (if (if |inexact_SuezjkUSU|
                     (exact? |mv_SuyGnqTSU|)
                     '#f)
                 (exact->inexact |mv_SuyGnqTSU|)
                 |mv_SuyGnqTSU|)
               (if (|proc_SucKpZSSU|
                     (car |args_SuUClTTSU|)
                     |mv_SuyGnqTSU|)
                 (|_min_max_Suu0AIQSU|
                   |proc_SucKpZSSU|
                   (car |args_SuUClTTSU|)
                   (cdr |args_SuUClTTSU|)
                   (if |inexact_SuezjkUSU|
                     |inexact_SuezjkUSU|
                     (inexact? (car |args_SuUClTTSU|))))
                 (|_min_max_Suu0AIQSU|
                   |proc_SucKpZSSU|
                   |mv_SuyGnqTSU|
                   (cdr |args_SuUClTTSU|)
                   |inexact_SuezjkUSU|))))))
  (begin
    (set! min
      (lambda (|x1_SuaVvCRSU| . |args_SuQYx9RSU|)
        (if (null? |args_SuQYx9RSU|)
          |x1_SuaVvCRSU|
          (|_min_max_Suu0AIQSU|
            <
            |x1_SuaVvCRSU|
            |args_SuQYx9RSU|
            (inexact? |x1_SuaVvCRSU|)))))
    (set! max
      (lambda (|x1_SuSNrwSSU| . |args_SuwRt3SSU|)
        (if (null? |args_SuwRt3SSU|)
          |x1_SuSNrwSSU|
          (|_min_max_Suu0AIQSU|
            >
            |x1_SuSNrwSSU|
            |args_SuwRt3SSU|
            (inexact? |x1_SuSNrwSSU|)))))))
(define negative?
  (lambda (|n_SuWrfeVSU|) (< |n_SuWrfeVSU| '0)))
(define positive?
  (lambda (|n_SugodHVSU|) (> |n_SugodHVSU| '0)))
(define even?
  (lambda (|n_SuCkb8WSU|)
    (= '0 (modulo |n_SuCkb8WSU| '2))))
(define odd?
  (lambda (|n_SuYg9BWSU|)
    (if (even? |n_SuYg9BWSU|) '#f '#t)))
(define zero?
  (lambda (|n_Suid72XSU|) (= |n_Suid72XSU| '0)))
(define add1
  (lambda (|n_SuE95vXSU|) (+ |n_SuE95vXSU| '1)))
(define sub1
  (lambda (|n_Su-53YXSU|) (- |n_Su-53YXSU| '1)))
(define >= (void))
(define <= (void))
((lambda (|_comp_help_Suk21pYSU| |_and2_SuG--RYSU|)
   (begin
     (set! <=
       (|_comp_help_Suk21pYSU|
         (lambda (|a_Su0XYiZSU| |b_SumTWLZSU|)
           ((lambda (|t_SuIPUc-SU|)
              (if |t_SuIPUc-SU|
                |t_SuIPUc-SU|
                (= |a_Su0XYiZSU| |b_SumTWLZSU|)))
            (< |a_Su0XYiZSU| |b_SumTWLZSU|)))
         |_and2_SuG--RYSU|
         '#t))
     (set! >=
       (|_comp_help_Suk21pYSU|
         (lambda (|a_Su2MSF-SU| |b_SuoIQ6_SU|)
           ((lambda (|t_SuKEOz_SU|)
              (if |t_SuKEOz_SU|
                |t_SuKEOz_SU|
                (= |a_Su2MSF-SU| |b_SuoIQ6_SU|)))
            (> |a_Su2MSF-SU| |b_SuoIQ6_SU|)))
         |_and2_SuG--RYSU|
         '#t))))
 (lambda (|comparator_Su4BM00TU|
          |chainer_SuqxKt0TU|
          |endstate_SuMtIW0TU|)
   (lambda |args_Su6qGn1TU|
     ((letrec ((|loop_SusmEQ1TU|
                 (lambda (|x_SuOiCh2TU|)
                   (if (null? |x_SuOiCh2TU|)
                     |endstate_SuMtIW0TU|
                     (if (null? (cdr |x_SuOiCh2TU|))
                       |endstate_SuMtIW0TU|
                       (|chainer_SuqxKt0TU|
                         (|comparator_Su4BM00TU|
                           (car |x_SuOiCh2TU|)
                           (cadr |x_SuOiCh2TU|))
                         (|loop_SusmEQ1TU| (cdr |x_SuOiCh2TU|))))))))
        |loop_SusmEQ1TU|)
      |args_Su6qGn1TU|)))
 (lambda (|x_Su8fAK2TU| |y_Suubyb3TU|)
   (if |x_Su8fAK2TU| |y_Suubyb3TU| '#f)))
((lambda (|_?=_SuQ7wE3TU|)
   (begin
     (set! >= (|_?=_SuQ7wE3TU| > >=))
     (set! <= (|_?=_SuQ7wE3TU| < <=))))
 (lambda (|comparator_Sua4u54TU| |chainer_Suw0sy4TU|)
   (lambda |args_SuSYp_4TU|
     ((lambda (|t_SucVns5TU|)
        (if |t_SucVns5TU|
          |t_SucVns5TU|
          ((lambda (|t_SuyRlV5TU|)
             (if |t_SuyRlV5TU|
               |t_SuyRlV5TU|
               (if ((lambda (|t_SuUNjm6TU|)
                      (if |t_SuUNjm6TU|
                        |t_SuUNjm6TU|
                        (|comparator_Sua4u54TU|
                          (car |args_SuSYp_4TU|)
                          (cadr |args_SuSYp_4TU|))))
                    (= (car |args_SuSYp_4TU|)
                       (cadr |args_SuSYp_4TU|)))
                 (apply |chainer_Suw0sy4TU|
                        (cdr |args_SuSYp_4TU|))
                 '#f)))
           (null? (cdr |args_SuSYp_4TU|)))))
      (null? |args_SuSYp_4TU|)))))
(define gcd
  (lambda |args_SueKhP6TU|
    (if (null? |args_SueKhP6TU|)
      '0
      (if (null? (cdr |args_SueKhP6TU|))
        (car |args_SueKhP6TU|)
        (_gcd (car |args_SueKhP6TU|)
              (cadr |args_SueKhP6TU|))))))
(define lcm
  (lambda |args_SuAGfg7TU|
    (if (null? |args_SuAGfg7TU|)
      '1
      (if (null? (cdr |args_SuAGfg7TU|))
        (car |args_SuAGfg7TU|)
        (_lcm (car |args_SuAGfg7TU|)
              (cadr |args_SuAGfg7TU|))))))
(max-precision '1500)
(define pi-10 (string->number '"3.1415926536"))
(define pi-70
  (string->number
    '"3.1415926535897932384626433832795028841971693993751058209749445923078164"))
(define pi-1000
  (string->number
    '"3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679821480865132823066470938446095505822317253594081284811174502841027019385211055596446229489549303819644288109756659334461284756482337867831652712019091456485669234603486104543266482133936072602491412737245870066063155881748815209209628292540917153643678925903600113305305488204665213841469519415116094330572703657595919530921861173819326117931051185480744623799627495673518857527248912279381830119491298336733624406566430860213949463952247371907021798609437027705392171762931767523846748184676694051320005681271452635608277857713427577896091736371787214684409012249534301465495853710507922796892589235420199561121290219608640344181598136297747713099605187072113499999983729780499510597317328160963185950244594553469083026425223082533446850352619311881710100031378387528865875332083814206171776691473035982534904287554687311595628638823537875937519577818577805321712268066130019278766111959092164201989"))
(define pi pi-10)
(define e-10 (string->number '"2.7182818285"))
(define e-70
  (string->number
    '"2.7182818284590452353602874713526624977572470936999595749669676277240766"))
(define e-1000
  (string->number
    '"2.7182818284590452353602874713526624977572470936999595749669676277240766303535475945713821785251664274274663919320030599218174135966290435729003342952605956307381323286279434907632338298807531952510190115738341879307021540891499348841675092447614606680822648001684774118537423454424371075390777449920695517027618386062613313845830007520449338265602976067371132007093287091274437470472306969772093101416928368190255151086574637721112523897844250569536967707854499699679468644549059879316368892300987931277361782154249992295763514822082698951936680331825288693984964651058209392398294887933203625094431173012381970684161403970198376793206832823764648042953118023287825098194558153017567173613320698112509961818815930416903515988885193458072738667385894228792284998920868058257492796104841984443634632449684875602336248270419786232090021609902353043699418491463140934317381436405462531520961836908887070167683964243781405927145635490613031072085103837505101157477041718986106873969655212671546889570350354"))
(define e e-10)
(define modulo
  (lambda (|x_SuWCdJ7TU| |y_Sugzba8TU|)
    ((lambda (|r_SuCv9D8TU|)
       (if (if (negative? |y_Sugzba8TU|)
             (positive? |r_SuCv9D8TU|)
             (negative? |r_SuCv9D8TU|))
         (+ |r_SuCv9D8TU| |y_Sugzba8TU|)
         |r_SuCv9D8TU|))
     (remainder |x_SuWCdJ7TU| |y_Sugzba8TU|))))
(max-precision '32)
(define string-append
  (lambda |args_SuYr749TU|
    (if (null? |args_SuYr749TU|)
      '""
      (if (null? (cdr |args_SuYr749TU|))
        (car |args_SuYr749TU|)
        (apply string-append
               (_string-append
                 (car |args_SuYr749TU|)
                 (cadr |args_SuYr749TU|))
               (cddr |args_SuYr749TU|))))))
(define char-downcase
  ((lambda (|a_Suio5x9TU|)
     ((lambda (|z_SuEk3-9TU|)
        ((lambda (|lc-offset_Su-g1raTU|)
           (lambda (|c_Sukd_TaTU|)
             ((lambda (|cv_SuG9ZkbTU|)
                (if (if (>= |cv_SuG9ZkbTU| |a_Suio5x9TU|)
                      (<= |cv_SuG9ZkbTU| |z_SuEk3-9TU|)
                      '#f)
                  (integer->char
                    (+ |cv_SuG9ZkbTU| |lc-offset_Su-g1raTU|))
                  |c_Sukd_TaTU|))
              (char->integer |c_Sukd_TaTU|))))
         (- (char->integer '#\a) |a_Suio5x9TU|)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (|a_Su06XNbTU|)
     ((lambda (|z_Sum2VecTU|)
        ((lambda (|uc-offset_SuI-SHcTU|)
           (lambda (|c_Su2XQ8dTU|)
             ((lambda (|cv_SuoTOBdTU|)
                (if (if (>= |cv_SuoTOBdTU| |a_Su06XNbTU|)
                      (<= |cv_SuoTOBdTU| |z_Sum2VecTU|)
                      '#f)
                  (integer->char
                    (- |cv_SuoTOBdTU| |uc-offset_SuI-SHcTU|))
                  |c_Su2XQ8dTU|))
              (char->integer |c_Su2XQ8dTU|))))
         (- |a_Su06XNbTU| (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (|c1_SuKPM2eTU| |c2_Su4MKveTU|)
    (> (char->integer |c1_SuKPM2eTU|)
       (char->integer |c2_Su4MKveTU|))))
(define char<?
  (lambda (|c1_SuqIIYeTU| |c2_SuMEGpfTU|)
    (< (char->integer |c1_SuqIIYeTU|)
       (char->integer |c2_SuMEGpfTU|))))
(define char=? eqv?)
(define char>=?
  (lambda (|c1_Su6BESfTU| |c2_SusxCjgTU|)
    ((lambda (|t_SuOtAMgTU|)
       (if |t_SuOtAMgTU|
         |t_SuOtAMgTU|
         (char=? |c1_Su6BESfTU| |c2_SusxCjgTU|)))
     (char>? |c1_Su6BESfTU| |c2_SusxCjgTU|))))
(define char<=?
  (lambda (|c1_Su8qydhTU| |c2_SuumwGhTU|)
    ((lambda (|t_SuQiu7iTU|)
       (if |t_SuQiu7iTU|
         |t_SuQiu7iTU|
         (char=? |c1_Su8qydhTU| |c2_SuumwGhTU|)))
     (char<? |c1_Su8qydhTU| |c2_SuumwGhTU|))))
(define char-ci>?
  (lambda (|c1_SuafsAiTU| |c2_Suwbq1jTU|)
    (char>?
      (char-downcase |c1_SuafsAiTU|)
      (char-downcase |c2_Suwbq1jTU|))))
(define char-ci<?
  (lambda (|c1_SuS7oujTU| |c2_Suc4mXjTU|)
    (char<?
      (char-downcase |c1_SuS7oujTU|)
      (char-downcase |c2_Suc4mXjTU|))))
(define char-ci=?
  (lambda (|c1_Suy0kokTU| |c2_SuUYhRkTU|)
    (char=?
      (char-downcase |c1_Suy0kokTU|)
      (char-downcase |c2_SuUYhRkTU|))))
(define char-ci>=?
  (lambda (|c1_SueVfilTU| |c2_SuARdLlTU|)
    ((lambda (|t_SuWNbcmTU|)
       (if |t_SuWNbcmTU|
         |t_SuWNbcmTU|
         (char-ci=? |c1_SueVfilTU| |c2_SuARdLlTU|)))
     (char-ci>? |c1_SueVfilTU| |c2_SuARdLlTU|))))
(define char-ci<=?
  (lambda (|c1_SugK9FmTU| |c2_SuCG76nTU|)
    ((lambda (|t_SuYC5znTU|)
       (if |t_SuYC5znTU|
         |t_SuYC5znTU|
         (char-ci=? |c1_SugK9FmTU| |c2_SuCG76nTU|)))
     (char-ci<? |c1_SugK9FmTU| |c2_SuCG76nTU|))))
(define char-alphabetic?
  (lambda (|c_Suiz30oTU|)
    (if (char-ci>=? |c_Suiz30oTU| '#\a)
      (char-ci<=? |c_Suiz30oTU| '#\z)
      '#f)))
(define char-numeric?
  (lambda (|c_SuEv1toTU|)
    (if (char-ci>=? |c_SuEv1toTU| '#\0)
      (char-ci<=? |c_SuEv1toTU| '#\9)
      '#f)))
(define char-whitespace?
  (lambda (|c_Su-r_VoTU|)
    (if (memq |c_Su-r_VoTU| '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (|c_SukoZmpTU|)
    (if (char-alphabetic? |c_SukoZmpTU|)
      (char<? |c_SukoZmpTU| '#\a)
      '#f)))
(define char-lower-case?
  (lambda (|c_SuGkXPpTU|)
    (if (char-alphabetic? |c_SuGkXPpTU|)
      (char>? |c_SuGkXPpTU| '#\Z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
(letrec ((|string-map_Su0hVgqTU|
           (lambda (|strsrc_SuK-KxsTU|
                    |strdst_Su4XI-sTU|
                    |proc_SuqTGrtTU|
                    |n_SuMPEUtTU|
                    |l_Su6MCluTU|)
             (if (< |n_SuMPEUtTU| |l_Su6MCluTU|)
               (begin
                 (string-set!
                   |strdst_Su4XI-sTU|
                   |n_SuMPEUtTU|
                   (|proc_SuqTGrtTU|
                     (string-ref |strsrc_SuK-KxsTU| |n_SuMPEUtTU|)))
                 (|string-map_Su0hVgqTU|
                   |strsrc_SuK-KxsTU|
                   |strdst_Su4XI-sTU|
                   |proc_SuqTGrtTU|
                   (+ |n_SuMPEUtTU| '1)
                   |l_Su6MCluTU|))
               |strdst_Su4XI-sTU|))))
  (begin
    (set! string-downcase
      (lambda (|str_SumdTJqTU|)
        ((lambda (|newstr_SuI9RarTU|)
           (|string-map_Su0hVgqTU|
             |str_SumdTJqTU|
             |newstr_SuI9RarTU|
             char-downcase
             '0
             (string-length |str_SumdTJqTU|)))
         (make-string (string-length |str_SumdTJqTU|)))))
    (set! string-upcase
      (lambda (|str_Su26PDrTU|)
        ((lambda (|newstr_Suo2N4sTU|)
           (|string-map_Su0hVgqTU|
             |str_Su26PDrTU|
             |newstr_Suo2N4sTU|
             char-upcase
             '0
             (string-length |str_Su26PDrTU|)))
         (make-string (string-length |str_Su26PDrTU|)))))))
(define string=? equal?)
(define string<?
  (letrec ((|s<?_SusIAOuTU|
             (lambda (|s1_Suuxu9wTU| |s2_SuQtsCwTU|)
               (if (null? |s1_Suuxu9wTU|)
                 (if (null? |s2_SuQtsCwTU|) '#f '#t)
                 (if (null? |s2_SuQtsCwTU|)
                   '#f
                   ((lambda (|c1_Suaqq3xTU| |c2_SuwmowxTU|)
                      (if (char<? |c1_Suaqq3xTU| |c2_SuwmowxTU|)
                        '#t
                        (if (char>? |c1_Suaqq3xTU| |c2_SuwmowxTU|)
                          '#f
                          (|s<?_SusIAOuTU|
                            (cdr |s1_Suuxu9wTU|)
                            (cdr |s2_SuQtsCwTU|)))))
                    (car |s1_Suuxu9wTU|)
                    (car |s2_SuQtsCwTU|)))))))
    (lambda (|s1_SuOEyfvTU| |s2_Su8BwIvTU|)
      (|s<?_SusIAOuTU|
        (string->list |s1_SuOEyfvTU|)
        (string->list |s2_Su8BwIvTU|)))))
(define string>?
  (letrec ((|s>?_SuSimZxTU|
             (lambda (|s1_SuU7gkzTU| |s2_Sue4eNzTU|)
               (if (null? |s2_Sue4eNzTU|)
                 (if (null? |s1_SuU7gkzTU|) '#f '#t)
                 (if (null? |s1_SuU7gkzTU|)
                   '#f
                   ((lambda (|c1_SuA0ceATU| |c2_SuWY9HATU|)
                      (if (char>? |c1_SuA0ceATU| |c2_SuWY9HATU|)
                        '#t
                        (if (char<? |c1_SuA0ceATU| |c2_SuWY9HATU|)
                          '#f
                          (|s>?_SuSimZxTU|
                            (cdr |s1_SuU7gkzTU|)
                            (cdr |s2_Sue4eNzTU|)))))
                    (car |s1_SuU7gkzTU|)
                    (car |s2_Sue4eNzTU|)))))))
    (lambda (|s1_SucfkqyTU| |s2_SuybiTyTU|)
      (|s>?_SuSimZxTU|
        (string->list |s1_SucfkqyTU|)
        (string->list |s2_SuybiTyTU|)))))
(define string<=?
  (lambda (|s1_SugV78BTU| |s2_SuCR5BBTU|)
    ((lambda (|t_SuYN32CTU|)
       (if |t_SuYN32CTU|
         |t_SuYN32CTU|
         (string=? |s1_SugV78BTU| |s2_SuCR5BBTU|)))
     (string<? |s1_SugV78BTU| |s2_SuCR5BBTU|))))
(define string>=?
  (lambda (|s1_SuiK1vCTU| |s2_SuEG_XCTU|)
    ((lambda (|t_Su-CZoDTU|)
       (if |t_Su-CZoDTU|
         |t_Su-CZoDTU|
         (string=? |s1_SuiK1vCTU| |s2_SuEG_XCTU|)))
     (string>? |s1_SuiK1vCTU| |s2_SuEG_XCTU|))))
(define string-ci=?
  (lambda (|s1_SukzXRDTU| |s2_SuGvViETU|)
    (string=?
      (string-downcase |s1_SukzXRDTU|)
      (string-downcase |s2_SuGvViETU|))))
(define string-ci<?
  (lambda (|s1_Su0sTLETU| |s2_SumoRcFTU|)
    (string<?
      (string-downcase |s1_Su0sTLETU|)
      (string-downcase |s2_SumoRcFTU|))))
(define string-ci>?
  (lambda (|s1_SuIkPFFTU| |s2_Su2hN6GTU|)
    (string>?
      (string-downcase |s1_SuIkPFFTU|)
      (string-downcase |s2_Su2hN6GTU|))))
(define string-ci>=?
  (lambda (|s1_SuodLzGTU| |s2_SuK9J0HTU|)
    (string>=?
      (string-downcase |s1_SuodLzGTU|)
      (string-downcase |s2_SuK9J0HTU|))))
(define string-ci<=?
  (lambda (|s1_Su46HtHTU| |s2_Suq2FWHTU|)
    (string<=?
      (string-downcase |s1_Su46HtHTU|)
      (string-downcase |s2_Suq2FWHTU|))))
(define substring
  (letrec ((|fill-string_SuM-CnITU|
             (lambda (|sstr_SuuIsEKTU|
                      |dstr_SuQEq5LTU|
                      |n_SuaBoyLTU|
                      |s_Suwxm_LTU|
                      |e_SuStksMTU|)
               (if (< |s_Suwxm_LTU| |e_SuStksMTU|)
                 (begin
                   (string-set!
                     |dstr_SuQEq5LTU|
                     |n_SuaBoyLTU|
                     (string-ref |sstr_SuuIsEKTU| |s_Suwxm_LTU|))
                   (|fill-string_SuM-CnITU|
                     |sstr_SuuIsEKTU|
                     |dstr_SuQEq5LTU|
                     (+ |n_SuaBoyLTU| '1)
                     (+ |s_Suwxm_LTU| '1)
                     |e_SuStksMTU|))
                 (void)))))
    (lambda (|str_Su6XAQITU|
             |start_SusTyhJTU|
             |end_SuOPwKJTU|)
      ((lambda (|newstr_Su8MubKTU|)
         (begin
           (|fill-string_SuM-CnITU|
             |str_Su6XAQITU|
             |newstr_Su8MubKTU|
             '0
             |start_SusTyhJTU|
             |end_SuOPwKJTU|)
           |newstr_Su8MubKTU|))
       (make-string
         (- |end_SuOPwKJTU| |start_SusTyhJTU|))))))
(define list-ref
  (lambda (|list_SucqiVMTU| |n_SuymgmNTU|)
    (if (zero? |n_SuymgmNTU|)
      (car |list_SucqiVMTU|)
      (list-ref
        (cdr |list_SucqiVMTU|)
        (- |n_SuymgmNTU| '1)))))
(define values
  (lambda |args_SuUiePNTU|
    (call-with-current-continuation
      (lambda (|k_SuefcgOTU|)
        (apply |k_SuefcgOTU| |args_SuUiePNTU|)))))
