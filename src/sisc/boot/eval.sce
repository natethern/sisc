(#%program
  ((|x_sSiFKCAMw| . 1) (_make-parameter . 1))
  ()
  (_make-parameter)
  (#%define current-optimizer
    (_make-parameter
      (#%lambda #t (|x_sSiFKCAMw|) () |x_sSiFKCAMw|))))
(#%program
  ((interaction-environment . 1)
   (sc-expand . 1)
   (_analyze! . 1)
   (apply . 1)
   (current-optimizer . 1)
   (|sc-expand_sSGqCqCMw| . 1)
   (|optimizer_sS2cueEMw| . 1)
   (|source_sSK4q8FMw| . 2)
   (|e_sSqZl2GMw| . 1)
   (|m_sS41oBFMw| . 1)
   (throw . 1)
   (|old-ie_sSo8sHEMw| . 2)
   (with-failure-continuation . 1)
   (error . 1)
   (strict-r5rs-compliance . 1)
   (|interaction-environment_sS0nATCMw| . 4)
   (|env_sSmjykDMw| . 6)
   (null? . 2)
   (cadr . 2)
   (|_analyze!_sSkuEZBMw| . 2)
   (equal? . 1)
   (|old-eval_sSEBI3BMw| . 2)
   (|apply_sS-xGwBMw| . 3)
   (car . 3)
   (member . 1)
   (|x_sSIfwNDMw| . 6)
   (pair? . 1)
   (eval . 2))
  ((|source_sSK4q8FMw| . 1) (eval . 1))
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
       (|old-eval_sSEBI3BMw|
         |apply_sS-xGwBMw|
         |_analyze!_sSkuEZBMw|
         |sc-expand_sSGqCqCMw|
         |interaction-environment_sS0nATCMw|)
       ()
       (#%lambda #t
         (|x_sSIfwNDMw| . |env_sSmjykDMw|)
         (|interaction-environment_sS0nATCMw|
           |sc-expand_sSGqCqCMw|
           |_analyze!_sSkuEZBMw|
           |apply_sS-xGwBMw|
           |old-eval_sSEBI3BMw|)
         (#%if (#%if (pair? |x_sSIfwNDMw|)
                 (member
                   (car |x_sSIfwNDMw|)
                   (#%quote ("noexpand" "analyzeonly")))
                 #f)
           (|apply_sS-xGwBMw|
             |old-eval_sSEBI3BMw|
             (#%if (equal? (car |x_sSIfwNDMw|) "analyzeonly")
               (|_analyze!_sSkuEZBMw|
                 (cadr |x_sSIfwNDMw|)
                 (#%if (null? |env_sSmjykDMw|)
                   (|interaction-environment_sS0nATCMw|)
                   (car |env_sSmjykDMw|)))
               (cadr |x_sSIfwNDMw|))
             |env_sSmjykDMw|)
           (#%if (#%if (null? |env_sSmjykDMw|)
                   (strict-r5rs-compliance)
                   #f)
             (error (#%quote eval)
                    "expected 2 arguments to procedure, got 1.")
             ((#%lambda #t
                (|optimizer_sS2cueEMw|
                  |old-ie_sSo8sHEMw|
                  |source_sSK4q8FMw|)
                (|env_sSmjykDMw|
                  |x_sSIfwNDMw|
                  |interaction-environment_sS0nATCMw|
                  |sc-expand_sSGqCqCMw|
                  |_analyze!_sSkuEZBMw|
                  |apply_sS-xGwBMw|
                  |old-eval_sSEBI3BMw|)
                (#%begin
                  (with-failure-continuation
                    (#%lambda #t
                      (|m_sS41oBFMw| |e_sSqZl2GMw|)
                      (|old-ie_sSo8sHEMw|
                        |interaction-environment_sS0nATCMw|)
                      (#%begin
                        (|interaction-environment_sS0nATCMw|
                          |old-ie_sSo8sHEMw|)
                        (throw |m_sS41oBFMw| |e_sSqZl2GMw|)))
                    (#%lambda #t
                      ()
                      (|source_sSK4q8FMw|
                        |old-ie_sSo8sHEMw|
                        |optimizer_sS2cueEMw|
                        |x_sSIfwNDMw|
                        |interaction-environment_sS0nATCMw|
                        |sc-expand_sSGqCqCMw|
                        |_analyze!_sSkuEZBMw|)
                      (#%set! |source_sSK4q8FMw|
                        (|_analyze!_sSkuEZBMw|
                          (|optimizer_sS2cueEMw|
                            (|sc-expand_sSGqCqCMw|
                              |x_sSIfwNDMw|
                              (#%quote (e))
                              (#%quote (e))))
                          (|interaction-environment_sS0nATCMw|
                            |old-ie_sSo8sHEMw|)))))
                  (|apply_sS-xGwBMw|
                    |old-eval_sSEBI3BMw|
                    |source_sSK4q8FMw|
                    |env_sSmjykDMw|)))
              (current-optimizer)
              (|apply_sS-xGwBMw|
                |interaction-environment_sS0nATCMw|
                |env_sSmjykDMw|)
              #f)))))
     eval
     apply
     _analyze!
     sc-expand
     interaction-environment)))
