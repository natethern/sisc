(#%program
  ((|%%_iiUwapXaw_x| . 1) (_make-parameter . 1))
  ()
  (_make-parameter)
  (#%define current-optimizer
    (_make-parameter
      (#%lambda #t
        (|%%_iiUwapXaw_x|)
        ()
        |%%_iiUwapXaw_x|))))
(#%program
  ((interaction-environment . 1)
   (sc-expand . 1)
   (_analyze! . 1)
   (apply . 1)
   (current-optimizer . 1)
   (|%%_iigi2dZaw_sc-expand| . 1)
   (|%%_iiE3W0_aw_optimizer| . 1)
   (|%%_iikYRW_aw_source| . 2)
   (|%%_ii0RNQ0bw_e| . 1)
   (|%%_iiGUPn0bw_m| . 1)
   (throw . 1)
   (|%%_ii-_Tt_aw_old-ie| . 2)
   (with-failure-continuation . 1)
   (error . 1)
   (strict-r5rs-compliance . 1)
   (|%%_iiCe0GZaw_interaction-environment| . 4)
   (|%%_iiYa-6-aw_env| . 6)
   (null? . 2)
   (cadr . 2)
   (|%%_iiWl4MYaw__analyze!| . 2)
   (equal? . 1)
   (|%%_iiet8SXaw_old-eval| . 2)
   (|%%_iiAp6jYaw_apply| . 3)
   (car . 3)
   (member . 1)
   (|%%_iii7Yz-aw_x| . 6)
   (pair? . 1)
   (eval . 2))
  ((|%%_iikYRW_aw_source| . 1) (eval . 1))
  (interaction-environment
    sc-expand
    _analyze!
    apply
    eval
    member
    car
    pair?
    equal?
    null?
    cadr
    with-failure-continuation
    throw
    current-optimizer
    error
    strict-r5rs-compliance)
  (#%set! eval
    ((#%lambda #t
       (|%%_iiet8SXaw_old-eval|
         |%%_iiAp6jYaw_apply|
         |%%_iiWl4MYaw__analyze!|
         |%%_iigi2dZaw_sc-expand|
         |%%_iiCe0GZaw_interaction-environment|)
       ()
       (#%lambda #t
         (|%%_iii7Yz-aw_x| . |%%_iiYa-6-aw_env|)
         (|%%_iiCe0GZaw_interaction-environment|
           |%%_iigi2dZaw_sc-expand|
           |%%_iiWl4MYaw__analyze!|
           |%%_iiAp6jYaw_apply|
           |%%_iiet8SXaw_old-eval|)
         (#%if (#%if (pair? |%%_iii7Yz-aw_x|)
                 (member
                   (car |%%_iii7Yz-aw_x|)
                   (#%quote ("noexpand" "analyzeonly")))
                 #f)
           (|%%_iiAp6jYaw_apply|
             |%%_iiet8SXaw_old-eval|
             (#%if (equal? (car |%%_iii7Yz-aw_x|) "analyzeonly")
               (|%%_iiWl4MYaw__analyze!|
                 (cadr |%%_iii7Yz-aw_x|)
                 (#%if (null? |%%_iiYa-6-aw_env|)
                   (|%%_iiCe0GZaw_interaction-environment|)
                   (car |%%_iiYa-6-aw_env|)))
               (cadr |%%_iii7Yz-aw_x|))
             |%%_iiYa-6-aw_env|)
           (#%if (#%if (null? |%%_iiYa-6-aw_env|)
                   (strict-r5rs-compliance)
                   #f)
             (error (#%quote eval)
                    "expected 2 arguments to procedure, got 1.")
             ((#%lambda #t
                (|%%_iiE3W0_aw_optimizer|
                  |%%_ii-_Tt_aw_old-ie|
                  |%%_iikYRW_aw_source|)
                (|%%_iiYa-6-aw_env|
                  |%%_iii7Yz-aw_x|
                  |%%_iiCe0GZaw_interaction-environment|
                  |%%_iigi2dZaw_sc-expand|
                  |%%_iiWl4MYaw__analyze!|
                  |%%_iiAp6jYaw_apply|
                  |%%_iiet8SXaw_old-eval|)
                (#%begin
                  (with-failure-continuation
                    (#%lambda #t
                      (|%%_iiGUPn0bw_m| |%%_ii0RNQ0bw_e|)
                      (|%%_ii-_Tt_aw_old-ie|
                        |%%_iiCe0GZaw_interaction-environment|)
                      (#%begin
                        (|%%_iiCe0GZaw_interaction-environment|
                          |%%_ii-_Tt_aw_old-ie|)
                        (throw |%%_iiGUPn0bw_m| |%%_ii0RNQ0bw_e|)))
                    (#%lambda #t
                      ()
                      (|%%_iikYRW_aw_source|
                        |%%_ii-_Tt_aw_old-ie|
                        |%%_iiE3W0_aw_optimizer|
                        |%%_iii7Yz-aw_x|
                        |%%_iiCe0GZaw_interaction-environment|
                        |%%_iigi2dZaw_sc-expand|
                        |%%_iiWl4MYaw__analyze!|)
                      (#%set! |%%_iikYRW_aw_source|
                        (|%%_iiWl4MYaw__analyze!|
                          (|%%_iiE3W0_aw_optimizer|
                            (|%%_iigi2dZaw_sc-expand|
                              |%%_iii7Yz-aw_x|
                              (#%quote (e))
                              (#%quote (e))))
                          (|%%_iiCe0GZaw_interaction-environment|
                            |%%_ii-_Tt_aw_old-ie|)))))
                  (|%%_iiAp6jYaw_apply|
                    |%%_iiet8SXaw_old-eval|
                    |%%_iikYRW_aw_source|
                    |%%_iiYa-6-aw_env|)))
              (current-optimizer)
              (|%%_iiAp6jYaw_apply|
                |%%_iiCe0GZaw_interaction-environment|
                |%%_iiYa-6-aw_env|)
              #f)))))
     eval
     apply
     _analyze!
     sc-expand
     interaction-environment)))
