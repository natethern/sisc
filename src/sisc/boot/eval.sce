(#%program
  ((|x_XiIU-cife| . 1) (_make-parameter . 1))
  ()
  ()
  (#%define current-optimizer
    (_make-parameter
      (#%lambda #t (|x_XiIU-cife|) () |x_XiIU-cife|))))
(#%program
  ((interaction-environment . 1)
   (sc-expand . 1)
   (_analyze! . 1)
   (apply . 1)
   (current-optimizer . 1)
   (|sc-expand_Xi4GS0kfe| . 1)
   (|optimizer_XisrKQlfe| . 1)
   (|_analyze!_XiKJUzjfe| . 1)
   (|source_Xi8kGKmfe| . 2)
   (|e_XiQcCEnfe| . 1)
   (|m_XiugEbnfe| . 1)
   (throw . 1)
   (|old-ie_XiOnIhmfe| . 2)
   (|interaction-environment_XiqCQtkfe| . 3)
   (with-failure-continuation . 1)
   (error . 1)
   (strict-r5rs-compliance . 1)
   (null? . 1)
   (equal? . 1)
   (list . 1)
   (|env_XiMyOWkfe| . 4)
   (append . 1)
   (cadr . 1)
   (|old-eval_Xi2RYFife| . 2)
   (|apply_XioNW6jfe| . 3)
   (car . 2)
   (member . 1)
   (|x_Xi6vMnlfe| . 5)
   (pair? . 1)
   (eval . 2))
  ((|source_Xi8kGKmfe| . 1) (eval . 1))
  (member
    car
    pair?
    append
    equal?
    list
    cadr
    with-failure-continuation
    throw
    current-optimizer
    error
    null?
    strict-r5rs-compliance)
  (#%set! eval
    ((#%lambda #t
       (|old-eval_Xi2RYFife|
         |apply_XioNW6jfe|
         |_analyze!_XiKJUzjfe|
         |sc-expand_Xi4GS0kfe|
         |interaction-environment_XiqCQtkfe|)
       ()
       (#%lambda #t
         (|x_Xi6vMnlfe| . |env_XiMyOWkfe|)
         (|interaction-environment_XiqCQtkfe|
           |sc-expand_Xi4GS0kfe|
           |_analyze!_XiKJUzjfe|
           |apply_XioNW6jfe|
           |old-eval_Xi2RYFife|)
         (#%if (#%if (pair? |x_Xi6vMnlfe|)
                 (member
                   (car |x_Xi6vMnlfe|)
                   (#%quote ("noexpand" "analyzeonly")))
                 #f)
           (|apply_XioNW6jfe|
             |old-eval_Xi2RYFife|
             (cadr |x_Xi6vMnlfe|)
             (append
               |env_XiMyOWkfe|
               (list (equal? (car |x_Xi6vMnlfe|) "analyzeonly"))))
           (#%if (#%if (null? |env_XiMyOWkfe|)
                   (strict-r5rs-compliance)
                   #f)
             (error (#%quote eval)
                    "expected 2 arguments to procedure, got 1.")
             ((#%lambda #t
                (|optimizer_XisrKQlfe|
                  |old-ie_XiOnIhmfe|
                  |source_Xi8kGKmfe|)
                (|env_XiMyOWkfe|
                  |x_Xi6vMnlfe|
                  |interaction-environment_XiqCQtkfe|
                  |sc-expand_Xi4GS0kfe|
                  |_analyze!_XiKJUzjfe|
                  |apply_XioNW6jfe|
                  |old-eval_Xi2RYFife|)
                (#%begin
                  (with-failure-continuation
                    (#%lambda #t
                      (|m_XiugEbnfe| |e_XiQcCEnfe|)
                      (|old-ie_XiOnIhmfe|
                        |interaction-environment_XiqCQtkfe|)
                      (#%begin
                        (|interaction-environment_XiqCQtkfe|
                          |old-ie_XiOnIhmfe|)
                        (throw |m_XiugEbnfe| |e_XiQcCEnfe|)))
                    (#%lambda #t
                      ()
                      (|source_Xi8kGKmfe|
                        |old-ie_XiOnIhmfe|
                        |optimizer_XisrKQlfe|
                        |x_Xi6vMnlfe|
                        |interaction-environment_XiqCQtkfe|
                        |sc-expand_Xi4GS0kfe|
                        |_analyze!_XiKJUzjfe|)
                      (#%set! |source_Xi8kGKmfe|
                        (|_analyze!_XiKJUzjfe|
                          (|optimizer_XisrKQlfe|
                            (|sc-expand_Xi4GS0kfe|
                              |x_Xi6vMnlfe|
                              (#%quote (e))
                              (#%quote (e))))
                          (|interaction-environment_XiqCQtkfe|
                            |old-ie_XiOnIhmfe|)))))
                  (|apply_XioNW6jfe|
                    |old-eval_Xi2RYFife|
                    |source_Xi8kGKmfe|
                    |env_XiMyOWkfe|)))
              (current-optimizer)
              (|apply_XioNW6jfe|
                |interaction-environment_XiqCQtkfe|
                |env_XiMyOWkfe|)
              #f)))))
     eval
     apply
     _analyze!
     sc-expand
     interaction-environment)))
