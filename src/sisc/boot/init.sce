(define for-each
  (lambda (|proc_0kyzyIOkK|
           |ls1_0kcDAfOkK|
           .
           |lists_0kSGCONkK|)
    (if (null? |ls1_0kcDAfOkK|)
      (void)
      (begin
        (set! |lists_0kSGCONkK|
          (cons |ls1_0kcDAfOkK| |lists_0kSGCONkK|))
        (apply |proc_0kyzyIOkK|
               (map-car |lists_0kSGCONkK|))
        (apply for-each
               |proc_0kyzyIOkK|
               (map-cdr |lists_0kSGCONkK|))))))
(define eof-object?
  (lambda (|x_0kUvw9PkK|)
    (eq? |x_0kUvw9PkK| '#!eof)))
(define not
  (lambda (|x_0kesuCPkK|)
    (if |x_0kesuCPkK| '#f '#t)))
(define newline
  (lambda |port_0kAos3QkK|
    (apply display '#\newline |port_0kAos3QkK|)))
(define reverse
  (letrec ((|iter_0kWkqwQkK|
             (lambda (|ls_0kCdmqRkK| |acc_0kY9kTRkK|)
               (if (null? |ls_0kCdmqRkK|)
                 |acc_0kY9kTRkK|
                 (|iter_0kWkqwQkK|
                   (cdr |ls_0kCdmqRkK|)
                   (cons (car |ls_0kCdmqRkK|) |acc_0kY9kTRkK|))))))
    (lambda (|ls_0kghoZQkK|)
      (|iter_0kWkqwQkK| |ls_0kghoZQkK| '()))))
(define reverse!
  (letrec ((iter (lambda (s r)
                   (if (null? s) r
                       ((lambda (d)
                          (begin
                            (set-cdr! s r)
                            (iter d s)))
                        (cdr s))))))
    (lambda (s)
      (iter s '()))))
(define map-car
  (lambda (|ls_0ki6ikSkK|)
    (if (null? |ls_0ki6ikSkK|)
      '()
      (cons (caar |ls_0ki6ikSkK|)
            (map-car (cdr |ls_0ki6ikSkK|))))))
(define map-cdr
  (lambda (|ls_0kE2gNSkK|)
    (if (null? |ls_0kE2gNSkK|)
      '()
      (cons (cdar |ls_0kE2gNSkK|)
            (map-cdr (cdr |ls_0kE2gNSkK|))))))
(define map
  (letrec ((|map1_0k--deTkK|
             (lambda (|proc_0kII3vVkK|
                      |list_0k2F1YVkK|
                      |acc_0koB_oWkK|)
               (if (null? |list_0k2F1YVkK|)
                 (reverse! |acc_0koB_oWkK|)
                 (|map1_0k--deTkK|
                   |proc_0kII3vVkK|
                   (cdr |list_0k2F1YVkK|)
                   (cons (|proc_0kII3vVkK| (car |list_0k2F1YVkK|))
                         |acc_0koB_oWkK|)))))
           (|loop_0kkXbHTkK|
             (lambda (|proc_0kKxZRWkK|
                      |list1_0k4uXiXkK|
                      |lists_0kqqVLXkK|
                      |c_0kMmTcYkK|)
               (if (null? |list1_0k4uXiXkK|)
                 (reverse! |c_0kMmTcYkK|)
                 (|loop_0kkXbHTkK|
                   |proc_0kKxZRWkK|
                   (cdr |list1_0k4uXiXkK|)
                   (map-cdr |lists_0kqqVLXkK|)
                   (cons (apply |proc_0kKxZRWkK|
                                (car |list1_0k4uXiXkK|)
                                (map-car |lists_0kqqVLXkK|))
                         |c_0kMmTcYkK|))))))
    (lambda (|proc_0kmM52VkK|
             |list1_0k0Q7BUkK|
             .
             |lists_0kGT98UkK|)
      (if (null? |lists_0kGT98UkK|)
        (|map1_0k--deTkK|
          |proc_0kmM52VkK|
          |list1_0k0Q7BUkK|
          '())
        (|loop_0kkXbHTkK|
          |proc_0kmM52VkK|
          |list1_0k0Q7BUkK|
          |lists_0kGT98UkK|
          '())))))
(define compose2
  (lambda (|f_0k6jRFYkK| |g_0ksfP6ZkK|)
    (lambda (|x_0kObNzZkK|)
      (|f_0k6jRFYkK| (|g_0ksfP6ZkK| |x_0kObNzZkK|)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
(letrec ((|assn_0k88L0-kK|
           (lambda (|n_0kYkim4lK| |obj_0kihgP4lK| |alist_0kEdeg5lK|)
             (if (null? |alist_0kEdeg5lK|)
               '#f
               (if (|n_0kYkim4lK|
                     (caar |alist_0kEdeg5lK|)
                     |obj_0kihgP4lK|)
                 (car |alist_0kEdeg5lK|)
                 (|assn_0k88L0-kK|
                   |n_0kYkim4lK|
                   |obj_0kihgP4lK|
                   (cdr |alist_0kEdeg5lK|))))))
         (|memn_0ku4Jt-kK|
           (lambda (|n_0k-9cJ5lK| |obj_0kk6aa6lK| |list_0kG28D6lK|)
             (if (null? |list_0kG28D6lK|)
               '#f
               (if (|n_0k-9cJ5lK|
                     (car |list_0kG28D6lK|)
                     |obj_0kk6aa6lK|)
                 |list_0kG28D6lK|
                 (|memn_0ku4Jt-kK|
                   |n_0k-9cJ5lK|
                   |obj_0kk6aa6lK|
                   (cdr |list_0kG28D6lK|)))))))
  (begin
    (set! assq
      (lambda (|obj_0kQ0HW-kK| |alist_0kaZEn_kK|)
        (|assn_0k88L0-kK|
          eq?
          |obj_0kQ0HW-kK|
          |alist_0kaZEn_kK|)))
    (set! assv
      (lambda (|obj_0kwVCQ_kK| |alist_0kSRAh0lK|)
        (|assn_0k88L0-kK|
          eqv?
          |obj_0kwVCQ_kK|
          |alist_0kSRAh0lK|)))
    (set! assoc
      (lambda (|obj_0kcOyK0lK| |alist_0kyKwb1lK|)
        (|assn_0k88L0-kK|
          equal?
          |obj_0kcOyK0lK|
          |alist_0kyKwb1lK|)))
    (set! memq
      (lambda (|obj_0kUGuE1lK| |list_0keDs52lK|)
        (|memn_0ku4Jt-kK|
          eq?
          |obj_0kUGuE1lK|
          |list_0keDs52lK|)))
    (set! memv
      (lambda (|obj_0kAzqy2lK| |list_0kWvo_2lK|)
        (|memn_0ku4Jt-kK|
          eqv?
          |obj_0kAzqy2lK|
          |list_0kWvo_2lK|)))
    (set! member
      (lambda (|obj_0kgsms3lK| |list_0kCokV3lK|)
        (|memn_0ku4Jt-kK|
          equal?
          |obj_0kgsms3lK|
          |list_0kCokV3lK|)))))
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
  (lambda (|ls1_0k0_547lK| |ls2_0kmX3x7lK|)
    (if (null? |ls1_0k0_547lK|)
      |ls2_0kmX3x7lK|
      (cons (car |ls1_0k0_547lK|)
            (append2 (cdr |ls1_0k0_547lK|) |ls2_0kmX3x7lK|)))))
(define append append2)
(define list->string
  (letrec ((|l2s_0kIT1-7lK|
             (lambda (|l_0koMZT8lK| |s_0kKIXk9lK| |n_0k4FVN9lK|)
               (if (null? |l_0koMZT8lK|)
                 |s_0kKIXk9lK|
                 (begin
                   (string-set!
                     |s_0kKIXk9lK|
                     |n_0k4FVN9lK|
                     (car |l_0koMZT8lK|))
                   (|l2s_0kIT1-7lK|
                     (cdr |l_0koMZT8lK|)
                     |s_0kKIXk9lK|
                     (+ |n_0k4FVN9lK| '1)))))))
    (lambda (|l_0k2Q_q8lK|)
      (|l2s_0kIT1-7lK|
        |l_0k2Q_q8lK|
        (make-string (length |l_0k2Q_q8lK|))
        '0))))
(define string->list
  (letrec ((|s2l_0kqBTealK|
             (lambda (|s_0k6uP8blK| |h_0ksqNBblK| |n_0kOmL2clK|)
               (if (< |n_0kOmL2clK| '0)
                 |h_0ksqNBblK|
                 (|s2l_0kqBTealK|
                   |s_0k6uP8blK|
                   (cons (string-ref |s_0k6uP8blK| |n_0kOmL2clK|)
                         |h_0ksqNBblK|)
                   (- |n_0kOmL2clK| '1))))))
    (lambda (|s_0kMxRHalK|)
      (|s2l_0kqBTealK|
        |s_0kMxRHalK|
        '()
        (- (string-length |s_0kMxRHalK|) '1)))))
(define list->vector
  (letrec ((|l2v_0k8jJvclK|
             (lambda (|l_0kQbFpdlK| |v_0ka8DSdlK| |n_0kw4BjelK|)
               (if (null? |l_0kQbFpdlK|)
                 |v_0ka8DSdlK|
                 (begin
                   (vector-set!
                     |v_0ka8DSdlK|
                     |n_0kw4BjelK|
                     (car |l_0kQbFpdlK|))
                   (|l2v_0k8jJvclK|
                     (cdr |l_0kQbFpdlK|)
                     |v_0ka8DSdlK|
                     (+ |n_0kw4BjelK| '1)))))))
    (lambda (|l_0kufHYclK|)
      (if (proper-list? |l_0kufHYclK|)
        (|l2v_0k8jJvclK|
          |l_0kufHYclK|
          (make-vector (length |l_0kufHYclK|))
          '0)
        (error 'list->vector
               '"can only convert a proper list."
               |l_0kufHYclK|)))))
(define vector
  (lambda |elems_0kS0zMelK|
    (list->vector |elems_0kS0zMelK|)))
(define string
  (lambda |elems_0kcZwdflK|
    (list->string |elems_0kcZwdflK|)))
(define detect-os
  (lambda ()
    ((lambda (|osn_0kyVuGflK|)
       (if (> (string-length |osn_0kyVuGflK|) '3)
         (if (equal? (substring |osn_0kyVuGflK| '0 '3) '"mac")
           'macos
           (if (equal? (substring |osn_0kyVuGflK| '0 '3) '"win")
             'ms-dos
             (if (equal? (substring |osn_0kyVuGflK| '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring |osn_0kyVuGflK| '0 '3) '"uni")
                 'unix
                 (if (equal? (substring |osn_0kyVuGflK| '0 '3) '"lin")
                   'unix
                   (if (equal?
                         (substring |osn_0kyVuGflK| '0 '4)
                         '"os/2")
                     'os2
                     (if (equal? (substring |osn_0kyVuGflK| '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase (getenv '"os.name")))))
(define current-url (_make-parameter '"file:."))
(define current-directory
  (lambda |rest_0kURs7glK|
    (if (null? |rest_0kURs7glK|)
      (normalize-url (current-url) '".")
      (current-url
        (normalize-url
          (current-url)
          ((lambda (|v_0keOqAglK|)
             ((lambda (|l_0kAKo1hlK|)
                (if (eqv? (string-ref |v_0keOqAglK| (- |l_0kAKo1hlK| '1))
                          '#\/)
                  |v_0keOqAglK|
                  (string-append |v_0keOqAglK| '"/")))
              (string-length |v_0keOqAglK|)))
           (car |rest_0kURs7glK|)))))))
(define file-handler (void))
(define add-file-handler (void))
((lambda (|*file-handlers*_0kWGmuhlK|)
   (begin
     (set! add-file-handler
       (lambda (|extension_0kgDkXhlK| |thunk_0kCzioilK|)
         (if (assq |extension_0kgDkXhlK|
                   |*file-handlers*_0kWGmuhlK|)
           (void)
           (set! |*file-handlers*_0kWGmuhlK|
             (cons (cons |extension_0kgDkXhlK| |thunk_0kCzioilK|)
                   |*file-handlers*_0kWGmuhlK|)))))
     (set! file-handler
       ((lambda (|_load_0kYvgRilK|)
          (lambda (|extension_0kiseijlK|)
            ((lambda (|t_0kEocLjlK|)
               (if |t_0kEocLjlK|
                 (cdr |t_0kEocLjlK|)
                 |_load_0kYvgRilK|))
             (assq (string->symbol
                     (string-downcase |extension_0kiseijlK|))
                   |*file-handlers*_0kWGmuhlK|))))
        load))))
 '())
((lambda (|normalize_0k-kacklK|
          |file-extension_0kkh8FklK|)
   (begin
     (set! open-input-file
       (|normalize_0k-kacklK| open-input-file))
     (set! open-source-input-file
       (|normalize_0k-kacklK| open-source-input-file))
     (set! open-output-file
       (|normalize_0k-kacklK| open-output-file))
     (set! load
       (lambda (|file_0kGd66llK|)
         (begin
           ((lambda (|previous-url_0k0a4zllK|)
              (begin
                (current-url
                  (normalize-url
                    |previous-url_0k0a4zllK|
                    |file_0kGd66llK|))
                (with-failure-continuation
                  (lambda (|m_0km620mlK| |e_0kI20tmlK|)
                    (begin
                      (current-url |previous-url_0k0a4zllK|)
                      (call-with-failure-continuation
                        (lambda (|fk_0k2_ZVmlK|)
                          (|fk_0k2_ZVmlK| |m_0km620mlK| |e_0kI20tmlK|)))))
                  (lambda ()
                    ((lambda (|fe_0koXXmnlK|)
                       ((file-handler
                          (if |fe_0koXXmnlK| |fe_0koXXmnlK| '"scm"))
                        (current-url)))
                     (|file-extension_0kkh8FklK| (current-url)))))
                (current-url |previous-url_0k0a4zllK|)))
            (current-url))
           (void))))))
 (lambda (|proc_0kKTVPnlK|)
   (lambda (|file_0kqMRJolK| . |rest_0k4QTgolK|)
     (apply |proc_0kKTVPnlK|
            (normalize-url (current-url) |file_0kqMRJolK|)
            |rest_0k4QTgolK|)))
 (lambda (|url_0kMIPaplK|)
   ((letrec ((|loop_0k6FNDplK|
               (lambda (|x_0ksBL4qlK| |acc_0kOxJxqlK|)
                 (if (null? |x_0ksBL4qlK|)
                   '#f
                   (if (equal? (car |x_0ksBL4qlK|) '#\.)
                     (list->string |acc_0kOxJxqlK|)
                     (|loop_0k6FNDplK|
                       (cdr |x_0ksBL4qlK|)
                       (cons (car |x_0ksBL4qlK|) |acc_0kOxJxqlK|)))))))
      |loop_0k6FNDplK|)
    (reverse! (string->list |url_0kMIPaplK|))
    '())))
(define load-module
  (lambda (|str_0k8uH-qlK|)
    ((lambda (|nl_0kuqFrrlK|)
       ((lambda (|binding-names_0kQmDUrlK|)
          (for-each
            (lambda (|name_0kajBlslK|)
              (putprop
                |name_0kajBlslK|
                (native-library-binding
                  |nl_0kuqFrrlK|
                  |name_0kajBlslK|)))
            |binding-names_0kQmDUrlK|))
        (native-library-binding-names |nl_0kuqFrrlK|)))
     (load-native-library |str_0k8uH-qlK|))))
(define append
  (letrec ((|real-append_0kwfzOslK|
             (lambda (|ls1_0ky4t9ulK| . |lses_0kc8vItlK|)
               (if (null? |lses_0kc8vItlK|)
                 |ls1_0ky4t9ulK|
                 (if (null? |ls1_0ky4t9ulK|)
                   (apply |real-append_0kwfzOslK| |lses_0kc8vItlK|)
                   (apply |real-append_0kwfzOslK|
                          (append2 |ls1_0ky4t9ulK| (car |lses_0kc8vItlK|))
                          (cdr |lses_0kc8vItlK|)))))))
    (lambda |lses_0kSbxftlK|
      (if (null? |lses_0kSbxftlK|)
        '()
        (if (null? (cdr |lses_0kSbxftlK|))
          (car |lses_0kSbxftlK|)
          (apply |real-append_0kwfzOslK|
                 (car |lses_0kSbxftlK|)
                 (cdr |lses_0kSbxftlK|)))))))
(define proper-list?
  (lambda (|x_0kU0rCulK|)
    ((letrec ((|lp_0keZo3vlK|
                (lambda (|x_0kAVmwvlK| |lag_0kWRkZvlK|)
                  (if (pair? |x_0kAVmwvlK|)
                    ((lambda (|x_0kgOiqwlK|)
                       (if (pair? |x_0kgOiqwlK|)
                         ((lambda (|x_0kCKgTwlK| |lag_0kYGekxlK|)
                            (if (eq? |x_0kCKgTwlK| |lag_0kYGekxlK|)
                              '#f
                              (|lp_0keZo3vlK| |x_0kCKgTwlK| |lag_0kYGekxlK|)))
                          (cdr |x_0kgOiqwlK|)
                          (cdr |lag_0kWRkZvlK|))
                         (null? |x_0kgOiqwlK|)))
                     (cdr |x_0kAVmwvlK|))
                    (null? |x_0kAVmwvlK|)))))
       |lp_0keZo3vlK|)
     |x_0kU0rCulK|
     |x_0kU0rCulK|)))
(define list? proper-list?)
(define expt
  (letrec ((|general-expt_0kiDcNxlK|
             (lambda (|base_0kGo4BzlK| |exponent_0k0l22AlK|)
               (exp (* |exponent_0k0l22AlK| (log |base_0kGo4BzlK|)))))
           (|integer-expt_0kEzaeylK|
             (lambda (|base_0kmh0vAlK| |exponent_0kId-XAlK|)
               (if (negative? |exponent_0kId-XAlK|)
                 (/ (|integer-expt_0kEzaeylK|
                      |base_0kmh0vAlK|
                      (abs |exponent_0kId-XAlK|)))
                 (if (if (exact? |base_0kmh0vAlK|)
                       (= |base_0kmh0vAlK| '2)
                       '#f)
                   (ashl '1 |exponent_0kId-XAlK|)
                   ((letrec ((|loop_0k2aYoBlK|
                               (lambda (|rest_0ko6WRBlK|
                                        |result_0kK2UiClK|
                                        |squaring_0k4_RLClK|)
                                 (if (zero? |rest_0ko6WRBlK|)
                                   |result_0kK2UiClK|
                                   (|loop_0k2aYoBlK|
                                     (quotient |rest_0ko6WRBlK| '2)
                                     (if (odd? |rest_0ko6WRBlK|)
                                       (* |result_0kK2UiClK|
                                          |squaring_0k4_RLClK|)
                                       |result_0kK2UiClK|)
                                     (* |squaring_0k4_RLClK|
                                        |squaring_0k4_RLClK|))))))
                      |loop_0k2aYoBlK|)
                    |exponent_0kId-XAlK|
                    '1
                    |base_0kmh0vAlK|))))))
    (lambda (|base_0k-v8HylK| |exponent_0kks68zlK|)
      (if (zero? |exponent_0kks68zlK|)
        (if (exact? |exponent_0kks68zlK|) '1 '1.0)
        (if (zero? |base_0k-v8HylK|)
          (if (exact? |exponent_0kks68zlK|)
            |base_0k-v8HylK|
            '0.0)
          (if (if (exact? |exponent_0kks68zlK|)
                (integer? |exponent_0kks68zlK|)
                '#f)
            (|integer-expt_0kEzaeylK|
              |base_0k-v8HylK|
              |exponent_0kks68zlK|)
            (|general-expt_0kiDcNxlK|
              |base_0k-v8HylK|
              |exponent_0kks68zlK|)))))))
(define modpow
  (lambda (|x_0kqXPcDlK| |y_0kMTNFDlK| |n_0k6QL6ElK|)
    (if (= |y_0kMTNFDlK| '1)
      (modulo |x_0kqXPcDlK| |n_0k6QL6ElK|)
      (if (even? |y_0kMTNFDlK|)
        ((lambda (|tmp_0k8FFtFlK|)
           (modulo
             (* |tmp_0k8FFtFlK| |tmp_0k8FFtFlK|)
             |n_0k6QL6ElK|))
         (modpow
           |x_0kqXPcDlK|
           (/ |y_0kMTNFDlK| '2)
           |n_0k6QL6ElK|))
        ((lambda (|tmp_0kOIH0FlK|)
           (begin
             (set! |tmp_0kOIH0FlK|
               (modulo
                 (* |tmp_0kOIH0FlK| |tmp_0kOIH0FlK|)
                 |n_0k6QL6ElK|))
             (modulo
               (* |x_0kqXPcDlK| |tmp_0kOIH0FlK|)
               |n_0k6QL6ElK|)))
         (modpow
           |x_0kqXPcDlK|
           (/ (- |y_0kMTNFDlK| '1) '2)
           |n_0k6QL6ElK|))))))
(define integer?
  ((lambda (|oldint?_0kuBDWFlK|)
     (lambda (|n_0kQxBnGlK|)
       ((lambda (|t_0kauzQGlK|)
          (if |t_0kauzQGlK|
            |t_0kauzQGlK|
            (if (real? |n_0kQxBnGlK|)
              (= (round |n_0kQxBnGlK|) |n_0kQxBnGlK|)
              '#f)))
        (|oldint?_0kuBDWFlK| |n_0kQxBnGlK|))))
   integer?))
(define real?
  ((lambda (|oldcomp?_0kwqxhHlK|)
     (lambda (|n_0kSmvKHlK|)
       (if (number? |n_0kSmvKHlK|)
         (if (|oldcomp?_0kwqxhHlK| |n_0kSmvKHlK|) '#f '#t)
         '#f)))
   complex?))
(define rational? real?)
(define complex? number?)
(define abs
  (lambda (|num_0kcjtbIlK|)
    (if (real? |num_0kcjtbIlK|)
      (if (< |num_0kcjtbIlK| '0)
        (- |num_0kcjtbIlK|)
        |num_0kcjtbIlK|)
      ((lambda (|a_0kyfrEIlK| |b_0kUbp5JlK|)
         (sqrt (+ (* |a_0kyfrEIlK| |a_0kyfrEIlK|)
                  (* |b_0kUbp5JlK| |b_0kUbp5JlK|))))
       (real-part |num_0kcjtbIlK|)
       (imag-part |num_0kcjtbIlK|)))))
(define min (void))
(define max (void))
(letrec ((|_min_max_0ke8nyJlK|
           (lambda (|proc_0kYRcPLlK|
                    |mv_0kiOagMlK|
                    |args_0kEK8JMlK|
                    |inexact_0k-G6aNlK|)
             (if (null? |args_0kEK8JMlK|)
               (if (if |inexact_0k-G6aNlK|
                     (exact? |mv_0kiOagMlK|)
                     '#f)
                 (exact->inexact |mv_0kiOagMlK|)
                 |mv_0kiOagMlK|)
               (if (|proc_0kYRcPLlK|
                     (car |args_0kEK8JMlK|)
                     |mv_0kiOagMlK|)
                 (|_min_max_0ke8nyJlK|
                   |proc_0kYRcPLlK|
                   (car |args_0kEK8JMlK|)
                   (cdr |args_0kEK8JMlK|)
                   ((lambda (|t_0kkD4DNlK|)
                      (if |t_0kkD4DNlK|
                        |t_0kkD4DNlK|
                        (inexact? (car |args_0kEK8JMlK|))))
                    |inexact_0k-G6aNlK|))
                 (|_min_max_0ke8nyJlK|
                   |proc_0kYRcPLlK|
                   |mv_0kiOagMlK|
                   (cdr |args_0kEK8JMlK|)
                   |inexact_0k-G6aNlK|))))))
  (begin
    (set! min
      (lambda (|x1_0kW0jsKlK| . |args_0kA4l_JlK|)
        (if (null? |args_0kA4l_JlK|)
          |x1_0kW0jsKlK|
          (|_min_max_0ke8nyJlK|
            <
            |x1_0kW0jsKlK|
            |args_0kA4l_JlK|
            (inexact? |x1_0kW0jsKlK|)))))
    (set! max
      (lambda (|x1_0kCVemLlK| . |args_0kgZgVKlK|)
        (if (null? |args_0kgZgVKlK|)
          |x1_0kCVemLlK|
          (|_min_max_0ke8nyJlK|
            >
            |x1_0kCVemLlK|
            |args_0kgZgVKlK|
            (inexact? |x1_0kCVemLlK|)))))))
(define negative?
  (lambda (|n_0kGz24OlK|) (< |n_0kGz24OlK| '0)))
(define positive?
  (lambda (|n_0k0w0xOlK|) (> |n_0k0w0xOlK| '0)))
(define even?
  (lambda (|n_0kms-ZOlK|)
    (= '0 (modulo |n_0kms-ZOlK| '2))))
(define odd?
  (lambda (|n_0kIoYqPlK|)
    (if (even? |n_0kIoYqPlK|) '#f '#t)))
(define zero?
  (lambda (|n_0k2lWTPlK|) (= |n_0k2lWTPlK| '0)))
(define add1
  (lambda (|n_0kohUkQlK|) (+ |n_0kohUkQlK| '1)))
(define sub1
  (lambda (|n_0kKdSNQlK|) (- |n_0kKdSNQlK| '1)))
(define >= (void))
(define <= (void))
((lambda (|_comp_help_0k4aQeRlK| |_and2_0kq6OHRlK|)
   (begin
     (set! <=
       (|_comp_help_0k4aQeRlK|
         (lambda (|a_0kM2M8SlK| |b_0k6_JBSlK|)
           ((lambda (|t_0ksXH2TlK|)
              (if |t_0ksXH2TlK|
                |t_0ksXH2TlK|
                (= |a_0kM2M8SlK| |b_0k6_JBSlK|)))
            (< |a_0kM2M8SlK| |b_0k6_JBSlK|)))
         |_and2_0kq6OHRlK|
         '#t))
     (set! >=
       (|_comp_help_0k4aQeRlK|
         (lambda (|a_0kOTFvTlK| |b_0k8QDYTlK|)
           ((lambda (|t_0kuMBpUlK|)
              (if |t_0kuMBpUlK|
                |t_0kuMBpUlK|
                (= |a_0kOTFvTlK| |b_0k8QDYTlK|)))
            (> |a_0kOTFvTlK| |b_0k8QDYTlK|)))
         |_and2_0kq6OHRlK|
         '#t))))
 (lambda (|comparator_0kQIzSUlK|
          |chainer_0kaFxjVlK|
          |endstate_0kwBvMVlK|)
   (lambda |args_0kSxtdWlK|
     ((letrec ((|loop_0kcurGWlK|
                 (lambda (|x_0kyqp7XlK|)
                   (if (null? |x_0kyqp7XlK|)
                     |endstate_0kwBvMVlK|
                     (if (null? (cdr |x_0kyqp7XlK|))
                       |endstate_0kwBvMVlK|
                       (|chainer_0kaFxjVlK|
                         (|comparator_0kQIzSUlK|
                           (car |x_0kyqp7XlK|)
                           (cadr |x_0kyqp7XlK|))
                         (|loop_0kcurGWlK| (cdr |x_0kyqp7XlK|))))))))
        |loop_0kcurGWlK|)
      |args_0kSxtdWlK|)))
 (lambda (|x_0kUmnAXlK| |y_0kejl1YlK|)
   (if |x_0kUmnAXlK| |y_0kejl1YlK| '#f)))
((lambda (|_?=_0kAfjuYlK|)
   (begin
     (set! >= (|_?=_0kAfjuYlK| > >=))
     (set! <= (|_?=_0kAfjuYlK| < <=))))
 (lambda (|comparator_0kWbhXYlK| |chainer_0kg8foZlK|)
   (lambda |args_0kC4dRZlK|
     ((lambda (|t_0kY0bi-lK|)
        (if |t_0kY0bi-lK|
          |t_0kY0bi-lK|
          ((lambda (|t_0kiZ8L-lK|)
             (if |t_0kiZ8L-lK|
               |t_0kiZ8L-lK|
               (if ((lambda (|t_0kEV6c_lK|)
                      (if |t_0kEV6c_lK|
                        |t_0kEV6c_lK|
                        (|comparator_0kWbhXYlK|
                          (car |args_0kC4dRZlK|)
                          (cadr |args_0kC4dRZlK|))))
                    (= (car |args_0kC4dRZlK|)
                       (cadr |args_0kC4dRZlK|)))
                 (apply |chainer_0kg8foZlK|
                        (cdr |args_0kC4dRZlK|))
                 '#f)))
           (null? (cdr |args_0kC4dRZlK|)))))
      (null? |args_0kC4dRZlK|)))))
(define gcd
  (lambda |args_0k-R4F_lK|
    (if (null? |args_0k-R4F_lK|)
      '0
      (if (null? (cdr |args_0k-R4F_lK|))
        (car |args_0k-R4F_lK|)
        (_gcd (car |args_0k-R4F_lK|)
              (cadr |args_0k-R4F_lK|))))))
(define lcm
  (lambda |args_0kkO260mK|
    (if (null? |args_0kkO260mK|)
      '1
      (if (null? (cdr |args_0kkO260mK|))
        (car |args_0kkO260mK|)
        (_lcm (car |args_0kkO260mK|)
              (cadr |args_0kkO260mK|))))))
(define modulo
  (lambda (|x_0kGK0z0mK| |y_0k0H-_0mK|)
    ((lambda (|r_0kmDYs1mK|)
       (if (if (negative? |y_0k0H-_0mK|)
             (positive? |r_0kmDYs1mK|)
             (negative? |r_0kmDYs1mK|))
         (+ |r_0kmDYs1mK| |y_0k0H-_0mK|)
         |r_0kmDYs1mK|))
     (remainder |x_0kGK0z0mK| |y_0k0H-_0mK|))))
(define string-append
  (lambda |args_0kIzWV1mK|
    (if (null? |args_0kIzWV1mK|)
      '""
      (if (null? (cdr |args_0kIzWV1mK|))
        (car |args_0kIzWV1mK|)
        (apply string-append
               (_string-append
                 (car |args_0kIzWV1mK|)
                 (cadr |args_0kIzWV1mK|))
               (cddr |args_0kIzWV1mK|))))))
(define char-downcase
  ((lambda (|a_0k2wUm2mK|)
     ((lambda (|z_0kosSP2mK|)
        ((lambda (|lc-offset_0kKoQg3mK|)
           (lambda (|c_0k4lOJ3mK|)
             ((lambda (|cv_0kqhMa4mK|)
                (if (if (>= |cv_0kqhMa4mK| |a_0k2wUm2mK|)
                      (<= |cv_0kqhMa4mK| |z_0kosSP2mK|)
                      '#f)
                  (integer->char
                    (+ |cv_0kqhMa4mK| |lc-offset_0kKoQg3mK|))
                  |c_0k4lOJ3mK|))
              (char->integer |c_0k4lOJ3mK|))))
         (- (char->integer '#\a) |a_0k2wUm2mK|)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (|a_0kMdKD4mK|)
     ((lambda (|z_0k6aI45mK|)
        ((lambda (|uc-offset_0ks6Gx5mK|)
           (lambda (|c_0kO2E-5mK|)
             ((lambda (|cv_0k8_Br6mK|)
                (if (if (>= |cv_0k8_Br6mK| |a_0kMdKD4mK|)
                      (<= |cv_0k8_Br6mK| |z_0k6aI45mK|)
                      '#f)
                  (integer->char
                    (- |cv_0k8_Br6mK| |uc-offset_0ks6Gx5mK|))
                  |c_0kO2E-5mK|))
              (char->integer |c_0kO2E-5mK|))))
         (- |a_0kMdKD4mK| (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (|c1_0kuXzU6mK| |c2_0kQTxl7mK|)
    (> (char->integer |c1_0kuXzU6mK|)
       (char->integer |c2_0kQTxl7mK|))))
(define char<?
  (lambda (|c1_0kaQvO7mK| |c2_0kwMtf8mK|)
    (< (char->integer |c1_0kaQvO7mK|)
       (char->integer |c2_0kwMtf8mK|))))
(define char=? eqv?)
(define char>=?
  (lambda (|c1_0kSIrI8mK| |c2_0kcFp99mK|)
    ((lambda (|t_0kyBnC9mK|)
       (if |t_0kyBnC9mK|
         |t_0kyBnC9mK|
         (char=? |c1_0kSIrI8mK| |c2_0kcFp99mK|)))
     (char>? |c1_0kSIrI8mK| |c2_0kcFp99mK|))))
(define char<=?
  (lambda (|c1_0kUxl3amK| |c2_0keujwamK|)
    ((lambda (|t_0kAqhZamK|)
       (if |t_0kAqhZamK|
         |t_0kAqhZamK|
         (char=? |c1_0kUxl3amK| |c2_0keujwamK|)))
     (char<? |c1_0kUxl3amK| |c2_0keujwamK|))))
(define char-ci>?
  (lambda (|c1_0kWmfqbmK| |c2_0kgjdTbmK|)
    (char>?
      (char-downcase |c1_0kWmfqbmK|)
      (char-downcase |c2_0kgjdTbmK|))))
(define char-ci<?
  (lambda (|c1_0kCfbkcmK| |c2_0kYb9NcmK|)
    (char<?
      (char-downcase |c1_0kCfbkcmK|)
      (char-downcase |c2_0kYb9NcmK|))))
(define char-ci=?
  (lambda (|c1_0ki87edmK| |c2_0kE45HdmK|)
    (char=?
      (char-downcase |c1_0ki87edmK|)
      (char-downcase |c2_0kE45HdmK|))))
(define char-ci>=?
  (lambda (|c1_0k-038emK| |c2_0kkZ0BemK|)
    ((lambda (|t_0kGV-1fmK|)
       (if |t_0kGV-1fmK|
         |t_0kGV-1fmK|
         (char-ci=? |c1_0k-038emK| |c2_0kkZ0BemK|)))
     (char-ci>? |c1_0k-038emK| |c2_0kkZ0BemK|))))
(define char-ci<=?
  (lambda (|c1_0k0SYufmK| |c2_0kmOWXfmK|)
    ((lambda (|t_0kIKUogmK|)
       (if |t_0kIKUogmK|
         |t_0kIKUogmK|
         (char-ci=? |c1_0k0SYufmK| |c2_0kmOWXfmK|)))
     (char-ci<? |c1_0k0SYufmK| |c2_0kmOWXfmK|))))
(define char-alphabetic?
  (lambda (|c_0k2HSRgmK|)
    (if (char-ci>=? |c_0k2HSRgmK| '#\a)
      (char-ci<=? |c_0k2HSRgmK| '#\z)
      '#f)))
(define char-numeric?
  (lambda (|c_0koDQihmK|)
    (if (char-ci>=? |c_0koDQihmK| '#\0)
      (char-ci<=? |c_0koDQihmK| '#\9)
      '#f)))
(define char-whitespace?
  (lambda (|c_0kKzOLhmK|)
    (if (memv |c_0kKzOLhmK| '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (|c_0k4wMcimK|)
    (if (char-alphabetic? |c_0k4wMcimK|)
      (char<? |c_0k4wMcimK| '#\a)
      '#f)))
(define char-lower-case?
  (lambda (|c_0kqsKFimK|)
    (if (char-alphabetic? |c_0kqsKFimK|)
      (char>? |c_0kqsKFimK| '#\Z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
(letrec ((|string-map_0kMoI6jmK|
           (lambda (|strsrc_0ku6ynlmK|
                    |strdst_0kQ2wQlmK|
                    |proc_0ka_thmmK|
                    |n_0kwXrKmmK|
                    |l_0kSTpbnmK|)
             (if (< |n_0kwXrKmmK| |l_0kSTpbnmK|)
               (begin
                 (string-set!
                   |strdst_0kQ2wQlmK|
                   |n_0kwXrKmmK|
                   (|proc_0ka_thmmK|
                     (string-ref |strsrc_0ku6ynlmK| |n_0kwXrKmmK|)))
                 (|string-map_0kMoI6jmK|
                   |strsrc_0ku6ynlmK|
                   |strdst_0kQ2wQlmK|
                   |proc_0ka_thmmK|
                   (+ |n_0kwXrKmmK| '1)
                   |l_0kSTpbnmK|))
               |strdst_0kQ2wQlmK|))))
  (begin
    (set! string-downcase
      (lambda (|str_0k6lGzjmK|)
        ((lambda (|newstr_0kshE0kmK|)
           (|string-map_0kMoI6jmK|
             |str_0k6lGzjmK|
             |newstr_0kshE0kmK|
             char-downcase
             '0
             (string-length |str_0k6lGzjmK|)))
         (make-string (string-length |str_0k6lGzjmK|)))))
    (set! string-upcase
      (lambda (|str_0kOdCtkmK|)
        ((lambda (|newstr_0k8aAWkmK|)
           (|string-map_0kMoI6jmK|
             |str_0kOdCtkmK|
             |newstr_0k8aAWkmK|
             char-upcase
             '0
             (string-length |str_0kOdCtkmK|)))
         (make-string (string-length |str_0kOdCtkmK|)))))))
(define string=? equal?)
(define string<?
  (letrec ((|s<?_0kcQnEnmK|
             (lambda (|s1_0keFh_omK| |s2_0kABfspmK|)
               (if (null? |s1_0keFh_omK|)
                 (if (null? |s2_0kABfspmK|) '#f '#t)
                 (if (null? |s2_0kABfspmK|)
                   '#f
                   ((lambda (|c1_0kWxdVpmK| |c2_0kgubmqmK|)
                      (if (char<? |c1_0kWxdVpmK| |c2_0kgubmqmK|)
                        '#t
                        (if (char>? |c1_0kWxdVpmK| |c2_0kgubmqmK|)
                          '#f
                          (|s<?_0kcQnEnmK|
                            (cdr |s1_0keFh_omK|)
                            (cdr |s2_0kABfspmK|)))))
                    (car |s1_0keFh_omK|)
                    (car |s2_0kABfspmK|)))))))
    (lambda (|s1_0kyMl5omK| |s2_0kUIjyomK|)
      (|s<?_0kcQnEnmK|
        (string->list |s1_0kyMl5omK|)
        (string->list |s2_0kUIjyomK|)))))
(define string>?
  (letrec ((|s>?_0kCq9PqmK|
             (lambda (|s1_0kEf3asmK| |s2_0k-b1DsmK|)
               (if (null? |s2_0k-b1DsmK|)
                 (if (null? |s1_0kEf3asmK|) '#f '#t)
                 (if (null? |s1_0kEf3asmK|)
                   '#f
                   ((lambda (|c1_0kk8_3tmK| |c2_0kG4ZwtmK|)
                      (if (char>? |c1_0kk8_3tmK| |c2_0kG4ZwtmK|)
                        '#t
                        (if (char<? |c1_0kk8_3tmK| |c2_0kG4ZwtmK|)
                          '#f
                          (|s>?_0kCq9PqmK|
                            (cdr |s1_0kEf3asmK|)
                            (cdr |s2_0k-b1DsmK|)))))
                    (car |s1_0kEf3asmK|)
                    (car |s2_0k-b1DsmK|)))))))
    (lambda (|s1_0kYm7grmK| |s2_0kij5JrmK|)
      (|s>?_0kCq9PqmK|
        (string->list |s1_0kYm7grmK|)
        (string->list |s2_0kij5JrmK|)))))
(define string<=?
  (lambda (|s1_0k01XZtmK| |s2_0kmZUqumK|)
    ((lambda (|t_0kIVSTumK|)
       (if |t_0kIVSTumK|
         |t_0kIVSTumK|
         (string=? |s1_0k01XZtmK| |s2_0kmZUqumK|)))
     (string<? |s1_0k01XZtmK| |s2_0kmZUqumK|))))
(define string>=?
  (lambda (|s1_0k2SQkvmK| |s2_0koOONvmK|)
    ((lambda (|t_0kKKMewmK|)
       (if |t_0kKKMewmK|
         |t_0kKKMewmK|
         (string=? |s1_0k2SQkvmK| |s2_0koOONvmK|)))
     (string>? |s1_0k2SQkvmK| |s2_0koOONvmK|))))
(define string-ci=?
  (lambda (|s1_0k4HKHwmK| |s2_0kqDI8xmK|)
    (string=?
      (string-downcase |s1_0k4HKHwmK|)
      (string-downcase |s2_0kqDI8xmK|))))
(define string-ci<?
  (lambda (|s1_0kMzGBxmK| |s2_0k6wE2ymK|)
    (string<?
      (string-downcase |s1_0kMzGBxmK|)
      (string-downcase |s2_0k6wE2ymK|))))
(define string-ci>?
  (lambda (|s1_0kssCvymK| |s2_0kOoAYymK|)
    (string>?
      (string-downcase |s1_0kssCvymK|)
      (string-downcase |s2_0kOoAYymK|))))
(define string-ci>=?
  (lambda (|s1_0k8lypzmK| |s2_0kuhwSzmK|)
    (string>=?
      (string-downcase |s1_0k8lypzmK|)
      (string-downcase |s2_0kuhwSzmK|))))
(define string-ci<=?
  (lambda (|s1_0kQdujAmK| |s2_0kaasMAmK|)
    (string<=?
      (string-downcase |s1_0kQdujAmK|)
      (string-downcase |s2_0kaasMAmK|))))
(define substring
  (letrec ((|fill-string_0kw6qdBmK|
             (lambda (|sstr_0keQfuDmK|
                      |dstr_0kAMdXDmK|
                      |n_0kWIboEmK|
                      |s_0kgF9REmK|
                      |e_0kCB7iFmK|)
               (if (< |s_0kgF9REmK| |e_0kCB7iFmK|)
                 (begin
                   (string-set!
                     |dstr_0kAMdXDmK|
                     |n_0kWIboEmK|
                     (string-ref |sstr_0keQfuDmK| |s_0kgF9REmK|))
                   (|fill-string_0kw6qdBmK|
                     |sstr_0keQfuDmK|
                     |dstr_0kAMdXDmK|
                     (+ |n_0kWIboEmK| '1)
                     (+ |s_0kgF9REmK| '1)
                     |e_0kCB7iFmK|))
                 (void)))))
    (lambda (|str_0kS2oGBmK|
             |start_0kc_l7CmK|
             |end_0kyXjACmK|)
      ((lambda (|newstr_0kUTh1DmK|)
         (begin
           (|fill-string_0kw6qdBmK|
             |str_0kS2oGBmK|
             |newstr_0kUTh1DmK|
             '0
             |start_0kc_l7CmK|
             |end_0kyXjACmK|)
           |newstr_0kUTh1DmK|))
       (make-string
         (- |end_0kyXjACmK| |start_0kc_l7CmK|))))))
(define list-ref
  (lambda (|list_0kYx5LFmK| |n_0kiu3cGmK|)
    (if (zero? |n_0kiu3cGmK|)
      (car |list_0kYx5LFmK|)
      (list-ref
        (cdr |list_0kYx5LFmK|)
        (- |n_0kiu3cGmK| '1)))))
(define values
  (lambda |args_0kEq1FGmK|
    (call-with-current-continuation
      (lambda (|k_0k-m_5HmK|)
        (apply |k_0k-m_5HmK| |args_0kEq1FGmK|)))))
