(define for-each
  (lambda (|proc_Y5p2wdDQ-|
           |ls1_Y536yMCQ-|
           .
           |lists_Y5J9AjCQ-|)
    (if (null? |ls1_Y536yMCQ-|)
      '#!void
      (begin
        (set! |lists_Y5J9AjCQ-|
          (cons |ls1_Y536yMCQ-| |lists_Y5J9AjCQ-|))
        (apply |proc_Y5p2wdDQ-|
               (map-car |lists_Y5J9AjCQ-|))
        (apply for-each
               |proc_Y5p2wdDQ-|
               (map-cdr |lists_Y5J9AjCQ-|))))))
(define eof-object?
  (lambda (|x_Y5L-tGDQ-|)
    (eq? |x_Y5L-tGDQ-| '#!eof)))
(define not
  (lambda (|x_Y55Xr7EQ-|)
    (if |x_Y55Xr7EQ-| '#f '#t)))
(define newline
  (lambda |port_Y5rTpAEQ-|
    (apply display '#\newline |port_Y5rTpAEQ-|)))
(define reverse
  (letrec ((|iter_Y5NPn1FQ-|
             (lambda (|ls_Y5tIjXFQ-| |acc_Y5PEhoGQ-|)
               (if (null? |ls_Y5tIjXFQ-|)
                 |acc_Y5PEhoGQ-|
                 (|iter_Y5NPn1FQ-|
                   (cdr |ls_Y5tIjXFQ-|)
                   (cons (car |ls_Y5tIjXFQ-|) |acc_Y5PEhoGQ-|))))))
    (lambda (|ls_Y57MluFQ-|)
      (|iter_Y5NPn1FQ-| |ls_Y57MluFQ-| '()))))
(define reverse!
  (letrec ((|iter_Y59BfRGQ-|
             (lambda (|s_Y5RtbLHQ-| |r_Y5bq9cIQ-|)
               (if (null? |s_Y5RtbLHQ-|)
                 |r_Y5bq9cIQ-|
                 ((lambda (|d_Y5xm7FIQ-|)
                    (begin
                      (set-cdr! |s_Y5RtbLHQ-| |r_Y5bq9cIQ-|)
                      (|iter_Y59BfRGQ-| |d_Y5xm7FIQ-| |s_Y5RtbLHQ-|)))
                  (cdr |s_Y5RtbLHQ-|))))))
    (lambda (|s_Y5vxdiHQ-|)
      (|iter_Y59BfRGQ-| |s_Y5vxdiHQ-| '()))))
(define map-car
  (lambda (|ls_Y5Ti56JQ-|)
    (if (null? |ls_Y5Ti56JQ-|)
      '()
      (cons (caar |ls_Y5Ti56JQ-|)
            (map-car (cdr |ls_Y5Ti56JQ-|))))))
(define map-cdr
  (lambda (|ls_Y5df3zJQ-|)
    (if (null? |ls_Y5df3zJQ-|)
      '()
      (cons (cdar |ls_Y5df3zJQ-|)
            (map-cdr (cdr |ls_Y5df3zJQ-|))))))
(define map
  (letrec ((|map1_Y5zb10KQ-|
             (lambda (|proc_Y5hVSgMQ-|
                      |list_Y5DRQJMQ-|
                      |acc_Y5ZNOaNQ-|)
               (if (null? |list_Y5DRQJMQ-|)
                 (reverse |acc_Y5ZNOaNQ-|)
                 (|map1_Y5zb10KQ-|
                   |proc_Y5hVSgMQ-|
                   (cdr |list_Y5DRQJMQ-|)
                   (cons (|proc_Y5hVSgMQ-| (car |list_Y5DRQJMQ-|))
                         |acc_Y5ZNOaNQ-|)))))
           (|loop_Y5V7_sKQ-|
             (lambda (|proc_Y5jKMDNQ-|
                      |list1_Y5FGK4OQ-|
                      |lists_Y5_CIxOQ-|
                      |c_Y5lzG-OQ-|)
               (if (null? |list1_Y5FGK4OQ-|)
                 (reverse |c_Y5lzG-OQ-|)
                 (|loop_Y5V7_sKQ-|
                   |proc_Y5jKMDNQ-|
                   (cdr |list1_Y5FGK4OQ-|)
                   (map-cdr |lists_Y5_CIxOQ-|)
                   (cons (apply |proc_Y5jKMDNQ-|
                                (car |list1_Y5FGK4OQ-|)
                                (map-car |lists_Y5_CIxOQ-|))
                         |c_Y5lzG-OQ-|))))))
    (lambda (|proc_Y5XYUPLQ-|
             |list1_Y5B0XmLQ-|
             .
             |lists_Y5f4ZVKQ-|)
      (if (null? |lists_Y5f4ZVKQ-|)
        (|map1_Y5zb10KQ-|
          |proc_Y5XYUPLQ-|
          |list1_Y5B0XmLQ-|
          '())
        (|loop_Y5V7_sKQ-|
          |proc_Y5XYUPLQ-|
          |list1_Y5B0XmLQ-|
          |lists_Y5f4ZVKQ-|
          '())))))
(define compose2
  (lambda (|f_Y5HvErPQ-| |g_Y51sCUPQ-|)
    (lambda (|x_Y5noAlQQ-|)
      (|f_Y5HvErPQ-| (|g_Y51sCUPQ-| |x_Y5noAlQQ-|)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
(letrec ((|assn_Y5JkyOQQ-|
           (lambda (|n_Y5xx58XQ-| |obj_Y5Tt3BXQ-| |alist_Y5dq12YQ-|)
             (if (null? |alist_Y5dq12YQ-|)
               '#f
               (if (|n_Y5xx58XQ-|
                     (caar |alist_Y5dq12YQ-|)
                     |obj_Y5Tt3BXQ-|)
                 (car |alist_Y5dq12YQ-|)
                 (|assn_Y5JkyOQQ-|
                   |n_Y5xx58XQ-|
                   |obj_Y5Tt3BXQ-|
                   (cdr |alist_Y5dq12YQ-|))))))
         (|memn_Y53hwfRQ-|
           (lambda (|n_Y5zm_uYQ-| |obj_Y5ViZXYQ-| |list_Y5ffXoZQ-|)
             (if (null? |list_Y5ffXoZQ-|)
               '#f
               (if (|n_Y5zm_uYQ-|
                     (car |list_Y5ffXoZQ-|)
                     |obj_Y5ViZXYQ-|)
                 |list_Y5ffXoZQ-|
                 (|memn_Y53hwfRQ-|
                   |n_Y5zm_uYQ-|
                   |obj_Y5ViZXYQ-|
                   (cdr |list_Y5ffXoZQ-|)))))))
  (begin
    (set! assq
      (lambda (|obj_Y5pduIRQ-| |alist_Y5L9s9SQ-|)
        (|assn_Y5JkyOQQ-|
          eq?
          |obj_Y5pduIRQ-|
          |alist_Y5L9s9SQ-|)))
    (set! assv
      (lambda (|obj_Y556qCSQ-| |alist_Y5r2o3TQ-|)
        (|assn_Y5JkyOQQ-|
          eqv?
          |obj_Y556qCSQ-|
          |alist_Y5r2o3TQ-|)))
    (set! assoc
      (lambda (|obj_Y5N-lwTQ-| |alist_Y57XjZTQ-|)
        (|assn_Y5JkyOQQ-|
          equal?
          |obj_Y5N-lwTQ-|
          |alist_Y57XjZTQ-|)))
    (set! memq
      (lambda (|obj_Y5tThqUQ-| |list_Y5PPfTUQ-|)
        (|memn_Y53hwfRQ-|
          eq?
          |obj_Y5tThqUQ-|
          |list_Y5PPfTUQ-|)))
    (set! memv
      (lambda (|obj_Y59MdkVQ-| |list_Y5vIbNVQ-|)
        (|memn_Y53hwfRQ-|
          eqv?
          |obj_Y59MdkVQ-|
          |list_Y5vIbNVQ-|)))
    (set! member
      (lambda (|obj_Y5RE9eWQ-| |list_Y5bB7HWQ-|)
        (|memn_Y53hwfRQ-|
          equal?
          |obj_Y5RE9eWQ-|
          |list_Y5bB7HWQ-|)))))
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
  (lambda (|ls1_Y5BbVRZQ-| |ls2_Y5X7Ti-Q-|)
    (if (null? |ls1_Y5BbVRZQ-|)
      |ls2_Y5X7Ti-Q-|
      (cons (car |ls1_Y5BbVRZQ-|)
            (append2 (cdr |ls1_Y5BbVRZQ-|) |ls2_Y5X7Ti-Q-|)))))
(define append append2)
(define list->string
  (letrec ((|l2s_Y5h4RL-Q-|
             (lambda (|l_Y5ZYMF_Q-| |s_Y5jVK60R-| |n_Y5FRIz0R-|)
               (if (null? |l_Y5ZYMF_Q-|)
                 |s_Y5jVK60R-|
                 (begin
                   (string-set!
                     |s_Y5jVK60R-|
                     |n_Y5FRIz0R-|
                     (car |l_Y5ZYMF_Q-|))
                   (|l2s_Y5h4RL-Q-|
                     (cdr |l_Y5ZYMF_Q-|)
                     |s_Y5jVK60R-|
                     (+ |n_Y5FRIz0R-| '1)))))))
    (lambda (|l_Y5D0Pc_Q-|)
      (|l2s_Y5h4RL-Q-|
        |l_Y5D0Pc_Q-|
        (make-string (length |l_Y5D0Pc_Q-|))
        '0))))
(define string->list
  (letrec ((|s2l_Y5_NG01R-|
             (lambda (|s_Y5HGCW1R-| |h_Y51DAn2R-| |n_Y5nzyQ2R-|)
               (if (< |n_Y5nzyQ2R-| '0)
                 |h_Y51DAn2R-|
                 (|s2l_Y5_NG01R-|
                   |s_Y5HGCW1R-|
                   (cons (string-ref |s_Y5HGCW1R-| |n_Y5nzyQ2R-|)
                         |h_Y51DAn2R-|)
                   (- |n_Y5nzyQ2R-| '1))))))
    (lambda (|s_Y5lKEt1R-|)
      (|s2l_Y5_NG01R-|
        |s_Y5lKEt1R-|
        '()
        (- (string-length |s_Y5lKEt1R-|) '1)))))
(define list->vector
  (letrec ((|l2v_Y5Jvwh3R-|
             (lambda (|l_Y5posb4R-| |v_Y5LkqE4R-| |n_Y55ho55R-|)
               (if (null? |l_Y5posb4R-|)
                 |v_Y5LkqE4R-|
                 (begin
                   (vector-set!
                     |v_Y5LkqE4R-|
                     |n_Y55ho55R-|
                     (car |l_Y5posb4R-|))
                   (|l2v_Y5Jvwh3R-|
                     (cdr |l_Y5posb4R-|)
                     |v_Y5LkqE4R-|
                     (+ |n_Y55ho55R-| '1)))))))
    (lambda (|l_Y53suK3R-|)
      (if (proper-list? |l_Y53suK3R-|)
        (|l2v_Y5Jvwh3R-|
          |l_Y53suK3R-|
          (make-vector (length |l_Y53suK3R-|))
          '0)
        (error 'list->vector
               '"can only convert a proper list."
               |l_Y53suK3R-|)))))
(define vector
  (lambda |elems_Y5rdmy5R-|
    (list->vector |elems_Y5rdmy5R-|)))
(define string
  (lambda |elems_Y5N9k_5R-|
    (list->string |elems_Y5N9k_5R-|)))
(define detect-os
  (lambda ()
    ((lambda (|osn_Y576is6R-|)
       (if (> (string-length |osn_Y576is6R-|) '3)
         (if (equal? (substring |osn_Y576is6R-| '0 '3) '"mac")
           'macos
           (if (equal? (substring |osn_Y576is6R-| '0 '3) '"win")
             'ms-dos
             (if (equal? (substring |osn_Y576is6R-| '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring |osn_Y576is6R-| '0 '3) '"uni")
                 'unix
                 (if (equal? (substring |osn_Y576is6R-| '0 '3) '"lin")
                   'unix
                   (if (equal?
                         (substring |osn_Y576is6R-| '0 '4)
                         '"os/2")
                     'os2
                     (if (equal? (substring |osn_Y576is6R-| '0 '3) '"vax")
                       'vax
                       '#!void)))))))
         'unix))
     (string-downcase (getenv '"os.name")))))
(define current-url (_make-parameter '"file:."))
(define current-directory
  (lambda |rest_Y5t2gV6R-|
    (if (null? |rest_Y5t2gV6R-|)
      (normalize-url (current-url) '".")
      (current-url
        (normalize-url
          (current-url)
          ((lambda (|v_Y5P-dm7R-|)
             ((lambda (|l_Y59XbP7R-|)
                (if (eqv? (string-ref |v_Y5P-dm7R-| (- |l_Y59XbP7R-| '1))
                          '#\/)
                  |v_Y5P-dm7R-|
                  (string-append |v_Y5P-dm7R-| '"/")))
              (string-length |v_Y5P-dm7R-|)))
           (car |rest_Y5t2gV6R-|)))))))
(define file-handler (void))
(define add-file-handler (void))
((lambda (|*file-handlers*_Y5vT9g8R-|)
   (begin
     (set! add-file-handler
       (lambda (|extension_Y5RP7J8R-| |thunk_Y5bM5a9R-|)
         (if (not (assq |extension_Y5RP7J8R-|
                        |*file-handlers*_Y5vT9g8R-|))
           (set! |*file-handlers*_Y5vT9g8R-|
             (cons (cons |extension_Y5RP7J8R-| |thunk_Y5bM5a9R-|)
                   |*file-handlers*_Y5vT9g8R-|))
           '#!void)))
     (set! file-handler
       ((lambda (|_load_Y5xI3D9R-|)
          (lambda (|extension_Y5TE14aR-|)
            ((lambda (|t_Y5dB_waR-|)
               (if |t_Y5dB_waR-|
                 (cdr |t_Y5dB_waR-|)
                 |_load_Y5xI3D9R-|))
             (assq (string->symbol
                     (string-downcase |extension_Y5TE14aR-|))
                   |*file-handlers*_Y5vT9g8R-|))))
        load))))
 '())
(define make-io-proc
  (lambda (|proc_Y5zxZZaR-|)
    (lambda (|file_Y5fqVTbR-| . |rest_Y5VtXqbR-|)
      (apply |proc_Y5zxZZaR-|
             (normalize-url (current-url) |file_Y5fqVTbR-|)
             |rest_Y5VtXqbR-|))))
((lambda (|file-extension_Y5BmTkcR-|)
   (begin
     (set! open-input-file
       (make-io-proc open-input-file))
     (set! open-source-input-file
       (make-io-proc open-source-input-file))
     (set! open-output-file
       (make-io-proc open-output-file))
     (set! load
       (lambda (|file_Y5XiRNcR-|)
         (begin
           ((lambda (|previous-url_Y5hfPedR-|)
              (begin
                (current-url
                  (normalize-url
                    |previous-url_Y5hfPedR-|
                    |file_Y5XiRNcR-|))
                (with-failure-continuation
                  (lambda (|m_Y5DbNHdR-| |e_Y5Z7L8eR-|)
                    (begin
                      (current-url |previous-url_Y5hfPedR-|)
                      (call-with-failure-continuation
                        (lambda (|fk_Y5j4JBeR-|)
                          (|fk_Y5j4JBeR-| |m_Y5DbNHdR-| |e_Y5Z7L8eR-|)))))
                  (lambda ()
                    ((lambda (|fe_Y5F0H2fR-|)
                       ((file-handler
                          (if |fe_Y5F0H2fR-| |fe_Y5F0H2fR-| '"scm"))
                        (current-url)))
                     (|file-extension_Y5BmTkcR-| (current-url)))))
                (current-url |previous-url_Y5hfPedR-|)))
            (current-url))
           (void))))))
 (lambda (|url_Y5_YEvfR-|)
   ((letrec ((|loop_Y5lVCYfR-|
               (lambda (|x_Y5HRApgR-| |acc_Y51OySgR-|)
                 (if (null? |x_Y5HRApgR-|)
                   '#f
                   (if (equal? (car |x_Y5HRApgR-|) '#\.)
                     (list->string |acc_Y51OySgR-|)
                     (|loop_Y5lVCYfR-|
                       (cdr |x_Y5HRApgR-|)
                       (cons (car |x_Y5HRApgR-|) |acc_Y51OySgR-|)))))))
      |loop_Y5lVCYfR-|)
    (reverse! (string->list |url_Y5_YEvfR-|))
    '())))
(define load-module
  (lambda (|str_Y5nKwjhR-|)
    ((lambda (|nl_Y5JGuMhR-|)
       ((lambda (|binding-names_Y53DsdiR-|)
          (for-each
            (lambda (|name_Y5pzqGiR-|)
              (putprop
                |name_Y5pzqGiR-|
                (native-library-binding
                  |nl_Y5JGuMhR-|
                  |name_Y5pzqGiR-|)))
            |binding-names_Y53DsdiR-|))
        (native-library-binding-names |nl_Y5JGuMhR-|)))
     (load-native-library |str_Y5nKwjhR-|))))
(define append
  (letrec ((|real-append_Y5Lvo7jR-|
             (lambda (|ls1_Y5NkiukR-| . |lses_Y5rok1kR-|)
               (if (null? |lses_Y5rok1kR-|)
                 |ls1_Y5NkiukR-|
                 (if (null? |ls1_Y5NkiukR-|)
                   (apply |real-append_Y5Lvo7jR-| |lses_Y5rok1kR-|)
                   (apply |real-append_Y5Lvo7jR-|
                          (append2 |ls1_Y5NkiukR-| (car |lses_Y5rok1kR-|))
                          (cdr |lses_Y5rok1kR-|)))))))
    (lambda |lses_Y55smAjR-|
      (if (null? |lses_Y55smAjR-|)
        '()
        (if (null? (cdr |lses_Y55smAjR-|))
          (car |lses_Y55smAjR-|)
          (apply |real-append_Y5Lvo7jR-|
                 (car |lses_Y55smAjR-|)
                 (cdr |lses_Y55smAjR-|)))))))
(define proper-list?
  (lambda (|x_Y57hgXkR-|)
    ((letrec ((|lp_Y5tdeolR-|
                (lambda (|x_Y5P9cRlR-| |lag_Y596aimR-|)
                  (if (pair? |x_Y5P9cRlR-|)
                    ((lambda (|x_Y5v28LmR-|)
                       (if (pair? |x_Y5v28LmR-|)
                         ((lambda (|x_Y5R-5cnR-| |lag_Y5bX3FnR-|)
                            (if (not (eq? |x_Y5R-5cnR-| |lag_Y5bX3FnR-|))
                              (|lp_Y5tdeolR-| |x_Y5R-5cnR-| |lag_Y5bX3FnR-|)
                              '#f))
                          (cdr |x_Y5v28LmR-|)
                          (cdr |lag_Y596aimR-|))
                         (null? |x_Y5v28LmR-|)))
                     (cdr |x_Y5P9cRlR-|))
                    (null? |x_Y5P9cRlR-|)))))
       |lp_Y5tdeolR-|)
     |x_Y57hgXkR-|
     |x_Y57hgXkR-|)))
(define list? proper-list?)
(define expt
  (letrec ((|general-expt_Y5xT16oR-|
             (lambda (|base_Y5VEVVpR-| |exponent_Y5fBTmqR-|)
               (exp (* |exponent_Y5fBTmqR-| (log |base_Y5VEVVpR-|)))))
           (|integer-expt_Y5TP_yoR-|
             (lambda (|base_Y5BxRPqR-| |exponent_Y5XtPgrR-|)
               (if (negative? |exponent_Y5XtPgrR-|)
                 (/ (|integer-expt_Y5TP_yoR-|
                      |base_Y5BxRPqR-|
                      (abs |exponent_Y5XtPgrR-|)))
                 (if (if (exact? |base_Y5BxRPqR-|)
                       (= |base_Y5BxRPqR-| '2)
                       '#f)
                   (ashl '1 |exponent_Y5XtPgrR-|)
                   ((letrec ((|loop_Y5hqNJrR-|
                               (lambda (|rest_Y5DmLasR-|
                                        |result_Y5ZiJDsR-|
                                        |squaring_Y5jfH4tR-|)
                                 (if (zero? |rest_Y5DmLasR-|)
                                   |result_Y5ZiJDsR-|
                                   (|loop_Y5hqNJrR-|
                                     (quotient |rest_Y5DmLasR-| '2)
                                     (if (odd? |rest_Y5DmLasR-|)
                                       (* |result_Y5ZiJDsR-|
                                          |squaring_Y5jfH4tR-|)
                                       |result_Y5ZiJDsR-|)
                                     (* |squaring_Y5jfH4tR-|
                                        |squaring_Y5jfH4tR-|))))))
                      |loop_Y5hqNJrR-|)
                    |exponent_Y5XtPgrR-|
                    '1
                    |base_Y5BxRPqR-|))))))
    (lambda (|base_Y5dMZ_oR-| |exponent_Y5zIXspR-|)
      (if (zero? |exponent_Y5zIXspR-|)
        (if (exact? |exponent_Y5zIXspR-|) '1 '1.0)
        (if (zero? |base_Y5dMZ_oR-|)
          (if (exact? |exponent_Y5zIXspR-|)
            |base_Y5dMZ_oR-|
            '0.0)
          (if (if (exact? |exponent_Y5zIXspR-|)
                (integer? |exponent_Y5zIXspR-|)
                '#f)
            (|integer-expt_Y5TP_yoR-|
              |base_Y5dMZ_oR-|
              |exponent_Y5zIXspR-|)
            (|general-expt_Y5xT16oR-|
              |base_Y5dMZ_oR-|
              |exponent_Y5zIXspR-|)))))))
(define modpow
  (lambda (|x_Y5FbFxtR-| |y_Y5_7D-tR-| |n_Y5l4BruR-|)
    (if (= |y_Y5_7D-tR-| '1)
      (modulo |x_Y5FbFxtR-| |n_Y5l4BruR-|)
      (if (even? |y_Y5_7D-tR-|)
        ((lambda (|tmp_Y5nVuOvR-|)
           (modulo
             (* |tmp_Y5nVuOvR-| |tmp_Y5nVuOvR-|)
             |n_Y5l4BruR-|))
         (modpow
           |x_Y5FbFxtR-|
           (/ |y_Y5_7D-tR-| '2)
           |n_Y5l4BruR-|))
        ((lambda (|tmp_Y51ZwlvR-|)
           (begin
             (set! |tmp_Y51ZwlvR-|
               (modulo
                 (* |tmp_Y51ZwlvR-| |tmp_Y51ZwlvR-|)
                 |n_Y5l4BruR-|))
             (modulo
               (* |x_Y5FbFxtR-| |tmp_Y51ZwlvR-|)
               |n_Y5l4BruR-|)))
         (modpow
           |x_Y5FbFxtR-|
           (/ (- |y_Y5_7D-tR-| '1) '2)
           |n_Y5l4BruR-|))))))
(define integer?
  ((lambda (|oldint?_Y5JRsfwR-|)
     (lambda (|n_Y53OqIwR-|)
       ((lambda (|t_Y5pKo9xR-|)
          (if |t_Y5pKo9xR-|
            |t_Y5pKo9xR-|
            (if (real? |n_Y53OqIwR-|)
              (= (round |n_Y53OqIwR-|) |n_Y53OqIwR-|)
              '#f)))
        (|oldint?_Y5JRsfwR-| |n_Y53OqIwR-|))))
   integer?))
(define real?
  ((lambda (|oldcomp?_Y5LGmCxR-|)
     (lambda (|n_Y55Dk3yR-|)
       (if (number? |n_Y55Dk3yR-|)
         (not (|oldcomp?_Y5LGmCxR-| |n_Y55Dk3yR-|))
         '#f)))
   complex?))
(define rational? real?)
(define complex? number?)
(define abs
  (lambda (|num_Y5rziwyR-|)
    (if (not (real? |num_Y5rziwyR-|))
      ((lambda (|a_Y5NvgZyR-| |b_Y57seqzR-|)
         (sqrt (+ (* |a_Y5NvgZyR-| |a_Y5NvgZyR-|)
                  (* |b_Y57seqzR-| |b_Y57seqzR-|))))
       (real-part |num_Y5rziwyR-|)
       (imag-part |num_Y5rziwyR-|))
      (if (< |num_Y5rziwyR-| '0)
        (- |num_Y5rziwyR-|)
        |num_Y5rziwyR-|))))
(define min (void))
(define max (void))
(letrec ((|_min_max_Y5tocTzR-|
           (lambda (|proc_Y5b628CR-|
                    |mv_Y5x20BCR-|
                    |args_Y5T-Z1DR-|
                    |inexact_Y5dXXuDR-|)
             (if (null? |args_Y5T-Z1DR-|)
               (if (if |inexact_Y5dXXuDR-|
                     (exact? |mv_Y5x20BCR-|)
                     '#f)
                 (exact->inexact |mv_Y5x20BCR-|)
                 |mv_Y5x20BCR-|)
               (if (|proc_Y5b628CR-|
                     (car |args_Y5T-Z1DR-|)
                     |mv_Y5x20BCR-|)
                 (|_min_max_Y5tocTzR-|
                   |proc_Y5b628CR-|
                   (car |args_Y5T-Z1DR-|)
                   (cdr |args_Y5T-Z1DR-|)
                   (if |inexact_Y5dXXuDR-|
                     |inexact_Y5dXXuDR-|
                     (inexact? (car |args_Y5T-Z1DR-|))))
                 (|_min_max_Y5tocTzR-|
                   |proc_Y5b628CR-|
                   |mv_Y5x20BCR-|
                   (cdr |args_Y5T-Z1DR-|)
                   |inexact_Y5dXXuDR-|))))))
  (begin
    (set! min
      (lambda (|x1_Y59h8NAR-| . |args_Y5PkakAR-|)
        (if (null? |args_Y5PkakAR-|)
          |x1_Y59h8NAR-|
          (|_min_max_Y5tocTzR-|
            <
            |x1_Y59h8NAR-|
            |args_Y5PkakAR-|
            (inexact? |x1_Y59h8NAR-|)))))
    (set! max
      (lambda (|x1_Y5R94HBR-| . |args_Y5vd6eBR-|)
        (if (null? |args_Y5vd6eBR-|)
          |x1_Y5R94HBR-|
          (|_min_max_Y5tocTzR-|
            >
            |x1_Y5R94HBR-|
            |args_Y5vd6eBR-|
            (inexact? |x1_Y5R94HBR-|)))))))
(define negative?
  (lambda (|n_Y5VPToER-|) (< |n_Y5VPToER-| '0)))
(define positive?
  (lambda (|n_Y5fMRRER-|) (> |n_Y5fMRRER-| '0)))
(define even?
  (lambda (|n_Y5BIPiFR-|)
    (= '0 (modulo |n_Y5BIPiFR-| '2))))
(define odd?
  (lambda (|n_Y5XENLFR-|)
    (not (even? |n_Y5XENLFR-|))))
(define zero?
  (lambda (|n_Y5hBLcGR-|) (= |n_Y5hBLcGR-| '0)))
(define add1
  (lambda (|n_Y5DxJFGR-|) (+ |n_Y5DxJFGR-| '1)))
(define sub1
  (lambda (|n_Y5ZtH6HR-|) (- |n_Y5ZtH6HR-| '1)))
(define >= (void))
(define <= (void))
((lambda (|_comp_help_Y5jqFzHR-| |_and2_Y5FmD0IR-|)
   (begin
     (set! <=
       (|_comp_help_Y5jqFzHR-|
         (lambda (|a_Y5_iBtIR-| |b_Y5lfzWIR-|)
           ((lambda (|t_Y5HbxnJR-|)
              (if |t_Y5HbxnJR-|
                |t_Y5HbxnJR-|
                (= |a_Y5_iBtIR-| |b_Y5lfzWIR-|)))
            (< |a_Y5_iBtIR-| |b_Y5lfzWIR-|)))
         |_and2_Y5FmD0IR-|
         '#t))
     (set! >=
       (|_comp_help_Y5jqFzHR-|
         (lambda (|a_Y518vQJR-| |b_Y5n4thKR-|)
           ((lambda (|t_Y5J0rKKR-|)
              (if |t_Y5J0rKKR-|
                |t_Y5J0rKKR-|
                (= |a_Y518vQJR-| |b_Y5n4thKR-|)))
            (> |a_Y518vQJR-| |b_Y5n4thKR-|)))
         |_and2_Y5FmD0IR-|
         '#t))))
 (lambda (|comparator_Y53ZobLR-|
          |chainer_Y5pVmELR-|
          |endstate_Y5LRk5MR-|)
   (lambda |args_Y55OiyMR-|
     ((letrec ((|loop_Y5rKg_MR-|
                 (lambda (|x_Y5NGesNR-|)
                   (if (null? |x_Y5NGesNR-|)
                     |endstate_Y5LRk5MR-|
                     (if (null? (cdr |x_Y5NGesNR-|))
                       |endstate_Y5LRk5MR-|
                       (|chainer_Y5pVmELR-|
                         (|comparator_Y53ZobLR-|
                           (car |x_Y5NGesNR-|)
                           (cadr |x_Y5NGesNR-|))
                         (|loop_Y5rKg_MR-| (cdr |x_Y5NGesNR-|))))))))
        |loop_Y5rKg_MR-|)
      |args_Y55OiyMR-|)))
 (lambda (|x_Y57DcVNR-| |y_Y5tzamOR-|)
   (if |x_Y57DcVNR-| |y_Y5tzamOR-| '#f)))
((lambda (|_?=_Y5Pv8POR-|)
   (begin
     (set! >= (|_?=_Y5Pv8POR-| > >=))
     (set! <= (|_?=_Y5Pv8POR-| < <=))))
 (lambda (|comparator_Y59s6gPR-| |chainer_Y5vo4JPR-|)
   (lambda |args_Y5Rk2aQR-|
     ((lambda (|t_Y5bh0DQR-|)
        (if |t_Y5bh0DQR-|
          |t_Y5bh0DQR-|
          ((lambda (|t_Y5xd-3RR-|)
             (if |t_Y5xd-3RR-|
               |t_Y5xd-3RR-|
               (if ((lambda (|t_Y5T9YwRR-|)
                      (if |t_Y5T9YwRR-|
                        |t_Y5T9YwRR-|
                        (|comparator_Y59s6gPR-|
                          (car |args_Y5Rk2aQR-|)
                          (cadr |args_Y5Rk2aQR-|))))
                    (= (car |args_Y5Rk2aQR-|)
                       (cadr |args_Y5Rk2aQR-|)))
                 (apply |chainer_Y5vo4JPR-|
                        (cdr |args_Y5Rk2aQR-|))
                 '#f)))
           (null? (cdr |args_Y5Rk2aQR-|)))))
      (null? |args_Y5Rk2aQR-|)))))
(define gcd
  (lambda |args_Y5d6WZRR-|
    (if (null? |args_Y5d6WZRR-|)
      '0
      (if (null? (cdr |args_Y5d6WZRR-|))
        (car |args_Y5d6WZRR-|)
        (_gcd (car |args_Y5d6WZRR-|)
              (cadr |args_Y5d6WZRR-|))))))
(define lcm
  (lambda |args_Y5z2UqSR-|
    (if (null? |args_Y5z2UqSR-|)
      '1
      (if (null? (cdr |args_Y5z2UqSR-|))
        (car |args_Y5z2UqSR-|)
        (_lcm (car |args_Y5z2UqSR-|)
              (cadr |args_Y5z2UqSR-|))))))
(define modulo
  (lambda (|x_Y5V-RTSR-| |y_Y5fXPkTR-|)
    ((lambda (|r_Y5BTNNTR-|)
       (if (if (negative? |y_Y5fXPkTR-|)
             (positive? |r_Y5BTNNTR-|)
             (negative? |r_Y5BTNNTR-|))
         (+ |r_Y5BTNNTR-| |y_Y5fXPkTR-|)
         |r_Y5BTNNTR-|))
     (remainder |x_Y5V-RTSR-| |y_Y5fXPkTR-|))))
(define string-append
  (lambda |args_Y5XPLeUR-|
    (if (null? |args_Y5XPLeUR-|)
      '""
      (if (null? (cdr |args_Y5XPLeUR-|))
        (car |args_Y5XPLeUR-|)
        (apply string-append
               (_string-append
                 (car |args_Y5XPLeUR-|)
                 (cadr |args_Y5XPLeUR-|))
               (cddr |args_Y5XPLeUR-|))))))
(define char-downcase
  ((lambda (|a_Y5hMJHUR-|)
     ((lambda (|z_Y5DIH8VR-|)
        ((lambda (|lc-offset_Y5ZEFBVR-|)
           (lambda (|c_Y5jBD2WR-|)
             ((lambda (|cv_Y5FxBvWR-|)
                (if (if (>= |cv_Y5FxBvWR-| |a_Y5hMJHUR-|)
                      (<= |cv_Y5FxBvWR-| |z_Y5DIH8VR-|)
                      '#f)
                  (integer->char
                    (+ |cv_Y5FxBvWR-| |lc-offset_Y5ZEFBVR-|))
                  |c_Y5jBD2WR-|))
              (char->integer |c_Y5jBD2WR-|))))
         (- (char->integer '#\a) |a_Y5hMJHUR-|)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (|a_Y5_tzYWR-|)
     ((lambda (|z_Y5lqxpXR-|)
        ((lambda (|uc-offset_Y5HmvSXR-|)
           (lambda (|c_Y51jtjYR-|)
             ((lambda (|cv_Y5nfrMYR-|)
                (if (if (>= |cv_Y5nfrMYR-| |a_Y5_tzYWR-|)
                      (<= |cv_Y5nfrMYR-| |z_Y5lqxpXR-|)
                      '#f)
                  (integer->char
                    (- |cv_Y5nfrMYR-| |uc-offset_Y5HmvSXR-|))
                  |c_Y51jtjYR-|))
              (char->integer |c_Y51jtjYR-|))))
         (- |a_Y5_tzYWR-| (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (|c1_Y5JbpdZR-| |c2_Y538nGZR-|)
    (> (char->integer |c1_Y5JbpdZR-|)
       (char->integer |c2_Y538nGZR-|))))
(define char<?
  (lambda (|c1_Y5p4l7-R-| |c2_Y5L0jA-R-|)
    (< (char->integer |c1_Y5p4l7-R-|)
       (char->integer |c2_Y5L0jA-R-|))))
(define char=? eqv?)
(define char>=?
  (lambda (|c1_Y55Zg1_R-| |c2_Y5rVeu_R-|)
    ((lambda (|t_Y5NRcX_R-|)
       (if |t_Y5NRcX_R-|
         |t_Y5NRcX_R-|
         (char=? |c1_Y55Zg1_R-| |c2_Y5rVeu_R-|)))
     (char>? |c1_Y55Zg1_R-| |c2_Y5rVeu_R-|))))
(define char<=?
  (lambda (|c1_Y57Oao0S-| |c2_Y5tK8R0S-|)
    ((lambda (|t_Y5PG6i1S-|)
       (if |t_Y5PG6i1S-|
         |t_Y5PG6i1S-|
         (char=? |c1_Y57Oao0S-| |c2_Y5tK8R0S-|)))
     (char<? |c1_Y57Oao0S-| |c2_Y5tK8R0S-|))))
(define char-ci>?
  (lambda (|c1_Y59D4L1S-| |c2_Y5vz2c2S-|)
    (char>?
      (char-downcase |c1_Y59D4L1S-|)
      (char-downcase |c2_Y5vz2c2S-|))))
(define char-ci<?
  (lambda (|c1_Y5Rv0F2S-| |c2_Y5bs-53S-|)
    (char<?
      (char-downcase |c1_Y5Rv0F2S-|)
      (char-downcase |c2_Y5bs-53S-|))))
(define char-ci=?
  (lambda (|c1_Y5xoYy3S-| |c2_Y5TkW_3S-|)
    (char=?
      (char-downcase |c1_Y5xoYy3S-|)
      (char-downcase |c2_Y5TkW_3S-|))))
(define char-ci>=?
  (lambda (|c1_Y5dhUs4S-| |c2_Y5zdSV4S-|)
    ((lambda (|t_Y5V9Qm5S-|)
       (if |t_Y5V9Qm5S-|
         |t_Y5V9Qm5S-|
         (char-ci=? |c1_Y5dhUs4S-| |c2_Y5zdSV4S-|)))
     (char-ci>? |c1_Y5dhUs4S-| |c2_Y5zdSV4S-|))))
(define char-ci<=?
  (lambda (|c1_Y5f6OP5S-| |c2_Y5B2Mg6S-|)
    ((lambda (|t_Y5X-JJ6S-|)
       (if |t_Y5X-JJ6S-|
         |t_Y5X-JJ6S-|
         (char-ci=? |c1_Y5f6OP5S-| |c2_Y5B2Mg6S-|)))
     (char-ci<? |c1_Y5f6OP5S-| |c2_Y5B2Mg6S-|))))
(define char-alphabetic?
  (lambda (|c_Y5hXHa7S-|)
    (if (char-ci>=? |c_Y5hXHa7S-| '#\a)
      (char-ci<=? |c_Y5hXHa7S-| '#\z)
      '#f)))
(define char-numeric?
  (lambda (|c_Y5DTFD7S-|)
    (if (char-ci>=? |c_Y5DTFD7S-| '#\0)
      (char-ci<=? |c_Y5DTFD7S-| '#\9)
      '#f)))
(define char-whitespace?
  (lambda (|c_Y5ZPD48S-|)
    (if (memv |c_Y5ZPD48S-| '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (|c_Y5jMBx8S-|)
    (if (char-alphabetic? |c_Y5jMBx8S-|)
      (char<? |c_Y5jMBx8S-| '#\a)
      '#f)))
(define char-lower-case?
  (lambda (|c_Y5FIz-8S-|)
    (if (char-alphabetic? |c_Y5FIz-8S-|)
      (char>? |c_Y5FIz-8S-| '#\Z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
(letrec ((|string-map_Y5_Exr9S-|
           (lambda (|strsrc_Y5JmnIbS-|
                    |strdst_Y53jl9cS-|
                    |proc_Y5pfjCcS-|
                    |n_Y5Lbh3dS-|
                    |l_Y558fwdS-|)
             (if (< |n_Y5Lbh3dS-| |l_Y558fwdS-|)
               (begin
                 (string-set!
                   |strdst_Y53jl9cS-|
                   |n_Y5Lbh3dS-|
                   (|proc_Y5pfjCcS-|
                     (string-ref |strsrc_Y5JmnIbS-| |n_Y5Lbh3dS-|)))
                 (|string-map_Y5_Exr9S-|
                   |strsrc_Y5JmnIbS-|
                   |strdst_Y53jl9cS-|
                   |proc_Y5pfjCcS-|
                   (+ |n_Y5Lbh3dS-| '1)
                   |l_Y558fwdS-|))
               |strdst_Y53jl9cS-|))))
  (begin
    (set! string-downcase
      (lambda (|str_Y5lBvU9S-|)
        ((lambda (|newstr_Y5HxtlaS-|)
           (|string-map_Y5_Exr9S-|
             |str_Y5lBvU9S-|
             |newstr_Y5HxtlaS-|
             char-downcase
             '0
             (string-length |str_Y5lBvU9S-|)))
         (make-string (string-length |str_Y5lBvU9S-|)))))
    (set! string-upcase
      (lambda (|str_Y51urOaS-|)
        ((lambda (|newstr_Y5nqpfbS-|)
           (|string-map_Y5_Exr9S-|
             |str_Y51urOaS-|
             |newstr_Y5nqpfbS-|
             char-upcase
             '0
             (string-length |str_Y51urOaS-|)))
         (make-string (string-length |str_Y51urOaS-|)))))))
(define string=? equal?)
(define string<?
  (letrec ((|s<?_Y5r4dZdS-|
             (lambda (|s1_Y5tV6kfS-| |s2_Y5PR4NfS-|)
               (if (null? |s1_Y5tV6kfS-|)
                 (not (null? |s2_Y5PR4NfS-|))
                 (if (null? |s2_Y5PR4NfS-|)
                   '#f
                   ((lambda (|c1_Y59O2egS-| |c2_Y5vK0HgS-|)
                      (if (char<? |c1_Y59O2egS-| |c2_Y5vK0HgS-|)
                        '#t
                        (if (char>? |c1_Y59O2egS-| |c2_Y5vK0HgS-|)
                          '#f
                          (|s<?_Y5r4dZdS-|
                            (cdr |s1_Y5tV6kfS-|)
                            (cdr |s2_Y5PR4NfS-|)))))
                    (car |s1_Y5tV6kfS-|)
                    (car |s2_Y5PR4NfS-|)))))))
    (lambda (|s1_Y5N0bqeS-| |s2_Y57Z8TeS-|)
      (|s<?_Y5r4dZdS-|
        (string->list |s1_Y5N0bqeS-|)
        (string->list |s2_Y57Z8TeS-|)))))
(define string>?
  (letrec ((|s>?_Y5RG-7hS-|
             (lambda (|s1_Y5TvUuiS-| |s2_Y5dsSXiS-|)
               (if (null? |s2_Y5dsSXiS-|)
                 (not (null? |s1_Y5TvUuiS-|))
                 (if (null? |s1_Y5TvUuiS-|)
                   '#f
                   ((lambda (|c1_Y5zoQojS-| |c2_Y5VkORjS-|)
                      (if (char>? |c1_Y5zoQojS-| |c2_Y5VkORjS-|)
                        '#t
                        (if (char<? |c1_Y5zoQojS-| |c2_Y5VkORjS-|)
                          '#f
                          (|s>?_Y5RG-7hS-|
                            (cdr |s1_Y5TvUuiS-|)
                            (cdr |s2_Y5dsSXiS-|)))))
                    (car |s1_Y5TvUuiS-|)
                    (car |s2_Y5dsSXiS-|)))))))
    (lambda (|s1_Y5bDYAhS-| |s2_Y5xzW1iS-|)
      (|s>?_Y5RG-7hS-|
        (string->list |s1_Y5bDYAhS-|)
        (string->list |s2_Y5xzW1iS-|)))))
(define string<=?
  (lambda (|s1_Y5fhMikS-| |s2_Y5BdKLkS-|)
    ((lambda (|t_Y5X9IclS-|)
       (if |t_Y5X9IclS-|
         |t_Y5X9IclS-|
         (string=? |s1_Y5fhMikS-| |s2_Y5BdKLkS-|)))
     (string<? |s1_Y5fhMikS-| |s2_Y5BdKLkS-|))))
(define string>=?
  (lambda (|s1_Y5h6GFlS-| |s2_Y5D2E6mS-|)
    ((lambda (|t_Y5Z-BzmS-|)
       (if |t_Y5Z-BzmS-|
         |t_Y5Z-BzmS-|
         (string=? |s1_Y5h6GFlS-| |s2_Y5D2E6mS-|)))
     (string>? |s1_Y5h6GFlS-| |s2_Y5D2E6mS-|))))
(define string-ci=?
  (lambda (|s1_Y5jXz0nS-| |s2_Y5FTxtnS-|)
    (string=?
      (string-downcase |s1_Y5jXz0nS-|)
      (string-downcase |s2_Y5FTxtnS-|))))
(define string-ci<?
  (lambda (|s1_Y5_PvWnS-| |s2_Y5lMtnoS-|)
    (string<?
      (string-downcase |s1_Y5_PvWnS-|)
      (string-downcase |s2_Y5lMtnoS-|))))
(define string-ci>?
  (lambda (|s1_Y5HIrQoS-| |s2_Y51FphpS-|)
    (string>?
      (string-downcase |s1_Y5HIrQoS-|)
      (string-downcase |s2_Y51FphpS-|))))
(define string-ci>=?
  (lambda (|s1_Y5nBnKpS-| |s2_Y5JxlbqS-|)
    (string>=?
      (string-downcase |s1_Y5nBnKpS-|)
      (string-downcase |s2_Y5JxlbqS-|))))
(define string-ci<=?
  (lambda (|s1_Y53ujEqS-| |s2_Y5pqh5rS-|)
    (string<=?
      (string-downcase |s1_Y53ujEqS-|)
      (string-downcase |s2_Y5pqh5rS-|))))
(define substring
  (letrec ((|fill-string_Y5LmfyrS-|
             (lambda (|sstr_Y5t45PtS-|
                      |dstr_Y5P03guS-|
                      |n_Y59Z0JuS-|
                      |s_Y5vV-9vS-|
                      |e_Y5RRYCvS-|)
               (if (< |s_Y5vV-9vS-| |e_Y5RRYCvS-|)
                 (begin
                   (string-set!
                     |dstr_Y5P03guS-|
                     |n_Y59Z0JuS-|
                     (string-ref |sstr_Y5t45PtS-| |s_Y5vV-9vS-|))
                   (|fill-string_Y5LmfyrS-|
                     |sstr_Y5t45PtS-|
                     |dstr_Y5P03guS-|
                     (+ |n_Y59Z0JuS-| '1)
                     (+ |s_Y5vV-9vS-| '1)
                     |e_Y5RRYCvS-|))
                 '#!void))))
    (lambda (|str_Y55jd_rS-|
             |start_Y5rfbssS-|
             |end_Y5Nb9VsS-|)
      ((lambda (|newstr_Y5787mtS-|)
         (begin
           (|fill-string_Y5LmfyrS-|
             |str_Y55jd_rS-|
             |newstr_Y5787mtS-|
             '0
             |start_Y5rfbssS-|
             |end_Y5Nb9VsS-|)
           |newstr_Y5787mtS-|))
       (make-string
         (- |end_Y5Nb9VsS-| |start_Y5rfbssS-|))))))
(define list-ref
  (lambda (|list_Y5bOW3wS-| |n_Y5xKUwwS-|)
    (if (zero? |n_Y5xKUwwS-|)
      (car |list_Y5bOW3wS-|)
      (list-ref
        (cdr |list_Y5bOW3wS-|)
        (- |n_Y5xKUwwS-| '1)))))
(define values
  (lambda |args_Y5TGSZwS-|
    (call-with-current-continuation
      (lambda (|k_Y5dDQqxS-|)
        (apply |k_Y5dDQqxS-| |args_Y5TGSZwS-|)))))
