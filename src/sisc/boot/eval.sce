(#%program
  ((|x_KentM2UOe| . 1) (_make-parameter . 1))
  ()
  (_make-parameter)
  (#%define current-optimizer
    (_make-parameter
      (#%lambda #t (|x_KentM2UOe|) () |x_KentM2UOe|))))
(#%program
  ((interaction-environment . 1)
   (sc-expand . 1)
   (_analyze! . 1)
   (apply . 1)
   (current-optimizer . 1)
   (|sc-expand_KeLeESVOe| . 1)
   (|optimizer_Ke70wGXOe| . 1)
   (|source_KePUrAYOe| . 2)
   (|e_KevNnuZOe| . 1)
   (|m_Ke9Rp1ZOe| . 1)
   (throw . 1)
   (|old-ie_KetYt7YOe| . 2)
   (with-failure-continuation . 1)
   (error . 1)
   (strict-r5rs-compliance . 1)
   (|interaction-environment_Ke5bCjWOe| . 4)
   (|env_Ker7AMWOe| . 6)
   (null? . 2)
   (cadr . 2)
   (|_analyze!_KepiGpVOe| . 2)
   (equal? . 1)
   (|old-eval_KeJpKvUOe| . 2)
   (|apply_Ke3mIYUOe| . 3)
   (car . 3)
   (member . 1)
   (|x_KeN3ydXOe| . 6)
   (pair? . 1)
   (eval . 2))
  ((|source_KePUrAYOe| . 1) (eval . 1))
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
       (|old-eval_KeJpKvUOe|
         |apply_Ke3mIYUOe|
         |_analyze!_KepiGpVOe|
         |sc-expand_KeLeESVOe|
         |interaction-environment_Ke5bCjWOe|)
       ()
       (#%lambda #t
         (|x_KeN3ydXOe| . |env_Ker7AMWOe|)
         (|interaction-environment_Ke5bCjWOe|
           |sc-expand_KeLeESVOe|
           |_analyze!_KepiGpVOe|
           |apply_Ke3mIYUOe|
           |old-eval_KeJpKvUOe|)
         (#%if (#%if (pair? |x_KeN3ydXOe|)
                 (member
                   (car |x_KeN3ydXOe|)
                   (#%quote ("noexpand" "analyzeonly")))
                 #f)
           (|apply_Ke3mIYUOe|
             |old-eval_KeJpKvUOe|
             (#%if (equal? (car |x_KeN3ydXOe|) "analyzeonly")
               (|_analyze!_KepiGpVOe|
                 (cadr |x_KeN3ydXOe|)
                 (#%if (null? |env_Ker7AMWOe|)
                   (|interaction-environment_Ke5bCjWOe|)
                   (car |env_Ker7AMWOe|)))
               (cadr |x_KeN3ydXOe|))
             |env_Ker7AMWOe|)
           (#%if (#%if (null? |env_Ker7AMWOe|)
                   (strict-r5rs-compliance)
                   #f)
             (error (#%quote eval)
                    "expected 2 arguments to procedure, got 1.")
             ((#%lambda #t
                (|optimizer_Ke70wGXOe|
                  |old-ie_KetYt7YOe|
                  |source_KePUrAYOe|)
                (|env_Ker7AMWOe|
                  |x_KeN3ydXOe|
                  |interaction-environment_Ke5bCjWOe|
                  |sc-expand_KeLeESVOe|
                  |_analyze!_KepiGpVOe|
                  |apply_Ke3mIYUOe|
                  |old-eval_KeJpKvUOe|)
                (#%begin
                  (with-failure-continuation
                    (#%lambda #t
                      (|m_Ke9Rp1ZOe| |e_KevNnuZOe|)
                      (|old-ie_KetYt7YOe|
                        |interaction-environment_Ke5bCjWOe|)
                      (#%begin
                        (|interaction-environment_Ke5bCjWOe|
                          |old-ie_KetYt7YOe|)
                        (throw |m_Ke9Rp1ZOe| |e_KevNnuZOe|)))
                    (#%lambda #t
                      ()
                      (|source_KePUrAYOe|
                        |old-ie_KetYt7YOe|
                        |optimizer_Ke70wGXOe|
                        |x_KeN3ydXOe|
                        |interaction-environment_Ke5bCjWOe|
                        |sc-expand_KeLeESVOe|
                        |_analyze!_KepiGpVOe|)
                      (#%set! |source_KePUrAYOe|
                        (|_analyze!_KepiGpVOe|
                          (|optimizer_Ke70wGXOe|
                            (|sc-expand_KeLeESVOe|
                              |x_KeN3ydXOe|
                              (#%quote (e))
                              (#%quote (e))))
                          (|interaction-environment_Ke5bCjWOe|
                            |old-ie_KetYt7YOe|)))))
                  (|apply_Ke3mIYUOe|
                    |old-eval_KeJpKvUOe|
                    |source_KePUrAYOe|
                    |env_Ker7AMWOe|)))
              (current-optimizer)
              (|apply_Ke3mIYUOe|
                |interaction-environment_Ke5bCjWOe|
                |env_Ker7AMWOe|)
              #f)))))
     eval
     apply
     _analyze!
     sc-expand
     interaction-environment)))
