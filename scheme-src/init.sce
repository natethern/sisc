(define for-each
  (lambda (|proc_zUfjDiDBh| . |lists_zUVmFRCBh|)
    (if (null? |lists_zUVmFRCBh|)
      (error 'for-each
             '"invalid number of arguments to procedure for-each.")
      (if (null? (car |lists_zUVmFRCBh|))
        (void)
        (begin
          (apply |proc_zUfjDiDBh|
                 (map-car |lists_zUVmFRCBh|))
          (apply for-each
                 (cons |proc_zUfjDiDBh|
                       (map-cdr |lists_zUVmFRCBh|))))))))
(define eof-object?
  (lambda (|x_zUBfBLDBh|)
    (eq? |x_zUBfBLDBh| '#!eof)))
(define not
  (lambda (|x_zUXbzcEBh|)
    (if |x_zUXbzcEBh| '#f '#t)))
(define eqv? eq?)
(define newline
  (lambda |port_zUh8xFEBh|
    (apply display
           (cons '#\newline |port_zUh8xFEBh|))))
(define reverse
  (letrec ((|iter_zUD4v6FBh|
             (lambda (|ls_zUjZq0GBh| |acc_zUFVotGBh|)
               (if (null? |ls_zUjZq0GBh|)
                 |acc_zUFVotGBh|
                 (|iter_zUD4v6FBh|
                   (cdr |ls_zUjZq0GBh|)
                   (cons (car |ls_zUjZq0GBh|) |acc_zUFVotGBh|))))))
    (lambda (|ls_zUZ0tzFBh|)
      (|iter_zUD4v6FBh| |ls_zUZ0tzFBh| '()))))
(define map-car
  (lambda (|ls_zU_RmWGBh|)
    (if (null? |ls_zU_RmWGBh|)
      '()
      (cons (caar |ls_zU_RmWGBh|)
            (map-car (cdr |ls_zU_RmWGBh|))))))
(define map-cdr
  (lambda (|ls_zUlOknHBh|)
    (if (null? |ls_zUlOknHBh|)
      '()
      (cons (cdar |ls_zUlOknHBh|)
            (map-cdr (cdr |ls_zUlOknHBh|))))))
(define map
  (letrec ((|map1_zUHKiQHBh|
             (lambda (|proc_zUps85KBh|
                      |list_zULo6yKBh|
                      |acc_zU5l4_KBh|)
               (if (null? |list_zULo6yKBh|)
                 (reverse |acc_zU5l4_KBh|)
                 (|map1_zUHKiQHBh|
                   |proc_zUps85KBh|
                   (cdr |list_zULo6yKBh|)
                   (cons (|proc_zUps85KBh| (car |list_zULo6yKBh|))
                         |acc_zU5l4_KBh|)))))
           (|loop_zU1HghIBh|
             (lambda (|proc_zUrh2sLBh|
                      |list1_zUNd0VLBh|
                      |lists_zU7a-lMBh|
                      |c_zUt6YOMBh|)
               (if (null? |list1_zUNd0VLBh|)
                 (reverse |c_zUt6YOMBh|)
                 (|loop_zU1HghIBh|
                   |proc_zUrh2sLBh|
                   (cdr |list1_zUNd0VLBh|)
                   (map-cdr |lists_zU7a-lMBh|)
                   (cons (apply |proc_zUrh2sLBh|
                                (car |list1_zUNd0VLBh|)
                                (map-car |lists_zU7a-lMBh|))
                         |c_zUt6YOMBh|))))))
    (lambda (|proc_zU3waEJBh|
             |list1_zUJzcbJBh|
             .
             |lists_zUnDeKIBh|)
      (if (null? |lists_zUnDeKIBh|)
        (|map1_zUHKiQHBh|
          |proc_zU3waEJBh|
          |list1_zUJzcbJBh|
          '())
        (|loop_zU1HghIBh|
          |proc_zU3waEJBh|
          |list1_zUJzcbJBh|
          |lists_zUnDeKIBh|
          '())))))
(define compose
  (lambda |rest_zUP2WfNBh|
    (if (null? |rest_zUP2WfNBh|)
      (lambda (|x_zUbQN3PBh|) |x_zUbQN3PBh|)
      ((lambda (|f_zU9_TINBh| |g_zUvXR9OBh|)
         (lambda (|x_zURTPCOBh|)
           (|f_zU9_TINBh| (|g_zUvXR9OBh| |x_zURTPCOBh|))))
       (car |rest_zUP2WfNBh|)
       (apply compose (cdr |rest_zUP2WfNBh|))))))
(define compose2
  (lambda (|f_zUxMLwPBh| |g_zUTIJZPBh|)
    (lambda (|x_zUdFHqQBh|)
      (|f_zUxMLwPBh| (|g_zUTIJZPBh| |x_zUdFHqQBh|)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
(letrec ((|assn_zUzBFTQBh|
           (lambda (|n_zUnOcdXBh| |obj_zUJKaGXBh| |alist_zU3H87YBh|)
             (if (null? |alist_zU3H87YBh|)
               '#f
               (if (|n_zUnOcdXBh|
                     (caar |alist_zU3H87YBh|)
                     |obj_zUJKaGXBh|)
                 (car |alist_zU3H87YBh|)
                 (|assn_zUzBFTQBh|
                   |n_zUnOcdXBh|
                   |obj_zUJKaGXBh|
                   (cdr |alist_zU3H87YBh|))))))
         (|memn_zUVxDkRBh|
           (lambda (|n_zUpD6AYBh| |obj_zULz41ZBh| |list_zU5w2uZBh|)
             (if (null? |list_zU5w2uZBh|)
               '#f
               (if (|n_zUpD6AYBh|
                     (car |list_zU5w2uZBh|)
                     |obj_zULz41ZBh|)
                 |list_zU5w2uZBh|
                 (|memn_zUVxDkRBh|
                   |n_zUpD6AYBh|
                   |obj_zULz41ZBh|
                   (cdr |list_zU5w2uZBh|)))))))
  (begin
    (set! assq
      (lambda (|obj_zUfuBNRBh| |alist_zUBqzeSBh|)
        (|assn_zUzBFTQBh|
          eq?
          |obj_zUfuBNRBh|
          |alist_zUBqzeSBh|)))
    (set! assv
      (lambda (|obj_zUXmxHSBh| |alist_zUhjv8TBh|)
        (|assn_zUzBFTQBh|
          eqv?
          |obj_zUXmxHSBh|
          |alist_zUhjv8TBh|)))
    (set! assoc
      (lambda (|obj_zUDftBTBh| |alist_zUZbr2UBh|)
        (|assn_zUzBFTQBh|
          equal?
          |obj_zUDftBTBh|
          |alist_zUZbr2UBh|)))
    (set! memq
      (lambda (|obj_zUj8pvUBh| |list_zUF4nYUBh|)
        (|memn_zUVxDkRBh|
          eq?
          |obj_zUj8pvUBh|
          |list_zUF4nYUBh|)))
    (set! memv
      (lambda (|obj_zU_0lpVBh| |list_zUlZiSVBh|)
        (|memn_zUVxDkRBh|
          eqv?
          |obj_zU_0lpVBh|
          |list_zUlZiSVBh|)))
    (set! member
      (lambda (|obj_zUHVgjWBh| |list_zU1SeMWBh|)
        (|memn_zUVxDkRBh|
          equal?
          |obj_zUHVgjWBh|
          |list_zU1SeMWBh|)))))
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
  (lambda (|ls1_zUrs0XZBh| |ls2_zUNo-n-Bh|)
    (if (null? |ls1_zUrs0XZBh|)
      |ls2_zUNo-n-Bh|
      (cons (car |ls1_zUrs0XZBh|)
            (append2 (cdr |ls1_zUrs0XZBh|) |ls2_zUNo-n-Bh|)))))
(define append append2)
(define list->string
  (letrec ((|l2s_zU7lYQ-Bh|
             (lambda (|l_zUPdUK_Bh| |s_zU9aSb0Ch| |n_zUv6QE0Ch|)
               (if (null? |l_zUPdUK_Bh|)
                 |s_zU9aSb0Ch|
                 (begin
                   (string-set!
                     |s_zU9aSb0Ch|
                     |n_zUv6QE0Ch|
                     (car |l_zUPdUK_Bh|))
                   (|l2s_zU7lYQ-Bh|
                     (cdr |l_zUPdUK_Bh|)
                     |s_zU9aSb0Ch|
                     (+ |n_zUv6QE0Ch| '1)))))))
    (lambda (|l_zUthWh_Bh|)
      (|l2s_zU7lYQ-Bh|
        |l_zUthWh_Bh|
        (make-string (length |l_zUthWh_Bh|))
        '0))))
(define string->list
  (letrec ((|s2l_zUR2O51Ch|
             (lambda (|s_zUxXJ_1Ch| |h_zUTTHs2Ch| |n_zUdQFV2Ch|)
               (if (< |n_zUdQFV2Ch| '0)
                 |h_zUTTHs2Ch|
                 (|s2l_zUR2O51Ch|
                   |s_zUxXJ_1Ch|
                   (cons (string-ref |s_zUxXJ_1Ch| |n_zUdQFV2Ch|)
                         |h_zUTTHs2Ch|)
                   (- |n_zUdQFV2Ch| '1))))))
    (lambda (|s_zUb_Ly1Ch|)
      (|s2l_zUR2O51Ch|
        |s_zUb_Ly1Ch|
        '()
        (- (string-length |s_zUb_Ly1Ch|) '1)))))
(define list->vector
  (letrec ((|l2v_zUzMDm3Ch|
             (lambda (|l_zUfFzg4Ch| |v_zUBBxJ4Ch| |n_zUXxva5Ch|)
               (if (null? |l_zUfFzg4Ch|)
                 |v_zUBBxJ4Ch|
                 (begin
                   (vector-set!
                     |v_zUBBxJ4Ch|
                     |n_zUXxva5Ch|
                     (car |l_zUfFzg4Ch|))
                   (|l2v_zUzMDm3Ch|
                     (cdr |l_zUfFzg4Ch|)
                     |v_zUBBxJ4Ch|
                     (+ |n_zUXxva5Ch| '1)))))))
    (lambda (|l_zUVIBP3Ch|)
      (if (proper-list? |l_zUVIBP3Ch|)
        (|l2v_zUzMDm3Ch|
          |l_zUVIBP3Ch|
          (make-vector (length |l_zUVIBP3Ch|))
          '0)
        (error 'list->vector
               '"can only convert a proper list."
               |l_zUVIBP3Ch|)))))
(define vector
  (lambda |elems_zUhutD5Ch|
    (list->vector |elems_zUhutD5Ch|)))
(define string
  (lambda |elems_zUDqr46Ch|
    (list->string |elems_zUDqr46Ch|)))
(define detect-os
  (lambda ()
    ((lambda (|osn_zUZmpx6Ch|)
       (if (> (string-length |osn_zUZmpx6Ch|) '3)
         (if (equal? (substring |osn_zUZmpx6Ch| '0 '3) '"mac")
           'macos
           (if (equal? (substring |osn_zUZmpx6Ch| '0 '3) '"win")
             'ms-dos
             (if (equal? (substring |osn_zUZmpx6Ch| '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring |osn_zUZmpx6Ch| '0 '3) '"uni")
                 'unix
                 (if (equal? (substring |osn_zUZmpx6Ch| '0 '3) '"lin")
                   'unix
                   (if (equal?
                         (substring |osn_zUZmpx6Ch| '0 '4)
                         '"os/2")
                     'os2
                     (if (equal? (substring |osn_zUZmpx6Ch| '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase
       (getprop 'os.name '*environment-variables*)))))
(define current-url (make-parameter '"file:."))
(define current-directory
  (lambda |rest_zUjjn-6Ch|
    (if (null? |rest_zUjjn-6Ch|)
      (normalize-url (current-url) '".")
      (current-url
        (normalize-url
          (current-url)
          ((lambda (|v_zUFflr7Ch|)
             ((lambda (|l_zU_bjU7Ch|)
                (if (eq? (string-ref |v_zUFflr7Ch| (- |l_zU_bjU7Ch| '1))
                         '#\/)
                  |v_zUFflr7Ch|
                  (string-append |v_zUFflr7Ch| '"/")))
              (string-length |v_zUFflr7Ch|)))
           (car |rest_zUjjn-6Ch|)))))))
(define load-expanded load)
((lambda (|_load_zUl8hl8Ch|)
   ((lambda (|normalize_zUH4fO8Ch|
             |file-handler_zU11df9Ch|
             |file-extension_zUnZaI9Ch|)
      (begin
        (set! open-input-file
          (|normalize_zUH4fO8Ch| open-input-file))
        (set! open-source-input-file
          (|normalize_zUH4fO8Ch| open-source-input-file))
        (set! open-output-file
          (|normalize_zUH4fO8Ch| open-output-file))
        (set! load
          (lambda (|file_zUJV89aCh|)
            (begin
              ((lambda (|previous-url_zU3S6CaCh|)
                 (begin
                   (current-url
                     (normalize-url
                       |previous-url_zU3S6CaCh|
                       |file_zUJV89aCh|))
                   (with-failure-continuation
                     (lambda (|m_zUpO43bCh| |e_zULK2wbCh|)
                       (begin
                         (current-url |previous-url_zU3S6CaCh|)
                         (call-with-failure-continuation
                           (lambda (|fk_zU5H0ZbCh|)
                             (|fk_zU5H0ZbCh| |m_zUpO43bCh| |e_zULK2wbCh|)))))
                     (lambda ()
                       ((lambda (|fe_zUrD-pcCh|)
                          ((|file-handler_zU11df9Ch|
                             (if |fe_zUrD-pcCh| |fe_zUrD-pcCh| '"scm"))
                           (current-url)))
                        (|file-extension_zUnZaI9Ch| (current-url)))))
                   (current-url |previous-url_zU3S6CaCh|)))
               (current-url))
              (void))))))
    (lambda (|proc_zUNzYScCh|)
      (lambda (|file_zUtsUMdCh| . |rest_zU7wWjdCh|)
        (apply |proc_zUNzYScCh|
               (normalize-url (current-url) |file_zUtsUMdCh|)
               |rest_zU7wWjdCh|)))
    (lambda (|extension_zUPoSdeCh|)
      ((lambda (|t_zU9lQGeCh|)
         (if (memv |t_zU9lQGeCh| '(sce pp))
           load-expanded
           (if (memv |t_zU9lQGeCh| '(sll))
             (with-failure-continuation
               (lambda (|m_zUvhO7fCh| |e_zURdMAfCh|)
                 (lambda (|name_zUbaK1gCh|)
                   (error 'load
                          '"shared libraries not supported in this build.")))
               (lambda ()
                 (eval '(lambda (name)
                          (import compiled-libraries)
                          (link-library (open-library name))))))
             |_load_zUl8hl8Ch|)))
       (string->symbol
         (string-downcase |extension_zUPoSdeCh|))))
    (lambda (|url_zUx6IugCh|)
      ((letrec ((|loop_zUT2GXgCh|
                  (lambda (|x_zUd_DohCh| |acc_zUzXBRhCh|)
                    (if (null? |x_zUd_DohCh|)
                      '#f
                      (if (equal? (car |x_zUd_DohCh|) '#\.)
                        (list->string |acc_zUzXBRhCh|)
                        (|loop_zUT2GXgCh|
                          (cdr |x_zUd_DohCh|)
                          (cons (car |x_zUd_DohCh|) |acc_zUzXBRhCh|)))))))
         |loop_zUT2GXgCh|)
       (reverse (string->list |url_zUx6IugCh|))
       '()))))
 load)
(define load-module
  (lambda (|str_zUVTziiCh|)
    ((lambda (|nl_zUfQxLiCh|)
       ((lambda (|binding-names_zUBMvcjCh|)
          (for-each
            (lambda (|name_zUXItFjCh|)
              (putprop
                |name_zUXItFjCh|
                '*toplevel*
                (native-library-binding
                  |nl_zUfQxLiCh|
                  |name_zUXItFjCh|)))
            |binding-names_zUBMvcjCh|))
        (native-library-binding-names |nl_zUfQxLiCh|)))
     (load-native-library |str_zUVTziiCh|))))
(define append
  (letrec ((|real-append_zUhFr6kCh|
             (lambda (|ls1_zUjultlCh| . |lses_zUZxn0lCh|)
               (if (null? |lses_zUZxn0lCh|)
                 |ls1_zUjultlCh|
                 (if (null? |ls1_zUjultlCh|)
                   (apply |real-append_zUhFr6kCh| |lses_zUZxn0lCh|)
                   (apply |real-append_zUhFr6kCh|
                          (cons (append2
                                  |ls1_zUjultlCh|
                                  (car |lses_zUZxn0lCh|))
                                (cdr |lses_zUZxn0lCh|))))))))
    (lambda |lses_zUDBpzkCh|
      (if (null? |lses_zUDBpzkCh|)
        '()
        (if (null? (cdr |lses_zUDBpzkCh|))
          (car |lses_zUDBpzkCh|)
          (apply |real-append_zUhFr6kCh|
                 (cons (car |lses_zUDBpzkCh|)
                       (cdr |lses_zUDBpzkCh|))))))))
(define proper-list?
  (lambda (|x_zUFqjWlCh|)
    ((letrec ((|lp_zU_mhnmCh|
                (lambda (|x_zUljfQmCh| |lag_zUHfdhnCh|)
                  (if (pair? |x_zUljfQmCh|)
                    ((lambda (|x_zU1cbKnCh|)
                       (if (pair? |x_zU1cbKnCh|)
                         ((lambda (|x_zUn89boCh| |lag_zUJ47EoCh|)
                            (if (eq? |x_zUn89boCh| |lag_zUJ47EoCh|)
                              '#f
                              (|lp_zU_mhnmCh| |x_zUn89boCh| |lag_zUJ47EoCh|)))
                          (cdr |x_zU1cbKnCh|)
                          (cdr |lag_zUHfdhnCh|))
                         (null? |x_zU1cbKnCh|)))
                     (cdr |x_zUljfQmCh|))
                    (null? |x_zUljfQmCh|)))))
       |lp_zU_mhnmCh|)
     |x_zUFqjWlCh|
     |x_zUFqjWlCh|)))
(define list? proper-list?)
(define expt
  (letrec ((|general-expt_zU3155pCh|
             (lambda (|base_zUrOYUqCh| |exponent_zUNKWlrCh|)
               (exp (* |exponent_zUNKWlrCh| (log |base_zUrOYUqCh|)))))
           (|integer-expt_zUpZ2ypCh|
             (lambda (|base_zU7HUOrCh| |exponent_zUtDSfsCh|)
               (if (negative? |exponent_zUtDSfsCh|)
                 (/ (|integer-expt_zUpZ2ypCh|
                      |base_zU7HUOrCh|
                      (abs |exponent_zUtDSfsCh|)))
                 (if (if (exact? |base_zU7HUOrCh|)
                       (= |base_zU7HUOrCh| '2)
                       '#f)
                   (ashl '1 |exponent_zUtDSfsCh|)
                   ((letrec ((|loop_zUPzQIsCh|
                               (lambda (|rest_zU9wO9tCh|
                                        |result_zUvsMCtCh|
                                        |squaring_zURoK3uCh|)
                                 (if (zero? |rest_zU9wO9tCh|)
                                   |result_zUvsMCtCh|
                                   (|loop_zUPzQIsCh|
                                     (quotient |rest_zU9wO9tCh| '2)
                                     (if (odd? |rest_zU9wO9tCh|)
                                       (* |result_zUvsMCtCh|
                                          |squaring_zURoK3uCh|)
                                       |result_zUvsMCtCh|)
                                     (* |squaring_zURoK3uCh|
                                        |squaring_zURoK3uCh|))))))
                      |loop_zUPzQIsCh|)
                    |exponent_zUtDSfsCh|
                    '1
                    |base_zU7HUOrCh|))))))
    (lambda (|base_zULV0_pCh| |exponent_zU5S-rqCh|)
      (if (zero? |exponent_zU5S-rqCh|)
        (if (exact? |exponent_zU5S-rqCh|) '1 '1.0)
        (if (zero? |base_zULV0_pCh|)
          (if (exact? |exponent_zU5S-rqCh|)
            |base_zULV0_pCh|
            '0.0)
          (if (if (exact? |exponent_zU5S-rqCh|)
                (integer? |exponent_zU5S-rqCh|)
                '#f)
            (|integer-expt_zUpZ2ypCh|
              |base_zULV0_pCh|
              |exponent_zU5S-rqCh|)
            (|general-expt_zU3155pCh|
              |base_zULV0_pCh|
              |exponent_zU5S-rqCh|)))))))
(define modpow
  (lambda (|x_zUblIwuCh| |y_zUxhGZuCh| |n_zUTdEqvCh|)
    (if (= |y_zUxhGZuCh| '1)
      (modulo |x_zUblIwuCh| |n_zUTdEqvCh|)
      (if (even? |y_zUxhGZuCh|)
        ((lambda (|tmp_zUV2yNwCh|)
           (modulo
             (* |tmp_zUV2yNwCh| |tmp_zUV2yNwCh|)
             |n_zUTdEqvCh|))
         (modpow
           |x_zUblIwuCh|
           (/ |y_zUxhGZuCh| '2)
           |n_zUTdEqvCh|))
        ((lambda (|tmp_zUz6AkwCh|)
           (begin
             (set! |tmp_zUz6AkwCh|
               (modulo
                 (* |tmp_zUz6AkwCh| |tmp_zUz6AkwCh|)
                 |n_zUTdEqvCh|))
             (modulo
               (* |x_zUblIwuCh| |tmp_zUz6AkwCh|)
               |n_zUTdEqvCh|)))
         (modpow
           |x_zUblIwuCh|
           (/ (- |y_zUxhGZuCh| '1) '2)
           |n_zUTdEqvCh|))))))
(define integer?
  ((lambda (|oldint?_zUf_vexCh|)
     (lambda (|n_zUBXtHxCh|)
       ((lambda (|t_zUXTr8yCh|)
          (if |t_zUXTr8yCh|
            |t_zUXTr8yCh|
            (if (real? |n_zUBXtHxCh|)
              (= (round |n_zUBXtHxCh|) |n_zUBXtHxCh|)
              '#f)))
        (|oldint?_zUf_vexCh| |n_zUBXtHxCh|))))
   integer?))
(define real?
  ((lambda (|oldcomp?_zUhQpByCh|)
     (lambda (|n_zUDMn2zCh|)
       (if (number? |n_zUDMn2zCh|)
         (if (|oldcomp?_zUhQpByCh| |n_zUDMn2zCh|) '#f '#t)
         '#f)))
   complex?))
(define rational? real?)
(define complex? number?)
(define abs
  (lambda (|num_zUZIlvzCh|)
    (if (real? |num_zUZIlvzCh|)
      (if (< |num_zUZIlvzCh| '0)
        (- |num_zUZIlvzCh|)
        |num_zUZIlvzCh|)
      ((lambda (|a_zUjFjYzCh| |b_zUFBhpACh|)
         (sqrt (+ (* |a_zUjFjYzCh| |a_zUjFjYzCh|)
                  (* |b_zUFBhpACh| |b_zUFBhpACh|))))
       (real-part |num_zUZIlvzCh|)
       (imag-part |num_zUZIlvzCh|)))))
(define min (void))
(define max (void))
(letrec ((|_min_max_zU_xfSACh|
           (lambda (|proc_zUJf57DCh|
                    |mv_zU3c3ADCh|
                    |args_zUp811ECh|
                    |inexact_zUL4_tECh|)
             (if (null? |args_zUp811ECh|)
               (if (if |inexact_zUL4_tECh|
                     (exact? |mv_zU3c3ADCh|)
                     '#f)
                 (exact->inexact |mv_zU3c3ADCh|)
                 |mv_zU3c3ADCh|)
               (if (|proc_zUJf57DCh|
                     (car |args_zUp811ECh|)
                     |mv_zU3c3ADCh|)
                 (|_min_max_zU_xfSACh|
                   |proc_zUJf57DCh|
                   (car |args_zUp811ECh|)
                   (cdr |args_zUp811ECh|)
                   ((lambda (|t_zU51ZWECh|)
                      (if |t_zU51ZWECh|
                        |t_zU51ZWECh|
                        (inexact? (car |args_zUp811ECh|))))
                    |inexact_zUL4_tECh|))
                 (|_min_max_zU_xfSACh|
                   |proc_zUJf57DCh|
                   |mv_zU3c3ADCh|
                   (cdr |args_zUp811ECh|)
                   |inexact_zUL4_tECh|))))))
  (begin
    (set! min
      (lambda (|x1_zUHqbMBCh| . |args_zUludjBCh|)
        (if (null? |args_zUludjBCh|)
          |x1_zUHqbMBCh|
          (|_min_max_zU_xfSACh|
            <
            |x1_zUHqbMBCh|
            |args_zUludjBCh|
            (inexact? |x1_zUHqbMBCh|)))))
    (set! max
      (lambda (|x1_zUnj7GCCh| . |args_zU1n9dCCh|)
        (if (null? |args_zU1n9dCCh|)
          |x1_zUnj7GCCh|
          (|_min_max_zU_xfSACh|
            >
            |x1_zUnj7GCCh|
            |args_zU1n9dCCh|
            (inexact? |x1_zUnj7GCCh|)))))))
(define negative?
  (lambda (|n_zUrZWnFCh|) (< |n_zUrZWnFCh| '0)))
(define positive?
  (lambda (|n_zUNVUQFCh|) (> |n_zUNVUQFCh| '0)))
(define even?
  (lambda (|n_zU7SShGCh|)
    (= '0 (modulo |n_zU7SShGCh| '2))))
(define odd?
  (lambda (|n_zUtOQKGCh|)
    (if (even? |n_zUtOQKGCh|) '#f '#t)))
(define zero?
  (lambda (|n_zUPKObHCh|) (= |n_zUPKObHCh| '0)))
(define add1
  (lambda (|n_zU9HMEHCh|) (+ |n_zU9HMEHCh| '1)))
(define sub1
  (lambda (|n_zUvDK5ICh|) (- |n_zUvDK5ICh| '1)))
(define >= (void))
(define <= (void))
((lambda (|_comp_help_zURzIyICh| |_and2_zUbwG_ICh|)
   (begin
     (set! <=
       (|_comp_help_zURzIyICh|
         (lambda (|a_zUxsEsJCh| |b_zUToCVJCh|)
           ((lambda (|t_zUdlAmKCh|)
              (if |t_zUdlAmKCh|
                |t_zUdlAmKCh|
                (= |a_zUxsEsJCh| |b_zUToCVJCh|)))
            (< |a_zUxsEsJCh| |b_zUToCVJCh|)))
         |_and2_zUbwG_ICh|
         '#t))
     (set! >=
       (|_comp_help_zURzIyICh|
         (lambda (|a_zUzhyPKCh| |b_zUVdwgLCh|)
           ((lambda (|t_zUfauJLCh|)
              (if |t_zUfauJLCh|
                |t_zUfauJLCh|
                (= |a_zUzhyPKCh| |b_zUVdwgLCh|)))
            (> |a_zUzhyPKCh| |b_zUVdwgLCh|)))
         |_and2_zUbwG_ICh|
         '#t))))
 (lambda (|comparator_zUB6saMCh|
          |chainer_zUX2qDMCh|
          |endstate_zUh_n4NCh|)
   (lambda |args_zUDXlxNCh|
     ((letrec ((|loop_zUZTj-NCh|
                 (lambda (|x_zUjQhrOCh|)
                   (if (null? |x_zUjQhrOCh|)
                     |endstate_zUh_n4NCh|
                     (if (null? (cdr |x_zUjQhrOCh|))
                       |endstate_zUh_n4NCh|
                       (|chainer_zUX2qDMCh|
                         (|comparator_zUB6saMCh|
                           (car |x_zUjQhrOCh|)
                           (cadr |x_zUjQhrOCh|))
                         (|loop_zUZTj-NCh| (cdr |x_zUjQhrOCh|))))))))
        |loop_zUZTj-NCh|)
      |args_zUDXlxNCh|)))
 (lambda (|x_zUFMfUOCh| |y_zU_IdlPCh|)
   (if |x_zUFMfUOCh| |y_zU_IdlPCh| '#f)))
((lambda (|_?=_zUlFbOPCh|)
   (begin
     (set! >= (|_?=_zUlFbOPCh| > >=))
     (set! <= (|_?=_zUlFbOPCh| < <=))))
 (lambda (|comparator_zUHB9fQCh| |chainer_zU1y7IQCh|)
   (lambda |args_zUnu59RCh|
     ((lambda (|t_zUJq3CRCh|)
        (if |t_zUJq3CRCh|
          |t_zUJq3CRCh|
          ((lambda (|t_zU3n13SCh|)
             (if |t_zU3n13SCh|
               |t_zU3n13SCh|
               (if ((lambda (|t_zUpj_vSCh|)
                      (if |t_zUpj_vSCh|
                        |t_zUpj_vSCh|
                        (|comparator_zUHB9fQCh|
                          (car |args_zUnu59RCh|)
                          (cadr |args_zUnu59RCh|))))
                    (= (car |args_zUnu59RCh|)
                       (cadr |args_zUnu59RCh|)))
                 (apply |chainer_zU1y7IQCh|
                        (cdr |args_zUnu59RCh|))
                 '#f)))
           (null? (cdr |args_zUnu59RCh|)))))
      (null? |args_zUnu59RCh|)))))
(define gcd
  (lambda |args_zULfZYSCh|
    (if (null? |args_zULfZYSCh|)
      '0
      (if (null? (cdr |args_zULfZYSCh|))
        (car |args_zULfZYSCh|)
        (_gcd (car |args_zULfZYSCh|)
              (cadr |args_zULfZYSCh|))))))
(define lcm
  (lambda |args_zU5cXpTCh|
    (if (null? |args_zU5cXpTCh|)
      '1
      (if (null? (cdr |args_zU5cXpTCh|))
        (car |args_zU5cXpTCh|)
        (_lcm (car |args_zU5cXpTCh|)
              (cadr |args_zU5cXpTCh|))))))
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
  (lambda (|x_zUr8VSTCh| |y_zUN4TjUCh|)
    ((lambda (|r_zU71RMUCh|)
       (if (if (negative? |y_zUN4TjUCh|)
             (positive? |r_zU71RMUCh|)
             (negative? |r_zU71RMUCh|))
         (+ |r_zU71RMUCh| |y_zUN4TjUCh|)
         |r_zU71RMUCh|))
     (remainder |x_zUr8VSTCh| |y_zUN4TjUCh|))))
(max-precision '32)
(define string-append
  (lambda |args_zUtZOdVCh|
    (if (null? |args_zUtZOdVCh|)
      '""
      (if (null? (cdr |args_zUtZOdVCh|))
        (car |args_zUtZOdVCh|)
        (apply string-append
               (_string-append
                 (car |args_zUtZOdVCh|)
                 (cadr |args_zUtZOdVCh|))
               (cddr |args_zUtZOdVCh|))))))
(define char-downcase
  ((lambda (|a_zUPVMGVCh|)
     ((lambda (|z_zU9SK7WCh|)
        ((lambda (|lc-offset_zUvOIAWCh|)
           (lambda (|c_zURKG1XCh|)
             ((lambda (|cv_zUbHEuXCh|)
                (if (if (>= |cv_zUbHEuXCh| |a_zUPVMGVCh|)
                      (<= |cv_zUbHEuXCh| |z_zU9SK7WCh|)
                      '#f)
                  (integer->char
                    (+ |cv_zUbHEuXCh| |lc-offset_zUvOIAWCh|))
                  |c_zURKG1XCh|))
              (char->integer |c_zURKG1XCh|))))
         (- (char->integer '#\a) |a_zUPVMGVCh|)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (|a_zUxDCXXCh|)
     ((lambda (|z_zUTzAoYCh|)
        ((lambda (|uc-offset_zUdwyRYCh|)
           (lambda (|c_zUzswiZCh|)
             ((lambda (|cv_zUVouLZCh|)
                (if (if (>= |cv_zUVouLZCh| |a_zUxDCXXCh|)
                      (<= |cv_zUVouLZCh| |z_zUTzAoYCh|)
                      '#f)
                  (integer->char
                    (- |cv_zUVouLZCh| |uc-offset_zUdwyRYCh|))
                  |c_zUzswiZCh|))
              (char->integer |c_zUzswiZCh|))))
         (- |a_zUxDCXXCh| (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (|c1_zUflsc-Ch| |c2_zUBhqF-Ch|)
    (> (char->integer |c1_zUflsc-Ch|)
       (char->integer |c2_zUBhqF-Ch|))))
(define char<?
  (lambda (|c1_zUXdo6_Ch| |c2_zUhamz_Ch|)
    (< (char->integer |c1_zUXdo6_Ch|)
       (char->integer |c2_zUhamz_Ch|))))
(define char=? eq?)
(define char>=?
  (lambda (|c1_zUD6k00Dh| |c2_zUZ2it0Dh|)
    ((lambda (|t_zUj_fW0Dh|)
       (if |t_zUj_fW0Dh|
         |t_zUj_fW0Dh|
         (char=? |c1_zUD6k00Dh| |c2_zUZ2it0Dh|)))
     (char>? |c1_zUD6k00Dh| |c2_zUZ2it0Dh|))))
(define char<=?
  (lambda (|c1_zUFXdn1Dh| |c2_zU_TbQ1Dh|)
    ((lambda (|t_zUlQ9h2Dh|)
       (if |t_zUlQ9h2Dh|
         |t_zUlQ9h2Dh|
         (char=? |c1_zUFXdn1Dh| |c2_zU_TbQ1Dh|)))
     (char<? |c1_zUFXdn1Dh| |c2_zU_TbQ1Dh|))))
(define char-ci>?
  (lambda (|c1_zUHM7K2Dh| |c2_zU1J5b3Dh|)
    (char>?
      (char-downcase |c1_zUHM7K2Dh|)
      (char-downcase |c2_zU1J5b3Dh|))))
(define char-ci<?
  (lambda (|c1_zUnF3E3Dh| |c2_zUJB154Dh|)
    (char<?
      (char-downcase |c1_zUnF3E3Dh|)
      (char-downcase |c2_zUJB154Dh|))))
(define char-ci=?
  (lambda (|c1_zU3y_x4Dh| |c2_zUpuZ-4Dh|)
    (char=?
      (char-downcase |c1_zU3y_x4Dh|)
      (char-downcase |c2_zUpuZ-4Dh|))))
(define char-ci>=?
  (lambda (|c1_zULqXr5Dh| |c2_zU5nVU5Dh|)
    ((lambda (|t_zUrjTl6Dh|)
       (if |t_zUrjTl6Dh|
         |t_zUrjTl6Dh|
         (char-ci=? |c1_zULqXr5Dh| |c2_zU5nVU5Dh|)))
     (char-ci>? |c1_zULqXr5Dh| |c2_zU5nVU5Dh|))))
(define char-ci<=?
  (lambda (|c1_zUNfRO6Dh| |c2_zU7cPf7Dh|)
    ((lambda (|t_zUt8NI7Dh|)
       (if |t_zUt8NI7Dh|
         |t_zUt8NI7Dh|
         (char-ci=? |c1_zUNfRO6Dh| |c2_zU7cPf7Dh|)))
     (char-ci<? |c1_zUNfRO6Dh| |c2_zU7cPf7Dh|))))
(define char-alphabetic?
  (lambda (|c_zUP4L98Dh|)
    (if (char-ci>=? |c_zUP4L98Dh| '#\a)
      (char-ci<=? |c_zUP4L98Dh| '#\z)
      '#f)))
(define char-numeric?
  (lambda (|c_zU91JC8Dh|)
    (if (char-ci>=? |c_zU91JC8Dh| '#\0)
      (char-ci<=? |c_zU91JC8Dh| '#\9)
      '#f)))
(define char-whitespace?
  (lambda (|c_zUvZG39Dh|)
    (if (memq |c_zUvZG39Dh| '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (|c_zURVEw9Dh|)
    (if (char-alphabetic? |c_zURVEw9Dh|)
      (char<? |c_zURVEw9Dh| '#\a)
      '#f)))
(define char-lower-case?
  (lambda (|c_zUbSCZ9Dh|)
    (if (char-alphabetic? |c_zUbSCZ9Dh|)
      (char>? |c_zUbSCZ9Dh| '#\Z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
(letrec ((|string-map_zUxOAqaDh|
           (lambda (|strsrc_zUfwqHcDh|
                    |strdst_zUBso8dDh|
                    |proc_zUXomBdDh|
                    |n_zUhlk2eDh|
                    |l_zUDhiveDh|)
             (if (< |n_zUhlk2eDh| |l_zUDhiveDh|)
               (begin
                 (string-set!
                   |strdst_zUBso8dDh|
                   |n_zUhlk2eDh|
                   (|proc_zUXomBdDh|
                     (string-ref |strsrc_zUfwqHcDh| |n_zUhlk2eDh|)))
                 (|string-map_zUxOAqaDh|
                   |strsrc_zUfwqHcDh|
                   |strdst_zUBso8dDh|
                   |proc_zUXomBdDh|
                   (+ |n_zUhlk2eDh| '1)
                   |l_zUDhiveDh|))
               |strdst_zUBso8dDh|))))
  (begin
    (set! string-downcase
      (lambda (|str_zUTKyTaDh|)
        ((lambda (|newstr_zUdHwkbDh|)
           (|string-map_zUxOAqaDh|
             |str_zUTKyTaDh|
             |newstr_zUdHwkbDh|
             char-downcase
             '0
             (string-length |str_zUTKyTaDh|)))
         (make-string (string-length |str_zUTKyTaDh|)))))
    (set! string-upcase
      (lambda (|str_zUzDuNbDh|)
        ((lambda (|newstr_zUVzsecDh|)
           (|string-map_zUxOAqaDh|
             |str_zUzDuNbDh|
             |newstr_zUVzsecDh|
             char-upcase
             '0
             (string-length |str_zUzDuNbDh|)))
         (make-string (string-length |str_zUzDuNbDh|)))))))
(define string=? equal?)
(define string<?
  (letrec ((|s<?_zUZdgYeDh|
             (lambda (|s1_zU_2ajgDh| |s2_zUl_7MgDh|)
               (if (null? |s1_zU_2ajgDh|)
                 (if (null? |s2_zUl_7MgDh|) '#f '#t)
                 (if (null? |s2_zUl_7MgDh|)
                   '#f
                   ((lambda (|c1_zUHX5dhDh| |c2_zU1U3GhDh|)
                      (if (char<? |c1_zUHX5dhDh| |c2_zU1U3GhDh|)
                        '#t
                        (if (char>? |c1_zUHX5dhDh| |c2_zU1U3GhDh|)
                          '#f
                          (|s<?_zUZdgYeDh|
                            (cdr |s1_zU_2ajgDh|)
                            (cdr |s2_zUl_7MgDh|)))))
                    (car |s1_zU_2ajgDh|)
                    (car |s2_zUl_7MgDh|)))))))
    (lambda (|s1_zUjaepfDh| |s2_zUF6cSfDh|)
      (|s<?_zUZdgYeDh|
        (string->list |s1_zUjaepfDh|)
        (string->list |s2_zUF6cSfDh|)))))
(define string>?
  (letrec ((|s>?_zUnQ17iDh|
             (lambda (|s1_zUpFXtjDh| |s2_zULBVWjDh|)
               (if (null? |s2_zULBVWjDh|)
                 (if (null? |s1_zUpFXtjDh|) '#f '#t)
                 (if (null? |s1_zUpFXtjDh|)
                   '#f
                   ((lambda (|c1_zU5yTnkDh| |c2_zUruRQkDh|)
                      (if (char>? |c1_zU5yTnkDh| |c2_zUruRQkDh|)
                        '#t
                        (if (char<? |c1_zU5yTnkDh| |c2_zUruRQkDh|)
                          '#f
                          (|s>?_zUnQ17iDh|
                            (cdr |s1_zUpFXtjDh|)
                            (cdr |s2_zULBVWjDh|)))))
                    (car |s1_zUpFXtjDh|)
                    (car |s2_zULBVWjDh|)))))))
    (lambda (|s1_zUJM_ziDh| |s2_zU3JZ0jDh|)
      (|s>?_zUnQ17iDh|
        (string->list |s1_zUJM_ziDh|)
        (string->list |s2_zU3JZ0jDh|)))))
(define string<=?
  (lambda (|s1_zUNqPhlDh| |s2_zU7nNKlDh|)
    ((lambda (|t_zUtjLbmDh|)
       (if |t_zUtjLbmDh|
         |t_zUtjLbmDh|
         (string=? |s1_zUNqPhlDh| |s2_zU7nNKlDh|)))
     (string<? |s1_zUNqPhlDh| |s2_zU7nNKlDh|))))
(define string>=?
  (lambda (|s1_zUPfJEmDh| |s2_zU9cH5nDh|)
    ((lambda (|t_zUv8FynDh|)
       (if |t_zUv8FynDh|
         |t_zUv8FynDh|
         (string=? |s1_zUPfJEmDh| |s2_zU9cH5nDh|)))
     (string>? |s1_zUPfJEmDh| |s2_zU9cH5nDh|))))
(define string-ci=?
  (lambda (|s1_zUR4D_nDh| |s2_zUb1BsoDh|)
    (string=?
      (string-downcase |s1_zUR4D_nDh|)
      (string-downcase |s2_zUb1BsoDh|))))
(define string-ci<?
  (lambda (|s1_zUxZyVoDh| |s2_zUTVwmpDh|)
    (string<?
      (string-downcase |s1_zUxZyVoDh|)
      (string-downcase |s2_zUTVwmpDh|))))
(define string-ci>?
  (lambda (|s1_zUdSuPpDh| |s2_zUzOsgqDh|)
    (string>?
      (string-downcase |s1_zUdSuPpDh|)
      (string-downcase |s2_zUzOsgqDh|))))
(define string-ci>=?
  (lambda (|s1_zUVKqJqDh| |s2_zUfHoarDh|)
    (string>=?
      (string-downcase |s1_zUVKqJqDh|)
      (string-downcase |s2_zUfHoarDh|))))
(define string-ci<=?
  (lambda (|s1_zUBDmDrDh| |s2_zUXzk4sDh|)
    (string<=?
      (string-downcase |s1_zUBDmDrDh|)
      (string-downcase |s2_zUXzk4sDh|))))
(define substring
  (letrec ((|fill-string_zUhwixsDh|
             (lambda (|sstr_zU_d8OuDh|
                      |dstr_zUla6fvDh|
                      |n_zUH64IvDh|
                      |s_zU1329wDh|
                      |e_zUn__BwDh|)
               (if (< |s_zU1329wDh| |e_zUn__BwDh|)
                 (begin
                   (string-set!
                     |dstr_zUla6fvDh|
                     |n_zUH64IvDh|
                     (string-ref |sstr_zU_d8OuDh| |s_zU1329wDh|))
                   (|fill-string_zUhwixsDh|
                     |sstr_zU_d8OuDh|
                     |dstr_zUla6fvDh|
                     (+ |n_zUH64IvDh| '1)
                     (+ |s_zU1329wDh| '1)
                     |e_zUn__BwDh|))
                 (void)))))
    (lambda (|str_zUDsg-sDh|
             |start_zUZoertDh|
             |end_zUjlcUtDh|)
      ((lambda (|newstr_zUFhaluDh|)
         (begin
           (|fill-string_zUhwixsDh|
             |str_zUDsg-sDh|
             |newstr_zUFhaluDh|
             '0
             |start_zUZoertDh|
             |end_zUjlcUtDh|)
           |newstr_zUFhaluDh|))
       (make-string
         (- |end_zUjlcUtDh| |start_zUZoertDh|))))))
(define list-ref
  (lambda (|list_zUJXZ2xDh| |n_zU3UXvxDh|)
    (if (zero? |n_zU3UXvxDh|)
      (car |list_zUJXZ2xDh|)
      (list-ref
        (cdr |list_zUJXZ2xDh|)
        (- |n_zU3UXvxDh| '1)))))
(define values
  (lambda |args_zUpQVYxDh|
    (call-with-current-continuation
      (lambda (|k_zULMTpyDh|)
        (apply |k_zULMTpyDh| |args_zUpQVYxDh|)))))
