(define for-each
  (lambda (|proc_KOiEFMfUv|
           |ls1_KOYHHjfUv|
           .
           |lists_KOCLJSeUv|)
    (if (null? |ls1_KOYHHjfUv|)
      '#!void
      (begin
        (set! |lists_KOCLJSeUv|
          (cons |ls1_KOYHHjfUv| |lists_KOCLJSeUv|))
        (apply |proc_KOiEFMfUv|
               (map-car |lists_KOCLJSeUv|))
        (apply for-each
               |proc_KOiEFMfUv|
               (map-cdr |lists_KOCLJSeUv|))))))
(define eof-object?
  (lambda (|x_KOEADdgUv|)
    (eq? |x_KOEADdgUv| '#!eof)))
(define not
  (lambda (|x_KO-wBGgUv|)
    (if |x_KO-wBGgUv| '#f '#t)))
(define newline
  (lambda |port_KOktz7hUv|
    (apply display '#\newline |port_KOktz7hUv|)))
(define reverse
  (letrec ((|iter_KOGpxAhUv|
             (lambda (|ls_KOmituiUv| |acc_KOIerXiUv|)
               (if (null? |ls_KOmituiUv|)
                 |acc_KOIerXiUv|
                 (|iter_KOGpxAhUv|
                   (cdr |ls_KOmituiUv|)
                   (cons (car |ls_KOmituiUv|) |acc_KOIerXiUv|))))))
    (lambda (|ls_KO0mv1iUv|)
      (|iter_KOGpxAhUv| |ls_KO0mv1iUv| '()))))
(define map-car
  (lambda (|ls_KO2bpojUv|)
    (if (null? |ls_KO2bpojUv|)
      '()
      (cons (caar |ls_KO2bpojUv|)
            (map-car (cdr |ls_KO2bpojUv|))))))
(define map-cdr
  (lambda (|ls_KOo7nRjUv|)
    (if (null? |ls_KOo7nRjUv|)
      '()
      (cons (cdar |ls_KOo7nRjUv|)
            (map-cdr (cdr |ls_KOo7nRjUv|))))))
(define map
  (letrec ((|map1_KOK3likUv|
             (lambda (|proc_KOsNazmUv|
                      |list_KOOJ80nUv|
                      |acc_KO8G6tnUv|)
               (if (null? |list_KOOJ80nUv|)
                 (reverse |acc_KO8G6tnUv|)
                 (|map1_KOK3likUv|
                   |proc_KOsNazmUv|
                   (cdr |list_KOOJ80nUv|)
                   (cons (|proc_KOsNazmUv| (car |list_KOOJ80nUv|))
                         |acc_KO8G6tnUv|)))))
           (|loop_KO40jLkUv|
             (lambda (|proc_KOuC4WnUv|
                      |list1_KOQy2noUv|
                      |lists_KOav0QoUv|
                      |c_KOwr-gpUv|)
               (if (null? |list1_KOQy2noUv|)
                 (reverse |c_KOwr-gpUv|)
                 (|loop_KO40jLkUv|
                   |proc_KOuC4WnUv|
                   (cdr |list1_KOQy2noUv|)
                   (map-cdr |lists_KOav0QoUv|)
                   (cons (apply |proc_KOuC4WnUv|
                                (car |list1_KOQy2noUv|)
                                (map-car |lists_KOav0QoUv|))
                         |c_KOwr-gpUv|))))))
    (lambda (|proc_KO6Rc6mUv|
             |list1_KOMUeFlUv|
             .
             |lists_KOqYgclUv|)
      (if (null? |lists_KOqYgclUv|)
        (|map1_KOK3likUv|
          |proc_KO6Rc6mUv|
          |list1_KOMUeFlUv|
          '())
        (|loop_KO40jLkUv|
          |proc_KO6Rc6mUv|
          |list1_KOMUeFlUv|
          |lists_KOqYgclUv|
          '())))))
(define compose2
  (lambda (|f_KOSnYJpUv| |g_KOckWaqUv|)
    (lambda (|x_KOygUDqUv|)
      (|f_KOSnYJpUv| (|g_KOckWaqUv| |x_KOygUDqUv|)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
(letrec ((|assn_KOUcS4rUv|
           (lambda (|n_KOIppqxUv| |obj_KO2mnTxUv| |alist_KOoilkyUv|)
             (if (null? |alist_KOoilkyUv|)
               '#f
               (if (|n_KOIppqxUv|
                     (caar |alist_KOoilkyUv|)
                     |obj_KO2mnTxUv|)
                 (car |alist_KOoilkyUv|)
                 (|assn_KOUcS4rUv|
                   |n_KOIppqxUv|
                   |obj_KO2mnTxUv|
                   (cdr |alist_KOoilkyUv|))))))
         (|memn_KOe9QxrUv|
           (lambda (|n_KOKejNyUv| |obj_KO4bhezUv| |list_KOq7fHzUv|)
             (if (null? |list_KOq7fHzUv|)
               '#f
               (if (|n_KOKejNyUv|
                     (car |list_KOq7fHzUv|)
                     |obj_KO4bhezUv|)
                 |list_KOq7fHzUv|
                 (|memn_KOe9QxrUv|
                   |n_KOKejNyUv|
                   |obj_KO4bhezUv|
                   (cdr |list_KOq7fHzUv|)))))))
  (begin
    (set! assq
      (lambda (|obj_KOA5O-rUv| |alist_KOW1MrsUv|)
        (|assn_KOUcS4rUv|
          eq?
          |obj_KOA5O-rUv|
          |alist_KOW1MrsUv|)))
    (set! assv
      (lambda (|obj_KOg-JUsUv| |alist_KOCWHltUv|)
        (|assn_KOUcS4rUv|
          eqv?
          |obj_KOg-JUsUv|
          |alist_KOCWHltUv|)))
    (set! assoc
      (lambda (|obj_KOYSFOtUv| |alist_KOiPDfuUv|)
        (|assn_KOUcS4rUv|
          equal?
          |obj_KOYSFOtUv|
          |alist_KOiPDfuUv|)))
    (set! memq
      (lambda (|obj_KOELBIuUv| |list_KO-Hz9vUv|)
        (|memn_KOe9QxrUv|
          eq?
          |obj_KOELBIuUv|
          |list_KO-Hz9vUv|)))
    (set! memv
      (lambda (|obj_KOkExCvUv| |list_KOGAv3wUv|)
        (|memn_KOe9QxrUv|
          eqv?
          |obj_KOkExCvUv|
          |list_KOGAv3wUv|)))
    (set! member
      (lambda (|obj_KO0xtwwUv| |list_KOmtrZwUv|)
        (|memn_KOe9QxrUv|
          equal?
          |obj_KO0xtwwUv|
          |list_KOmtrZwUv|)))))
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
  (lambda (|ls1_KOM3d8AUv| |ls2_KO60bBAUv|)
    (if (null? |ls1_KOM3d8AUv|)
      |ls2_KO60bBAUv|
      (cons (car |ls1_KOM3d8AUv|)
            (append2 (cdr |ls1_KOM3d8AUv|) |ls2_KO60bBAUv|)))))
(define append append2)
(define list->string
  (letrec ((|l2s_KOsY82BUv|
             (lambda (|l_KO8R4YBUv| |s_KOuN2pCUv| |n_KOQJ0SCUv|)
               (if (null? |l_KO8R4YBUv|)
                 |s_KOuN2pCUv|
                 (begin
                   (string-set!
                     |s_KOuN2pCUv|
                     |n_KOQJ0SCUv|
                     (car |l_KO8R4YBUv|))
                   (|l2s_KOsY82BUv|
                     (cdr |l_KO8R4YBUv|)
                     |s_KOuN2pCUv|
                     (+ |n_KOQJ0SCUv| '1)))))))
    (lambda (|l_KOOU6vBUv|)
      (|l2s_KOsY82BUv|
        |l_KOOU6vBUv|
        (make-string (length |l_KOOU6vBUv|))
        '0))))
(define string->list
  (letrec ((|s2l_KOaG-iDUv|
             (lambda (|s_KOSyWcEUv| |h_KOcvUFEUv| |n_KOyrS6FUv|)
               (if (< |n_KOyrS6FUv| '0)
                 |h_KOcvUFEUv|
                 (|s2l_KOaG-iDUv|
                   |s_KOSyWcEUv|
                   (cons (string-ref |s_KOSyWcEUv| |n_KOyrS6FUv|)
                         |h_KOcvUFEUv|)
                   (- |n_KOyrS6FUv| '1))))))
    (lambda (|s_KOwCYLDUv|)
      (|s2l_KOaG-iDUv|
        |s_KOwCYLDUv|
        '()
        (- (string-length |s_KOwCYLDUv|) '1)))))
(define list->vector
  (letrec ((|l2v_KOUnQzFUv|
             (lambda (|l_KOAgMtGUv| |v_KOWcKWGUv| |n_KOg9InHUv|)
               (if (null? |l_KOAgMtGUv|)
                 |v_KOWcKWGUv|
                 (begin
                   (vector-set!
                     |v_KOWcKWGUv|
                     |n_KOg9InHUv|
                     (car |l_KOAgMtGUv|))
                   (|l2v_KOUnQzFUv|
                     (cdr |l_KOAgMtGUv|)
                     |v_KOWcKWGUv|
                     (+ |n_KOg9InHUv| '1)))))))
    (lambda (|l_KOekO0GUv|)
      (if (proper-list? |l_KOekO0GUv|)
        (|l2v_KOUnQzFUv|
          |l_KOekO0GUv|
          (make-vector (length |l_KOekO0GUv|))
          '0)
        (error 'list->vector
               '"can only convert a proper list."
               |l_KOekO0GUv|)))))
(define vector
  (lambda |elems_KOC5GQHUv|
    (list->vector |elems_KOC5GQHUv|)))
(define string
  (lambda |elems_KOY1EhIUv|
    (list->string |elems_KOY1EhIUv|)))
(define detect-os
  (lambda ()
    ((lambda (|osn_KOi-BKIUv|)
       (if (> (string-length |osn_KOi-BKIUv|) '3)
         (if (equal? (substring |osn_KOi-BKIUv| '0 '3) '"mac")
           'macos
           (if (equal? (substring |osn_KOi-BKIUv| '0 '3) '"win")
             'ms-dos
             (if (equal? (substring |osn_KOi-BKIUv| '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring |osn_KOi-BKIUv| '0 '3) '"uni")
                 'unix
                 (if (equal? (substring |osn_KOi-BKIUv| '0 '3) '"lin")
                   'unix
                   (if (equal?
                         (substring |osn_KOi-BKIUv| '0 '4)
                         '"os/2")
                     'os2
                     (if (equal? (substring |osn_KOi-BKIUv| '0 '3) '"vax")
                       'vax
                       '#!void)))))))
         'unix))
     (string-downcase (getenv '"os.name")))))
(define current-url (_make-parameter '"file:."))
(define current-directory
  (lambda |rest_KOEWzbJUv|
    (if (null? |rest_KOEWzbJUv|)
      (normalize-url (current-url) '".")
      (current-url
        (normalize-url
          (current-url)
          ((lambda (|v_KO-SxEJUv|)
             ((lambda (|l_KOkPv5KUv|)
                (if (eqv? (string-ref |v_KO-SxEJUv| (- |l_KOkPv5KUv| '1))
                          '#\/)
                  |v_KO-SxEJUv|
                  (string-append |v_KO-SxEJUv| '"/")))
              (string-length |v_KO-SxEJUv|)))
           (car |rest_KOEWzbJUv|)))))))
(define *file-handlers* '())
(define add-file-handler
  (lambda (|extension_KOGLtyKUv| |thunk_KO0Ir_KUv|)
    (if (not (assq |extension_KOGLtyKUv| *file-handlers*))
      (set! *file-handlers*
        (cons (cons |extension_KOGLtyKUv| |thunk_KO0Ir_KUv|)
              *file-handlers*))
      '#!void)))
(define file-handler
  ((lambda (|_load_KOmEpsLUv|)
     (lambda (|extension_KOIAnVLUv|)
       ((lambda (|t_KO2xlmMUv|)
          (if |t_KO2xlmMUv|
            (cdr |t_KO2xlmMUv|)
            |_load_KOmEpsLUv|))
        (assq (string->symbol
                (string-downcase |extension_KOIAnVLUv|))
              *file-handlers*))))
   load))
((lambda (|normalize_KOotjPMUv|
          |file-extension_KOKphgNUv|)
   (begin
     (set! open-input-file
       (|normalize_KOotjPMUv| open-input-file))
     (set! open-source-input-file
       (|normalize_KOotjPMUv| open-source-input-file))
     (set! open-output-file
       (|normalize_KOotjPMUv| open-output-file))
     (set! load
       (lambda (|file_KO4mfJNUv|)
         (begin
           ((lambda (|previous-url_KOqidaOUv|)
              (begin
                (current-url
                  (normalize-url
                    |previous-url_KOqidaOUv|
                    |file_KO4mfJNUv|))
                (with-failure-continuation
                  (lambda (|m_KOMebDOUv| |e_KO6b94PUv|)
                    (begin
                      (current-url |previous-url_KOqidaOUv|)
                      (call-with-failure-continuation
                        (lambda (|fk_KOs77xPUv|)
                          (|fk_KOs77xPUv| |m_KOMebDOUv| |e_KO6b94PUv|)))))
                  (lambda ()
                    ((lambda (|fe_KOO35-PUv|)
                       ((file-handler
                          (if |fe_KOO35-PUv| |fe_KOO35-PUv| '"scm"))
                        (current-url)))
                     (|file-extension_KOKphgNUv| (current-url)))))
                (current-url |previous-url_KOqidaOUv|)))
            (current-url))
           (void))))))
 (lambda (|proc_KO803rQUv|)
   (lambda (|file_KOQU-kRUv| . |rest_KOuY0UQUv|)
     (apply |proc_KO803rQUv|
            (normalize-url (current-url) |file_KOQU-kRUv|)
            |rest_KOuY0UQUv|)))
 (lambda (|url_KOaRYNRUv|)
   ((letrec ((|loop_KOwNWeSUv|
               (lambda (|x_KOSJUHSUv| |acc_KOcGS8TUv|)
                 (if (null? |x_KOSJUHSUv|)
                   '#f
                   (if (equal? (car |x_KOSJUHSUv|) '#\.)
                     (list->string |acc_KOcGS8TUv|)
                     (|loop_KOwNWeSUv|
                       (cdr |x_KOSJUHSUv|)
                       (cons (car |x_KOSJUHSUv|) |acc_KOcGS8TUv|)))))))
      |loop_KOwNWeSUv|)
    (reverse (string->list |url_KOaRYNRUv|))
    '())))
(define load-module
  (lambda (|str_KOyCQBTUv|)
    ((lambda (|nl_KOUyO2UUv|)
       ((lambda (|binding-names_KOevMvUUv|)
          (for-each
            (lambda (|name_KOArKYUUv|)
              (putprop
                |name_KOArKYUUv|
                '*toplevel*
                (native-library-binding
                  |nl_KOUyO2UUv|
                  |name_KOArKYUUv|)))
            |binding-names_KOevMvUUv|))
        (native-library-binding-names |nl_KOUyO2UUv|)))
     (load-native-library |str_KOyCQBTUv|))))
(define append
  (letrec ((|real-append_KOWnIpVUv|
             (lambda (|ls1_KOYcCMWUv| . |lses_KOCgEjWUv|)
               (if (null? |lses_KOCgEjWUv|)
                 |ls1_KOYcCMWUv|
                 (if (null? |ls1_KOYcCMWUv|)
                   (apply |real-append_KOWnIpVUv| |lses_KOCgEjWUv|)
                   (apply |real-append_KOWnIpVUv|
                          (append2 |ls1_KOYcCMWUv| (car |lses_KOCgEjWUv|))
                          (cdr |lses_KOCgEjWUv|)))))))
    (lambda |lses_KOgkGSVUv|
      (if (null? |lses_KOgkGSVUv|)
        '()
        (if (null? (cdr |lses_KOgkGSVUv|))
          (car |lses_KOgkGSVUv|)
          (apply |real-append_KOWnIpVUv|
                 (car |lses_KOgkGSVUv|)
                 (cdr |lses_KOgkGSVUv|)))))))
(define proper-list?
  (lambda (|x_KOi9AdXUv|)
    ((letrec ((|lp_KOE5yGXUv|
                (lambda (|x_KO-1w7YUv| |lag_KOk-tAYUv|)
                  (if (pair? |x_KO-1w7YUv|)
                    ((lambda (|x_KOGWr1ZUv|)
                       (if (pair? |x_KOGWr1ZUv|)
                         ((lambda (|x_KO0TpuZUv| |lag_KOmPnXZUv|)
                            (if (not (eq? |x_KO0TpuZUv| |lag_KOmPnXZUv|))
                              (|lp_KOE5yGXUv| |x_KO0TpuZUv| |lag_KOmPnXZUv|)
                              '#f))
                          (cdr |x_KOGWr1ZUv|)
                          (cdr |lag_KOk-tAYUv|))
                         (null? |x_KOGWr1ZUv|)))
                     (cdr |x_KO-1w7YUv|))
                    (null? |x_KO-1w7YUv|)))))
       |lp_KOE5yGXUv|)
     |x_KOi9AdXUv|
     |x_KOi9AdXUv|)))
(define list? proper-list?)
(define expt
  (letrec ((|general-expt_KOILlo-Uv|
             (lambda (|base_KO4xdc0Vv| |exponent_KOqtbF0Vv|)
               (exp (* |exponent_KOqtbF0Vv| (log |base_KO4xdc0Vv|)))))
           (|integer-expt_KO2IjR-Uv|
             (lambda (|base_KOMp961Vv| |exponent_KO6m7z1Vv|)
               (if (negative? |exponent_KO6m7z1Vv|)
                 (/ (|integer-expt_KO2IjR-Uv|
                      |base_KOMp961Vv|
                      (abs |exponent_KO6m7z1Vv|)))
                 (if (if (exact? |base_KOMp961Vv|)
                       (= |base_KOMp961Vv| '2)
                       '#f)
                   (ashl '1 |exponent_KO6m7z1Vv|)
                   ((letrec ((|loop_KOsi502Vv|
                               (lambda (|rest_KOOe3t2Vv|
                                        |result_KO8b1W2Vv|
                                        |squaring_KOu7_m3Vv|)
                                 (if (zero? |rest_KOOe3t2Vv|)
                                   |result_KO8b1W2Vv|
                                   (|loop_KOsi502Vv|
                                     (quotient |rest_KOOe3t2Vv| '2)
                                     (if (odd? |rest_KOOe3t2Vv|)
                                       (* |result_KO8b1W2Vv|
                                          |squaring_KOu7_m3Vv|)
                                       |result_KO8b1W2Vv|)
                                     (* |squaring_KOu7_m3Vv|
                                        |squaring_KOu7_m3Vv|))))))
                      |loop_KOsi502Vv|)
                    |exponent_KO6m7z1Vv|
                    '1
                    |base_KOMp961Vv|))))))
    (lambda (|base_KOoEhi_Uv| |exponent_KOKAfL_Uv|)
      (if (zero? |exponent_KOKAfL_Uv|)
        (if (exact? |exponent_KOKAfL_Uv|) '1 '1.0)
        (if (zero? |base_KOoEhi_Uv|)
          (if (exact? |exponent_KOKAfL_Uv|)
            |base_KOoEhi_Uv|
            '0.0)
          (if (if (exact? |exponent_KOKAfL_Uv|)
                (integer? |exponent_KOKAfL_Uv|)
                '#f)
            (|integer-expt_KO2IjR-Uv|
              |base_KOoEhi_Uv|
              |exponent_KOKAfL_Uv|)
            (|general-expt_KOILlo-Uv|
              |base_KOoEhi_Uv|
              |exponent_KOKAfL_Uv|)))))))
(define modpow
  (lambda (|x_KOQ3ZP3Vv| |y_KOa0Xg4Vv| |n_KOwYUJ4Vv|)
    (if (= |y_KOa0Xg4Vv| '1)
      (modulo |x_KOQ3ZP3Vv| |n_KOwYUJ4Vv|)
      (if (even? |y_KOa0Xg4Vv|)
        ((lambda (|tmp_KOyNO46Vv|)
           (modulo
             (* |tmp_KOyNO46Vv| |tmp_KOyNO46Vv|)
             |n_KOwYUJ4Vv|))
         (modpow
           |x_KOQ3ZP3Vv|
           (/ |y_KOa0Xg4Vv| '2)
           |n_KOwYUJ4Vv|))
        ((lambda (|tmp_KOcRQD5Vv|)
           (begin
             (set! |tmp_KOcRQD5Vv|
               (modulo
                 (* |tmp_KOcRQD5Vv| |tmp_KOcRQD5Vv|)
                 |n_KOwYUJ4Vv|))
             (modulo
               (* |x_KOQ3ZP3Vv| |tmp_KOcRQD5Vv|)
               |n_KOwYUJ4Vv|)))
         (modpow
           |x_KOQ3ZP3Vv|
           (/ (- |y_KOa0Xg4Vv| '1) '2)
           |n_KOwYUJ4Vv|))))))
(define integer?
  ((lambda (|oldint?_KOUJMx6Vv|)
     (lambda (|n_KOeGK-6Vv|)
       ((lambda (|t_KOACIr7Vv|)
          (if |t_KOACIr7Vv|
            |t_KOACIr7Vv|
            (if (real? |n_KOeGK-6Vv|)
              (= (round |n_KOeGK-6Vv|) |n_KOeGK-6Vv|)
              '#f)))
        (|oldint?_KOUJMx6Vv| |n_KOeGK-6Vv|))))
   integer?))
(define real?
  ((lambda (|oldcomp?_KOWyGU7Vv|)
     (lambda (|n_KOgvEl8Vv|)
       (if (number? |n_KOgvEl8Vv|)
         (not (|oldcomp?_KOWyGU7Vv| |n_KOgvEl8Vv|))
         '#f)))
   complex?))
(define rational? real?)
(define complex? number?)
(define abs
  (lambda (|num_KOCrCO8Vv|)
    (if (not (real? |num_KOCrCO8Vv|))
      ((lambda (|a_KOYnAf9Vv| |b_KOikyI9Vv|)
         (sqrt (+ (* |a_KOYnAf9Vv| |a_KOYnAf9Vv|)
                  (* |b_KOikyI9Vv| |b_KOikyI9Vv|))))
       (real-part |num_KOCrCO8Vv|)
       (imag-part |num_KOCrCO8Vv|))
      (if (< |num_KOCrCO8Vv| '0)
        (- |num_KOCrCO8Vv|)
        |num_KOCrCO8Vv|))))
(define min (void))
(define max (void))
(letrec ((|_min_max_KOEgw9aVv|
           (lambda (|proc_KOm-lqcVv|
                    |mv_KOIWjTcVv|
                    |args_KO2ThkdVv|
                    |inexact_KOoPfNdVv|)
             (if (null? |args_KO2ThkdVv|)
               (if (if |inexact_KOoPfNdVv|
                     (exact? |mv_KOIWjTcVv|)
                     '#f)
                 (exact->inexact |mv_KOIWjTcVv|)
                 |mv_KOIWjTcVv|)
               (if (|proc_KOm-lqcVv|
                     (car |args_KO2ThkdVv|)
                     |mv_KOIWjTcVv|)
                 (|_min_max_KOEgw9aVv|
                   |proc_KOm-lqcVv|
                   (car |args_KO2ThkdVv|)
                   (cdr |args_KO2ThkdVv|)
                   (if |inexact_KOoPfNdVv|
                     |inexact_KOoPfNdVv|
                     (inexact? (car |args_KO2ThkdVv|))))
                 (|_min_max_KOEgw9aVv|
                   |proc_KOm-lqcVv|
                   |mv_KOIWjTcVv|
                   (cdr |args_KO2ThkdVv|)
                   |inexact_KOoPfNdVv|))))))
  (begin
    (set! min
      (lambda (|x1_KOk9s3bVv| . |args_KO-cuCaVv|)
        (if (null? |args_KO-cuCaVv|)
          |x1_KOk9s3bVv|
          (|_min_max_KOEgw9aVv|
            <
            |x1_KOk9s3bVv|
            |args_KO-cuCaVv|
            (inexact? |x1_KOk9s3bVv|)))))
    (set! max
      (lambda (|x1_KO02oZbVv| . |args_KOG5qwbVv|)
        (if (null? |args_KOG5qwbVv|)
          |x1_KO02oZbVv|
          (|_min_max_KOEgw9aVv|
            >
            |x1_KO02oZbVv|
            |args_KOG5qwbVv|
            (inexact? |x1_KO02oZbVv|)))))))
(define negative?
  (lambda (|n_KO4IbHeVv|) (< |n_KO4IbHeVv| '0)))
(define positive?
  (lambda (|n_KOqE98fVv|) (> |n_KOqE98fVv| '0)))
(define even?
  (lambda (|n_KOMA7BfVv|)
    (= '0 (modulo |n_KOMA7BfVv| '2))))
(define odd?
  (lambda (|n_KO6x52gVv|)
    (not (even? |n_KO6x52gVv|))))
(define zero?
  (lambda (|n_KOst3vgVv|) (= |n_KOst3vgVv| '0)))
(define add1
  (lambda (|n_KOOp1YgVv|) (+ |n_KOOp1YgVv| '1)))
(define sub1
  (lambda (|n_KO8m_ohVv|) (- |n_KO8m_ohVv| '1)))
(define >= (void))
(define <= (void))
((lambda (|_comp_help_KOuiZRhVv| |_and2_KOQeXiiVv|)
   (begin
     (set! <=
       (|_comp_help_KOuiZRhVv|
         (lambda (|a_KOabVLiVv| |b_KOw7TcjVv|)
           ((lambda (|t_KOS3RFjVv|)
              (if |t_KOS3RFjVv|
                |t_KOS3RFjVv|
                (= |a_KOabVLiVv| |b_KOw7TcjVv|)))
            (< |a_KOabVLiVv| |b_KOw7TcjVv|)))
         |_and2_KOQeXiiVv|
         '#t))
     (set! >=
       (|_comp_help_KOuiZRhVv|
         (lambda (|a_KOc0P6kVv| |b_KOyYMzkVv|)
           ((lambda (|t_KOUUK0lVv|)
              (if |t_KOUUK0lVv|
                |t_KOUUK0lVv|
                (= |a_KOc0P6kVv| |b_KOyYMzkVv|)))
            (> |a_KOc0P6kVv| |b_KOyYMzkVv|)))
         |_and2_KOQeXiiVv|
         '#t))))
 (lambda (|comparator_KOeRItlVv|
          |chainer_KOANGWlVv|
          |endstate_KOWJEnmVv|)
   (lambda |args_KOgGCQmVv|
     ((letrec ((|loop_KOCCAhnVv|
                 (lambda (|x_KOYyyKnVv|)
                   (if (null? |x_KOYyyKnVv|)
                     |endstate_KOWJEnmVv|
                     (if (null? (cdr |x_KOYyyKnVv|))
                       |endstate_KOWJEnmVv|
                       (|chainer_KOANGWlVv|
                         (|comparator_KOeRItlVv|
                           (car |x_KOYyyKnVv|)
                           (cadr |x_KOYyyKnVv|))
                         (|loop_KOCCAhnVv| (cdr |x_KOYyyKnVv|))))))))
        |loop_KOCCAhnVv|)
      |args_KOgGCQmVv|)))
 (lambda (|x_KOivwboVv| |y_KOEruEoVv|)
   (if |x_KOivwboVv| |y_KOEruEoVv| '#f)))
((lambda (|_?=_KO-ns5pVv|)
   (begin
     (set! >= (|_?=_KO-ns5pVv| > >=))
     (set! <= (|_?=_KO-ns5pVv| < <=))))
 (lambda (|comparator_KOkkqypVv| |chainer_KOGgo_pVv|)
   (lambda |args_KO0dmsqVv|
     ((lambda (|t_KOm9kVqVv|)
        (if |t_KOm9kVqVv|
          |t_KOm9kVqVv|
          ((lambda (|t_KOI5imrVv|)
             (if |t_KOI5imrVv|
               |t_KOI5imrVv|
               (if ((lambda (|t_KO22gPrVv|)
                      (if |t_KO22gPrVv|
                        |t_KO22gPrVv|
                        (|comparator_KOkkqypVv|
                          (car |args_KO0dmsqVv|)
                          (cadr |args_KO0dmsqVv|))))
                    (= (car |args_KO0dmsqVv|)
                       (cadr |args_KO0dmsqVv|)))
                 (apply |chainer_KOGgo_pVv|
                        (cdr |args_KO0dmsqVv|))
                 '#f)))
           (null? (cdr |args_KO0dmsqVv|)))))
      (null? |args_KO0dmsqVv|)))))
(define gcd
  (lambda |args_KOo-dgsVv|
    (if (null? |args_KOo-dgsVv|)
      '0
      (if (null? (cdr |args_KOo-dgsVv|))
        (car |args_KOo-dgsVv|)
        (_gcd (car |args_KOo-dgsVv|)
              (cadr |args_KOo-dgsVv|))))))
(define lcm
  (lambda |args_KOKWbJsVv|
    (if (null? |args_KOKWbJsVv|)
      '1
      (if (null? (cdr |args_KOKWbJsVv|))
        (car |args_KOKWbJsVv|)
        (_lcm (car |args_KOKWbJsVv|)
              (cadr |args_KOKWbJsVv|))))))
(define modulo
  (lambda (|x_KO4T9atVv| |y_KOqP7DtVv|)
    ((lambda (|r_KOML54uVv|)
       (if (if (negative? |y_KOqP7DtVv|)
             (positive? |r_KOML54uVv|)
             (negative? |r_KOML54uVv|))
         (+ |r_KOML54uVv| |y_KOqP7DtVv|)
         |r_KOML54uVv|))
     (remainder |x_KO4T9atVv| |y_KOqP7DtVv|))))
(define string-append
  (lambda |args_KO6I3xuVv|
    (if (null? |args_KO6I3xuVv|)
      '""
      (if (null? (cdr |args_KO6I3xuVv|))
        (car |args_KO6I3xuVv|)
        (apply string-append
               (_string-append
                 (car |args_KO6I3xuVv|)
                 (cadr |args_KO6I3xuVv|))
               (cddr |args_KO6I3xuVv|))))))
(define char-downcase
  ((lambda (|a_KOsE1-uVv|)
     ((lambda (|z_KOOA_qvVv|)
        ((lambda (|lc-offset_KO8xZTvVv|)
           (lambda (|c_KOutXkwVv|)
             ((lambda (|cv_KOQpVNwVv|)
                (if (if (>= |cv_KOQpVNwVv| |a_KOsE1-uVv|)
                      (<= |cv_KOQpVNwVv| |z_KOOA_qvVv|)
                      '#f)
                  (integer->char
                    (+ |cv_KOQpVNwVv| |lc-offset_KO8xZTvVv|))
                  |c_KOutXkwVv|))
              (char->integer |c_KOutXkwVv|))))
         (- (char->integer '#\a) |a_KOsE1-uVv|)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (|a_KOamTexVv|)
     ((lambda (|z_KOwiRHxVv|)
        ((lambda (|uc-offset_KOSeP8yVv|)
           (lambda (|c_KOcbNByVv|)
             ((lambda (|cv_KOy7L2zVv|)
                (if (if (>= |cv_KOy7L2zVv| |a_KOamTexVv|)
                      (<= |cv_KOy7L2zVv| |z_KOwiRHxVv|)
                      '#f)
                  (integer->char
                    (- |cv_KOy7L2zVv| |uc-offset_KOSeP8yVv|))
                  |c_KOcbNByVv|))
              (char->integer |c_KOcbNByVv|))))
         (- |a_KOamTexVv| (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (|c1_KOU3JvzVv| |c2_KOe0HYzVv|)
    (> (char->integer |c1_KOU3JvzVv|)
       (char->integer |c2_KOe0HYzVv|))))
(define char<?
  (lambda (|c1_KOAYEpAVv| |c2_KOWUCSAVv|)
    (< (char->integer |c1_KOAYEpAVv|)
       (char->integer |c2_KOWUCSAVv|))))
(define char=? eqv?)
(define char>=?
  (lambda (|c1_KOgRAjBVv| |c2_KOCNyMBVv|)
    ((lambda (|t_KOYJwdCVv|)
       (if |t_KOYJwdCVv|
         |t_KOYJwdCVv|
         (char=? |c1_KOgRAjBVv| |c2_KOCNyMBVv|)))
     (char>? |c1_KOgRAjBVv| |c2_KOCNyMBVv|))))
(define char<=?
  (lambda (|c1_KOiGuGCVv| |c2_KOECs7DVv|)
    ((lambda (|t_KO-yqADVv|)
       (if |t_KO-yqADVv|
         |t_KO-yqADVv|
         (char=? |c1_KOiGuGCVv| |c2_KOECs7DVv|)))
     (char<? |c1_KOiGuGCVv| |c2_KOECs7DVv|))))
(define char-ci>?
  (lambda (|c1_KOkvo1EVv| |c2_KOGrmuEVv|)
    (char>?
      (char-downcase |c1_KOkvo1EVv|)
      (char-downcase |c2_KOGrmuEVv|))))
(define char-ci<?
  (lambda (|c1_KO0okXEVv| |c2_KOmkioFVv|)
    (char<?
      (char-downcase |c1_KO0okXEVv|)
      (char-downcase |c2_KOmkioFVv|))))
(define char-ci=?
  (lambda (|c1_KOIggRFVv| |c2_KO2deiGVv|)
    (char=?
      (char-downcase |c1_KOIggRFVv|)
      (char-downcase |c2_KO2deiGVv|))))
(define char-ci>=?
  (lambda (|c1_KOo9cLGVv| |c2_KOK5acHVv|)
    ((lambda (|t_KO428FHVv|)
       (if |t_KO428FHVv|
         |t_KO428FHVv|
         (char-ci=? |c1_KOo9cLGVv| |c2_KOK5acHVv|)))
     (char-ci>? |c1_KOo9cLGVv| |c2_KOK5acHVv|))))
(define char-ci<=?
  (lambda (|c1_KOq-56IVv| |c2_KOMW3zIVv|)
    ((lambda (|t_KO6T10JVv|)
       (if |t_KO6T10JVv|
         |t_KO6T10JVv|
         (char-ci=? |c1_KOq-56IVv| |c2_KOMW3zIVv|)))
     (char-ci<? |c1_KOq-56IVv| |c2_KOMW3zIVv|))))
(define char-alphabetic?
  (lambda (|c_KOsP_sJVv|)
    (if (char-ci>=? |c_KOsP_sJVv| '#\a)
      (char-ci<=? |c_KOsP_sJVv| '#\z)
      '#f)))
(define char-numeric?
  (lambda (|c_KOOLZVJVv|)
    (if (char-ci>=? |c_KOOLZVJVv| '#\0)
      (char-ci<=? |c_KOOLZVJVv| '#\9)
      '#f)))
(define char-whitespace?
  (lambda (|c_KO8IXmKVv|)
    (if (memv |c_KO8IXmKVv| '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (|c_KOuEVPKVv|)
    (if (char-alphabetic? |c_KOuEVPKVv|)
      (char<? |c_KOuEVPKVv| '#\a)
      '#f)))
(define char-lower-case?
  (lambda (|c_KOQATgLVv|)
    (if (char-alphabetic? |c_KOQATgLVv|)
      (char>? |c_KOQATgLVv| '#\Z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
(letrec ((|string-map_KOaxRJLVv|
           (lambda (|strsrc_KOUeH-NVv|
                    |strdst_KOebFrOVv|
                    |proc_KOA7DUOVv|
                    |n_KOW3BlPVv|
                    |l_KOg0zOPVv|)
             (if (< |n_KOW3BlPVv| |l_KOg0zOPVv|)
               (begin
                 (string-set!
                   |strdst_KOebFrOVv|
                   |n_KOW3BlPVv|
                   (|proc_KOA7DUOVv|
                     (string-ref |strsrc_KOUeH-NVv| |n_KOW3BlPVv|)))
                 (|string-map_KOaxRJLVv|
                   |strsrc_KOUeH-NVv|
                   |strdst_KOebFrOVv|
                   |proc_KOA7DUOVv|
                   (+ |n_KOW3BlPVv| '1)
                   |l_KOg0zOPVv|))
               |strdst_KOebFrOVv|))))
  (begin
    (set! string-downcase
      (lambda (|str_KOwtPaMVv|)
        ((lambda (|newstr_KOSpNDMVv|)
           (|string-map_KOaxRJLVv|
             |str_KOwtPaMVv|
             |newstr_KOSpNDMVv|
             char-downcase
             '0
             (string-length |str_KOwtPaMVv|)))
         (make-string (string-length |str_KOwtPaMVv|)))))
    (set! string-upcase
      (lambda (|str_KOcmL4NVv|)
        ((lambda (|newstr_KOyiJxNVv|)
           (|string-map_KOaxRJLVv|
             |str_KOcmL4NVv|
             |newstr_KOyiJxNVv|
             char-upcase
             '0
             (string-length |str_KOcmL4NVv|)))
         (make-string (string-length |str_KOcmL4NVv|)))))))
(define string=? equal?)
(define string<?
  (letrec ((|s<?_KOCYwfQVv|
             (lambda (|s1_KOENqCRVv| |s2_KO-Jo3SVv|)
               (if (null? |s1_KOENqCRVv|)
                 (not (null? |s2_KO-Jo3SVv|))
                 (if (null? |s2_KO-Jo3SVv|)
                   '#f
                   ((lambda (|c1_KOkGmwSVv| |c2_KOGCkZSVv|)
                      (if (char<? |c1_KOkGmwSVv| |c2_KOGCkZSVv|)
                        '#t
                        (if (char>? |c1_KOkGmwSVv| |c2_KOGCkZSVv|)
                          '#f
                          (|s<?_KOCYwfQVv|
                            (cdr |s1_KOENqCRVv|)
                            (cdr |s2_KO-Jo3SVv|)))))
                    (car |s1_KOENqCRVv|)
                    (car |s2_KO-Jo3SVv|)))))))
    (lambda (|s1_KOYUuIQVv| |s2_KOiRs9RVv|)
      (|s<?_KOCYwfQVv|
        (string->list |s1_KOYUuIQVv|)
        (string->list |s2_KOiRs9RVv|)))))
(define string>?
  (letrec ((|s>?_KO0ziqTVv|
             (lambda (|s1_KO2ocNUVv| |s2_KOokaeVVv|)
               (if (null? |s2_KOokaeVVv|)
                 (not (null? |s1_KO2ocNUVv|))
                 (if (null? |s1_KO2ocNUVv|)
                   '#f
                   ((lambda (|c1_KOKg8HVVv| |c2_KO4d68WVv|)
                      (if (char>? |c1_KOKg8HVVv| |c2_KO4d68WVv|)
                        '#t
                        (if (char<? |c1_KOKg8HVVv| |c2_KO4d68WVv|)
                          '#f
                          (|s>?_KO0ziqTVv|
                            (cdr |s1_KO2ocNUVv|)
                            (cdr |s2_KOokaeVVv|)))))
                    (car |s1_KO2ocNUVv|)
                    (car |s2_KOokaeVVv|)))))))
    (lambda (|s1_KOmvgTTVv| |s2_KOIrekUVv|)
      (|s>?_KO0ziqTVv|
        (string->list |s1_KOmvgTTVv|)
        (string->list |s2_KOIrekUVv|)))))
(define string<=?
  (lambda (|s1_KOq94BWVv| |s2_KOM522XVv|)
    ((lambda (|t_KO620vXVv|)
       (if |t_KO620vXVv|
         |t_KO620vXVv|
         (string=? |s1_KOq94BWVv| |s2_KOM522XVv|)))
     (string<? |s1_KOq94BWVv| |s2_KOM522XVv|))))
(define string>=?
  (lambda (|s1_KOs-ZXXVv| |s2_KOOWXoYVv|)
    ((lambda (|t_KO8TVRYVv|)
       (if |t_KO8TVRYVv|
         |t_KO8TVRYVv|
         (string=? |s1_KOs-ZXXVv| |s2_KOOWXoYVv|)))
     (string>? |s1_KOs-ZXXVv| |s2_KOOWXoYVv|))))
(define string-ci=?
  (lambda (|s1_KOuPTiZVv| |s2_KOQLRLZVv|)
    (string=?
      (string-downcase |s1_KOuPTiZVv|)
      (string-downcase |s2_KOQLRLZVv|))))
(define string-ci<?
  (lambda (|s1_KOaIPc-Vv| |s2_KOwENF-Vv|)
    (string<?
      (string-downcase |s1_KOaIPc-Vv|)
      (string-downcase |s2_KOwENF-Vv|))))
(define string-ci>?
  (lambda (|s1_KOSAL6_Vv| |s2_KOcxJz_Vv|)
    (string>?
      (string-downcase |s1_KOSAL6_Vv|)
      (string-downcase |s2_KOcxJz_Vv|))))
(define string-ci>=?
  (lambda (|s1_KOytH00Wv| |s2_KOUpFt0Wv|)
    (string>=?
      (string-downcase |s1_KOytH00Wv|)
      (string-downcase |s2_KOUpFt0Wv|))))
(define string-ci<=?
  (lambda (|s1_KOemDW0Wv| |s2_KOAiBn1Wv|)
    (string<=?
      (string-downcase |s1_KOemDW0Wv|)
      (string-downcase |s2_KOAiBn1Wv|))))
(define substring
  (letrec ((|fill-string_KOWezQ1Wv|
             (lambda (|sstr_KOEYo54Wv|
                      |dstr_KO-Umy4Wv|
                      |n_KOkRk_4Wv|
                      |s_KOGNis5Wv|
                      |e_KO0KgV5Wv|)
               (if (< |s_KOGNis5Wv| |e_KO0KgV5Wv|)
                 (begin
                   (string-set!
                     |dstr_KO-Umy4Wv|
                     |n_KOkRk_4Wv|
                     (string-ref |sstr_KOEYo54Wv| |s_KOGNis5Wv|))
                   (|fill-string_KOWezQ1Wv|
                     |sstr_KOEYo54Wv|
                     |dstr_KO-Umy4Wv|
                     (+ |n_KOkRk_4Wv| '1)
                     (+ |s_KOGNis5Wv| '1)
                     |e_KO0KgV5Wv|))
                 '#!void))))
    (lambda (|str_KOgbxh2Wv|
             |start_KOC7vK2Wv|
             |end_KOY3tb3Wv|)
      ((lambda (|newstr_KOi0rE3Wv|)
         (begin
           (|fill-string_KOWezQ1Wv|
             |str_KOgbxh2Wv|
             |newstr_KOi0rE3Wv|
             '0
             |start_KOC7vK2Wv|
             |end_KOY3tb3Wv|)
           |newstr_KOi0rE3Wv|))
       (make-string
         (- |end_KOY3tb3Wv| |start_KOC7vK2Wv|))))))
(define list-ref
  (lambda (|list_KOmGem6Wv| |n_KOICcP6Wv|)
    (if (zero? |n_KOICcP6Wv|)
      (car |list_KOmGem6Wv|)
      (list-ref
        (cdr |list_KOmGem6Wv|)
        (- |n_KOICcP6Wv| '1)))))
(define values
  (lambda |args_KO2zag7Wv|
    (call-with-current-continuation
      (lambda (|k_KOov8J7Wv|)
        (apply |k_KOov8J7Wv| |args_KO2zag7Wv|)))))
