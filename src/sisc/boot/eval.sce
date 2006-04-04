(#%program
  ((|%%_-TqjjnpUq_x| . 1) (_make-parameter . 1))
  ()
  (_make-parameter)
  (#%define current-optimizer
    (_make-parameter
      (#%lambda #t
        (|%%_-TqjjnpUq_x|)
        ()
        |%%_-TqjjnpUq_x|))))
(#%program
  ((_with-environment . 1))
  ()
  (_with-environment)
  (#%define with-environment _with-environment))
(#%program
  ((compile . 1)
   (|%%_-TQV4ysUq_compile| . 1)
   (|%%_-TuZ65sUq_analyze| . 1)
   (|%%_-T819ErUq_optimize| . 1)
   (|%%_-TO4bbrUq_expand| . 1)
   (cons . 4)
   (list . 1)
   (|%%_-TcHYluUq_expr| . 1)
   (|%%_-TMfhQpUq_old-compile| . 1)
   (|%%_-TSK-UtUq_expr| . 1)
   (_analyze! . 1)
   (|%%_-TwO0stUq_expr| . 1)
   (current-optimizer . 1)
   (|%%_-T6cfhqUq_flags| . 1)
   (|%%_-TaS2_sUq_expr| . 1)
   (sc-expand . 1)
   (apply . 1)
   (|%%_-Ts8dKqUq_env| . 3)
   (with-environment . 1))
  ((|%%_-TQV4ysUq_compile| . 1)
   (|%%_-TuZ65sUq_analyze| . 1)
   (|%%_-T819ErUq_optimize| . 1)
   (|%%_-TO4bbrUq_expand| . 1))
  (compile
    list
    cons
    _analyze!
    current-optimizer
    sc-expand
    apply
    with-environment)
  (#%define compilation-phases
    ((#%lambda #t
       (|%%_-TMfhQpUq_old-compile|)
       ()
       (#%lambda #t
         (|%%_-T6cfhqUq_flags| |%%_-Ts8dKqUq_env|)
         (|%%_-TMfhQpUq_old-compile|)
         (#%letrec #t
           ((|%%_-TO4bbrUq_expand|
              (#%lambda #t
                (|%%_-TaS2_sUq_expr|)
                (|%%_-Ts8dKqUq_env| |%%_-T6cfhqUq_flags|)
                (with-environment
                  |%%_-Ts8dKqUq_env|
                  (#%lambda #t
                    ()
                    (|%%_-TaS2_sUq_expr| |%%_-T6cfhqUq_flags|)
                    (apply sc-expand
                           |%%_-TaS2_sUq_expr|
                           |%%_-T6cfhqUq_flags|)))))
            (|%%_-T819ErUq_optimize|
              (#%lambda #t
                (|%%_-TwO0stUq_expr|)
                ()
                ((current-optimizer) |%%_-TwO0stUq_expr|)))
            (|%%_-TuZ65sUq_analyze|
              (#%lambda #t
                (|%%_-TSK-UtUq_expr|)
                (|%%_-Ts8dKqUq_env|)
                (_analyze!
                  |%%_-TSK-UtUq_expr|
                  |%%_-Ts8dKqUq_env|)))
            (|%%_-TQV4ysUq_compile|
              (#%lambda #t
                (|%%_-TcHYluUq_expr|)
                (|%%_-Ts8dKqUq_env| |%%_-TMfhQpUq_old-compile|)
                (|%%_-TMfhQpUq_old-compile|
                  |%%_-TcHYluUq_expr|
                  |%%_-Ts8dKqUq_env|))))
           (|%%_-Ts8dKqUq_env|
             |%%_-T6cfhqUq_flags|
             |%%_-TMfhQpUq_old-compile|)
           (list (cons (#%quote expand) |%%_-TO4bbrUq_expand|)
                 (cons (#%quote optimize) |%%_-T819ErUq_optimize|)
                 (cons (#%quote analyze) |%%_-TuZ65sUq_analyze|)
                 (cons (#%quote compile) |%%_-TQV4ysUq_compile|)))))
     compile)))
(#%program
  ((interaction-environment . 1)
   (|%%_-TyDWOuUq_env| . 2)
   (|%%_-TAsQ9wUq_expr| . 1)
   (|%%_-TChKwxUq_env| . 1)
   (|%%_-TUzUfvUq_flags| . 1)
   (compilation-phases . 1)
   (|%%_-TewSIvUq_start-phase| . 1)
   (|%%_-TglM3xUq_select-phases| . 2)
   (map . 1)
   (|%%_-TGXxeAUq_start-phase| . 2)
   (|%%_-T0UvHAUq_phases| . 3)
   (caar . 1)
   (eq? . 1)
   (cdr . 3)
   (|%%_-TWoOCwUq_compose| . 2)
   (apply . 2)
   (car . 2)
   (|%%_-T-2CkzUq_x| . 1)
   (|%%_-TiaGqyUq_fn| . 1)
   (|%%_-TE6ETyUq_tail| . 1)
   (|%%_-Tk_zNzUq_x| . 1)
   (|%%_-TYdIZxUq_fs| . 3)
   (null? . 2))
  ((|%%_-TglM3xUq_select-phases| . 1)
   (|%%_-TWoOCwUq_compose| . 1))
  (null? apply
         cdr
         car
         caar
         eq?
         map
         interaction-environment
         compilation-phases)
  (#%define compile-with-flags
    (#%lambda #t
      (|%%_-TAsQ9wUq_expr|
        |%%_-TewSIvUq_start-phase|
        |%%_-TUzUfvUq_flags|
        .
        |%%_-TyDWOuUq_env|)
      ()
      (#%letrec #t
        ((|%%_-TWoOCwUq_compose|
           (#%lambda #t
             |%%_-TYdIZxUq_fs|
             (|%%_-TWoOCwUq_compose|)
             (#%if (null? |%%_-TYdIZxUq_fs|)
               (#%lambda #t
                 (|%%_-Tk_zNzUq_x|)
                 ()
                 |%%_-Tk_zNzUq_x|)
               ((#%lambda #t
                  (|%%_-TiaGqyUq_fn| |%%_-TE6ETyUq_tail|)
                  ()
                  (#%lambda #t
                    (|%%_-T-2CkzUq_x|)
                    (|%%_-TE6ETyUq_tail| |%%_-TiaGqyUq_fn|)
                    (|%%_-TE6ETyUq_tail|
                      (|%%_-TiaGqyUq_fn| |%%_-T-2CkzUq_x|))))
                (car |%%_-TYdIZxUq_fs|)
                (apply |%%_-TWoOCwUq_compose|
                       (cdr |%%_-TYdIZxUq_fs|))))))
         (|%%_-TglM3xUq_select-phases|
           (#%lambda #t
             (|%%_-TGXxeAUq_start-phase|
               |%%_-T0UvHAUq_phases|)
             (|%%_-TglM3xUq_select-phases|)
             (#%if (eq? (caar |%%_-T0UvHAUq_phases|)
                        |%%_-TGXxeAUq_start-phase|)
               (map cdr |%%_-T0UvHAUq_phases|)
               (|%%_-TglM3xUq_select-phases|
                 |%%_-TGXxeAUq_start-phase|
                 (cdr |%%_-T0UvHAUq_phases|))))))
        (|%%_-TyDWOuUq_env|
          |%%_-TUzUfvUq_flags|
          |%%_-TewSIvUq_start-phase|
          |%%_-TAsQ9wUq_expr|)
        ((#%lambda #t
           (|%%_-TChKwxUq_env|)
           (|%%_-TglM3xUq_select-phases|
             |%%_-TWoOCwUq_compose|
             |%%_-TUzUfvUq_flags|
             |%%_-TewSIvUq_start-phase|
             |%%_-TAsQ9wUq_expr|)
           ((apply |%%_-TWoOCwUq_compose|
                   (|%%_-TglM3xUq_select-phases|
                     |%%_-TewSIvUq_start-phase|
                     (compilation-phases
                       |%%_-TUzUfvUq_flags|
                       |%%_-TChKwxUq_env|)))
            |%%_-TAsQ9wUq_expr|))
         (#%if (null? |%%_-TyDWOuUq_env|)
           (interaction-environment)
           (car |%%_-TyDWOuUq_env|)))))))
(#%program
  ((|%%_-TmQt8BUq_env| . 1)
   (|%%_-TIMrBBUq_expr| . 1)
   (compile-with-flags . 1)
   (apply . 1)
   (compile . 1))
  ((compile . 1))
  (compile-with-flags apply)
  (#%set! compile
    (#%lambda #t
      (|%%_-TIMrBBUq_expr| . |%%_-TmQt8BUq_env|)
      ()
      (apply compile-with-flags
             |%%_-TIMrBBUq_expr|
             (#%quote expand)
             (#%quote ((l) (l)))
             |%%_-TmQt8BUq_env|))))
(#%program
  ((compile-with-flags . 1)
   (apply . 1)
   (error . 1)
   (strict-r5rs-compliance . 1)
   (|%%_-T2Jp2CUq_env| . 2)
   (null? . 1)
   (cadr . 2)
   (|%%_-TKBlYCUq_phase| . 3)
   (car . 2)
   (equal? . 2)
   (|%%_-ToFnvCUq_x| . 9)
   (pair? . 2))
  ((|%%_-ToFnvCUq_x| . 2)
   (|%%_-TKBlYCUq_phase| . 2))
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
      (|%%_-ToFnvCUq_x| . |%%_-T2Jp2CUq_env|)
      ()
      ((#%lambda #t
         (|%%_-TKBlYCUq_phase|)
         (|%%_-T2Jp2CUq_env| |%%_-ToFnvCUq_x|)
         (#%begin
           (#%if (#%if (pair? |%%_-ToFnvCUq_x|)
                   (equal? (car |%%_-ToFnvCUq_x|) "noexpand")
                   #f)
             (#%begin
               (#%set! |%%_-TKBlYCUq_phase| (#%quote compile))
               (#%set! |%%_-ToFnvCUq_x| (cadr |%%_-ToFnvCUq_x|)))
             (#%if (#%if (pair? |%%_-ToFnvCUq_x|)
                     (equal? (car |%%_-ToFnvCUq_x|) "analyzeonly")
                     #f)
               (#%begin
                 (#%set! |%%_-TKBlYCUq_phase| (#%quote analyze))
                 (#%set! |%%_-ToFnvCUq_x| (cadr |%%_-ToFnvCUq_x|)))
               (#%if (#%if (null? |%%_-T2Jp2CUq_env|)
                       (strict-r5rs-compliance)
                       #f)
                 (error (#%quote eval)
                        "expected 2 arguments to procedure, got 1.")
                 #!void)))
           ((apply compile-with-flags
                   |%%_-ToFnvCUq_x|
                   |%%_-TKBlYCUq_phase|
                   (#%quote ((e) (e)))
                   |%%_-T2Jp2CUq_env|))))
       (#%quote expand)))))
