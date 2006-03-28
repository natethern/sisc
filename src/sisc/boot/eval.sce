(#%program
  ((|%%_div5EmwYP_x| . 1) (_make-parameter . 1))
  ()
  (_make-parameter)
  (#%define current-optimizer
    (_make-parameter
      (#%lambda #t
        (|%%_div5EmwYP_x|)
        ()
        |%%_div5EmwYP_x|))))
(#%program
  ((_with-environment . 1))
  ()
  (_with-environment)
  (#%define with-environment _with-environment))
(#%program
  ((compile . 1)
   (interaction-environment . 1)
   (|%%_diTSvayYP_env| . 2)
   (|%%_diDpfOBYP_compile| . 1)
   (|%%_dihthlBYP_analyze| . 1)
   (|%%_diXwjUAYP_optimize| . 1)
   (|%%_diBAlrAYP_expand| . 1)
   (cons . 4)
   (list . 1)
   (|%%_diVHpxzYP_expr| . 1)
   (|%%_diZldfCYP_phases| . 1)
   (|%%_dizLr4zYP_start-phase| . 1)
   (|%%_dil753EYP_expr| . 1)
   (|%%_diR1CPwYP_old-compile| . 1)
   (|%%_di_a7CDYP_expr| . 1)
   (_analyze! . 1)
   (|%%_diFe99DYP_expr| . 1)
   (current-optimizer . 1)
   (|%%_didPtDyYP_flags| . 1)
   (|%%_dijibICYP_expr| . 1)
   (sc-expand . 1)
   (|%%_difEn-zYP_env| . 3)
   (with-environment . 1)
   (|%%_dixWxJxYP_select-phases| . 2)
   (map . 1)
   (|%%_dipNUMGYP_start-phase| . 2)
   (|%%_diLJSdHYP_phases| . 3)
   (caar . 1)
   (eq? . 1)
   (cdr . 3)
   (|%%_dib-zgxYP_compose| . 2)
   (apply . 3)
   (car . 2)
   (|%%_diJUYSFYP_x| . 1)
   (|%%_di101ZEYP_fn| . 1)
   (|%%_dinY-pFYP_tail| . 1)
   (|%%_di3RWjGYP_x| . 1)
   (|%%_diH33wEYP_fs| . 3)
   (null? . 2))
  ((|%%_diDpfOBYP_compile| . 1)
   (|%%_dihthlBYP_analyze| . 1)
   (|%%_diXwjUAYP_optimize| . 1)
   (|%%_diBAlrAYP_expand| . 1)
   (|%%_dixWxJxYP_select-phases| . 1)
   (|%%_dib-zgxYP_compose| . 1))
  (compile
    null?
    apply
    cdr
    car
    caar
    eq?
    map
    with-environment
    sc-expand
    current-optimizer
    _analyze!
    list
    cons
    interaction-environment)
  (#%define compile-with-flags
    ((#%lambda #t
       (|%%_diR1CPwYP_old-compile|)
       ()
       (#%letrec #t
         ((|%%_dib-zgxYP_compose|
            (#%lambda #t
              |%%_diH33wEYP_fs|
              (|%%_dib-zgxYP_compose|)
              (#%if (null? |%%_diH33wEYP_fs|)
                (#%lambda #t
                  (|%%_di3RWjGYP_x|)
                  ()
                  |%%_di3RWjGYP_x|)
                ((#%lambda #t
                   (|%%_di101ZEYP_fn| |%%_dinY-pFYP_tail|)
                   ()
                   (#%lambda #t
                     (|%%_diJUYSFYP_x|)
                     (|%%_dinY-pFYP_tail| |%%_di101ZEYP_fn|)
                     (|%%_dinY-pFYP_tail|
                       (|%%_di101ZEYP_fn| |%%_diJUYSFYP_x|))))
                 (car |%%_diH33wEYP_fs|)
                 (apply |%%_dib-zgxYP_compose|
                        (cdr |%%_diH33wEYP_fs|))))))
          (|%%_dixWxJxYP_select-phases|
            (#%lambda #t
              (|%%_dipNUMGYP_start-phase|
                |%%_diLJSdHYP_phases|)
              (|%%_dixWxJxYP_select-phases|)
              (#%if (eq? (caar |%%_diLJSdHYP_phases|)
                         |%%_dipNUMGYP_start-phase|)
                (map cdr |%%_diLJSdHYP_phases|)
                (|%%_dixWxJxYP_select-phases|
                  |%%_dipNUMGYP_start-phase|
                  (cdr |%%_diLJSdHYP_phases|))))))
         (|%%_diR1CPwYP_old-compile|)
         (#%lambda #t
           (|%%_diVHpxzYP_expr|
             |%%_dizLr4zYP_start-phase|
             |%%_didPtDyYP_flags|
             .
             |%%_diTSvayYP_env|)
           (|%%_dixWxJxYP_select-phases|
             |%%_dib-zgxYP_compose|
             |%%_diR1CPwYP_old-compile|)
           ((#%lambda #t
              (|%%_difEn-zYP_env|)
              (|%%_didPtDyYP_flags|
                |%%_dizLr4zYP_start-phase|
                |%%_diVHpxzYP_expr|
                |%%_dixWxJxYP_select-phases|
                |%%_dib-zgxYP_compose|
                |%%_diR1CPwYP_old-compile|)
              (#%letrec #t
                ((|%%_diBAlrAYP_expand|
                   (#%lambda #t
                     (|%%_dijibICYP_expr|)
                     (|%%_difEn-zYP_env| |%%_didPtDyYP_flags|)
                     (with-environment
                       |%%_difEn-zYP_env|
                       (#%lambda #t
                         ()
                         (|%%_dijibICYP_expr| |%%_didPtDyYP_flags|)
                         (apply sc-expand
                                |%%_dijibICYP_expr|
                                |%%_didPtDyYP_flags|)))))
                 (|%%_diXwjUAYP_optimize|
                   (#%lambda #t
                     (|%%_diFe99DYP_expr|)
                     ()
                     ((current-optimizer) |%%_diFe99DYP_expr|)))
                 (|%%_dihthlBYP_analyze|
                   (#%lambda #t
                     (|%%_di_a7CDYP_expr|)
                     (|%%_difEn-zYP_env|)
                     (_analyze!
                       |%%_di_a7CDYP_expr|
                       |%%_difEn-zYP_env|)))
                 (|%%_diDpfOBYP_compile|
                   (#%lambda #t
                     (|%%_dil753EYP_expr|)
                     (|%%_difEn-zYP_env| |%%_diR1CPwYP_old-compile|)
                     (|%%_diR1CPwYP_old-compile|
                       |%%_dil753EYP_expr|
                       |%%_difEn-zYP_env|))))
                (|%%_difEn-zYP_env|
                  |%%_didPtDyYP_flags|
                  |%%_dizLr4zYP_start-phase|
                  |%%_diVHpxzYP_expr|
                  |%%_dixWxJxYP_select-phases|
                  |%%_dib-zgxYP_compose|
                  |%%_diR1CPwYP_old-compile|)
                ((#%lambda #t
                   (|%%_diZldfCYP_phases|)
                   (|%%_dizLr4zYP_start-phase|
                     |%%_diVHpxzYP_expr|
                     |%%_dixWxJxYP_select-phases|
                     |%%_dib-zgxYP_compose|)
                   ((apply |%%_dib-zgxYP_compose|
                           (|%%_dixWxJxYP_select-phases|
                             |%%_dizLr4zYP_start-phase|
                             |%%_diZldfCYP_phases|))
                    |%%_diVHpxzYP_expr|))
                 (list (cons (#%quote expand) |%%_diBAlrAYP_expand|)
                       (cons (#%quote optimize) |%%_diXwjUAYP_optimize|)
                       (cons (#%quote analyze) |%%_dihthlBYP_analyze|)
                       (cons (#%quote compile) |%%_diDpfOBYP_compile|)))))
            (#%if (null? |%%_diTSvayYP_env|)
              (interaction-environment)
              (car |%%_diTSvayYP_env|))))))
     compile)))
(#%program
  ((|%%_di5GQGHYP_env| . 1)
   (|%%_dirCO7IYP_expr| . 1)
   (compile-with-flags . 1)
   (apply . 1)
   (compile . 1))
  ((compile . 1))
  (compile-with-flags apply)
  (#%set! compile
    (#%lambda #t
      (|%%_dirCO7IYP_expr| . |%%_di5GQGHYP_env|)
      ()
      (apply compile-with-flags
             |%%_dirCO7IYP_expr|
             (#%quote expand)
             (#%quote ((l) (l)))
             |%%_di5GQGHYP_env|))))
(#%program
  ((compile-with-flags . 1)
   (apply . 1)
   (error . 1)
   (strict-r5rs-compliance . 1)
   (|%%_diNyMAIYP_env| . 2)
   (null? . 1)
   (cadr . 2)
   (|%%_ditrIuJYP_phase| . 3)
   (car . 2)
   (equal? . 2)
   (|%%_di7vK1JYP_x| . 9)
   (pair? . 2))
  ((|%%_di7vK1JYP_x| . 2)
   (|%%_ditrIuJYP_phase| . 2))
  (error null?
         strict-r5rs-compliance
         cadr
         pair?
         car
         equal?
         compile-with-flags
         apply)
  (#%define eval
    (#%lambda #t
      (|%%_di7vK1JYP_x| . |%%_diNyMAIYP_env|)
      ()
      ((#%lambda #t
         (|%%_ditrIuJYP_phase|)
         (|%%_diNyMAIYP_env| |%%_di7vK1JYP_x|)
         (#%begin
           (#%if (#%if (pair? |%%_di7vK1JYP_x|)
                   (equal? (car |%%_di7vK1JYP_x|) "noexpand")
                   #f)
             (#%begin
               (#%set! |%%_ditrIuJYP_phase| (#%quote compile))
               (#%set! |%%_di7vK1JYP_x| (cadr |%%_di7vK1JYP_x|)))
             (#%if (#%if (pair? |%%_di7vK1JYP_x|)
                     (equal? (car |%%_di7vK1JYP_x|) "analyzeonly")
                     #f)
               (#%begin
                 (#%set! |%%_ditrIuJYP_phase| (#%quote analyze))
                 (#%set! |%%_di7vK1JYP_x| (cadr |%%_di7vK1JYP_x|)))
               (#%if (#%if (null? |%%_diNyMAIYP_env|)
                       (strict-r5rs-compliance)
                       #f)
                 (error (#%quote eval)
                        "expected 2 arguments to procedure, got 1.")
                 #!void)))
           ((apply compile-with-flags
                   |%%_di7vK1JYP_x|
                   |%%_ditrIuJYP_phase|
                   (#%quote ((e) (e)))
                   |%%_diNyMAIYP_env|))))
       (#%quote expand)))))
