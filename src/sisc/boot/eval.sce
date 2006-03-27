(#%program
  ((|%%_VlwZqUK1x_x| . 1)
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
                (|%%_VlwZqUK1x_x|)
                ()
                |%%_VlwZqUK1x_x|)
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
    (#%annotate
      (#%define with-environment _with-environment)
      ((line-number . 39)
       (column-number . 1)
       (source-file
         .
         "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))))
(#%program
  ((cadr . 1)
   (cdr . 1)
   (not . 1)
   (interaction-environment . 2)
   (car . 4)
   (environment? . 2)
   (|%%_VlcSmOL1x_args| . 8)
   (null? . 3)
   (current-optimizer . 1)
   (_analyze! . 1)
   (|%%_VlSVolL1x_old-compile| . 1)
   (|%%_VleHg9N1x_sc-expand-args| . 1)
   (|%%_VlyOkfM1x_x| . 1)
   (sc-expand . 1)
   (apply . 1)
   (|%%_VlUKiIM1x_source| . 2)
   (|%%_VlADeCN1x_env| . 3)
   (with-environment . 1)
   (compile . 2))
  ((|%%_VlUKiIM1x_source| . 1) (compile . 1))
  (compile
    current-optimizer
    _analyze!
    with-environment
    apply
    sc-expand
    null?
    car
    environment?
    cadr
    not
    cdr
    interaction-environment)
  (#%annotate
    (#%set! compile
      ((#%lambda #t
         (|%%_VlSVolL1x_old-compile|)
         ()
         (#%annotate
           (#%lambda #t
             (|%%_VlyOkfM1x_x| . |%%_VlcSmOL1x_args|)
             (|%%_VlSVolL1x_old-compile|)
             ((#%lambda #t
                (|%%_VlUKiIM1x_source|
                  |%%_VleHg9N1x_sc-expand-args|
                  |%%_VlADeCN1x_env|)
                (|%%_VlyOkfM1x_x| |%%_VlSVolL1x_old-compile|)
                (#%begin
                  (#%annotate
                    (with-environment
                      |%%_VlADeCN1x_env|
                      (#%annotate
                        (#%lambda #t
                          ()
                          (|%%_VleHg9N1x_sc-expand-args|
                            |%%_VlUKiIM1x_source|
                            |%%_VlyOkfM1x_x|)
                          (#%annotate
                            (#%set! |%%_VlUKiIM1x_source|
                              (#%annotate
                                (apply sc-expand
                                       |%%_VlyOkfM1x_x|
                                       |%%_VleHg9N1x_sc-expand-args|)
                                ((line-number . 58)
                                 (column-number . 26)
                                 (source-file
                                   .
                                   "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm"))))
                            ((line-number . 58)
                             (column-number . 13)
                             (source-file
                               .
                               "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm"))))
                        ((line-number . 57)
                         (column-number . 11)
                         (source-file
                           .
                           "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm"))))
                    ((line-number . 56)
                     (column-number . 9)
                     (source-file
                       .
                       "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))
                  (#%annotate
                    (|%%_VlSVolL1x_old-compile|
                      (#%annotate
                        (_analyze!
                          (#%annotate
                            ((#%annotate
                               (current-optimizer)
                               ((line-number . 60)
                                (column-number . 23)
                                (source-file
                                  .
                                  "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))
                             |%%_VlUKiIM1x_source|)
                            ((line-number . 60)
                             (column-number . 22)
                             (source-file
                               .
                               "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))
                          |%%_VlADeCN1x_env|)
                        ((line-number . 60)
                         (column-number . 11)
                         (source-file
                           .
                           "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))
                      |%%_VlADeCN1x_env|)
                    ((line-number . 59)
                     (column-number . 9)
                     (source-file
                       .
                       "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))))
              #f
              (#%annotate
                (#%if (#%if (#%annotate
                              (null? |%%_VlcSmOL1x_args|)
                              ((line-number . 45)
                               (column-number . 37)
                               (source-file
                                 .
                                 "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))
                        #t
                        (#%annotate
                          (environment?
                            (#%annotate
                              (car |%%_VlcSmOL1x_args|)
                              ((line-number . 46)
                               (column-number . 51)
                               (source-file
                                 .
                                 "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm"))))
                          ((line-number . 46)
                           (column-number . 37)
                           (source-file
                             .
                             "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm"))))
                  (#%quote ((l) (l)))
                  (#%annotate
                    (car |%%_VlcSmOL1x_args|)
                    ((line-number . 48)
                     (column-number . 33)
                     (source-file
                       .
                       "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm"))))
                ((line-number . 45)
                 (column-number . 29)
                 (source-file
                   .
                   "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))
              (#%if (#%annotate
                      (null? |%%_VlcSmOL1x_args|)
                      ((line-number . 49)
                       (column-number . 25)
                       (source-file
                         .
                         "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))
                (#%annotate
                  (interaction-environment)
                  ((line-number . 50)
                   (column-number . 25)
                   (source-file
                     .
                     "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))
                (#%if (#%annotate
                        (environment?
                          (#%annotate
                            (car |%%_VlcSmOL1x_args|)
                            ((line-number . 51)
                             (column-number . 39)
                             (source-file
                               .
                               "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm"))))
                        ((line-number . 51)
                         (column-number . 25)
                         (source-file
                           .
                           "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))
                  (#%annotate
                    (car |%%_VlcSmOL1x_args|)
                    ((line-number . 52)
                     (column-number . 25)
                     (source-file
                       .
                       "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))
                  (#%if (#%annotate
                          (not (#%annotate
                                 (null? (#%annotate
                                          (cdr |%%_VlcSmOL1x_args|)
                                          ((line-number . 53)
                                           (column-number . 37)
                                           (source-file
                                             .
                                             "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm"))))
                                 ((line-number . 53)
                                  (column-number . 30)
                                  (source-file
                                    .
                                    "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm"))))
                          ((line-number . 53)
                           (column-number . 25)
                           (source-file
                             .
                             "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))
                    (#%annotate
                      (cadr |%%_VlcSmOL1x_args|)
                      ((line-number . 54)
                       (column-number . 25)
                       (source-file
                         .
                         "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))
                    (#%annotate
                      (interaction-environment)
                      ((line-number . 55)
                       (column-number . 30)
                       (source-file
                         .
                         "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm"))))))))
           ((line-number . 43)
            (column-number . 5)
            (source-file
              .
              "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm"))))
       compile))
    ((line-number . 41)
     (column-number . 1)
     (source-file
       .
       "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm"))))
(#%program
  ((compile . 1)
   (error . 1)
   (strict-r5rs-compliance . 1)
   (interaction-environment . 1)
   (|%%_VlCs8ZO1x_env| . 5)
   (null? . 2)
   (cadr . 2)
   (_analyze! . 1)
   (equal? . 1)
   (|%%_VlgwawO1x_old-eval| . 1)
   (apply . 2)
   (car . 3)
   (member . 1)
   (|%%_VlYo6qP1x_x| . 6)
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
  (#%annotate
    (#%set! eval
      ((#%lambda #t
         (|%%_VlgwawO1x_old-eval|)
         ()
         (#%annotate
           (#%lambda #t
             (|%%_VlYo6qP1x_x| . |%%_VlCs8ZO1x_env|)
             (|%%_VlgwawO1x_old-eval|)
             (#%if (#%if (#%annotate
                           (pair? |%%_VlYo6qP1x_x|)
                           ((line-number . 66)
                            (column-number . 19)
                            (source-file
                              .
                              "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))
                     (#%annotate
                       (member
                         (#%annotate
                           (car |%%_VlYo6qP1x_x|)
                           ((line-number . 66)
                            (column-number . 37)
                            (source-file
                              .
                              "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))
                         (#%quote ("noexpand" "analyzeonly")))
                       ((line-number . 66)
                        (column-number . 29)
                        (source-file
                          .
                          "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))
                     #f)
               (#%annotate
                 (apply |%%_VlgwawO1x_old-eval|
                        (#%annotate
                          (#%if (#%annotate
                                  (equal?
                                    (#%annotate
                                      (car |%%_VlYo6qP1x_x|)
                                      ((line-number . 68)
                                       (column-number . 33)
                                       (source-file
                                         .
                                         "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))
                                    "analyzeonly")
                                  ((line-number . 68)
                                   (column-number . 25)
                                   (source-file
                                     .
                                     "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))
                            (#%annotate
                              (_analyze!
                                (#%annotate
                                  (cadr |%%_VlYo6qP1x_x|)
                                  ((line-number . 69)
                                   (column-number . 36)
                                   (source-file
                                     .
                                     "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))
                                (#%annotate
                                  (#%if (#%annotate
                                          (null? |%%_VlCs8ZO1x_env|)
                                          ((line-number . 70)
                                           (column-number . 40)
                                           (source-file
                                             .
                                             "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))
                                    (#%annotate
                                      (interaction-environment)
                                      ((line-number . 71)
                                       (column-number . 40)
                                       (source-file
                                         .
                                         "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))
                                    (#%annotate
                                      (car |%%_VlCs8ZO1x_env|)
                                      ((line-number . 72)
                                       (column-number . 40)
                                       (source-file
                                         .
                                         "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm"))))
                                  ((line-number . 70)
                                   (column-number . 36)
                                   (source-file
                                     .
                                     "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm"))))
                              ((line-number . 69)
                               (column-number . 25)
                               (source-file
                                 .
                                 "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))
                            (#%annotate
                              (cadr |%%_VlYo6qP1x_x|)
                              ((line-number . 73)
                               (column-number . 25)
                               (source-file
                                 .
                                 "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm"))))
                          ((line-number . 68)
                           (column-number . 21)
                           (source-file
                             .
                             "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))
                        |%%_VlCs8ZO1x_env|)
                 ((line-number . 67)
                  (column-number . 14)
                  (source-file
                    .
                    "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))
               (#%if (#%if (#%annotate
                             (null? |%%_VlCs8ZO1x_env|)
                             ((line-number . 74)
                              (column-number . 19)
                              (source-file
                                .
                                "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))
                       (#%annotate
                         (strict-r5rs-compliance)
                         ((line-number . 74)
                          (column-number . 31)
                          (source-file
                            .
                            "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))
                       #f)
                 (#%annotate
                   (error (#%quote eval)
                          "expected 2 arguments to procedure, got 1.")
                   ((line-number . 75)
                    (column-number . 14)
                    (source-file
                      .
                      "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm")))
                 (#%annotate
                   ((#%annotate
                      (apply compile
                             |%%_VlYo6qP1x_x|
                             (#%quote ((e) (e)))
                             |%%_VlCs8ZO1x_env|)
                      ((line-number . 77)
                       (column-number . 16)
                       (source-file
                         .
                         "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm"))))
                   ((line-number . 77)
                    (column-number . 15)
                    (source-file
                      .
                      "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm"))))))
           ((line-number . 65)
            (column-number . 5)
            (source-file
              .
              "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm"))))
       eval))
    ((line-number . 63)
     (column-number . 1)
     (source-file
       .
       "file:/home/scgmille/eclipse/sisc/src/sisc/boot/eval.scm"))))
