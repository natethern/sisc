(#%program
  ((|%%__y697jYqZ_x| . 1) (_make-parameter . 1))
  ()
  (_make-parameter)
  (#%define current-optimizer
    (_make-parameter
      (#%lambda #t
        (|%%__y697jYqZ_x|)
        ()
        |%%__y697jYqZ_x|))))
(#%program
  ((car . 1)
   (|%%__yO13dZqZ_env| . 4)
   (null? . 1)
   (current-optimizer . 1)
   (_analyze! . 1)
   (|%%__ys55MYqZ_old-compile| . 1)
   (apply . 2)
   (|%%__y8-0GZqZ_x| . 1)
   (sc-expand . 1)
   (|%%__yQSYz-qZ_source| . 2)
   (|%%__ywLUt_qZ_e| . 1)
   (|%%__yaPW0_qZ_m| . 1)
   (throw . 1)
   (|%%__yuW-6-qZ_old-ie| . 2)
   (interaction-environment . 4)
   (with-failure-continuation . 1)
   (compile . 2))
  ((|%%__yQSYz-qZ_source| . 1) (compile . 1))
  (compile
    apply
    null?
    car
    current-optimizer
    _analyze!
    with-failure-continuation
    interaction-environment
    throw
    sc-expand)
  (#%set! compile
    ((#%lambda #t
       (|%%__ys55MYqZ_old-compile|)
       ()
       (#%lambda #t
         (|%%__y8-0GZqZ_x| . |%%__yO13dZqZ_env|)
         (|%%__ys55MYqZ_old-compile|)
         ((#%lambda #t
            (|%%__yuW-6-qZ_old-ie| |%%__yQSYz-qZ_source|)
            (|%%__yO13dZqZ_env|
              |%%__y8-0GZqZ_x|
              |%%__ys55MYqZ_old-compile|)
            (#%begin
              (with-failure-continuation
                (#%lambda #t
                  (|%%__yaPW0_qZ_m| |%%__ywLUt_qZ_e|)
                  (|%%__yuW-6-qZ_old-ie|)
                  (#%begin
                    (interaction-environment |%%__yuW-6-qZ_old-ie|)
                    (throw |%%__yaPW0_qZ_m| |%%__ywLUt_qZ_e|)))
                (#%lambda #t
                  ()
                  (|%%__yQSYz-qZ_source| |%%__y8-0GZqZ_x|)
                  (#%set! |%%__yQSYz-qZ_source|
                    (sc-expand
                      |%%__y8-0GZqZ_x|
                      (#%quote (e))
                      (#%quote (e))))))
              (interaction-environment |%%__yuW-6-qZ_old-ie|)
              (apply |%%__ys55MYqZ_old-compile|
                     (_analyze!
                       ((current-optimizer) |%%__yQSYz-qZ_source|)
                       (#%if (null? |%%__yO13dZqZ_env|)
                         (interaction-environment)
                         (car |%%__yO13dZqZ_env|)))
                     |%%__yO13dZqZ_env|)))
          (apply interaction-environment
                 |%%__yO13dZqZ_env|)
          #f)))
     compile)))
(#%program
  ((compile . 1)
   (error . 1)
   (strict-r5rs-compliance . 1)
   (interaction-environment . 1)
   (|%%__ycEQn0rZ_env| . 5)
   (null? . 2)
   (cadr . 2)
   (_analyze! . 1)
   (equal? . 1)
   (|%%__ySHSW_qZ_old-eval| . 1)
   (apply . 2)
   (car . 3)
   (member . 1)
   (|%%__yyAOQ0rZ_x| . 6)
   (pair? . 1)
   (eval . 2))
  ((eval . 1))
  (eval member
        car
        pair?
        equal?
        null?
        interaction-environment
        cadr
        _analyze!
        apply
        compile
        error
        strict-r5rs-compliance)
  (#%set! eval
    ((#%lambda #t
       (|%%__ySHSW_qZ_old-eval|)
       ()
       (#%lambda #t
         (|%%__yyAOQ0rZ_x| . |%%__ycEQn0rZ_env|)
         (|%%__ySHSW_qZ_old-eval|)
         (#%if (#%if (pair? |%%__yyAOQ0rZ_x|)
                 (member
                   (car |%%__yyAOQ0rZ_x|)
                   (#%quote ("noexpand" "analyzeonly")))
                 #f)
           (apply |%%__ySHSW_qZ_old-eval|
                  (#%if (equal? (car |%%__yyAOQ0rZ_x|) "analyzeonly")
                    (_analyze!
                      (cadr |%%__yyAOQ0rZ_x|)
                      (#%if (null? |%%__ycEQn0rZ_env|)
                        (interaction-environment)
                        (car |%%__ycEQn0rZ_env|)))
                    (cadr |%%__yyAOQ0rZ_x|))
                  |%%__ycEQn0rZ_env|)
           (#%if (#%if (null? |%%__ycEQn0rZ_env|)
                   (strict-r5rs-compliance)
                   #f)
             (error (#%quote eval)
                    "expected 2 arguments to procedure, got 1.")
             ((apply compile
                     |%%__yyAOQ0rZ_x|
                     |%%__ycEQn0rZ_env|))))))
     eval)))
