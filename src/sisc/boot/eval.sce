(#%program
  ((|x_1QdBPpN5O| . 1) (_make-parameter . 1))
  ()
  (_make-parameter)
  (#%define current-optimizer
    (_make-parameter
      (#%lambda #t (|x_1QdBPpN5O|) () |x_1QdBPpN5O|))))
(#%program
  ((interaction-environment . 1)
   (sc-expand . 1)
   (_analyze! . 1)
   (apply . 1)
   (current-optimizer . 1)
   (|sc-expand_1QBmHdP5O| . 1)
   (|optimizer_1QZ7z1R5O| . 1)
   (|source_1QF0vXR5O| . 2)
   (|e_1QlVqRS5O| . 1)
   (|m_1Q_YsoS5O| . 1)
   (throw . 1)
   (|old-ie_1Qj4xuR5O| . 2)
   (with-failure-continuation . 1)
   (error . 1)
   (strict-r5rs-compliance . 1)
   (|interaction-environment_1QXiFGP5O| . 4)
   (|env_1QhfD7Q5O| . 6)
   (null? . 2)
   (cadr . 2)
   (|_analyze!_1QfqJMO5O| . 2)
   (equal? . 1)
   (|old-eval_1QzxNSN5O| . 2)
   (|apply_1QVtLjO5O| . 3)
   (car . 3)
   (member . 1)
   (|x_1QDbBAQ5O| . 6)
   (pair? . 1)
   (eval . 2))
  ((|source_1QF0vXR5O| . 1) (eval . 1))
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
       (|old-eval_1QzxNSN5O|
         |apply_1QVtLjO5O|
         |_analyze!_1QfqJMO5O|
         |sc-expand_1QBmHdP5O|
         |interaction-environment_1QXiFGP5O|)
       ()
       (#%lambda #t
         (|x_1QDbBAQ5O| . |env_1QhfD7Q5O|)
         (|interaction-environment_1QXiFGP5O|
           |sc-expand_1QBmHdP5O|
           |_analyze!_1QfqJMO5O|
           |apply_1QVtLjO5O|
           |old-eval_1QzxNSN5O|)
         (#%if (#%if (pair? |x_1QDbBAQ5O|)
                 (member
                   (car |x_1QDbBAQ5O|)
                   (#%quote ("noexpand" "analyzeonly")))
                 #f)
           (|apply_1QVtLjO5O|
             |old-eval_1QzxNSN5O|
             (#%if (equal? (car |x_1QDbBAQ5O|) "analyzeonly")
               (|_analyze!_1QfqJMO5O|
                 (cadr |x_1QDbBAQ5O|)
                 (#%if (null? |env_1QhfD7Q5O|)
                   (|interaction-environment_1QXiFGP5O|)
                   (car |env_1QhfD7Q5O|)))
               (cadr |x_1QDbBAQ5O|))
             |env_1QhfD7Q5O|)
           (#%if (#%if (null? |env_1QhfD7Q5O|)
                   (strict-r5rs-compliance)
                   #f)
             (error (#%quote eval)
                    "expected 2 arguments to procedure, got 1.")
             ((#%lambda #t
                (|optimizer_1QZ7z1R5O|
                  |old-ie_1Qj4xuR5O|
                  |source_1QF0vXR5O|)
                (|env_1QhfD7Q5O|
                  |x_1QDbBAQ5O|
                  |interaction-environment_1QXiFGP5O|
                  |sc-expand_1QBmHdP5O|
                  |_analyze!_1QfqJMO5O|
                  |apply_1QVtLjO5O|
                  |old-eval_1QzxNSN5O|)
                (#%begin
                  (with-failure-continuation
                    (#%lambda #t
                      (|m_1Q_YsoS5O| |e_1QlVqRS5O|)
                      (|old-ie_1Qj4xuR5O|
                        |interaction-environment_1QXiFGP5O|)
                      (#%begin
                        (|interaction-environment_1QXiFGP5O|
                          |old-ie_1Qj4xuR5O|)
                        (throw |m_1Q_YsoS5O| |e_1QlVqRS5O|)))
                    (#%lambda #t
                      ()
                      (|source_1QF0vXR5O|
                        |old-ie_1Qj4xuR5O|
                        |optimizer_1QZ7z1R5O|
                        |x_1QDbBAQ5O|
                        |interaction-environment_1QXiFGP5O|
                        |sc-expand_1QBmHdP5O|
                        |_analyze!_1QfqJMO5O|)
                      (#%set! |source_1QF0vXR5O|
                        (|_analyze!_1QfqJMO5O|
                          (|optimizer_1QZ7z1R5O|
                            (|sc-expand_1QBmHdP5O|
                              |x_1QDbBAQ5O|
                              (#%quote (e))
                              (#%quote (e))))
                          (|interaction-environment_1QXiFGP5O|
                            |old-ie_1Qj4xuR5O|)))))
                  (|apply_1QVtLjO5O|
                    |old-eval_1QzxNSN5O|
                    |source_1QF0vXR5O|
                    |env_1QhfD7Q5O|)))
              (current-optimizer)
              (|apply_1QVtLjO5O|
                |interaction-environment_1QXiFGP5O|
                |env_1QhfD7Q5O|)
              #f)))))
     eval
     apply
     _analyze!
     sc-expand
     interaction-environment)))
