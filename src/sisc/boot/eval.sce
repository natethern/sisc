(#%program
  ((|%%_zkI_kk1Zk_x| . 1)
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
                (|%%_zkI_kk1Zk_x|)
                ()
                |%%_zkI_kk1Zk_x|)
              ((source-file
                 .
                 "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
               (line-number . 36)
               (column-number . 44))))
          ((source-file
             .
             "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
           (line-number . 36)
           (column-number . 27))))
      ((source-file
         .
         "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
       (line-number . 36)
       (column-number . 1)))))
(#%program
  ((_with-environment . 1) ($sc-put-cte . 1))
  ()
  (_with-environment $sc-put-cte)
  (#%begin
    ($sc-put-cte
      'with-environment
      (#%quote (global . with-environment)))
    (#%annotate
      (#%define with-environment _with-environment)
      ((source-file
         .
         "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
       (line-number . 39)
       (column-number . 1)))))
(#%program
  ((compile . 1)
   (car . 1)
   (interaction-environment . 1)
   (|%%_zkoUge2Zk_env| . 2)
   (null? . 1)
   (current-optimizer . 1)
   (_analyze! . 1)
   (|%%_zk2YiN1Zk_old-compile| . 1)
   (|%%_zkKQeH2Zk_flags| . 1)
   (|%%_zk4Nc83Zk_expr| . 1)
   (sc-expand . 1)
   (apply . 1)
   (|%%_zkqJaB3Zk_source| . 2)
   (|%%_zkMF824Zk_env| . 3)
   (with-environment . 1)
   ($sc-put-cte . 1))
  ((|%%_zkqJaB3Zk_source| . 1))
  (compile
    $sc-put-cte
    current-optimizer
    _analyze!
    with-environment
    apply
    sc-expand
    car
    interaction-environment
    null?)
  (#%begin
    ($sc-put-cte
      'compile-with-flags
      (#%quote (global . compile-with-flags)))
    (#%annotate
      (#%define compile-with-flags
        ((#%lambda #t
           (|%%_zk2YiN1Zk_old-compile|)
           ()
           (#%annotate
             (#%lambda #t
               (|%%_zk4Nc83Zk_expr|
                 |%%_zkKQeH2Zk_flags|
                 .
                 |%%_zkoUge2Zk_env|)
               (|%%_zk2YiN1Zk_old-compile|)
               ((#%lambda #t
                  (|%%_zkqJaB3Zk_source| |%%_zkMF824Zk_env|)
                  (|%%_zkKQeH2Zk_flags|
                    |%%_zk4Nc83Zk_expr|
                    |%%_zk2YiN1Zk_old-compile|)
                  (#%begin
                    (#%annotate
                      (with-environment
                        |%%_zkMF824Zk_env|
                        (#%annotate
                          (#%lambda #t
                            ()
                            (|%%_zkqJaB3Zk_source|
                              |%%_zkKQeH2Zk_flags|
                              |%%_zk4Nc83Zk_expr|)
                            (#%annotate
                              (#%set! |%%_zkqJaB3Zk_source|
                                (#%annotate
                                  (apply sc-expand
                                         |%%_zk4Nc83Zk_expr|
                                         |%%_zkKQeH2Zk_flags|)
                                  ((source-file
                                     .
                                     "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                                   (line-number . 50)
                                   (column-number . 26))))
                              ((source-file
                                 .
                                 "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                               (line-number . 50)
                               (column-number . 13))))
                          ((source-file
                             .
                             "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                           (line-number . 49)
                           (column-number . 11))))
                      ((source-file
                         .
                         "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                       (line-number . 48)
                       (column-number . 9)))
                    (#%annotate
                      (|%%_zk2YiN1Zk_old-compile|
                        (#%annotate
                          (_analyze!
                            (#%annotate
                              ((#%annotate
                                 (current-optimizer)
                                 ((source-file
                                    .
                                    "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                                  (line-number . 52)
                                  (column-number . 23)))
                               |%%_zkqJaB3Zk_source|)
                              ((source-file
                                 .
                                 "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                               (line-number . 52)
                               (column-number . 22)))
                            |%%_zkMF824Zk_env|)
                          ((source-file
                             .
                             "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                           (line-number . 52)
                           (column-number . 11)))
                        |%%_zkMF824Zk_env|)
                      ((source-file
                         .
                         "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                       (line-number . 51)
                       (column-number . 9)))))
                #f
                (#%annotate
                  (#%if (#%annotate
                          (null? |%%_zkoUge2Zk_env|)
                          ((source-file
                             .
                             "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                           (line-number . 45)
                           (column-number . 22)))
                    (#%annotate
                      (interaction-environment)
                      ((source-file
                         .
                         "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                       (line-number . 46)
                       (column-number . 22)))
                    (#%annotate
                      (car |%%_zkoUge2Zk_env|)
                      ((source-file
                         .
                         "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                       (line-number . 47)
                       (column-number . 22))))
                  ((source-file
                     .
                     "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                   (line-number . 45)
                   (column-number . 18)))))
             ((source-file
                .
                "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
              (line-number . 43)
              (column-number . 5))))
         compile))
      ((source-file
         .
         "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
       (line-number . 41)
       (column-number . 1)))))
(#%program
  ((|%%_zk6C6v4Zk_env| . 1)
   (|%%_zksy4Y4Zk_expr| . 1)
   (compile-with-flags . 1)
   (apply . 1)
   (compile . 1))
  ((compile . 1))
  (compile-with-flags apply)
  (#%annotate
    (#%set! compile
      (#%annotate
        (#%lambda #t
          (|%%_zksy4Y4Zk_expr| . |%%_zk6C6v4Zk_env|)
          ()
          (#%annotate
            (apply compile-with-flags
                   |%%_zksy4Y4Zk_expr|
                   (#%quote ((l) (l)))
                   |%%_zk6C6v4Zk_env|)
            ((source-file
               .
               "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
             (line-number . 57)
             (column-number . 5))))
        ((source-file
           .
           "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
         (line-number . 56)
         (column-number . 3))))
    ((source-file
       .
       "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
     (line-number . 55)
     (column-number . 1))))
(#%program
  ((compile-with-flags . 1)
   (error . 1)
   (strict-r5rs-compliance . 1)
   (interaction-environment . 1)
   (|%%_zk8r0S5Zk_env| . 5)
   (null? . 2)
   (cadr . 2)
   (_analyze! . 1)
   (equal? . 1)
   (|%%_zkOu2p5Zk_old-eval| . 1)
   (apply . 2)
   (car . 3)
   (member . 1)
   (|%%_zkun-i6Zk_x| . 6)
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
        compile-with-flags
        error
        strict-r5rs-compliance)
  (#%annotate
    (#%set! eval
      ((#%lambda #t
         (|%%_zkOu2p5Zk_old-eval|)
         ()
         (#%annotate
           (#%lambda #t
             (|%%_zkun-i6Zk_x| . |%%_zk8r0S5Zk_env|)
             (|%%_zkOu2p5Zk_old-eval|)
             (#%if (#%if (#%annotate
                           (pair? |%%_zkun-i6Zk_x|)
                           ((source-file
                              .
                              "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                            (line-number . 62)
                            (column-number . 19)))
                     (#%annotate
                       (member
                         (#%annotate
                           (car |%%_zkun-i6Zk_x|)
                           ((source-file
                              .
                              "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                            (line-number . 62)
                            (column-number . 37)))
                         (#%quote ("noexpand" "analyzeonly")))
                       ((source-file
                          .
                          "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                        (line-number . 62)
                        (column-number . 29)))
                     #f)
               (#%annotate
                 (apply |%%_zkOu2p5Zk_old-eval|
                        (#%annotate
                          (#%if (#%annotate
                                  (equal?
                                    (#%annotate
                                      (car |%%_zkun-i6Zk_x|)
                                      ((source-file
                                         .
                                         "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                                       (line-number . 64)
                                       (column-number . 33)))
                                    "analyzeonly")
                                  ((source-file
                                     .
                                     "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                                   (line-number . 64)
                                   (column-number . 25)))
                            (#%annotate
                              (_analyze!
                                (#%annotate
                                  (cadr |%%_zkun-i6Zk_x|)
                                  ((source-file
                                     .
                                     "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                                   (line-number . 65)
                                   (column-number . 36)))
                                (#%annotate
                                  (#%if (#%annotate
                                          (null? |%%_zk8r0S5Zk_env|)
                                          ((source-file
                                             .
                                             "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                                           (line-number . 66)
                                           (column-number . 40)))
                                    (#%annotate
                                      (interaction-environment)
                                      ((source-file
                                         .
                                         "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                                       (line-number . 67)
                                       (column-number . 40)))
                                    (#%annotate
                                      (car |%%_zk8r0S5Zk_env|)
                                      ((source-file
                                         .
                                         "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                                       (line-number . 68)
                                       (column-number . 40))))
                                  ((source-file
                                     .
                                     "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                                   (line-number . 66)
                                   (column-number . 36))))
                              ((source-file
                                 .
                                 "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                               (line-number . 65)
                               (column-number . 25)))
                            (#%annotate
                              (cadr |%%_zkun-i6Zk_x|)
                              ((source-file
                                 .
                                 "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                               (line-number . 69)
                               (column-number . 25))))
                          ((source-file
                             .
                             "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                           (line-number . 64)
                           (column-number . 21)))
                        |%%_zk8r0S5Zk_env|)
                 ((source-file
                    .
                    "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                  (line-number . 63)
                  (column-number . 14)))
               (#%if (#%if (#%annotate
                             (null? |%%_zk8r0S5Zk_env|)
                             ((source-file
                                .
                                "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                              (line-number . 70)
                              (column-number . 19)))
                       (#%annotate
                         (strict-r5rs-compliance)
                         ((source-file
                            .
                            "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                          (line-number . 70)
                          (column-number . 31)))
                       #f)
                 (#%annotate
                   (error (#%quote eval)
                          "expected 2 arguments to procedure, got 1.")
                   ((source-file
                      .
                      "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                    (line-number . 71)
                    (column-number . 14)))
                 (#%annotate
                   ((#%annotate
                      (apply compile-with-flags
                             |%%_zkun-i6Zk_x|
                             (#%quote ((e) (e)))
                             |%%_zk8r0S5Zk_env|)
                      ((source-file
                         .
                         "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                       (line-number . 73)
                       (column-number . 16))))
                   ((source-file
                      .
                      "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
                    (line-number . 73)
                    (column-number . 15))))))
           ((source-file
              .
              "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
            (line-number . 61)
            (column-number . 5))))
       eval))
    ((source-file
       .
       "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")
     (line-number . 59)
     (column-number . 1))))
