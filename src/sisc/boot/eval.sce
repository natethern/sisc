(#%program
  ((|%%_LBFvsA_6T_x| . 1) (_make-parameter . 1))
  ()
  (_make-parameter)
  (#%define current-optimizer
    (_make-parameter
      (#%lambda #t
        (|%%_LBFvsA_6T_x|)
        ()
        |%%_LBFvsA_6T_x|))))
(#%program
  ((interaction-environment . 1)
   (sc-expand . 1)
   (_analyze! . 1)
   (apply . 1)
   (current-optimizer . 1)
   (|%%_LB1hko17T_sc-expand| . 1)
   (|%%_LBp2cc37T_optimizer| . 1)
   (|%%_LB5X7647T_source| . 2)
   (|%%_LBNP3057T_e| . 1)
   (|%%_LBrT5z47T_m| . 1)
   (throw . 1)
   (|%%_LBL-9F37T_old-ie| . 2)
   (with-failure-continuation . 1)
   (error . 1)
   (strict-r5rs-compliance . 1)
   (|%%_LBndiR17T_interaction-environment| . 4)
   (|%%_LBJ9gi27T_env| . 6)
   (null? . 2)
   (cadr . 2)
   (|%%_LBHkmX07T__analyze!| . 2)
   (equal? . 1)
   (|%%_LB_rq107T_old-eval| . 2)
   (|%%_LBloou07T_apply| . 3)
   (car . 3)
   (member . 1)
   (|%%_LB36eL27T_x| . 6)
   (pair? . 1)
   (eval . 2))
  ((|%%_LB5X7647T_source| . 1) (eval . 1))
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
       (|%%_LB_rq107T_old-eval|
         |%%_LBloou07T_apply|
         |%%_LBHkmX07T__analyze!|
         |%%_LB1hko17T_sc-expand|
         |%%_LBndiR17T_interaction-environment|)
       ()
       (#%lambda #t
         (|%%_LB36eL27T_x| . |%%_LBJ9gi27T_env|)
         (|%%_LBndiR17T_interaction-environment|
           |%%_LB1hko17T_sc-expand|
           |%%_LBHkmX07T__analyze!|
           |%%_LBloou07T_apply|
           |%%_LB_rq107T_old-eval|)
         (#%if (#%if (pair? |%%_LB36eL27T_x|)
                 (member
                   (car |%%_LB36eL27T_x|)
                   (#%quote ("noexpand" "analyzeonly")))
                 #f)
           (|%%_LBloou07T_apply|
             |%%_LB_rq107T_old-eval|
             (#%if (equal? (car |%%_LB36eL27T_x|) "analyzeonly")
               (|%%_LBHkmX07T__analyze!|
                 (cadr |%%_LB36eL27T_x|)
                 (#%if (null? |%%_LBJ9gi27T_env|)
                   (|%%_LBndiR17T_interaction-environment|)
                   (car |%%_LBJ9gi27T_env|)))
               (cadr |%%_LB36eL27T_x|))
             |%%_LBJ9gi27T_env|)
           (#%if (#%if (null? |%%_LBJ9gi27T_env|)
                   (strict-r5rs-compliance)
                   #f)
             (error (#%quote eval)
                    "expected 2 arguments to procedure, got 1.")
             ((#%lambda #t
                (|%%_LBp2cc37T_optimizer|
                  |%%_LBL-9F37T_old-ie|
                  |%%_LB5X7647T_source|)
                (|%%_LBJ9gi27T_env|
                  |%%_LB36eL27T_x|
                  |%%_LBndiR17T_interaction-environment|
                  |%%_LB1hko17T_sc-expand|
                  |%%_LBHkmX07T__analyze!|
                  |%%_LBloou07T_apply|
                  |%%_LB_rq107T_old-eval|)
                (#%begin
                  (with-failure-continuation
                    (#%lambda #t
                      (|%%_LBrT5z47T_m| |%%_LBNP3057T_e|)
                      (|%%_LBL-9F37T_old-ie|
                        |%%_LBndiR17T_interaction-environment|)
                      (#%begin
                        (|%%_LBndiR17T_interaction-environment|
                          |%%_LBL-9F37T_old-ie|)
                        (throw |%%_LBrT5z47T_m| |%%_LBNP3057T_e|)))
                    (#%lambda #t
                      ()
                      (|%%_LB5X7647T_source|
                        |%%_LBL-9F37T_old-ie|
                        |%%_LBp2cc37T_optimizer|
                        |%%_LB36eL27T_x|
                        |%%_LBndiR17T_interaction-environment|
                        |%%_LB1hko17T_sc-expand|
                        |%%_LBHkmX07T__analyze!|)
                      (#%set! |%%_LB5X7647T_source|
                        (|%%_LBHkmX07T__analyze!|
                          (|%%_LBp2cc37T_optimizer|
                            (|%%_LB1hko17T_sc-expand|
                              |%%_LB36eL27T_x|
                              (#%quote (e))
                              (#%quote (e))))
                          (|%%_LBndiR17T_interaction-environment|
                            |%%_LBL-9F37T_old-ie|)))))
                  (|%%_LBloou07T_apply|
                    |%%_LB_rq107T_old-eval|
                    |%%_LB5X7647T_source|
                    |%%_LBJ9gi27T_env|)))
              (current-optimizer)
              (|%%_LBloou07T_apply|
                |%%_LBndiR17T_interaction-environment|
                |%%_LBJ9gi27T_env|)
              #f)))))
     eval
     apply
     _analyze!
     sc-expand
     interaction-environment)))
