(define for-each
  (lambda (|proc_PwwHyHctI| . |lists_PwaLAectI|)
    (if (null? |lists_PwaLAectI|)
      (error 'for-each
             '"invalid number of arguments to procedure for-each.")
      (if (null? (car |lists_PwaLAectI|))
        (void)
        (begin
          (apply |proc_PwwHyHctI|
                 (map-car |lists_PwaLAectI|))
          (apply for-each
                 (cons |proc_PwwHyHctI|
                       (map-cdr |lists_PwaLAectI|))))))))
(define eof-object?
  (lambda (|x_PwSDw8dtI|)
    (eq? |x_PwSDw8dtI| '#!eof)))
(define not
  (lambda (|x_PwcAuBdtI|)
    (if |x_PwcAuBdtI| '#f '#t)))
(define eqv? eq?)
(define newline
  (lambda |port_Pwyws2etI|
    (apply display
           (cons '#\newline |port_Pwyws2etI|))))
(define reverse
  (letrec ((|iter_PwUsqvetI|
             (lambda (|ls_PwAlmpftI| |acc_PwWhkSftI|)
               (if (null? |ls_PwAlmpftI|)
                 |acc_PwWhkSftI|
                 (|iter_PwUsqvetI|
                   (cdr |ls_PwAlmpftI|)
                   (cons (car |ls_PwAlmpftI|) |acc_PwWhkSftI|))))))
    (lambda (|ls_PwepoYetI|)
      (|iter_PwUsqvetI| |ls_PwepoYetI| '()))))
(define map-car
  (lambda (|ls_PwgeijgtI|)
    (if (null? |ls_PwgeijgtI|)
      '()
      (cons (caar |ls_PwgeijgtI|)
            (map-car (cdr |ls_PwgeijgtI|))))))
(define map-cdr
  (lambda (|ls_PwCagMgtI|)
    (if (null? |ls_PwCagMgtI|)
      '()
      (cons (cdar |ls_PwCagMgtI|)
            (map-cdr (cdr |ls_PwCagMgtI|))))))
(define map
  (letrec ((|map1_PwY6edhtI|
             (lambda (|proc_PwGQ3ujtI|
                      |list_Pw0N1XjtI|
                      |acc_PwmJ_nktI|)
               (if (null? |list_Pw0N1XjtI|)
                 (reverse |acc_PwmJ_nktI|)
                 (|map1_PwY6edhtI|
                   |proc_PwGQ3ujtI|
                   (cdr |list_Pw0N1XjtI|)
                   (cons (|proc_PwGQ3ujtI| (car |list_Pw0N1XjtI|))
                         |acc_PwmJ_nktI|)))))
           (|loop_Pwi3cGhtI|
             (lambda (|proc_PwIFZQktI|
                      |list1_Pw2CXhltI|
                      |lists_PwoyVKltI|
                      |c_PwKuTbmtI|)
               (if (null? |list1_Pw2CXhltI|)
                 (reverse |c_PwKuTbmtI|)
                 (|loop_Pwi3cGhtI|
                   |proc_PwIFZQktI|
                   (cdr |list1_Pw2CXhltI|)
                   (map-cdr |lists_PwoyVKltI|)
                   (cons (apply |proc_PwIFZQktI|
                                (car |list1_Pw2CXhltI|)
                                (map-car |lists_PwoyVKltI|))
                         |c_PwKuTbmtI|))))))
    (lambda (|proc_PwkU51jtI|
             |list1_Pw-X7AitI|
             .
             |lists_PwE_97itI|)
      (if (null? |lists_PwE_97itI|)
        (|map1_PwY6edhtI|
          |proc_PwkU51jtI|
          |list1_Pw-X7AitI|
          '())
        (|loop_Pwi3cGhtI|
          |proc_PwkU51jtI|
          |list1_Pw-X7AitI|
          |lists_PwE_97itI|
          '())))))
(define compose
  (lambda |rest_Pw4rREmtI|
    (if (null? |rest_Pw4rREmtI|)
      (lambda (|x_PwscJsotI|) |x_PwscJsotI|)
      ((lambda (|f_PwqnP5ntI| |g_PwMjNyntI|)
         (lambda (|x_Pw6gL_ntI|)
           (|f_PwqnP5ntI| (|g_PwMjNyntI| |x_Pw6gL_ntI|))))
       (car |rest_Pw4rREmtI|)
       (apply compose (cdr |rest_Pw4rREmtI|))))))
(define compose2
  (lambda (|f_PwO8HVotI| |g_Pw85FmptI|)
    (lambda (|x_Pwu1DPptI|)
      (|f_PwO8HVotI| (|g_Pw85FmptI| |x_Pwu1DPptI|)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
(letrec ((|assn_PwQZAgqtI|
           (lambda (|n_PwEa8CwtI| |obj_Pw-663xtI| |alist_Pwk34wxtI|)
             (if (null? |alist_Pwk34wxtI|)
               '#f
               (if (|n_PwEa8CwtI|
                     (caar |alist_Pwk34wxtI|)
                     |obj_Pw-663xtI|)
                 (car |alist_Pwk34wxtI|)
                 (|assn_PwQZAgqtI|
                   |n_PwEa8CwtI|
                   |obj_Pw-663xtI|
                   (cdr |alist_Pwk34wxtI|))))))
         (|memn_PwaWyJqtI|
           (lambda (|n_PwG_1ZxtI| |obj_Pw0Y_pytI| |list_PwmUZSytI|)
             (if (null? |list_PwmUZSytI|)
               '#f
               (if (|n_PwG_1ZxtI|
                     (car |list_PwmUZSytI|)
                     |obj_Pw0Y_pytI|)
                 |list_PwmUZSytI|
                 (|memn_PwaWyJqtI|
                   |n_PwG_1ZxtI|
                   |obj_Pw0Y_pytI|
                   (cdr |list_PwmUZSytI|)))))))
  (begin
    (set! assq
      (lambda (|obj_PwwSwartI| |alist_PwSOuDrtI|)
        (|assn_PwQZAgqtI|
          eq?
          |obj_PwwSwartI|
          |alist_PwSOuDrtI|)))
    (set! assv
      (lambda (|obj_PwcLs4stI| |alist_PwyHqxstI|)
        (|assn_PwQZAgqtI|
          eqv?
          |obj_PwcLs4stI|
          |alist_PwyHqxstI|)))
    (set! assoc
      (lambda (|obj_PwUDo-stI| |alist_PweAmrttI|)
        (|assn_PwQZAgqtI|
          equal?
          |obj_PwUDo-stI|
          |alist_PweAmrttI|)))
    (set! memq
      (lambda (|obj_PwAwkUttI| |list_PwWsilutI|)
        (|memn_PwaWyJqtI|
          eq?
          |obj_PwAwkUttI|
          |list_PwWsilutI|)))
    (set! memv
      (lambda (|obj_PwgpgOutI| |list_PwClefvtI|)
        (|memn_PwaWyJqtI|
          eqv?
          |obj_PwgpgOutI|
          |list_PwClefvtI|)))
    (set! member
      (lambda (|obj_PwYhcIvtI| |list_Pwiea9wtI|)
        (|memn_PwaWyJqtI|
          equal?
          |obj_PwYhcIvtI|
          |list_Pwiea9wtI|)))))
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
  (lambda (|ls1_PwIQXjztI| |ls2_Pw2NVMztI|)
    (if (null? |ls1_PwIQXjztI|)
      |ls2_Pw2NVMztI|
      (cons (car |ls1_PwIQXjztI|)
            (append2 (cdr |ls1_PwIQXjztI|) |ls2_Pw2NVMztI|)))))
(define append append2)
(define list->string
  (lambda (|l_PwoJTdAtI|)
    (letrec ((|l2s_PwKFRGAtI|
               (lambda (|l_Pw4CP7BtI| |s_PwqyNABtI| |n_PwMuL1CtI|)
                 (if (null? |l_Pw4CP7BtI|)
                   |s_PwqyNABtI|
                   (begin
                     (string-set!
                       |s_PwqyNABtI|
                       |n_PwMuL1CtI|
                       (car |l_Pw4CP7BtI|))
                     (|l2s_PwKFRGAtI|
                       (cdr |l_Pw4CP7BtI|)
                       |s_PwqyNABtI|
                       (+ |n_PwMuL1CtI| '1)))))))
      (|l2s_PwKFRGAtI|
        |l_PwoJTdAtI|
        (make-string (length |l_PwoJTdAtI|))
        '0))))
(define string->list
  (letrec ((|s2l_Pw6rJuCtI|
             (lambda (|s_PwOjFoDtI| |h_Pw8gDRDtI| |n_PwucBiEtI|)
               (if (< |n_PwucBiEtI| '0)
                 |h_Pw8gDRDtI|
                 (|s2l_Pw6rJuCtI|
                   |s_PwOjFoDtI|
                   (cons (string-ref |s_PwOjFoDtI| |n_PwucBiEtI|)
                         |h_Pw8gDRDtI|)
                   (- |n_PwucBiEtI| '1))))))
    (lambda (|s_PwsnHXCtI|)
      (|s2l_Pw6rJuCtI|
        |s_PwsnHXCtI|
        '()
        (- (string-length |s_PwsnHXCtI|) '1)))))
(define list->vector
  (letrec ((|l2v_PwQ8zLEtI|
             (lambda (|l_Pww1vFFtI| |v_PwSZs6GtI| |n_PwcWqzGtI|)
               (if (null? |l_Pww1vFFtI|)
                 |v_PwSZs6GtI|
                 (begin
                   (vector-set!
                     |v_PwSZs6GtI|
                     |n_PwcWqzGtI|
                     (car |l_Pww1vFFtI|))
                   (|l2v_PwQ8zLEtI|
                     (cdr |l_Pww1vFFtI|)
                     |v_PwSZs6GtI|
                     (+ |n_PwcWqzGtI| '1)))))))
    (lambda (|l_Pwa5xcFtI|)
      (if (proper-list? |l_Pwa5xcFtI|)
        (|l2v_PwQ8zLEtI|
          |l_Pwa5xcFtI|
          (make-vector (length |l_Pwa5xcFtI|))
          '0)
        (error 'list->vector
               '"can only convert a proper list."
               |l_Pwa5xcFtI|)))))
(define vector
  (lambda |elems_PwySo0HtI|
    (list->vector |elems_PwySo0HtI|)))
(define string
  (lambda |elems_PwUOmtHtI|
    (list->string |elems_PwUOmtHtI|)))
(define detect-os
  (lambda ()
    ((lambda (|osn_PweLkWHtI|)
       (if (> (string-length |osn_PweLkWHtI|) '3)
         (if (equal? (substring |osn_PweLkWHtI| '0 '3) '"mac")
           'macos
           (if (equal? (substring |osn_PweLkWHtI| '0 '3) '"win")
             'ms-dos
             (if (equal? (substring |osn_PweLkWHtI| '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring |osn_PweLkWHtI| '0 '3) '"uni")
                 'unix
                 (if (equal? (substring |osn_PweLkWHtI| '0 '3) '"lin")
                   'unix
                   (if (equal? (substring |osn_PweLkWHtI| '0 '4) '"os/")
                     'os2
                     (if (equal? (substring |osn_PweLkWHtI| '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase
       (getprop 'os.name '*environment-variables*)))))
(define current-url (make-parameter '"file:."))
(define current-directory
  (lambda |rest_PwAHinItI|
    (if (null? |rest_PwAHinItI|)
      (normalize-url (current-url) '".")
      (current-url
        (normalize-url
          (current-url)
          ((lambda (|v_PwWDgQItI|)
             ((lambda (|l_PwgAehJtI|)
                (if (eq? (string-ref |v_PwWDgQItI| (- |l_PwgAehJtI| '1))
                         '#\/)
                  |v_PwWDgQItI|
                  (string-append |v_PwWDgQItI| '"/")))
              (string-length |v_PwWDgQItI|)))
           (car |rest_PwAHinItI|)))))))
(define load-expanded load)
((lambda (|_load_PwCwcKJtI|)
   ((lambda (|normalize_PwYsabKtI|
             |file-handler_Pwip8EKtI|
             |file-extension_PwEl65LtI|)
      (begin
        (set! open-input-file
          (|normalize_PwYsabKtI| open-input-file))
        (set! open-source-input-file
          (|normalize_PwYsabKtI| open-source-input-file))
        (set! open-output-file
          (|normalize_PwYsabKtI| open-output-file))
        (set! load
          (lambda (|file_Pw-h4yLtI|)
            (begin
              ((lambda (|previous-url_Pwke2_LtI|)
                 (begin
                   (current-url
                     (normalize-url
                       |previous-url_Pwke2_LtI|
                       |file_Pw-h4yLtI|))
                   (with-failure-continuation
                     (lambda (|m_PwGa0sMtI| |e_Pw07-UMtI|)
                       (begin
                         (current-url |previous-url_Pwke2_LtI|)
                         (call-with-failure-continuation
                           (lambda (|fk_Pwm3YlNtI|)
                             (|fk_Pwm3YlNtI| |m_PwGa0sMtI| |e_Pw07-UMtI|)))))
                     (lambda ()
                       ((lambda (|fe_PwI_VONtI|)
                          ((|file-handler_Pwip8EKtI|
                             (if |fe_PwI_VONtI| |fe_PwI_VONtI| '"scm"))
                           (current-url)))
                        (|file-extension_PwEl65LtI| (current-url)))))
                   (current-url |previous-url_Pwke2_LtI|)))
               (current-url))
              (void))))))
    (lambda (|proc_Pw2YTfOtI|)
      (lambda (|file_PwKQP9PtI| . |rest_PwoURIOtI|)
        (apply |proc_Pw2YTfOtI|
               (normalize-url (current-url) |file_PwKQP9PtI|)
               |rest_PwoURIOtI|)))
    (lambda (|extension_Pw4NNCPtI|)
      ((lambda (|t_PwqJL3QtI|)
         (if (memv |t_PwqJL3QtI| '(sce pp))
           load-expanded
           (if (memv |t_PwqJL3QtI| '(sll))
             (with-failure-continuation
               (lambda (|m_PwMFJwQtI| |e_Pw6CHZQtI|)
                 (lambda (|name_PwsyFqRtI|)
                   (error 'load
                          '"shared libraries not supported in this build.")))
               (lambda ()
                 (eval '(lambda (name)
                          (import compiled-libraries)
                          (link-library (open-library name))))))
             |_load_PwCwcKJtI|)))
       (string->symbol
         (string-downcase |extension_Pw4NNCPtI|))))
    (lambda (|url_PwOuDTRtI|)
      ((letrec ((|loop_Pw8rBkStI|
                  (lambda (|x_PwunzNStI| |acc_PwQjxeTtI|)
                    (if (null? |x_PwunzNStI|)
                      '#f
                      (if (equal? (car |x_PwunzNStI|) '#\.)
                        (list->string |acc_PwQjxeTtI|)
                        (|loop_Pw8rBkStI|
                          (cdr |x_PwunzNStI|)
                          (cons (car |x_PwunzNStI|) |acc_PwQjxeTtI|)))))))
         |loop_Pw8rBkStI|)
       (reverse (string->list |url_PwOuDTRtI|))
       '()))))
 load)
(define load-module
  (lambda (|str_PwagvHTtI|)
    ((lambda (|nl_Pwwct8UtI|)
       ((lambda (|binding-names_PwS8rBUtI|)
          (for-each
            (lambda (|name_Pwc5p2VtI|)
              (putprop
                |name_Pwc5p2VtI|
                '*toplevel*
                (native-library-binding
                  |nl_Pwwct8UtI|
                  |name_Pwc5p2VtI|)))
            |binding-names_PwS8rBUtI|))
        (native-library-binding-names |nl_Pwwct8UtI|)))
     (load-native-library |str_PwagvHTtI|))))
(define append
  (letrec ((|real-append_Pwy1nvVtI|
             (lambda (|ls1_PwASgSWtI| . |lses_PweWipWtI|)
               (if (null? |lses_PweWipWtI|)
                 |ls1_PwASgSWtI|
                 (if (null? |ls1_PwASgSWtI|)
                   (apply |real-append_Pwy1nvVtI| |lses_PweWipWtI|)
                   (apply |real-append_Pwy1nvVtI|
                          (cons (append2
                                  |ls1_PwASgSWtI|
                                  (car |lses_PweWipWtI|))
                                (cdr |lses_PweWipWtI|))))))))
    (lambda |lses_PwUZkYVtI|
      (if (null? |lses_PwUZkYVtI|)
        '()
        (if (null? (cdr |lses_PwUZkYVtI|))
          (car |lses_PwUZkYVtI|)
          (apply |real-append_Pwy1nvVtI|
                 (cons (car |lses_PwUZkYVtI|)
                       (cdr |lses_PwUZkYVtI|))))))))
(define proper-list?
  (lambda (|x_PwWOejXtI|)
    ((letrec ((|lp_PwgLcMXtI|
                (lambda (|x_PwCHadYtI| |lag_PwYD8GYtI|)
                  (if (pair? |x_PwCHadYtI|)
                    ((lambda (|x_PwiA67ZtI|)
                       (if (pair? |x_PwiA67ZtI|)
                         ((lambda (|x_PwEw4AZtI| |lag_Pw-s21-tI|)
                            (if (eq? |x_PwEw4AZtI| |lag_Pw-s21-tI|)
                              '#f
                              (|lp_PwgLcMXtI| |x_PwEw4AZtI| |lag_Pw-s21-tI|)))
                          (cdr |x_PwiA67ZtI|)
                          (cdr |lag_PwYD8GYtI|))
                         (null? |x_PwiA67ZtI|)))
                     (cdr |x_PwCHadYtI|))
                    (null? |x_PwCHadYtI|)))))
       |lp_PwgLcMXtI|)
     |x_PwWOejXtI|
     |x_PwWOejXtI|)))
(define list? proper-list?)
(define expt
  (letrec ((|general-expt_Pwkp0u-tI|
             (lambda (|base_PwIaUh0uI| |exponent_Pw27SK0uI|)
               (exp (* |exponent_Pw27SK0uI| (log |base_PwIaUh0uI|)))))
           (|integer-expt_PwGl-W-tI|
             (lambda (|base_Pwo3Qb1uI| |exponent_PwK_NE1uI|)
               (if (negative? |exponent_PwK_NE1uI|)
                 (/ (|integer-expt_PwGl-W-tI|
                      |base_Pwo3Qb1uI|
                      (abs |exponent_PwK_NE1uI|)))
                 (if (if (exact? |base_Pwo3Qb1uI|)
                       (= |base_Pwo3Qb1uI| '2)
                       '#f)
                   (ashl '1 |exponent_PwK_NE1uI|)
                   ((letrec ((|loop_Pw4YL52uI|
                               (lambda (|rest_PwqUJy2uI|
                                        |result_PwMQH_2uI|
                                        |squaring_Pw6NFs3uI|)
                                 (if (zero? |rest_PwqUJy2uI|)
                                   |result_PwMQH_2uI|
                                   (|loop_Pw4YL52uI|
                                     (quotient |rest_PwqUJy2uI| '2)
                                     (if (odd? |rest_PwqUJy2uI|)
                                       (* |result_PwMQH_2uI|
                                          |squaring_Pw6NFs3uI|)
                                       |result_PwMQH_2uI|)
                                     (* |squaring_Pw6NFs3uI|
                                        |squaring_Pw6NFs3uI|))))))
                      |loop_Pw4YL52uI|)
                    |exponent_PwK_NE1uI|
                    '1
                    |base_Pwo3Qb1uI|))))))
    (lambda (|base_Pw0iYn_tI| |exponent_PwmeWQ_tI|)
      (if (zero? |exponent_PwmeWQ_tI|)
        (if (exact? |exponent_PwmeWQ_tI|) '1 '1.0)
        (if (zero? |base_Pw0iYn_tI|)
          (if (exact? |exponent_PwmeWQ_tI|)
            |base_Pw0iYn_tI|
            '0.0)
          (if (if (exact? |exponent_PwmeWQ_tI|)
                (integer? |exponent_PwmeWQ_tI|)
                '#f)
            (|integer-expt_PwGl-W-tI|
              |base_Pw0iYn_tI|
              |exponent_PwmeWQ_tI|)
            (|general-expt_Pwkp0u-tI|
              |base_Pw0iYn_tI|
              |exponent_PwmeWQ_tI|)))))))
(define modpow
  (lambda (|x_PwsJDV3uI| |y_PwOFBm4uI| |n_Pw8CzP4uI|)
    (if (= |y_PwOFBm4uI| '1)
      (modulo |x_PwsJDV3uI| |n_Pw8CzP4uI|)
      (if (even? |y_PwOFBm4uI|)
        ((lambda (|tmp_Pwarta6uI|)
           (modulo
             (* |tmp_Pwarta6uI| |tmp_Pwarta6uI|)
             |n_Pw8CzP4uI|))
         (modpow
           |x_PwsJDV3uI|
           (/ |y_PwOFBm4uI| '2)
           |n_Pw8CzP4uI|))
        ((lambda (|tmp_PwQuvJ5uI|)
           (begin
             (set! |tmp_PwQuvJ5uI|
               (modulo
                 (* |tmp_PwQuvJ5uI| |tmp_PwQuvJ5uI|)
                 |n_Pw8CzP4uI|))
             (modulo
               (* |x_PwsJDV3uI| |tmp_PwQuvJ5uI|)
               |n_Pw8CzP4uI|)))
         (modpow
           |x_PwsJDV3uI|
           (/ (- |y_PwOFBm4uI| '1) '2)
           |n_Pw8CzP4uI|))))))
(define integer?
  ((lambda (|oldint?_PwwnrD6uI|)
     (lambda (|n_PwSjp47uI|)
       ((lambda (|t_Pwcgnx7uI|)
          (if |t_Pwcgnx7uI|
            |t_Pwcgnx7uI|
            (if (real? |n_PwSjp47uI|)
              (= (round |n_PwSjp47uI|) |n_PwSjp47uI|)
              '#f)))
        (|oldint?_PwwnrD6uI| |n_PwSjp47uI|))))
   integer?))
(define real?
  ((lambda (|oldcomp?_Pwycl-7uI|)
     (lambda (|n_PwU8jr8uI|)
       (if (number? |n_PwU8jr8uI|)
         (if (|oldcomp?_Pwycl-7uI| |n_PwU8jr8uI|) '#f '#t)
         '#f)))
   complex?))
(define rational? real?)
(define complex? number?)
(define abs
  (lambda (|num_Pwe5hU8uI|)
    (if (real? |num_Pwe5hU8uI|)
      (if (< |num_Pwe5hU8uI| '0)
        (- |num_Pwe5hU8uI|)
        |num_Pwe5hU8uI|)
      ((lambda (|a_PwA1fl9uI| |b_PwWZcO9uI|)
         (sqrt (+ (* |a_PwA1fl9uI| |a_PwA1fl9uI|)
                  (* |b_PwWZcO9uI| |b_PwWZcO9uI|))))
       (real-part |num_Pwe5hU8uI|)
       (imag-part |num_Pwe5hU8uI|)))))
(define min (void))
(define max (void))
(letrec ((|_min_max_PwgWafauI|
           (lambda (|proc_Pw-D0wcuI|
                    |mv_PwkA-YcuI|
                    |args_PwGwYpduI|
                    |inexact_Pw0tWSduI|)
             (if (null? |args_PwGwYpduI|)
               (if (if |inexact_Pw0tWSduI|
                     (exact? |mv_PwkA-YcuI|)
                     '#f)
                 (exact->inexact |mv_PwkA-YcuI|)
                 |mv_PwkA-YcuI|)
               (if (|proc_Pw-D0wcuI|
                     (car |args_PwGwYpduI|)
                     |mv_PwkA-YcuI|)
                 (|_min_max_PwgWafauI|
                   |proc_Pw-D0wcuI|
                   (car |args_PwGwYpduI|)
                   (cdr |args_PwGwYpduI|)
                   ((lambda (|t_PwmpUjeuI|)
                      (if |t_PwmpUjeuI|
                        |t_PwmpUjeuI|
                        (inexact? (car |args_PwGwYpduI|))))
                    |inexact_Pw0tWSduI|))
                 (|_min_max_PwgWafauI|
                   |proc_Pw-D0wcuI|
                   |mv_PwkA-YcuI|
                   (cdr |args_PwGwYpduI|)
                   |inexact_Pw0tWSduI|))))))
  (begin
    (set! min
      (lambda (|x1_PwYO69buI| . |args_PwCS8IauI|)
        (if (null? |args_PwCS8IauI|)
          |x1_PwYO69buI|
          (|_min_max_PwgWafauI|
            <
            |x1_PwYO69buI|
            |args_PwCS8IauI|
            (inexact? |x1_PwYO69buI|)))))
    (set! max
      (lambda (|x1_PwEH23cuI| . |args_PwiL4CbuI|)
        (if (null? |args_PwiL4CbuI|)
          |x1_PwEH23cuI|
          (|_min_max_PwgWafauI|
            >
            |x1_PwEH23cuI|
            |args_PwiL4CbuI|
            (inexact? |x1_PwEH23cuI|)))))))
(define negative?
  (lambda (|n_PwIlSMeuI|) (< |n_PwIlSMeuI| '0)))
(define positive?
  (lambda (|n_Pw2iQdfuI|) (> |n_Pw2iQdfuI| '0)))
(define even?
  (lambda (|n_PwoeOGfuI|)
    (= '0 (modulo |n_PwoeOGfuI| '2))))
(define odd?
  (lambda (|n_PwKaM7guI|)
    (if (even? |n_PwKaM7guI|) '#f '#t)))
(define zero?
  (lambda (|n_Pw47KAguI|) (= |n_Pw47KAguI| '0)))
(define add1
  (lambda (|n_Pwq3I1huI|) (+ |n_Pwq3I1huI| '1)))
(define sub1
  (lambda (|n_PwM_FuhuI|) (- |n_PwM_FuhuI| '1)))
(define >= (void))
(define <= (void))
((lambda (|_comp_help_Pw6YDXhuI| |_and2_PwsUBoiuI|)
   (begin
     (set! <=
       (|_comp_help_Pw6YDXhuI|
         (lambda (|a_PwOQzRiuI| |b_Pw8NxijuI|)
           ((lambda (|t_PwuJvLjuI|)
              (if |t_PwuJvLjuI|
                |t_PwuJvLjuI|
                (= |a_PwOQzRiuI| |b_Pw8NxijuI|)))
            (< |a_PwOQzRiuI| |b_Pw8NxijuI|)))
         |_and2_PwsUBoiuI|
         '#t))
     (set! >=
       (|_comp_help_Pw6YDXhuI|
         (lambda (|a_PwQFtckuI| |b_PwaCrFkuI|)
           ((lambda (|t_Pwwyp6luI|)
              (if |t_Pwwyp6luI|
                |t_Pwwyp6luI|
                (= |a_PwQFtckuI| |b_PwaCrFkuI|)))
            (> |a_PwQFtckuI| |b_PwaCrFkuI|)))
         |_and2_PwsUBoiuI|
         '#t))))
 (lambda (|comparator_PwSunzluI|
          |chainer_Pwcrl0muI|
          |endstate_PwynjtmuI|)
   (lambda |args_PwUjhWmuI|
     ((letrec ((|loop_PwegfnnuI|
                 (lambda (|x_PwAcdQnuI|)
                   (if (null? |x_PwAcdQnuI|)
                     |endstate_PwynjtmuI|
                     (if (null? (cdr |x_PwAcdQnuI|))
                       |endstate_PwynjtmuI|
                       (|chainer_Pwcrl0muI|
                         (|comparator_PwSunzluI|
                           (car |x_PwAcdQnuI|)
                           (cadr |x_PwAcdQnuI|))
                         (|loop_PwegfnnuI| (cdr |x_PwAcdQnuI|))))))))
        |loop_PwegfnnuI|)
      |args_PwUjhWmuI|)))
 (lambda (|x_PwW8bhouI| |y_Pwg59KouI|)
   (if |x_PwW8bhouI| |y_Pwg59KouI| '#f)))
((lambda (|_?=_PwC17bpuI|)
   (begin
     (set! >= (|_?=_PwC17bpuI| > >=))
     (set! <= (|_?=_PwC17bpuI| < <=))))
 (lambda (|comparator_PwYZ4EpuI| |chainer_PwiW25quI|)
   (lambda |args_PwES0yquI|
     ((lambda (|t_Pw-O--quI|)
        (if |t_Pw-O--quI|
          |t_Pw-O--quI|
          ((lambda (|t_PwkLYrruI|)
             (if |t_PwkLYrruI|
               |t_PwkLYrruI|
               (if ((lambda (|t_PwGHWUruI|)
                      (if |t_PwGHWUruI|
                        |t_PwGHWUruI|
                        (|comparator_PwYZ4EpuI|
                          (car |args_PwES0yquI|)
                          (cadr |args_PwES0yquI|))))
                    (= (car |args_PwES0yquI|)
                       (cadr |args_PwES0yquI|)))
                 (apply |chainer_PwiW25quI|
                        (cdr |args_PwES0yquI|))
                 '#f)))
           (null? (cdr |args_PwES0yquI|)))))
      (null? |args_PwES0yquI|)))))
(define gcd
  (lambda |args_Pw0EUlsuI|
    (if (null? |args_Pw0EUlsuI|)
      '0
      (if (null? (cdr |args_Pw0EUlsuI|))
        (car |args_Pw0EUlsuI|)
        (_gcd (car |args_Pw0EUlsuI|)
              (cadr |args_Pw0EUlsuI|))))))
(define lcm
  (lambda |args_PwmASOsuI|
    (if (null? |args_PwmASOsuI|)
      '1
      (if (null? (cdr |args_PwmASOsuI|))
        (car |args_PwmASOsuI|)
        (_lcm (car |args_PwmASOsuI|)
              (cadr |args_PwmASOsuI|))))))
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
  (lambda (|x_PwIwQftuI| |y_Pw2tOItuI|)
    ((lambda (|r_PwopM9uuI|)
       (if (if (negative? |y_Pw2tOItuI|)
             (positive? |r_PwopM9uuI|)
             (negative? |r_PwopM9uuI|))
         (+ |r_PwopM9uuI| |y_Pw2tOItuI|)
         |r_PwopM9uuI|))
     (remainder |x_PwIwQftuI| |y_Pw2tOItuI|))))
(max-precision '32)
(define string-append
  (lambda |args_PwKlKCuuI|
    (if (null? |args_PwKlKCuuI|)
      '""
      (if (null? (cdr |args_PwKlKCuuI|))
        (car |args_PwKlKCuuI|)
        (apply string-append
               (_string-append
                 (car |args_PwKlKCuuI|)
                 (cadr |args_PwKlKCuuI|))
               (cddr |args_PwKlKCuuI|))))))
(define char-downcase
  ((lambda (|a_Pw4iI3vuI|)
     ((lambda (|z_PwqeGwvuI|)
        ((lambda (|lc-offset_PwMaEZvuI|)
           (lambda (|c_Pw67CqwuI|)
             ((lambda (|cv_Pws3ATwuI|)
                (if (if (>= |cv_Pws3ATwuI| |a_Pw4iI3vuI|)
                      (<= |cv_Pws3ATwuI| |z_PwqeGwvuI|)
                      '#f)
                  (integer->char
                    (+ |cv_Pws3ATwuI| |lc-offset_PwMaEZvuI|))
                  |c_Pw67CqwuI|))
              (char->integer |c_Pw67CqwuI|))))
         (- (char->integer '#\a) |a_Pw4iI3vuI|)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (|a_PwO_xkxuI|)
     ((lambda (|z_Pw8YvNxuI|)
        ((lambda (|uc-offset_PwuUteyuI|)
           (lambda (|c_PwQQrHyuI|)
             ((lambda (|cv_PwaNp8zuI|)
                (if (if (>= |cv_PwaNp8zuI| |a_PwO_xkxuI|)
                      (<= |cv_PwaNp8zuI| |z_Pw8YvNxuI|)
                      '#f)
                  (integer->char
                    (- |cv_PwaNp8zuI| |uc-offset_PwuUteyuI|))
                  |c_PwQQrHyuI|))
              (char->integer |c_PwQQrHyuI|))))
         (- |a_PwO_xkxuI| (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (|c1_PwwJnBzuI| |c2_PwSFl2AuI|)
    (> (char->integer |c1_PwwJnBzuI|)
       (char->integer |c2_PwSFl2AuI|))))
(define char<?
  (lambda (|c1_PwcCjvAuI| |c2_PwyyhYAuI|)
    (< (char->integer |c1_PwcCjvAuI|)
       (char->integer |c2_PwyyhYAuI|))))
(define char=? eq?)
(define char>=?
  (lambda (|c1_PwUufpBuI| |c2_PwerdSBuI|)
    ((lambda (|t_PwAnbjCuI|)
       (if |t_PwAnbjCuI|
         |t_PwAnbjCuI|
         (char=? |c1_PwUufpBuI| |c2_PwerdSBuI|)))
     (char>? |c1_PwUufpBuI| |c2_PwerdSBuI|))))
(define char<=?
  (lambda (|c1_PwWj9MCuI| |c2_Pwgg7dDuI|)
    ((lambda (|t_PwCc5GDuI|)
       (if |t_PwCc5GDuI|
         |t_PwCc5GDuI|
         (char=? |c1_PwWj9MCuI| |c2_Pwgg7dDuI|)))
     (char<? |c1_PwWj9MCuI| |c2_Pwgg7dDuI|))))
(define char-ci>?
  (lambda (|c1_PwY837EuI| |c2_Pwi51AEuI|)
    (char>?
      (char-downcase |c1_PwY837EuI|)
      (char-downcase |c2_Pwi51AEuI|))))
(define char-ci<?
  (lambda (|c1_PwE1_0FuI| |c2_Pw-ZYtFuI|)
    (char<?
      (char-downcase |c1_PwE1_0FuI|)
      (char-downcase |c2_Pw-ZYtFuI|))))
(define char-ci=?
  (lambda (|c1_PwkWWWFuI| |c2_PwGSUnGuI|)
    (char=?
      (char-downcase |c1_PwkWWWFuI|)
      (char-downcase |c2_PwGSUnGuI|))))
(define char-ci>=?
  (lambda (|c1_Pw0PSQGuI| |c2_PwmLQhHuI|)
    ((lambda (|t_PwIHOKHuI|)
       (if |t_PwIHOKHuI|
         |t_PwIHOKHuI|
         (char-ci=? |c1_Pw0PSQGuI| |c2_PwmLQhHuI|)))
     (char-ci>? |c1_Pw0PSQGuI| |c2_PwmLQhHuI|))))
(define char-ci<=?
  (lambda (|c1_Pw2EMbIuI| |c2_PwoAKEIuI|)
    ((lambda (|t_PwKwI5JuI|)
       (if |t_PwKwI5JuI|
         |t_PwKwI5JuI|
         (char-ci=? |c1_Pw2EMbIuI| |c2_PwoAKEIuI|)))
     (char-ci<? |c1_Pw2EMbIuI| |c2_PwoAKEIuI|))))
(define char-alphabetic?
  (lambda (|c_Pw4tGyJuI|)
    (if (char-ci>=? |c_Pw4tGyJuI| '#\a)
      (char-ci<=? |c_Pw4tGyJuI| '#\z)
      '#f)))
(define char-numeric?
  (lambda (|c_PwqpE_JuI|)
    (if (char-ci>=? |c_PwqpE_JuI| '#\0)
      (char-ci<=? |c_PwqpE_JuI| '#\9)
      '#f)))
(define char-whitespace?
  (lambda (|c_PwMlCsKuI|)
    (if (memq |c_PwMlCsKuI| '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (|c_Pw6iAVKuI|)
    (if (char-alphabetic? |c_Pw6iAVKuI|)
      (char<? |c_Pw6iAVKuI| '#\a)
      '#f)))
(define char-lower-case?
  (lambda (|c_PwseymLuI|)
    (if (char-alphabetic? |c_PwseymLuI|)
      (char>? |c_PwseymLuI| '#\Z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
(letrec ((|string-map_PwOawPLuI|
           (lambda (|strsrc_PwwUl4OuI|
                    |strdst_PwSQjxOuI|
                    |proc_PwcNh-OuI|
                    |n_PwyJfrPuI|
                    |l_PwUFdUPuI|)
             (if (< |n_PwyJfrPuI| |l_PwUFdUPuI|)
               (begin
                 (string-set!
                   |strdst_PwSQjxOuI|
                   |n_PwyJfrPuI|
                   (|proc_PwcNh-OuI|
                     (string-ref |strsrc_PwwUl4OuI| |n_PwyJfrPuI|)))
                 (|string-map_PwOawPLuI|
                   |strsrc_PwwUl4OuI|
                   |strdst_PwSQjxOuI|
                   |proc_PwcNh-OuI|
                   (+ |n_PwyJfrPuI| '1)
                   |l_PwUFdUPuI|))
               |strdst_PwSQjxOuI|))))
  (begin
    (set! string-downcase
      (lambda (|str_Pw87ugMuI|)
        ((lambda (|newstr_Pwu3sJMuI|)
           (|string-map_PwOawPLuI|
             |str_Pw87ugMuI|
             |newstr_Pwu3sJMuI|
             char-downcase
             '0
             (string-length |str_Pw87ugMuI|)))
         (make-string (string-length |str_Pw87ugMuI|)))))
    (set! string-upcase
      (lambda (|str_PwQ_paNuI|)
        ((lambda (|newstr_PwaYnDNuI|)
           (|string-map_PwOawPLuI|
             |str_PwQ_paNuI|
             |newstr_PwaYnDNuI|
             char-upcase
             '0
             (string-length |str_PwQ_paNuI|)))
         (make-string (string-length |str_PwQ_paNuI|)))))))
(define string=? equal?)
(define string<?
  (letrec ((|s<?_PweCblQuI|
             (lambda (|s1_Pwgr5IRuI| |s2_PwCn39SuI|)
               (if (null? |s1_Pwgr5IRuI|)
                 (if (null? |s2_PwCn39SuI|) '#f '#t)
                 (if (null? |s2_PwCn39SuI|)
                   '#f
                   ((lambda (|c1_PwYj1CSuI| |c2_Pwig_2TuI|)
                      (if (char<? |c1_PwYj1CSuI| |c2_Pwig_2TuI|)
                        '#t
                        (if (char>? |c1_PwYj1CSuI| |c2_Pwig_2TuI|)
                          '#f
                          (|s<?_PweCblQuI|
                            (cdr |s1_Pwgr5IRuI|)
                            (cdr |s2_PwCn39SuI|)))))
                    (car |s1_Pwgr5IRuI|)
                    (car |s2_PwCn39SuI|)))))))
    (lambda (|s1_PwAy9OQuI| |s2_PwWu7fRuI|)
      (|s<?_PweCblQuI|
        (string->list |s1_PwAy9OQuI|)
        (string->list |s2_PwWu7fRuI|)))))
(define string>?
  (letrec ((|s>?_PwEcZvTuI|
             (lambda (|s1_PwG1TSUuI| |s2_Pw0-QjVuI|)
               (if (null? |s2_Pw0-QjVuI|)
                 (if (null? |s1_PwG1TSUuI|) '#f '#t)
                 (if (null? |s1_PwG1TSUuI|)
                   '#f
                   ((lambda (|c1_PwmWOMVuI| |c2_PwISMdWuI|)
                      (if (char>? |c1_PwmWOMVuI| |c2_PwISMdWuI|)
                        '#t
                        (if (char<? |c1_PwmWOMVuI| |c2_PwISMdWuI|)
                          '#f
                          (|s>?_PwEcZvTuI|
                            (cdr |s1_PwG1TSUuI|)
                            (cdr |s2_Pw0-QjVuI|)))))
                    (car |s1_PwG1TSUuI|)
                    (car |s2_Pw0-QjVuI|)))))))
    (lambda (|s1_Pw-8XYTuI| |s2_Pwk5VpUuI|)
      (|s>?_PwEcZvTuI|
        (string->list |s1_Pw-8XYTuI|)
        (string->list |s2_Pwk5VpUuI|)))))
(define string<=?
  (lambda (|s1_Pw2PKGWuI| |s2_PwoLI7XuI|)
    ((lambda (|t_PwKHGAXuI|)
       (if |t_PwKHGAXuI|
         |t_PwKHGAXuI|
         (string=? |s1_Pw2PKGWuI| |s2_PwoLI7XuI|)))
     (string<? |s1_Pw2PKGWuI| |s2_PwoLI7XuI|))))
(define string>=?
  (lambda (|s1_Pw4EE1YuI| |s2_PwqACuYuI|)
    ((lambda (|t_PwMwAXYuI|)
       (if |t_PwMwAXYuI|
         |t_PwMwAXYuI|
         (string=? |s1_Pw4EE1YuI| |s2_PwqACuYuI|)))
     (string>? |s1_Pw4EE1YuI| |s2_PwqACuYuI|))))
(define string-ci=?
  (lambda (|s1_Pw6tyoZuI| |s2_PwspwRZuI|)
    (string=?
      (string-downcase |s1_Pw6tyoZuI|)
      (string-downcase |s2_PwspwRZuI|))))
(define string-ci<?
  (lambda (|s1_PwOlui-uI| |s2_Pw8isL-uI|)
    (string<?
      (string-downcase |s1_PwOlui-uI|)
      (string-downcase |s2_Pw8isL-uI|))))
(define string-ci>?
  (lambda (|s1_Pwueqc_uI| |s2_PwQaoF_uI|)
    (string>?
      (string-downcase |s1_Pwueqc_uI|)
      (string-downcase |s2_PwQaoF_uI|))))
(define string-ci>=?
  (lambda (|s1_Pwa7m60vI| |s2_Pww3kz0vI|)
    (string>=?
      (string-downcase |s1_Pwa7m60vI|)
      (string-downcase |s2_Pww3kz0vI|))))
(define string-ci<=?
  (lambda (|s1_PwS_h01vI| |s2_PwcYft1vI|)
    (string<=?
      (string-downcase |s1_PwS_h01vI|)
      (string-downcase |s2_PwcYft1vI|))))
(define substring
  (letrec ((|fill-string_PwyUdW1vI|
             (lambda (|sstr_PwgC3b4vI|
                      |dstr_PwCy1E4vI|
                      |n_PwYu_45vI|
                      |s_PwirZx5vI|
                      |e_PwEnX-5vI|)
               (if (< |s_PwirZx5vI| |e_PwEnX-5vI|)
                 (begin
                   (string-set!
                     |dstr_PwCy1E4vI|
                     |n_PwYu_45vI|
                     (string-ref |sstr_PwgC3b4vI| |s_PwirZx5vI|))
                   (|fill-string_PwyUdW1vI|
                     |sstr_PwgC3b4vI|
                     |dstr_PwCy1E4vI|
                     (+ |n_PwYu_45vI| '1)
                     (+ |s_PwirZx5vI| '1)
                     |e_PwEnX-5vI|))
                 (void)))))
    (lambda (|str_PwUQbn2vI|
             |start_PweN9Q2vI|
             |end_PwAJ7h3vI|)
      ((lambda (|newstr_PwWF5K3vI|)
         (begin
           (|fill-string_PwyUdW1vI|
             |str_PwUQbn2vI|
             |newstr_PwWF5K3vI|
             '0
             |start_PweN9Q2vI|
             |end_PwAJ7h3vI|)
           |newstr_PwWF5K3vI|))
       (make-string
         (- |end_PwAJ7h3vI| |start_PweN9Q2vI|))))))
(define list-ref
  (lambda (|list_Pw-jVr6vI| |n_PwkgTU6vI|)
    (if (zero? |n_PwkgTU6vI|)
      (car |list_Pw-jVr6vI|)
      (list-ref
        (cdr |list_Pw-jVr6vI|)
        (- |n_PwkgTU6vI| '1)))))
(define values
  (lambda |args_PwGcRl7vI|
    (call-with-current-continuation
      (lambda (|k_Pw09PO7vI|)
        (apply |k_Pw09PO7vI| |args_PwGcRl7vI|)))))
