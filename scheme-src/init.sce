(define for-each
  (lambda (|proc_Lveb_L5hE| . |lists_LvUe1j5hE|)
    (if (null? |lists_LvUe1j5hE|)
      (error 'for-each
             '"invalid number of arguments to procedure for-each.")
      (if (null? (car |lists_LvUe1j5hE|))
        (void)
        (begin
          (apply |proc_Lveb_L5hE|
                 (map car |lists_LvUe1j5hE|))
          (apply for-each
                 (cons |proc_Lveb_L5hE|
                       (map cdr |lists_LvUe1j5hE|))))))))
(define eof-object?
  (lambda (|x_LvA7Zc6hE|)
    (eq? |x_LvA7Zc6hE| '#!eof)))
(define not
  (lambda (|x_LvW3XF6hE|)
    (if |x_LvW3XF6hE| '#f '#t)))
(define eqv? eq?)
(define newline
  (lambda |port_Lvg0V67hE|
    (apply display
           (cons '#\newline |port_Lvg0V67hE|))))
(define reverse
  (letrec ((|iter_LvCYSz7hE|
             (lambda (|ls_LviROt8hE| |acc_LvENMW8hE|)
               (if (null? |ls_LviROt8hE|)
                 |acc_LvENMW8hE|
                 (|iter_LvCYSz7hE|
                   (cdr |ls_LviROt8hE|)
                   (cons (car |ls_LviROt8hE|) |acc_LvENMW8hE|))))))
    (lambda (|ls_LvYUQ08hE|)
      (|iter_LvCYSz7hE| |ls_LvYUQ08hE| '()))))
(define map
  (letrec ((|map1_Lv-JKn9hE|
             (lambda (|proc_LvIrAEbhE|
                      |list_Lv2oy5chE|
                      |acc_LvokwychE|)
               (if (null? |list_Lv2oy5chE|)
                 (reverse |acc_LvokwychE|)
                 (|map1_Lv-JKn9hE|
                   |proc_LvIrAEbhE|
                   (cdr |list_Lv2oy5chE|)
                   (cons (|proc_LvIrAEbhE| (car |list_Lv2oy5chE|))
                         |acc_LvokwychE|)))))
           (|loop_LvkGIQ9hE|
             (lambda (|proc_LvKgu_chE|
                      |list1_Lv4dssdhE|
                      |lists_Lvq9qVdhE|
                      |c_LvM5omehE|)
               (if (null? |list1_Lv4dssdhE|)
                 (reverse |c_LvM5omehE|)
                 (|loop_LvkGIQ9hE|
                   |proc_LvKgu_chE|
                   (cdr |list1_Lv4dssdhE|)
                   (_maphelp1 |lists_Lvq9qVdhE| '())
                   (cons (apply |proc_LvKgu_chE|
                                (car |list1_Lv4dssdhE|)
                                (_maphelp2 |lists_Lvq9qVdhE| '()))
                         |c_LvM5omehE|))))))
    (lambda (|proc_LvmvCbbhE|
             |list1_Lv0zEKahE|
             .
             |lists_LvGCGhahE|)
      (if (null? |lists_LvGCGhahE|)
        (|map1_Lv-JKn9hE|
          |proc_LvmvCbbhE|
          |list1_Lv0zEKahE|
          '())
        (|loop_LvkGIQ9hE|
          |proc_LvmvCbbhE|
          |list1_Lv0zEKahE|
          |lists_LvGCGhahE|
          '())))))
(define compose
  (lambda |rest_Lv62mPehE|
    (if (null? |rest_Lv62mPehE|)
      (lambda (|x_LvuPdDghE|) |x_LvuPdDghE|)
      ((lambda (|f_Lvs-jgfhE| |g_LvOWhJfhE|)
         (lambda (|x_Lv8TfaghE|)
           (|f_Lvs-jgfhE| (|g_LvOWhJfhE| |x_Lv8TfaghE|))))
       (car |rest_Lv62mPehE|)
       (apply compose (cdr |rest_Lv62mPehE|))))))
(define compose2
  (lambda (|f_LvQLb4hhE| |g_LvaI9xhhE|)
    (lambda (|x_LvwE7-hhE|)
      (|f_LvQLb4hhE| (|g_LvaI9xhhE| |x_LvwE7-hhE|)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
(letrec ((|assn_LvSA5rihE|
           (lambda (|n_LvGNEMohE| |obj_Lv0KCdphE| |alist_LvmGAGphE|)
             (if (null? |alist_LvmGAGphE|)
               '#f
               (if (|n_LvGNEMohE|
                     (caar |alist_LvmGAGphE|)
                     |obj_Lv0KCdphE|)
                 (car |alist_LvmGAGphE|)
                 (|assn_LvSA5rihE|
                   |n_LvGNEMohE|
                   |obj_Lv0KCdphE|
                   (cdr |alist_LvmGAGphE|))))))
         (|memn_Lvcx3UihE|
           (lambda (|n_LvICy7qhE| |obj_Lv2zwAqhE| |list_Lvovu1rhE|)
             (if (null? |list_Lvovu1rhE|)
               '#f
               (if (|n_LvICy7qhE|
                     (car |list_Lvovu1rhE|)
                     |obj_Lv2zwAqhE|)
                 |list_Lvovu1rhE|
                 (|memn_Lvcx3UihE|
                   |n_LvICy7qhE|
                   |obj_Lv2zwAqhE|
                   (cdr |list_Lvovu1rhE|)))))))
  (begin
    (set! assq
      (lambda (|obj_Lvyt1ljhE| |alist_LvUp_NjhE|)
        (|assn_LvSA5rihE|
          eq?
          |obj_Lvyt1ljhE|
          |alist_LvUp_NjhE|)))
    (set! assv
      (lambda (|obj_LvemZekhE| |alist_LvAiXHkhE|)
        (|assn_LvSA5rihE|
          eqv?
          |obj_LvemZekhE|
          |alist_LvAiXHkhE|)))
    (set! assoc
      (lambda (|obj_LvWeV8lhE| |alist_LvgbTBlhE|)
        (|assn_LvSA5rihE|
          equal?
          |obj_LvWeV8lhE|
          |alist_LvgbTBlhE|)))
    (set! memq
      (lambda (|obj_LvC7R2mhE| |list_LvY3PvmhE|)
        (|memn_Lvcx3UihE|
          eq?
          |obj_LvC7R2mhE|
          |list_LvY3PvmhE|)))
    (set! memv
      (lambda (|obj_Lvi0NYmhE| |list_LvEYKpnhE|)
        (|memn_Lvcx3UihE|
          eqv?
          |obj_Lvi0NYmhE|
          |list_LvEYKpnhE|)))
    (set! member
      (lambda (|obj_Lv-UISnhE| |list_LvkRGjohE|)
        (|memn_Lvcx3UihE|
          equal?
          |obj_Lv-UISnhE|
          |list_LvkRGjohE|)))))
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
  (lambda (|ls1_LvKrsurhE| |ls2_Lv4oqXrhE|)
    (if (null? |ls1_LvKrsurhE|)
      |ls2_Lv4oqXrhE|
      (cons (car |ls1_LvKrsurhE|)
            (append2 (cdr |ls1_LvKrsurhE|) |ls2_Lv4oqXrhE|)))))
(define append append2)
(define list->string
  (lambda (|l_LvqkooshE|)
    (letrec ((|l2s_LvMgmRshE|
               (lambda (|l_Lv6dkithE| |s_Lvs9iLthE| |n_LvO5gcuhE|)
                 (if (null? |l_Lv6dkithE|)
                   |s_Lvs9iLthE|
                   (begin
                     (string-set!
                       |s_Lvs9iLthE|
                       |n_LvO5gcuhE|
                       (car |l_Lv6dkithE|))
                     (|l2s_LvMgmRshE|
                       (cdr |l_Lv6dkithE|)
                       |s_Lvs9iLthE|
                       (+ |n_LvO5gcuhE| '1)))))))
      (|l2s_LvMgmRshE|
        |l_LvqkooshE|
        (make-string (length |l_LvqkooshE|))
        '0))))
(define string->list
  (letrec ((|s2l_Lv82eFuhE|
             (lambda (|s_LvQW9zvhE| |h_LvaT70whE| |n_LvwP5twhE|)
               (if (< |n_LvwP5twhE| '0)
                 |h_LvaT70whE|
                 (|s2l_Lv82eFuhE|
                   |s_LvQW9zvhE|
                   (cons (string-ref |s_LvQW9zvhE| |n_LvwP5twhE|)
                         |h_LvaT70whE|)
                   (- |n_LvwP5twhE| '1))))))
    (lambda (|s_Lvu-b6vhE|)
      (|s2l_Lv82eFuhE|
        |s_Lvu-b6vhE|
        '()
        (- (string-length |s_Lvu-b6vhE|) '1)))))
(define list->vector
  (letrec ((|l2v_LvSL3WwhE|
             (lambda (|l_LvyE_PxhE| |v_LvUAZgyhE| |n_LvexXJyhE|)
               (if (null? |l_LvyE_PxhE|)
                 |v_LvUAZgyhE|
                 (begin
                   (vector-set!
                     |v_LvUAZgyhE|
                     |n_LvexXJyhE|
                     (car |l_LvyE_PxhE|))
                   (|l2v_LvSL3WwhE|
                     (cdr |l_LvyE_PxhE|)
                     |v_LvUAZgyhE|
                     (+ |n_LvexXJyhE| '1)))))))
    (lambda (|l_LvcI1nxhE|)
      (if (proper-list? |l_LvcI1nxhE|)
        (|l2v_LvSL3WwhE|
          |l_LvcI1nxhE|
          (make-vector (length |l_LvcI1nxhE|))
          '0)
        (error 'list->vector
               '"can only convert a proper list."
               |l_LvcI1nxhE|)))))
(define vector
  (lambda |elems_LvAtVazhE|
    (list->vector |elems_LvAtVazhE|)))
(define string
  (lambda |elems_LvWpTDzhE|
    (list->string |elems_LvWpTDzhE|)))
(define detect-os
  (lambda ()
    ((lambda (|osn_LvgmR4AhE|)
       (if (> (string-length |osn_LvgmR4AhE|) '3)
         (if (equal? (substring |osn_LvgmR4AhE| '0 '3) '"mac")
           'macos
           (if (equal? (substring |osn_LvgmR4AhE| '0 '3) '"win")
             'ms-dos
             (if (equal? (substring |osn_LvgmR4AhE| '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring |osn_LvgmR4AhE| '0 '3) '"uni")
                 'unix
                 (if (equal? (substring |osn_LvgmR4AhE| '0 '3) '"lin")
                   'unix
                   (if (equal? (substring |osn_LvgmR4AhE| '0 '4) '"os/")
                     'os2
                     (if (equal? (substring |osn_LvgmR4AhE| '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase
       (getprop 'os.name '*environment-variables*)))))
(define current-url (make-parameter '"file:."))
(define current-directory
  (lambda |rest_LvCiPxAhE|
    (if (null? |rest_LvCiPxAhE|)
      (normalize-url (current-url) '".")
      (current-url
        (normalize-url
          (current-url)
          ((lambda (|v_LvYeN-AhE|)
             ((lambda (|l_LvibLrBhE|)
                (if (eq? (string-ref |v_LvYeN-AhE| (- |l_LvibLrBhE| '1))
                         '#\/)
                  |v_LvYeN-AhE|
                  (string-append |v_LvYeN-AhE| '"/")))
              (string-length |v_LvYeN-AhE|)))
           (car |rest_LvCiPxAhE|)))))))
(define load-expanded load)
((lambda (|_load_LvE7JUBhE|)
   ((lambda (|normalize_Lv-3HlChE|
             |file-handler_Lvk0FOChE|
             |file-extension_LvGYCfDhE|)
      (begin
        (set! open-input-file
          (|normalize_Lv-3HlChE| open-input-file))
        (set! open-source-input-file
          (|normalize_Lv-3HlChE| open-source-input-file))
        (set! open-output-file
          (|normalize_Lv-3HlChE| open-output-file))
        (set! load
          (lambda (|file_Lv0VAIDhE|)
            (begin
              ((lambda (|previous-url_LvmRy9EhE|)
                 (begin
                   (current-url
                     (normalize-url
                       |previous-url_LvmRy9EhE|
                       |file_Lv0VAIDhE|))
                   (with-failure-continuation
                     (lambda (|m_LvINwCEhE| |e_Lv2Ku3FhE|)
                       (begin
                         (current-url |previous-url_LvmRy9EhE|)
                         (call-with-failure-continuation
                           (lambda (|fk_LvoGswFhE|)
                             (|fk_LvoGswFhE| |m_LvINwCEhE| |e_Lv2Ku3FhE|)))))
                     (lambda ()
                       ((lambda (|fe_LvKCqZFhE|)
                          ((|file-handler_Lvk0FOChE|
                             (if |fe_LvKCqZFhE| |fe_LvKCqZFhE| '"scm"))
                           (current-url)))
                        (|file-extension_LvGYCfDhE| (current-url)))))
                   (current-url |previous-url_LvmRy9EhE|)))
               (current-url))
              (void))))))
    (lambda (|proc_Lv4zoqGhE|)
      (lambda (|file_LvMrkkHhE| . |rest_LvqvmTGhE|)
        (apply |proc_Lv4zoqGhE|
               (normalize-url (current-url) |file_LvMrkkHhE|)
               |rest_LvqvmTGhE|)))
    (lambda (|extension_Lv6oiNHhE|)
      ((lambda (|t_LvskgeIhE|)
         (if (memv |t_LvskgeIhE| '(sce pp))
           load-expanded
           (if (memv |t_LvskgeIhE| '(sll))
             (with-failure-continuation
               (lambda (|m_LvOgeHIhE| |e_Lv8dc8JhE|)
                 (lambda (|name_Lvu9aBJhE|)
                   (error 'load
                          '"shared libraries not supported in this build.")))
               (lambda ()
                 (eval '(lambda (name)
                          (import compiled-libraries)
                          (link-library (open-library name))))))
             |_load_LvE7JUBhE|)))
       (string->symbol
         (string-downcase |extension_Lv6oiNHhE|))))
    (lambda (|url_LvQ582KhE|)
      ((letrec ((|loop_Lva26vKhE|
                  (lambda (|x_Lvw-3YKhE| |acc_LvSW1pLhE|)
                    (if (null? |x_Lvw-3YKhE|)
                      '#f
                      (if (equal? (car |x_Lvw-3YKhE|) '#\.)
                        (list->string |acc_LvSW1pLhE|)
                        (|loop_Lva26vKhE|
                          (cdr |x_Lvw-3YKhE|)
                          (cons (car |x_Lvw-3YKhE|) |acc_LvSW1pLhE|)))))))
         |loop_Lva26vKhE|)
       (reverse (string->list |url_LvQ582KhE|))
       '()))))
 load)
(define load-module
  (lambda (|str_LvcT_RLhE|)
    ((lambda (|nl_LvyPZiMhE|)
       ((lambda (|binding-names_LvULXLMhE|)
          (for-each
            (lambda (|name_LveIVcNhE|)
              (putprop
                |name_LveIVcNhE|
                '*toplevel*
                (native-library-binding
                  |nl_LvyPZiMhE|
                  |name_LveIVcNhE|)))
            |binding-names_LvULXLMhE|))
        (native-library-binding-names |nl_LvyPZiMhE|)))
     (load-native-library |str_LvcT_RLhE|))))
(define append
  (letrec ((|real-append_LvAETFNhE|
             (lambda (|ls1_LvCtN0PhE| . |lses_LvgxPzOhE|)
               (if (null? |lses_LvgxPzOhE|)
                 |ls1_LvCtN0PhE|
                 (if (null? |ls1_LvCtN0PhE|)
                   (apply |real-append_LvAETFNhE| |lses_LvgxPzOhE|)
                   (apply |real-append_LvAETFNhE|
                          (cons (append2
                                  |ls1_LvCtN0PhE|
                                  (car |lses_LvgxPzOhE|))
                                (cdr |lses_LvgxPzOhE|))))))))
    (lambda |lses_LvWAR6OhE|
      (if (null? |lses_LvWAR6OhE|)
        '()
        (if (null? (cdr |lses_LvWAR6OhE|))
          (car |lses_LvWAR6OhE|)
          (apply |real-append_LvAETFNhE|
                 (cons (car |lses_LvWAR6OhE|)
                       (cdr |lses_LvWAR6OhE|))))))))
(define proper-list?
  (lambda (|x_LvYpLtPhE|)
    ((letrec ((|lp_LvimJWPhE|
                (lambda (|x_LvEiHnQhE| |lag_Lv-eFQQhE|)
                  (if (pair? |x_LvEiHnQhE|)
                    ((lambda (|x_LvkbDhRhE|)
                       (if (pair? |x_LvkbDhRhE|)
                         ((lambda (|x_LvG7BKRhE| |lag_Lv04zbShE|)
                            (if (eq? |x_LvG7BKRhE| |lag_Lv04zbShE|)
                              '#f
                              (|lp_LvimJWPhE| |x_LvG7BKRhE| |lag_Lv04zbShE|)))
                          (cdr |x_LvkbDhRhE|)
                          (cdr |lag_Lv-eFQQhE|))
                         (null? |x_LvkbDhRhE|)))
                     (cdr |x_LvEiHnQhE|))
                    (null? |x_LvEiHnQhE|)))))
       |lp_LvimJWPhE|)
     |x_LvYpLtPhE|
     |x_LvYpLtPhE|)))
(define list? proper-list?)
(define expt
  (letrec ((|general-expt_Lvm0xEShE|
             (lambda (|base_LvKNosUhE| |exponent_Lv4KmVUhE|)
               (exp (* |exponent_Lv4KmVUhE| (log |base_LvKNosUhE|)))))
           (|integer-expt_LvIYu5ThE|
             (lambda (|base_LvqGkmVhE| |exponent_LvMCiPVhE|)
               (if (negative? |exponent_LvMCiPVhE|)
                 (/ (|integer-expt_LvIYu5ThE|
                      |base_LvqGkmVhE|
                      (abs |exponent_LvMCiPVhE|)))
                 (if (if (exact? |base_LvqGkmVhE|)
                       (= |base_LvqGkmVhE| '2)
                       '#f)
                   (ashl '1 |exponent_LvMCiPVhE|)
                   ((letrec ((|loop_Lv6zggWhE|
                               (lambda (|rest_LvsveJWhE|
                                        |result_LvOrcaXhE|
                                        |squaring_Lv8oaDXhE|)
                                 (if (zero? |rest_LvsveJWhE|)
                                   |result_LvOrcaXhE|
                                   (|loop_Lv6zggWhE|
                                     (quotient |rest_LvsveJWhE| '2)
                                     (if (odd? |rest_LvsveJWhE|)
                                       (* |result_LvOrcaXhE|
                                          |squaring_Lv8oaDXhE|)
                                       |result_LvOrcaXhE|)
                                     (* |squaring_Lv8oaDXhE|
                                        |squaring_Lv8oaDXhE|))))))
                      |loop_Lv6zggWhE|)
                    |exponent_LvMCiPVhE|
                    '1
                    |base_LvqGkmVhE|))))))
    (lambda (|base_Lv2VsyThE| |exponent_LvoRq_ThE|)
      (if (zero? |exponent_LvoRq_ThE|)
        (if (exact? |exponent_LvoRq_ThE|) '1 '1.0)
        (if (zero? |base_Lv2VsyThE|)
          (if (exact? |exponent_LvoRq_ThE|)
            |base_Lv2VsyThE|
            '0.0)
          (if (if (exact? |exponent_LvoRq_ThE|)
                (integer? |exponent_LvoRq_ThE|)
                '#f)
            (|integer-expt_LvIYu5ThE|
              |base_Lv2VsyThE|
              |exponent_LvoRq_ThE|)
            (|general-expt_Lvm0xEShE|
              |base_Lv2VsyThE|
              |exponent_LvoRq_ThE|)))))))
(define modpow
  (lambda (|x_Lvuk84YhE| |y_LvQg6xYhE| |n_Lvad4-YhE|)
    (if (= |y_LvQg6xYhE| '1)
      (modulo |x_Lvuk84YhE| |n_Lvad4-YhE|)
      (if (even? |y_LvQg6xYhE|)
        ((lambda (|tmp_Lvc2-k-hE|)
           (modulo
             (* |tmp_Lvc2-k-hE| |tmp_Lvc2-k-hE|)
             |n_Lvad4-YhE|))
         (modpow
           |x_Lvuk84YhE|
           (/ |y_LvQg6xYhE| '2)
           |n_Lvad4-YhE|))
        ((lambda (|tmp_LvS50UZhE|)
           (begin
             (set! |tmp_LvS50UZhE|
               (modulo
                 (* |tmp_LvS50UZhE| |tmp_LvS50UZhE|)
                 |n_Lvad4-YhE|))
             (modulo
               (* |x_Lvuk84YhE| |tmp_LvS50UZhE|)
               |n_Lvad4-YhE|)))
         (modpow
           |x_Lvuk84YhE|
           (/ (- |y_LvQg6xYhE| '1) '2)
           |n_Lvad4-YhE|))))))
(define integer?
  ((lambda (|oldint?_Lvy-XN-hE|)
     (lambda (|n_LvUWVe_hE|)
       ((lambda (|t_LveTTH_hE|)
          (if |t_LveTTH_hE|
            |t_LveTTH_hE|
            (if (real? |n_LvUWVe_hE|)
              (= (round |n_LvUWVe_hE|) |n_LvUWVe_hE|)
              '#f)))
        (|oldint?_Lvy-XN-hE| |n_LvUWVe_hE|))))
   integer?))
(define real?
  ((lambda (|oldcomp?_LvAPR80iE|)
     (lambda (|n_LvWLPB0iE|)
       (if (number? |n_LvWLPB0iE|)
         (if (|oldcomp?_LvAPR80iE| |n_LvWLPB0iE|) '#f '#t)
         '#f)))
   complex?))
(define rational? real?)
(define complex? number?)
(define abs
  (lambda (|num_LvgIN21iE|)
    (if (real? |num_LvgIN21iE|)
      (if (< |num_LvgIN21iE| '0)
        (- |num_LvgIN21iE|)
        |num_LvgIN21iE|)
      ((lambda (|a_LvCELv1iE| |b_LvYAJY1iE|)
         (sqrt (+ (* |a_LvCELv1iE| |a_LvCELv1iE|)
                  (* |b_LvYAJY1iE| |b_LvYAJY1iE|))))
       (real-part |num_LvgIN21iE|)
       (imag-part |num_LvgIN21iE|)))))
(define min (void))
(define max (void))
(letrec ((|_min_max_LvixHp2iE|
           (lambda (|proc_Lv0fxG4iE|
                    |mv_Lvmbv75iE|
                    |args_LvI7tA5iE|
                    |inexact_Lv24r16iE|)
             (if (null? |args_LvI7tA5iE|)
               (if (if |inexact_Lv24r16iE|
                     (exact? |mv_Lvmbv75iE|)
                     '#f)
                 (exact->inexact |mv_Lvmbv75iE|)
                 |mv_Lvmbv75iE|)
               (if (|proc_Lv0fxG4iE|
                     (car |args_LvI7tA5iE|)
                     |mv_Lvmbv75iE|)
                 (|_min_max_LvixHp2iE|
                   |proc_Lv0fxG4iE|
                   (car |args_LvI7tA5iE|)
                   (cdr |args_LvI7tA5iE|)
                   ((lambda (|t_Lvo0pu6iE|)
                      (if |t_Lvo0pu6iE|
                        |t_Lvo0pu6iE|
                        (inexact? (car |args_LvI7tA5iE|))))
                    |inexact_Lv24r16iE|))
                 (|_min_max_LvixHp2iE|
                   |proc_Lv0fxG4iE|
                   |mv_Lvmbv75iE|
                   (cdr |args_LvI7tA5iE|)
                   |inexact_Lv24r16iE|))))))
  (begin
    (set! min
      (lambda (|x1_Lv-pDj3iE| . |args_LvEtFS2iE|)
        (if (null? |args_LvEtFS2iE|)
          |x1_Lv-pDj3iE|
          (|_min_max_LvixHp2iE|
            <
            |x1_Lv-pDj3iE|
            |args_LvEtFS2iE|
            (inexact? |x1_Lv-pDj3iE|)))))
    (set! max
      (lambda (|x1_LvGizd4iE| . |args_LvkmBM3iE|)
        (if (null? |args_LvkmBM3iE|)
          |x1_LvGizd4iE|
          (|_min_max_LvixHp2iE|
            >
            |x1_LvGizd4iE|
            |args_LvkmBM3iE|
            (inexact? |x1_LvGizd4iE|)))))))
(define negative?
  (lambda (|n_LvKYmX6iE|) (< |n_LvKYmX6iE| '0)))
(define positive?
  (lambda (|n_Lv4Vko7iE|) (> |n_Lv4Vko7iE| '0)))
(define even?
  (lambda (|n_LvqRiR7iE|)
    (= '0 (modulo |n_LvqRiR7iE| '2))))
(define odd?
  (lambda (|n_LvMNgi8iE|)
    (if (even? |n_LvMNgi8iE|) '#f '#t)))
(define zero?
  (lambda (|n_Lv6KeL8iE|) (= |n_Lv6KeL8iE| '0)))
(define add1
  (lambda (|n_LvsGcc9iE|) (+ |n_LvsGcc9iE| '1)))
(define sub1
  (lambda (|n_LvOCaF9iE|) (- |n_LvOCaF9iE| '1)))
(define >= (void))
(define <= (void))
((lambda (|_comp_help_Lv8z86aiE| |_and2_Lvuv6zaiE|)
   (begin
     (set! <=
       (|_comp_help_Lv8z86aiE|
         (lambda (|a_LvQr40biE| |b_Lvao2tbiE|)
           ((lambda (|t_Lvwk0WbiE|)
              (if |t_Lvwk0WbiE|
                |t_Lvwk0WbiE|
                (= |a_LvQr40biE| |b_Lvao2tbiE|)))
            (< |a_LvQr40biE| |b_Lvao2tbiE|)))
         |_and2_Lvuv6zaiE|
         '#t))
     (set! >=
       (|_comp_help_Lv8z86aiE|
         (lambda (|a_LvSg-mciE| |b_LvcdYPciE|)
           ((lambda (|t_Lvy9WgdiE|)
              (if |t_Lvy9WgdiE|
                |t_Lvy9WgdiE|
                (= |a_LvSg-mciE| |b_LvcdYPciE|)))
            (> |a_LvSg-mciE| |b_LvcdYPciE|)))
         |_and2_Lvuv6zaiE|
         '#t))))
 (lambda (|comparator_LvU5UJdiE|
          |chainer_Lve2SaeiE|
          |endstate_LvA-PDeiE|)
   (lambda |args_LvWWN4fiE|
     ((letrec ((|loop_LvgTLxfiE|
                 (lambda (|x_LvCPJ-fiE|)
                   (if (null? |x_LvCPJ-fiE|)
                     |endstate_LvA-PDeiE|
                     (if (null? (cdr |x_LvCPJ-fiE|))
                       |endstate_LvA-PDeiE|
                       (|chainer_Lve2SaeiE|
                         (|comparator_LvU5UJdiE|
                           (car |x_LvCPJ-fiE|)
                           (cadr |x_LvCPJ-fiE|))
                         (|loop_LvgTLxfiE| (cdr |x_LvCPJ-fiE|))))))))
        |loop_LvgTLxfiE|)
      |args_LvWWN4fiE|)))
 (lambda (|x_LvYLHrgiE| |y_LviIFUgiE|)
   (if |x_LvYLHrgiE| |y_LviIFUgiE| '#f)))
((lambda (|_?=_LvEEDlhiE|)
   (begin
     (set! >= (|_?=_LvEEDlhiE| > >=))
     (set! <= (|_?=_LvEEDlhiE| < <=))))
 (lambda (|comparator_Lv-ABOhiE| |chainer_LvkxzfiiE|)
   (lambda |args_LvGtxIiiE|
     ((lambda (|t_Lv0qv9jiE|)
        (if |t_Lv0qv9jiE|
          |t_Lv0qv9jiE|
          ((lambda (|t_LvmmtCjiE|)
             (if |t_LvmmtCjiE|
               |t_LvmmtCjiE|
               (if ((lambda (|t_LvIir3kiE|)
                      (if |t_LvIir3kiE|
                        |t_LvIir3kiE|
                        (|comparator_Lv-ABOhiE|
                          (car |args_LvGtxIiiE|)
                          (cadr |args_LvGtxIiiE|))))
                    (= (car |args_LvGtxIiiE|)
                       (cadr |args_LvGtxIiiE|)))
                 (apply |chainer_LvkxzfiiE|
                        (cdr |args_LvGtxIiiE|))
                 '#f)))
           (null? (cdr |args_LvGtxIiiE|)))))
      (null? |args_LvGtxIiiE|)))))
(define gcd
  (lambda |args_Lv2fpwkiE|
    (if (null? |args_Lv2fpwkiE|)
      '0
      (if (null? (cdr |args_Lv2fpwkiE|))
        (car |args_Lv2fpwkiE|)
        (_gcd (car |args_Lv2fpwkiE|)
              (cadr |args_Lv2fpwkiE|))))))
(define lcm
  (lambda |args_LvobnZkiE|
    (if (null? |args_LvobnZkiE|)
      '1
      (if (null? (cdr |args_LvobnZkiE|))
        (car |args_LvobnZkiE|)
        (_lcm (car |args_LvobnZkiE|)
              (cadr |args_LvobnZkiE|))))))
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
  (lambda (|x_LvK7lqliE| |y_Lv44jTliE|)
    ((lambda (|r_Lvq0hkmiE|)
       (if (if (negative? |y_Lv44jTliE|)
             (positive? |r_Lvq0hkmiE|)
             (negative? |r_Lvq0hkmiE|))
         (+ |r_Lvq0hkmiE| |y_Lv44jTliE|)
         |r_Lvq0hkmiE|))
     (remainder |x_LvK7lqliE| |y_Lv44jTliE|))))
(max-precision '32)
(define string-append
  (lambda |args_LvMYeNmiE|
    (if (null? |args_LvMYeNmiE|)
      '""
      (if (null? (cdr |args_LvMYeNmiE|))
        (car |args_LvMYeNmiE|)
        (apply string-append
               (_string-append
                 (car |args_LvMYeNmiE|)
                 (cadr |args_LvMYeNmiE|))
               (cddr |args_LvMYeNmiE|))))))
(define char-downcase
  ((lambda (|a_Lv6VceniE|)
     ((lambda (|z_LvsRaHniE|)
        ((lambda (|lc-offset_LvON88oiE|)
           (lambda (|c_Lv8K6BoiE|)
             ((lambda (|cv_LvuG42piE|)
                (if (if (>= |cv_LvuG42piE| |a_Lv6VceniE|)
                      (<= |cv_LvuG42piE| |z_LvsRaHniE|)
                      '#f)
                  (integer->char
                    (+ |cv_LvuG42piE| |lc-offset_LvON88oiE|))
                  |c_Lv8K6BoiE|))
              (char->integer |c_Lv8K6BoiE|))))
         (- (char->integer '#\a) |a_Lv6VceniE|)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (|a_LvQC2vpiE|)
     ((lambda (|z_Lvaz0YpiE|)
        ((lambda (|uc-offset_Lvwv-oqiE|)
           (lambda (|c_LvSrYRqiE|)
             ((lambda (|cv_LvcoWiriE|)
                (if (if (>= |cv_LvcoWiriE| |a_LvQC2vpiE|)
                      (<= |cv_LvcoWiriE| |z_Lvaz0YpiE|)
                      '#f)
                  (integer->char
                    (- |cv_LvcoWiriE| |uc-offset_Lvwv-oqiE|))
                  |c_LvSrYRqiE|))
              (char->integer |c_LvSrYRqiE|))))
         (- |a_LvQC2vpiE| (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (|c1_LvykULriE| |c2_LvUgScsiE|)
    (> (char->integer |c1_LvykULriE|)
       (char->integer |c2_LvUgScsiE|))))
(define char<?
  (lambda (|c1_LvedQFsiE| |c2_LvA9O6tiE|)
    (< (char->integer |c1_LvedQFsiE|)
       (char->integer |c2_LvA9O6tiE|))))
(define char=? eq?)
(define char>=?
  (lambda (|c1_LvW5MztiE| |c2_Lvg2K0uiE|)
    ((lambda (|t_LvC-HtuiE|)
       (if |t_LvC-HtuiE|
         |t_LvC-HtuiE|
         (char=? |c1_LvW5MztiE| |c2_Lvg2K0uiE|)))
     (char>? |c1_LvW5MztiE| |c2_Lvg2K0uiE|))))
(define char<=?
  (lambda (|c1_LvYWFWuiE| |c2_LviTDnviE|)
    ((lambda (|t_LvEPBQviE|)
       (if |t_LvEPBQviE|
         |t_LvEPBQviE|
         (char=? |c1_LvYWFWuiE| |c2_LviTDnviE|)))
     (char<? |c1_LvYWFWuiE| |c2_LviTDnviE|))))
(define char-ci>?
  (lambda (|c1_Lv-LzhwiE| |c2_LvkIxKwiE|)
    (char>?
      (char-downcase |c1_Lv-LzhwiE|)
      (char-downcase |c2_LvkIxKwiE|))))
(define char-ci<?
  (lambda (|c1_LvGEvbxiE| |c2_Lv0BtExiE|)
    (char<?
      (char-downcase |c1_LvGEvbxiE|)
      (char-downcase |c2_Lv0BtExiE|))))
(define char-ci=?
  (lambda (|c1_Lvmxr5yiE| |c2_LvItpyyiE|)
    (char=?
      (char-downcase |c1_Lvmxr5yiE|)
      (char-downcase |c2_LvItpyyiE|))))
(define char-ci>=?
  (lambda (|c1_Lv2qn_yiE| |c2_LvomlsziE|)
    ((lambda (|t_LvKijVziE|)
       (if |t_LvKijVziE|
         |t_LvKijVziE|
         (char-ci=? |c1_Lv2qn_yiE| |c2_LvomlsziE|)))
     (char-ci>? |c1_Lv2qn_yiE| |c2_LvomlsziE|))))
(define char-ci<=?
  (lambda (|c1_Lv4fhmAiE| |c2_LvqbfPAiE|)
    ((lambda (|t_LvM7dgBiE|)
       (if |t_LvM7dgBiE|
         |t_LvM7dgBiE|
         (char-ci=? |c1_Lv4fhmAiE| |c2_LvqbfPAiE|)))
     (char-ci<? |c1_Lv4fhmAiE| |c2_LvqbfPAiE|))))
(define char-alphabetic?
  (lambda (|c_Lv64bJBiE|)
    (if (char-ci>=? |c_Lv64bJBiE| '#\a)
      (char-ci<=? |c_Lv64bJBiE| '#\z)
      '#f)))
(define char-numeric?
  (lambda (|c_Lvs09aCiE|)
    (if (char-ci>=? |c_Lvs09aCiE| '#\0)
      (char-ci<=? |c_Lvs09aCiE| '#\9)
      '#f)))
(define char-whitespace?
  (lambda (|c_LvOY6DCiE|)
    (if (memq |c_LvOY6DCiE| '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (|c_Lv8V44DiE|)
    (if (char-alphabetic? |c_Lv8V44DiE|)
      (char<? |c_Lv8V44DiE| '#\a)
      '#f)))
(define char-lower-case?
  (lambda (|c_LvuR2xDiE|)
    (if (char-alphabetic? |c_LvuR2xDiE|)
      (char>? |c_LvuR2xDiE| '#\Z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
(letrec ((|string-map_LvQN0-DiE|
           (lambda (|strsrc_LvyvSeGiE|
                    |strdst_LvUrQHGiE|
                    |proc_LveoO8HiE|
                    |n_LvAkMBHiE|
                    |l_LvWgK2IiE|)
             (if (< |n_LvAkMBHiE| |l_LvWgK2IiE|)
               (begin
                 (string-set!
                   |strdst_LvUrQHGiE|
                   |n_LvAkMBHiE|
                   (|proc_LveoO8HiE|
                     (string-ref |strsrc_LvyvSeGiE| |n_LvAkMBHiE|)))
                 (|string-map_LvQN0-DiE|
                   |strsrc_LvyvSeGiE|
                   |strdst_LvUrQHGiE|
                   |proc_LveoO8HiE|
                   (+ |n_LvAkMBHiE| '1)
                   |l_LvWgK2IiE|))
               |strdst_LvUrQHGiE|))))
  (begin
    (set! string-downcase
      (lambda (|str_LvaK-qEiE|)
        ((lambda (|newstr_LvwGYTEiE|)
           (|string-map_LvQN0-DiE|
             |str_LvaK-qEiE|
             |newstr_LvwGYTEiE|
             char-downcase
             '0
             (string-length |str_LvaK-qEiE|)))
         (make-string (string-length |str_LvaK-qEiE|)))))
    (set! string-upcase
      (lambda (|str_LvSCWkFiE|)
        ((lambda (|newstr_LvczUNFiE|)
           (|string-map_LvQN0-DiE|
             |str_LvSCWkFiE|
             |newstr_LvczUNFiE|
             char-upcase
             '0
             (string-length |str_LvSCWkFiE|)))
         (make-string (string-length |str_LvSCWkFiE|)))))))
(define string=? equal?)
(define string<?
  (letrec ((|s<?_LvgdIvIiE|
             (lambda (|s1_Lvi2CSJiE| |s2_LvE-zjKiE|)
               (if (null? |s1_Lvi2CSJiE|)
                 (if (null? |s2_LvE-zjKiE|) '#f '#t)
                 (if (null? |s2_LvE-zjKiE|)
                   '#f
                   ((lambda (|c1_Lv-WxMKiE| |c2_LvkTvdLiE|)
                      (if (char<? |c1_Lv-WxMKiE| |c2_LvkTvdLiE|)
                        '#t
                        (if (char>? |c1_Lv-WxMKiE| |c2_LvkTvdLiE|)
                          '#f
                          (|s<?_LvgdIvIiE|
                            (cdr |s1_Lvi2CSJiE|)
                            (cdr |s2_LvE-zjKiE|)))))
                    (car |s1_Lvi2CSJiE|)
                    (car |s2_LvE-zjKiE|)))))))
    (lambda (|s1_LvC9GYIiE| |s2_LvY5EpJiE|)
      (|s<?_LvgdIvIiE|
        (string->list |s1_LvC9GYIiE|)
        (string->list |s2_LvY5EpJiE|)))))
(define string>?
  (letrec ((|s>?_LvGPtGLiE|
             (lambda (|s1_LvIEn1NiE| |s2_Lv2BluNiE|)
               (if (null? |s2_Lv2BluNiE|)
                 (if (null? |s1_LvIEn1NiE|) '#f '#t)
                 (if (null? |s1_LvIEn1NiE|)
                   '#f
                   ((lambda (|c1_LvoxjXNiE| |c2_LvKthoOiE|)
                      (if (char>? |c1_LvoxjXNiE| |c2_LvKthoOiE|)
                        '#t
                        (if (char<? |c1_LvoxjXNiE| |c2_LvKthoOiE|)
                          '#f
                          (|s>?_LvGPtGLiE|
                            (cdr |s1_LvIEn1NiE|)
                            (cdr |s2_Lv2BluNiE|)))))
                    (car |s1_LvIEn1NiE|)
                    (car |s2_Lv2BluNiE|)))))))
    (lambda (|s1_Lv0Mr7MiE| |s2_LvmIpAMiE|)
      (|s>?_LvGPtGLiE|
        (string->list |s1_Lv0Mr7MiE|)
        (string->list |s2_LvmIpAMiE|)))))
(define string<=?
  (lambda (|s1_Lv4qfROiE| |s2_LvqmdiPiE|)
    ((lambda (|t_LvMibLPiE|)
       (if |t_LvMibLPiE|
         |t_LvMibLPiE|
         (string=? |s1_Lv4qfROiE| |s2_LvqmdiPiE|)))
     (string<? |s1_Lv4qfROiE| |s2_LvqmdiPiE|))))
(define string>=?
  (lambda (|s1_Lv6f9cQiE| |s2_Lvsb7FQiE|)
    ((lambda (|t_LvO756RiE|)
       (if |t_LvO756RiE|
         |t_LvO756RiE|
         (string=? |s1_Lv6f9cQiE| |s2_Lvsb7FQiE|)))
     (string>? |s1_Lv6f9cQiE| |s2_Lvsb7FQiE|))))
(define string-ci=?
  (lambda (|s1_Lv843zRiE| |s2_Lvu010SiE|)
    (string=?
      (string-downcase |s1_Lv843zRiE|)
      (string-downcase |s2_Lvu010SiE|))))
(define string-ci<?
  (lambda (|s1_LvQY-sSiE| |s2_LvaVYVSiE|)
    (string<?
      (string-downcase |s1_LvQY-sSiE|)
      (string-downcase |s2_LvaVYVSiE|))))
(define string-ci>?
  (lambda (|s1_LvwRWmTiE| |s2_LvSNUPTiE|)
    (string>?
      (string-downcase |s1_LvwRWmTiE|)
      (string-downcase |s2_LvSNUPTiE|))))
(define string-ci>=?
  (lambda (|s1_LvcKSgUiE| |s2_LvyGQJUiE|)
    (string>=?
      (string-downcase |s1_LvcKSgUiE|)
      (string-downcase |s2_LvyGQJUiE|))))
(define string-ci<=?
  (lambda (|s1_LvUCOaViE| |s2_LvezMDViE|)
    (string<=?
      (string-downcase |s1_LvUCOaViE|)
      (string-downcase |s2_LvezMDViE|))))
(define substring
  (letrec ((|fill-string_LvAvK4WiE|
             (lambda (|sstr_LvidAlYiE|
                      |dstr_LvE9yOYiE|
                      |n_Lv-5wfZiE|
                      |s_Lvk2uIZiE|
                      |e_LvG-r9-iE|)
               (if (< |s_Lvk2uIZiE| |e_LvG-r9-iE|)
                 (begin
                   (string-set!
                     |dstr_LvE9yOYiE|
                     |n_Lv-5wfZiE|
                     (string-ref |sstr_LvidAlYiE| |s_Lvk2uIZiE|))
                   (|fill-string_LvAvK4WiE|
                     |sstr_LvidAlYiE|
                     |dstr_LvE9yOYiE|
                     (+ |n_Lv-5wfZiE| '1)
                     (+ |s_Lvk2uIZiE| '1)
                     |e_LvG-r9-iE|))
                 (void)))))
    (lambda (|str_LvWrIxWiE|
             |start_LvgoG-WiE|
             |end_LvCkErXiE|)
      ((lambda (|newstr_LvYgCUXiE|)
         (begin
           (|fill-string_LvAvK4WiE|
             |str_LvWrIxWiE|
             |newstr_LvYgCUXiE|
             '0
             |start_LvgoG-WiE|
             |end_LvCkErXiE|)
           |newstr_LvYgCUXiE|))
       (make-string
         (- |end_LvCkErXiE| |start_LvgoG-WiE|))))))
(define list-ref
  (lambda (|list_Lv0XpC-iE| |n_LvmTn3_iE|)
    (if (zero? |n_LvmTn3_iE|)
      (car |list_Lv0XpC-iE|)
      (list-ref
        (cdr |list_Lv0XpC-iE|)
        (- |n_LvmTn3_iE| '1)))))
(define values
  (lambda |args_LvIPlw_iE|
    (call-with-current-continuation
      (lambda (|k_Lv2MjZ_iE|)
        (apply |k_Lv2MjZ_iE| |args_LvIPlw_iE|)))))
