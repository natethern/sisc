(#%program
  ((|x_IMdGot96F| . 1) (_make-parameter . 1))
  ()
  (_make-parameter)
  (#%define current-optimizer
    (_make-parameter
      (#%lambda #t (|x_IMdGot96F|) () |x_IMdGot96F|))))
(#%program
  ((interaction-environment . 1)
   (sc-expand . 1)
   (_analyze! . 1)
   (apply . 1)
   (current-optimizer . 1)
   (|sc-expand_IMBrghb6F| . 1)
   (|optimizer_IMZc85d6F| . 1)
   (|source_IMF54_d6F| . 2)
   (|e_IMl-_Ue6F| . 1)
   (|m_IM_12se6F| . 1)
   (throw . 1)
   (|old-ie_IMj96yd6F| . 2)
   (with-failure-continuation . 1)
   (error . 1)
   (strict-r5rs-compliance . 1)
   (|interaction-environment_IMXneKb6F| . 4)
   (|env_IMhkcbc6F| . 6)
   (null? . 2)
   (cadr . 2)
   (|_analyze!_IMfviQa6F| . 2)
   (equal? . 1)
   (|old-eval_IMzCmW96F| . 2)
   (|apply_IMVykna6F| . 3)
   (car . 3)
   (member . 1)
   (|x_IMDgaEc6F| . 6)
   (pair? . 1)
   (eval . 2))
  ((|source_IMF54_d6F| . 1) (eval . 1))
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
       (|old-eval_IMzCmW96F|
         |apply_IMVykna6F|
         |_analyze!_IMfviQa6F|
         |sc-expand_IMBrghb6F|
         |interaction-environment_IMXneKb6F|)
       ()
       (#%lambda #t
         (|x_IMDgaEc6F| . |env_IMhkcbc6F|)
         (|interaction-environment_IMXneKb6F|
           |sc-expand_IMBrghb6F|
           |_analyze!_IMfviQa6F|
           |apply_IMVykna6F|
           |old-eval_IMzCmW96F|)
         (#%if (#%if (pair? |x_IMDgaEc6F|)
                 (member
                   (car |x_IMDgaEc6F|)
                   (#%quote ("noexpand" "analyzeonly")))
                 #f)
           (|apply_IMVykna6F|
             |old-eval_IMzCmW96F|
             (#%if (equal? (car |x_IMDgaEc6F|) "analyzeonly")
               (|_analyze!_IMfviQa6F|
                 (cadr |x_IMDgaEc6F|)
                 (#%if (null? |env_IMhkcbc6F|)
                   (|interaction-environment_IMXneKb6F|)
                   (car |env_IMhkcbc6F|)))
               (cadr |x_IMDgaEc6F|))
             |env_IMhkcbc6F|)
           (#%if (#%if (null? |env_IMhkcbc6F|)
                   (strict-r5rs-compliance)
                   #f)
             (error (#%quote eval)
                    "expected 2 arguments to procedure, got 1.")
             ((#%lambda #t
                (|optimizer_IMZc85d6F|
                  |old-ie_IMj96yd6F|
                  |source_IMF54_d6F|)
                (|env_IMhkcbc6F|
                  |x_IMDgaEc6F|
                  |interaction-environment_IMXneKb6F|
                  |sc-expand_IMBrghb6F|
                  |_analyze!_IMfviQa6F|
                  |apply_IMVykna6F|
                  |old-eval_IMzCmW96F|)
                (#%begin
                  (with-failure-continuation
                    (#%lambda #t
                      (|m_IM_12se6F| |e_IMl-_Ue6F|)
                      (|old-ie_IMj96yd6F|
                        |interaction-environment_IMXneKb6F|)
                      (#%begin
                        (|interaction-environment_IMXneKb6F|
                          |old-ie_IMj96yd6F|)
                        (throw |m_IM_12se6F| |e_IMl-_Ue6F|)))
                    (#%lambda #t
                      ()
                      (|source_IMF54_d6F|
                        |old-ie_IMj96yd6F|
                        |optimizer_IMZc85d6F|
                        |x_IMDgaEc6F|
                        |interaction-environment_IMXneKb6F|
                        |sc-expand_IMBrghb6F|
                        |_analyze!_IMfviQa6F|)
                      (#%set! |source_IMF54_d6F|
                        (|_analyze!_IMfviQa6F|
                          (|optimizer_IMZc85d6F|
                            (|sc-expand_IMBrghb6F|
                              |x_IMDgaEc6F|
                              (#%quote (e))
                              (#%quote (e))))
                          (|interaction-environment_IMXneKb6F|
                            |old-ie_IMj96yd6F|)))))
                  (|apply_IMVykna6F|
                    |old-eval_IMzCmW96F|
                    |source_IMF54_d6F|
                    |env_IMhkcbc6F|)))
              (current-optimizer)
              (|apply_IMVykna6F|
                |interaction-environment_IMXneKb6F|
                |env_IMhkcbc6F|)
              #f)))))
     eval
     apply
     _analyze!
     sc-expand
     interaction-environment)))
