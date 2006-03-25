(#%program
  ((|%%_LqfGLOgwr_x| . 1)
   (_make-parameter . 1)
   ($sc-put-cte . 1))
  ()
  ($sc-put-cte _make-parameter)
  (#%begin
    ($sc-put-cte
      'current-optimizer
      (#%quote (global . current-optimizer)))
    (#%annotate
      (#%define current-optimizer
        (#%annotate
          (_make-parameter
            (#%annotate
              (#%lambda #t
                (|%%_LqfGLOgwr_x|)
                ()
                |%%_LqfGLOgwr_x|)
              ((line-number . 36)
               (column-number . 44)
               (source-file
                 .
                 "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm"))))
          ((line-number . 36)
           (column-number . 27)
           (source-file
             .
             "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm"))))
      ((line-number . 36)
       (column-number . 1)
       (source-file
         .
         "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))))
(#%program
  ((_with-environment . 1) ($sc-put-cte . 1))
  ()
  (_with-environment $sc-put-cte)
  (#%begin
    ($sc-put-cte
      'with-environment
      (#%quote (global . with-environment)))
    (#%define with-environment _with-environment)))
(#%program
  ((car . 1)
   (interaction-environment . 1)
   (|%%_LqXyHIhwr_env| . 2)
   (null? . 1)
   (current-optimizer . 1)
   (_analyze! . 1)
   (|%%_LqBCJfhwr_old-compile| . 1)
   (|%%_LqhvF9iwr_x| . 1)
   (sc-expand . 1)
   (|%%_LqDrDCiwr_source| . 2)
   (|%%_LqZnB3jwr_env| . 3)
   (with-environment . 1)
   (compile . 2))
  ((|%%_LqDrDCiwr_source| . 1) (compile . 1))
  (compile
    current-optimizer
    _analyze!
    with-environment
    sc-expand
    car
    interaction-environment
    null?)
  (#%set! compile
    ((#%lambda #t
       (|%%_LqBCJfhwr_old-compile|)
       ()
       (#%lambda #t
         (|%%_LqhvF9iwr_x| . |%%_LqXyHIhwr_env|)
         (|%%_LqBCJfhwr_old-compile|)
         ((#%lambda #t
            (|%%_LqDrDCiwr_source| |%%_LqZnB3jwr_env|)
            (|%%_LqhvF9iwr_x| |%%_LqBCJfhwr_old-compile|)
            (#%begin
              (with-environment
                |%%_LqZnB3jwr_env|
                (#%lambda #t
                  ()
                  (|%%_LqDrDCiwr_source| |%%_LqhvF9iwr_x|)
                  (#%set! |%%_LqDrDCiwr_source|
                    (sc-expand
                      |%%_LqhvF9iwr_x|
                      (#%quote (e))
                      (#%quote (e))))))
              (|%%_LqBCJfhwr_old-compile|
                (_analyze!
                  ((current-optimizer) |%%_LqDrDCiwr_source|)
                  |%%_LqZnB3jwr_env|)
                |%%_LqZnB3jwr_env|)))
          #f
          (#%if (null? |%%_LqXyHIhwr_env|)
            (interaction-environment)
            (car |%%_LqXyHIhwr_env|)))))
     compile)))
(#%program
  ((compile . 1)
   (error . 1)
   (strict-r5rs-compliance . 1)
   (interaction-environment . 1)
   (|%%_LqFgxZjwr_env| . 5)
   (null? . 2)
   (cadr . 2)
   (_analyze! . 1)
   (equal? . 1)
   (|%%_Lqjkzwjwr_old-eval| . 1)
   (apply . 2)
   (car . 3)
   (member . 1)
   (|%%_Lq_cvqkwr_x| . 6)
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
       (|%%_Lqjkzwjwr_old-eval|)
       ()
       (#%lambda #t
         (|%%_Lq_cvqkwr_x| . |%%_LqFgxZjwr_env|)
         (|%%_Lqjkzwjwr_old-eval|)
         (#%if (#%if (pair? |%%_Lq_cvqkwr_x|)
                 (member
                   (car |%%_Lq_cvqkwr_x|)
                   (#%quote ("noexpand" "analyzeonly")))
                 #f)
           (apply |%%_Lqjkzwjwr_old-eval|
                  (#%if (equal? (car |%%_Lq_cvqkwr_x|) "analyzeonly")
                    (_analyze!
                      (cadr |%%_Lq_cvqkwr_x|)
                      (#%if (null? |%%_LqFgxZjwr_env|)
                        (interaction-environment)
                        (car |%%_LqFgxZjwr_env|)))
                    (cadr |%%_Lq_cvqkwr_x|))
                  |%%_LqFgxZjwr_env|)
           (#%if (#%if (null? |%%_LqFgxZjwr_env|)
                   (strict-r5rs-compliance)
                   #f)
             (error (#%quote eval)
                    "expected 2 arguments to procedure, got 1.")
             ((apply compile
                     |%%_Lq_cvqkwr_x|
                     |%%_LqFgxZjwr_env|))))))
     eval)))
