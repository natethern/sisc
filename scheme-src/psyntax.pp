(define $sc-put-cte (void))
(define $syntax-dispatch (void))
(define identifier? (void))
(define sc-expand (void))
(define datum->syntax-object (void))
(define syntax-object->datum (void))
(define generate-temporaries (void))
(define free-identifier=? (void))
(define bound-identifier=? (void))
(define literal-identifier=? (void))
(define syntax-error (void))
(define $syntax-dispatch (void))
((lambda ()
   ((lambda (%_454
             %_455
             %_456
             %_457
             %_458
             %_459
             %_460
             %_461
             %_462
             %_463
             %_464
             %_465
             %_466
             %_467
             %_468
             %_469
             %_470
             %_471
             %_472
             %_473
             %_474
             %_475
             %_476
             %_477
             %_478
             %_479
             %_480
             %_481
             %_482
             %_483
             %_484
             %_485
             %_486
             %_487
             %_488
             %_489
             %_490
             %_491
             %_492
             %_493
             %_494
             %_495
             %_496
             %_497
             %_498
             %_499
             %_500
             %_501
             %_502
             %_503
             %_504
             %_505
             %_506
             %_507
             %_508
             %_509
             %_510
             %_511
             %_512
             %_513
             %_514
             %_515
             %_516
             %_517
             %_518
             %_519
             %_520
             %_521
             %_522
             %_523
             %_524
             %_525
             %_526
             %_527
             %_528
             %_529
             %_530
             %_531
             %_532
             %_533
             %_534
             %_535
             %_536
             %_537
             %_538
             %_539
             %_540
             %_541
             %_542
             %_543
             %_544
             %_545
             %_546
             %_547
             %_548
             %_549
             %_550
             %_551
             %_552
             %_553
             %_554
             %_555
             %_556
             %_557
             %_558
             %_559
             %_560
             %_561
             %_562
             %_563
             %_564
             %_565
             %_566
             %_567
             %_568
             %_569
             %_570
             %_571
             %_572
             %_573
             %_574
             %_575
             %_576
             %_577
             %_578
             %_579
             %_580
             %_581
             %_582
             %_583
             %_584
             %_585
             %_586
             %_587
             %_588
             %_589
             %_590
             %_591
             %_592
             %_593
             %_594
             %_595
             %_596
             %_597
             %_598)
      (begin
        (set! %_454
          (lambda (%_969)
            (((lambda (%_970)
                (begin
                  (set! %_970
                    (lambda (%_971 %_972 %_973)
                      (if (pair? %_971)
                        (%_970 (cdr %_971)
                               (cons (%_516 (car %_971) %_973) %_972)
                               %_973)
                        (if (%_564 %_971)
                          (cons (%_516 %_971 %_973) %_972)
                          (if (null? %_971)
                            %_972
                            (if (%_586 %_971)
                              (%_970 (%_585 %_971)
                                     %_972
                                     (%_530 %_973 (%_584 %_971)))
                              (if (%_597 %_971)
                                (%_970 (annotation-expression %_971)
                                       %_972
                                       %_973)
                                (cons %_971 %_972))))))))
                  %_970))
              #f)
             %_969
             '()
             '(()))))
        (set! %_455
          (lambda (%_974)
            ((lambda (%_975)
               (if (%_597 %_975) (gensym) (gensym)))
             (if (%_586 %_974) (%_585 %_974) %_974))))
        (set! %_456
          (lambda (%_976 %_977)
            (%_457 %_976
                   %_977
                   (lambda (%_978)
                     (if ((lambda (%_979)
                            (if %_979
                              %_979
                              (if (pair? %_978) (%_597 (car %_978)) '#f)))
                          (%_597 %_978))
                       (%_458 %_978 '#f)
                       %_978)))))
        (set! %_457
          (lambda (%_980 %_981 %_982)
            (if (memq 'top (%_561 %_981))
              (%_982 %_980)
              (((lambda (%_983)
                  (begin
                    (set! %_983
                      (lambda (%_984)
                        (if (%_586 %_984)
                          (%_457 (%_585 %_984) (%_584 %_984) %_982)
                          (if (pair? %_984)
                            ((lambda (%_987 %_988)
                               (if (if (eq? %_987 (car %_984))
                                     (eq? %_988 (cdr %_984))
                                     '#f)
                                 %_984
                                 (cons %_987 %_988)))
                             (%_983 (car %_984))
                             (%_983 (cdr %_984)))
                            (if (vector? %_984)
                              ((lambda (%_985)
                                 ((lambda (%_986)
                                    (if (andmap eq? %_985 %_986)
                                      %_984
                                      (list->vector %_986)))
                                  (map %_983 %_985)))
                               (vector->list %_984))
                              %_984)))))
                    %_983))
                #f)
               %_980))))
        (set! %_458
          (lambda (%_989 %_990)
            (if (pair? %_989)
              ((lambda (%_995)
                 (begin
                   (if %_990
                     (set-annotation-stripped! %_990 %_995)
                     (void))
                   (set-car! %_995 (%_458 (car %_989) '#f))
                   (set-cdr! %_995 (%_458 (cdr %_989) '#f))
                   %_995))
               (cons '#f '#f))
              (if (%_597 %_989)
                ((lambda (%_994)
                   (if %_994
                     %_994
                     (%_458 (annotation-expression %_989) %_989)))
                 (annotation-stripped %_989))
                (if (vector? %_989)
                  ((lambda (%_991)
                     (begin
                       (if %_990
                         (set-annotation-stripped! %_990 %_991)
                         (void))
                       (((lambda (%_992)
                           (begin
                             (set! %_992
                               (lambda (%_993)
                                 (if (not (< %_993 '0))
                                   (begin
                                     (vector-set!
                                       %_991
                                       %_993
                                       (%_458 (vector-ref %_989 %_993) '#f))
                                     (%_992 (- %_993 '1)))
                                   (void))))
                             %_992))
                         #f)
                        (- (vector-length %_989) '1))
                       %_991))
                   (make-vector (vector-length %_989)))
                  %_989)))))
        (set! %_459
          (lambda (%_996)
            (if (%_565 %_996)
              (%_522 %_996
                     '#3(syntax-object
                         ...
                         ((top)
                          #4(ribcage ())
                          #4(ribcage ())
                          #4(ribcage #1(x) #1((top)) #1("i"))
                          #4(ribcage
                             (lambda-var-list
                               gen-var
                               strip
                               strip*
                               strip-annotation
                               ellipsis?
                               chi-void
                               chi-local-syntax
                               chi-lambda-clause
                               parse-define-syntax
                               parse-define
                               parse-import
                               parse-module
                               do-import!
                               chi-internal
                               chi-body
                               chi-macro
                               chi-set!
                               chi-application
                               chi-expr
                               chi
                               ct-eval/residualize
                               rt-eval/residualize
                               initial-mode-set
                               update-mode-set
                               do-top-import
                               vfor-each
                               vmap
                               chi-external
                               check-defined-ids
                               check-module-exports
                               extend-store!
                               id-set-diff
                               chi-top-module
                               set-module-binding-val!
                               set-module-binding-imps!
                               set-module-binding-label!
                               set-module-binding-id!
                               set-module-binding-type!
                               module-binding-val
                               module-binding-imps
                               module-binding-label
                               module-binding-id
                               module-binding-type
                               module-binding?
                               make-module-binding
                               make-resolved-interface
                               make-trimmed-interface
                               set-interface-token!
                               set-interface-exports!
                               interface-token
                               interface-exports
                               interface?
                               make-interface
                               flatten-exports
                               chi-top
                               chi-top-expr
                               syntax-type
                               chi-when-list
                               chi-top-sequence
                               chi-sequence
                               source-wrap
                               wrap
                               bound-id-member?
                               invalid-ids-error
                               distinct-bound-ids?
                               valid-bound-ids?
                               bound-id=?
                               literal-id=?
                               free-id=?
                               id-var-name
                               id-var-name-loc
                               id-var-name&marks
                               id-var-name-loc&marks
                               same-marks?
                               join-marks
                               join-wraps
                               smart-append
                               make-trimmed-syntax-object
                               make-binding-wrap
                               lookup-import-binding-name
                               extend-ribcage-subst!
                               extend-ribcage-barrier-help!
                               extend-ribcage-barrier!
                               extend-ribcage!
                               make-empty-ribcage
                               import-token-key
                               import-token?
                               make-import-token
                               barrier-marker
                               new-mark
                               anti-mark
                               the-anti-mark
                               only-top-marked?
                               top-marked?
                               top-wrap
                               empty-wrap
                               set-ribcage-labels!
                               set-ribcage-marks!
                               set-ribcage-symnames!
                               ribcage-labels
                               ribcage-marks
                               ribcage-symnames
                               ribcage?
                               make-ribcage
                               set-indirect-label!
                               get-indirect-label
                               indirect-label?
                               gen-indirect-label
                               gen-labels
                               label?
                               gen-label
                               make-rename
                               rename-marks
                               rename-new
                               rename-old
                               subst-rename?
                               wrap-subst
                               wrap-marks
                               make-wrap
                               id-sym-name&marks
                               id-sym-name
                               id?
                               nonsymbol-id?
                               global-extend
                               lookup
                               sanitize-binding
                               lookup*
                               displaced-lexical-error
                               transformer-env
                               extend-var-env*
                               extend-env*
                               extend-env
                               null-env
                               binding?
                               set-binding-value!
                               set-binding-type!
                               binding-value
                               binding-type
                               make-binding
                               arg-check
                               source-annotation
                               no-source
                               unannotate
                               set-syntax-object-wrap!
                               set-syntax-object-expression!
                               syntax-object-wrap
                               syntax-object-expression
                               syntax-object?
                               make-syntax-object
                               self-evaluating?
                               build-lexical-var
                               build-letrec
                               build-sequence
                               build-data
                               build-primref
                               build-lambda
                               build-revisit-only
                               build-visit-only
                               build-cte-install
                               build-module-definition
                               build-global-definition
                               build-global-assignment
                               build-global-reference
                               build-lexical-assignment
                               build-lexical-reference
                               build-conditional
                               build-application
                               generate-id
                               get-import-binding
                               get-global-definition-hook
                               put-global-definition-hook
                               gensym-hook
                               error-hook
                               local-eval-hook
                               top-level-eval-hook
                               annotation?
                               fx<
                               fx=
                               fx-
                               fx+
                               noexpand
                               define-structure
                               unless
                               when)
                             ((top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top)
                              (top))
                             ("i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"
                              "i"))
                          #4(ribcage ((import-token . *top*)) ())
                          #4(ribcage ((import-token . *top*)) ()))))
              '#f)))
        (set! %_460 (lambda () (list 'void)))
        (set! %_461
          (lambda (%_997 %_998 %_999 %_1000 %_1001 %_1002)
            ((lambda (%_1003)
               ((lambda (%_1004)
                  (if %_1004
                    (apply (lambda (%_1006 %_1007 %_1008 %_1009 %_1010)
                             ((lambda (%_1011)
                                (if (not (%_520 %_1011))
                                  (%_518 (map (lambda (%_1017)
                                                (%_516 %_1017 %_1000))
                                              %_1011)
                                         (%_515 %_998 %_1000 %_1001)
                                         '"keyword")
                                  ((lambda (%_1012)
                                     ((lambda (%_1013)
                                        (%_1002
                                          (cons %_1009 %_1010)
                                          (%_573 %_1012
                                                 ((lambda (%_1014 %_1015)
                                                    (map (lambda (%_1016)
                                                           (%_580 'deferred
                                                                  (%_474 %_1016
                                                                         %_1015
                                                                         %_1014)))
                                                         %_1008))
                                                  (if %_997 %_1013 %_1000)
                                                  (%_571 %_999))
                                                 %_999)
                                          %_1013
                                          %_1001))
                                      (%_533 %_1011 %_1012 %_1000)))
                                   (%_557 %_1011))))
                              %_1007))
                           %_1004)
                    ((lambda (%_1005)
                       (syntax-error (%_515 %_998 %_1000 %_1001)))
                     %_1003)))
                ($syntax-dispatch
                  %_1003
                  '(any #2(each (any any)) any . each-any))))
             %_998)))
        (set! %_462
          (lambda (%_1018 %_1019 %_1020 %_1021 %_1022)
            ((lambda (%_1023)
               ((lambda (%_1024)
                  (if %_1024
                    (apply (lambda (%_1036 %_1037 %_1038)
                             ((lambda (%_1039)
                                (if (not (%_520 %_1039))
                                  (syntax-error
                                    %_1018
                                    '"invalid parameter list in")
                                  ((lambda (%_1040 %_1041)
                                     (%_1022
                                       %_1041
                                       (%_469 (cons %_1037 %_1038)
                                              %_1018
                                              (%_572 %_1040 %_1041 %_1020)
                                              (%_533 %_1039 %_1040 %_1021))))
                                   (%_557 %_1039)
                                   (map %_455 %_1039))))
                              %_1036))
                           %_1024)
                    ((lambda (%_1025)
                       (if %_1025
                         (apply (lambda (%_1027 %_1028 %_1029)
                                  ((lambda (%_1030)
                                     (if (not (%_520 %_1030))
                                       (syntax-error
                                         %_1018
                                         '"invalid parameter list in")
                                       ((lambda (%_1031 %_1032)
                                          (%_1022
                                            (((lambda (%_1033)
                                                (begin
                                                  (set! %_1033
                                                    (lambda (%_1034 %_1035)
                                                      (if (null? %_1034)
                                                        %_1035
                                                        (%_1033
                                                          (cdr %_1034)
                                                          (cons (car %_1034)
                                                                %_1035)))))
                                                  %_1033))
                                              #f)
                                             (cdr %_1032)
                                             (car %_1032))
                                            (%_469 (cons %_1028 %_1029)
                                                   %_1018
                                                   (%_572 %_1031 %_1032 %_1020)
                                                   (%_533 %_1030
                                                          %_1031
                                                          %_1021))))
                                        (%_557 %_1030)
                                        (map %_455 %_1030))))
                                   (%_454 %_1027)))
                                %_1025)
                         ((lambda (%_1026) (syntax-error %_1018)) %_1023)))
                     ($syntax-dispatch %_1023 '(any any . each-any)))))
                ($syntax-dispatch
                  %_1023
                  '(each-any any . each-any))))
             %_1019)))
        (set! %_463
          (lambda (%_1042 %_1043 %_1044 %_1045)
            ((lambda (%_1046)
               ((lambda (%_1047)
                  (if (if %_1047
                        (apply (lambda (%_1052 %_1053 %_1054) (%_564 %_1053))
                               %_1047)
                        '#f)
                    (apply (lambda (%_1049 %_1050 %_1051)
                             (%_1045 %_1050 %_1051 %_1043))
                           %_1047)
                    ((lambda (%_1048)
                       (syntax-error (%_515 %_1042 %_1043 %_1044)))
                     %_1046)))
                ($syntax-dispatch %_1046 '(any any any))))
             %_1042)))
        (set! %_464
          (lambda (%_1055 %_1056 %_1057 %_1058)
            ((lambda (%_1059)
               ((lambda (%_1060)
                  (if (if %_1060
                        (apply (lambda (%_1081 %_1082 %_1083) (%_564 %_1082))
                               %_1060)
                        '#f)
                    (apply (lambda (%_1078 %_1079 %_1080)
                             (%_1058 %_1079 %_1080 %_1056))
                           %_1060)
                    ((lambda (%_1061)
                       (if (if %_1061
                             (apply (lambda (%_1073
                                             %_1074
                                             %_1075
                                             %_1076
                                             %_1077)
                                      (if (%_564 %_1074)
                                        (%_520 (%_454 %_1075))
                                        '#f))
                                    %_1061)
                             '#f)
                         (apply (lambda (%_1068 %_1069 %_1070 %_1071 %_1072)
                                  (%_1058
                                    (%_516 %_1069 %_1056)
                                    (cons '#3(syntax-object
                                              lambda
                                              ((top)
                                               #4(ribcage
                                                  #5(_ name args e1 e2)
                                                  #5((top)
                                                     (top)
                                                     (top)
                                                     (top)
                                                     (top))
                                                  #5("i" "i" "i" "i" "i"))
                                               #4(ribcage ())
                                               #4(ribcage
                                                  #4(e w s k)
                                                  #4((top) (top) (top) (top))
                                                  #4("i" "i" "i" "i"))
                                               #4(ribcage
                                                  (lambda-var-list
                                                    gen-var
                                                    strip
                                                    strip*
                                                    strip-annotation
                                                    ellipsis?
                                                    chi-void
                                                    chi-local-syntax
                                                    chi-lambda-clause
                                                    parse-define-syntax
                                                    parse-define
                                                    parse-import
                                                    parse-module
                                                    do-import!
                                                    chi-internal
                                                    chi-body
                                                    chi-macro
                                                    chi-set!
                                                    chi-application
                                                    chi-expr
                                                    chi
                                                    ct-eval/residualize
                                                    rt-eval/residualize
                                                    initial-mode-set
                                                    update-mode-set
                                                    do-top-import
                                                    vfor-each
                                                    vmap
                                                    chi-external
                                                    check-defined-ids
                                                    check-module-exports
                                                    extend-store!
                                                    id-set-diff
                                                    chi-top-module
                                                    set-module-binding-val!
                                                    set-module-binding-imps!
                                                    set-module-binding-label!
                                                    set-module-binding-id!
                                                    set-module-binding-type!
                                                    module-binding-val
                                                    module-binding-imps
                                                    module-binding-label
                                                    module-binding-id
                                                    module-binding-type
                                                    module-binding?
                                                    make-module-binding
                                                    make-resolved-interface
                                                    make-trimmed-interface
                                                    set-interface-token!
                                                    set-interface-exports!
                                                    interface-token
                                                    interface-exports
                                                    interface?
                                                    make-interface
                                                    flatten-exports
                                                    chi-top
                                                    chi-top-expr
                                                    syntax-type
                                                    chi-when-list
                                                    chi-top-sequence
                                                    chi-sequence
                                                    source-wrap
                                                    wrap
                                                    bound-id-member?
                                                    invalid-ids-error
                                                    distinct-bound-ids?
                                                    valid-bound-ids?
                                                    bound-id=?
                                                    literal-id=?
                                                    free-id=?
                                                    id-var-name
                                                    id-var-name-loc
                                                    id-var-name&marks
                                                    id-var-name-loc&marks
                                                    same-marks?
                                                    join-marks
                                                    join-wraps
                                                    smart-append
                                                    make-trimmed-syntax-object
                                                    make-binding-wrap
                                                    lookup-import-binding-name
                                                    extend-ribcage-subst!
                                                    extend-ribcage-barrier-help!
                                                    extend-ribcage-barrier!
                                                    extend-ribcage!
                                                    make-empty-ribcage
                                                    import-token-key
                                                    import-token?
                                                    make-import-token
                                                    barrier-marker
                                                    new-mark
                                                    anti-mark
                                                    the-anti-mark
                                                    only-top-marked?
                                                    top-marked?
                                                    top-wrap
                                                    empty-wrap
                                                    set-ribcage-labels!
                                                    set-ribcage-marks!
                                                    set-ribcage-symnames!
                                                    ribcage-labels
                                                    ribcage-marks
                                                    ribcage-symnames
                                                    ribcage?
                                                    make-ribcage
                                                    set-indirect-label!
                                                    get-indirect-label
                                                    indirect-label?
                                                    gen-indirect-label
                                                    gen-labels
                                                    label?
                                                    gen-label
                                                    make-rename
                                                    rename-marks
                                                    rename-new
                                                    rename-old
                                                    subst-rename?
                                                    wrap-subst
                                                    wrap-marks
                                                    make-wrap
                                                    id-sym-name&marks
                                                    id-sym-name
                                                    id?
                                                    nonsymbol-id?
                                                    global-extend
                                                    lookup
                                                    sanitize-binding
                                                    lookup*
                                                    displaced-lexical-error
                                                    transformer-env
                                                    extend-var-env*
                                                    extend-env*
                                                    extend-env
                                                    null-env
                                                    binding?
                                                    set-binding-value!
                                                    set-binding-type!
                                                    binding-value
                                                    binding-type
                                                    make-binding
                                                    arg-check
                                                    source-annotation
                                                    no-source
                                                    unannotate
                                                    set-syntax-object-wrap!
                                                    set-syntax-object-expression!
                                                    syntax-object-wrap
                                                    syntax-object-expression
                                                    syntax-object?
                                                    make-syntax-object
                                                    self-evaluating?
                                                    build-lexical-var
                                                    build-letrec
                                                    build-sequence
                                                    build-data
                                                    build-primref
                                                    build-lambda
                                                    build-revisit-only
                                                    build-visit-only
                                                    build-cte-install
                                                    build-module-definition
                                                    build-global-definition
                                                    build-global-assignment
                                                    build-global-reference
                                                    build-lexical-assignment
                                                    build-lexical-reference
                                                    build-conditional
                                                    build-application
                                                    generate-id
                                                    get-import-binding
                                                    get-global-definition-hook
                                                    put-global-definition-hook
                                                    gensym-hook
                                                    error-hook
                                                    local-eval-hook
                                                    top-level-eval-hook
                                                    annotation?
                                                    fx<
                                                    fx=
                                                    fx-
                                                    fx+
                                                    noexpand
                                                    define-structure
                                                    unless
                                                    when)
                                                  ((top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top))
                                                  ("i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"))
                                               #4(ribcage
                                                  ((import-token . *top*))
                                                  ()
                                                  ())
                                               #4(ribcage
                                                  ((import-token . *top*))
                                                  ()
                                                  ())))
                                          (%_516 (cons %_1070
                                                       (cons %_1071 %_1072))
                                                 %_1056))
                                    '(())))
                                %_1061)
                         ((lambda (%_1062)
                            (if (if %_1062
                                  (apply (lambda (%_1066 %_1067)
                                           (%_564 %_1067))
                                         %_1062)
                                  '#f)
                              (apply (lambda (%_1064 %_1065)
                                       (%_1058
                                         (%_516 %_1065 %_1056)
                                         '#3(syntax-object
                                             (void)
                                             ((top)
                                              #4(ribcage
                                                 #2(_ name)
                                                 #2((top) (top))
                                                 #2("i" "i"))
                                              #4(ribcage ())
                                              #4(ribcage
                                                 #4(e w s k)
                                                 #4((top) (top) (top) (top))
                                                 #4("i" "i" "i" "i"))
                                              #4(ribcage
                                                 (lambda-var-list
                                                   gen-var
                                                   strip
                                                   strip*
                                                   strip-annotation
                                                   ellipsis?
                                                   chi-void
                                                   chi-local-syntax
                                                   chi-lambda-clause
                                                   parse-define-syntax
                                                   parse-define
                                                   parse-import
                                                   parse-module
                                                   do-import!
                                                   chi-internal
                                                   chi-body
                                                   chi-macro
                                                   chi-set!
                                                   chi-application
                                                   chi-expr
                                                   chi
                                                   ct-eval/residualize
                                                   rt-eval/residualize
                                                   initial-mode-set
                                                   update-mode-set
                                                   do-top-import
                                                   vfor-each
                                                   vmap
                                                   chi-external
                                                   check-defined-ids
                                                   check-module-exports
                                                   extend-store!
                                                   id-set-diff
                                                   chi-top-module
                                                   set-module-binding-val!
                                                   set-module-binding-imps!
                                                   set-module-binding-label!
                                                   set-module-binding-id!
                                                   set-module-binding-type!
                                                   module-binding-val
                                                   module-binding-imps
                                                   module-binding-label
                                                   module-binding-id
                                                   module-binding-type
                                                   module-binding?
                                                   make-module-binding
                                                   make-resolved-interface
                                                   make-trimmed-interface
                                                   set-interface-token!
                                                   set-interface-exports!
                                                   interface-token
                                                   interface-exports
                                                   interface?
                                                   make-interface
                                                   flatten-exports
                                                   chi-top
                                                   chi-top-expr
                                                   syntax-type
                                                   chi-when-list
                                                   chi-top-sequence
                                                   chi-sequence
                                                   source-wrap
                                                   wrap
                                                   bound-id-member?
                                                   invalid-ids-error
                                                   distinct-bound-ids?
                                                   valid-bound-ids?
                                                   bound-id=?
                                                   literal-id=?
                                                   free-id=?
                                                   id-var-name
                                                   id-var-name-loc
                                                   id-var-name&marks
                                                   id-var-name-loc&marks
                                                   same-marks?
                                                   join-marks
                                                   join-wraps
                                                   smart-append
                                                   make-trimmed-syntax-object
                                                   make-binding-wrap
                                                   lookup-import-binding-name
                                                   extend-ribcage-subst!
                                                   extend-ribcage-barrier-help!
                                                   extend-ribcage-barrier!
                                                   extend-ribcage!
                                                   make-empty-ribcage
                                                   import-token-key
                                                   import-token?
                                                   make-import-token
                                                   barrier-marker
                                                   new-mark
                                                   anti-mark
                                                   the-anti-mark
                                                   only-top-marked?
                                                   top-marked?
                                                   top-wrap
                                                   empty-wrap
                                                   set-ribcage-labels!
                                                   set-ribcage-marks!
                                                   set-ribcage-symnames!
                                                   ribcage-labels
                                                   ribcage-marks
                                                   ribcage-symnames
                                                   ribcage?
                                                   make-ribcage
                                                   set-indirect-label!
                                                   get-indirect-label
                                                   indirect-label?
                                                   gen-indirect-label
                                                   gen-labels
                                                   label?
                                                   gen-label
                                                   make-rename
                                                   rename-marks
                                                   rename-new
                                                   rename-old
                                                   subst-rename?
                                                   wrap-subst
                                                   wrap-marks
                                                   make-wrap
                                                   id-sym-name&marks
                                                   id-sym-name
                                                   id?
                                                   nonsymbol-id?
                                                   global-extend
                                                   lookup
                                                   sanitize-binding
                                                   lookup*
                                                   displaced-lexical-error
                                                   transformer-env
                                                   extend-var-env*
                                                   extend-env*
                                                   extend-env
                                                   null-env
                                                   binding?
                                                   set-binding-value!
                                                   set-binding-type!
                                                   binding-value
                                                   binding-type
                                                   make-binding
                                                   arg-check
                                                   source-annotation
                                                   no-source
                                                   unannotate
                                                   set-syntax-object-wrap!
                                                   set-syntax-object-expression!
                                                   syntax-object-wrap
                                                   syntax-object-expression
                                                   syntax-object?
                                                   make-syntax-object
                                                   self-evaluating?
                                                   build-lexical-var
                                                   build-letrec
                                                   build-sequence
                                                   build-data
                                                   build-primref
                                                   build-lambda
                                                   build-revisit-only
                                                   build-visit-only
                                                   build-cte-install
                                                   build-module-definition
                                                   build-global-definition
                                                   build-global-assignment
                                                   build-global-reference
                                                   build-lexical-assignment
                                                   build-lexical-reference
                                                   build-conditional
                                                   build-application
                                                   generate-id
                                                   get-import-binding
                                                   get-global-definition-hook
                                                   put-global-definition-hook
                                                   gensym-hook
                                                   error-hook
                                                   local-eval-hook
                                                   top-level-eval-hook
                                                   annotation?
                                                   fx<
                                                   fx=
                                                   fx-
                                                   fx+
                                                   noexpand
                                                   define-structure
                                                   unless
                                                   when)
                                                 ((top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top))
                                                 ("i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"))
                                              #4(ribcage
                                                 ((import-token . *top*))
                                                 ()
                                                 ())
                                              #4(ribcage
                                                 ((import-token . *top*))
                                                 ()
                                                 ())))
                                         '(())))
                                     %_1062)
                              ((lambda (%_1063)
                                 (syntax-error (%_515 %_1055 %_1056 %_1057)))
                               %_1059)))
                          ($syntax-dispatch %_1059 '(any any)))))
                     ($syntax-dispatch
                       %_1059
                       '(any (any . any) any . each-any)))))
                ($syntax-dispatch %_1059 '(any any any))))
             %_1055)))
        (set! %_465
          (lambda (%_1084 %_1085 %_1086 %_1087)
            ((lambda (%_1088)
               ((lambda (%_1089)
                  (if (if %_1089
                        (apply (lambda (%_1093 %_1094) (%_564 %_1094))
                               %_1089)
                        '#f)
                    (apply (lambda (%_1091 %_1092)
                             (%_1087 (%_516 %_1092 %_1085)))
                           %_1089)
                    ((lambda (%_1090)
                       (syntax-error (%_515 %_1084 %_1085 %_1086)))
                     %_1088)))
                ($syntax-dispatch %_1088 '(any any))))
             %_1084)))
        (set! %_466
          (lambda (%_1095 %_1096 %_1097 %_1098 %_1099)
            ((lambda (%_1100 %_1101)
               (begin
                 (set! %_1100
                   (lambda (%_1117 %_1118 %_1119)
                     (%_1099
                       %_1117
                       (%_1101 %_1118)
                       (map (lambda (%_1120) (%_516 %_1120 %_1098))
                            %_1119))))
                 (set! %_1101
                   (lambda (%_1121)
                     (if (null? %_1121)
                       '()
                       (cons ((lambda (%_1122)
                                ((lambda (%_1123)
                                   (if %_1123
                                     (apply (lambda (%_1125) (%_1101 %_1125))
                                            %_1123)
                                     ((lambda (%_1124)
                                        (if (%_564 %_1124)
                                          (%_516 %_1124 %_1098)
                                          (syntax-error
                                            (%_515 %_1095 %_1096 %_1097)
                                            '"invalid exports list in")))
                                      %_1122)))
                                 ($syntax-dispatch %_1122 'each-any)))
                              (car %_1121))
                             (%_1101 (cdr %_1121))))))
                 ((lambda (%_1102)
                    ((lambda (%_1103)
                       (if %_1103
                         (apply (lambda (%_1114 %_1115 %_1116)
                                  (%_1100 '#f %_1115 %_1116))
                                %_1103)
                         ((lambda (%_1104)
                            (if (if %_1104
                                  (apply (lambda (%_1110 %_1111 %_1112 %_1113)
                                           (%_564 %_1111))
                                         %_1104)
                                  '#f)
                              (apply (lambda (%_1106 %_1107 %_1108 %_1109)
                                       (%_1100
                                         (%_516 %_1107 %_1096)
                                         %_1108
                                         %_1109))
                                     %_1104)
                              ((lambda (%_1105)
                                 (syntax-error (%_515 %_1095 %_1096 %_1097)))
                               %_1102)))
                          ($syntax-dispatch
                            %_1102
                            '(any any each-any . each-any)))))
                     ($syntax-dispatch
                       %_1102
                       '(any each-any . each-any))))
                  %_1095)))
             #f
             #f)))
        (set! %_467
          (lambda (%_1126 %_1127)
            ((lambda (%_1128)
               (if %_1128
                 (%_535 %_1127 %_1128)
                 (%_480 (lambda (%_1129)
                          ((lambda (%_1130)
                             (begin
                               (if (not %_1130)
                                 (syntax-error
                                   %_1129
                                   '"exported identifier not visible")
                                 (void))
                               (%_538 %_1127 %_1129 %_1130)))
                           (%_525 %_1129 '(()))))
                        (%_505 %_1126))))
             (%_504 %_1126))))
        (set! %_468
          (lambda (%_1131 %_1132 %_1133 %_1134 %_1135)
            ((lambda (%_1136)
               (begin
                 (set! %_1136
                   (lambda (%_1203 %_1204 %_1205 %_1206 %_1207)
                     (begin
                       (%_483 %_1132 %_1204)
                       (%_1135 %_1203 %_1204 %_1205 %_1206 %_1207))))
                 (((lambda (%_1137)
                     (begin
                       (set! %_1137
                         (lambda (%_1138 %_1139 %_1140 %_1141 %_1142)
                           (if (null? %_1138)
                             (%_1136 %_1138 %_1139 %_1140 %_1141 %_1142)
                             ((lambda (%_1143 %_1144)
                                (call-with-values
                                  (lambda ()
                                    (%_511 %_1143 %_1144 '(()) '#f %_1131))
                                  (lambda (%_1145 %_1146 %_1147 %_1148 %_1149)
                                    ((lambda (%_1150)
                                       (if (memv %_1150 '(define-form))
                                         (%_464 %_1147
                                                %_1148
                                                %_1149
                                                (lambda (%_1197 %_1198 %_1199)
                                                  ((lambda (%_1200 %_1201)
                                                     ((lambda (%_1202)
                                                        (begin
                                                          (%_538 %_1131
                                                                 %_1200
                                                                 %_1201)
                                                          (%_485 %_1134
                                                                 %_1201
                                                                 (%_580 'lexical
                                                                        %_1202))
                                                          (%_1137
                                                            (cdr %_1138)
                                                            (cons %_1200
                                                                  %_1139)
                                                            (cons %_1202
                                                                  %_1140)
                                                            (cons (cons %_1144
                                                                        (%_516 %_1198
                                                                               %_1199))
                                                                  %_1141)
                                                            %_1142)))
                                                      (%_455 %_1200)))
                                                   (%_516 %_1197 %_1199)
                                                   (%_559))))
                                         (if (memv %_1150
                                                   '(define-syntax-form))
                                           (%_463 %_1147
                                                  %_1148
                                                  %_1149
                                                  (lambda (%_1191
                                                           %_1192
                                                           %_1193)
                                                    ((lambda (%_1194
                                                              %_1195
                                                              %_1196)
                                                       (begin
                                                         (%_538 %_1131
                                                                %_1194
                                                                %_1195)
                                                         (%_485 %_1134
                                                                %_1195
                                                                (%_580 'deferred
                                                                       %_1196))
                                                         (%_1137
                                                           (cdr %_1138)
                                                           (cons %_1194 %_1139)
                                                           %_1140
                                                           %_1141
                                                           %_1142)))
                                                     (%_516 %_1191 %_1193)
                                                     (%_559)
                                                     (%_474 %_1192
                                                            (%_571 %_1144)
                                                            %_1193))))
                                           (if (memv %_1150 '(module-form))
                                             ((lambda (%_1175)
                                                ((lambda (%_1176)
                                                   ((lambda ()
                                                      (%_466 %_1147
                                                             %_1148
                                                             %_1149
                                                             %_1176
                                                             (lambda (%_1177
                                                                      %_1178
                                                                      %_1179)
                                                               (%_468 %_1175
                                                                      (%_515 %_1147
                                                                             %_1148
                                                                             %_1149)
                                                                      (map (lambda (%_1180)
                                                                             (cons %_1144
                                                                                   %_1180))
                                                                           %_1179)
                                                                      %_1134
                                                                      (lambda (%_1181
                                                                               %_1182
                                                                               %_1183
                                                                               %_1184
                                                                               %_1185)
                                                                        (begin
                                                                          (%_484 %_1132
                                                                                 (%_508 %_1178)
                                                                                 %_1182)
                                                                          ((lambda (%_1186
                                                                                    %_1187
                                                                                    %_1188
                                                                                    %_1189)
                                                                             (if %_1177
                                                                               ((lambda (%_1190)
                                                                                  (begin
                                                                                    (%_538 %_1131
                                                                                           %_1177
                                                                                           %_1190)
                                                                                    (%_485 %_1134
                                                                                           %_1190
                                                                                           (%_580 'module
                                                                                                  %_1186))
                                                                                    (%_1137
                                                                                      (cdr %_1138)
                                                                                      (cons %_1177
                                                                                            %_1139)
                                                                                      %_1187
                                                                                      %_1188
                                                                                      %_1189)))
                                                                                (%_559))
                                                                               ((lambda ()
                                                                                  (begin
                                                                                    (%_467 %_1186
                                                                                           %_1131)
                                                                                    (%_1137
                                                                                      (cdr %_1138)
                                                                                      (cons %_1186
                                                                                            %_1139)
                                                                                      %_1187
                                                                                      %_1188
                                                                                      %_1189))))))
                                                                           (%_501 %_1178)
                                                                           (append
                                                                             %_1183
                                                                             %_1140)
                                                                           (append
                                                                             %_1184
                                                                             %_1141)
                                                                           (append
                                                                             %_1142
                                                                             %_1185
                                                                             %_1181))))))))))
                                                 (%_562 (%_561 %_1148)
                                                        (cons %_1175
                                                              (%_560 %_1148)))))
                                              (%_552 '() '() '()))
                                             (if (memv %_1150 '(import-form))
                                               (%_465 %_1147
                                                      %_1148
                                                      %_1149
                                                      (lambda (%_1170)
                                                        ((lambda (%_1171)
                                                           ((lambda (%_1172)
                                                              ((lambda (%_1173)
                                                                 (if (memv %_1173
                                                                           '(module))
                                                                   ((lambda (%_1174)
                                                                      (begin
                                                                        (if %_1146
                                                                          (%_537 %_1131
                                                                                 %_1146)
                                                                          (void))
                                                                        (%_467 %_1174
                                                                               %_1131)
                                                                        (%_1137
                                                                          (cdr %_1138)
                                                                          (cons %_1174
                                                                                %_1139)
                                                                          %_1140
                                                                          %_1141
                                                                          %_1142)))
                                                                    (cdr %_1172))
                                                                   (if (memv %_1173
                                                                             '(displaced-lexical))
                                                                     (%_570 %_1170)
                                                                     (syntax-error
                                                                       %_1170
                                                                       '"import from unknown module"))))
                                                               (car %_1172)))
                                                            (%_567 %_1171
                                                                   %_1134)))
                                                         (%_524 %_1170
                                                                '(())))))
                                               (if (memv %_1150 '(begin-form))
                                                 ((lambda (%_1164)
                                                    ((lambda (%_1165)
                                                       (if %_1165
                                                         (apply (lambda (%_1166
                                                                         %_1167)
                                                                  (%_1137
                                                                    (((lambda (%_1168)
                                                                        (begin
                                                                          (set! %_1168
                                                                            (lambda (%_1169)
                                                                              (if (null? %_1169)
                                                                                (cdr %_1138)
                                                                                (cons (cons %_1144
                                                                                            (%_516 (car %_1169)
                                                                                                   %_1148))
                                                                                      (%_1168
                                                                                        (cdr %_1169))))))
                                                                          %_1168))
                                                                      #f)
                                                                     %_1167)
                                                                    %_1139
                                                                    %_1140
                                                                    %_1141
                                                                    %_1142))
                                                                %_1165)
                                                         (syntax-error
                                                           %_1164)))
                                                     ($syntax-dispatch
                                                       %_1164
                                                       '(any . each-any))))
                                                  %_1147)
                                                 (if (memv %_1150
                                                           '(eval-when-form))
                                                   ((lambda (%_1157)
                                                      ((lambda (%_1158)
                                                         (if %_1158
                                                           (apply (lambda (%_1159
                                                                           %_1160
                                                                           %_1161)
                                                                    (%_1137
                                                                      (if (memq 'eval
                                                                                (%_512 %_1160
                                                                                       %_1148))
                                                                        (((lambda (%_1162)
                                                                            (begin
                                                                              (set! %_1162
                                                                                (lambda (%_1163)
                                                                                  (if (null? %_1163)
                                                                                    (cdr %_1138)
                                                                                    (cons (cons %_1144
                                                                                                (%_516 (car %_1163)
                                                                                                       %_1148))
                                                                                          (%_1162
                                                                                            (cdr %_1163))))))
                                                                              %_1162))
                                                                          #f)
                                                                         %_1161)
                                                                        (cdr %_1138))
                                                                      %_1139
                                                                      %_1140
                                                                      %_1141
                                                                      %_1142))
                                                                  %_1158)
                                                           (syntax-error
                                                             %_1157)))
                                                       ($syntax-dispatch
                                                         %_1157
                                                         '(any each-any
                                                               .
                                                               each-any))))
                                                    %_1147)
                                                   (if (memv %_1150
                                                             '(local-syntax-form))
                                                     (%_461 %_1146
                                                            %_1147
                                                            %_1144
                                                            %_1148
                                                            %_1149
                                                            (lambda (%_1151
                                                                     %_1152
                                                                     %_1153
                                                                     %_1154)
                                                              (%_1137
                                                                (((lambda (%_1155)
                                                                    (begin
                                                                      (set! %_1155
                                                                        (lambda (%_1156)
                                                                          (if (null? %_1156)
                                                                            (cdr %_1138)
                                                                            (cons (cons %_1152
                                                                                        (%_516 (car %_1156)
                                                                                               %_1153))
                                                                                  (%_1155
                                                                                    (cdr %_1156))))))
                                                                      %_1155))
                                                                  #f)
                                                                 %_1151)
                                                                %_1139
                                                                %_1140
                                                                %_1141
                                                                %_1142)))
                                                     (%_1136
                                                       (cons (cons %_1144
                                                                   (%_515 %_1147
                                                                          %_1148
                                                                          %_1149))
                                                             (cdr %_1138))
                                                       %_1139
                                                       %_1140
                                                       %_1141
                                                       %_1142)))))))))
                                     %_1145))))
                              (cdar %_1138)
                              (caar %_1138)))))
                       %_1137))
                   #f)
                  %_1133
                  '()
                  '()
                  '()
                  '())))
             #f)))
        (set! %_469
          (lambda (%_1208 %_1209 %_1210 %_1211)
            ((lambda (%_1212)
               ((lambda (%_1213)
                  ((lambda (%_1214)
                     ((lambda (%_1215)
                        ((lambda ()
                           (%_468 %_1213
                                  %_1209
                                  %_1215
                                  %_1212
                                  (lambda (%_1216 %_1217 %_1218 %_1219 %_1220)
                                    (begin
                                      (if (null? %_1216)
                                        (syntax-error
                                          %_1209
                                          '"no expressions in body")
                                        (void))
                                      (%_588 '#f
                                             %_1218
                                             (map (lambda (%_1221)
                                                    (%_474 (cdr %_1221)
                                                           (car %_1221)
                                                           '(())))
                                                  %_1219)
                                             (%_589 '#f
                                                    (map (lambda (%_1222)
                                                           (%_474 (cdr %_1222)
                                                                  (car %_1222)
                                                                  '(())))
                                                         (append
                                                           %_1220
                                                           %_1216))))))))))
                      (map (lambda (%_1223)
                             (cons %_1212 (%_516 %_1223 %_1214)))
                           %_1208)))
                   (%_562 (%_561 %_1211)
                          (cons %_1213 (%_560 %_1211)))))
                (%_552 '() '() '())))
             (cons '("placeholder" placeholder) %_1210))))
        (set! %_470
          (lambda (%_1224 %_1225 %_1226 %_1227 %_1228 %_1229)
            ((lambda (%_1230)
               (begin
                 (set! %_1230
                   (lambda (%_1233 %_1234)
                     (if (pair? %_1233)
                       (cons (%_1230 (car %_1233) %_1234)
                             (%_1230 (cdr %_1233) %_1234))
                       (if (%_586 %_1233)
                         ((lambda (%_1239)
                            ((lambda (%_1240 %_1241)
                               (%_587 (%_585 %_1233)
                                      (if (if (pair? %_1240)
                                            (eq? (car %_1240) '#f)
                                            '#f)
                                        (%_562 (cdr %_1240)
                                               (if %_1229
                                                 (cons %_1229 (cdr %_1241))
                                                 (cdr %_1241)))
                                        (%_562 (cons %_1234 %_1240)
                                               (if %_1229
                                                 (cons %_1229
                                                       (cons 'shift %_1241))
                                                 (cons 'shift %_1241))))))
                             (%_561 %_1239)
                             (%_560 %_1239)))
                          (%_584 %_1233))
                         (if (vector? %_1233)
                           ((lambda (%_1235)
                              ((lambda (%_1236)
                                 ((lambda ()
                                    (((lambda (%_1237)
                                        (begin
                                          (set! %_1237
                                            (lambda (%_1238)
                                              (if (= %_1238 %_1235)
                                                %_1236
                                                (begin
                                                  (vector-set!
                                                    %_1236
                                                    %_1238
                                                    (%_1230
                                                      (vector-ref
                                                        %_1233
                                                        %_1238)
                                                      %_1234))
                                                  (%_1237 (+ %_1238 '1))))))
                                          %_1237))
                                      #f)
                                     '0))))
                               (make-vector %_1235)))
                            (vector-length %_1233))
                           (if (symbol? %_1233)
                             (syntax-error
                               (%_515 %_1225 %_1227 %_1228)
                               '"encountered raw symbol "
                               (format '"~s" %_1233)
                               '" in output of macro")
                             %_1233))))))
                 (%_1230
                   ((lambda (%_1231)
                      (if (procedure? %_1231)
                        (%_1231
                          (lambda (%_1232)
                            (begin
                              (if (not (identifier? %_1232))
                                (syntax-error
                                  %_1232
                                  '"environment argument is not an identifier")
                                (void))
                              (%_567 (%_524 %_1232 '(())) %_1226))))
                        %_1231))
                    (%_1224 (%_515 %_1225 (%_544 %_1227) %_1228)))
                   (string '#\m))))
             #f)))
        (set! %_471
          (lambda (%_1242 %_1243 %_1244 %_1245 %_1246)
            ((lambda (%_1247)
               ((lambda (%_1248)
                  (if (if %_1248
                        (apply (lambda (%_1266 %_1267 %_1268) (%_564 %_1267))
                               %_1248)
                        '#f)
                    (apply (lambda (%_1250 %_1251 %_1252)
                             ((lambda (%_1253)
                                ((lambda (%_1254)
                                   ((lambda (%_1255)
                                      (if (memv %_1255 '(macro!))
                                        ((lambda (%_1264 %_1265)
                                           (%_511 (%_470 (%_578 %_1254)
                                                         (list '#3(syntax-object
                                                                   set!
                                                                   ((top)
                                                                    #4(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                    #4(ribcage
                                                                       #2(id
                                                                          val)
                                                                       #2((top)
                                                                          (top))
                                                                       #2("i"
                                                                          "i"))
                                                                    #4(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                    #4(ribcage
                                                                       #1(t)
                                                                       #1(("m"
                                                                           top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                    #4(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                    #4(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                    #4(ribcage
                                                                       #1(b)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                    #4(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                    #4(ribcage
                                                                       #1(n)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       #3(_
                                                                          id
                                                                          val)
                                                                       #3((top)
                                                                          (top)
                                                                          (top))
                                                                       #3("i"
                                                                          "i"
                                                                          "i"))
                                                                    #4(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                    #4(ribcage
                                                                       #5(e
                                                                          r
                                                                          w
                                                                          s
                                                                          rib)
                                                                       #5((top)
                                                                          (top)
                                                                          (top)
                                                                          (top)
                                                                          (top))
                                                                       #5("i"
                                                                          "i"
                                                                          "i"
                                                                          "i"
                                                                          "i"))
                                                                    #4(ribcage
                                                                       (lambda-var-list
                                                                         gen-var
                                                                         strip
                                                                         strip*
                                                                         strip-annotation
                                                                         ellipsis?
                                                                         chi-void
                                                                         chi-local-syntax
                                                                         chi-lambda-clause
                                                                         parse-define-syntax
                                                                         parse-define
                                                                         parse-import
                                                                         parse-module
                                                                         do-import!
                                                                         chi-internal
                                                                         chi-body
                                                                         chi-macro
                                                                         chi-set!
                                                                         chi-application
                                                                         chi-expr
                                                                         chi
                                                                         ct-eval/residualize
                                                                         rt-eval/residualize
                                                                         initial-mode-set
                                                                         update-mode-set
                                                                         do-top-import
                                                                         vfor-each
                                                                         vmap
                                                                         chi-external
                                                                         check-defined-ids
                                                                         check-module-exports
                                                                         extend-store!
                                                                         id-set-diff
                                                                         chi-top-module
                                                                         set-module-binding-val!
                                                                         set-module-binding-imps!
                                                                         set-module-binding-label!
                                                                         set-module-binding-id!
                                                                         set-module-binding-type!
                                                                         module-binding-val
                                                                         module-binding-imps
                                                                         module-binding-label
                                                                         module-binding-id
                                                                         module-binding-type
                                                                         module-binding?
                                                                         make-module-binding
                                                                         make-resolved-interface
                                                                         make-trimmed-interface
                                                                         set-interface-token!
                                                                         set-interface-exports!
                                                                         interface-token
                                                                         interface-exports
                                                                         interface?
                                                                         make-interface
                                                                         flatten-exports
                                                                         chi-top
                                                                         chi-top-expr
                                                                         syntax-type
                                                                         chi-when-list
                                                                         chi-top-sequence
                                                                         chi-sequence
                                                                         source-wrap
                                                                         wrap
                                                                         bound-id-member?
                                                                         invalid-ids-error
                                                                         distinct-bound-ids?
                                                                         valid-bound-ids?
                                                                         bound-id=?
                                                                         literal-id=?
                                                                         free-id=?
                                                                         id-var-name
                                                                         id-var-name-loc
                                                                         id-var-name&marks
                                                                         id-var-name-loc&marks
                                                                         same-marks?
                                                                         join-marks
                                                                         join-wraps
                                                                         smart-append
                                                                         make-trimmed-syntax-object
                                                                         make-binding-wrap
                                                                         lookup-import-binding-name
                                                                         extend-ribcage-subst!
                                                                         extend-ribcage-barrier-help!
                                                                         extend-ribcage-barrier!
                                                                         extend-ribcage!
                                                                         make-empty-ribcage
                                                                         import-token-key
                                                                         import-token?
                                                                         make-import-token
                                                                         barrier-marker
                                                                         new-mark
                                                                         anti-mark
                                                                         the-anti-mark
                                                                         only-top-marked?
                                                                         top-marked?
                                                                         top-wrap
                                                                         empty-wrap
                                                                         set-ribcage-labels!
                                                                         set-ribcage-marks!
                                                                         set-ribcage-symnames!
                                                                         ribcage-labels
                                                                         ribcage-marks
                                                                         ribcage-symnames
                                                                         ribcage?
                                                                         make-ribcage
                                                                         set-indirect-label!
                                                                         get-indirect-label
                                                                         indirect-label?
                                                                         gen-indirect-label
                                                                         gen-labels
                                                                         label?
                                                                         gen-label
                                                                         make-rename
                                                                         rename-marks
                                                                         rename-new
                                                                         rename-old
                                                                         subst-rename?
                                                                         wrap-subst
                                                                         wrap-marks
                                                                         make-wrap
                                                                         id-sym-name&marks
                                                                         id-sym-name
                                                                         id?
                                                                         nonsymbol-id?
                                                                         global-extend
                                                                         lookup
                                                                         sanitize-binding
                                                                         lookup*
                                                                         displaced-lexical-error
                                                                         transformer-env
                                                                         extend-var-env*
                                                                         extend-env*
                                                                         extend-env
                                                                         null-env
                                                                         binding?
                                                                         set-binding-value!
                                                                         set-binding-type!
                                                                         binding-value
                                                                         binding-type
                                                                         make-binding
                                                                         arg-check
                                                                         source-annotation
                                                                         no-source
                                                                         unannotate
                                                                         set-syntax-object-wrap!
                                                                         set-syntax-object-expression!
                                                                         syntax-object-wrap
                                                                         syntax-object-expression
                                                                         syntax-object?
                                                                         make-syntax-object
                                                                         self-evaluating?
                                                                         build-lexical-var
                                                                         build-letrec
                                                                         build-sequence
                                                                         build-data
                                                                         build-primref
                                                                         build-lambda
                                                                         build-revisit-only
                                                                         build-visit-only
                                                                         build-cte-install
                                                                         build-module-definition
                                                                         build-global-definition
                                                                         build-global-assignment
                                                                         build-global-reference
                                                                         build-lexical-assignment
                                                                         build-lexical-reference
                                                                         build-conditional
                                                                         build-application
                                                                         generate-id
                                                                         get-import-binding
                                                                         get-global-definition-hook
                                                                         put-global-definition-hook
                                                                         gensym-hook
                                                                         error-hook
                                                                         local-eval-hook
                                                                         top-level-eval-hook
                                                                         annotation?
                                                                         fx<
                                                                         fx=
                                                                         fx-
                                                                         fx+
                                                                         noexpand
                                                                         define-structure
                                                                         unless
                                                                         when)
                                                                       ((top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top))
                                                                       ("i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"))
                                                                    #4(ribcage
                                                                       ((import-token
                                                                          .
                                                                          *top*))
                                                                       ()
                                                                       ())
                                                                    #4(ribcage
                                                                       ((import-token
                                                                          .
                                                                          *top*))
                                                                       ()
                                                                       ())))
                                                               %_1264
                                                               %_1265)
                                                         %_1243
                                                         '(())
                                                         %_1245
                                                         %_1246)
                                                  %_1243
                                                  '(())
                                                  %_1245
                                                  %_1246))
                                         (%_516 %_1251 %_1244)
                                         (%_516 %_1252 %_1244))
                                        (values
                                          'core
                                          (lambda (%_1256 %_1257 %_1258 %_1259)
                                            ((lambda (%_1260 %_1261)
                                               ((lambda (%_1262)
                                                  ((lambda (%_1263)
                                                     (if (memv %_1263
                                                               '(lexical))
                                                       (list 'set!
                                                             (%_578 %_1262)
                                                             %_1260)
                                                       (if (memv %_1263
                                                                 '(global))
                                                         (list 'set!
                                                               (%_578 %_1262)
                                                               %_1260)
                                                         (if (memv %_1263
                                                                   '(displaced-lexical))
                                                           (syntax-error
                                                             (%_516 %_1251
                                                                    %_1258)
                                                             '"identifier out of context")
                                                           (syntax-error
                                                             (%_515 %_1256
                                                                    %_1258
                                                                    %_1259))))))
                                                   (%_579 %_1262)))
                                                (%_567 %_1261 %_1257)))
                                             (%_474 %_1252 %_1257 %_1258)
                                             (%_524 %_1251 %_1258)))
                                          %_1242
                                          %_1244
                                          %_1245)))
                                    (%_579 %_1254)))
                                 (%_567 %_1253 %_1243)))
                              (%_524 %_1251 %_1244)))
                           %_1248)
                    ((lambda (%_1249)
                       (syntax-error (%_515 %_1242 %_1244 %_1245)))
                     %_1247)))
                ($syntax-dispatch %_1247 '(any any any))))
             %_1242)))
        (set! %_472
          (lambda (%_1269 %_1270 %_1271 %_1272 %_1273)
            ((lambda (%_1274)
               ((lambda (%_1275)
                  (if %_1275
                    (apply (lambda (%_1277 %_1278)
                             (cons %_1269
                                   (map (lambda (%_1279)
                                          (%_474 %_1279 %_1271 %_1272))
                                        %_1278)))
                           %_1275)
                    ((lambda (%_1276)
                       (syntax-error (%_515 %_1270 %_1272 %_1273)))
                     %_1274)))
                ($syntax-dispatch %_1274 '(any . each-any))))
             %_1270)))
        (set! %_473
          (lambda (%_1280 %_1281 %_1282 %_1283 %_1284 %_1285)
            ((lambda (%_1286)
               (if (memv %_1286 '(lexical))
                 %_1281
                 (if (memv %_1286 '(core))
                   (%_1281 %_1282 %_1283 %_1284 %_1285)
                   (if (memv %_1286 '(lexical-call))
                     (%_472 %_1281 %_1282 %_1283 %_1284 %_1285)
                     (if (memv %_1286 '(constant))
                       (list 'quote
                             (%_456 (%_515 %_1282 %_1284 %_1285) '(())))
                       (if (memv %_1286 '(global))
                         %_1281
                         (if (memv %_1286 '(call))
                           (%_472 (%_474 (car %_1282) %_1283 %_1284)
                                  %_1282
                                  %_1283
                                  %_1284
                                  %_1285)
                           (if (memv %_1286 '(begin-form))
                             ((lambda (%_1293)
                                ((lambda (%_1294)
                                   (if %_1294
                                     (apply (lambda (%_1295 %_1296 %_1297)
                                              (%_514 (cons %_1296 %_1297)
                                                     %_1283
                                                     %_1284
                                                     %_1285))
                                            %_1294)
                                     (syntax-error %_1293)))
                                 ($syntax-dispatch
                                   %_1293
                                   '(any any . each-any))))
                              %_1282)
                             (if (memv %_1286 '(local-syntax-form))
                               (%_461 %_1281 %_1282 %_1283 %_1284 %_1285 %_514)
                               (if (memv %_1286 '(eval-when-form))
                                 ((lambda (%_1287)
                                    ((lambda (%_1288)
                                       (if %_1288
                                         (apply (lambda (%_1289
                                                         %_1290
                                                         %_1291
                                                         %_1292)
                                                  (if (memq 'eval
                                                            (%_512 %_1290
                                                                   %_1284))
                                                    (%_514 (cons %_1291 %_1292)
                                                           %_1283
                                                           %_1284
                                                           %_1285)
                                                    (%_460)))
                                                %_1288)
                                         (syntax-error %_1287)))
                                     ($syntax-dispatch
                                       %_1287
                                       '(any each-any any . each-any))))
                                  %_1282)
                                 (if (memv %_1286
                                           '(define-form
                                              define-syntax-form
                                              module-form
                                              import-form))
                                   (syntax-error
                                     (%_515 %_1282 %_1284 %_1285)
                                     '"invalid context for definition")
                                   (if (memv %_1286 '(syntax))
                                     (syntax-error
                                       (%_515 %_1282 %_1284 %_1285)
                                       '"reference to pattern variable outside syntax form")
                                     (if (memv %_1286 '(displaced-lexical))
                                       (%_570 (%_515 %_1282 %_1284 %_1285))
                                       (syntax-error
                                         (%_515 %_1282
                                                %_1284
                                                %_1285)))))))))))))))
             %_1280)))
        (set! %_474
          (lambda (%_1298 %_1299 %_1300)
            (call-with-values
              (lambda () (%_511 %_1298 %_1299 %_1300 '#f '#f))
              (lambda (%_1301 %_1302 %_1303 %_1304 %_1305)
                (%_473 %_1301 %_1302 %_1303 %_1299 %_1304 %_1305)))))
        (set! %_475
          (lambda (%_1306 %_1307)
            (if (memq 'e %_1306)
              (begin (%_596 (%_1307)) (%_460))
              ((lambda (%_1308)
                 (if (memq 'r %_1306)
                   (if ((lambda (%_1310)
                          (if %_1310 %_1310 (memq 'v %_1306)))
                        (memq 'l %_1306))
                     (%_1308)
                     (%_1308))
                   (if ((lambda (%_1309)
                          (if %_1309 %_1309 (memq 'v %_1306)))
                        (memq 'l %_1306))
                     (%_1308)
                     (%_460))))
               (if (memq 'c %_1306)
                 ((lambda (%_1311)
                    (begin (%_596 %_1311) (lambda () %_1311)))
                  (%_1307))
                 %_1307)))))
        (set! %_476
          (lambda (%_1312 %_1313)
            (if (memq 'e %_1312)
              (%_1313)
              ((lambda (%_1314)
                 (if (memq 'v %_1312)
                   (if ((lambda (%_1316)
                          (if %_1316 %_1316 (memq 'r %_1312)))
                        (memq 'l %_1312))
                     (%_1314)
                     (%_1314))
                   (if ((lambda (%_1315)
                          (if %_1315 %_1315 (memq 'r %_1312)))
                        (memq 'l %_1312))
                     (%_1314)
                     (%_460))))
               (if (memq 'c %_1312)
                 ((lambda (%_1317)
                    (begin (%_596 %_1317) (lambda () %_1317)))
                  (%_1313))
                 %_1313)))))
        (set! %_477
          (lambda (%_1318 %_1319)
            (apply append
                   (map (lambda (%_1320)
                          (if %_1319
                            ((lambda (%_1322)
                               (if (memv %_1322 '(compile))
                                 '(c)
                                 (if (memv %_1322 '(load))
                                   '(l)
                                   (if (memv %_1322 '(visit))
                                     '(v)
                                     (if (memv %_1322 '(revisit)) '(r) '())))))
                             %_1320)
                            ((lambda (%_1321)
                               (if (memv %_1321 '(eval)) '(e) '()))
                             %_1320)))
                        %_1318))))
        (set! %_478
          ((lambda (%_1323)
             (lambda (%_1324 %_1325)
               (remq '-
                     (apply append
                            (map (lambda (%_1326)
                                   ((lambda (%_1327)
                                      (map (lambda (%_1328)
                                             (cdr (assq %_1328 %_1327)))
                                           %_1324))
                                    (cdr (assq %_1326 %_1323))))
                                 %_1325)))))
           '((l (load . l)
                (compile . c)
                (visit . v)
                (revisit . r)
                (eval . -))
             (c (load . -)
                (compile . -)
                (visit . -)
                (revisit . -)
                (eval . c))
             (v (load . v)
                (compile . c)
                (visit . v)
                (revisit . -)
                (eval . -))
             (r (load . r)
                (compile . c)
                (visit . -)
                (revisit . r)
                (eval . -))
             (e (load . -)
                (compile . -)
                (visit . -)
                (revisit . -)
                (eval . e)))))
        (set! %_479
          (lambda (%_1329 %_1330)
            (list '$sc-put-cte
                  (list 'quote %_1329)
                  (list 'quote (%_580 'do-import %_1330)))))
        (set! %_480
          (lambda (%_1331 %_1332)
            ((lambda (%_1333)
               (((lambda (%_1334)
                   (begin
                     (set! %_1334
                       (lambda (%_1335)
                         (if (not (= %_1335 %_1333))
                           (begin
                             (%_1331 (vector-ref %_1332 %_1335))
                             (%_1334 (+ %_1335 '1)))
                           (void))))
                     %_1334))
                 #f)
                '0))
             (vector-length %_1332))))
        (set! %_481
          (lambda (%_1336 %_1337)
            (((lambda (%_1338)
                (begin
                  (set! %_1338
                    (lambda (%_1339 %_1340)
                      (if (< %_1339 '0)
                        %_1340
                        (%_1338
                          (- %_1339 '1)
                          (cons (%_1336 (vector-ref %_1337 %_1339)) %_1340)))))
                  %_1338))
              #f)
             (- (vector-length %_1337) '1)
             '())))
        (set! %_482
          (lambda (%_1341
                   %_1342
                   %_1343
                   %_1344
                   %_1345
                   %_1346
                   %_1347
                   %_1348
                   %_1349)
            ((lambda (%_1350 %_1351 %_1352)
               (begin
                 (set! %_1350
                   (lambda (%_1416 %_1417)
                     ((lambda (%_1418)
                        (map (lambda (%_1419)
                               ((lambda (%_1420)
                                  (if (not (%_517 %_1420 %_1418))
                                    %_1419
                                    (%_499 (%_497 %_1419)
                                           %_1420
                                           (%_495 %_1419)
                                           (append
                                             (%_1351 %_1420)
                                             (%_494 %_1419))
                                           (%_493 %_1419))))
                                (%_496 %_1419)))
                             %_1416))
                      (map (lambda (%_1421)
                             (if (pair? %_1421) (car %_1421) %_1421))
                           %_1417))))
                 (set! %_1351
                   (lambda (%_1422)
                     (((lambda (%_1423)
                         (begin
                           (set! %_1423
                             (lambda (%_1424)
                               (if (null? %_1424)
                                 '()
                                 (if (if (pair? (car %_1424))
                                       (%_521 %_1422 (caar %_1424))
                                       '#f)
                                   (%_508 (cdar %_1424))
                                   (%_1423 (cdr %_1424))))))
                           %_1423))
                       #f)
                      %_1345)))
                 (set! %_1352
                   (lambda (%_1425 %_1426 %_1427)
                     (begin
                       (%_483 %_1342 %_1426)
                       (%_484 %_1342 %_1346 %_1426)
                       (%_1349 %_1425 %_1427))))
                 (((lambda (%_1353)
                     (begin
                       (set! %_1353
                         (lambda (%_1354 %_1355 %_1356 %_1357)
                           (if (null? %_1354)
                             (%_1352 %_1356 %_1355 %_1357)
                             ((lambda (%_1358 %_1359)
                                (call-with-values
                                  (lambda ()
                                    (%_511 %_1358 %_1359 '(()) '#f %_1341))
                                  (lambda (%_1360 %_1361 %_1362 %_1363 %_1364)
                                    ((lambda (%_1365)
                                       (if (memv %_1365 '(define-form))
                                         (%_464 %_1362
                                                %_1363
                                                %_1364
                                                (lambda (%_1410 %_1411 %_1412)
                                                  ((lambda (%_1413)
                                                     ((lambda (%_1414)
                                                        ((lambda (%_1415)
                                                           ((lambda ()
                                                              (begin
                                                                (%_538 %_1341
                                                                       %_1413
                                                                       %_1414)
                                                                (%_1353
                                                                  (cdr %_1354)
                                                                  (cons %_1413
                                                                        %_1355)
                                                                  (cons (%_499 %_1360
                                                                               %_1413
                                                                               %_1414
                                                                               %_1415
                                                                               (cons %_1359
                                                                                     (%_516 %_1411
                                                                                            %_1412)))
                                                                        %_1356)
                                                                  %_1357)))))
                                                         (%_1351 %_1413)))
                                                      (%_556)))
                                                   (%_516 %_1410 %_1412))))
                                         (if (memv %_1365
                                                   '(define-syntax-form))
                                           (%_463 %_1362
                                                  %_1363
                                                  %_1364
                                                  (lambda (%_1403
                                                           %_1404
                                                           %_1405)
                                                    ((lambda (%_1406)
                                                       ((lambda (%_1407)
                                                          ((lambda (%_1408)
                                                             ((lambda (%_1409)
                                                                ((lambda ()
                                                                   (begin
                                                                     (%_485 %_1344
                                                                            (%_554 %_1407)
                                                                            (cons 'deferred
                                                                                  %_1409))
                                                                     (%_538 %_1341
                                                                            %_1406
                                                                            %_1407)
                                                                     (%_1353
                                                                       (cdr %_1354)
                                                                       (cons %_1406
                                                                             %_1355)
                                                                       (cons (%_499 %_1360
                                                                                    %_1406
                                                                                    %_1407
                                                                                    %_1408
                                                                                    %_1409)
                                                                             %_1356)
                                                                       %_1357)))))
                                                              (%_474 %_1404
                                                                     (%_571 %_1359)
                                                                     %_1405)))
                                                           (%_1351 %_1406)))
                                                        (%_556)))
                                                     (%_516 %_1403 %_1405))))
                                           (if (memv %_1365 '(module-form))
                                             ((lambda (%_1390)
                                                ((lambda (%_1391)
                                                   ((lambda ()
                                                      (%_466 %_1362
                                                             %_1363
                                                             %_1364
                                                             %_1391
                                                             (lambda (%_1392
                                                                      %_1393
                                                                      %_1394)
                                                               (%_482 %_1390
                                                                      (%_515 %_1362
                                                                             %_1363
                                                                             %_1364)
                                                                      (map (lambda (%_1395)
                                                                             (cons %_1359
                                                                                   %_1395))
                                                                           %_1394)
                                                                      %_1344
                                                                      %_1393
                                                                      (%_508 %_1393)
                                                                      %_1347
                                                                      %_1348
                                                                      (lambda (%_1396
                                                                               %_1397)
                                                                        ((lambda (%_1398)
                                                                           ((lambda (%_1399)
                                                                              ((lambda (%_1400)
                                                                                 ((lambda ()
                                                                                    (if %_1392
                                                                                      ((lambda (%_1401
                                                                                                %_1402)
                                                                                         (begin
                                                                                           (%_485 %_1344
                                                                                                  (%_554 %_1401)
                                                                                                  (%_580 'module
                                                                                                         %_1398))
                                                                                           (%_538 %_1341
                                                                                                  %_1392
                                                                                                  %_1401)
                                                                                           (%_1353
                                                                                             (cdr %_1354)
                                                                                             (cons %_1392
                                                                                                   %_1355)
                                                                                             (cons (%_499 %_1360
                                                                                                          %_1392
                                                                                                          %_1401
                                                                                                          %_1402
                                                                                                          %_1393)
                                                                                                   %_1399)
                                                                                             %_1400)))
                                                                                       (%_556)
                                                                                       (%_1351
                                                                                         %_1392))
                                                                                      ((lambda ()
                                                                                         (begin
                                                                                           (%_467 %_1398
                                                                                                  %_1341)
                                                                                           (%_1353
                                                                                             (cdr %_1354)
                                                                                             (cons %_1398
                                                                                                   %_1355)
                                                                                             %_1399
                                                                                             %_1400))))))))
                                                                               (append
                                                                                 %_1357
                                                                                 %_1397)))
                                                                            (append
                                                                              (if %_1392
                                                                                %_1396
                                                                                (%_1350
                                                                                  %_1396
                                                                                  %_1393))
                                                                              %_1356)))
                                                                         (%_501 %_1393)))))))))
                                                 (%_562 (%_561 %_1363)
                                                        (cons %_1390
                                                              (%_560 %_1363)))))
                                              (%_552 '() '() '()))
                                             (if (memv %_1365 '(import-form))
                                               (%_465 %_1362
                                                      %_1363
                                                      %_1364
                                                      (lambda (%_1385)
                                                        ((lambda (%_1386)
                                                           ((lambda (%_1387)
                                                              ((lambda (%_1388)
                                                                 (if (memv %_1388
                                                                           '(module))
                                                                   ((lambda (%_1389)
                                                                      (begin
                                                                        (if %_1361
                                                                          (%_537 %_1341
                                                                                 %_1361)
                                                                          (void))
                                                                        (%_467 %_1389
                                                                               %_1341)
                                                                        (%_1353
                                                                          (cdr %_1354)
                                                                          (cons %_1389
                                                                                %_1355)
                                                                          (%_1350
                                                                            %_1356
                                                                            (vector->list
                                                                              (%_505 %_1389)))
                                                                          %_1357)))
                                                                    (%_578 %_1387))
                                                                   (if (memv %_1388
                                                                             '(displaced-lexical))
                                                                     (%_570 %_1385)
                                                                     (syntax-error
                                                                       %_1385
                                                                       '"import from unknown module"))))
                                                               (%_579 %_1387)))
                                                            (%_567 %_1386
                                                                   %_1344)))
                                                         (%_524 %_1385
                                                                '(())))))
                                               (if (memv %_1365 '(begin-form))
                                                 ((lambda (%_1379)
                                                    ((lambda (%_1380)
                                                       (if %_1380
                                                         (apply (lambda (%_1381
                                                                         %_1382)
                                                                  (%_1353
                                                                    (((lambda (%_1383)
                                                                        (begin
                                                                          (set! %_1383
                                                                            (lambda (%_1384)
                                                                              (if (null? %_1384)
                                                                                (cdr %_1354)
                                                                                (cons (cons %_1359
                                                                                            (%_516 (car %_1384)
                                                                                                   %_1363))
                                                                                      (%_1383
                                                                                        (cdr %_1384))))))
                                                                          %_1383))
                                                                      #f)
                                                                     %_1382)
                                                                    %_1355
                                                                    %_1356
                                                                    %_1357))
                                                                %_1380)
                                                         (syntax-error
                                                           %_1379)))
                                                     ($syntax-dispatch
                                                       %_1379
                                                       '(any . each-any))))
                                                  %_1362)
                                                 (if (memv %_1365
                                                           '(eval-when-form))
                                                   ((lambda (%_1372)
                                                      ((lambda (%_1373)
                                                         (if %_1373
                                                           (apply (lambda (%_1374
                                                                           %_1375
                                                                           %_1376)
                                                                    (%_1353
                                                                      (if (memq 'eval
                                                                                (%_512 %_1375
                                                                                       %_1363))
                                                                        (((lambda (%_1377)
                                                                            (begin
                                                                              (set! %_1377
                                                                                (lambda (%_1378)
                                                                                  (if (null? %_1378)
                                                                                    (cdr %_1354)
                                                                                    (cons (cons %_1359
                                                                                                (%_516 (car %_1378)
                                                                                                       %_1363))
                                                                                          (%_1377
                                                                                            (cdr %_1378))))))
                                                                              %_1377))
                                                                          #f)
                                                                         %_1376)
                                                                        (cdr %_1354))
                                                                      %_1355
                                                                      %_1356
                                                                      %_1357))
                                                                  %_1373)
                                                           (syntax-error
                                                             %_1372)))
                                                       ($syntax-dispatch
                                                         %_1372
                                                         '(any each-any
                                                               .
                                                               each-any))))
                                                    %_1362)
                                                   (if (memv %_1365
                                                             '(local-syntax-form))
                                                     (%_461 %_1361
                                                            %_1362
                                                            %_1359
                                                            %_1363
                                                            %_1364
                                                            (lambda (%_1366
                                                                     %_1367
                                                                     %_1368
                                                                     %_1369)
                                                              (%_1353
                                                                (((lambda (%_1370)
                                                                    (begin
                                                                      (set! %_1370
                                                                        (lambda (%_1371)
                                                                          (if (null? %_1371)
                                                                            (cdr %_1354)
                                                                            (cons (cons %_1367
                                                                                        (%_516 (car %_1371)
                                                                                               %_1368))
                                                                                  (%_1370
                                                                                    (cdr %_1371))))))
                                                                      %_1370))
                                                                  #f)
                                                                 %_1366)
                                                                %_1355
                                                                %_1356
                                                                %_1357)))
                                                     (%_1352
                                                       %_1356
                                                       %_1355
                                                       (append
                                                         %_1357
                                                         (cons (cons %_1359
                                                                     (%_515 %_1362
                                                                            %_1363
                                                                            %_1364))
                                                               (cdr %_1354))))))))))))
                                     %_1360))))
                              (cdar %_1354)
                              (caar %_1354)))))
                       %_1353))
                   #f)
                  %_1343
                  '()
                  '()
                  '())))
             #f
             #f
             #f)))
        (set! %_483
          (lambda (%_1428 %_1429)
            ((lambda (%_1430 %_1431 %_1432 %_1433)
               (begin
                 (set! %_1430
                   (lambda (%_1442 %_1443 %_1444)
                     ((lambda (%_1445)
                        (if %_1445
                          (if (%_534 ((lambda (%_1448)
                                        ((lambda (%_1449)
                                           (if (%_597 %_1449)
                                             (annotation-expression %_1449)
                                             %_1449))
                                         (if (%_586 %_1448)
                                           (%_585 %_1448)
                                           %_1448)))
                                      %_1442)
                                     %_1445
                                     (if (symbol? %_1442)
                                       (%_561 '((top)))
                                       (%_561 (%_584 %_1442))))
                            (cons %_1442 %_1444)
                            %_1444)
                          (%_1432
                            (%_505 %_1443)
                            (lambda (%_1446 %_1447)
                              (if (%_1433 %_1446 %_1442)
                                (cons %_1446 %_1447)
                                %_1447))
                            %_1444)))
                      (%_504 %_1443))))
                 (set! %_1431
                   (lambda (%_1450 %_1451 %_1452)
                     (if (%_506 %_1450)
                       (if (%_506 %_1451)
                         (call-with-values
                           (lambda ()
                             ((lambda (%_1453 %_1454)
                                (if (fx> (vector-length %_1453)
                                         (vector-length %_1454))
                                  (values %_1450 %_1454)
                                  (values %_1451 %_1453)))
                              (%_505 %_1450)
                              (%_505 %_1451)))
                           (lambda (%_1455 %_1456)
                             (%_1432
                               %_1456
                               (lambda (%_1457 %_1458)
                                 (%_1430 %_1457 %_1455 %_1458))
                               %_1452)))
                         (%_1430 %_1451 %_1450 %_1452))
                       (if (%_506 %_1451)
                         (%_1430 %_1450 %_1451 %_1452)
                         (if (%_1433 %_1450 %_1451)
                           (cons %_1450 %_1452)
                           %_1452)))))
                 (set! %_1432
                   (lambda (%_1459 %_1460 %_1461)
                     ((lambda (%_1462)
                        (((lambda (%_1463)
                            (begin
                              (set! %_1463
                                (lambda (%_1464 %_1465)
                                  (if (= %_1464 %_1462)
                                    %_1465
                                    (%_1463
                                      (+ %_1464 '1)
                                      (%_1460
                                        (vector-ref %_1459 %_1464)
                                        %_1465)))))
                              %_1463))
                          #f)
                         '0
                         %_1461))
                      (vector-length %_1459))))
                 (set! %_1433
                   (lambda (%_1466 %_1467)
                     (if (symbol? %_1466)
                       (if (symbol? %_1467)
                         (eq? %_1466 %_1467)
                         (if (eq? %_1466
                                  ((lambda (%_1470)
                                     ((lambda (%_1471)
                                        (if (%_597 %_1471)
                                          (annotation-expression %_1471)
                                          %_1471))
                                      (if (%_586 %_1470)
                                        (%_585 %_1470)
                                        %_1470)))
                                   %_1467))
                           (%_528 (%_561 (%_584 %_1467)) (%_561 '((top))))
                           '#f))
                       (if (symbol? %_1467)
                         (if (eq? %_1467
                                  ((lambda (%_1468)
                                     ((lambda (%_1469)
                                        (if (%_597 %_1469)
                                          (annotation-expression %_1469)
                                          %_1469))
                                      (if (%_586 %_1468)
                                        (%_585 %_1468)
                                        %_1468)))
                                   %_1466))
                           (%_528 (%_561 (%_584 %_1466)) (%_561 '((top))))
                           '#f)
                         (%_521 %_1466 %_1467)))))
                 (if (not (null? %_1429))
                   (((lambda (%_1434)
                       (begin
                         (set! %_1434
                           (lambda (%_1435 %_1436 %_1437)
                             (if (null? %_1436)
                               (if (not (null? %_1437))
                                 ((lambda (%_1441)
                                    (syntax-error
                                      %_1428
                                      '"duplicate definition for "
                                      (symbol->string (car %_1441))
                                      '" in"))
                                  (syntax-object->datum %_1437))
                                 (void))
                               (((lambda (%_1438)
                                   (begin
                                     (set! %_1438
                                       (lambda (%_1439 %_1440)
                                         (if (null? %_1439)
                                           (%_1434
                                             (car %_1436)
                                             (cdr %_1436)
                                             %_1440)
                                           (%_1438
                                             (cdr %_1439)
                                             (%_1431
                                               %_1435
                                               (car %_1439)
                                               %_1440)))))
                                     %_1438))
                                 #f)
                                %_1436
                                %_1437))))
                         %_1434))
                     #f)
                    (car %_1429)
                    (cdr %_1429)
                    '())
                   (void))))
             #f
             #f
             #f
             #f)))
        (set! %_484
          (lambda (%_1472 %_1473 %_1474)
            ((lambda (%_1475)
               (begin
                 (set! %_1475
                   (lambda (%_1481 %_1482)
                     (ormap (lambda (%_1483)
                              (if (%_506 %_1483)
                                ((lambda (%_1484)
                                   (if %_1484
                                     (%_534 ((lambda (%_1489)
                                               ((lambda (%_1490)
                                                  (if (%_597 %_1490)
                                                    (annotation-expression
                                                      %_1490)
                                                    %_1490))
                                                (if (%_586 %_1489)
                                                  (%_585 %_1489)
                                                  %_1489)))
                                             %_1481)
                                            %_1484
                                            (%_561 (%_584 %_1481)))
                                     ((lambda (%_1485)
                                        (((lambda (%_1486)
                                            (begin
                                              (set! %_1486
                                                (lambda (%_1487)
                                                  (if (fx>= %_1487 '0)
                                                    ((lambda (%_1488)
                                                       (if %_1488
                                                         %_1488
                                                         (%_1486
                                                           (- %_1487 '1))))
                                                     (%_521 %_1481
                                                            (vector-ref
                                                              %_1485
                                                              %_1487)))
                                                    '#f)))
                                              %_1486))
                                          #f)
                                         (- (vector-length %_1485) '1)))
                                      (%_505 %_1483))))
                                 (%_504 %_1483))
                                (%_521 %_1481 %_1483)))
                            %_1482)))
                 (((lambda (%_1476)
                     (begin
                       (set! %_1476
                         (lambda (%_1477 %_1478)
                           (if (null? %_1477)
                             (if (not (null? %_1478))
                               (syntax-error
                                 %_1478
                                 '"missing definition for export(s)")
                               (void))
                             ((lambda (%_1479 %_1480)
                                (if (%_1475 %_1479 %_1474)
                                  (%_1476 %_1480 %_1478)
                                  (%_1476 %_1480 (cons %_1479 %_1478))))
                              (car %_1477)
                              (cdr %_1477)))))
                       %_1476))
                   #f)
                  %_1473
                  '())))
             #f)))
        (set! %_485
          (lambda (%_1491 %_1492 %_1493)
            (set-cdr!
              %_1491
              (%_574 %_1492 %_1493 (cdr %_1491)))))
        (set! %_486
          (lambda (%_1494 %_1495)
            (if (null? %_1494)
              '()
              (if (%_517 (car %_1494) %_1495)
                (%_486 (cdr %_1494) %_1495)
                (cons (car %_1494) (%_486 (cdr %_1494) %_1495))))))
        (set! %_487
          (lambda (%_1496
                   %_1497
                   %_1498
                   %_1499
                   %_1500
                   %_1501
                   %_1502
                   %_1503
                   %_1504
                   %_1505)
            ((lambda (%_1506)
               (%_482 %_1498
                      (%_515 %_1496 %_1499 %_1500)
                      (map (lambda (%_1507) (cons %_1497 %_1507))
                           %_1505)
                      %_1497
                      %_1504
                      %_1506
                      %_1501
                      %_1502
                      (lambda (%_1508 %_1509)
                        (((lambda (%_1510)
                            (begin
                              (set! %_1510
                                (lambda (%_1511 %_1512 %_1513 %_1514 %_1515)
                                  (if (null? %_1511)
                                    (((lambda (%_1537)
                                        (begin
                                          (set! %_1537
                                            (lambda (%_1538 %_1539 %_1540)
                                              (if (null? %_1538)
                                                ((lambda (%_1544 %_1545 %_1546)
                                                   (begin
                                                     (for-each
                                                       (lambda (%_1547)
                                                         (apply (lambda (%_1548
                                                                         %_1549
                                                                         %_1550
                                                                         %_1551)
                                                                  (if %_1549
                                                                    (%_553 %_1549
                                                                           %_1550)
                                                                    (void)))
                                                                %_1547))
                                                       %_1515)
                                                     (%_589 '#f
                                                            (list (%_475 %_1501
                                                                         (lambda ()
                                                                           (if (null? %_1515)
                                                                             (%_460)
                                                                             (%_589 '#f
                                                                                    (map (lambda (%_1552)
                                                                                           (apply (lambda (%_1553
                                                                                                           %_1554
                                                                                                           %_1555
                                                                                                           %_1556)
                                                                                                    (list '$sc-put-cte
                                                                                                          (list 'quote
                                                                                                                %_1555)
                                                                                                          (if (eq? %_1553
                                                                                                                   'define-syntax-form)
                                                                                                            %_1556
                                                                                                            (list 'quote
                                                                                                                  (%_580 'module
                                                                                                                         (%_500 %_1556
                                                                                                                                %_1555))))))
                                                                                                  %_1552))
                                                                                         %_1515)))))
                                                                  (%_475 %_1501
                                                                         (lambda ()
                                                                           ((lambda (%_1557)
                                                                              ((lambda (%_1558)
                                                                                 ((lambda (%_1559)
                                                                                    ((lambda ()
                                                                                       (if %_1557
                                                                                         (list '$sc-put-cte
                                                                                               (list 'quote
                                                                                                     (if (%_528 (%_561 (%_584 %_1503))
                                                                                                                (%_561 '((top))))
                                                                                                       %_1557
                                                                                                       ((lambda (%_1561)
                                                                                                          (%_587 %_1557
                                                                                                                 (%_562 %_1561
                                                                                                                        (list (%_552 (vector
                                                                                                                                       %_1557)
                                                                                                                                     (vector
                                                                                                                                       %_1561)
                                                                                                                                     (vector
                                                                                                                                       (%_590 %_1557)))))))
                                                                                                        (%_561 (%_584 %_1503)))))
                                                                                               %_1559)
                                                                                         ((lambda (%_1560)
                                                                                            (%_589 '#f
                                                                                                   (list (list '$sc-put-cte
                                                                                                               (list 'quote
                                                                                                                     %_1560)
                                                                                                               %_1559)
                                                                                                         (%_479 %_1560
                                                                                                                %_1558))))
                                                                                          (%_590 'tmp))))))
                                                                                  (list 'quote
                                                                                        (%_580 'module
                                                                                               (%_500 %_1504
                                                                                                      %_1558)))))
                                                                               (%_590 %_1557)))
                                                                            (if %_1503
                                                                              ((lambda (%_1562)
                                                                                 ((lambda (%_1563)
                                                                                    (if (%_597 %_1563)
                                                                                      (annotation-expression
                                                                                        %_1563)
                                                                                      %_1563))
                                                                                  (if (%_586 %_1562)
                                                                                    (%_585 %_1562)
                                                                                    %_1562)))
                                                                               %_1503)
                                                                              '#f))))
                                                                  (if (null? %_1513)
                                                                    (%_460)
                                                                    (%_589 '#f
                                                                           (map (lambda (%_1564)
                                                                                  (list 'define
                                                                                        %_1564
                                                                                        (%_460)))
                                                                                %_1513)))
                                                                  (%_588 '#f
                                                                         %_1539
                                                                         %_1545
                                                                         (%_589 '#f
                                                                                (list (if (null? %_1513)
                                                                                        (%_460)
                                                                                        (%_589 '#f
                                                                                               (map (lambda (%_1565
                                                                                                             %_1566)
                                                                                                      (list 'set!
                                                                                                            %_1565
                                                                                                            %_1566))
                                                                                                    %_1513
                                                                                                    %_1544)))
                                                                                      (if (null? %_1546)
                                                                                        (%_460)
                                                                                        (%_589 '#f
                                                                                               %_1546)))))
                                                                  (%_460)))))
                                                 (map (lambda (%_1567)
                                                        (%_474 (cdr %_1567)
                                                               (car %_1567)
                                                               '(())))
                                                      %_1514)
                                                 (map (lambda (%_1568)
                                                        (%_474 (cdr %_1568)
                                                               (car %_1568)
                                                               '(())))
                                                      %_1540)
                                                 (map (lambda (%_1569)
                                                        (%_474 (cdr %_1569)
                                                               (car %_1569)
                                                               '(())))
                                                      %_1509))
                                                ((lambda (%_1541)
                                                   ((lambda (%_1542)
                                                      (if (memv %_1542
                                                                '(define-form))
                                                        ((lambda (%_1543)
                                                           (begin
                                                             (%_485 %_1497
                                                                    (%_554 (%_495 %_1541))
                                                                    (%_580 'lexical
                                                                           %_1543))
                                                             (%_1537
                                                               (cdr %_1538)
                                                               (cons %_1543
                                                                     %_1539)
                                                               (cons (%_493 %_1541)
                                                                     %_1540))))
                                                         (%_455 (%_496 %_1541)))
                                                        (if (memv %_1542
                                                                  '(define-syntax-form
                                                                     module-form))
                                                          (%_1537
                                                            (cdr %_1538)
                                                            %_1539
                                                            %_1540)
                                                          (error 'sc-expand-internal
                                                                 '"unexpected module binding type"))))
                                                    (%_497 %_1541)))
                                                 (car %_1538)))))
                                          %_1537))
                                      #f)
                                     %_1512
                                     '()
                                     '())
                                    ((lambda (%_1516 %_1517)
                                       ((lambda (%_1518)
                                          (begin
                                            (set! %_1518
                                              (lambda (%_1530
                                                       %_1531
                                                       %_1532
                                                       %_1533)
                                                (((lambda (%_1534)
                                                    (begin
                                                      (set! %_1534
                                                        (lambda (%_1535 %_1536)
                                                          (if (null? %_1535)
                                                            (%_1533)
                                                            (if (%_521 (%_496 (car %_1535))
                                                                       %_1530)
                                                              (%_1532
                                                                (car %_1535)
                                                                (%_531 (reverse
                                                                         %_1536)
                                                                       (cdr %_1535)))
                                                              (%_1534
                                                                (cdr %_1535)
                                                                (cons (car %_1535)
                                                                      %_1536))))))
                                                      %_1534))
                                                  #f)
                                                 %_1531
                                                 '())))
                                            (%_1518
                                              %_1516
                                              %_1512
                                              (lambda (%_1519 %_1520)
                                                ((lambda (%_1521 %_1522 %_1523)
                                                   ((lambda (%_1524 %_1525)
                                                      ((lambda (%_1526)
                                                         (if (memv %_1526
                                                                   '(define-form))
                                                           (begin
                                                             (%_553 %_1522
                                                                    %_1525)
                                                             (%_1510
                                                               %_1524
                                                               %_1520
                                                               (cons %_1525
                                                                     %_1513)
                                                               (cons (%_493 %_1519)
                                                                     %_1514)
                                                               %_1515))
                                                           (if (memv %_1526
                                                                     '(define-syntax-form))
                                                             (%_1510
                                                               %_1524
                                                               %_1520
                                                               %_1513
                                                               %_1514
                                                               (cons (list %_1521
                                                                           %_1522
                                                                           %_1525
                                                                           (%_493 %_1519))
                                                                     %_1515))
                                                             (if (memv %_1526
                                                                       '(module-form))
                                                               ((lambda (%_1527)
                                                                  (%_1510
                                                                    (append
                                                                      (%_508 %_1527)
                                                                      %_1524)
                                                                    %_1520
                                                                    %_1513
                                                                    %_1514
                                                                    (cons (list %_1521
                                                                                %_1522
                                                                                %_1525
                                                                                %_1527)
                                                                          %_1515)))
                                                                (%_493 %_1519))
                                                               (error 'sc-expand-internal
                                                                      '"unexpected module binding type")))))
                                                       %_1521))
                                                    (append %_1523 %_1517)
                                                    (%_590 ((lambda (%_1528)
                                                              ((lambda (%_1529)
                                                                 (if (%_597 %_1529)
                                                                   (annotation-expression
                                                                     %_1529)
                                                                   %_1529))
                                                               (if (%_586 %_1528)
                                                                 (%_585 %_1528)
                                                                 %_1528)))
                                                            %_1516))))
                                                 (%_497 %_1519)
                                                 (%_495 %_1519)
                                                 (%_494 %_1519)))
                                              (lambda ()
                                                (%_1510
                                                  %_1517
                                                  %_1512
                                                  %_1513
                                                  %_1514
                                                  %_1515)))))
                                        #f))
                                     (car %_1511)
                                     (cdr %_1511)))))
                              %_1510))
                          #f)
                         %_1506
                         %_1508
                         '()
                         '()
                         '()))))
             (%_508 %_1504))))
        (set! %_488
          (lambda (%_1570 %_1571)
            (vector-set! %_1570 '5 %_1571)))
        (set! %_489
          (lambda (%_1572 %_1573)
            (vector-set! %_1572 '4 %_1573)))
        (set! %_490
          (lambda (%_1574 %_1575)
            (vector-set! %_1574 '3 %_1575)))
        (set! %_491
          (lambda (%_1576 %_1577)
            (vector-set! %_1576 '2 %_1577)))
        (set! %_492
          (lambda (%_1578 %_1579)
            (vector-set! %_1578 '1 %_1579)))
        (set! %_493
          (lambda (%_1580) (vector-ref %_1580 '5)))
        (set! %_494
          (lambda (%_1581) (vector-ref %_1581 '4)))
        (set! %_495
          (lambda (%_1582) (vector-ref %_1582 '3)))
        (set! %_496
          (lambda (%_1583) (vector-ref %_1583 '2)))
        (set! %_497
          (lambda (%_1584) (vector-ref %_1584 '1)))
        (set! %_498
          (lambda (%_1585)
            (if (vector? %_1585)
              (if (= (vector-length %_1585) '6)
                (eq? (vector-ref %_1585 '0) 'module-binding)
                '#f)
              '#f)))
        (set! %_499
          (lambda (%_1586 %_1587 %_1588 %_1589 %_1590)
            (vector
              'module-binding
              %_1586
              %_1587
              %_1588
              %_1589
              %_1590)))
        (set! %_500
          (lambda (%_1591 %_1592)
            (%_507 (list->vector
                     (map (lambda (%_1593)
                            (%_532 (if (pair? %_1593) (car %_1593) %_1593)))
                          %_1591))
                   %_1592)))
        (set! %_501
          (lambda (%_1594)
            (%_507 (list->vector
                     (map (lambda (%_1595)
                            (if (pair? %_1595) (car %_1595) %_1595))
                          %_1594))
                   '#f)))
        (set! %_502
          (lambda (%_1596 %_1597)
            (vector-set! %_1596 '2 %_1597)))
        (set! %_503
          (lambda (%_1598 %_1599)
            (vector-set! %_1598 '1 %_1599)))
        (set! %_504
          (lambda (%_1600) (vector-ref %_1600 '2)))
        (set! %_505
          (lambda (%_1601) (vector-ref %_1601 '1)))
        (set! %_506
          (lambda (%_1602)
            (if (vector? %_1602)
              (if (= (vector-length %_1602) '3)
                (eq? (vector-ref %_1602 '0) 'interface)
                '#f)
              '#f)))
        (set! %_507
          (lambda (%_1603 %_1604)
            (vector 'interface %_1603 %_1604)))
        (set! %_508
          (lambda (%_1605)
            (((lambda (%_1606)
                (begin
                  (set! %_1606
                    (lambda (%_1607 %_1608)
                      (if (null? %_1607)
                        %_1608
                        (%_1606
                          (cdr %_1607)
                          (if (pair? (car %_1607))
                            (%_1606 (car %_1607) %_1608)
                            (cons (car %_1607) %_1608))))))
                  %_1606))
              #f)
             %_1605
             '())))
        (set! %_509
          (lambda (%_1609 %_1610 %_1611 %_1612 %_1613 %_1614)
            (call-with-values
              (lambda ()
                (%_511 %_1609 %_1610 %_1611 '#f %_1614))
              (lambda (%_1615 %_1616 %_1617 %_1618 %_1619)
                ((lambda (%_1620)
                   (if (memv %_1620 '(begin-form))
                     ((lambda (%_1669)
                        ((lambda (%_1670)
                           (if %_1670
                             (apply (lambda (%_1675) (%_460)) %_1670)
                             ((lambda (%_1671)
                                (if %_1671
                                  (apply (lambda (%_1672 %_1673 %_1674)
                                           (%_513 (cons %_1673 %_1674)
                                                  %_1610
                                                  %_1618
                                                  %_1619
                                                  %_1612
                                                  %_1613
                                                  %_1614))
                                         %_1671)
                                  (syntax-error %_1669)))
                              ($syntax-dispatch
                                %_1669
                                '(any any . each-any)))))
                         ($syntax-dispatch %_1669 '(any))))
                      %_1617)
                     (if (memv %_1620 '(local-syntax-form))
                       (%_461 %_1616
                              %_1617
                              %_1610
                              %_1618
                              %_1619
                              (lambda (%_1665 %_1666 %_1667 %_1668)
                                (%_513 %_1665
                                       %_1666
                                       %_1667
                                       %_1668
                                       %_1612
                                       %_1613
                                       %_1614)))
                       (if (memv %_1620 '(eval-when-form))
                         ((lambda (%_1655)
                            ((lambda (%_1656)
                               (if %_1656
                                 (apply (lambda (%_1657 %_1658 %_1659 %_1660)
                                          ((lambda (%_1661 %_1662)
                                             ((lambda (%_1663 %_1664)
                                                (if (if (null? %_1663)
                                                      (null? %_1664)
                                                      '#f)
                                                  (%_460)
                                                  (%_513 %_1662
                                                         %_1610
                                                         %_1618
                                                         %_1619
                                                         %_1663
                                                         %_1664
                                                         %_1614)))
                                              (%_478 %_1661 %_1612)
                                              (%_478 %_1661 %_1613)))
                                           (%_512 %_1658 %_1618)
                                           (cons %_1659 %_1660)))
                                        %_1656)
                                 (syntax-error %_1655)))
                             ($syntax-dispatch
                               %_1655
                               '(any each-any any . each-any))))
                          %_1617)
                         (if (memv %_1620 '(define-syntax-form))
                           (%_463 %_1617
                                  %_1618
                                  %_1619
                                  (lambda (%_1644 %_1645 %_1646)
                                    ((lambda (%_1647)
                                       (begin
                                         ((lambda (%_1648)
                                            ((lambda (%_1649)
                                               ((lambda (%_1650)
                                                  (if (memv %_1650
                                                            '(displaced-lexical))
                                                    (%_570 %_1647)
                                                    (void)))
                                                (%_579 %_1649)))
                                             (%_567 %_1648 %_1610)))
                                          (%_524 %_1647 '(())))
                                         (%_475 %_1612
                                                (lambda ()
                                                  (list '$sc-put-cte
                                                        (list 'quote
                                                              ((lambda (%_1651)
                                                                 (if (%_528 (%_561 (%_584 %_1647))
                                                                            (%_561 '((top))))
                                                                   %_1651
                                                                   ((lambda (%_1652)
                                                                      (%_587 %_1651
                                                                             (%_562 %_1652
                                                                                    (list (%_552 (vector
                                                                                                   %_1651)
                                                                                                 (vector
                                                                                                   %_1652)
                                                                                                 (vector
                                                                                                   (%_590 %_1651)))))))
                                                                    (%_561 (%_584 %_1647)))))
                                                               ((lambda (%_1653)
                                                                  ((lambda (%_1654)
                                                                     (if (%_597 %_1654)
                                                                       (annotation-expression
                                                                         %_1654)
                                                                       %_1654))
                                                                   (if (%_586 %_1653)
                                                                     (%_585 %_1653)
                                                                     %_1653)))
                                                                %_1647)))
                                                        (%_474 %_1645
                                                               (%_571 %_1610)
                                                               %_1646))))))
                                     (%_516 %_1644 %_1646))))
                           (if (memv %_1620 '(define-form))
                             (%_464 %_1617
                                    %_1618
                                    %_1619
                                    (lambda (%_1632 %_1633 %_1634)
                                      ((lambda (%_1635)
                                         (begin
                                           ((lambda (%_1636)
                                              ((lambda (%_1637)
                                                 ((lambda (%_1638)
                                                    (if (memv %_1638
                                                              '(displaced-lexical))
                                                      (%_570 %_1635)
                                                      (void)))
                                                  (%_579 %_1637)))
                                               (%_567 %_1636 %_1610)))
                                            (%_524 %_1635 '(())))
                                           ((lambda (%_1639)
                                              ((lambda (%_1640)
                                                 (%_589 '#f
                                                        (list (%_475 %_1612
                                                                     (lambda ()
                                                                       (list '$sc-put-cte
                                                                             (list 'quote
                                                                                   (if (eq? %_1639
                                                                                            %_1640)
                                                                                     %_1639
                                                                                     ((lambda (%_1641)
                                                                                        (%_587 %_1639
                                                                                               (%_562 %_1641
                                                                                                      (list (%_552 (vector
                                                                                                                     %_1639)
                                                                                                                   (vector
                                                                                                                     %_1641)
                                                                                                                   (vector
                                                                                                                     %_1640))))))
                                                                                      (%_561 (%_584 %_1635)))))
                                                                             (list 'quote
                                                                                   (%_580 'global
                                                                                          %_1640)))))
                                                              (%_476 %_1613
                                                                     (lambda ()
                                                                       (list 'define
                                                                             %_1640
                                                                             (%_474 %_1633
                                                                                    %_1610
                                                                                    %_1634)))))))
                                               (if (%_528 (%_561 (%_584 %_1635))
                                                          (%_561 '((top))))
                                                 %_1639
                                                 (%_590 %_1639))))
                                            ((lambda (%_1642)
                                               ((lambda (%_1643)
                                                  (if (%_597 %_1643)
                                                    (annotation-expression
                                                      %_1643)
                                                    %_1643))
                                                (if (%_586 %_1642)
                                                  (%_585 %_1642)
                                                  %_1642)))
                                             %_1635))))
                                       (%_516 %_1632 %_1634))))
                             (if (memv %_1620 '(module-form))
                               ((lambda (%_1624 %_1625)
                                  (%_466 %_1617
                                         %_1618
                                         %_1619
                                         (%_562 (%_561 %_1618)
                                                (cons %_1625 (%_560 %_1618)))
                                         (lambda (%_1626 %_1627 %_1628)
                                           (if %_1626
                                             (begin
                                               ((lambda (%_1629)
                                                  ((lambda (%_1630)
                                                     ((lambda (%_1631)
                                                        (if (memv %_1631
                                                                  '(displaced-lexical))
                                                          (%_570 (%_516 %_1626
                                                                        %_1618))
                                                          (void)))
                                                      (%_579 %_1630)))
                                                   (%_567 %_1629 %_1624)))
                                                (%_524 %_1626 '(())))
                                               (%_487 %_1617
                                                      %_1624
                                                      %_1625
                                                      %_1618
                                                      %_1619
                                                      %_1612
                                                      %_1613
                                                      %_1626
                                                      %_1627
                                                      %_1628))
                                             (%_487 %_1617
                                                    %_1624
                                                    %_1625
                                                    %_1618
                                                    %_1619
                                                    %_1612
                                                    %_1613
                                                    '#f
                                                    %_1627
                                                    %_1628)))))
                                (cons '("top-level module placeholder"
                                        placeholder)
                                      %_1610)
                                (%_552 '() '() '()))
                               (if (memv %_1620 '(import-form))
                                 (%_465 %_1617
                                        %_1618
                                        %_1619
                                        (lambda (%_1621)
                                          (%_475 %_1612
                                                 (lambda ()
                                                   (begin
                                                     (if %_1616
                                                       (syntax-error
                                                         (%_515 %_1617
                                                                %_1618
                                                                %_1619)
                                                         '"not valid at top-level")
                                                       (void))
                                                     ((lambda (%_1622)
                                                        ((lambda (%_1623)
                                                           (if (memv %_1623
                                                                     '(module))
                                                             (%_479 %_1621
                                                                    (%_504 (%_578 %_1622)))
                                                             (if (memv %_1623
                                                                       '(displaced-lexical))
                                                               (%_570 %_1621)
                                                               (syntax-error
                                                                 %_1621
                                                                 '"import from unknown module"))))
                                                         (%_579 %_1622)))
                                                      (%_567 (%_524 %_1621
                                                                    '(()))
                                                             '())))))))
                                 (%_476 %_1613
                                        (lambda ()
                                          (%_473 %_1615
                                                 %_1616
                                                 %_1617
                                                 %_1610
                                                 %_1618
                                                 %_1619)))))))))))
                 %_1615)))))
        (set! %_510
          (lambda (%_1676 %_1677 %_1678 %_1679)
            (call-with-values
              (lambda ()
                (%_511 %_1676 %_1677 %_1678 '#f %_1679))
              (lambda (%_1680 %_1681 %_1682 %_1683 %_1684)
                (%_473 %_1680 %_1681 %_1682 %_1677 %_1683 %_1684)))))
        (set! %_511
          (lambda (%_1685 %_1686 %_1687 %_1688 %_1689)
            (if (symbol? %_1685)
              ((lambda (%_1700)
                 ((lambda (%_1701)
                    ((lambda (%_1702)
                       ((lambda ()
                          ((lambda (%_1703)
                             (if (memv %_1703 '(lexical))
                               (values
                                 %_1702
                                 (%_578 %_1701)
                                 %_1685
                                 %_1687
                                 %_1688)
                               (if (memv %_1703 '(global))
                                 (values
                                   %_1702
                                   (%_578 %_1701)
                                   %_1685
                                   %_1687
                                   %_1688)
                                 (if (memv %_1703 '(macro macro!))
                                   (%_511 (%_470 (%_578 %_1701)
                                                 %_1685
                                                 %_1686
                                                 %_1687
                                                 %_1688
                                                 %_1689)
                                          %_1686
                                          '(())
                                          '#f
                                          %_1689)
                                   (values
                                     %_1702
                                     (%_578 %_1701)
                                     %_1685
                                     %_1687
                                     %_1688)))))
                           %_1702))))
                     (%_579 %_1701)))
                  (%_567 %_1700 %_1686)))
               (%_524 %_1685 %_1687))
              (if (pair? %_1685)
                ((lambda (%_1695)
                   (if (%_564 %_1695)
                     ((lambda (%_1696)
                        ((lambda (%_1697)
                           ((lambda (%_1698)
                              ((lambda ()
                                 ((lambda (%_1699)
                                    (if (memv %_1699 '(lexical))
                                      (values
                                        'lexical-call
                                        (%_578 %_1697)
                                        %_1685
                                        %_1687
                                        %_1688)
                                      (if (memv %_1699 '(macro macro!))
                                        (%_511 (%_470 (%_578 %_1697)
                                                      %_1685
                                                      %_1686
                                                      %_1687
                                                      %_1688
                                                      %_1689)
                                               %_1686
                                               '(())
                                               '#f
                                               %_1689)
                                        (if (memv %_1699 '(core))
                                          (values
                                            %_1698
                                            (%_578 %_1697)
                                            %_1685
                                            %_1687
                                            %_1688)
                                          (if (memv %_1699 '(local-syntax))
                                            (values
                                              'local-syntax-form
                                              (%_578 %_1697)
                                              %_1685
                                              %_1687
                                              %_1688)
                                            (if (memv %_1699 '(begin))
                                              (values
                                                'begin-form
                                                '#f
                                                %_1685
                                                %_1687
                                                %_1688)
                                              (if (memv %_1699 '(eval-when))
                                                (values
                                                  'eval-when-form
                                                  '#f
                                                  %_1685
                                                  %_1687
                                                  %_1688)
                                                (if (memv %_1699 '(define))
                                                  (values
                                                    'define-form
                                                    '#f
                                                    %_1685
                                                    %_1687
                                                    %_1688)
                                                  (if (memv %_1699
                                                            '(define-syntax))
                                                    (values
                                                      'define-syntax-form
                                                      '#f
                                                      %_1685
                                                      %_1687
                                                      %_1688)
                                                    (if (memv %_1699
                                                              '(module-key))
                                                      (values
                                                        'module-form
                                                        '#f
                                                        %_1685
                                                        %_1687
                                                        %_1688)
                                                      (if (memv %_1699
                                                                '(import))
                                                        (values
                                                          'import-form
                                                          (if (%_578 %_1697)
                                                            (%_516 %_1695
                                                                   %_1687)
                                                            '#f)
                                                          %_1685
                                                          %_1687
                                                          %_1688)
                                                        (if (memv %_1699
                                                                  '(set!))
                                                          (%_471 %_1685
                                                                 %_1686
                                                                 %_1687
                                                                 %_1688
                                                                 %_1689)
                                                          (values
                                                            'call
                                                            '#f
                                                            %_1685
                                                            %_1687
                                                            %_1688)))))))))))))
                                  %_1698))))
                            (%_579 %_1697)))
                         (%_567 %_1696 %_1686)))
                      (%_524 %_1695 %_1687))
                     (values 'call '#f %_1685 %_1687 %_1688)))
                 (car %_1685))
                (if (%_586 %_1685)
                  (%_511 (%_585 %_1685)
                         %_1686
                         (%_530 %_1687 (%_584 %_1685))
                         '#f
                         %_1689)
                  (if (%_597 %_1685)
                    (%_511 (annotation-expression %_1685)
                           %_1686
                           %_1687
                           (annotation-source %_1685)
                           %_1689)
		    (values (if (pair? %_1685) 'other 'constant)
			    '#f %_1685 %_1687 %_1688)))))))
        (set! %_512
          (lambda (%_1704 %_1705)
            (map (lambda (%_1706)
                   (if (%_522 %_1706
                              '#3(syntax-object
                                  compile
                                  ((top)
                                   #4(ribcage ())
                                   #4(ribcage ())
                                   #4(ribcage #1(x) #1((top)) #1("i"))
                                   #4(ribcage ())
                                   #4(ribcage
                                      #2(when-list w)
                                      #2((top) (top))
                                      #2("i" "i"))
                                   #4(ribcage
                                      (lambda-var-list
                                        gen-var
                                        strip
                                        strip*
                                        strip-annotation
                                        ellipsis?
                                        chi-void
                                        chi-local-syntax
                                        chi-lambda-clause
                                        parse-define-syntax
                                        parse-define
                                        parse-import
                                        parse-module
                                        do-import!
                                        chi-internal
                                        chi-body
                                        chi-macro
                                        chi-set!
                                        chi-application
                                        chi-expr
                                        chi
                                        ct-eval/residualize
                                        rt-eval/residualize
                                        initial-mode-set
                                        update-mode-set
                                        do-top-import
                                        vfor-each
                                        vmap
                                        chi-external
                                        check-defined-ids
                                        check-module-exports
                                        extend-store!
                                        id-set-diff
                                        chi-top-module
                                        set-module-binding-val!
                                        set-module-binding-imps!
                                        set-module-binding-label!
                                        set-module-binding-id!
                                        set-module-binding-type!
                                        module-binding-val
                                        module-binding-imps
                                        module-binding-label
                                        module-binding-id
                                        module-binding-type
                                        module-binding?
                                        make-module-binding
                                        make-resolved-interface
                                        make-trimmed-interface
                                        set-interface-token!
                                        set-interface-exports!
                                        interface-token
                                        interface-exports
                                        interface?
                                        make-interface
                                        flatten-exports
                                        chi-top
                                        chi-top-expr
                                        syntax-type
                                        chi-when-list
                                        chi-top-sequence
                                        chi-sequence
                                        source-wrap
                                        wrap
                                        bound-id-member?
                                        invalid-ids-error
                                        distinct-bound-ids?
                                        valid-bound-ids?
                                        bound-id=?
                                        literal-id=?
                                        free-id=?
                                        id-var-name
                                        id-var-name-loc
                                        id-var-name&marks
                                        id-var-name-loc&marks
                                        same-marks?
                                        join-marks
                                        join-wraps
                                        smart-append
                                        make-trimmed-syntax-object
                                        make-binding-wrap
                                        lookup-import-binding-name
                                        extend-ribcage-subst!
                                        extend-ribcage-barrier-help!
                                        extend-ribcage-barrier!
                                        extend-ribcage!
                                        make-empty-ribcage
                                        import-token-key
                                        import-token?
                                        make-import-token
                                        barrier-marker
                                        new-mark
                                        anti-mark
                                        the-anti-mark
                                        only-top-marked?
                                        top-marked?
                                        top-wrap
                                        empty-wrap
                                        set-ribcage-labels!
                                        set-ribcage-marks!
                                        set-ribcage-symnames!
                                        ribcage-labels
                                        ribcage-marks
                                        ribcage-symnames
                                        ribcage?
                                        make-ribcage
                                        set-indirect-label!
                                        get-indirect-label
                                        indirect-label?
                                        gen-indirect-label
                                        gen-labels
                                        label?
                                        gen-label
                                        make-rename
                                        rename-marks
                                        rename-new
                                        rename-old
                                        subst-rename?
                                        wrap-subst
                                        wrap-marks
                                        make-wrap
                                        id-sym-name&marks
                                        id-sym-name
                                        id?
                                        nonsymbol-id?
                                        global-extend
                                        lookup
                                        sanitize-binding
                                        lookup*
                                        displaced-lexical-error
                                        transformer-env
                                        extend-var-env*
                                        extend-env*
                                        extend-env
                                        null-env
                                        binding?
                                        set-binding-value!
                                        set-binding-type!
                                        binding-value
                                        binding-type
                                        make-binding
                                        arg-check
                                        source-annotation
                                        no-source
                                        unannotate
                                        set-syntax-object-wrap!
                                        set-syntax-object-expression!
                                        syntax-object-wrap
                                        syntax-object-expression
                                        syntax-object?
                                        make-syntax-object
                                        self-evaluating?
                                        build-lexical-var
                                        build-letrec
                                        build-sequence
                                        build-data
                                        build-primref
                                        build-lambda
                                        build-revisit-only
                                        build-visit-only
                                        build-cte-install
                                        build-module-definition
                                        build-global-definition
                                        build-global-assignment
                                        build-global-reference
                                        build-lexical-assignment
                                        build-lexical-reference
                                        build-conditional
                                        build-application
                                        generate-id
                                        get-import-binding
                                        get-global-definition-hook
                                        put-global-definition-hook
                                        gensym-hook
                                        error-hook
                                        local-eval-hook
                                        top-level-eval-hook
                                        annotation?
                                        fx<
                                        fx=
                                        fx-
                                        fx+
                                        noexpand
                                        define-structure
                                        unless
                                        when)
                                      ((top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top)
                                       (top))
                                      ("i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"
                                       "i"))
                                   #4(ribcage ((import-token . *top*)) ())
                                   #4(ribcage ((import-token . *top*)) ()))))
                     'compile
                     (if (%_522 %_1706
                                '#3(syntax-object
                                    load
                                    ((top)
                                     #4(ribcage ())
                                     #4(ribcage ())
                                     #4(ribcage #1(x) #1((top)) #1("i"))
                                     #4(ribcage ())
                                     #4(ribcage
                                        #2(when-list w)
                                        #2((top) (top))
                                        #2("i" "i"))
                                     #4(ribcage
                                        (lambda-var-list
                                          gen-var
                                          strip
                                          strip*
                                          strip-annotation
                                          ellipsis?
                                          chi-void
                                          chi-local-syntax
                                          chi-lambda-clause
                                          parse-define-syntax
                                          parse-define
                                          parse-import
                                          parse-module
                                          do-import!
                                          chi-internal
                                          chi-body
                                          chi-macro
                                          chi-set!
                                          chi-application
                                          chi-expr
                                          chi
                                          ct-eval/residualize
                                          rt-eval/residualize
                                          initial-mode-set
                                          update-mode-set
                                          do-top-import
                                          vfor-each
                                          vmap
                                          chi-external
                                          check-defined-ids
                                          check-module-exports
                                          extend-store!
                                          id-set-diff
                                          chi-top-module
                                          set-module-binding-val!
                                          set-module-binding-imps!
                                          set-module-binding-label!
                                          set-module-binding-id!
                                          set-module-binding-type!
                                          module-binding-val
                                          module-binding-imps
                                          module-binding-label
                                          module-binding-id
                                          module-binding-type
                                          module-binding?
                                          make-module-binding
                                          make-resolved-interface
                                          make-trimmed-interface
                                          set-interface-token!
                                          set-interface-exports!
                                          interface-token
                                          interface-exports
                                          interface?
                                          make-interface
                                          flatten-exports
                                          chi-top
                                          chi-top-expr
                                          syntax-type
                                          chi-when-list
                                          chi-top-sequence
                                          chi-sequence
                                          source-wrap
                                          wrap
                                          bound-id-member?
                                          invalid-ids-error
                                          distinct-bound-ids?
                                          valid-bound-ids?
                                          bound-id=?
                                          literal-id=?
                                          free-id=?
                                          id-var-name
                                          id-var-name-loc
                                          id-var-name&marks
                                          id-var-name-loc&marks
                                          same-marks?
                                          join-marks
                                          join-wraps
                                          smart-append
                                          make-trimmed-syntax-object
                                          make-binding-wrap
                                          lookup-import-binding-name
                                          extend-ribcage-subst!
                                          extend-ribcage-barrier-help!
                                          extend-ribcage-barrier!
                                          extend-ribcage!
                                          make-empty-ribcage
                                          import-token-key
                                          import-token?
                                          make-import-token
                                          barrier-marker
                                          new-mark
                                          anti-mark
                                          the-anti-mark
                                          only-top-marked?
                                          top-marked?
                                          top-wrap
                                          empty-wrap
                                          set-ribcage-labels!
                                          set-ribcage-marks!
                                          set-ribcage-symnames!
                                          ribcage-labels
                                          ribcage-marks
                                          ribcage-symnames
                                          ribcage?
                                          make-ribcage
                                          set-indirect-label!
                                          get-indirect-label
                                          indirect-label?
                                          gen-indirect-label
                                          gen-labels
                                          label?
                                          gen-label
                                          make-rename
                                          rename-marks
                                          rename-new
                                          rename-old
                                          subst-rename?
                                          wrap-subst
                                          wrap-marks
                                          make-wrap
                                          id-sym-name&marks
                                          id-sym-name
                                          id?
                                          nonsymbol-id?
                                          global-extend
                                          lookup
                                          sanitize-binding
                                          lookup*
                                          displaced-lexical-error
                                          transformer-env
                                          extend-var-env*
                                          extend-env*
                                          extend-env
                                          null-env
                                          binding?
                                          set-binding-value!
                                          set-binding-type!
                                          binding-value
                                          binding-type
                                          make-binding
                                          arg-check
                                          source-annotation
                                          no-source
                                          unannotate
                                          set-syntax-object-wrap!
                                          set-syntax-object-expression!
                                          syntax-object-wrap
                                          syntax-object-expression
                                          syntax-object?
                                          make-syntax-object
                                          self-evaluating?
                                          build-lexical-var
                                          build-letrec
                                          build-sequence
                                          build-data
                                          build-primref
                                          build-lambda
                                          build-revisit-only
                                          build-visit-only
                                          build-cte-install
                                          build-module-definition
                                          build-global-definition
                                          build-global-assignment
                                          build-global-reference
                                          build-lexical-assignment
                                          build-lexical-reference
                                          build-conditional
                                          build-application
                                          generate-id
                                          get-import-binding
                                          get-global-definition-hook
                                          put-global-definition-hook
                                          gensym-hook
                                          error-hook
                                          local-eval-hook
                                          top-level-eval-hook
                                          annotation?
                                          fx<
                                          fx=
                                          fx-
                                          fx+
                                          noexpand
                                          define-structure
                                          unless
                                          when)
                                        ((top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top)
                                         (top))
                                        ("i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"
                                         "i"))
                                     #4(ribcage ((import-token . *top*)) ())
                                     #4(ribcage ((import-token . *top*)) ()))))
                       'load
                       (if (%_522 %_1706
                                  '#3(syntax-object
                                      visit
                                      ((top)
                                       #4(ribcage ())
                                       #4(ribcage ())
                                       #4(ribcage #1(x) #1((top)) #1("i"))
                                       #4(ribcage ())
                                       #4(ribcage
                                          #2(when-list w)
                                          #2((top) (top))
                                          #2("i" "i"))
                                       #4(ribcage
                                          (lambda-var-list
                                            gen-var
                                            strip
                                            strip*
                                            strip-annotation
                                            ellipsis?
                                            chi-void
                                            chi-local-syntax
                                            chi-lambda-clause
                                            parse-define-syntax
                                            parse-define
                                            parse-import
                                            parse-module
                                            do-import!
                                            chi-internal
                                            chi-body
                                            chi-macro
                                            chi-set!
                                            chi-application
                                            chi-expr
                                            chi
                                            ct-eval/residualize
                                            rt-eval/residualize
                                            initial-mode-set
                                            update-mode-set
                                            do-top-import
                                            vfor-each
                                            vmap
                                            chi-external
                                            check-defined-ids
                                            check-module-exports
                                            extend-store!
                                            id-set-diff
                                            chi-top-module
                                            set-module-binding-val!
                                            set-module-binding-imps!
                                            set-module-binding-label!
                                            set-module-binding-id!
                                            set-module-binding-type!
                                            module-binding-val
                                            module-binding-imps
                                            module-binding-label
                                            module-binding-id
                                            module-binding-type
                                            module-binding?
                                            make-module-binding
                                            make-resolved-interface
                                            make-trimmed-interface
                                            set-interface-token!
                                            set-interface-exports!
                                            interface-token
                                            interface-exports
                                            interface?
                                            make-interface
                                            flatten-exports
                                            chi-top
                                            chi-top-expr
                                            syntax-type
                                            chi-when-list
                                            chi-top-sequence
                                            chi-sequence
                                            source-wrap
                                            wrap
                                            bound-id-member?
                                            invalid-ids-error
                                            distinct-bound-ids?
                                            valid-bound-ids?
                                            bound-id=?
                                            literal-id=?
                                            free-id=?
                                            id-var-name
                                            id-var-name-loc
                                            id-var-name&marks
                                            id-var-name-loc&marks
                                            same-marks?
                                            join-marks
                                            join-wraps
                                            smart-append
                                            make-trimmed-syntax-object
                                            make-binding-wrap
                                            lookup-import-binding-name
                                            extend-ribcage-subst!
                                            extend-ribcage-barrier-help!
                                            extend-ribcage-barrier!
                                            extend-ribcage!
                                            make-empty-ribcage
                                            import-token-key
                                            import-token?
                                            make-import-token
                                            barrier-marker
                                            new-mark
                                            anti-mark
                                            the-anti-mark
                                            only-top-marked?
                                            top-marked?
                                            top-wrap
                                            empty-wrap
                                            set-ribcage-labels!
                                            set-ribcage-marks!
                                            set-ribcage-symnames!
                                            ribcage-labels
                                            ribcage-marks
                                            ribcage-symnames
                                            ribcage?
                                            make-ribcage
                                            set-indirect-label!
                                            get-indirect-label
                                            indirect-label?
                                            gen-indirect-label
                                            gen-labels
                                            label?
                                            gen-label
                                            make-rename
                                            rename-marks
                                            rename-new
                                            rename-old
                                            subst-rename?
                                            wrap-subst
                                            wrap-marks
                                            make-wrap
                                            id-sym-name&marks
                                            id-sym-name
                                            id?
                                            nonsymbol-id?
                                            global-extend
                                            lookup
                                            sanitize-binding
                                            lookup*
                                            displaced-lexical-error
                                            transformer-env
                                            extend-var-env*
                                            extend-env*
                                            extend-env
                                            null-env
                                            binding?
                                            set-binding-value!
                                            set-binding-type!
                                            binding-value
                                            binding-type
                                            make-binding
                                            arg-check
                                            source-annotation
                                            no-source
                                            unannotate
                                            set-syntax-object-wrap!
                                            set-syntax-object-expression!
                                            syntax-object-wrap
                                            syntax-object-expression
                                            syntax-object?
                                            make-syntax-object
                                            self-evaluating?
                                            build-lexical-var
                                            build-letrec
                                            build-sequence
                                            build-data
                                            build-primref
                                            build-lambda
                                            build-revisit-only
                                            build-visit-only
                                            build-cte-install
                                            build-module-definition
                                            build-global-definition
                                            build-global-assignment
                                            build-global-reference
                                            build-lexical-assignment
                                            build-lexical-reference
                                            build-conditional
                                            build-application
                                            generate-id
                                            get-import-binding
                                            get-global-definition-hook
                                            put-global-definition-hook
                                            gensym-hook
                                            error-hook
                                            local-eval-hook
                                            top-level-eval-hook
                                            annotation?
                                            fx<
                                            fx=
                                            fx-
                                            fx+
                                            noexpand
                                            define-structure
                                            unless
                                            when)
                                          ((top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top))
                                          ("i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"))
                                       #4(ribcage ((import-token . *top*)) ())
                                       #4(ribcage
                                          ((import-token . *top*))
                                          ()
                                          ()))))
                         'visit
                         (if (%_522 %_1706
                                    '#3(syntax-object
                                        revisit
                                        ((top)
                                         #4(ribcage ())
                                         #4(ribcage ())
                                         #4(ribcage #1(x) #1((top)) #1("i"))
                                         #4(ribcage ())
                                         #4(ribcage
                                            #2(when-list w)
                                            #2((top) (top))
                                            #2("i" "i"))
                                         #4(ribcage
                                            (lambda-var-list
                                              gen-var
                                              strip
                                              strip*
                                              strip-annotation
                                              ellipsis?
                                              chi-void
                                              chi-local-syntax
                                              chi-lambda-clause
                                              parse-define-syntax
                                              parse-define
                                              parse-import
                                              parse-module
                                              do-import!
                                              chi-internal
                                              chi-body
                                              chi-macro
                                              chi-set!
                                              chi-application
                                              chi-expr
                                              chi
                                              ct-eval/residualize
                                              rt-eval/residualize
                                              initial-mode-set
                                              update-mode-set
                                              do-top-import
                                              vfor-each
                                              vmap
                                              chi-external
                                              check-defined-ids
                                              check-module-exports
                                              extend-store!
                                              id-set-diff
                                              chi-top-module
                                              set-module-binding-val!
                                              set-module-binding-imps!
                                              set-module-binding-label!
                                              set-module-binding-id!
                                              set-module-binding-type!
                                              module-binding-val
                                              module-binding-imps
                                              module-binding-label
                                              module-binding-id
                                              module-binding-type
                                              module-binding?
                                              make-module-binding
                                              make-resolved-interface
                                              make-trimmed-interface
                                              set-interface-token!
                                              set-interface-exports!
                                              interface-token
                                              interface-exports
                                              interface?
                                              make-interface
                                              flatten-exports
                                              chi-top
                                              chi-top-expr
                                              syntax-type
                                              chi-when-list
                                              chi-top-sequence
                                              chi-sequence
                                              source-wrap
                                              wrap
                                              bound-id-member?
                                              invalid-ids-error
                                              distinct-bound-ids?
                                              valid-bound-ids?
                                              bound-id=?
                                              literal-id=?
                                              free-id=?
                                              id-var-name
                                              id-var-name-loc
                                              id-var-name&marks
                                              id-var-name-loc&marks
                                              same-marks?
                                              join-marks
                                              join-wraps
                                              smart-append
                                              make-trimmed-syntax-object
                                              make-binding-wrap
                                              lookup-import-binding-name
                                              extend-ribcage-subst!
                                              extend-ribcage-barrier-help!
                                              extend-ribcage-barrier!
                                              extend-ribcage!
                                              make-empty-ribcage
                                              import-token-key
                                              import-token?
                                              make-import-token
                                              barrier-marker
                                              new-mark
                                              anti-mark
                                              the-anti-mark
                                              only-top-marked?
                                              top-marked?
                                              top-wrap
                                              empty-wrap
                                              set-ribcage-labels!
                                              set-ribcage-marks!
                                              set-ribcage-symnames!
                                              ribcage-labels
                                              ribcage-marks
                                              ribcage-symnames
                                              ribcage?
                                              make-ribcage
                                              set-indirect-label!
                                              get-indirect-label
                                              indirect-label?
                                              gen-indirect-label
                                              gen-labels
                                              label?
                                              gen-label
                                              make-rename
                                              rename-marks
                                              rename-new
                                              rename-old
                                              subst-rename?
                                              wrap-subst
                                              wrap-marks
                                              make-wrap
                                              id-sym-name&marks
                                              id-sym-name
                                              id?
                                              nonsymbol-id?
                                              global-extend
                                              lookup
                                              sanitize-binding
                                              lookup*
                                              displaced-lexical-error
                                              transformer-env
                                              extend-var-env*
                                              extend-env*
                                              extend-env
                                              null-env
                                              binding?
                                              set-binding-value!
                                              set-binding-type!
                                              binding-value
                                              binding-type
                                              make-binding
                                              arg-check
                                              source-annotation
                                              no-source
                                              unannotate
                                              set-syntax-object-wrap!
                                              set-syntax-object-expression!
                                              syntax-object-wrap
                                              syntax-object-expression
                                              syntax-object?
                                              make-syntax-object
                                              self-evaluating?
                                              build-lexical-var
                                              build-letrec
                                              build-sequence
                                              build-data
                                              build-primref
                                              build-lambda
                                              build-revisit-only
                                              build-visit-only
                                              build-cte-install
                                              build-module-definition
                                              build-global-definition
                                              build-global-assignment
                                              build-global-reference
                                              build-lexical-assignment
                                              build-lexical-reference
                                              build-conditional
                                              build-application
                                              generate-id
                                              get-import-binding
                                              get-global-definition-hook
                                              put-global-definition-hook
                                              gensym-hook
                                              error-hook
                                              local-eval-hook
                                              top-level-eval-hook
                                              annotation?
                                              fx<
                                              fx=
                                              fx-
                                              fx+
                                              noexpand
                                              define-structure
                                              unless
                                              when)
                                            ((top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top)
                                             (top))
                                            ("i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"
                                             "i"))
                                         #4(ribcage
                                            ((import-token . *top*))
                                            ()
                                            ())
                                         #4(ribcage
                                            ((import-token . *top*))
                                            ()
                                            ()))))
                           'revisit
                           (if (%_522 %_1706
                                      '#3(syntax-object
                                          eval
                                          ((top)
                                           #4(ribcage ())
                                           #4(ribcage ())
                                           #4(ribcage #1(x) #1((top)) #1("i"))
                                           #4(ribcage ())
                                           #4(ribcage
                                              #2(when-list w)
                                              #2((top) (top))
                                              #2("i" "i"))
                                           #4(ribcage
                                              (lambda-var-list
                                                gen-var
                                                strip
                                                strip*
                                                strip-annotation
                                                ellipsis?
                                                chi-void
                                                chi-local-syntax
                                                chi-lambda-clause
                                                parse-define-syntax
                                                parse-define
                                                parse-import
                                                parse-module
                                                do-import!
                                                chi-internal
                                                chi-body
                                                chi-macro
                                                chi-set!
                                                chi-application
                                                chi-expr
                                                chi
                                                ct-eval/residualize
                                                rt-eval/residualize
                                                initial-mode-set
                                                update-mode-set
                                                do-top-import
                                                vfor-each
                                                vmap
                                                chi-external
                                                check-defined-ids
                                                check-module-exports
                                                extend-store!
                                                id-set-diff
                                                chi-top-module
                                                set-module-binding-val!
                                                set-module-binding-imps!
                                                set-module-binding-label!
                                                set-module-binding-id!
                                                set-module-binding-type!
                                                module-binding-val
                                                module-binding-imps
                                                module-binding-label
                                                module-binding-id
                                                module-binding-type
                                                module-binding?
                                                make-module-binding
                                                make-resolved-interface
                                                make-trimmed-interface
                                                set-interface-token!
                                                set-interface-exports!
                                                interface-token
                                                interface-exports
                                                interface?
                                                make-interface
                                                flatten-exports
                                                chi-top
                                                chi-top-expr
                                                syntax-type
                                                chi-when-list
                                                chi-top-sequence
                                                chi-sequence
                                                source-wrap
                                                wrap
                                                bound-id-member?
                                                invalid-ids-error
                                                distinct-bound-ids?
                                                valid-bound-ids?
                                                bound-id=?
                                                literal-id=?
                                                free-id=?
                                                id-var-name
                                                id-var-name-loc
                                                id-var-name&marks
                                                id-var-name-loc&marks
                                                same-marks?
                                                join-marks
                                                join-wraps
                                                smart-append
                                                make-trimmed-syntax-object
                                                make-binding-wrap
                                                lookup-import-binding-name
                                                extend-ribcage-subst!
                                                extend-ribcage-barrier-help!
                                                extend-ribcage-barrier!
                                                extend-ribcage!
                                                make-empty-ribcage
                                                import-token-key
                                                import-token?
                                                make-import-token
                                                barrier-marker
                                                new-mark
                                                anti-mark
                                                the-anti-mark
                                                only-top-marked?
                                                top-marked?
                                                top-wrap
                                                empty-wrap
                                                set-ribcage-labels!
                                                set-ribcage-marks!
                                                set-ribcage-symnames!
                                                ribcage-labels
                                                ribcage-marks
                                                ribcage-symnames
                                                ribcage?
                                                make-ribcage
                                                set-indirect-label!
                                                get-indirect-label
                                                indirect-label?
                                                gen-indirect-label
                                                gen-labels
                                                label?
                                                gen-label
                                                make-rename
                                                rename-marks
                                                rename-new
                                                rename-old
                                                subst-rename?
                                                wrap-subst
                                                wrap-marks
                                                make-wrap
                                                id-sym-name&marks
                                                id-sym-name
                                                id?
                                                nonsymbol-id?
                                                global-extend
                                                lookup
                                                sanitize-binding
                                                lookup*
                                                displaced-lexical-error
                                                transformer-env
                                                extend-var-env*
                                                extend-env*
                                                extend-env
                                                null-env
                                                binding?
                                                set-binding-value!
                                                set-binding-type!
                                                binding-value
                                                binding-type
                                                make-binding
                                                arg-check
                                                source-annotation
                                                no-source
                                                unannotate
                                                set-syntax-object-wrap!
                                                set-syntax-object-expression!
                                                syntax-object-wrap
                                                syntax-object-expression
                                                syntax-object?
                                                make-syntax-object
                                                self-evaluating?
                                                build-lexical-var
                                                build-letrec
                                                build-sequence
                                                build-data
                                                build-primref
                                                build-lambda
                                                build-revisit-only
                                                build-visit-only
                                                build-cte-install
                                                build-module-definition
                                                build-global-definition
                                                build-global-assignment
                                                build-global-reference
                                                build-lexical-assignment
                                                build-lexical-reference
                                                build-conditional
                                                build-application
                                                generate-id
                                                get-import-binding
                                                get-global-definition-hook
                                                put-global-definition-hook
                                                gensym-hook
                                                error-hook
                                                local-eval-hook
                                                top-level-eval-hook
                                                annotation?
                                                fx<
                                                fx=
                                                fx-
                                                fx+
                                                noexpand
                                                define-structure
                                                unless
                                                when)
                                              ((top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top))
                                              ("i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"))
                                           #4(ribcage
                                              ((import-token . *top*))
                                              ()
                                              ())
                                           #4(ribcage
                                              ((import-token . *top*))
                                              ()
                                              ()))))
                             'eval
                             (syntax-error
                               (%_516 %_1706 %_1705)
                               '"invalid eval-when situation")))))))
                 %_1704)))
        (set! %_513
          (lambda (%_1707
                   %_1708
                   %_1709
                   %_1710
                   %_1711
                   %_1712
                   %_1713)
            (%_589 %_1710
                   (((lambda (%_1714)
                       (begin
                         (set! %_1714
                           (lambda (%_1715 %_1716 %_1717 %_1718 %_1719)
                             (if (null? %_1715)
                               '()
                               ((lambda (%_1720)
                                  (cons %_1720
                                        (%_1714
                                          (cdr %_1715)
                                          %_1716
                                          %_1717
                                          %_1718
                                          %_1719)))
                                (%_509 (car %_1715)
                                       %_1716
                                       %_1717
                                       %_1718
                                       %_1719
                                       %_1713)))))
                         %_1714))
                     #f)
                    %_1707
                    %_1708
                    %_1709
                    %_1711
                    %_1712))))
        (set! %_514
          (lambda (%_1721 %_1722 %_1723 %_1724)
            (%_589 %_1724
                   (((lambda (%_1725)
                       (begin
                         (set! %_1725
                           (lambda (%_1726 %_1727 %_1728)
                             (if (null? %_1726)
                               '()
                               ((lambda (%_1729)
                                  (cons %_1729
                                        (%_1725 (cdr %_1726) %_1727 %_1728)))
                                (%_474 (car %_1726) %_1727 %_1728)))))
                         %_1725))
                     #f)
                    %_1721
                    %_1722
                    %_1723))))
        (set! %_515
          (lambda (%_1730 %_1731 %_1732)
            (%_516 (if %_1732
                     (make-annotation %_1730 %_1732 '#f)
                     %_1730)
                   %_1731)))
        (set! %_516
          (lambda (%_1733 %_1734)
            (if (if (null? (%_561 %_1734))
                  (null? (%_560 %_1734))
                  '#f)
              %_1733
              (if (%_586 %_1733)
                (%_587 (%_585 %_1733)
                       (%_530 %_1734 (%_584 %_1733)))
                (if (null? %_1733) %_1733 (%_587 %_1733 %_1734))))))
        (set! %_517
          (lambda (%_1735 %_1736)
            (if (not (null? %_1736))
              ((lambda (%_1737)
                 (if %_1737 %_1737 (%_517 %_1735 (cdr %_1736))))
               (%_521 %_1735 (car %_1736)))
              '#f)))
        (set! %_518
          (lambda (%_1738 %_1739 %_1740)
            (((lambda (%_1741)
                (begin
                  (set! %_1741
                    (lambda (%_1742 %_1743)
                      (if (null? %_1742)
                        (syntax-error %_1739)
                        (if (%_564 (car %_1742))
                          (if (%_517 (car %_1742) %_1743)
                            (syntax-error (car %_1742) '"duplicate " %_1740)
                            (%_1741 (cdr %_1742) (cons (car %_1742) %_1743)))
                          (syntax-error (car %_1742) '"invalid " %_1740)))))
                  %_1741))
              #f)
             %_1738
             '())))
        (set! %_519
          (lambda (%_1744)
            (((lambda (%_1745)
                (begin
                  (set! %_1745
                    (lambda (%_1746)
                      ((lambda (%_1747)
                         (if %_1747
                           %_1747
                           (if (not (%_517 (car %_1746) (cdr %_1746)))
                             (%_1745 (cdr %_1746))
                             '#f)))
                       (null? %_1746))))
                  %_1745))
              #f)
             %_1744)))
        (set! %_520
          (lambda (%_1748)
            (if (((lambda (%_1749)
                    (begin
                      (set! %_1749
                        (lambda (%_1750)
                          ((lambda (%_1751)
                             (if %_1751
                               %_1751
                               (if (%_564 (car %_1750))
                                 (%_1749 (cdr %_1750))
                                 '#f)))
                           (null? %_1750))))
                      %_1749))
                  #f)
                 %_1748)
              (%_519 %_1748)
              '#f)))
        (set! %_521
          (lambda (%_1752 %_1753)
            (if (if (%_586 %_1752) (%_586 %_1753) '#f)
              (if (eq? ((lambda (%_1756)
                          (if (%_597 %_1756)
                            (annotation-expression %_1756)
                            %_1756))
                        (%_585 %_1752))
                       ((lambda (%_1757)
                          (if (%_597 %_1757)
                            (annotation-expression %_1757)
                            %_1757))
                        (%_585 %_1753)))
                (%_528 (%_561 (%_584 %_1752))
                       (%_561 (%_584 %_1753)))
                '#f)
              (eq? ((lambda (%_1754)
                      (if (%_597 %_1754)
                        (annotation-expression %_1754)
                        %_1754))
                    %_1752)
                   ((lambda (%_1755)
                      (if (%_597 %_1755)
                        (annotation-expression %_1755)
                        %_1755))
                    %_1753)))))
        (set! %_522
          (lambda (%_1758 %_1759)
            (if (eq? ((lambda (%_1765)
                        ((lambda (%_1766)
                           (if (%_597 %_1766)
                             (annotation-expression %_1766)
                             %_1766))
                         (if (%_586 %_1765) (%_585 %_1765) %_1765)))
                      %_1758)
                     ((lambda (%_1767)
                        ((lambda (%_1768)
                           (if (%_597 %_1768)
                             (annotation-expression %_1768)
                             %_1768))
                         (if (%_586 %_1767) (%_585 %_1767) %_1767)))
                      %_1759))
              ((lambda (%_1760 %_1761)
                 ((lambda (%_1762)
                    (if %_1762
                      %_1762
                      (if ((lambda (%_1764)
                             (if %_1764 %_1764 (symbol? %_1760)))
                           (not %_1760))
                        ((lambda (%_1763)
                           (if %_1763 %_1763 (symbol? %_1761)))
                         (not %_1761))
                        '#f)))
                  (eq? %_1760 %_1761)))
               (%_524 %_1758 '(()))
               (%_524 %_1759 '(())))
              '#f)))
        (set! %_523
          (lambda (%_1769 %_1770)
            (if (eq? ((lambda (%_1771)
                        ((lambda (%_1772)
                           (if (%_597 %_1772)
                             (annotation-expression %_1772)
                             %_1772))
                         (if (%_586 %_1771) (%_585 %_1771) %_1771)))
                      %_1769)
                     ((lambda (%_1773)
                        ((lambda (%_1774)
                           (if (%_597 %_1774)
                             (annotation-expression %_1774)
                             %_1774))
                         (if (%_586 %_1773) (%_585 %_1773) %_1773)))
                      %_1770))
              (eq? (%_524 %_1769 '(())) (%_524 %_1770 '(())))
              '#f)))
        (set! %_524
          (lambda (%_1775 %_1776)
            (call-with-values
              (lambda () (%_527 %_1775 %_1776))
              (lambda (%_1777 %_1778)
                (if (%_555 %_1777) (%_554 %_1777) %_1777)))))
        (set! %_525
          (lambda (%_1779 %_1780)
            (call-with-values
              (lambda () (%_527 %_1779 %_1780))
              (lambda (%_1781 %_1782) %_1781))))
        (set! %_526
          (lambda (%_1783 %_1784)
            (call-with-values
              (lambda () (%_527 %_1783 %_1784))
              (lambda (%_1785 %_1786)
                (values
                  (if (%_555 %_1785) (%_554 %_1785) %_1785)
                  %_1786)))))
        (set! %_527
          (lambda (%_1787 %_1788)
            ((lambda (%_1789 %_1790 %_1791)
               (begin
                 (set! %_1789
                   (lambda (%_1799 %_1800 %_1801 %_1802 %_1803)
                     ((lambda (%_1804)
                        (((lambda (%_1805)
                            (begin
                              (set! %_1805
                                (lambda (%_1806)
                                  (if (= %_1806 %_1804)
                                    (%_1791 %_1799 (cdr %_1800) %_1801)
                                    (if (if (eq? (vector-ref %_1802 %_1806)
                                                 %_1799)
                                          (%_528 %_1801
                                                 (vector-ref
                                                   (%_549 %_1803)
                                                   %_1806))
                                          '#f)
                                      (values
                                        (vector-ref (%_548 %_1803) %_1806)
                                        %_1801)
                                      (%_1805 (+ %_1806 '1))))))
                              %_1805))
                          #f)
                         '0))
                      (vector-length %_1802))))
                 (set! %_1790
                   (lambda (%_1807 %_1808 %_1809 %_1810 %_1811)
                     (((lambda (%_1812)
                         (begin
                           (set! %_1812
                             (lambda (%_1813 %_1814)
                               (if (null? %_1813)
                                 (%_1791 %_1807 (cdr %_1808) %_1809)
                                 (if (if (eq? (car %_1813) %_1807)
                                       (%_528 %_1809
                                              (list-ref (%_549 %_1811) %_1814))
                                       '#f)
                                   (values
                                     (list-ref (%_548 %_1811) %_1814)
                                     %_1809)
                                   (if (%_540 (car %_1813))
                                     ((lambda (%_1815)
                                        (if %_1815
                                          ((lambda (%_1816)
                                             (if (symbol? %_1816)
                                               (values %_1816 %_1809)
                                               (%_526 %_1816 '(()))))
                                           %_1815)
                                          (%_1812 (cdr %_1813) %_1814)))
                                      (%_534 %_1807
                                             (%_539 (car %_1813))
                                             %_1809))
                                     (if (if (eq? (car %_1813) %_543)
                                           (%_528 %_1809
                                                  (list-ref
                                                    (%_549 %_1811)
                                                    %_1814))
                                           '#f)
                                       (values '#f %_1809)
                                       (%_1812
                                         (cdr %_1813)
                                         (+ %_1814 '1))))))))
                           %_1812))
                       #f)
                      %_1810
                      '0)))
                 (set! %_1791
                   (lambda (%_1817 %_1818 %_1819)
                     (if (null? %_1818)
                       (values %_1817 %_1819)
                       ((lambda (%_1820)
                          (if (eq? %_1820 'shift)
                            (%_1791 %_1817 (cdr %_1818) (cdr %_1819))
                            ((lambda (%_1821)
                               (if (vector? %_1821)
                                 (%_1789 %_1817 %_1818 %_1819 %_1821 %_1820)
                                 (%_1790 %_1817 %_1818 %_1819 %_1821 %_1820)))
                             (%_550 %_1820))))
                        (car %_1818)))))
                 (if (symbol? %_1787)
                   (%_1791 %_1787 (%_560 %_1788) (%_561 %_1788))
                   (if (%_586 %_1787)
                     ((lambda (%_1793 %_1794)
                        ((lambda (%_1795)
                           (call-with-values
                             (lambda () (%_1791 %_1793 (%_560 %_1788) %_1795))
                             (lambda (%_1796 %_1797)
                               (if (eq? %_1796 %_1793)
                                 (%_1791 %_1793 (%_560 %_1794) %_1797)
                                 (values %_1796 %_1797)))))
                         (%_529 (%_561 %_1788) (%_561 %_1794))))
                      ((lambda (%_1798)
                         (if (%_597 %_1798)
                           (annotation-expression %_1798)
                           %_1798))
                       (%_585 %_1787))
                      (%_584 %_1787))
                     (if (%_597 %_1787)
                       (%_1791
                         ((lambda (%_1792)
                            (if (%_597 %_1792)
                              (annotation-expression %_1792)
                              %_1792))
                          %_1787)
                         (%_560 %_1788)
                         (%_561 %_1788))
                       (%_594 'id-var-name '"invalid id" %_1787))))))
             #f
             #f
             #f)))
        (set! %_528
          (lambda (%_1822 %_1823)
            ((lambda (%_1824)
               (if %_1824
                 %_1824
                 (if (not (null? %_1822))
                   (if (not (null? %_1823))
                     (if (eq? (car %_1822) (car %_1823))
                       (%_528 (cdr %_1822) (cdr %_1823))
                       '#f)
                     '#f)
                   '#f)))
             (eq? %_1822 %_1823))))
        (set! %_529
          (lambda (%_1825 %_1826) (%_531 %_1825 %_1826)))
        (set! %_530
          (lambda (%_1827 %_1828)
            ((lambda (%_1829 %_1830)
               (if (null? %_1829)
                 (if (null? %_1830)
                   %_1828
                   (%_562 (%_561 %_1828)
                          (%_531 %_1830 (%_560 %_1828))))
                 (%_562 (%_531 %_1829 (%_561 %_1828))
                        (%_531 %_1830 (%_560 %_1828)))))
             (%_561 %_1827)
             (%_560 %_1827))))
        (set! %_531
          (lambda (%_1831 %_1832)
            (if (null? %_1832) %_1831 (append %_1831 %_1832))))
        (set! %_532
          (lambda (%_1833)
            (call-with-values
              (lambda () (%_526 %_1833 '(())))
              (lambda (%_1834 %_1835)
                (begin
                  (if (not %_1834)
                    (syntax-error
                      %_1833
                      '"identifier not visible for export")
                    (void))
                  ((lambda (%_1836)
                     (%_587 %_1836
                            (%_562 %_1835
                                   (list (%_552 (vector %_1836)
                                                (vector %_1835)
                                                (vector %_1834))))))
                   ((lambda (%_1837)
                      ((lambda (%_1838)
                         (if (%_597 %_1838)
                           (annotation-expression %_1838)
                           %_1838))
                       (if (%_586 %_1837) (%_585 %_1837) %_1837)))
                    %_1833)))))))
        (set! %_533
          (lambda (%_1839 %_1840 %_1841)
            (if (null? %_1839)
              %_1841
              (%_562 (%_561 %_1841)
                     (cons ((lambda (%_1842)
                              ((lambda (%_1843)
                                 ((lambda (%_1844 %_1845)
                                    (begin
                                      (((lambda (%_1846)
                                          (begin
                                            (set! %_1846
                                              (lambda (%_1847 %_1848)
                                                (if (not (null? %_1847))
                                                  (call-with-values
                                                    (lambda ()
                                                      (%_563 (car %_1847)
                                                             %_1841))
                                                    (lambda (%_1849 %_1850)
                                                      (begin
                                                        (vector-set!
                                                          %_1844
                                                          %_1848
                                                          %_1849)
                                                        (vector-set!
                                                          %_1845
                                                          %_1848
                                                          %_1850)
                                                        (%_1846
                                                          (cdr %_1847)
                                                          (+ %_1848 '1)))))
                                                  (void))))
                                            %_1846))
                                        #f)
                                       %_1839
                                       '0)
                                      (%_552 %_1844 %_1845 %_1842)))
                                  (make-vector %_1843)
                                  (make-vector %_1843)))
                               (vector-length %_1842)))
                            (list->vector %_1840))
                           (%_560 %_1841))))))
        (set! %_534
          (lambda (%_1851 %_1852 %_1853)
            ((lambda (%_1854)
               (if %_1854
                 (((lambda (%_1855)
                     (begin
                       (set! %_1855
                         (lambda (%_1856)
                           (if (pair? %_1856)
                             ((lambda (%_1857)
                                (if %_1857 %_1857 (%_1855 (cdr %_1856))))
                              (%_1855 (car %_1856)))
                             (if (%_528 %_1853 (%_561 (%_584 %_1856)))
                               %_1856
                               '#f))))
                       %_1855))
                   #f)
                  %_1854)
                 '#f))
             (%_591 %_1851 %_1852))))
        (set! %_535
          (lambda (%_1858 %_1859)
            (%_547 %_1858
                   (cons (%_541 %_1859) (%_550 %_1858)))))
        (set! %_536
          (lambda (%_1860 %_1861)
            (begin
              (%_547 %_1860 (cons %_543 (%_550 %_1860)))
              (%_546 %_1860
                     (cons (%_561 %_1861) (%_549 %_1860))))))
        (set! %_537
          (lambda (%_1862 %_1863)
            (%_536 %_1862 (%_584 %_1863))))
        (set! %_538
          (lambda (%_1864 %_1865 %_1866)
            (begin
              (%_547 %_1864
                     (cons ((lambda (%_1867)
                              (if (%_597 %_1867)
                                (annotation-expression %_1867)
                                %_1867))
                            (%_585 %_1865))
                           (%_550 %_1864)))
              (%_546 %_1864
                     (cons (%_561 (%_584 %_1865)) (%_549 %_1864)))
              (%_545 %_1864 (cons %_1866 (%_548 %_1864))))))
        (set! %_539 cdr)
        (set! %_540
          (lambda (%_1868)
            (if (pair? %_1868) (eq? (car %_1868) %_542) '#f)))
        (set! %_541
          (lambda (%_1869) (cons %_542 %_1869)))
        (set! %_542 'import-token)
        (set! %_543 '#f)
        (set! %_544
          (lambda (%_1870)
            (%_562 (cons '#f (%_561 %_1870))
                   (cons 'shift (%_560 %_1870)))))
        (set! %_545
          (lambda (%_1871 %_1872)
            (vector-set! %_1871 '3 %_1872)))
        (set! %_546
          (lambda (%_1873 %_1874)
            (vector-set! %_1873 '2 %_1874)))
        (set! %_547
          (lambda (%_1875 %_1876)
            (vector-set! %_1875 '1 %_1876)))
        (set! %_548
          (lambda (%_1877) (vector-ref %_1877 '3)))
        (set! %_549
          (lambda (%_1878) (vector-ref %_1878 '2)))
        (set! %_550
          (lambda (%_1879) (vector-ref %_1879 '1)))
        (set! %_551
          (lambda (%_1880)
            (if (vector? %_1880)
              (if (= (vector-length %_1880) '4)
                (eq? (vector-ref %_1880 '0) 'ribcage)
                '#f)
              '#f)))
        (set! %_552
          (lambda (%_1881 %_1882 %_1883)
            (vector 'ribcage %_1881 %_1882 %_1883)))
        (set! %_553 set-car!)
        (set! %_554 car)
        (set! %_555 pair?)
        (set! %_556 (lambda () (list (%_559))))
        (set! %_557
          (lambda (%_1884)
            (if (null? %_1884)
              '()
              (cons (%_559) (%_557 (cdr %_1884))))))
        (set! %_558
          (lambda (%_1885)
            ((lambda (%_1886)
               (if %_1886
                 %_1886
                 ((lambda (%_1887)
                    (if %_1887 %_1887 (%_555 %_1885)))
                  (symbol? %_1885))))
             (string? %_1885))))
        (set! %_559 (lambda () (string '#\i)))
        (set! %_560 cdr)
        (set! %_561 car)
        (set! %_562 cons)
        (set! %_563
          (lambda (%_1888 %_1889)
            (if (%_586 %_1888)
              (values
                ((lambda (%_1891)
                   (if (%_597 %_1891)
                     (annotation-expression %_1891)
                     %_1891))
                 (%_585 %_1888))
                (%_529 (%_561 %_1889) (%_561 (%_584 %_1888))))
              (values
                ((lambda (%_1890)
                   (if (%_597 %_1890)
                     (annotation-expression %_1890)
                     %_1890))
                 %_1888)
                (%_561 %_1889)))))
        (set! %_564
          (lambda (%_1892)
            (if (symbol? %_1892)
              '#t
              (if (%_586 %_1892)
                (symbol?
                  ((lambda (%_1893)
                     (if (%_597 %_1893)
                       (annotation-expression %_1893)
                       %_1893))
                   (%_585 %_1892)))
                (if (%_597 %_1892)
                  (symbol? (annotation-expression %_1892))
                  '#f)))))
        (set! %_565
          (lambda (%_1894)
            (if (%_586 %_1894)
              (symbol?
                ((lambda (%_1895)
                   (if (%_597 %_1895)
                     (annotation-expression %_1895)
                     %_1895))
                 (%_585 %_1894)))
              '#f)))
        (set! %_566
          (lambda (%_1896 %_1897 %_1898)
            (%_593 %_1897 (%_580 %_1896 %_1898))))
        (set! %_567
          (lambda (%_1899 %_1900)
            ((lambda (%_1901)
               (begin
                 (set! %_1901
                   (lambda (%_1907 %_1908)
                     (begin
                       (%_577 %_1907 (%_579 %_1908))
                       (%_576 %_1907 (%_578 %_1908)))))
                 ((lambda (%_1902)
                    ((lambda (%_1903)
                       (if (memv %_1903 '(deferred))
                         (begin
                           (%_1901
                             %_1902
                             ((lambda (%_1904)
                                ((lambda (%_1905)
                                   (if %_1905
                                     %_1905
                                     (syntax-error
                                       %_1904
                                       '"invalid transformer")))
                                 (%_568 %_1904)))
                              (%_595 (%_578 %_1902))))
                           ((lambda (%_1906) %_1902) (%_579 %_1902)))
                         %_1902))
                     (%_579 %_1902)))
                  (%_569 %_1899 %_1900))))
             #f)))
        (set! %_568
          (lambda (%_1909)
            (if (procedure? %_1909)
              (%_580 'macro %_1909)
              (if (%_575 %_1909)
                ((lambda (%_1910)
                   (if (memv %_1910 '(core macro macro!))
                     (if (procedure? (%_578 %_1909)) %_1909 '#f)
                     (if (memv %_1910 '(module))
                       (if (%_506 (%_578 %_1909)) %_1909 '#f)
                       %_1909)))
                 (%_579 %_1909))
                '#f))))
        (set! %_569
          (lambda (%_1911 %_1912)
            ((lambda (%_1913)
               (if %_1913
                 (cdr %_1913)
                 (if (symbol? %_1911)
                   ((lambda (%_1914)
                      (if %_1914 %_1914 (%_580 'global %_1911)))
                    (%_592 %_1911))
                   (%_580 'displaced-lexical '#f))))
             (assq %_1911 %_1912))))
        (set! %_570
          (lambda (%_1915)
            (syntax-error
              %_1915
              (if (%_524 %_1915 '(()))
                '"identifier out of context"
                '"identifier not visible"))))
        (set! %_571
          (lambda (%_1916)
            (if (null? %_1916)
              '()
              ((lambda (%_1917)
                 (if (eq? (cadr %_1917) 'lexical)
                   (%_571 (cdr %_1916))
                   (cons %_1917 (%_571 (cdr %_1916)))))
               (car %_1916)))))
        (set! %_572
          (lambda (%_1918 %_1919 %_1920)
            (if (null? %_1918)
              %_1920
              (%_572 (cdr %_1918)
                     (cdr %_1919)
                     (%_574 (car %_1918)
                            (%_580 'lexical (car %_1919))
                            %_1920)))))
        (set! %_573
          (lambda (%_1921 %_1922 %_1923)
            (if (null? %_1921)
              %_1923
              (%_573 (cdr %_1921)
                     (cdr %_1922)
                     (%_574 (car %_1921) (car %_1922) %_1923)))))
        (set! %_574
          (lambda (%_1924 %_1925 %_1926)
            (cons (cons %_1924 %_1925) %_1926)))
        (set! %_575
          (lambda (%_1927)
            (if (pair? %_1927) (symbol? (car %_1927)) '#f)))
        (set! %_576 set-cdr!)
        (set! %_577 set-car!)
        (set! %_578 cdr)
        (set! %_579 car)
        (set! %_580
          (lambda (%_1928 %_1929) (cons %_1928 %_1929)))
        (set! %_581
          (lambda (%_1930)
            (if (%_597 %_1930)
              (annotation-source %_1930)
              (if (%_586 %_1930) (%_581 (%_585 %_1930)) '#f))))
        (set! %_582
          (lambda (%_1931 %_1932)
            (vector-set! %_1931 '2 %_1932)))
        (set! %_583
          (lambda (%_1933 %_1934)
            (vector-set! %_1933 '1 %_1934)))
        (set! %_584
          (lambda (%_1935) (vector-ref %_1935 '2)))
        (set! %_585
          (lambda (%_1936) (vector-ref %_1936 '1)))
        (set! %_586
          (lambda (%_1937)
            (if (vector? %_1937)
              (if (= (vector-length %_1937) '3)
                (eq? (vector-ref %_1937 '0) 'syntax-object)
                '#f)
              '#f)))
        (set! %_587
          (lambda (%_1938 %_1939)
            (vector 'syntax-object %_1938 %_1939)))
        (set! %_588
	      (lambda (g1269 g1266 g1268 g1267)
		(if (null? g1266)
		    g1267
		    (cons (list 'lambda g1266 
				(append (cons 'begin 
					      (map (lambda (v e)
						     (list 'set! v e)) 
						   g1266 g1268)) (list g1267)))
			  (map (lambda (x) #f) g1266)))))
	      
;	      (lambda (%_1940 %_1941 %_1942 %_1943)
 ;           (if (null? %_1941)
  ;            %_1943
   ;           (list 'letrec (map list %_1941 %_1942) %_1943))))
        (set! %_589
          (lambda (%_1944 %_1945)
            (if (null? (cdr %_1945))
              (car %_1945)
              (cons 'begin %_1945))))
        (set! %_590
          ((lambda (%_1946)
             ((lambda (%_1947 %_1948 %_1949)
                (begin
                  (set! %_1947
                    (lambda (%_1954)
                      (((lambda (%_1955)
                          (begin
                            (set! %_1955
                              (lambda (%_1956 %_1957)
                                (if (< %_1956 %_1946)
                                  (list->string (cons (%_1948 %_1956) %_1957))
                                  ((lambda (%_1958 %_1959)
                                     (%_1955
                                       %_1959
                                       (cons (%_1948 %_1958) %_1957)))
                                   (modulo %_1956 %_1946)
                                   (quotient %_1956 %_1946)))))
                            %_1955))
                        #f)
                       %_1954
                       '())))
                  (set! %_1948
                    (lambda (%_1960) (integer->char (+ %_1960 '33))))
                  (set! %_1949 (lambda () '0))
                  ((lambda (%_1950 %_1951)
                     (lambda (%_1952)
                       (begin
                         (set! %_1951 (+ %_1951 '1))
                         ((lambda (%_1953) %_1953)
                          (string->symbol
                            (string-append '"#" %_1950 (%_1947 %_1951)))))))
                   (%_1947 (%_1949))
                   '-1)))
              #f
              #f
              #f))
           (- '127 '32 '2)))
        (set! %_591
          (lambda (%_1961 %_1962) (getprop %_1961 %_1962)))
        (set! %_592
          (lambda (%_1963) (getprop %_1963 '*sc-expander*)))
        (set! %_593
          (lambda (%_1964 %_1965)
            ($sc-put-cte %_1964 %_1965)))
        (set! %_594
          (lambda (%_1966 %_1967 %_1968)
            (error %_1966 '"~a ~s" %_1967 %_1968)))
        (set! %_595
          (lambda (%_1969) (eval (list %_598 %_1969))))
        (set! %_596
          (lambda (%_1970) (eval (list %_598 %_1970))))
        (set! %_597 (lambda (%_1971) '#f))
        (set! %_598 '"noexpand")
        (begin
          (set! $sc-put-cte
            (lambda (%_599 %_600)
              ((lambda (%_601 %_602 %_603)
                 (begin
                   (set! %_601
                     (lambda (%_612 %_613)
                       (begin
                         (%_603 %_612 '*top*)
                         ((lambda (%_614)
                            (putprop %_614 '*sc-expander* %_613))
                          (if (symbol? %_612) %_612 (%_524 %_612 '(())))))))
                   (set! %_602
                     (lambda (%_615 %_616)
                       (%_480 (lambda (%_617) (%_603 %_617 %_616))
                              %_615)))
                   (set! %_603
                     (lambda (%_618 %_619)
                       ((lambda (%_620 %_621)
                          (begin
                            (set! %_620
                              (lambda (%_626 %_627)
                                (if (pair? %_627)
                                  (if (%_521 (car %_627) %_626)
                                    (%_620 %_626 (cdr %_627))
                                    (%_621 (car %_627)
                                           (%_620 %_626 (cdr %_627))))
                                  (if ((lambda (%_628)
                                         (if %_628 %_628 (%_521 %_627 %_626)))
                                       (not %_627))
                                    '#f
                                    %_627))))
                            (set! %_621
                              (lambda (%_629 %_630)
                                (if (not %_630) %_629 (cons %_629 %_630))))
                            ((lambda (%_622)
                               ((lambda (%_623)
                                  (if (if (not %_623) (symbol? %_618) '#f)
                                    (remprop %_622 %_619)
                                    (putprop %_622 %_619 (%_621 %_618 %_623))))
                                (%_620 %_618 (getprop %_622 %_619))))
                             ((lambda (%_624)
                                ((lambda (%_625)
                                   (if (%_597 %_625)
                                     (annotation-expression %_625)
                                     %_625))
                                 (if (%_586 %_624) (%_585 %_624) %_624)))
                              %_618))))
                        #f
                        #f)))
                   ((lambda (%_604)
                      ((lambda (%_605)
                         (if (memv %_605 '(module))
                           (begin
                             ((lambda (%_610)
                                (%_602 (%_505 %_610) (%_504 %_610)))
                              (%_578 %_604))
                             (%_601 %_599 %_604))
                           (if (memv %_605 '(do-import))
                             ((lambda (%_606)
                                ((lambda (%_607)
                                   ((lambda (%_608)
                                      (if (memv %_608 '(module))
                                        ((lambda (%_609)
                                           (begin
                                             (if (not (eq? (%_504 %_609)
                                                           %_606))
                                               (syntax-error
                                                 %_599
                                                 '"import mismatch for module")
                                               (void))
                                             (%_602 (%_505 %_609) '*top*)))
                                         (%_578 %_607))
                                        (syntax-error
                                          %_599
                                          '"import from unknown module")))
                                    (%_579 %_607)))
                                 (%_567 (%_524 %_599 '(())) '())))
                              (%_578 %_600))
                             (%_601 %_599 %_604))))
                       (%_579 %_604)))
                    ((lambda (%_611)
                       (if %_611
                         %_611
                         (error 'define-syntax
                                '"invalid transformer ~s"
                                %_600)))
                     (%_568 %_600)))))
               #f
               #f
               #f)))
          (%_566 'local-syntax 'letrec-syntax '#t)
          (%_566 'local-syntax 'let-syntax '#f)
          (%_566 'core
                 'fluid-let-syntax
                 (lambda (%_631 %_632 %_633 %_634)
                   ((lambda (%_635)
                      ((lambda (%_636)
                         (if (if %_636
                               (apply (lambda (%_650 %_651 %_652 %_653 %_654)
                                        (%_520 %_651))
                                      %_636)
                               '#f)
                           (apply (lambda (%_638 %_639 %_640 %_641 %_642)
                                    ((lambda (%_643)
                                       (begin
                                         (for-each
                                           (lambda (%_644 %_645)
                                             ((lambda (%_646)
                                                (if (memv %_646
                                                          '(displaced-lexical))
                                                  (%_570 (%_516 %_644 %_633))
                                                  (void)))
                                              (%_579 (%_567 %_645 %_632))))
                                           %_639
                                           %_643)
                                         (%_469 (cons %_641 %_642)
                                                (%_515 %_631 %_633 %_634)
                                                (%_573 %_643
                                                       ((lambda (%_647)
                                                          (map (lambda (%_648)
                                                                 (%_580 'deferred
                                                                        (%_474 %_648
                                                                               %_647
                                                                               %_633)))
                                                               %_640))
                                                        (%_571 %_632))
                                                       %_632)
                                                %_633)))
                                     (map (lambda (%_649) (%_524 %_649 %_633))
                                          %_639)))
                                  %_636)
                           ((lambda (%_637)
                              (syntax-error (%_515 %_631 %_633 %_634)))
                            %_635)))
                       ($syntax-dispatch
                         %_635
                         '(any #2(each (any any)) any . each-any))))
                    %_631)))
          (%_566 'core
                 'quote
                 (lambda (%_655 %_656 %_657 %_658)
                   ((lambda (%_659)
                      ((lambda (%_660)
                         (if %_660
                           (apply (lambda (%_662 %_663)
                                    (list 'quote (%_456 %_663 %_657)))
                                  %_660)
                           ((lambda (%_661)
                              (syntax-error (%_515 %_655 %_657 %_658)))
                            %_659)))
                       ($syntax-dispatch %_659 '(any any))))
                    %_655)))
          (%_566 'core
                 'syntax
                 ((lambda ()
                    ((lambda (%_664 %_665 %_666 %_667 %_668 %_669 %_670 %_671)
                       (begin
                         (set! %_664
                           (lambda (%_684)
                             ((lambda (%_685)
                                (if (memv %_685 '(ref))
                                  (cadr %_684)
                                  (if (memv %_685 '(primitive))
                                    (cadr %_684)
                                    (if (memv %_685 '(quote))
                                      (list 'quote (cadr %_684))
                                      (if (memv %_685 '(lambda))
                                        (list 'lambda
                                              (cadr %_684)
                                              (%_664 (caddr %_684)))
                                        (if (memv %_685 '(map))
                                          ((lambda (%_686)
                                             (cons (if (= (length %_686) '2)
                                                     'map
                                                     'map)
                                                   %_686))
                                           (map %_664 (cdr %_684)))
                                          (cons (car %_684)
                                                (map %_664 (cdr %_684)))))))))
                              (car %_684))))
                         (set! %_665
                           (lambda (%_687 %_688 %_689)
                             (if (eq? (car %_689) 'quote)
                               (if (eq? (cadr %_689) %_688)
                                 (list 'quote %_687)
                                 (list 'quote (list->vector (cadr %_689))))
                               (if (eq? (car %_689) 'list)
                                 (cons 'vector (cdr %_689))
                                 (list 'list->vector %_689)))))
                         (set! %_666
                           (lambda (%_690 %_691 %_692 %_693 %_694)
                             ((lambda (%_695)
                                (if (memv %_695 '(quote))
                                  (if (eq? (car %_693) 'quote)
                                    ((lambda (%_696 %_697)
                                       (if (if (eq? %_696 %_691)
                                             (eq? %_697 %_692)
                                             '#f)
                                         (list 'quote %_690)
                                         (list 'quote (cons %_696 %_697))))
                                     (cadr %_693)
                                     (cadr %_694))
                                    (if (eq? (cadr %_694) '())
                                      (list 'list %_693)
                                      (list 'cons %_693 %_694)))
                                  (if (memv %_695 '(list))
                                    (cons 'list (cons %_693 (cdr %_694)))
                                    (list 'cons %_693 %_694))))
                              (car %_694))))
                         (set! %_667
                           (lambda (%_698 %_699)
                             ((lambda (%_700 %_701)
                                (if (eq? (car %_698) 'ref)
                                  (car %_701)
                                  (if (andmap
                                        (lambda (%_704)
                                          (if (eq? (car %_704) 'ref)
                                            (memq (cadr %_704) %_700)
                                            '#f))
                                        (cdr %_698))
                                    (cons 'map
                                          (cons (list 'primitive (car %_698))
                                                (map ((lambda (%_702)
                                                        (lambda (%_703)
                                                          (cdr (assq (cadr %_703)
                                                                     %_702))))
                                                      (map cons %_700 %_701))
                                                     (cdr %_698))))
                                    (cons 'map
                                          (cons (list 'lambda %_700 %_698)
                                                %_701)))))
                              (map cdr %_699)
                              (map (lambda (%_705) (list 'ref (car %_705)))
                                   %_699))))
                         (set! %_668
                           (lambda (%_706 %_707)
                             (list 'apply
                                   '(primitive append)
                                   (%_667 %_706 %_707))))
                         (set! %_669
                           (lambda (%_708 %_709)
                             (if (equal? %_709 ''())
                               %_708
                               (list 'append %_708 %_709))))
                         (set! %_670
                           (lambda (%_710 %_711 %_712 %_713)
                             (if (= %_712 '0)
                               (values %_711 %_713)
                               (if (null? %_713)
                                 (syntax-error
                                   %_710
                                   '"missing ellipsis in syntax form")
                                 (call-with-values
                                   (lambda ()
                                     (%_670 %_710
                                            %_711
                                            (- %_712 '1)
                                            (cdr %_713)))
                                   (lambda (%_714 %_715)
                                     ((lambda (%_716)
                                        (if %_716
                                          (values (cdr %_716) %_713)
                                          ((lambda (%_717)
                                             (values
                                               %_717
                                               (cons (cons (cons %_714 %_717)
                                                           (car %_713))
                                                     %_715)))
                                           (%_455 'tmp))))
                                      (assq %_714 (car %_713)))))))))
                         (set! %_671
                           (lambda (%_718 %_719 %_720 %_721 %_722)
                             (if (%_564 %_719)
                               ((lambda (%_771)
                                  ((lambda (%_772)
                                     (if (eq? (%_579 %_772) 'syntax)
                                       (call-with-values
                                         (lambda ()
                                           ((lambda (%_773)
                                              (%_670 %_718
                                                     (car %_773)
                                                     (cdr %_773)
                                                     %_721))
                                            (%_578 %_772)))
                                         (lambda (%_774 %_775)
                                           (values (list 'ref %_774) %_775)))
                                       (if (%_722 %_719)
                                         (syntax-error
                                           %_718
                                           '"misplaced ellipsis in syntax form")
                                         (values (list 'quote %_719) %_721))))
                                   (%_567 %_771 %_720)))
                                (%_524 %_719 '(())))
                               ((lambda (%_723)
                                  ((lambda (%_724)
                                     (if (if %_724
                                           (apply (lambda (%_769 %_770)
                                                    (%_722 %_769))
                                                  %_724)
                                           '#f)
                                       (apply (lambda (%_766 %_767)
                                                (%_671 %_718
                                                       %_767
                                                       %_720
                                                       %_721
                                                       (lambda (%_768) '#f)))
                                              %_724)
                                       ((lambda (%_725)
                                          (if (if %_725
                                                (apply (lambda (%_763
                                                                %_764
                                                                %_765)
                                                         (%_722 %_764))
                                                       %_725)
                                                '#f)
                                            (apply (lambda (%_740 %_741 %_742)
                                                     (((lambda (%_743)
                                                         (begin
                                                           (set! %_743
                                                             (lambda (%_744
                                                                      %_745)
                                                               ((lambda (%_746)
                                                                  ((lambda (%_747)
                                                                     (if (if %_747
                                                                           (apply (lambda (%_758
                                                                                           %_759)
                                                                                    (%_722 %_758))
                                                                                  %_747)
                                                                           '#f)
                                                                       (apply (lambda (%_753
                                                                                       %_754)
                                                                                (%_743 %_754
                                                                                       (lambda (%_755)
                                                                                         (call-with-values
                                                                                           (lambda ()
                                                                                             (%_745 (cons '()
                                                                                                          %_755)))
                                                                                           (lambda (%_756
                                                                                                    %_757)
                                                                                             (if (null? (car %_757))
                                                                                               (syntax-error
                                                                                                 %_718
                                                                                                 '"extra ellipsis in syntax form")
                                                                                               (values
                                                                                                 (%_668 %_756
                                                                                                        (car %_757))
                                                                                                 (cdr %_757))))))))
                                                                              %_747)
                                                                       ((lambda (%_748)
                                                                          (call-with-values
                                                                            (lambda ()
                                                                              (%_671 %_718
                                                                                     %_744
                                                                                     %_720
                                                                                     %_721
                                                                                     %_722))
                                                                            (lambda (%_749
                                                                                     %_750)
                                                                              (call-with-values
                                                                                (lambda ()
                                                                                  (%_745 %_750))
                                                                                (lambda (%_751
                                                                                         %_752)
                                                                                  (values
                                                                                    (%_669 %_751
                                                                                           %_749)
                                                                                    %_752))))))
                                                                        %_746)))
                                                                   ($syntax-dispatch
                                                                     %_746
                                                                     '(any .
                                                                           any))))
                                                                %_744)))
                                                           %_743))
                                                       #f)
                                                      %_742
                                                      (lambda (%_760)
                                                        (call-with-values
                                                          (lambda ()
                                                            (%_671 %_718
                                                                   %_740
                                                                   %_720
                                                                   (cons '()
                                                                         %_760)
                                                                   %_722))
                                                          (lambda (%_761 %_762)
                                                            (if (null? (car %_762))
                                                              (syntax-error
                                                                %_718
                                                                '"extra ellipsis in syntax form")
                                                              (values
                                                                (%_667 %_761
                                                                       (car %_762))
                                                                (cdr %_762))))))))
                                                   %_725)
                                            ((lambda (%_726)
                                               (if %_726
                                                 (apply (lambda (%_734 %_735)
                                                          (call-with-values
                                                            (lambda ()
                                                              (%_671 %_718
                                                                     %_734
                                                                     %_720
                                                                     %_721
                                                                     %_722))
                                                            (lambda (%_736
                                                                     %_737)
                                                              (call-with-values
                                                                (lambda ()
                                                                  (%_671 %_718
                                                                         %_735
                                                                         %_720
                                                                         %_737
                                                                         %_722))
                                                                (lambda (%_738
                                                                         %_739)
                                                                  (values
                                                                    (%_666 %_719
                                                                           %_734
                                                                           %_735
                                                                           %_736
                                                                           %_738)
                                                                    %_739))))))
                                                        %_726)
                                                 ((lambda (%_727)
                                                    (if %_727
                                                      (apply (lambda (%_729
                                                                      %_730)
                                                               ((lambda (%_731)
                                                                  (call-with-values
                                                                    (lambda ()
                                                                      (%_671 %_718
                                                                             %_731
                                                                             %_720
                                                                             %_721
                                                                             %_722))
                                                                    (lambda (%_732
                                                                             %_733)
                                                                      (values
                                                                        (%_665 %_719
                                                                               %_731
                                                                               %_732)
                                                                        %_733))))
                                                                (cons %_729
                                                                      %_730)))
                                                             %_727)
                                                      ((lambda (%_728)
                                                         (values
                                                           (list 'quote %_719)
                                                           %_721))
                                                       %_723)))
                                                  ($syntax-dispatch
                                                    %_723
                                                    '#2(vector
                                                        (any . each-any))))))
                                             ($syntax-dispatch
                                               %_723
                                               '(any . any)))))
                                        ($syntax-dispatch
                                          %_723
                                          '(any any . any)))))
                                   ($syntax-dispatch %_723 '(any any))))
                                %_719))))
                         (lambda (%_672 %_673 %_674 %_675)
                           ((lambda (%_676)
                              ((lambda (%_677)
                                 ((lambda (%_678)
                                    (if %_678
                                      (apply (lambda (%_680 %_681)
                                               (call-with-values
                                                 (lambda ()
                                                   (%_671 %_676
                                                          %_681
                                                          %_673
                                                          '()
                                                          %_459))
                                                 (lambda (%_682 %_683)
                                                   (%_664 %_682))))
                                             %_678)
                                      ((lambda (%_679) (syntax-error %_676))
                                       %_677)))
                                  ($syntax-dispatch %_677 '(any any))))
                               %_676))
                            (%_515 %_672 %_674 %_675)))))
                     #f
                     #f
                     #f
                     #f
                     #f
                     #f
                     #f
                     #f))))
          (%_566 'core
                 'lambda
                 (lambda (%_776 %_777 %_778 %_779)
                   ((lambda (%_780)
                      ((lambda (%_781)
                         (if %_781
                           (apply (lambda (%_782 %_783)
                                    (%_462 (%_515 %_776 %_778 %_779)
                                           %_783
                                           %_777
                                           %_778
                                           (lambda (%_784 %_785)
                                             (list 'lambda %_784 %_785))))
                                  %_781)
                           (syntax-error %_780)))
                       ($syntax-dispatch %_780 '(any . any))))
                    %_776)))
          (%_566 'core
                 'letrec
                 (lambda (%_786 %_787 %_788 %_789)
                   ((lambda (%_790)
                      ((lambda (%_791)
                         (if %_791
                           (apply (lambda (%_793 %_794 %_795 %_796 %_797)
                                    ((lambda (%_798)
                                       (if (not (%_520 %_798))
                                         (%_518 (map (lambda (%_804)
                                                       (%_516 %_804 %_788))
                                                     %_798)
                                                (%_515 %_786 %_788 %_789)
                                                '"bound variable")
                                         ((lambda (%_799 %_800)
                                            ((lambda (%_801 %_802)
                                               (%_588 %_789
                                                      %_800
                                                      (map (lambda (%_803)
                                                             (%_474 %_803
                                                                    %_802
                                                                    %_801))
                                                           %_795)
                                                      (%_469 (cons %_796 %_797)
                                                             (%_515 %_786
                                                                    %_801
                                                                    %_789)
                                                             %_802
                                                             %_801)))
                                             (%_533 %_798 %_799 %_788)
                                             (%_572 %_799 %_800 %_787)))
                                          (%_557 %_798)
                                          (map %_455 %_798))))
                                     %_794))
                                  %_791)
                           ((lambda (%_792)
                              (syntax-error (%_515 %_786 %_788 %_789)))
                            %_790)))
                       ($syntax-dispatch
                         %_790
                         '(any #2(each (any any)) any . each-any))))
                    %_786)))
          (%_566 'core
                 'if
                 (lambda (%_805 %_806 %_807 %_808)
                   ((lambda (%_809)
                      ((lambda (%_810)
                         (if %_810
                           (apply (lambda (%_817 %_818 %_819)
                                    (list 'if
                                          (%_474 %_818 %_806 %_807)
                                          (%_474 %_819 %_806 %_807)
                                          (%_460)))
                                  %_810)
                           ((lambda (%_811)
                              (if %_811
                                (apply (lambda (%_813 %_814 %_815 %_816)
                                         (list 'if
                                               (%_474 %_814 %_806 %_807)
                                               (%_474 %_815 %_806 %_807)
                                               (%_474 %_816 %_806 %_807)))
                                       %_811)
                                ((lambda (%_812)
                                   (syntax-error (%_515 %_805 %_807 %_808)))
                                 %_809)))
                            ($syntax-dispatch %_809 '(any any any any)))))
                       ($syntax-dispatch %_809 '(any any any))))
                    %_805)))
          (%_566 'set! 'set! '())
          (%_566 'begin 'begin '())
          (%_566 'module-key 'module '())
          (%_566 'import 'import '#f)
          (%_566 'import 'import-only '#t)
          (%_566 'define 'define '())
          (%_566 'define-syntax 'define-syntax '())
          (%_566 'eval-when 'eval-when '())
          (%_566 'core
                 'syntax-case
                 ((lambda ()
                    ((lambda (%_820 %_821 %_822 %_823)
                       (begin
                         (set! %_820
                           (lambda (%_837 %_838 %_839 %_840)
                             (if (null? %_839)
                               (list 'syntax-error %_837)
                               ((lambda (%_841)
                                  ((lambda (%_842)
                                     (if %_842
                                       (apply (lambda (%_848 %_849)
                                                (if (if (%_564 %_848)
                                                      (if (not (%_517 %_848
                                                                      %_838))
                                                        (not (%_459 %_848))
                                                        '#f)
                                                      '#f)
                                                  ((lambda (%_850 %_851)
                                                     (list (list 'lambda
                                                                 (list %_851)
                                                                 (%_474 %_849
                                                                        (%_574 %_850
                                                                               (%_580 'syntax
                                                                                      (cons %_851
                                                                                            '0))
                                                                               %_840)
                                                                        (%_533 (list %_848)
                                                                               (list %_850)
                                                                               '(()))))
                                                           %_837))
                                                   (%_559)
                                                   (%_455 %_848))
                                                  (%_821 %_837
                                                         %_838
                                                         (cdr %_839)
                                                         %_840
                                                         %_848
                                                         '#t
                                                         %_849)))
                                              %_842)
                                       ((lambda (%_843)
                                          (if %_843
                                            (apply (lambda (%_845 %_846 %_847)
                                                     (%_821 %_837
                                                            %_838
                                                            (cdr %_839)
                                                            %_840
                                                            %_845
                                                            %_846
                                                            %_847))
                                                   %_843)
                                            ((lambda (%_844)
                                               (syntax-error
                                                 (car %_839)
                                                 '"invalid syntax-case clause"))
                                             %_841)))
                                        ($syntax-dispatch
                                          %_841
                                          '(any any any)))))
                                   ($syntax-dispatch %_841 '(any any))))
                                (car %_839)))))
                         (set! %_821
                           (lambda (%_852 %_853 %_854 %_855 %_856 %_857 %_858)
                             (call-with-values
                               (lambda () (%_823 %_856 %_853))
                               (lambda (%_859 %_860)
                                 (if (not (%_519 (map car %_860)))
                                   (%_518 (map car %_860)
                                          %_856
                                          '"pattern variable")
                                   (if (not (andmap
                                              (lambda (%_865)
                                                (not (%_459 (car %_865))))
                                              %_860))
                                     (syntax-error
                                       %_856
                                       '"misplaced ellipsis in syntax-case pattern")
                                     ((lambda (%_861)
                                        (list (list 'lambda
                                                    (list %_861)
                                                    (list 'if
                                                          ((lambda (%_862)
                                                             ((lambda (%_863)
                                                                (if %_863
                                                                  (apply (lambda ()
                                                                           %_861)
                                                                         %_863)
                                                                  ((lambda (%_864)
                                                                     (list 'if
                                                                           %_861
                                                                           (%_822 %_860
                                                                                  %_857
                                                                                  %_861
                                                                                  %_855)
                                                                           (list 'quote
                                                                                 '#f)))
                                                                   %_862)))
                                                              ($syntax-dispatch
                                                                %_862
                                                                '#2(atom #t))))
                                                           %_857)
                                                          (%_822 %_860
                                                                 %_858
                                                                 %_861
                                                                 %_855)
                                                          (%_820 %_852
                                                                 %_853
                                                                 %_854
                                                                 %_855)))
                                              (if (eq? %_859 'any)
                                                (list 'list %_852)
                                                (list '$syntax-dispatch
                                                      %_852
                                                      (list 'quote %_859)))))
                                      (%_455 'tmp))))))))
                         (set! %_822
                           (lambda (%_866 %_867 %_868 %_869)
                             ((lambda (%_870 %_871)
                                ((lambda (%_872 %_873)
                                   (list 'apply
                                         (list 'lambda
                                               %_873
                                               (%_474 %_867
                                                      (%_573 %_872
                                                             (map (lambda (%_874
                                                                           %_875)
                                                                    (%_580 'syntax
                                                                           (cons %_874
                                                                                 %_875)))
                                                                  %_873
                                                                  (map cdr
                                                                       %_866))
                                                             %_869)
                                                      (%_533 %_870
                                                             %_872
                                                             '(()))))
                                         %_868))
                                 (%_557 %_870)
                                 (map %_455 %_870)))
                              (map car %_866)
                              (map cdr %_866))))
                         (set! %_823
                           (lambda (%_876 %_877)
                             (((lambda (%_878)
                                 (begin
                                   (set! %_878
                                     (lambda (%_879 %_880 %_881)
                                       (if (%_564 %_879)
                                         (if (%_517 %_879 %_877)
                                           (values
                                             (vector 'free-id %_879)
                                             %_881)
                                           (values
                                             'any
                                             (cons (cons %_879 %_880) %_881)))
                                         ((lambda (%_882)
                                            ((lambda (%_883)
                                               (if (if %_883
                                                     (apply (lambda (%_901
                                                                     %_902)
                                                              (%_459 %_902))
                                                            %_883)
                                                     '#f)
                                                 (apply (lambda (%_897 %_898)
                                                          (call-with-values
                                                            (lambda ()
                                                              (%_878 %_897
                                                                     (+ %_880
                                                                        '1)
                                                                     %_881))
                                                            (lambda (%_899
                                                                     %_900)
                                                              (values
                                                                (if (eq? %_899
                                                                         'any)
                                                                  'each-any
                                                                  (vector
                                                                    'each
                                                                    %_899))
                                                                %_900))))
                                                        %_883)
                                                 ((lambda (%_884)
                                                    (if %_884
                                                      (apply (lambda (%_891
                                                                      %_892)
                                                               (call-with-values
                                                                 (lambda ()
                                                                   (%_878 %_892
                                                                          %_880
                                                                          %_881))
                                                                 (lambda (%_893
                                                                          %_894)
                                                                   (call-with-values
                                                                     (lambda ()
                                                                       (%_878 %_891
                                                                              %_880
                                                                              %_894))
                                                                     (lambda (%_895
                                                                              %_896)
                                                                       (values
                                                                         (cons %_895
                                                                               %_893)
                                                                         %_896))))))
                                                             %_884)
                                                      ((lambda (%_885)
                                                         (if %_885
                                                           (apply (lambda ()
                                                                    (values
                                                                      '()
                                                                      %_881))
                                                                  %_885)
                                                           ((lambda (%_886)
                                                              (if %_886
                                                                (apply (lambda (%_888)
                                                                         (call-with-values
                                                                           (lambda ()
                                                                             (%_878 %_888
                                                                                    %_880
                                                                                    %_881))
                                                                           (lambda (%_889
                                                                                    %_890)
                                                                             (values
                                                                               (vector
                                                                                 'vector
                                                                                 %_889)
                                                                               %_890))))
                                                                       %_886)
                                                                ((lambda (%_887)
                                                                   (values
                                                                     (vector
                                                                       'atom
                                                                       (%_456 %_879
                                                                              '(())))
                                                                     %_881))
                                                                 %_882)))
                                                            ($syntax-dispatch
                                                              %_882
                                                              '#2(vector
                                                                  each-any)))))
                                                       ($syntax-dispatch
                                                         %_882
                                                         '()))))
                                                  ($syntax-dispatch
                                                    %_882
                                                    '(any . any)))))
                                             ($syntax-dispatch
                                               %_882
                                               '(any any))))
                                          %_879))))
                                   %_878))
                               #f)
                              %_876
                              '0
                              '())))
                         (lambda (%_824 %_825 %_826 %_827)
                           ((lambda (%_828)
                              ((lambda (%_829)
                                 ((lambda (%_830)
                                    (if %_830
                                      (apply (lambda (%_831 %_832 %_833 %_834)
                                               (if (andmap
                                                     (lambda (%_836)
                                                       (if (%_564 %_836)
                                                         (not (%_459 %_836))
                                                         '#f))
                                                     %_833)
                                                 ((lambda (%_835)
                                                    (list (list 'lambda
                                                                (list %_835)
                                                                (%_820 %_835
                                                                       %_833
                                                                       %_834
                                                                       %_825))
                                                          (%_474 %_832
                                                                 %_825
                                                                 '(()))))
                                                  (%_455 'tmp))
                                                 (syntax-error
                                                   %_828
                                                   '"invalid literals list in")))
                                             %_830)
                                      (syntax-error %_829)))
                                  ($syntax-dispatch
                                    %_829
                                    '(any any each-any . each-any))))
                               %_828))
                            (%_515 %_824 %_826 %_827)))))
                     #f
                     #f
                     #f
                     #f))))
          (set! sc-expand
            ((lambda (%_903 %_904 %_905)
               ((lambda (%_906)
                  (lambda (%_907)
                    (if (if (pair? %_907) (equal? (car %_907) %_598) '#f)
                      (cadr %_907)
                      (%_509 %_907 '() %_906 %_903 %_904 %_905))))
                (%_562 (%_561 '((top)))
                       (cons %_905 (%_560 '((top)))))))
             '(e)
             '(e)
             ((lambda (%_908)
                (begin (%_535 %_908 '*top*) %_908))
              (%_552 '() '() '()))))
          (set! identifier? (lambda (%_909) (%_565 %_909)))
          (set! datum->syntax-object
            (lambda (%_910 %_911)
              (begin
                ((lambda (%_912)
                   (if (not (%_565 %_912))
                     (%_594 'datum->syntax-object
                            '"invalid argument"
                            %_912)
                     (void)))
                 %_910)
                (%_587 %_911 (%_584 %_910)))))
          (set! syntax-object->datum
            (lambda (%_913) (%_456 %_913 '(()))))
          (set! generate-temporaries
            (lambda (%_914)
              (begin
                ((lambda (%_915)
                   (if (not (list? %_915))
                     (%_594 'generate-temporaries
                            '"invalid argument"
                            %_915)
                     (void)))
                 %_914)
                (map (lambda (%_916) (%_516 (gensym) '((top))))
                     %_914))))
          (set! free-identifier=?
            (lambda (%_917 %_918)
              (begin
                ((lambda (%_919)
                   (if (not (%_565 %_919))
                     (%_594 'free-identifier=?
                            '"invalid argument"
                            %_919)
                     (void)))
                 %_917)
                ((lambda (%_920)
                   (if (not (%_565 %_920))
                     (%_594 'free-identifier=?
                            '"invalid argument"
                            %_920)
                     (void)))
                 %_918)
                (%_523 %_917 %_918))))
          (set! bound-identifier=?
            (lambda (%_921 %_922)
              (begin
                ((lambda (%_923)
                   (if (not (%_565 %_923))
                     (%_594 'bound-identifier=?
                            '"invalid argument"
                            %_923)
                     (void)))
                 %_921)
                ((lambda (%_924)
                   (if (not (%_565 %_924))
                     (%_594 'bound-identifier=?
                            '"invalid argument"
                            %_924)
                     (void)))
                 %_922)
                (%_521 %_921 %_922))))
          (set! literal-identifier=?
            (lambda (%_925 %_926)
              (begin
                ((lambda (%_927)
                   (if (not (%_565 %_927))
                     (%_594 'literal-identifier=?
                            '"invalid argument"
                            %_927)
                     (void)))
                 %_925)
                ((lambda (%_928)
                   (if (not (%_565 %_928))
                     (%_594 'literal-identifier=?
                            '"invalid argument"
                            %_928)
                     (void)))
                 %_926)
                (%_522 %_925 %_926))))
          (set! syntax-error
            (lambda (%_930 . %_929)
              (begin
                (for-each
                  (lambda (%_931)
                    ((lambda (%_932)
                       (if (not (string? %_932))
                         (%_594 'syntax-error '"invalid argument" %_932)
                         (void)))
                     %_931))
                  %_929)
                ((lambda (%_933)
                   (%_594 '#f %_933 (%_456 %_930 '(()))))
                 (if (null? %_929)
                   '"invalid syntax"
                   (apply string-append %_929))))))
          ((lambda ()
             ((lambda (%_934 %_935 %_936 %_937 %_938)
                (begin
                  (set! %_934
                    (lambda (%_943 %_944 %_945 %_946)
                      (if (not %_946)
                        '#f
                        (if (eq? %_944 'any)
                          (cons (%_516 %_943 %_945) %_946)
                          (if (%_586 %_943)
                            (%_935 ((lambda (%_948)
                                      (if (%_597 %_948)
                                        (annotation-expression %_948)
                                        %_948))
                                    (%_585 %_943))
                                   %_944
                                   (%_530 %_945 (%_584 %_943))
                                   %_946)
                            (%_935 ((lambda (%_947)
                                      (if (%_597 %_947)
                                        (annotation-expression %_947)
                                        %_947))
                                    %_943)
                                   %_944
                                   %_945
                                   %_946))))))
                  (set! %_935
                    (lambda (%_949 %_950 %_951 %_952)
                      (if (null? %_950)
                        (if (null? %_949) %_952 '#f)
                        (if (pair? %_950)
                          (if (pair? %_949)
                            (%_934 (car %_949)
                                   (car %_950)
                                   %_951
                                   (%_934 (cdr %_949) (cdr %_950) %_951 %_952))
                            '#f)
                          (if (eq? %_950 'each-any)
                            ((lambda (%_957)
                               (if %_957 (cons %_957 %_952) '#f))
                             (%_937 %_949 %_951))
                            ((lambda (%_953)
                               (if (memv %_953 '(each))
                                 (if (null? %_949)
                                   (%_936 (vector-ref %_950 '1) %_952)
                                   ((lambda (%_954)
                                      (if %_954
                                        (((lambda (%_955)
                                            (begin
                                              (set! %_955
                                                (lambda (%_956)
                                                  (if (null? (car %_956))
                                                    %_952
                                                    (cons (map car %_956)
                                                          (%_955 (map cdr
                                                                      %_956))))))
                                              %_955))
                                          #f)
                                         %_954)
                                        '#f))
                                    (%_938 %_949 (vector-ref %_950 '1) %_951)))
                                 (if (memv %_953 '(free-id))
                                   (if (%_564 %_949)
                                     (if (%_522 (%_516 %_949 %_951)
                                                (vector-ref %_950 '1))
                                       %_952
                                       '#f)
                                     '#f)
                                   (if (memv %_953 '(atom))
                                     (if (equal?
                                           (vector-ref %_950 '1)
                                           (%_456 %_949 %_951))
                                       %_952
                                       '#f)
                                     (if (memv %_953 '(vector))
                                       (if (vector? %_949)
                                         (%_934 (vector->list %_949)
                                                (vector-ref %_950 '1)
                                                %_951
                                                %_952)
                                         '#f)
                                       (void))))))
                             (vector-ref %_950 '0)))))))
                  (set! %_936
                    (lambda (%_958 %_959)
                      (if (null? %_958)
                        %_959
                        (if (eq? %_958 'any)
                          (cons '() %_959)
                          (if (pair? %_958)
                            (%_936 (car %_958) (%_936 (cdr %_958) %_959))
                            (if (eq? %_958 'each-any)
                              (cons '() %_959)
                              ((lambda (%_960)
                                 (if (memv %_960 '(each))
                                   (%_936 (vector-ref %_958 '1) %_959)
                                   (if (memv %_960 '(free-id atom))
                                     %_959
                                     (if (memv %_960 '(vector))
                                       (%_936 (vector-ref %_958 '1) %_959)
                                       (void)))))
                               (vector-ref %_958 '0))))))))
                  (set! %_937
                    (lambda (%_961 %_962)
                      (if (%_597 %_961)
                        (%_937 (annotation-expression %_961) %_962)
                        (if (pair? %_961)
                          ((lambda (%_963)
                             (if %_963
                               (cons (%_516 (car %_961) %_962) %_963)
                               '#f))
                           (%_937 (cdr %_961) %_962))
                          (if (null? %_961)
                            '()
                            (if (%_586 %_961)
                              (%_937 (%_585 %_961) (%_530 %_962 (%_584 %_961)))
                              '#f))))))
                  (set! %_938
                    (lambda (%_964 %_965 %_966)
                      (if (%_597 %_964)
                        (%_938 (annotation-expression %_964) %_965 %_966)
                        (if (pair? %_964)
                          ((lambda (%_967)
                             (if %_967
                               ((lambda (%_968)
                                  (if %_968 (cons %_967 %_968) '#f))
                                (%_938 (cdr %_964) %_965 %_966))
                               '#f))
                           (%_934 (car %_964) %_965 %_966 '()))
                          (if (null? %_964)
                            '()
                            (if (%_586 %_964)
                              (%_938 (%_585 %_964)
                                     %_965
                                     (%_530 %_966 (%_584 %_964)))
                              '#f))))))
                  (set! $syntax-dispatch
                    (lambda (%_939 %_940)
                      (if (eq? %_940 'any)
                        (list %_939)
                        (if (%_586 %_939)
                          (%_935 ((lambda (%_942)
                                    (if (%_597 %_942)
                                      (annotation-expression %_942)
                                      %_942))
                                  (%_585 %_939))
                                 %_940
                                 (%_584 %_939)
                                 '())
                          (%_935 ((lambda (%_941)
                                    (if (%_597 %_941)
                                      (annotation-expression %_941)
                                      %_941))
                                  %_939)
                                 %_940
                                 '(())
                                 '())))))))
              #f
              #f
              #f
              #f
              #f))))))
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f)))
($sc-put-cte
  'with-syntax
  (lambda (%_1972)
    ((lambda (%_1973)
       ((lambda (%_1974)
          (if %_1974
            (apply (lambda (%_1987 %_1988 %_1989)
                     (cons '#3(syntax-object
                               begin
                               ((top)
                                #4(ribcage
                                   #3(_ e1 e2)
                                   #3((top) (top) (top))
                                   #3("i" "i" "i"))
                                #4(ribcage ())
                                #4(ribcage #1(x) #1((top)) #1("i"))
                                #4(ribcage ((import-token . *top*)) ())))
                           (cons %_1988 %_1989)))
                   %_1974)
            ((lambda (%_1975)
               (if %_1975
                 (apply (lambda (%_1982 %_1983 %_1984 %_1985 %_1986)
                          (list '#3(syntax-object
                                    syntax-case
                                    ((top)
                                     #4(ribcage
                                        #5(_ out in e1 e2)
                                        #5((top) (top) (top) (top) (top))
                                        #5("i" "i" "i" "i" "i"))
                                     #4(ribcage ())
                                     #4(ribcage #1(x) #1((top)) #1("i"))
                                     #4(ribcage ((import-token . *top*)) ())))
                                %_1984
                                '()
                                (list %_1983
                                      (cons '#3(syntax-object
                                                begin
                                                ((top)
                                                 #4(ribcage
                                                    #5(_ out in e1 e2)
                                                    #5((top)
                                                       (top)
                                                       (top)
                                                       (top)
                                                       (top))
                                                    #5("i" "i" "i" "i" "i"))
                                                 #4(ribcage ())
                                                 #4(ribcage
                                                    #1(x)
                                                    #1((top))
                                                    #1("i"))
                                                 #4(ribcage
                                                    ((import-token . *top*))
                                                    ()
                                                    ())))
                                            (cons %_1985 %_1986)))))
                        %_1975)
                 ((lambda (%_1976)
                    (if %_1976
                      (apply (lambda (%_1977 %_1978 %_1979 %_1980 %_1981)
                               (list '#3(syntax-object
                                         syntax-case
                                         ((top)
                                          #4(ribcage
                                             #5(_ out in e1 e2)
                                             #5((top) (top) (top) (top) (top))
                                             #5("i" "i" "i" "i" "i"))
                                          #4(ribcage ())
                                          #4(ribcage #1(x) #1((top)) #1("i"))
                                          #4(ribcage
                                             ((import-token . *top*))
                                             ()
                                             ())))
                                     (cons '#3(syntax-object
                                               list
                                               ((top)
                                                #4(ribcage
                                                   #5(_ out in e1 e2)
                                                   #5((top)
                                                      (top)
                                                      (top)
                                                      (top)
                                                      (top))
                                                   #5("i" "i" "i" "i" "i"))
                                                #4(ribcage ())
                                                #4(ribcage
                                                   #1(x)
                                                   #1((top))
                                                   #1("i"))
                                                #4(ribcage
                                                   ((import-token . *top*))
                                                   ()
                                                   ())))
                                           %_1979)
                                     '()
                                     (list %_1978
                                           (cons '#3(syntax-object
                                                     begin
                                                     ((top)
                                                      #4(ribcage
                                                         #5(_ out in e1 e2)
                                                         #5((top)
                                                            (top)
                                                            (top)
                                                            (top)
                                                            (top))
                                                         #5("i"
                                                            "i"
                                                            "i"
                                                            "i"
                                                            "i"))
                                                      #4(ribcage ())
                                                      #4(ribcage
                                                         #1(x)
                                                         #1((top))
                                                         #1("i"))
                                                      #4(ribcage
                                                         ((import-token
                                                            .
                                                            *top*))
                                                         ()
                                                         ())))
                                                 (cons %_1980 %_1981)))))
                             %_1976)
                      (syntax-error %_1973)))
                  ($syntax-dispatch
                    %_1973
                    '(any #2(each (any any)) any . each-any)))))
             ($syntax-dispatch
               %_1973
               '(any ((any any)) any . each-any)))))
        ($syntax-dispatch
          %_1973
          '(any () any . each-any))))
     %_1972)))
($sc-put-cte
  'syntax-rules
  (lambda (%_1990)
    ((lambda (%_1991)
       ((lambda (%_1992)
          (if %_1992
            (apply (lambda (%_1993 %_1994 %_1995 %_1996 %_1997)
                     (list '#3(syntax-object
                               lambda
                               ((top)
                                #4(ribcage
                                   #5(_ k keyword pattern template)
                                   #5((top) (top) (top) (top) (top))
                                   #5("i" "i" "i" "i" "i"))
                                #4(ribcage ())
                                #4(ribcage #1(x) #1((top)) #1("i"))
                                #4(ribcage ((import-token . *top*)) ())))
                           '#3(syntax-object
                               (x)
                               ((top)
                                #4(ribcage
                                   #5(_ k keyword pattern template)
                                   #5((top) (top) (top) (top) (top))
                                   #5("i" "i" "i" "i" "i"))
                                #4(ribcage ())
                                #4(ribcage #1(x) #1((top)) #1("i"))
                                #4(ribcage ((import-token . *top*)) ())))
                           (cons '#3(syntax-object
                                     syntax-case
                                     ((top)
                                      #4(ribcage
                                         #5(_ k keyword pattern template)
                                         #5((top) (top) (top) (top) (top))
                                         #5("i" "i" "i" "i" "i"))
                                      #4(ribcage ())
                                      #4(ribcage #1(x) #1((top)) #1("i"))
                                      #4(ribcage ((import-token . *top*)) ())))
                                 (cons '#3(syntax-object
                                           x
                                           ((top)
                                            #4(ribcage
                                               #5(_ k keyword pattern template)
                                               #5((top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top))
                                               #5("i" "i" "i" "i" "i"))
                                            #4(ribcage ())
                                            #4(ribcage #1(x) #1((top)) #1("i"))
                                            #4(ribcage
                                               ((import-token . *top*))
                                               ()
                                               ())))
                                       (cons %_1994
                                             (map (lambda (%_1998 %_1999)
                                                    (list (cons '#3(syntax-object
                                                                    dummy
                                                                    ((top)
                                                                     #4(ribcage
                                                                        #5(_
                                                                           k
                                                                           keyword
                                                                           pattern
                                                                           template)
                                                                        #5((top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top))
                                                                        #5("i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        ()
                                                                        ()
                                                                        ())
                                                                     #4(ribcage
                                                                        #1(x)
                                                                        #1((top))
                                                                        #1("i"))
                                                                     #4(ribcage
                                                                        ((import-token
                                                                           .
                                                                           *top*))
                                                                        ()
                                                                        ())))
                                                                %_1999)
                                                          (list '#3(syntax-object
                                                                    syntax
                                                                    ((top)
                                                                     #4(ribcage
                                                                        #5(_
                                                                           k
                                                                           keyword
                                                                           pattern
                                                                           template)
                                                                        #5((top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top))
                                                                        #5("i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        ()
                                                                        ()
                                                                        ())
                                                                     #4(ribcage
                                                                        #1(x)
                                                                        #1((top))
                                                                        #1("i"))
                                                                     #4(ribcage
                                                                        ((import-token
                                                                           .
                                                                           *top*))
                                                                        ()
                                                                        ())))
                                                                %_1998)))
                                                  %_1997
                                                  %_1996))))))
                   %_1992)
            (syntax-error %_1991)))
        ($syntax-dispatch
          %_1991
          '(any each-any . #2(each ((any . any) any))))))
     %_1990)))
($sc-put-cte
  'or
  (lambda (%_2000)
    ((lambda (%_2001)
       ((lambda (%_2002)
          (if %_2002
            (apply (lambda (%_2011)
                     '#3(syntax-object
                         #f
                         ((top)
                          #4(ribcage #1(_) #1((top)) #1("i"))
                          #4(ribcage ())
                          #4(ribcage #1(x) #1((top)) #1("i"))
                          #4(ribcage ((import-token . *top*)) ()))))
                   %_2002)
            ((lambda (%_2003)
               (if %_2003
                 (apply (lambda (%_2009 %_2010) %_2010) %_2003)
                 ((lambda (%_2004)
                    (if %_2004
                      (apply (lambda (%_2005 %_2006 %_2007 %_2008)
                               (list '#3(syntax-object
                                         let
                                         ((top)
                                          #4(ribcage
                                             #4(_ e1 e2 e3)
                                             #4((top) (top) (top) (top))
                                             #4("i" "i" "i" "i"))
                                          #4(ribcage ())
                                          #4(ribcage #1(x) #1((top)) #1("i"))
                                          #4(ribcage
                                             ((import-token . *top*))
                                             ()
                                             ())))
                                     (list (list '#3(syntax-object
                                                     t
                                                     ((top)
                                                      #4(ribcage
                                                         #4(_ e1 e2 e3)
                                                         #4((top)
                                                            (top)
                                                            (top)
                                                            (top))
                                                         #4("i" "i" "i" "i"))
                                                      #4(ribcage ())
                                                      #4(ribcage
                                                         #1(x)
                                                         #1((top))
                                                         #1("i"))
                                                      #4(ribcage
                                                         ((import-token
                                                            .
                                                            *top*))
                                                         ()
                                                         ())))
                                                 %_2006))
                                     (list '#3(syntax-object
                                               if
                                               ((top)
                                                #4(ribcage
                                                   #4(_ e1 e2 e3)
                                                   #4((top) (top) (top) (top))
                                                   #4("i" "i" "i" "i"))
                                                #4(ribcage ())
                                                #4(ribcage
                                                   #1(x)
                                                   #1((top))
                                                   #1("i"))
                                                #4(ribcage
                                                   ((import-token . *top*))
                                                   ()
                                                   ())))
                                           '#3(syntax-object
                                               t
                                               ((top)
                                                #4(ribcage
                                                   #4(_ e1 e2 e3)
                                                   #4((top) (top) (top) (top))
                                                   #4("i" "i" "i" "i"))
                                                #4(ribcage ())
                                                #4(ribcage
                                                   #1(x)
                                                   #1((top))
                                                   #1("i"))
                                                #4(ribcage
                                                   ((import-token . *top*))
                                                   ()
                                                   ())))
                                           '#3(syntax-object
                                               t
                                               ((top)
                                                #4(ribcage
                                                   #4(_ e1 e2 e3)
                                                   #4((top) (top) (top) (top))
                                                   #4("i" "i" "i" "i"))
                                                #4(ribcage ())
                                                #4(ribcage
                                                   #1(x)
                                                   #1((top))
                                                   #1("i"))
                                                #4(ribcage
                                                   ((import-token . *top*))
                                                   ()
                                                   ())))
                                           (cons '#3(syntax-object
                                                     or
                                                     ((top)
                                                      #4(ribcage
                                                         #4(_ e1 e2 e3)
                                                         #4((top)
                                                            (top)
                                                            (top)
                                                            (top))
                                                         #4("i" "i" "i" "i"))
                                                      #4(ribcage ())
                                                      #4(ribcage
                                                         #1(x)
                                                         #1((top))
                                                         #1("i"))
                                                      #4(ribcage
                                                         ((import-token
                                                            .
                                                            *top*))
                                                         ()
                                                         ())))
                                                 (cons %_2007 %_2008)))))
                             %_2004)
                      (syntax-error %_2001)))
                  ($syntax-dispatch
                    %_2001
                    '(any any any . each-any)))))
             ($syntax-dispatch %_2001 '(any any)))))
        ($syntax-dispatch %_2001 '(any))))
     %_2000)))
($sc-put-cte
  'and
  (lambda (%_2012)
    ((lambda (%_2013)
       ((lambda (%_2014)
          (if %_2014
            (apply (lambda (%_2020 %_2021 %_2022 %_2023)
                     (cons '#3(syntax-object
                               if
                               ((top)
                                #4(ribcage
                                   #4(_ e1 e2 e3)
                                   #4((top) (top) (top) (top))
                                   #4("i" "i" "i" "i"))
                                #4(ribcage ())
                                #4(ribcage #1(x) #1((top)) #1("i"))
                                #4(ribcage ((import-token . *top*)) ())))
                           (cons %_2021
                                 (cons (cons '#3(syntax-object
                                                 and
                                                 ((top)
                                                  #4(ribcage
                                                     #4(_ e1 e2 e3)
                                                     #4((top)
                                                        (top)
                                                        (top)
                                                        (top))
                                                     #4("i" "i" "i" "i"))
                                                  #4(ribcage ())
                                                  #4(ribcage
                                                     #1(x)
                                                     #1((top))
                                                     #1("i"))
                                                  #4(ribcage
                                                     ((import-token . *top*))
                                                     ()
                                                     ())))
                                             (cons %_2022 %_2023))
                                       '#3(syntax-object
                                           (#f)
                                           ((top)
                                            #4(ribcage
                                               #4(_ e1 e2 e3)
                                               #4((top) (top) (top) (top))
                                               #4("i" "i" "i" "i"))
                                            #4(ribcage ())
                                            #4(ribcage #1(x) #1((top)) #1("i"))
                                            #4(ribcage
                                               ((import-token . *top*))
                                               ()
                                               ())))))))
                   %_2014)
            ((lambda (%_2015)
               (if %_2015
                 (apply (lambda (%_2018 %_2019) %_2019) %_2015)
                 ((lambda (%_2016)
                    (if %_2016
                      (apply (lambda (%_2017)
                               '#3(syntax-object
                                   #t
                                   ((top)
                                    #4(ribcage #1(_) #1((top)) #1("i"))
                                    #4(ribcage ())
                                    #4(ribcage #1(x) #1((top)) #1("i"))
                                    #4(ribcage ((import-token . *top*)) ()))))
                             %_2016)
                      (syntax-error %_2013)))
                  ($syntax-dispatch %_2013 '(any)))))
             ($syntax-dispatch %_2013 '(any any)))))
        ($syntax-dispatch
          %_2013
          '(any any any . each-any))))
     %_2012)))
($sc-put-cte
  'let
  (lambda (%_2024)
    ((lambda (%_2025)
       ((lambda (%_2026)
          (if (if %_2026
                (apply (lambda (%_2045 %_2046 %_2047 %_2048 %_2049)
                         (andmap identifier? %_2046))
                       %_2026)
                '#f)
            (apply (lambda (%_2040 %_2041 %_2042 %_2043 %_2044)
                     (cons (cons '#3(syntax-object
                                     lambda
                                     ((top)
                                      #4(ribcage
                                         #5(_ x v e1 e2)
                                         #5((top) (top) (top) (top) (top))
                                         #5("i" "i" "i" "i" "i"))
                                      #4(ribcage ())
                                      #4(ribcage #1(x) #1((top)) #1("i"))
                                      #4(ribcage ((import-token . *top*)) ())))
                                 (cons %_2041 (cons %_2043 %_2044)))
                           %_2042))
                   %_2026)
            ((lambda (%_2027)
               (if (if %_2027
                     (apply (lambda (%_2034 %_2035 %_2036 %_2037 %_2038 %_2039)
                              (andmap identifier? (cons %_2035 %_2036)))
                            %_2027)
                     '#f)
                 (apply (lambda (%_2028 %_2029 %_2030 %_2031 %_2032 %_2033)
                          (cons (list '#3(syntax-object
                                          letrec
                                          ((top)
                                           #4(ribcage
                                              #6(_ f x v e1 e2)
                                              #6((top)
                                                 (top)
                                                 (top)
                                                 (top)
                                                 (top)
                                                 (top))
                                              #6("i" "i" "i" "i" "i" "i"))
                                           #4(ribcage ())
                                           #4(ribcage #1(x) #1((top)) #1("i"))
                                           #4(ribcage
                                              ((import-token . *top*))
                                              ()
                                              ())))
                                      (list (list %_2029
                                                  (cons '#3(syntax-object
                                                            lambda
                                                            ((top)
                                                             #4(ribcage
                                                                #6(_
                                                                   f
                                                                   x
                                                                   v
                                                                   e1
                                                                   e2)
                                                                #6((top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top))
                                                                #6("i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"))
                                                             #4(ribcage ())
                                                             #4(ribcage
                                                                #1(x)
                                                                #1((top))
                                                                #1("i"))
                                                             #4(ribcage
                                                                ((import-token
                                                                   .
                                                                   *top*))
                                                                ()
                                                                ())))
                                                        (cons %_2030
                                                              (cons %_2032
                                                                    %_2033)))))
                                      %_2029)
                                %_2031))
                        %_2027)
                 (syntax-error %_2025)))
             ($syntax-dispatch
               %_2025
               '(any any #2(each (any any)) any . each-any)))))
        ($syntax-dispatch
          %_2025
          '(any #2(each (any any)) any . each-any))))
     %_2024)))
($sc-put-cte
  'let*
  (lambda (%_2050)
    ((lambda (%_2051)
       ((lambda (%_2052)
          (if (if %_2052
                (apply (lambda (%_2064 %_2065 %_2066 %_2067 %_2068)
                         (andmap identifier? %_2065))
                       %_2052)
                '#f)
            (apply (lambda (%_2053 %_2054 %_2055 %_2056 %_2057)
                     (((lambda (%_2058)
                         (begin
                           (set! %_2058
                             (lambda (%_2059)
                               (if (null? %_2059)
                                 (cons '#3(syntax-object
                                           let
                                           ((top)
                                            #4(ribcage ())
                                            #4(ribcage
                                               #1(bindings)
                                               #1((top))
                                               #1("i"))
                                            #4(ribcage #1(f) #1((top)) #1("i"))
                                            #4(ribcage
                                               #5(let* x v e1 e2)
                                               #5((top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top))
                                               #5("i" "i" "i" "i" "i"))
                                            #4(ribcage ())
                                            #4(ribcage #1(x) #1((top)) #1("i"))
                                            #4(ribcage
                                               ((import-token . *top*))
                                               ()
                                               ())))
                                       (cons '() (cons %_2056 %_2057)))
                                 ((lambda (%_2060)
                                    ((lambda (%_2061)
                                       (if %_2061
                                         (apply (lambda (%_2062 %_2063)
                                                  (list '#3(syntax-object
                                                            let
                                                            ((top)
                                                             #4(ribcage
                                                                #2(body
                                                                   binding)
                                                                #2((top) (top))
                                                                #2("i" "i"))
                                                             #4(ribcage ())
                                                             #4(ribcage
                                                                #1(bindings)
                                                                #1((top))
                                                                #1("i"))
                                                             #4(ribcage
                                                                #1(f)
                                                                #1((top))
                                                                #1("i"))
                                                             #4(ribcage
                                                                #5(let*
                                                                   x
                                                                   v
                                                                   e1
                                                                   e2)
                                                                #5((top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top))
                                                                #5("i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"))
                                                             #4(ribcage ())
                                                             #4(ribcage
                                                                #1(x)
                                                                #1((top))
                                                                #1("i"))
                                                             #4(ribcage
                                                                ((import-token
                                                                   .
                                                                   *top*))
                                                                ()
                                                                ())))
                                                        (list %_2063)
                                                        %_2062))
                                                %_2061)
                                         (syntax-error %_2060)))
                                     ($syntax-dispatch %_2060 '(any any))))
                                  (list (%_2058 (cdr %_2059)) (car %_2059))))))
                           %_2058))
                       #f)
                      (map list %_2054 %_2055)))
                   %_2052)
            (syntax-error %_2051)))
        ($syntax-dispatch
          %_2051
          '(any #2(each (any any)) any . each-any))))
     %_2050)))
($sc-put-cte
  'cond
  (lambda (%_2069)
    ((lambda (%_2070)
       ((lambda (%_2071)
          (if %_2071
            (apply (lambda (%_2072 %_2073 %_2074)
                     (((lambda (%_2075)
                         (begin
                           (set! %_2075
                             (lambda (%_2076 %_2077)
                               (if (null? %_2077)
                                 ((lambda (%_2091)
                                    ((lambda (%_2092)
                                       (if %_2092
                                         (apply (lambda (%_2103 %_2104)
                                                  (cons '#3(syntax-object
                                                            begin
                                                            ((top)
                                                             #4(ribcage
                                                                #2(e1 e2)
                                                                #2((top) (top))
                                                                #2("i" "i"))
                                                             #4(ribcage ())
                                                             #4(ribcage
                                                                #2(clause
                                                                   clauses)
                                                                #2((top) (top))
                                                                #2("i" "i"))
                                                             #4(ribcage
                                                                #1(f)
                                                                #1((top))
                                                                #1("i"))
                                                             #4(ribcage
                                                                #3(_ m1 m2)
                                                                #3((top)
                                                                   (top)
                                                                   (top))
                                                                #3("i"
                                                                   "i"
                                                                   "i"))
                                                             #4(ribcage ())
                                                             #4(ribcage
                                                                #1(x)
                                                                #1((top))
                                                                #1("i"))
                                                             #4(ribcage
                                                                ((import-token
                                                                   .
                                                                   *top*))
                                                                ()
                                                                ())))
                                                        (cons %_2103 %_2104)))
                                                %_2092)
                                         ((lambda (%_2093)
                                            (if %_2093
                                              (apply (lambda (%_2102)
                                                       (cons '#3(syntax-object
                                                                 let
                                                                 ((top)
                                                                  #4(ribcage
                                                                     #1(e0)
                                                                     #1((top))
                                                                     #1("i"))
                                                                  #4(ribcage
                                                                     ()
                                                                     ()
                                                                     ())
                                                                  #4(ribcage
                                                                     #2(clause
                                                                        clauses)
                                                                     #2((top)
                                                                        (top))
                                                                     #2("i"
                                                                        "i"))
                                                                  #4(ribcage
                                                                     #1(f)
                                                                     #1((top))
                                                                     #1("i"))
                                                                  #4(ribcage
                                                                     #3(_
                                                                        m1
                                                                        m2)
                                                                     #3((top)
                                                                        (top)
                                                                        (top))
                                                                     #3("i"
                                                                        "i"
                                                                        "i"))
                                                                  #4(ribcage
                                                                     ()
                                                                     ()
                                                                     ())
                                                                  #4(ribcage
                                                                     #1(x)
                                                                     #1((top))
                                                                     #1("i"))
                                                                  #4(ribcage
                                                                     ((import-token
                                                                        .
                                                                        *top*))
                                                                     ()
                                                                     ())))
                                                             (cons (list (list '#3(syntax-object
                                                                                   t
                                                                                   ((top)
                                                                                    #4(ribcage
                                                                                       #1(e0)
                                                                                       #1((top))
                                                                                       #1("i"))
                                                                                    #4(ribcage
                                                                                       ()
                                                                                       ()
                                                                                       ())
                                                                                    #4(ribcage
                                                                                       #2(clause
                                                                                          clauses)
                                                                                       #2((top)
                                                                                          (top))
                                                                                       #2("i"
                                                                                          "i"))
                                                                                    #4(ribcage
                                                                                       #1(f)
                                                                                       #1((top))
                                                                                       #1("i"))
                                                                                    #4(ribcage
                                                                                       #3(_
                                                                                          m1
                                                                                          m2)
                                                                                       #3((top)
                                                                                          (top)
                                                                                          (top))
                                                                                       #3("i"
                                                                                          "i"
                                                                                          "i"))
                                                                                    #4(ribcage
                                                                                       ()
                                                                                       ()
                                                                                       ())
                                                                                    #4(ribcage
                                                                                       #1(x)
                                                                                       #1((top))
                                                                                       #1("i"))
                                                                                    #4(ribcage
                                                                                       ((import-token
                                                                                          .
                                                                                          *top*))
                                                                                       ()
                                                                                       ())))
                                                                               %_2102))
                                                                   '#3(syntax-object
                                                                       ((if t
                                                                          t))
                                                                       ((top)
                                                                        #4(ribcage
                                                                           #1(e0)
                                                                           #1((top))
                                                                           #1("i"))
                                                                        #4(ribcage
                                                                           ()
                                                                           ()
                                                                           ())
                                                                        #4(ribcage
                                                                           #2(clause
                                                                              clauses)
                                                                           #2((top)
                                                                              (top))
                                                                           #2("i"
                                                                              "i"))
                                                                        #4(ribcage
                                                                           #1(f)
                                                                           #1((top))
                                                                           #1("i"))
                                                                        #4(ribcage
                                                                           #3(_
                                                                              m1
                                                                              m2)
                                                                           #3((top)
                                                                              (top)
                                                                              (top))
                                                                           #3("i"
                                                                              "i"
                                                                              "i"))
                                                                        #4(ribcage
                                                                           ()
                                                                           ()
                                                                           ())
                                                                        #4(ribcage
                                                                           #1(x)
                                                                           #1((top))
                                                                           #1("i"))
                                                                        #4(ribcage
                                                                           ((import-token
                                                                              .
                                                                              *top*))
                                                                           ()
                                                                           ()))))))
                                                     %_2093)
                                              ((lambda (%_2094)
                                                 (if %_2094
                                                   (apply (lambda (%_2100
                                                                   %_2101)
                                                            (list '#3(syntax-object
                                                                      let
                                                                      ((top)
                                                                       #4(ribcage
                                                                          #2(e0
                                                                             e1)
                                                                          #2((top)
                                                                             (top))
                                                                          #2("i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          ()
                                                                          ()
                                                                          ())
                                                                       #4(ribcage
                                                                          #2(clause
                                                                             clauses)
                                                                          #2((top)
                                                                             (top))
                                                                          #2("i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          #1(f)
                                                                          #1((top))
                                                                          #1("i"))
                                                                       #4(ribcage
                                                                          #3(_
                                                                             m1
                                                                             m2)
                                                                          #3((top)
                                                                             (top)
                                                                             (top))
                                                                          #3("i"
                                                                             "i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          ()
                                                                          ()
                                                                          ())
                                                                       #4(ribcage
                                                                          #1(x)
                                                                          #1((top))
                                                                          #1("i"))
                                                                       #4(ribcage
                                                                          ((import-token
                                                                             .
                                                                             *top*))
                                                                          ()
                                                                          ())))
                                                                  (list (list '#3(syntax-object
                                                                                  t
                                                                                  ((top)
                                                                                   #4(ribcage
                                                                                      #2(e0
                                                                                         e1)
                                                                                      #2((top)
                                                                                         (top))
                                                                                      #2("i"
                                                                                         "i"))
                                                                                   #4(ribcage
                                                                                      ()
                                                                                      ()
                                                                                      ())
                                                                                   #4(ribcage
                                                                                      #2(clause
                                                                                         clauses)
                                                                                      #2((top)
                                                                                         (top))
                                                                                      #2("i"
                                                                                         "i"))
                                                                                   #4(ribcage
                                                                                      #1(f)
                                                                                      #1((top))
                                                                                      #1("i"))
                                                                                   #4(ribcage
                                                                                      #3(_
                                                                                         m1
                                                                                         m2)
                                                                                      #3((top)
                                                                                         (top)
                                                                                         (top))
                                                                                      #3("i"
                                                                                         "i"
                                                                                         "i"))
                                                                                   #4(ribcage
                                                                                      ()
                                                                                      ()
                                                                                      ())
                                                                                   #4(ribcage
                                                                                      #1(x)
                                                                                      #1((top))
                                                                                      #1("i"))
                                                                                   #4(ribcage
                                                                                      ((import-token
                                                                                         .
                                                                                         *top*))
                                                                                      ()
                                                                                      ())))
                                                                              %_2100))
                                                                  (list '#3(syntax-object
                                                                            if
                                                                            ((top)
                                                                             #4(ribcage
                                                                                #2(e0
                                                                                   e1)
                                                                                #2((top)
                                                                                   (top))
                                                                                #2("i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                             #4(ribcage
                                                                                #2(clause
                                                                                   clauses)
                                                                                #2((top)
                                                                                   (top))
                                                                                #2("i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                #1(f)
                                                                                #1((top))
                                                                                #1("i"))
                                                                             #4(ribcage
                                                                                #3(_
                                                                                   m1
                                                                                   m2)
                                                                                #3((top)
                                                                                   (top)
                                                                                   (top))
                                                                                #3("i"
                                                                                   "i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                             #4(ribcage
                                                                                #1(x)
                                                                                #1((top))
                                                                                #1("i"))
                                                                             #4(ribcage
                                                                                ((import-token
                                                                                   .
                                                                                   *top*))
                                                                                ()
                                                                                ())))
                                                                        '#3(syntax-object
                                                                            t
                                                                            ((top)
                                                                             #4(ribcage
                                                                                #2(e0
                                                                                   e1)
                                                                                #2((top)
                                                                                   (top))
                                                                                #2("i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                             #4(ribcage
                                                                                #2(clause
                                                                                   clauses)
                                                                                #2((top)
                                                                                   (top))
                                                                                #2("i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                #1(f)
                                                                                #1((top))
                                                                                #1("i"))
                                                                             #4(ribcage
                                                                                #3(_
                                                                                   m1
                                                                                   m2)
                                                                                #3((top)
                                                                                   (top)
                                                                                   (top))
                                                                                #3("i"
                                                                                   "i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                             #4(ribcage
                                                                                #1(x)
                                                                                #1((top))
                                                                                #1("i"))
                                                                             #4(ribcage
                                                                                ((import-token
                                                                                   .
                                                                                   *top*))
                                                                                ()
                                                                                ())))
                                                                        (cons %_2101
                                                                              '#3(syntax-object
                                                                                  (t)
                                                                                  ((top)
                                                                                   #4(ribcage
                                                                                      #2(e0
                                                                                         e1)
                                                                                      #2((top)
                                                                                         (top))
                                                                                      #2("i"
                                                                                         "i"))
                                                                                   #4(ribcage
                                                                                      ()
                                                                                      ()
                                                                                      ())
                                                                                   #4(ribcage
                                                                                      #2(clause
                                                                                         clauses)
                                                                                      #2((top)
                                                                                         (top))
                                                                                      #2("i"
                                                                                         "i"))
                                                                                   #4(ribcage
                                                                                      #1(f)
                                                                                      #1((top))
                                                                                      #1("i"))
                                                                                   #4(ribcage
                                                                                      #3(_
                                                                                         m1
                                                                                         m2)
                                                                                      #3((top)
                                                                                         (top)
                                                                                         (top))
                                                                                      #3("i"
                                                                                         "i"
                                                                                         "i"))
                                                                                   #4(ribcage
                                                                                      ()
                                                                                      ()
                                                                                      ())
                                                                                   #4(ribcage
                                                                                      #1(x)
                                                                                      #1((top))
                                                                                      #1("i"))
                                                                                   #4(ribcage
                                                                                      ((import-token
                                                                                         .
                                                                                         *top*))
                                                                                      ()
                                                                                      ())))))))
                                                          %_2094)
                                                   ((lambda (%_2095)
                                                      (if %_2095
                                                        (apply (lambda (%_2097
                                                                        %_2098
                                                                        %_2099)
                                                                 (list '#3(syntax-object
                                                                           if
                                                                           ((top)
                                                                            #4(ribcage
                                                                               #3(e0
                                                                                  e1
                                                                                  e2)
                                                                               #3((top)
                                                                                  (top)
                                                                                  (top))
                                                                               #3("i"
                                                                                  "i"
                                                                                  "i"))
                                                                            #4(ribcage
                                                                               ()
                                                                               ()
                                                                               ())
                                                                            #4(ribcage
                                                                               #2(clause
                                                                                  clauses)
                                                                               #2((top)
                                                                                  (top))
                                                                               #2("i"
                                                                                  "i"))
                                                                            #4(ribcage
                                                                               #1(f)
                                                                               #1((top))
                                                                               #1("i"))
                                                                            #4(ribcage
                                                                               #3(_
                                                                                  m1
                                                                                  m2)
                                                                               #3((top)
                                                                                  (top)
                                                                                  (top))
                                                                               #3("i"
                                                                                  "i"
                                                                                  "i"))
                                                                            #4(ribcage
                                                                               ()
                                                                               ()
                                                                               ())
                                                                            #4(ribcage
                                                                               #1(x)
                                                                               #1((top))
                                                                               #1("i"))
                                                                            #4(ribcage
                                                                               ((import-token
                                                                                  .
                                                                                  *top*))
                                                                               ()
                                                                               ())))
                                                                       %_2097
                                                                       (cons '#3(syntax-object
                                                                                 begin
                                                                                 ((top)
                                                                                  #4(ribcage
                                                                                     #3(e0
                                                                                        e1
                                                                                        e2)
                                                                                     #3((top)
                                                                                        (top)
                                                                                        (top))
                                                                                     #3("i"
                                                                                        "i"
                                                                                        "i"))
                                                                                  #4(ribcage
                                                                                     ()
                                                                                     ()
                                                                                     ())
                                                                                  #4(ribcage
                                                                                     #2(clause
                                                                                        clauses)
                                                                                     #2((top)
                                                                                        (top))
                                                                                     #2("i"
                                                                                        "i"))
                                                                                  #4(ribcage
                                                                                     #1(f)
                                                                                     #1((top))
                                                                                     #1("i"))
                                                                                  #4(ribcage
                                                                                     #3(_
                                                                                        m1
                                                                                        m2)
                                                                                     #3((top)
                                                                                        (top)
                                                                                        (top))
                                                                                     #3("i"
                                                                                        "i"
                                                                                        "i"))
                                                                                  #4(ribcage
                                                                                     ()
                                                                                     ()
                                                                                     ())
                                                                                  #4(ribcage
                                                                                     #1(x)
                                                                                     #1((top))
                                                                                     #1("i"))
                                                                                  #4(ribcage
                                                                                     ((import-token
                                                                                        .
                                                                                        *top*))
                                                                                     ()
                                                                                     ())))
                                                                             (cons %_2098
                                                                                   %_2099))))
                                                               %_2095)
                                                        ((lambda (%_2096)
                                                           (syntax-error
                                                             %_2069))
                                                         %_2091)))
                                                    ($syntax-dispatch
                                                      %_2091
                                                      '(any any . each-any)))))
                                               ($syntax-dispatch
                                                 %_2091
                                                 '(any #2(free-id
                                                          #3(syntax-object
                                                             =>
                                                             ((top)
                                                              #4(ribcage ())
                                                              #4(ribcage
                                                                 #2(clause
                                                                    clauses)
                                                                 #2((top)
                                                                    (top))
                                                                 #2("i" "i"))
                                                              #4(ribcage
                                                                 #1(f)
                                                                 #1((top))
                                                                 #1("i"))
                                                              #4(ribcage
                                                                 #3(_ m1 m2)
                                                                 #3((top)
                                                                    (top)
                                                                    (top))
                                                                 #3("i"
                                                                    "i"
                                                                    "i"))
                                                              #4(ribcage ())
                                                              #4(ribcage
                                                                 #1(x)
                                                                 #1((top))
                                                                 #1("i"))
                                                              #4(ribcage
                                                                 ((import-token
                                                                    .
                                                                    *top*))
                                                                 ()
                                                                 ()))))
                                                       any)))))
                                          ($syntax-dispatch %_2091 '(any)))))
                                     ($syntax-dispatch
                                       %_2091
                                       '(#2(free-id
                                            #3(syntax-object
                                               else
                                               ((top)
                                                #4(ribcage ())
                                                #4(ribcage
                                                   #2(clause clauses)
                                                   #2((top) (top))
                                                   #2("i" "i"))
                                                #4(ribcage
                                                   #1(f)
                                                   #1((top))
                                                   #1("i"))
                                                #4(ribcage
                                                   #3(_ m1 m2)
                                                   #3((top) (top) (top))
                                                   #3("i" "i" "i"))
                                                #4(ribcage ())
                                                #4(ribcage
                                                   #1(x)
                                                   #1((top))
                                                   #1("i"))
                                                #4(ribcage
                                                   ((import-token . *top*))
                                                   ()
                                                   ()))))
                                         any
                                         .
                                         each-any))))
                                  %_2076)
                                 ((lambda (%_2078)
                                    ((lambda (%_2079)
                                       ((lambda (%_2080)
                                          ((lambda (%_2081)
                                             (if %_2081
                                               (apply (lambda (%_2090)
                                                        (list '#3(syntax-object
                                                                  let
                                                                  ((top)
                                                                   #4(ribcage
                                                                      #1(e0)
                                                                      #1((top))
                                                                      #1("i"))
                                                                   #4(ribcage
                                                                      #1(rest)
                                                                      #1((top))
                                                                      #1("i"))
                                                                   #4(ribcage
                                                                      ()
                                                                      ()
                                                                      ())
                                                                   #4(ribcage
                                                                      #2(clause
                                                                         clauses)
                                                                      #2((top)
                                                                         (top))
                                                                      #2("i"
                                                                         "i"))
                                                                   #4(ribcage
                                                                      #1(f)
                                                                      #1((top))
                                                                      #1("i"))
                                                                   #4(ribcage
                                                                      #3(_
                                                                         m1
                                                                         m2)
                                                                      #3((top)
                                                                         (top)
                                                                         (top))
                                                                      #3("i"
                                                                         "i"
                                                                         "i"))
                                                                   #4(ribcage
                                                                      ()
                                                                      ()
                                                                      ())
                                                                   #4(ribcage
                                                                      #1(x)
                                                                      #1((top))
                                                                      #1("i"))
                                                                   #4(ribcage
                                                                      ((import-token
                                                                         .
                                                                         *top*))
                                                                      ()
                                                                      ())))
                                                              (list (list '#3(syntax-object
                                                                              t
                                                                              ((top)
                                                                               #4(ribcage
                                                                                  #1(e0)
                                                                                  #1((top))
                                                                                  #1("i"))
                                                                               #4(ribcage
                                                                                  #1(rest)
                                                                                  #1((top))
                                                                                  #1("i"))
                                                                               #4(ribcage
                                                                                  ()
                                                                                  ()
                                                                                  ())
                                                                               #4(ribcage
                                                                                  #2(clause
                                                                                     clauses)
                                                                                  #2((top)
                                                                                     (top))
                                                                                  #2("i"
                                                                                     "i"))
                                                                               #4(ribcage
                                                                                  #1(f)
                                                                                  #1((top))
                                                                                  #1("i"))
                                                                               #4(ribcage
                                                                                  #3(_
                                                                                     m1
                                                                                     m2)
                                                                                  #3((top)
                                                                                     (top)
                                                                                     (top))
                                                                                  #3("i"
                                                                                     "i"
                                                                                     "i"))
                                                                               #4(ribcage
                                                                                  ()
                                                                                  ()
                                                                                  ())
                                                                               #4(ribcage
                                                                                  #1(x)
                                                                                  #1((top))
                                                                                  #1("i"))
                                                                               #4(ribcage
                                                                                  ((import-token
                                                                                     .
                                                                                     *top*))
                                                                                  ()
                                                                                  ())))
                                                                          %_2090))
                                                              (list '#3(syntax-object
                                                                        if
                                                                        ((top)
                                                                         #4(ribcage
                                                                            #1(e0)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            #1(rest)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #2(clause
                                                                               clauses)
                                                                            #2((top)
                                                                               (top))
                                                                            #2("i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            #1(f)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            #3(_
                                                                               m1
                                                                               m2)
                                                                            #3((top)
                                                                               (top)
                                                                               (top))
                                                                            #3("i"
                                                                               "i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #1(x)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            ((import-token
                                                                               .
                                                                               *top*))
                                                                            ()
                                                                            ())))
                                                                    '#3(syntax-object
                                                                        t
                                                                        ((top)
                                                                         #4(ribcage
                                                                            #1(e0)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            #1(rest)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #2(clause
                                                                               clauses)
                                                                            #2((top)
                                                                               (top))
                                                                            #2("i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            #1(f)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            #3(_
                                                                               m1
                                                                               m2)
                                                                            #3((top)
                                                                               (top)
                                                                               (top))
                                                                            #3("i"
                                                                               "i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #1(x)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            ((import-token
                                                                               .
                                                                               *top*))
                                                                            ()
                                                                            ())))
                                                                    '#3(syntax-object
                                                                        t
                                                                        ((top)
                                                                         #4(ribcage
                                                                            #1(e0)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            #1(rest)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #2(clause
                                                                               clauses)
                                                                            #2((top)
                                                                               (top))
                                                                            #2("i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            #1(f)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            #3(_
                                                                               m1
                                                                               m2)
                                                                            #3((top)
                                                                               (top)
                                                                               (top))
                                                                            #3("i"
                                                                               "i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #1(x)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            ((import-token
                                                                               .
                                                                               *top*))
                                                                            ()
                                                                            ())))
                                                                    %_2079)))
                                                      %_2081)
                                               ((lambda (%_2082)
                                                  (if %_2082
                                                    (apply (lambda (%_2088
                                                                    %_2089)
                                                             (list '#3(syntax-object
                                                                       let
                                                                       ((top)
                                                                        #4(ribcage
                                                                           #2(e0
                                                                              e1)
                                                                           #2((top)
                                                                              (top))
                                                                           #2("i"
                                                                              "i"))
                                                                        #4(ribcage
                                                                           #1(rest)
                                                                           #1((top))
                                                                           #1("i"))
                                                                        #4(ribcage
                                                                           ()
                                                                           ()
                                                                           ())
                                                                        #4(ribcage
                                                                           #2(clause
                                                                              clauses)
                                                                           #2((top)
                                                                              (top))
                                                                           #2("i"
                                                                              "i"))
                                                                        #4(ribcage
                                                                           #1(f)
                                                                           #1((top))
                                                                           #1("i"))
                                                                        #4(ribcage
                                                                           #3(_
                                                                              m1
                                                                              m2)
                                                                           #3((top)
                                                                              (top)
                                                                              (top))
                                                                           #3("i"
                                                                              "i"
                                                                              "i"))
                                                                        #4(ribcage
                                                                           ()
                                                                           ()
                                                                           ())
                                                                        #4(ribcage
                                                                           #1(x)
                                                                           #1((top))
                                                                           #1("i"))
                                                                        #4(ribcage
                                                                           ((import-token
                                                                              .
                                                                              *top*))
                                                                           ()
                                                                           ())))
                                                                   (list (list '#3(syntax-object
                                                                                   t
                                                                                   ((top)
                                                                                    #4(ribcage
                                                                                       #2(e0
                                                                                          e1)
                                                                                       #2((top)
                                                                                          (top))
                                                                                       #2("i"
                                                                                          "i"))
                                                                                    #4(ribcage
                                                                                       #1(rest)
                                                                                       #1((top))
                                                                                       #1("i"))
                                                                                    #4(ribcage
                                                                                       ()
                                                                                       ()
                                                                                       ())
                                                                                    #4(ribcage
                                                                                       #2(clause
                                                                                          clauses)
                                                                                       #2((top)
                                                                                          (top))
                                                                                       #2("i"
                                                                                          "i"))
                                                                                    #4(ribcage
                                                                                       #1(f)
                                                                                       #1((top))
                                                                                       #1("i"))
                                                                                    #4(ribcage
                                                                                       #3(_
                                                                                          m1
                                                                                          m2)
                                                                                       #3((top)
                                                                                          (top)
                                                                                          (top))
                                                                                       #3("i"
                                                                                          "i"
                                                                                          "i"))
                                                                                    #4(ribcage
                                                                                       ()
                                                                                       ()
                                                                                       ())
                                                                                    #4(ribcage
                                                                                       #1(x)
                                                                                       #1((top))
                                                                                       #1("i"))
                                                                                    #4(ribcage
                                                                                       ((import-token
                                                                                          .
                                                                                          *top*))
                                                                                       ()
                                                                                       ())))
                                                                               %_2088))
                                                                   (list '#3(syntax-object
                                                                             if
                                                                             ((top)
                                                                              #4(ribcage
                                                                                 #2(e0
                                                                                    e1)
                                                                                 #2((top)
                                                                                    (top))
                                                                                 #2("i"
                                                                                    "i"))
                                                                              #4(ribcage
                                                                                 #1(rest)
                                                                                 #1((top))
                                                                                 #1("i"))
                                                                              #4(ribcage
                                                                                 ()
                                                                                 ()
                                                                                 ())
                                                                              #4(ribcage
                                                                                 #2(clause
                                                                                    clauses)
                                                                                 #2((top)
                                                                                    (top))
                                                                                 #2("i"
                                                                                    "i"))
                                                                              #4(ribcage
                                                                                 #1(f)
                                                                                 #1((top))
                                                                                 #1("i"))
                                                                              #4(ribcage
                                                                                 #3(_
                                                                                    m1
                                                                                    m2)
                                                                                 #3((top)
                                                                                    (top)
                                                                                    (top))
                                                                                 #3("i"
                                                                                    "i"
                                                                                    "i"))
                                                                              #4(ribcage
                                                                                 ()
                                                                                 ()
                                                                                 ())
                                                                              #4(ribcage
                                                                                 #1(x)
                                                                                 #1((top))
                                                                                 #1("i"))
                                                                              #4(ribcage
                                                                                 ((import-token
                                                                                    .
                                                                                    *top*))
                                                                                 ()
                                                                                 ())))
                                                                         '#3(syntax-object
                                                                             t
                                                                             ((top)
                                                                              #4(ribcage
                                                                                 #2(e0
                                                                                    e1)
                                                                                 #2((top)
                                                                                    (top))
                                                                                 #2("i"
                                                                                    "i"))
                                                                              #4(ribcage
                                                                                 #1(rest)
                                                                                 #1((top))
                                                                                 #1("i"))
                                                                              #4(ribcage
                                                                                 ()
                                                                                 ()
                                                                                 ())
                                                                              #4(ribcage
                                                                                 #2(clause
                                                                                    clauses)
                                                                                 #2((top)
                                                                                    (top))
                                                                                 #2("i"
                                                                                    "i"))
                                                                              #4(ribcage
                                                                                 #1(f)
                                                                                 #1((top))
                                                                                 #1("i"))
                                                                              #4(ribcage
                                                                                 #3(_
                                                                                    m1
                                                                                    m2)
                                                                                 #3((top)
                                                                                    (top)
                                                                                    (top))
                                                                                 #3("i"
                                                                                    "i"
                                                                                    "i"))
                                                                              #4(ribcage
                                                                                 ()
                                                                                 ()
                                                                                 ())
                                                                              #4(ribcage
                                                                                 #1(x)
                                                                                 #1((top))
                                                                                 #1("i"))
                                                                              #4(ribcage
                                                                                 ((import-token
                                                                                    .
                                                                                    *top*))
                                                                                 ()
                                                                                 ())))
                                                                         (cons %_2089
                                                                               '#3(syntax-object
                                                                                   (t)
                                                                                   ((top)
                                                                                    #4(ribcage
                                                                                       #2(e0
                                                                                          e1)
                                                                                       #2((top)
                                                                                          (top))
                                                                                       #2("i"
                                                                                          "i"))
                                                                                    #4(ribcage
                                                                                       #1(rest)
                                                                                       #1((top))
                                                                                       #1("i"))
                                                                                    #4(ribcage
                                                                                       ()
                                                                                       ()
                                                                                       ())
                                                                                    #4(ribcage
                                                                                       #2(clause
                                                                                          clauses)
                                                                                       #2((top)
                                                                                          (top))
                                                                                       #2("i"
                                                                                          "i"))
                                                                                    #4(ribcage
                                                                                       #1(f)
                                                                                       #1((top))
                                                                                       #1("i"))
                                                                                    #4(ribcage
                                                                                       #3(_
                                                                                          m1
                                                                                          m2)
                                                                                       #3((top)
                                                                                          (top)
                                                                                          (top))
                                                                                       #3("i"
                                                                                          "i"
                                                                                          "i"))
                                                                                    #4(ribcage
                                                                                       ()
                                                                                       ()
                                                                                       ())
                                                                                    #4(ribcage
                                                                                       #1(x)
                                                                                       #1((top))
                                                                                       #1("i"))
                                                                                    #4(ribcage
                                                                                       ((import-token
                                                                                          .
                                                                                          *top*))
                                                                                       ()
                                                                                       ()))))
                                                                         %_2079)))
                                                           %_2082)
                                                    ((lambda (%_2083)
                                                       (if %_2083
                                                         (apply (lambda (%_2085
                                                                         %_2086
                                                                         %_2087)
                                                                  (list '#3(syntax-object
                                                                            if
                                                                            ((top)
                                                                             #4(ribcage
                                                                                #3(e0
                                                                                   e1
                                                                                   e2)
                                                                                #3((top)
                                                                                   (top)
                                                                                   (top))
                                                                                #3("i"
                                                                                   "i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                #1(rest)
                                                                                #1((top))
                                                                                #1("i"))
                                                                             #4(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                             #4(ribcage
                                                                                #2(clause
                                                                                   clauses)
                                                                                #2((top)
                                                                                   (top))
                                                                                #2("i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                #1(f)
                                                                                #1((top))
                                                                                #1("i"))
                                                                             #4(ribcage
                                                                                #3(_
                                                                                   m1
                                                                                   m2)
                                                                                #3((top)
                                                                                   (top)
                                                                                   (top))
                                                                                #3("i"
                                                                                   "i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                             #4(ribcage
                                                                                #1(x)
                                                                                #1((top))
                                                                                #1("i"))
                                                                             #4(ribcage
                                                                                ((import-token
                                                                                   .
                                                                                   *top*))
                                                                                ()
                                                                                ())))
                                                                        %_2085
                                                                        (cons '#3(syntax-object
                                                                                  begin
                                                                                  ((top)
                                                                                   #4(ribcage
                                                                                      #3(e0
                                                                                         e1
                                                                                         e2)
                                                                                      #3((top)
                                                                                         (top)
                                                                                         (top))
                                                                                      #3("i"
                                                                                         "i"
                                                                                         "i"))
                                                                                   #4(ribcage
                                                                                      #1(rest)
                                                                                      #1((top))
                                                                                      #1("i"))
                                                                                   #4(ribcage
                                                                                      ()
                                                                                      ()
                                                                                      ())
                                                                                   #4(ribcage
                                                                                      #2(clause
                                                                                         clauses)
                                                                                      #2((top)
                                                                                         (top))
                                                                                      #2("i"
                                                                                         "i"))
                                                                                   #4(ribcage
                                                                                      #1(f)
                                                                                      #1((top))
                                                                                      #1("i"))
                                                                                   #4(ribcage
                                                                                      #3(_
                                                                                         m1
                                                                                         m2)
                                                                                      #3((top)
                                                                                         (top)
                                                                                         (top))
                                                                                      #3("i"
                                                                                         "i"
                                                                                         "i"))
                                                                                   #4(ribcage
                                                                                      ()
                                                                                      ()
                                                                                      ())
                                                                                   #4(ribcage
                                                                                      #1(x)
                                                                                      #1((top))
                                                                                      #1("i"))
                                                                                   #4(ribcage
                                                                                      ((import-token
                                                                                         .
                                                                                         *top*))
                                                                                      ()
                                                                                      ())))
                                                                              (cons %_2086
                                                                                    %_2087))
                                                                        %_2079))
                                                                %_2083)
                                                         ((lambda (%_2084)
                                                            (syntax-error
                                                              %_2069))
                                                          %_2080)))
                                                     ($syntax-dispatch
                                                       %_2080
                                                       '(any any
                                                             .
                                                             each-any)))))
                                                ($syntax-dispatch
                                                  %_2080
                                                  '(any #2(free-id
                                                           #3(syntax-object
                                                              =>
                                                              ((top)
                                                               #4(ribcage
                                                                  #1(rest)
                                                                  #1((top))
                                                                  #1("i"))
                                                               #4(ribcage ())
                                                               #4(ribcage
                                                                  #2(clause
                                                                     clauses)
                                                                  #2((top)
                                                                     (top))
                                                                  #2("i" "i"))
                                                               #4(ribcage
                                                                  #1(f)
                                                                  #1((top))
                                                                  #1("i"))
                                                               #4(ribcage
                                                                  #3(_ m1 m2)
                                                                  #3((top)
                                                                     (top)
                                                                     (top))
                                                                  #3("i"
                                                                     "i"
                                                                     "i"))
                                                               #4(ribcage ())
                                                               #4(ribcage
                                                                  #1(x)
                                                                  #1((top))
                                                                  #1("i"))
                                                               #4(ribcage
                                                                  ((import-token
                                                                     .
                                                                     *top*))
                                                                  ()
                                                                  ()))))
                                                        any)))))
                                           ($syntax-dispatch %_2080 '(any))))
                                        %_2076))
                                     %_2078))
                                  (%_2075 (car %_2077) (cdr %_2077))))))
                           %_2075))
                       #f)
                      %_2073
                      %_2074))
                   %_2071)
            (syntax-error %_2070)))
        ($syntax-dispatch %_2070 '(any any . each-any))))
     %_2069)))
($sc-put-cte
  'do
  (lambda (%_2105)
    ((lambda (%_2106)
       ((lambda (%_2107)
          (if %_2107
            (apply (lambda (%_2108
                            %_2109
                            %_2110
                            %_2111
                            %_2112
                            %_2113
                            %_2114)
                     ((lambda (%_2115)
                        ((lambda (%_2116)
                           (if %_2116
                             (apply (lambda (%_2117)
                                      ((lambda (%_2118)
                                         ((lambda (%_2119)
                                            (if %_2119
                                              (apply (lambda ()
                                                       (list '#3(syntax-object
                                                                 let
                                                                 ((top)
                                                                  #4(ribcage
                                                                     #1(step)
                                                                     #1((top))
                                                                     #1("i"))
                                                                  #4(ribcage
                                                                     #7(_
                                                                        var
                                                                        init
                                                                        step
                                                                        e0
                                                                        e1
                                                                        c)
                                                                     #7((top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top))
                                                                     #7("i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"))
                                                                  #4(ribcage
                                                                     ()
                                                                     ()
                                                                     ())
                                                                  #4(ribcage
                                                                     #1(orig-x)
                                                                     #1((top))
                                                                     #1("i"))
                                                                  #4(ribcage
                                                                     ((import-token
                                                                        .
                                                                        *top*))
                                                                     ()
                                                                     ())))
                                                             '#3(syntax-object
                                                                 doloop
                                                                 ((top)
                                                                  #4(ribcage
                                                                     #1(step)
                                                                     #1((top))
                                                                     #1("i"))
                                                                  #4(ribcage
                                                                     #7(_
                                                                        var
                                                                        init
                                                                        step
                                                                        e0
                                                                        e1
                                                                        c)
                                                                     #7((top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top)
                                                                        (top))
                                                                     #7("i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"))
                                                                  #4(ribcage
                                                                     ()
                                                                     ()
                                                                     ())
                                                                  #4(ribcage
                                                                     #1(orig-x)
                                                                     #1((top))
                                                                     #1("i"))
                                                                  #4(ribcage
                                                                     ((import-token
                                                                        .
                                                                        *top*))
                                                                     ()
                                                                     ())))
                                                             (map list
                                                                  %_2109
                                                                  %_2110)
                                                             (list '#3(syntax-object
                                                                       if
                                                                       ((top)
                                                                        #4(ribcage
                                                                           #1(step)
                                                                           #1((top))
                                                                           #1("i"))
                                                                        #4(ribcage
                                                                           #7(_
                                                                              var
                                                                              init
                                                                              step
                                                                              e0
                                                                              e1
                                                                              c)
                                                                           #7((top)
                                                                              (top)
                                                                              (top)
                                                                              (top)
                                                                              (top)
                                                                              (top)
                                                                              (top))
                                                                           #7("i"
                                                                              "i"
                                                                              "i"
                                                                              "i"
                                                                              "i"
                                                                              "i"
                                                                              "i"))
                                                                        #4(ribcage
                                                                           ()
                                                                           ()
                                                                           ())
                                                                        #4(ribcage
                                                                           #1(orig-x)
                                                                           #1((top))
                                                                           #1("i"))
                                                                        #4(ribcage
                                                                           ((import-token
                                                                              .
                                                                              *top*))
                                                                           ()
                                                                           ())))
                                                                   (list '#3(syntax-object
                                                                             not
                                                                             ((top)
                                                                              #4(ribcage
                                                                                 #1(step)
                                                                                 #1((top))
                                                                                 #1("i"))
                                                                              #4(ribcage
                                                                                 #7(_
                                                                                    var
                                                                                    init
                                                                                    step
                                                                                    e0
                                                                                    e1
                                                                                    c)
                                                                                 #7((top)
                                                                                    (top)
                                                                                    (top)
                                                                                    (top)
                                                                                    (top)
                                                                                    (top)
                                                                                    (top))
                                                                                 #7("i"
                                                                                    "i"
                                                                                    "i"
                                                                                    "i"
                                                                                    "i"
                                                                                    "i"
                                                                                    "i"))
                                                                              #4(ribcage
                                                                                 ()
                                                                                 ()
                                                                                 ())
                                                                              #4(ribcage
                                                                                 #1(orig-x)
                                                                                 #1((top))
                                                                                 #1("i"))
                                                                              #4(ribcage
                                                                                 ((import-token
                                                                                    .
                                                                                    *top*))
                                                                                 ()
                                                                                 ())))
                                                                         %_2112)
                                                                   (cons '#3(syntax-object
                                                                             begin
                                                                             ((top)
                                                                              #4(ribcage
                                                                                 #1(step)
                                                                                 #1((top))
                                                                                 #1("i"))
                                                                              #4(ribcage
                                                                                 #7(_
                                                                                    var
                                                                                    init
                                                                                    step
                                                                                    e0
                                                                                    e1
                                                                                    c)
                                                                                 #7((top)
                                                                                    (top)
                                                                                    (top)
                                                                                    (top)
                                                                                    (top)
                                                                                    (top)
                                                                                    (top))
                                                                                 #7("i"
                                                                                    "i"
                                                                                    "i"
                                                                                    "i"
                                                                                    "i"
                                                                                    "i"
                                                                                    "i"))
                                                                              #4(ribcage
                                                                                 ()
                                                                                 ()
                                                                                 ())
                                                                              #4(ribcage
                                                                                 #1(orig-x)
                                                                                 #1((top))
                                                                                 #1("i"))
                                                                              #4(ribcage
                                                                                 ((import-token
                                                                                    .
                                                                                    *top*))
                                                                                 ()
                                                                                 ())))
                                                                         (append
                                                                           %_2114
                                                                           (list (cons '#3(syntax-object
                                                                                           doloop
                                                                                           ((top)
                                                                                            #4(ribcage
                                                                                               #1(step)
                                                                                               #1((top))
                                                                                               #1("i"))
                                                                                            #4(ribcage
                                                                                               #7(_
                                                                                                  var
                                                                                                  init
                                                                                                  step
                                                                                                  e0
                                                                                                  e1
                                                                                                  c)
                                                                                               #7((top)
                                                                                                  (top)
                                                                                                  (top)
                                                                                                  (top)
                                                                                                  (top)
                                                                                                  (top)
                                                                                                  (top))
                                                                                               #7("i"
                                                                                                  "i"
                                                                                                  "i"
                                                                                                  "i"
                                                                                                  "i"
                                                                                                  "i"
                                                                                                  "i"))
                                                                                            #4(ribcage
                                                                                               ()
                                                                                               ()
                                                                                               ())
                                                                                            #4(ribcage
                                                                                               #1(orig-x)
                                                                                               #1((top))
                                                                                               #1("i"))
                                                                                            #4(ribcage
                                                                                               ((import-token
                                                                                                  .
                                                                                                  *top*))
                                                                                               ()
                                                                                               ())))
                                                                                       %_2117)))))))
                                                     %_2119)
                                              ((lambda (%_2120)
                                                 (if %_2120
                                                   (apply (lambda (%_2121
                                                                   %_2122)
                                                            (list '#3(syntax-object
                                                                      let
                                                                      ((top)
                                                                       #4(ribcage
                                                                          #2(e1
                                                                             e2)
                                                                          #2((top)
                                                                             (top))
                                                                          #2("i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          #1(step)
                                                                          #1((top))
                                                                          #1("i"))
                                                                       #4(ribcage
                                                                          #7(_
                                                                             var
                                                                             init
                                                                             step
                                                                             e0
                                                                             e1
                                                                             c)
                                                                          #7((top)
                                                                             (top)
                                                                             (top)
                                                                             (top)
                                                                             (top)
                                                                             (top)
                                                                             (top))
                                                                          #7("i"
                                                                             "i"
                                                                             "i"
                                                                             "i"
                                                                             "i"
                                                                             "i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          ()
                                                                          ()
                                                                          ())
                                                                       #4(ribcage
                                                                          #1(orig-x)
                                                                          #1((top))
                                                                          #1("i"))
                                                                       #4(ribcage
                                                                          ((import-token
                                                                             .
                                                                             *top*))
                                                                          ()
                                                                          ())))
                                                                  '#3(syntax-object
                                                                      doloop
                                                                      ((top)
                                                                       #4(ribcage
                                                                          #2(e1
                                                                             e2)
                                                                          #2((top)
                                                                             (top))
                                                                          #2("i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          #1(step)
                                                                          #1((top))
                                                                          #1("i"))
                                                                       #4(ribcage
                                                                          #7(_
                                                                             var
                                                                             init
                                                                             step
                                                                             e0
                                                                             e1
                                                                             c)
                                                                          #7((top)
                                                                             (top)
                                                                             (top)
                                                                             (top)
                                                                             (top)
                                                                             (top)
                                                                             (top))
                                                                          #7("i"
                                                                             "i"
                                                                             "i"
                                                                             "i"
                                                                             "i"
                                                                             "i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          ()
                                                                          ()
                                                                          ())
                                                                       #4(ribcage
                                                                          #1(orig-x)
                                                                          #1((top))
                                                                          #1("i"))
                                                                       #4(ribcage
                                                                          ((import-token
                                                                             .
                                                                             *top*))
                                                                          ()
                                                                          ())))
                                                                  (map list
                                                                       %_2109
                                                                       %_2110)
                                                                  (list '#3(syntax-object
                                                                            if
                                                                            ((top)
                                                                             #4(ribcage
                                                                                #2(e1
                                                                                   e2)
                                                                                #2((top)
                                                                                   (top))
                                                                                #2("i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                #1(step)
                                                                                #1((top))
                                                                                #1("i"))
                                                                             #4(ribcage
                                                                                #7(_
                                                                                   var
                                                                                   init
                                                                                   step
                                                                                   e0
                                                                                   e1
                                                                                   c)
                                                                                #7((top)
                                                                                   (top)
                                                                                   (top)
                                                                                   (top)
                                                                                   (top)
                                                                                   (top)
                                                                                   (top))
                                                                                #7("i"
                                                                                   "i"
                                                                                   "i"
                                                                                   "i"
                                                                                   "i"
                                                                                   "i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                             #4(ribcage
                                                                                #1(orig-x)
                                                                                #1((top))
                                                                                #1("i"))
                                                                             #4(ribcage
                                                                                ((import-token
                                                                                   .
                                                                                   *top*))
                                                                                ()
                                                                                ())))
                                                                        %_2112
                                                                        (cons '#3(syntax-object
                                                                                  begin
                                                                                  ((top)
                                                                                   #4(ribcage
                                                                                      #2(e1
                                                                                         e2)
                                                                                      #2((top)
                                                                                         (top))
                                                                                      #2("i"
                                                                                         "i"))
                                                                                   #4(ribcage
                                                                                      #1(step)
                                                                                      #1((top))
                                                                                      #1("i"))
                                                                                   #4(ribcage
                                                                                      #7(_
                                                                                         var
                                                                                         init
                                                                                         step
                                                                                         e0
                                                                                         e1
                                                                                         c)
                                                                                      #7((top)
                                                                                         (top)
                                                                                         (top)
                                                                                         (top)
                                                                                         (top)
                                                                                         (top)
                                                                                         (top))
                                                                                      #7("i"
                                                                                         "i"
                                                                                         "i"
                                                                                         "i"
                                                                                         "i"
                                                                                         "i"
                                                                                         "i"))
                                                                                   #4(ribcage
                                                                                      ()
                                                                                      ()
                                                                                      ())
                                                                                   #4(ribcage
                                                                                      #1(orig-x)
                                                                                      #1((top))
                                                                                      #1("i"))
                                                                                   #4(ribcage
                                                                                      ((import-token
                                                                                         .
                                                                                         *top*))
                                                                                      ()
                                                                                      ())))
                                                                              (cons %_2121
                                                                                    %_2122))
                                                                        (cons '#3(syntax-object
                                                                                  begin
                                                                                  ((top)
                                                                                   #4(ribcage
                                                                                      #2(e1
                                                                                         e2)
                                                                                      #2((top)
                                                                                         (top))
                                                                                      #2("i"
                                                                                         "i"))
                                                                                   #4(ribcage
                                                                                      #1(step)
                                                                                      #1((top))
                                                                                      #1("i"))
                                                                                   #4(ribcage
                                                                                      #7(_
                                                                                         var
                                                                                         init
                                                                                         step
                                                                                         e0
                                                                                         e1
                                                                                         c)
                                                                                      #7((top)
                                                                                         (top)
                                                                                         (top)
                                                                                         (top)
                                                                                         (top)
                                                                                         (top)
                                                                                         (top))
                                                                                      #7("i"
                                                                                         "i"
                                                                                         "i"
                                                                                         "i"
                                                                                         "i"
                                                                                         "i"
                                                                                         "i"))
                                                                                   #4(ribcage
                                                                                      ()
                                                                                      ()
                                                                                      ())
                                                                                   #4(ribcage
                                                                                      #1(orig-x)
                                                                                      #1((top))
                                                                                      #1("i"))
                                                                                   #4(ribcage
                                                                                      ((import-token
                                                                                         .
                                                                                         *top*))
                                                                                      ()
                                                                                      ())))
                                                                              (append
                                                                                %_2114
                                                                                (list (cons '#3(syntax-object
                                                                                                doloop
                                                                                                ((top)
                                                                                                 #4(ribcage
                                                                                                    #2(e1
                                                                                                       e2)
                                                                                                    #2((top)
                                                                                                       (top))
                                                                                                    #2("i"
                                                                                                       "i"))
                                                                                                 #4(ribcage
                                                                                                    #1(step)
                                                                                                    #1((top))
                                                                                                    #1("i"))
                                                                                                 #4(ribcage
                                                                                                    #7(_
                                                                                                       var
                                                                                                       init
                                                                                                       step
                                                                                                       e0
                                                                                                       e1
                                                                                                       c)
                                                                                                    #7((top)
                                                                                                       (top)
                                                                                                       (top)
                                                                                                       (top)
                                                                                                       (top)
                                                                                                       (top)
                                                                                                       (top))
                                                                                                    #7("i"
                                                                                                       "i"
                                                                                                       "i"
                                                                                                       "i"
                                                                                                       "i"
                                                                                                       "i"
                                                                                                       "i"))
                                                                                                 #4(ribcage
                                                                                                    ()
                                                                                                    ()
                                                                                                    ())
                                                                                                 #4(ribcage
                                                                                                    #1(orig-x)
                                                                                                    #1((top))
                                                                                                    #1("i"))
                                                                                                 #4(ribcage
                                                                                                    ((import-token
                                                                                                       .
                                                                                                       *top*))
                                                                                                    ()
                                                                                                    ())))
                                                                                            %_2117)))))))
                                                          %_2120)
                                                   (syntax-error %_2118)))
                                               ($syntax-dispatch
                                                 %_2118
                                                 '(any . each-any)))))
                                          ($syntax-dispatch %_2118 '())))
                                       %_2113))
                                    %_2116)
                             (syntax-error %_2115)))
                         ($syntax-dispatch %_2115 'each-any)))
                      (map (lambda (%_2123 %_2124)
                             ((lambda (%_2125)
                                ((lambda (%_2126)
                                   (if %_2126
                                     (apply (lambda () %_2123) %_2126)
                                     ((lambda (%_2127)
                                        (if %_2127
                                          (apply (lambda (%_2129) %_2129)
                                                 %_2127)
                                          ((lambda (%_2128)
                                             (syntax-error %_2105))
                                           %_2125)))
                                      ($syntax-dispatch %_2125 '(any)))))
                                 ($syntax-dispatch %_2125 '())))
                              %_2124))
                           %_2109
                           %_2111)))
                   %_2107)
            (syntax-error %_2106)))
        ($syntax-dispatch
          %_2106
          '(any #2(each (any any . any))
                (any . each-any)
                .
                each-any))))
     %_2105)))
($sc-put-cte
  'quasiquote
  ((lambda (%_2130
            %_2131
            %_2132
            %_2133
            %_2134
            %_2135
            %_2136
            %_2137
            %_2138)
     (begin
       (set! %_2130
         (lambda (%_2144)
           (if (identifier? %_2144)
             (free-identifier=?
               %_2144
               '#3(syntax-object
                   quote
                   ((top)
                    #4(ribcage ())
                    #4(ribcage ())
                    #4(ribcage #1(x) #1((top)) #1("i"))
                    #4(ribcage
                       #9(isquote?
                          islist?
                          iscons?
                          quote-nil?
                          quasilist*
                          quasicons
                          quasiappend
                          quasivector
                          quasi)
                       #9((top)
                          (top)
                          (top)
                          (top)
                          (top)
                          (top)
                          (top)
                          (top)
                          (top))
                       #9("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                    #4(ribcage ((import-token . *top*)) ()))))
             '#f)))
       (set! %_2131
         (lambda (%_2145)
           (if (identifier? %_2145)
             (free-identifier=?
               %_2145
               '#3(syntax-object
                   list
                   ((top)
                    #4(ribcage ())
                    #4(ribcage ())
                    #4(ribcage #1(x) #1((top)) #1("i"))
                    #4(ribcage
                       #9(isquote?
                          islist?
                          iscons?
                          quote-nil?
                          quasilist*
                          quasicons
                          quasiappend
                          quasivector
                          quasi)
                       #9((top)
                          (top)
                          (top)
                          (top)
                          (top)
                          (top)
                          (top)
                          (top)
                          (top))
                       #9("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                    #4(ribcage ((import-token . *top*)) ()))))
             '#f)))
       (set! %_2132
         (lambda (%_2146)
           (if (identifier? %_2146)
             (free-identifier=?
               %_2146
               '#3(syntax-object
                   cons
                   ((top)
                    #4(ribcage ())
                    #4(ribcage ())
                    #4(ribcage #1(x) #1((top)) #1("i"))
                    #4(ribcage
                       #9(isquote?
                          islist?
                          iscons?
                          quote-nil?
                          quasilist*
                          quasicons
                          quasiappend
                          quasivector
                          quasi)
                       #9((top)
                          (top)
                          (top)
                          (top)
                          (top)
                          (top)
                          (top)
                          (top)
                          (top))
                       #9("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                    #4(ribcage ((import-token . *top*)) ()))))
             '#f)))
       (set! %_2133
         (lambda (%_2147)
           ((lambda (%_2148)
              ((lambda (%_2149)
                 (if %_2149
                   (apply (lambda (%_2151) (%_2130 %_2151)) %_2149)
                   ((lambda (%_2150) '#f) %_2148)))
               ($syntax-dispatch %_2148 '(any ()))))
            %_2147)))
       (set! %_2134
         (lambda (%_2152 %_2153)
           (((lambda (%_2154)
               (begin
                 (set! %_2154
                   (lambda (%_2155)
                     (if (null? %_2155)
                       %_2153
                       (%_2135 (car %_2155) (%_2154 (cdr %_2155))))))
                 %_2154))
             #f)
            %_2152)))
       (set! %_2135
         (lambda (%_2156 %_2157)
           ((lambda (%_2158)
              ((lambda (%_2159)
                 (if %_2159
                   (apply (lambda (%_2160 %_2161)
                            ((lambda (%_2162)
                               ((lambda (%_2163)
                                  (if (if %_2163
                                        (apply (lambda (%_2179 %_2180)
                                                 (%_2130 %_2179))
                                               %_2163)
                                        '#f)
                                    (apply (lambda (%_2170 %_2171)
                                             ((lambda (%_2172)
                                                ((lambda (%_2173)
                                                   (if (if %_2173
                                                         (apply (lambda (%_2177
                                                                         %_2178)
                                                                  (%_2130
                                                                    %_2177))
                                                                %_2173)
                                                         '#f)
                                                     (apply (lambda (%_2175
                                                                     %_2176)
                                                              (list '#3(syntax-object
                                                                        quote
                                                                        ((top)
                                                                         #4(ribcage
                                                                            #2(quote?
                                                                               dx)
                                                                            #2((top)
                                                                               (top))
                                                                            #2("i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            #2(quote?
                                                                               dy)
                                                                            #2((top)
                                                                               (top))
                                                                            #2("i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            #2(x
                                                                               y)
                                                                            #2((top)
                                                                               (top))
                                                                            #2("i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #2(x
                                                                               y)
                                                                            #2((top)
                                                                               (top))
                                                                            #2("i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            #9(isquote?
                                                                               islist?
                                                                               iscons?
                                                                               quote-nil?
                                                                               quasilist*
                                                                               quasicons
                                                                               quasiappend
                                                                               quasivector
                                                                               quasi)
                                                                            #9((top)
                                                                               (top)
                                                                               (top)
                                                                               (top)
                                                                               (top)
                                                                               (top)
                                                                               (top)
                                                                               (top)
                                                                               (top))
                                                                            #9("i"
                                                                               "i"
                                                                               "i"
                                                                               "i"
                                                                               "i"
                                                                               "i"
                                                                               "i"
                                                                               "i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            ((import-token
                                                                               .
                                                                               *top*))
                                                                            ()
                                                                            ())))
                                                                    (cons %_2176
                                                                          %_2171)))
                                                            %_2173)
                                                     ((lambda (%_2174)
                                                        (if (null? %_2171)
                                                          (list '#3(syntax-object
                                                                    list
                                                                    ((top)
                                                                     #4(ribcage
                                                                        #1(_)
                                                                        #1((top))
                                                                        #1("i"))
                                                                     #4(ribcage
                                                                        #2(quote?
                                                                           dy)
                                                                        #2((top)
                                                                           (top))
                                                                        #2("i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        #2(x y)
                                                                        #2((top)
                                                                           (top))
                                                                        #2("i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        ()
                                                                        ()
                                                                        ())
                                                                     #4(ribcage
                                                                        ()
                                                                        ()
                                                                        ())
                                                                     #4(ribcage
                                                                        #2(x y)
                                                                        #2((top)
                                                                           (top))
                                                                        #2("i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        #9(isquote?
                                                                           islist?
                                                                           iscons?
                                                                           quote-nil?
                                                                           quasilist*
                                                                           quasicons
                                                                           quasiappend
                                                                           quasivector
                                                                           quasi)
                                                                        #9((top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top))
                                                                        #9("i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        ((import-token
                                                                           .
                                                                           *top*))
                                                                        ()
                                                                        ())))
                                                                %_2160)
                                                          (list '#3(syntax-object
                                                                    cons
                                                                    ((top)
                                                                     #4(ribcage
                                                                        #1(_)
                                                                        #1((top))
                                                                        #1("i"))
                                                                     #4(ribcage
                                                                        #2(quote?
                                                                           dy)
                                                                        #2((top)
                                                                           (top))
                                                                        #2("i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        #2(x y)
                                                                        #2((top)
                                                                           (top))
                                                                        #2("i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        ()
                                                                        ()
                                                                        ())
                                                                     #4(ribcage
                                                                        ()
                                                                        ()
                                                                        ())
                                                                     #4(ribcage
                                                                        #2(x y)
                                                                        #2((top)
                                                                           (top))
                                                                        #2("i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        #9(isquote?
                                                                           islist?
                                                                           iscons?
                                                                           quote-nil?
                                                                           quasilist*
                                                                           quasicons
                                                                           quasiappend
                                                                           quasivector
                                                                           quasi)
                                                                        #9((top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top))
                                                                        #9("i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        ((import-token
                                                                           .
                                                                           *top*))
                                                                        ()
                                                                        ())))
                                                                %_2160
                                                                %_2161)))
                                                      %_2172)))
                                                 ($syntax-dispatch
                                                   %_2172
                                                   '(any any))))
                                              %_2160))
                                           %_2163)
                                    ((lambda (%_2164)
                                       (if (if %_2164
                                             (apply (lambda (%_2168 %_2169)
                                                      (%_2131 %_2168))
                                                    %_2164)
                                             '#f)
                                         (apply (lambda (%_2166 %_2167)
                                                  (cons '#3(syntax-object
                                                            list
                                                            ((top)
                                                             #4(ribcage
                                                                #2(listp stuff)
                                                                #2((top) (top))
                                                                #2("i" "i"))
                                                             #4(ribcage
                                                                #2(x y)
                                                                #2((top) (top))
                                                                #2("i" "i"))
                                                             #4(ribcage ())
                                                             #4(ribcage ())
                                                             #4(ribcage
                                                                #2(x y)
                                                                #2((top) (top))
                                                                #2("i" "i"))
                                                             #4(ribcage
                                                                #9(isquote?
                                                                   islist?
                                                                   iscons?
                                                                   quote-nil?
                                                                   quasilist*
                                                                   quasicons
                                                                   quasiappend
                                                                   quasivector
                                                                   quasi)
                                                                #9((top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top))
                                                                #9("i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"))
                                                             #4(ribcage
                                                                ((import-token
                                                                   .
                                                                   *top*))
                                                                ()
                                                                ())))
                                                        (cons %_2160 %_2167)))
                                                %_2164)
                                         ((lambda (%_2165)
                                            (list '#3(syntax-object
                                                      cons
                                                      ((top)
                                                       #4(ribcage
                                                          #1(else)
                                                          #1((top))
                                                          #1("i"))
                                                       #4(ribcage
                                                          #2(x y)
                                                          #2((top) (top))
                                                          #2("i" "i"))
                                                       #4(ribcage ())
                                                       #4(ribcage ())
                                                       #4(ribcage
                                                          #2(x y)
                                                          #2((top) (top))
                                                          #2("i" "i"))
                                                       #4(ribcage
                                                          #9(isquote?
                                                             islist?
                                                             iscons?
                                                             quote-nil?
                                                             quasilist*
                                                             quasicons
                                                             quasiappend
                                                             quasivector
                                                             quasi)
                                                          #9((top)
                                                             (top)
                                                             (top)
                                                             (top)
                                                             (top)
                                                             (top)
                                                             (top)
                                                             (top)
                                                             (top))
                                                          #9("i"
                                                             "i"
                                                             "i"
                                                             "i"
                                                             "i"
                                                             "i"
                                                             "i"
                                                             "i"
                                                             "i"))
                                                       #4(ribcage
                                                          ((import-token
                                                             .
                                                             *top*))
                                                          ()
                                                          ())))
                                                  %_2160
                                                  %_2161))
                                          %_2162)))
                                     ($syntax-dispatch %_2162 '(any . any)))))
                                ($syntax-dispatch %_2162 '(any any))))
                             %_2161))
                          %_2159)
                   (syntax-error %_2158)))
               ($syntax-dispatch %_2158 '(any any))))
            (list %_2156 %_2157))))
       (set! %_2136
         (lambda (%_2181 %_2182)
           ((lambda (%_2183)
              (if (null? %_2183)
                '#3(syntax-object
                    '()
                    ((top)
                     #4(ribcage ())
                     #4(ribcage ())
                     #4(ribcage #1(ls) #1((top)) #1("i"))
                     #4(ribcage ())
                     #4(ribcage ())
                     #4(ribcage #2(x y) #2((top) (top)) #2("i" "i"))
                     #4(ribcage
                        #9(isquote?
                           islist?
                           iscons?
                           quote-nil?
                           quasilist*
                           quasicons
                           quasiappend
                           quasivector
                           quasi)
                        #9((top)
                           (top)
                           (top)
                           (top)
                           (top)
                           (top)
                           (top)
                           (top)
                           (top))
                        #9("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                     #4(ribcage ((import-token . *top*)) ())))
                (if (null? (cdr %_2183))
                  (car %_2183)
                  ((lambda (%_2184)
                     ((lambda (%_2185)
                        (if %_2185
                          (apply (lambda (%_2186)
                                   (cons '#3(syntax-object
                                             append
                                             ((top)
                                              #4(ribcage
                                                 #1(p)
                                                 #1((top))
                                                 #1("i"))
                                              #4(ribcage ())
                                              #4(ribcage ())
                                              #4(ribcage
                                                 #1(ls)
                                                 #1((top))
                                                 #1("i"))
                                              #4(ribcage ())
                                              #4(ribcage ())
                                              #4(ribcage
                                                 #2(x y)
                                                 #2((top) (top))
                                                 #2("i" "i"))
                                              #4(ribcage
                                                 #9(isquote?
                                                    islist?
                                                    iscons?
                                                    quote-nil?
                                                    quasilist*
                                                    quasicons
                                                    quasiappend
                                                    quasivector
                                                    quasi)
                                                 #9((top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top)
                                                    (top))
                                                 #9("i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"))
                                              #4(ribcage
                                                 ((import-token . *top*))
                                                 ()
                                                 ())))
                                         %_2186))
                                 %_2185)
                          (syntax-error %_2184)))
                      ($syntax-dispatch %_2184 'each-any)))
                   %_2183))))
            (((lambda (%_2187)
                (begin
                  (set! %_2187
                    (lambda (%_2188)
                      (if (null? %_2188)
                        (if (%_2133 %_2182) '() (list %_2182))
                        (if (%_2133 (car %_2188))
                          (%_2187 (cdr %_2188))
                          (cons (car %_2188) (%_2187 (cdr %_2188)))))))
                  %_2187))
              #f)
             %_2181))))
       (set! %_2137
         (lambda (%_2189)
           ((lambda (%_2190)
              ((lambda (%_2191)
                 ((lambda (%_2192)
                    ((lambda (%_2193)
                       (if (if %_2193
                             (apply (lambda (%_2222 %_2223) (%_2130 %_2222))
                                    %_2193)
                             '#f)
                         (apply (lambda (%_2220 %_2221)
                                  (list '#3(syntax-object
                                            quote
                                            ((top)
                                             #4(ribcage
                                                #2(quote? x)
                                                #2((top) (top))
                                                #2("i" "i"))
                                             #4(ribcage
                                                #1(pat-x)
                                                #1((top))
                                                #1("i"))
                                             #4(ribcage ())
                                             #4(ribcage ())
                                             #4(ribcage
                                                #1(x)
                                                #1((top))
                                                #1("i"))
                                             #4(ribcage
                                                #9(isquote?
                                                   islist?
                                                   iscons?
                                                   quote-nil?
                                                   quasilist*
                                                   quasicons
                                                   quasiappend
                                                   quasivector
                                                   quasi)
                                                #9((top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top))
                                                #9("i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"))
                                             #4(ribcage
                                                ((import-token . *top*))
                                                ()
                                                ())))
                                        (list->vector %_2221)))
                                %_2193)
                         ((lambda (%_2194)
                            (((lambda (%_2195)
                                (begin
                                  (set! %_2195
                                    (lambda (%_2196 %_2197)
                                      ((lambda (%_2198)
                                         ((lambda (%_2199)
                                            (if (if %_2199
                                                  (apply (lambda (%_2217
                                                                  %_2218)
                                                           (%_2130 %_2217))
                                                         %_2199)
                                                  '#f)
                                              (apply (lambda (%_2214 %_2215)
                                                       (%_2197
                                                         (map (lambda (%_2216)
                                                                (list '#3(syntax-object
                                                                          quote
                                                                          ((top)
                                                                           #4(ribcage
                                                                              #2(quote?
                                                                                 x)
                                                                              #2((top)
                                                                                 (top))
                                                                              #2("i"
                                                                                 "i"))
                                                                           #4(ribcage
                                                                              ()
                                                                              ()
                                                                              ())
                                                                           #4(ribcage
                                                                              #2(x
                                                                                 k)
                                                                              #2((top)
                                                                                 (top))
                                                                              #2("i"
                                                                                 "i"))
                                                                           #4(ribcage
                                                                              #1(f)
                                                                              #1((top))
                                                                              #1("i"))
                                                                           #4(ribcage
                                                                              #1(_)
                                                                              #1((top))
                                                                              #1("i"))
                                                                           #4(ribcage
                                                                              #1(pat-x)
                                                                              #1((top))
                                                                              #1("i"))
                                                                           #4(ribcage
                                                                              ()
                                                                              ()
                                                                              ())
                                                                           #4(ribcage
                                                                              ()
                                                                              ()
                                                                              ())
                                                                           #4(ribcage
                                                                              #1(x)
                                                                              #1((top))
                                                                              #1("i"))
                                                                           #4(ribcage
                                                                              #9(isquote?
                                                                                 islist?
                                                                                 iscons?
                                                                                 quote-nil?
                                                                                 quasilist*
                                                                                 quasicons
                                                                                 quasiappend
                                                                                 quasivector
                                                                                 quasi)
                                                                              #9((top)
                                                                                 (top)
                                                                                 (top)
                                                                                 (top)
                                                                                 (top)
                                                                                 (top)
                                                                                 (top)
                                                                                 (top)
                                                                                 (top))
                                                                              #9("i"
                                                                                 "i"
                                                                                 "i"
                                                                                 "i"
                                                                                 "i"
                                                                                 "i"
                                                                                 "i"
                                                                                 "i"
                                                                                 "i"))
                                                                           #4(ribcage
                                                                              ((import-token
                                                                                 .
                                                                                 *top*))
                                                                              ()
                                                                              ())))
                                                                      %_2216))
                                                              %_2215)))
                                                     %_2199)
                                              ((lambda (%_2200)
                                                 (if (if %_2200
                                                       (apply (lambda (%_2212
                                                                       %_2213)
                                                                (%_2131
                                                                  %_2212))
                                                              %_2200)
                                                       '#f)
                                                   (apply (lambda (%_2210
                                                                   %_2211)
                                                            (%_2197 %_2211))
                                                          %_2200)
                                                   ((lambda (%_2201)
                                                      (if (if %_2201
                                                            (apply (lambda (%_2207
                                                                            %_2208
                                                                            %_2209)
                                                                     (%_2132
                                                                       %_2207))
                                                                   %_2201)
                                                            '#f)
                                                        (apply (lambda (%_2203
                                                                        %_2204
                                                                        %_2205)
                                                                 (%_2195
                                                                   %_2205
                                                                   (lambda (%_2206)
                                                                     (%_2197
                                                                       (cons %_2204
                                                                             %_2206)))))
                                                               %_2201)
                                                        ((lambda (%_2202)
                                                           (list '#3(syntax-object
                                                                     list->vector
                                                                     ((top)
                                                                      #4(ribcage
                                                                         #1(else)
                                                                         #1((top))
                                                                         #1("i"))
                                                                      #4(ribcage
                                                                         ()
                                                                         ()
                                                                         ())
                                                                      #4(ribcage
                                                                         #2(x
                                                                            k)
                                                                         #2((top)
                                                                            (top))
                                                                         #2("i"
                                                                            "i"))
                                                                      #4(ribcage
                                                                         #1(f)
                                                                         #1((top))
                                                                         #1("i"))
                                                                      #4(ribcage
                                                                         #1(_)
                                                                         #1((top))
                                                                         #1("i"))
                                                                      #4(ribcage
                                                                         #1(pat-x)
                                                                         #1((top))
                                                                         #1("i"))
                                                                      #4(ribcage
                                                                         ()
                                                                         ()
                                                                         ())
                                                                      #4(ribcage
                                                                         ()
                                                                         ()
                                                                         ())
                                                                      #4(ribcage
                                                                         #1(x)
                                                                         #1((top))
                                                                         #1("i"))
                                                                      #4(ribcage
                                                                         #9(isquote?
                                                                            islist?
                                                                            iscons?
                                                                            quote-nil?
                                                                            quasilist*
                                                                            quasicons
                                                                            quasiappend
                                                                            quasivector
                                                                            quasi)
                                                                         #9((top)
                                                                            (top)
                                                                            (top)
                                                                            (top)
                                                                            (top)
                                                                            (top)
                                                                            (top)
                                                                            (top)
                                                                            (top))
                                                                         #9("i"
                                                                            "i"
                                                                            "i"
                                                                            "i"
                                                                            "i"
                                                                            "i"
                                                                            "i"
                                                                            "i"
                                                                            "i"))
                                                                      #4(ribcage
                                                                         ((import-token
                                                                            .
                                                                            *top*))
                                                                         ()
                                                                         ())))
                                                                 %_2191))
                                                         %_2198)))
                                                    ($syntax-dispatch
                                                      %_2198
                                                      '(any any any)))))
                                               ($syntax-dispatch
                                                 %_2198
                                                 '(any . each-any)))))
                                          ($syntax-dispatch
                                            %_2198
                                            '(any each-any))))
                                       %_2196)))
                                  %_2195))
                              #f)
                             %_2189
                             (lambda (%_2219)
                               (cons '#3(syntax-object
                                         vector
                                         ((top)
                                          #4(ribcage ())
                                          #4(ribcage ())
                                          #4(ribcage #1(ls) #1((top)) #1("i"))
                                          #4(ribcage #1(_) #1((top)) #1("i"))
                                          #4(ribcage
                                             #1(pat-x)
                                             #1((top))
                                             #1("i"))
                                          #4(ribcage ())
                                          #4(ribcage ())
                                          #4(ribcage #1(x) #1((top)) #1("i"))
                                          #4(ribcage
                                             #9(isquote?
                                                islist?
                                                iscons?
                                                quote-nil?
                                                quasilist*
                                                quasicons
                                                quasiappend
                                                quasivector
                                                quasi)
                                             #9((top)
                                                (top)
                                                (top)
                                                (top)
                                                (top)
                                                (top)
                                                (top)
                                                (top)
                                                (top))
                                             #9("i"
                                                "i"
                                                "i"
                                                "i"
                                                "i"
                                                "i"
                                                "i"
                                                "i"
                                                "i"))
                                          #4(ribcage
                                             ((import-token . *top*))
                                             ()
                                             ())))
                                     %_2219))))
                          %_2192)))
                     ($syntax-dispatch %_2192 '(any each-any))))
                  %_2191))
               %_2190))
            %_2189)))
       (set! %_2138
         (lambda (%_2224 %_2225)
           ((lambda (%_2226)
              ((lambda (%_2227)
                 (if %_2227
                   (apply (lambda (%_2242)
                            (if (= %_2225 '0)
                              %_2242
                              (%_2135
                                '#3(syntax-object
                                    'unquote
                                    ((top)
                                     #4(ribcage #1(p) #1((top)) #1("i"))
                                     #4(ribcage ())
                                     #4(ribcage
                                        #2(p lev)
                                        #2((top) (top))
                                        #2("i" "i"))
                                     #4(ribcage
                                        #9(isquote?
                                           islist?
                                           iscons?
                                           quote-nil?
                                           quasilist*
                                           quasicons
                                           quasiappend
                                           quasivector
                                           quasi)
                                        #9((top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top))
                                        #9("i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"))
                                     #4(ribcage ((import-token . *top*)) ())))
                                (%_2138 (list %_2242) (- %_2225 '1)))))
                          %_2227)
                   ((lambda (%_2228)
                      (if %_2228
                        (apply (lambda (%_2240 %_2241)
                                 (if (= %_2225 '0)
                                   (%_2134 %_2240 (%_2138 %_2241 %_2225))
                                   (%_2135
                                     (%_2135
                                       '#3(syntax-object
                                           'unquote
                                           ((top)
                                            #4(ribcage
                                               #2(p q)
                                               #2((top) (top))
                                               #2("i" "i"))
                                            #4(ribcage ())
                                            #4(ribcage
                                               #2(p lev)
                                               #2((top) (top))
                                               #2("i" "i"))
                                            #4(ribcage
                                               #9(isquote?
                                                  islist?
                                                  iscons?
                                                  quote-nil?
                                                  quasilist*
                                                  quasicons
                                                  quasiappend
                                                  quasivector
                                                  quasi)
                                               #9((top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top))
                                               #9("i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"))
                                            #4(ribcage
                                               ((import-token . *top*))
                                               ()
                                               ())))
                                       (%_2138 %_2240 (- %_2225 '1)))
                                     (%_2138 %_2241 %_2225))))
                               %_2228)
                        ((lambda (%_2229)
                           (if %_2229
                             (apply (lambda (%_2238 %_2239)
                                      (if (= %_2225 '0)
                                        (%_2136 %_2238 (%_2138 %_2239 %_2225))
                                        (%_2135
                                          (%_2135
                                            '#3(syntax-object
                                                'unquote-splicing
                                                ((top)
                                                 #4(ribcage
                                                    #2(p q)
                                                    #2((top) (top))
                                                    #2("i" "i"))
                                                 #4(ribcage ())
                                                 #4(ribcage
                                                    #2(p lev)
                                                    #2((top) (top))
                                                    #2("i" "i"))
                                                 #4(ribcage
                                                    #9(isquote?
                                                       islist?
                                                       iscons?
                                                       quote-nil?
                                                       quasilist*
                                                       quasicons
                                                       quasiappend
                                                       quasivector
                                                       quasi)
                                                    #9((top)
                                                       (top)
                                                       (top)
                                                       (top)
                                                       (top)
                                                       (top)
                                                       (top)
                                                       (top)
                                                       (top))
                                                    #9("i"
                                                       "i"
                                                       "i"
                                                       "i"
                                                       "i"
                                                       "i"
                                                       "i"
                                                       "i"
                                                       "i"))
                                                 #4(ribcage
                                                    ((import-token . *top*))
                                                    ()
                                                    ())))
                                            (%_2138 %_2238 (- %_2225 '1)))
                                          (%_2138 %_2239 %_2225))))
                                    %_2229)
                             ((lambda (%_2230)
                                (if %_2230
                                  (apply (lambda (%_2237)
                                           (%_2135
                                             '#3(syntax-object
                                                 'quasiquote
                                                 ((top)
                                                  #4(ribcage
                                                     #1(p)
                                                     #1((top))
                                                     #1("i"))
                                                  #4(ribcage ())
                                                  #4(ribcage
                                                     #2(p lev)
                                                     #2((top) (top))
                                                     #2("i" "i"))
                                                  #4(ribcage
                                                     #9(isquote?
                                                        islist?
                                                        iscons?
                                                        quote-nil?
                                                        quasilist*
                                                        quasicons
                                                        quasiappend
                                                        quasivector
                                                        quasi)
                                                     #9((top)
                                                        (top)
                                                        (top)
                                                        (top)
                                                        (top)
                                                        (top)
                                                        (top)
                                                        (top)
                                                        (top))
                                                     #9("i"
                                                        "i"
                                                        "i"
                                                        "i"
                                                        "i"
                                                        "i"
                                                        "i"
                                                        "i"
                                                        "i"))
                                                  #4(ribcage
                                                     ((import-token . *top*))
                                                     ()
                                                     ())))
                                             (%_2138
                                               (list %_2237)
                                               (+ %_2225 '1))))
                                         %_2230)
                                  ((lambda (%_2231)
                                     (if %_2231
                                       (apply (lambda (%_2235 %_2236)
                                                (%_2135
                                                  (%_2138 %_2235 %_2225)
                                                  (%_2138 %_2236 %_2225)))
                                              %_2231)
                                       ((lambda (%_2232)
                                          (if %_2232
                                            (apply (lambda (%_2234)
                                                     (%_2137
                                                       (%_2138 %_2234 %_2225)))
                                                   %_2232)
                                            ((lambda (%_2233)
                                               (list '#3(syntax-object
                                                         quote
                                                         ((top)
                                                          #4(ribcage
                                                             #1(p)
                                                             #1((top))
                                                             #1("i"))
                                                          #4(ribcage ())
                                                          #4(ribcage
                                                             #2(p lev)
                                                             #2((top) (top))
                                                             #2("i" "i"))
                                                          #4(ribcage
                                                             #9(isquote?
                                                                islist?
                                                                iscons?
                                                                quote-nil?
                                                                quasilist*
                                                                quasicons
                                                                quasiappend
                                                                quasivector
                                                                quasi)
                                                             #9((top)
                                                                (top)
                                                                (top)
                                                                (top)
                                                                (top)
                                                                (top)
                                                                (top)
                                                                (top)
                                                                (top))
                                                             #9("i"
                                                                "i"
                                                                "i"
                                                                "i"
                                                                "i"
                                                                "i"
                                                                "i"
                                                                "i"
                                                                "i"))
                                                          #4(ribcage
                                                             ((import-token
                                                                .
                                                                *top*))
                                                             ()
                                                             ())))
                                                     %_2233))
                                             %_2226)))
                                        ($syntax-dispatch
                                          %_2226
                                          '#2(vector each-any)))))
                                   ($syntax-dispatch %_2226 '(any . any)))))
                              ($syntax-dispatch
                                %_2226
                                '(#2(free-id
                                     #3(syntax-object
                                        quasiquote
                                        ((top)
                                         #4(ribcage ())
                                         #4(ribcage
                                            #2(p lev)
                                            #2((top) (top))
                                            #2("i" "i"))
                                         #4(ribcage
                                            #9(isquote?
                                               islist?
                                               iscons?
                                               quote-nil?
                                               quasilist*
                                               quasicons
                                               quasiappend
                                               quasivector
                                               quasi)
                                            #9((top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top)
                                               (top))
                                            #9("i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"))
                                         #4(ribcage
                                            ((import-token . *top*))
                                            ()
                                            ()))))
                                  any)))))
                         ($syntax-dispatch
                           %_2226
                           '((#2(free-id
                                 #3(syntax-object
                                    unquote-splicing
                                    ((top)
                                     #4(ribcage ())
                                     #4(ribcage
                                        #2(p lev)
                                        #2((top) (top))
                                        #2("i" "i"))
                                     #4(ribcage
                                        #9(isquote?
                                           islist?
                                           iscons?
                                           quote-nil?
                                           quasilist*
                                           quasicons
                                           quasiappend
                                           quasivector
                                           quasi)
                                        #9((top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top)
                                           (top))
                                        #9("i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"))
                                     #4(ribcage ((import-token . *top*)) ()))))
                              .
                              each-any)
                             .
                             any)))))
                    ($syntax-dispatch
                      %_2226
                      '((#2(free-id
                            #3(syntax-object
                               unquote
                               ((top)
                                #4(ribcage ())
                                #4(ribcage
                                   #2(p lev)
                                   #2((top) (top))
                                   #2("i" "i"))
                                #4(ribcage
                                   #9(isquote?
                                      islist?
                                      iscons?
                                      quote-nil?
                                      quasilist*
                                      quasicons
                                      quasiappend
                                      quasivector
                                      quasi)
                                   #9((top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top))
                                   #9("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                                #4(ribcage ((import-token . *top*)) ()))))
                         .
                         each-any)
                        .
                        any)))))
               ($syntax-dispatch
                 %_2226
                 '(#2(free-id
                      #3(syntax-object
                         unquote
                         ((top)
                          #4(ribcage ())
                          #4(ribcage #2(p lev) #2((top) (top)) #2("i" "i"))
                          #4(ribcage
                             #9(isquote?
                                islist?
                                iscons?
                                quote-nil?
                                quasilist*
                                quasicons
                                quasiappend
                                quasivector
                                quasi)
                             #9((top)
                                (top)
                                (top)
                                (top)
                                (top)
                                (top)
                                (top)
                                (top)
                                (top))
                             #9("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                          #4(ribcage ((import-token . *top*)) ()))))
                   any))))
            %_2224)))
       (lambda (%_2139)
         ((lambda (%_2140)
            ((lambda (%_2141)
               (if %_2141
                 (apply (lambda (%_2142 %_2143) (%_2138 %_2143 '0))
                        %_2141)
                 (syntax-error %_2140)))
             ($syntax-dispatch %_2140 '(any any))))
          %_2139))))
   #f
   #f
   #f
   #f
   #f
   #f
   #f
   #f
   #f))
($sc-put-cte
  'include
  (lambda (%_2243)
    ((lambda (%_2244)
       (begin
         (set! %_2244
           (lambda (%_2253 %_2254)
             ((lambda (%_2255)
                (((lambda (%_2256)
                    (begin
                      (set! %_2256
                        (lambda ()
                          ((lambda (%_2257)
                             (if (eof-object? %_2257)
                               (begin (close-input-port %_2255) '())
                               (cons (datum->syntax-object %_2254 %_2257)
                                     (%_2256))))
                           (read %_2255))))
                      %_2256))
                  #f)))
              (open-input-file %_2253))))
         ((lambda (%_2245)
            ((lambda (%_2246)
               (if %_2246
                 (apply (lambda (%_2247 %_2248)
                          ((lambda (%_2249)
                             ((lambda (%_2250)
                                ((lambda (%_2251)
                                   (if %_2251
                                     (apply (lambda (%_2252)
                                              (cons '#3(syntax-object
                                                        begin
                                                        ((top)
                                                         #4(ribcage
                                                            #1(exp)
                                                            #1((top))
                                                            #1("i"))
                                                         #4(ribcage ())
                                                         #4(ribcage ())
                                                         #4(ribcage
                                                            #1(fn)
                                                            #1((top))
                                                            #1("i"))
                                                         #4(ribcage
                                                            #2(k filename)
                                                            #2((top) (top))
                                                            #2("i" "i"))
                                                         #4(ribcage
                                                            (read-file)
                                                            ((top))
                                                            ("i"))
                                                         #4(ribcage
                                                            #1(x)
                                                            #1((top))
                                                            #1("i"))
                                                         #4(ribcage
                                                            ((import-token
                                                               .
                                                               *top*))
                                                            ()
                                                            ())))
                                                    %_2252))
                                            %_2251)
                                     (syntax-error %_2250)))
                                 ($syntax-dispatch %_2250 'each-any)))
                              (%_2244 %_2249 %_2247)))
                           (syntax-object->datum %_2248)))
                        %_2246)
                 (syntax-error %_2245)))
             ($syntax-dispatch %_2245 '(any any))))
          %_2243)))
     #f)))
($sc-put-cte
  'unquote
  (lambda (%_2258)
    ((lambda (%_2259)
       ((lambda (%_2260)
          (if %_2260
            (apply (lambda (%_2261 %_2262)
                     (syntax-error
                       %_2258
                       '"expression not valid outside of quasiquote"))
                   %_2260)
            (syntax-error %_2259)))
        ($syntax-dispatch %_2259 '(any . each-any))))
     %_2258)))
($sc-put-cte
  'unquote-splicing
  (lambda (%_2263)
    ((lambda (%_2264)
       ((lambda (%_2265)
          (if %_2265
            (apply (lambda (%_2266 %_2267)
                     (syntax-error
                       %_2263
                       '"expression not valid outside of quasiquote"))
                   %_2265)
            (syntax-error %_2264)))
        ($syntax-dispatch %_2264 '(any . each-any))))
     %_2263)))
($sc-put-cte
  'case
  (lambda (%_2268)
    ((lambda (%_2269)
       ((lambda (%_2270)
          (if %_2270
            (apply (lambda (%_2271 %_2272 %_2273 %_2274)
                     ((lambda (%_2275)
                        ((lambda (%_2276)
                           (list '#3(syntax-object
                                     let
                                     ((top)
                                      #4(ribcage #1(body) #1((top)) #1("i"))
                                      #4(ribcage
                                         #4(_ e m1 m2)
                                         #4((top) (top) (top) (top))
                                         #4("i" "i" "i" "i"))
                                      #4(ribcage ())
                                      #4(ribcage #1(x) #1((top)) #1("i"))
                                      #4(ribcage ((import-token . *top*)) ())))
                                 (list (list '#3(syntax-object
                                                 t
                                                 ((top)
                                                  #4(ribcage
                                                     #1(body)
                                                     #1((top))
                                                     #1("i"))
                                                  #4(ribcage
                                                     #4(_ e m1 m2)
                                                     #4((top)
                                                        (top)
                                                        (top)
                                                        (top))
                                                     #4("i" "i" "i" "i"))
                                                  #4(ribcage ())
                                                  #4(ribcage
                                                     #1(x)
                                                     #1((top))
                                                     #1("i"))
                                                  #4(ribcage
                                                     ((import-token . *top*))
                                                     ()
                                                     ())))
                                             %_2272))
                                 %_2276))
                         %_2275))
                      (((lambda (%_2277)
                          (begin
                            (set! %_2277
                              (lambda (%_2278 %_2279)
                                (if (null? %_2279)
                                  ((lambda (%_2288)
                                     ((lambda (%_2289)
                                        (if %_2289
                                          (apply (lambda (%_2295 %_2296)
                                                   (cons '#3(syntax-object
                                                             begin
                                                             ((top)
                                                              #4(ribcage
                                                                 #2(e1 e2)
                                                                 #2((top)
                                                                    (top))
                                                                 #2("i" "i"))
                                                              #4(ribcage ())
                                                              #4(ribcage
                                                                 #2(clause
                                                                    clauses)
                                                                 #2((top)
                                                                    (top))
                                                                 #2("i" "i"))
                                                              #4(ribcage
                                                                 #1(f)
                                                                 #1((top))
                                                                 #1("i"))
                                                              #4(ribcage
                                                                 #4(_ e m1 m2)
                                                                 #4((top)
                                                                    (top)
                                                                    (top)
                                                                    (top))
                                                                 #4("i"
                                                                    "i"
                                                                    "i"
                                                                    "i"))
                                                              #4(ribcage ())
                                                              #4(ribcage
                                                                 #1(x)
                                                                 #1((top))
                                                                 #1("i"))
                                                              #4(ribcage
                                                                 ((import-token
                                                                    .
                                                                    *top*))
                                                                 ()
                                                                 ())))
                                                         (cons %_2295 %_2296)))
                                                 %_2289)
                                          ((lambda (%_2290)
                                             (if %_2290
                                               (apply (lambda (%_2292
                                                               %_2293
                                                               %_2294)
                                                        (list '#3(syntax-object
                                                                  if
                                                                  ((top)
                                                                   #4(ribcage
                                                                      #3(k
                                                                         e1
                                                                         e2)
                                                                      #3((top)
                                                                         (top)
                                                                         (top))
                                                                      #3("i"
                                                                         "i"
                                                                         "i"))
                                                                   #4(ribcage
                                                                      ()
                                                                      ()
                                                                      ())
                                                                   #4(ribcage
                                                                      #2(clause
                                                                         clauses)
                                                                      #2((top)
                                                                         (top))
                                                                      #2("i"
                                                                         "i"))
                                                                   #4(ribcage
                                                                      #1(f)
                                                                      #1((top))
                                                                      #1("i"))
                                                                   #4(ribcage
                                                                      #4(_
                                                                         e
                                                                         m1
                                                                         m2)
                                                                      #4((top)
                                                                         (top)
                                                                         (top)
                                                                         (top))
                                                                      #4("i"
                                                                         "i"
                                                                         "i"
                                                                         "i"))
                                                                   #4(ribcage
                                                                      ()
                                                                      ()
                                                                      ())
                                                                   #4(ribcage
                                                                      #1(x)
                                                                      #1((top))
                                                                      #1("i"))
                                                                   #4(ribcage
                                                                      ((import-token
                                                                         .
                                                                         *top*))
                                                                      ()
                                                                      ())))
                                                              (list '#3(syntax-object
                                                                        memv
                                                                        ((top)
                                                                         #4(ribcage
                                                                            #3(k
                                                                               e1
                                                                               e2)
                                                                            #3((top)
                                                                               (top)
                                                                               (top))
                                                                            #3("i"
                                                                               "i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #2(clause
                                                                               clauses)
                                                                            #2((top)
                                                                               (top))
                                                                            #2("i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            #1(f)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            #4(_
                                                                               e
                                                                               m1
                                                                               m2)
                                                                            #4((top)
                                                                               (top)
                                                                               (top)
                                                                               (top))
                                                                            #4("i"
                                                                               "i"
                                                                               "i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #1(x)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            ((import-token
                                                                               .
                                                                               *top*))
                                                                            ()
                                                                            ())))
                                                                    '#3(syntax-object
                                                                        t
                                                                        ((top)
                                                                         #4(ribcage
                                                                            #3(k
                                                                               e1
                                                                               e2)
                                                                            #3((top)
                                                                               (top)
                                                                               (top))
                                                                            #3("i"
                                                                               "i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #2(clause
                                                                               clauses)
                                                                            #2((top)
                                                                               (top))
                                                                            #2("i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            #1(f)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            #4(_
                                                                               e
                                                                               m1
                                                                               m2)
                                                                            #4((top)
                                                                               (top)
                                                                               (top)
                                                                               (top))
                                                                            #4("i"
                                                                               "i"
                                                                               "i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #1(x)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            ((import-token
                                                                               .
                                                                               *top*))
                                                                            ()
                                                                            ())))
                                                                    (list '#3(syntax-object
                                                                              quote
                                                                              ((top)
                                                                               #4(ribcage
                                                                                  #3(k
                                                                                     e1
                                                                                     e2)
                                                                                  #3((top)
                                                                                     (top)
                                                                                     (top))
                                                                                  #3("i"
                                                                                     "i"
                                                                                     "i"))
                                                                               #4(ribcage
                                                                                  ()
                                                                                  ()
                                                                                  ())
                                                                               #4(ribcage
                                                                                  #2(clause
                                                                                     clauses)
                                                                                  #2((top)
                                                                                     (top))
                                                                                  #2("i"
                                                                                     "i"))
                                                                               #4(ribcage
                                                                                  #1(f)
                                                                                  #1((top))
                                                                                  #1("i"))
                                                                               #4(ribcage
                                                                                  #4(_
                                                                                     e
                                                                                     m1
                                                                                     m2)
                                                                                  #4((top)
                                                                                     (top)
                                                                                     (top)
                                                                                     (top))
                                                                                  #4("i"
                                                                                     "i"
                                                                                     "i"
                                                                                     "i"))
                                                                               #4(ribcage
                                                                                  ()
                                                                                  ()
                                                                                  ())
                                                                               #4(ribcage
                                                                                  #1(x)
                                                                                  #1((top))
                                                                                  #1("i"))
                                                                               #4(ribcage
                                                                                  ((import-token
                                                                                     .
                                                                                     *top*))
                                                                                  ()
                                                                                  ())))
                                                                          %_2292))
                                                              (cons '#3(syntax-object
                                                                        begin
                                                                        ((top)
                                                                         #4(ribcage
                                                                            #3(k
                                                                               e1
                                                                               e2)
                                                                            #3((top)
                                                                               (top)
                                                                               (top))
                                                                            #3("i"
                                                                               "i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #2(clause
                                                                               clauses)
                                                                            #2((top)
                                                                               (top))
                                                                            #2("i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            #1(f)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            #4(_
                                                                               e
                                                                               m1
                                                                               m2)
                                                                            #4((top)
                                                                               (top)
                                                                               (top)
                                                                               (top))
                                                                            #4("i"
                                                                               "i"
                                                                               "i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #1(x)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            ((import-token
                                                                               .
                                                                               *top*))
                                                                            ()
                                                                            ())))
                                                                    (cons %_2293
                                                                          %_2294))))
                                                      %_2290)
                                               ((lambda (%_2291)
                                                  (syntax-error %_2268))
                                                %_2288)))
                                           ($syntax-dispatch
                                             %_2288
                                             '(each-any any . each-any)))))
                                      ($syntax-dispatch
                                        %_2288
                                        '(#2(free-id
                                             #3(syntax-object
                                                else
                                                ((top)
                                                 #4(ribcage ())
                                                 #4(ribcage
                                                    #2(clause clauses)
                                                    #2((top) (top))
                                                    #2("i" "i"))
                                                 #4(ribcage
                                                    #1(f)
                                                    #1((top))
                                                    #1("i"))
                                                 #4(ribcage
                                                    #4(_ e m1 m2)
                                                    #4((top) (top) (top) (top))
                                                    #4("i" "i" "i" "i"))
                                                 #4(ribcage ())
                                                 #4(ribcage
                                                    #1(x)
                                                    #1((top))
                                                    #1("i"))
                                                 #4(ribcage
                                                    ((import-token . *top*))
                                                    ()
                                                    ()))))
                                          any
                                          .
                                          each-any))))
                                   %_2278)
                                  ((lambda (%_2280)
                                     ((lambda (%_2281)
                                        ((lambda (%_2282)
                                           ((lambda (%_2283)
                                              (if %_2283
                                                (apply (lambda (%_2285
                                                                %_2286
                                                                %_2287)
                                                         (list '#3(syntax-object
                                                                   if
                                                                   ((top)
                                                                    #4(ribcage
                                                                       #3(k
                                                                          e1
                                                                          e2)
                                                                       #3((top)
                                                                          (top)
                                                                          (top))
                                                                       #3("i"
                                                                          "i"
                                                                          "i"))
                                                                    #4(ribcage
                                                                       #1(rest)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                    #4(ribcage
                                                                       #2(clause
                                                                          clauses)
                                                                       #2((top)
                                                                          (top))
                                                                       #2("i"
                                                                          "i"))
                                                                    #4(ribcage
                                                                       #1(f)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       #4(_
                                                                          e
                                                                          m1
                                                                          m2)
                                                                       #4((top)
                                                                          (top)
                                                                          (top)
                                                                          (top))
                                                                       #4("i"
                                                                          "i"
                                                                          "i"
                                                                          "i"))
                                                                    #4(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                    #4(ribcage
                                                                       #1(x)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       ((import-token
                                                                          .
                                                                          *top*))
                                                                       ()
                                                                       ())))
                                                               (list '#3(syntax-object
                                                                         memv
                                                                         ((top)
                                                                          #4(ribcage
                                                                             #3(k
                                                                                e1
                                                                                e2)
                                                                             #3((top)
                                                                                (top)
                                                                                (top))
                                                                             #3("i"
                                                                                "i"
                                                                                "i"))
                                                                          #4(ribcage
                                                                             #1(rest)
                                                                             #1((top))
                                                                             #1("i"))
                                                                          #4(ribcage
                                                                             ()
                                                                             ()
                                                                             ())
                                                                          #4(ribcage
                                                                             #2(clause
                                                                                clauses)
                                                                             #2((top)
                                                                                (top))
                                                                             #2("i"
                                                                                "i"))
                                                                          #4(ribcage
                                                                             #1(f)
                                                                             #1((top))
                                                                             #1("i"))
                                                                          #4(ribcage
                                                                             #4(_
                                                                                e
                                                                                m1
                                                                                m2)
                                                                             #4((top)
                                                                                (top)
                                                                                (top)
                                                                                (top))
                                                                             #4("i"
                                                                                "i"
                                                                                "i"
                                                                                "i"))
                                                                          #4(ribcage
                                                                             ()
                                                                             ()
                                                                             ())
                                                                          #4(ribcage
                                                                             #1(x)
                                                                             #1((top))
                                                                             #1("i"))
                                                                          #4(ribcage
                                                                             ((import-token
                                                                                .
                                                                                *top*))
                                                                             ()
                                                                             ())))
                                                                     '#3(syntax-object
                                                                         t
                                                                         ((top)
                                                                          #4(ribcage
                                                                             #3(k
                                                                                e1
                                                                                e2)
                                                                             #3((top)
                                                                                (top)
                                                                                (top))
                                                                             #3("i"
                                                                                "i"
                                                                                "i"))
                                                                          #4(ribcage
                                                                             #1(rest)
                                                                             #1((top))
                                                                             #1("i"))
                                                                          #4(ribcage
                                                                             ()
                                                                             ()
                                                                             ())
                                                                          #4(ribcage
                                                                             #2(clause
                                                                                clauses)
                                                                             #2((top)
                                                                                (top))
                                                                             #2("i"
                                                                                "i"))
                                                                          #4(ribcage
                                                                             #1(f)
                                                                             #1((top))
                                                                             #1("i"))
                                                                          #4(ribcage
                                                                             #4(_
                                                                                e
                                                                                m1
                                                                                m2)
                                                                             #4((top)
                                                                                (top)
                                                                                (top)
                                                                                (top))
                                                                             #4("i"
                                                                                "i"
                                                                                "i"
                                                                                "i"))
                                                                          #4(ribcage
                                                                             ()
                                                                             ()
                                                                             ())
                                                                          #4(ribcage
                                                                             #1(x)
                                                                             #1((top))
                                                                             #1("i"))
                                                                          #4(ribcage
                                                                             ((import-token
                                                                                .
                                                                                *top*))
                                                                             ()
                                                                             ())))
                                                                     (list '#3(syntax-object
                                                                               quote
                                                                               ((top)
                                                                                #4(ribcage
                                                                                   #3(k
                                                                                      e1
                                                                                      e2)
                                                                                   #3((top)
                                                                                      (top)
                                                                                      (top))
                                                                                   #3("i"
                                                                                      "i"
                                                                                      "i"))
                                                                                #4(ribcage
                                                                                   #1(rest)
                                                                                   #1((top))
                                                                                   #1("i"))
                                                                                #4(ribcage
                                                                                   ()
                                                                                   ()
                                                                                   ())
                                                                                #4(ribcage
                                                                                   #2(clause
                                                                                      clauses)
                                                                                   #2((top)
                                                                                      (top))
                                                                                   #2("i"
                                                                                      "i"))
                                                                                #4(ribcage
                                                                                   #1(f)
                                                                                   #1((top))
                                                                                   #1("i"))
                                                                                #4(ribcage
                                                                                   #4(_
                                                                                      e
                                                                                      m1
                                                                                      m2)
                                                                                   #4((top)
                                                                                      (top)
                                                                                      (top)
                                                                                      (top))
                                                                                   #4("i"
                                                                                      "i"
                                                                                      "i"
                                                                                      "i"))
                                                                                #4(ribcage
                                                                                   ()
                                                                                   ()
                                                                                   ())
                                                                                #4(ribcage
                                                                                   #1(x)
                                                                                   #1((top))
                                                                                   #1("i"))
                                                                                #4(ribcage
                                                                                   ((import-token
                                                                                      .
                                                                                      *top*))
                                                                                   ()
                                                                                   ())))
                                                                           %_2285))
                                                               (cons '#3(syntax-object
                                                                         begin
                                                                         ((top)
                                                                          #4(ribcage
                                                                             #3(k
                                                                                e1
                                                                                e2)
                                                                             #3((top)
                                                                                (top)
                                                                                (top))
                                                                             #3("i"
                                                                                "i"
                                                                                "i"))
                                                                          #4(ribcage
                                                                             #1(rest)
                                                                             #1((top))
                                                                             #1("i"))
                                                                          #4(ribcage
                                                                             ()
                                                                             ()
                                                                             ())
                                                                          #4(ribcage
                                                                             #2(clause
                                                                                clauses)
                                                                             #2((top)
                                                                                (top))
                                                                             #2("i"
                                                                                "i"))
                                                                          #4(ribcage
                                                                             #1(f)
                                                                             #1((top))
                                                                             #1("i"))
                                                                          #4(ribcage
                                                                             #4(_
                                                                                e
                                                                                m1
                                                                                m2)
                                                                             #4((top)
                                                                                (top)
                                                                                (top)
                                                                                (top))
                                                                             #4("i"
                                                                                "i"
                                                                                "i"
                                                                                "i"))
                                                                          #4(ribcage
                                                                             ()
                                                                             ()
                                                                             ())
                                                                          #4(ribcage
                                                                             #1(x)
                                                                             #1((top))
                                                                             #1("i"))
                                                                          #4(ribcage
                                                                             ((import-token
                                                                                .
                                                                                *top*))
                                                                             ()
                                                                             ())))
                                                                     (cons %_2286
                                                                           %_2287))
                                                               %_2281))
                                                       %_2283)
                                                ((lambda (%_2284)
                                                   (syntax-error %_2268))
                                                 %_2282)))
                                            ($syntax-dispatch
                                              %_2282
                                              '(each-any any . each-any))))
                                         %_2278))
                                      %_2280))
                                   (%_2277 (car %_2279) (cdr %_2279))))))
                            %_2277))
                        #f)
                       %_2273
                       %_2274)))
                   %_2270)
            (syntax-error %_2269)))
        ($syntax-dispatch
          %_2269
          '(any any any . each-any))))
     %_2268)))
($sc-put-cte
  'identifier-syntax
  (lambda (%_2297)
    ((lambda (%_2298)
       ((lambda (%_2299)
          (if %_2299
            (apply (lambda (%_2313 %_2314)
                     (list '#3(syntax-object
                               lambda
                               ((top)
                                #4(ribcage #2(_ e) #2((top) (top)) #2("i" "i"))
                                #4(ribcage ())
                                #4(ribcage #1(x) #1((top)) #1("i"))
                                #4(ribcage ((import-token . *top*)) ())))
                           '#3(syntax-object
                               (x)
                               ((top)
                                #4(ribcage #2(_ e) #2((top) (top)) #2("i" "i"))
                                #4(ribcage ())
                                #4(ribcage #1(x) #1((top)) #1("i"))
                                #4(ribcage ((import-token . *top*)) ())))
                           (list '#3(syntax-object
                                     syntax-case
                                     ((top)
                                      #4(ribcage
                                         #2(_ e)
                                         #2((top) (top))
                                         #2("i" "i"))
                                      #4(ribcage ())
                                      #4(ribcage #1(x) #1((top)) #1("i"))
                                      #4(ribcage ((import-token . *top*)) ())))
                                 '#3(syntax-object
                                     x
                                     ((top)
                                      #4(ribcage
                                         #2(_ e)
                                         #2((top) (top))
                                         #2("i" "i"))
                                      #4(ribcage ())
                                      #4(ribcage #1(x) #1((top)) #1("i"))
                                      #4(ribcage ((import-token . *top*)) ())))
                                 '()
                                 (list '#3(syntax-object
                                           id
                                           ((top)
                                            #4(ribcage
                                               #2(_ e)
                                               #2((top) (top))
                                               #2("i" "i"))
                                            #4(ribcage ())
                                            #4(ribcage #1(x) #1((top)) #1("i"))
                                            #4(ribcage
                                               ((import-token . *top*))
                                               ()
                                               ())))
                                       '#3(syntax-object
                                           (identifier? (syntax id))
                                           ((top)
                                            #4(ribcage
                                               #2(_ e)
                                               #2((top) (top))
                                               #2("i" "i"))
                                            #4(ribcage ())
                                            #4(ribcage #1(x) #1((top)) #1("i"))
                                            #4(ribcage
                                               ((import-token . *top*))
                                               ()
                                               ())))
                                       (list '#3(syntax-object
                                                 syntax
                                                 ((top)
                                                  #4(ribcage
                                                     #2(_ e)
                                                     #2((top) (top))
                                                     #2("i" "i"))
                                                  #4(ribcage ())
                                                  #4(ribcage
                                                     #1(x)
                                                     #1((top))
                                                     #1("i"))
                                                  #4(ribcage
                                                     ((import-token . *top*))
                                                     ()
                                                     ())))
                                             %_2314))
                                 (list (cons %_2313
                                             '(#3(syntax-object
                                                  x
                                                  ((top)
                                                   #4(ribcage
                                                      #2(_ e)
                                                      #2((top) (top))
                                                      #2("i" "i"))
                                                   #4(ribcage ())
                                                   #4(ribcage
                                                      #1(x)
                                                      #1((top))
                                                      #1("i"))
                                                   #4(ribcage
                                                      ((import-token . *top*))
                                                      ()
                                                      ())))
                                               #3(syntax-object
                                                  ...
                                                  ((top)
                                                   #4(ribcage
                                                      #2(_ e)
                                                      #2((top) (top))
                                                      #2("i" "i"))
                                                   #4(ribcage ())
                                                   #4(ribcage
                                                      #1(x)
                                                      #1((top))
                                                      #1("i"))
                                                   #4(ribcage
                                                      ((import-token . *top*))
                                                      ()
                                                      ())))))
                                       (list '#3(syntax-object
                                                 syntax
                                                 ((top)
                                                  #4(ribcage
                                                     #2(_ e)
                                                     #2((top) (top))
                                                     #2("i" "i"))
                                                  #4(ribcage ())
                                                  #4(ribcage
                                                     #1(x)
                                                     #1((top))
                                                     #1("i"))
                                                  #4(ribcage
                                                     ((import-token . *top*))
                                                     ()
                                                     ())))
                                             (cons %_2314
                                                   '(#3(syntax-object
                                                        x
                                                        ((top)
                                                         #4(ribcage
                                                            #2(_ e)
                                                            #2((top) (top))
                                                            #2("i" "i"))
                                                         #4(ribcage ())
                                                         #4(ribcage
                                                            #1(x)
                                                            #1((top))
                                                            #1("i"))
                                                         #4(ribcage
                                                            ((import-token
                                                               .
                                                               *top*))
                                                            ()
                                                            ())))
                                                     #3(syntax-object
                                                        ...
                                                        ((top)
                                                         #4(ribcage
                                                            #2(_ e)
                                                            #2((top) (top))
                                                            #2("i" "i"))
                                                         #4(ribcage ())
                                                         #4(ribcage
                                                            #1(x)
                                                            #1((top))
                                                            #1("i"))
                                                         #4(ribcage
                                                            ((import-token
                                                               .
                                                               *top*))
                                                            ()
                                                            ()))))))))))
                   %_2299)
            ((lambda (%_2300)
               (if (if %_2300
                     (apply (lambda (%_2307 %_2308 %_2309 %_2310 %_2311 %_2312)
                              (if (identifier? %_2308)
                                (identifier? %_2310)
                                '#f))
                            %_2300)
                     '#f)
                 (apply (lambda (%_2301 %_2302 %_2303 %_2304 %_2305 %_2306)
                          (list '#3(syntax-object
                                    cons
                                    ((top)
                                     #4(ribcage
                                        #6(_ id exp1 var val exp2)
                                        #6((top) (top) (top) (top) (top) (top))
                                        #6("i" "i" "i" "i" "i" "i"))
                                     #4(ribcage ())
                                     #4(ribcage #1(x) #1((top)) #1("i"))
                                     #4(ribcage ((import-token . *top*)) ())))
                                '#3(syntax-object
                                    'macro!
                                    ((top)
                                     #4(ribcage
                                        #6(_ id exp1 var val exp2)
                                        #6((top) (top) (top) (top) (top) (top))
                                        #6("i" "i" "i" "i" "i" "i"))
                                     #4(ribcage ())
                                     #4(ribcage #1(x) #1((top)) #1("i"))
                                     #4(ribcage ((import-token . *top*)) ())))
                                (list '#3(syntax-object
                                          lambda
                                          ((top)
                                           #4(ribcage
                                              #6(_ id exp1 var val exp2)
                                              #6((top)
                                                 (top)
                                                 (top)
                                                 (top)
                                                 (top)
                                                 (top))
                                              #6("i" "i" "i" "i" "i" "i"))
                                           #4(ribcage ())
                                           #4(ribcage #1(x) #1((top)) #1("i"))
                                           #4(ribcage
                                              ((import-token . *top*))
                                              ()
                                              ())))
                                      '#3(syntax-object
                                          (x)
                                          ((top)
                                           #4(ribcage
                                              #6(_ id exp1 var val exp2)
                                              #6((top)
                                                 (top)
                                                 (top)
                                                 (top)
                                                 (top)
                                                 (top))
                                              #6("i" "i" "i" "i" "i" "i"))
                                           #4(ribcage ())
                                           #4(ribcage #1(x) #1((top)) #1("i"))
                                           #4(ribcage
                                              ((import-token . *top*))
                                              ()
                                              ())))
                                      (list '#3(syntax-object
                                                syntax-case
                                                ((top)
                                                 #4(ribcage
                                                    #6(_ id exp1 var val exp2)
                                                    #6((top)
                                                       (top)
                                                       (top)
                                                       (top)
                                                       (top)
                                                       (top))
                                                    #6("i"
                                                       "i"
                                                       "i"
                                                       "i"
                                                       "i"
                                                       "i"))
                                                 #4(ribcage ())
                                                 #4(ribcage
                                                    #1(x)
                                                    #1((top))
                                                    #1("i"))
                                                 #4(ribcage
                                                    ((import-token . *top*))
                                                    ()
                                                    ())))
                                            '#3(syntax-object
                                                x
                                                ((top)
                                                 #4(ribcage
                                                    #6(_ id exp1 var val exp2)
                                                    #6((top)
                                                       (top)
                                                       (top)
                                                       (top)
                                                       (top)
                                                       (top))
                                                    #6("i"
                                                       "i"
                                                       "i"
                                                       "i"
                                                       "i"
                                                       "i"))
                                                 #4(ribcage ())
                                                 #4(ribcage
                                                    #1(x)
                                                    #1((top))
                                                    #1("i"))
                                                 #4(ribcage
                                                    ((import-token . *top*))
                                                    ()
                                                    ())))
                                            '#3(syntax-object
                                                (set!)
                                                ((top)
                                                 #4(ribcage
                                                    #6(_ id exp1 var val exp2)
                                                    #6((top)
                                                       (top)
                                                       (top)
                                                       (top)
                                                       (top)
                                                       (top))
                                                    #6("i"
                                                       "i"
                                                       "i"
                                                       "i"
                                                       "i"
                                                       "i"))
                                                 #4(ribcage ())
                                                 #4(ribcage
                                                    #1(x)
                                                    #1((top))
                                                    #1("i"))
                                                 #4(ribcage
                                                    ((import-token . *top*))
                                                    ()
                                                    ())))
                                            (list (list '#3(syntax-object
                                                            set!
                                                            ((top)
                                                             #4(ribcage
                                                                #6(_
                                                                   id
                                                                   exp1
                                                                   var
                                                                   val
                                                                   exp2)
                                                                #6((top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top))
                                                                #6("i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"))
                                                             #4(ribcage ())
                                                             #4(ribcage
                                                                #1(x)
                                                                #1((top))
                                                                #1("i"))
                                                             #4(ribcage
                                                                ((import-token
                                                                   .
                                                                   *top*))
                                                                ()
                                                                ())))
                                                        %_2304
                                                        %_2305)
                                                  (list '#3(syntax-object
                                                            syntax
                                                            ((top)
                                                             #4(ribcage
                                                                #6(_
                                                                   id
                                                                   exp1
                                                                   var
                                                                   val
                                                                   exp2)
                                                                #6((top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top))
                                                                #6("i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"))
                                                             #4(ribcage ())
                                                             #4(ribcage
                                                                #1(x)
                                                                #1((top))
                                                                #1("i"))
                                                             #4(ribcage
                                                                ((import-token
                                                                   .
                                                                   *top*))
                                                                ()
                                                                ())))
                                                        %_2306))
                                            (list (cons %_2302
                                                        '(#3(syntax-object
                                                             x
                                                             ((top)
                                                              #4(ribcage
                                                                 #6(_
                                                                    id
                                                                    exp1
                                                                    var
                                                                    val
                                                                    exp2)
                                                                 #6((top)
                                                                    (top)
                                                                    (top)
                                                                    (top)
                                                                    (top)
                                                                    (top))
                                                                 #6("i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"))
                                                              #4(ribcage ())
                                                              #4(ribcage
                                                                 #1(x)
                                                                 #1((top))
                                                                 #1("i"))
                                                              #4(ribcage
                                                                 ((import-token
                                                                    .
                                                                    *top*))
                                                                 ()
                                                                 ())))
                                                          #3(syntax-object
                                                             ...
                                                             ((top)
                                                              #4(ribcage
                                                                 #6(_
                                                                    id
                                                                    exp1
                                                                    var
                                                                    val
                                                                    exp2)
                                                                 #6((top)
                                                                    (top)
                                                                    (top)
                                                                    (top)
                                                                    (top)
                                                                    (top))
                                                                 #6("i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"))
                                                              #4(ribcage ())
                                                              #4(ribcage
                                                                 #1(x)
                                                                 #1((top))
                                                                 #1("i"))
                                                              #4(ribcage
                                                                 ((import-token
                                                                    .
                                                                    *top*))
                                                                 ()
                                                                 ())))))
                                                  (list '#3(syntax-object
                                                            syntax
                                                            ((top)
                                                             #4(ribcage
                                                                #6(_
                                                                   id
                                                                   exp1
                                                                   var
                                                                   val
                                                                   exp2)
                                                                #6((top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top))
                                                                #6("i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"))
                                                             #4(ribcage ())
                                                             #4(ribcage
                                                                #1(x)
                                                                #1((top))
                                                                #1("i"))
                                                             #4(ribcage
                                                                ((import-token
                                                                   .
                                                                   *top*))
                                                                ()
                                                                ())))
                                                        (cons %_2303
                                                              '(#3(syntax-object
                                                                   x
                                                                   ((top)
                                                                    #4(ribcage
                                                                       #6(_
                                                                          id
                                                                          exp1
                                                                          var
                                                                          val
                                                                          exp2)
                                                                       #6((top)
                                                                          (top)
                                                                          (top)
                                                                          (top)
                                                                          (top)
                                                                          (top))
                                                                       #6("i"
                                                                          "i"
                                                                          "i"
                                                                          "i"
                                                                          "i"
                                                                          "i"))
                                                                    #4(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                    #4(ribcage
                                                                       #1(x)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       ((import-token
                                                                          .
                                                                          *top*))
                                                                       ()
                                                                       ())))
                                                                #3(syntax-object
                                                                   ...
                                                                   ((top)
                                                                    #4(ribcage
                                                                       #6(_
                                                                          id
                                                                          exp1
                                                                          var
                                                                          val
                                                                          exp2)
                                                                       #6((top)
                                                                          (top)
                                                                          (top)
                                                                          (top)
                                                                          (top)
                                                                          (top))
                                                                       #6("i"
                                                                          "i"
                                                                          "i"
                                                                          "i"
                                                                          "i"
                                                                          "i"))
                                                                    #4(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                    #4(ribcage
                                                                       #1(x)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       ((import-token
                                                                          .
                                                                          *top*))
                                                                       ()
                                                                       ())))))))
                                            (list %_2302
                                                  (list '#3(syntax-object
                                                            identifier?
                                                            ((top)
                                                             #4(ribcage
                                                                #6(_
                                                                   id
                                                                   exp1
                                                                   var
                                                                   val
                                                                   exp2)
                                                                #6((top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top))
                                                                #6("i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"))
                                                             #4(ribcage ())
                                                             #4(ribcage
                                                                #1(x)
                                                                #1((top))
                                                                #1("i"))
                                                             #4(ribcage
                                                                ((import-token
                                                                   .
                                                                   *top*))
                                                                ()
                                                                ())))
                                                        (list '#3(syntax-object
                                                                  syntax
                                                                  ((top)
                                                                   #4(ribcage
                                                                      #6(_
                                                                         id
                                                                         exp1
                                                                         var
                                                                         val
                                                                         exp2)
                                                                      #6((top)
                                                                         (top)
                                                                         (top)
                                                                         (top)
                                                                         (top)
                                                                         (top))
                                                                      #6("i"
                                                                         "i"
                                                                         "i"
                                                                         "i"
                                                                         "i"
                                                                         "i"))
                                                                   #4(ribcage
                                                                      ()
                                                                      ()
                                                                      ())
                                                                   #4(ribcage
                                                                      #1(x)
                                                                      #1((top))
                                                                      #1("i"))
                                                                   #4(ribcage
                                                                      ((import-token
                                                                         .
                                                                         *top*))
                                                                      ()
                                                                      ())))
                                                              %_2302))
                                                  (list '#3(syntax-object
                                                            syntax
                                                            ((top)
                                                             #4(ribcage
                                                                #6(_
                                                                   id
                                                                   exp1
                                                                   var
                                                                   val
                                                                   exp2)
                                                                #6((top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top)
                                                                   (top))
                                                                #6("i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"))
                                                             #4(ribcage ())
                                                             #4(ribcage
                                                                #1(x)
                                                                #1((top))
                                                                #1("i"))
                                                             #4(ribcage
                                                                ((import-token
                                                                   .
                                                                   *top*))
                                                                ()
                                                                ())))
                                                        %_2303))))))
                        %_2300)
                 (syntax-error %_2298)))
             ($syntax-dispatch
               %_2298
               '(any (any any)
                     ((#2(free-id
                          #3(syntax-object
                             set!
                             ((top)
                              #4(ribcage ())
                              #4(ribcage #1(x) #1((top)) #1("i"))
                              #4(ribcage ((import-token . *top*)) ()))))
                       any
                       any)
                      any))))))
        ($syntax-dispatch %_2298 '(any any))))
     %_2297)))
