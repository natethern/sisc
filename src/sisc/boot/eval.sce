(#%program
  ((|x_PiFSZp43x| . 1) (_make-parameter . 1))
  ()
  ()
  (#%define current-optimizer
    (_make-parameter
      (#%lambda #t (|x_PiFSZp43x|) () |x_PiFSZp43x|))))
(#%program
  ((|apply_PilLVj53x| . 3)
   (|m_PireDo93x| . 1)
   (with-failure-continuation . 1)
   (|env_PiJwN773x| . 4)
   (|e_PiNaBR93x| . 1)
   (car . 2)
   (apply . 1)
   (strict-r5rs-compliance . 1)
   (pair? . 1)
   (|sc-expand_Pi1ERd63x| . 1)
   (sc-expand . 1)
   (|interaction-environment_PinAPG63x| . 3)
   (null? . 1)
   (list . 1)
   (|old-ie_PiLlHu83x| . 2)
   (|source_Pi5iFX83x| . 2)
   (interaction-environment . 1)
   (equal? . 1)
   (|_analyze!_PiHHTM53x| . 1)
   (|old-eval_Pi_OXS43x| . 2)
   (cadr . 1)
   (|x_Pi3tLA73x| . 5)
   (eval . 2)
   (append . 1)
   (|optimizer_PippJ183x| . 1)
   (member . 1)
   (throw . 1)
   (error . 1)
   (_analyze! . 1)
   (current-optimizer . 1))
  ((eval . 1) (|source_Pi5iFX83x| . 1))
  (equal?
    with-failure-continuation
    car
    cadr
    append
    member
    pair?
    strict-r5rs-compliance
    throw
    error
    null?
    current-optimizer
    list)
  (#%set! eval
    ((#%lambda #t
       (|old-eval_Pi_OXS43x|
         |apply_PilLVj53x|
         |_analyze!_PiHHTM53x|
         |sc-expand_Pi1ERd63x|
         |interaction-environment_PinAPG63x|)
       ()
       (#%lambda #t
         (|x_Pi3tLA73x| . |env_PiJwN773x|)
         (|old-eval_Pi_OXS43x|
           |apply_PilLVj53x|
           |_analyze!_PiHHTM53x|
           |sc-expand_Pi1ERd63x|
           |interaction-environment_PinAPG63x|)
         (#%if (#%if (pair? |x_Pi3tLA73x|)
                 (member
                   (car |x_Pi3tLA73x|)
                   (#%quote ("noexpand" "analyzeonly")))
                 #f)
           (|apply_PilLVj53x|
             |old-eval_Pi_OXS43x|
             (cadr |x_Pi3tLA73x|)
             (append
               |env_PiJwN773x|
               (list (equal? (car |x_Pi3tLA73x|) "analyzeonly"))))
           (#%if (#%if (null? |env_PiJwN773x|)
                   (strict-r5rs-compliance)
                   #f)
             (error (#%quote eval)
                    "expected 2 arguments to procedure, got 1.")
             ((#%lambda #t
                (|optimizer_PippJ183x|
                  |old-ie_PiLlHu83x|
                  |source_Pi5iFX83x|)
                (|x_Pi3tLA73x|
                  |env_PiJwN773x|
                  |old-eval_Pi_OXS43x|
                  |apply_PilLVj53x|
                  |_analyze!_PiHHTM53x|
                  |sc-expand_Pi1ERd63x|
                  |interaction-environment_PinAPG63x|)
                (#%begin
                  (with-failure-continuation
                    (#%lambda #t
                      (|m_PireDo93x| |e_PiNaBR93x|)
                      (|old-ie_PiLlHu83x|
                        |interaction-environment_PinAPG63x|)
                      (#%begin
                        (|interaction-environment_PinAPG63x|
                          |old-ie_PiLlHu83x|)
                        (throw |m_PireDo93x| |e_PiNaBR93x|)))
                    (#%lambda #t
                      ()
                      (|optimizer_PippJ183x|
                        |old-ie_PiLlHu83x|
                        |source_Pi5iFX83x|
                        |x_Pi3tLA73x|
                        |_analyze!_PiHHTM53x|
                        |sc-expand_Pi1ERd63x|
                        |interaction-environment_PinAPG63x|)
                      (#%begin
                        (#%set! |source_Pi5iFX83x|
                          (|_analyze!_PiHHTM53x|
                            (|optimizer_PippJ183x|
                              (|sc-expand_Pi1ERd63x|
                                |x_Pi3tLA73x|
                                (#%quote (e))
                                (#%quote (e))))))
                        (|interaction-environment_PinAPG63x|
                          |old-ie_PiLlHu83x|))))
                  (|apply_PilLVj53x|
                    |old-eval_Pi_OXS43x|
                    |source_Pi5iFX83x|
                    |env_PiJwN773x|)))
              (current-optimizer)
              (|apply_PilLVj53x|
                |interaction-environment_PinAPG63x|
                |env_PiJwN773x|)
              #f)))))
     eval
     apply
     _analyze!
     sc-expand
     interaction-environment)))
