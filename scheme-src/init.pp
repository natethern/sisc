(define for-each
  (lambda (%_926 . %_925)
    (if (null? %_925)
      (error 'for-each
             '"invalid number of arguments to procedure for-each.")
      (if (not (null? (car %_925)))
        (begin
          (apply %_926 (map car %_925))
          (apply for-each (cons %_926 (map cdr %_925))))
        (void)))))
(define eof-object?
  (lambda (%_927) (eq? %_927 '#!eof)))
(define not (lambda (%_928) (if %_928 '#f '#t)))
(define eqv? eq?)
(define newline
  (lambda %_929
    (apply display (cons '#\newline %_929))))
(define map (void))
((lambda (%_930)
   (begin
     (set! %_930
       ((lambda (%_931)
          (begin
            (set! %_931
              (lambda (%_935 %_936 %_937 %_938)
                (if (null? %_938)
                  %_936
                  (begin
                    (set-cdr! %_937 (cons (%_935 (car %_938)) '()))
                    (%_931 %_935 %_936 (cdr %_937) (cdr %_938))))))
            (lambda (%_932 %_933)
              (if (null? %_933)
                '()
                ((lambda (%_934)
                   (%_931 %_932 %_934 %_934 (cdr %_933)))
                 (cons (%_932 (car %_933)) '()))))))
        #f))
     (set! map %_930)))
 #f)
(define compose
  (lambda %_939
    (if (null? %_939)
      (lambda (%_943) %_943)
      ((lambda (%_940 %_941)
         (lambda (%_942) (%_940 (%_941 %_942))))
       (car %_939)
       (apply compose (cdr %_939))))))
(define compose2
  (lambda (%_944 %_945)
    (lambda (%_946) (%_944 (%_945 %_946)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
((lambda (%_947 %_948)
   (begin
     (set! %_947
       (lambda (%_961 %_962 %_963)
         (if (null? %_963)
           '#f
           (if (%_961 (caar %_963) %_962)
             (car %_963)
             (%_947 %_961 %_962 (cdr %_963))))))
     (set! %_948
       (lambda (%_964 %_965 %_966)
         (if (null? %_966)
           '#f
           (if (%_964 (car %_966) %_965)
             %_966
             (%_948 %_964 %_965 (cdr %_966))))))
     (begin
       (set! assq
         (lambda (%_949 %_950) (%_947 eq? %_949 %_950)))
       (set! assv
         (lambda (%_951 %_952) (%_947 eqv? %_951 %_952)))
       (set! assoc
         (lambda (%_953 %_954) (%_947 equal? %_953 %_954)))
       (set! memq
         (lambda (%_955 %_956) (%_948 eq? %_955 %_956)))
       (set! memv
         (lambda (%_957 %_958) (%_948 eqv? %_957 %_958)))
       (set! member
         (lambda (%_959 %_960) (%_948 equal? %_959 %_960))))))
 #f
 #f)
(define cadr (compose2 car cdr))
(define cdar (compose2 cdr car))
(define cddr (compose2 cdr cdr))
(define caar (compose2 car car))
(define caaar (compose2 car caar))
(define caadr (compose2 car cadr))
(define cadar (compose2 car cdar))
(define caddr (compose2 car cddr))
(define cdaar (compose2 cdr caar))
(define cdadr (compose2 cdr cadr))
(define cddar (compose2 cdr cdar))
(define cdddr (compose2 cdr cddr))
(define caaaar (compose2 car caaar))
(define caaadr (compose2 car caadr))
(define caadar (compose2 car cadar))
(define caaddr (compose2 car caddr))
(define cadaar (compose2 car cdaar))
(define cadadr (compose2 car cdadr))
(define caddar (compose2 car cddar))
(define cadddr (compose2 car cdddr))
(define cdaaar (compose2 cdr caaar))
(define cdaadr (compose2 cdr caadr))
(define cdadar (compose2 cdr cadar))
(define cdaddr (compose2 cdr caddr))
(define cddaar (compose2 cdr cdaar))
(define cddadr (compose2 cdr cdadr))
(define cdddar (compose2 cdr cddar))
(define cddddr (compose2 cdr cdddr))
(define append2
  (lambda (%_967 %_968)
    (if (null? %_967)
      %_968
      (cons (car %_967) (append2 (cdr %_967) %_968)))))
(define append append2)
(define list->string
  (lambda (%_969)
    ((lambda (%_970)
       (begin
         (set! %_970
           (lambda (%_971 %_972 %_973)
             (if (null? %_971)
               %_972
               (begin
                 (string-set! %_972 %_973 (car %_971))
                 (%_970 (cdr %_971) %_972 (+ %_973 '1))))))
         (%_970 %_969 (make-string (length %_969)) '0)))
     #f)))
(define string->list
  ((lambda (%_974)
     (begin
       (set! %_974
         (lambda (%_976 %_977 %_978)
           (if (< %_978 '0)
             %_977
             (%_974 %_976
                    (cons (string-ref %_976 %_978) %_977)
                    (- %_978 '1)))))
       (lambda (%_975)
         (%_974 %_975 '() (- (string-length %_975) '1)))))
   #f))
(define list->vector
  ((lambda (%_979)
     (begin
       (set! %_979
         (lambda (%_981 %_982 %_983)
           (if (null? %_981)
             %_982
             (begin
               (vector-set! %_982 %_983 (car %_981))
               (%_979 (cdr %_981) %_982 (+ %_983 '1))))))
       (lambda (%_980)
         (if (proper-list? %_980)
           (%_979 %_980 (make-vector (length %_980)) '0)
           (error 'list->vector
                  '"can only convert a proper list."
                  %_980)))))
   #f))
(define vector
  (lambda %_984 (list->vector %_984)))
(define string
  (lambda %_985 (list->string %_985)))
(define detect-os
  (lambda ()
    ((lambda (%_986)
       (if (> (string-length %_986) '3)
         (if (equal? (substring %_986 '0 '3) '"mac")
           'macos
           (if (equal? (substring %_986 '0 '3) '"win")
             'ms-dos
             (if (equal? (substring %_986 '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring %_986 '0 '3) '"uni")
                 'unix
                 (if (equal? (substring %_986 '0 '3) '"lin")
                   'unix
                   (if (equal? (substring %_986 '0 '4) '"os/")
                     'os2
                     (if (equal? (substring %_986 '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase
       (getprop 'os.name '*environment-variables*)))))
(define current-url (make-parameter '"file:."))
(define current-directory
  (lambda %_987
    (if (null? %_987)
      (normalize-url (current-url) '".")
      (current-url
        (normalize-url (current-url) (car %_987))))))
((lambda (%_988)
   (begin
     (set! open-input-file (%_988 open-input-file))
     (set! open-source-input-file
       (%_988 open-source-input-file))
     (set! open-output-file (%_988 open-output-file))
     (set! load
       ((lambda (%_989)
          (lambda (%_990)
            (begin
              ((lambda (%_991)
                 (begin
                   (current-url (normalize-url %_991 %_990))
                   (call-with-failure-continuation
                     (lambda () (%_989 (current-url)))
                     (lambda (%_992 %_993 %_994)
                       (begin (current-url %_991) (%_994 %_992 %_993))))
                   (current-url %_991)))
               (current-url))
              (void))))
        load))))
 (lambda (%_995)
   (lambda (%_997 . %_996)
     (apply %_995
            (normalize-url (current-url) %_997)
            %_996))))
(define load-module
  (lambda (%_998)
    ((lambda (%_999)
       ((lambda (%_1000)
          ((lambda ()
             (for-each
               (lambda (%_1001)
                 (putprop
                   %_1001
                   '*toplevel*
                   (native-library-binding %_999 %_1001)))
               %_1000))))
        (native-library-binding-names %_999)))
     (load-native-library %_998))))
(define reverse
  ((lambda (%_1002)
     (begin
       (set! %_1002
         (lambda (%_1004 %_1005)
           (if (null? %_1004)
             %_1005
             (%_1002 (cdr %_1004) (cons (car %_1004) %_1005)))))
       (lambda (%_1003) (%_1002 %_1003 '()))))
   #f))
(define remove
  (lambda (%_1006 %_1007)
    (if (null? %_1007)
      '()
      (if (equal? (car %_1007) %_1006)
        (remove %_1006 (cdr %_1007))
        (cons (car %_1007) (remove %_1006 (cdr %_1007)))))))
(define append
  ((lambda (%_1008)
     (begin
       (set! %_1008
         (lambda (%_1011 . %_1010)
           (if (null? %_1010)
             %_1011
             (if (null? %_1011)
               (apply %_1008 %_1010)
               (apply %_1008
                      (cons (append2 %_1011 (car %_1010)) (cdr %_1010)))))))
       (lambda %_1009
         (if (null? %_1009)
           '()
           (if (null? (cdr %_1009))
             (car %_1009)
             (apply %_1008 (cons (car %_1009) (cdr %_1009))))))))
   #f))
(define map
  ((lambda (%_1012 %_1013)
     (begin
       (set! %_1012 map)
       (set! %_1013
         (lambda (%_1017 %_1018 %_1019 %_1020)
           (if (null? (car %_1018))
             (if (andmap null? %_1018)
               %_1019
               (error 'map '"lists are not of equal length."))
             ((lambda (%_1021 %_1022)
                (begin
                  (if (not (null? %_1020))
                    (set-cdr! %_1020 %_1021)
                    (void))
                  (if (null? %_1019)
                    (%_1013 %_1017 %_1022 %_1021 %_1021)
                    (%_1013 %_1017 %_1022 %_1019 %_1021))))
              (cons (apply %_1017 (%_1012 car %_1018)) '())
              (%_1012 cdr %_1018)))))
       (lambda (%_1016 %_1015 . %_1014)
         (if (null? %_1014)
           (%_1012 %_1016 %_1015)
           (%_1013 %_1016 (cons %_1015 %_1014) '() '())))))
   #f
   #f))
(define proper-list?
  (lambda (%_1023)
    (((lambda (%_1024)
        (begin
          (set! %_1024
            (lambda (%_1025 %_1026)
              (if (pair? %_1025)
                ((lambda (%_1027)
                   (if (pair? %_1027)
                     ((lambda (%_1028 %_1029)
                        (if (not (eq? %_1028 %_1029))
                          (%_1024 %_1028 %_1029)
                          '#f))
                      (cdr %_1027)
                      (cdr %_1026))
                     (null? %_1027)))
                 (cdr %_1025))
                (null? %_1025))))
          %_1024))
      #f)
     %_1023
     %_1023)))
(define circular?
  (lambda (%_1030)
    ((lambda (%_1035 %_1034 %_1033 %_1032 %_1031)
       (begin
         (set! %_1035
           (lambda (%_1037 %_1038)
             ((lambda (%_1039)
                (begin
                  (set! %_1039
                    (lambda (%_1048 %_1049)
                      ((lambda (%_1050)
                         (if %_1050
                           (%_1035 (%_1034 %_1048) (%_1034 %_1050))
                           '#f))
                       (%_1034 %_1049))))
                  (if %_1038
                    (if (not (eq? (car %_1038) (car %_1037)))
                      (%_1039 %_1037 %_1038)
                      (((lambda (%_1040)
                          (begin
                            (set! %_1040
                              (lambda (%_1041 %_1042)
                                ((lambda (%_1043)
                                   (if %_1043
                                     %_1043
                                     (if (if (= (cadr %_1041) (cadr %_1042))
                                           (eq? (caddr %_1041) (caddr %_1042))
                                           '#f)
                                       (%_1040 (cddr %_1041) (cddr %_1042))
                                       ((lambda (%_1044)
                                          (((lambda (%_1045)
                                              (begin
                                                (set! %_1045
                                                  (lambda (%_1046)
                                                    (if %_1046
                                                      ((lambda (%_1047)
                                                         (if %_1047
                                                           %_1047
                                                           (%_1045
                                                             (%_1034 %_1046))))
                                                       (eq? (car %_1046)
                                                            %_1044))
                                                      (%_1039 %_1041 %_1042))))
                                                %_1045))
                                            #f)
                                           (%_1034 (list %_1044))))
                                        (car %_1041)))))
                                 (null? (cdr %_1041)))))
                            %_1040))
                        #f)
                       %_1037
                       %_1038))
                    '#f)))
              #f)))
         (set! %_1034
           (lambda (%_1051)
             ((lambda (%_1052)
                (((lambda (%_1053)
                    (begin
                      (set! %_1053
                        (lambda (%_1054 %_1055 %_1056)
                          (if (>= %_1055 '0)
                            ((lambda (%_1060)
                               (if (%_1031 %_1060)
                                 (cons %_1060 (cons %_1055 %_1056))
                                 (%_1053 %_1054 (- %_1055 '1) %_1056)))
                             (%_1033 %_1054 %_1055))
                            ((lambda (%_1057)
                               (if (pair? %_1057)
                                 ((lambda (%_1058 %_1059)
                                    (%_1053 (car %_1059) (- %_1058 '1) %_1059))
                                  (car %_1057)
                                  (cdr %_1057))
                                 '#f))
                             (cdr %_1056)))))
                      %_1053))
                  #f)
                 %_1052
                 (- (%_1032 %_1052) '1)
                 %_1051))
              (car %_1051))))
         (set! %_1033
           (lambda (%_1061 %_1062)
             (if (vector? %_1061)
               (vector-ref %_1061 %_1062)
               (if (box? %_1061)
                 (unbox %_1061)
                 ((if (zero? %_1062) car cdr) %_1061)))))
         (set! %_1032
           (lambda (%_1063)
             (if (pair? %_1063)
               '2
               (if (box? %_1063) '1 (vector-length %_1063)))))
         (set! %_1031
           (lambda (%_1064)
             ((lambda (%_1065)
                (if %_1065
                  %_1065
                  ((lambda (%_1066)
                     (if %_1066
                       %_1066
                       (if (vector? %_1064)
                         (not (zero? (vector-length %_1064)))
                         '#f)))
                   (box? %_1064))))
              (pair? %_1064))))
         (if (%_1031 %_1030)
           ((lambda (%_1036) (%_1035 %_1036 (%_1034 %_1036)))
            (list %_1030))
           '#f)))
     #f
     #f
     #f
     #f
     #f)))
(define list?
  ((lambda (%_1067)
     (begin
       (set! %_1067
         (lambda (%_1070 %_1071)
           ((lambda (%_1072)
              (if %_1072
                %_1072
                ((lambda (%_1073)
                   (if %_1073
                     %_1073
                     (if (pair? %_1071)
                       ((lambda (%_1074)
                          (if %_1074
                            %_1074
                            (if (not (eq? %_1070 %_1071))
                              (%_1067 (cdr %_1070) (cddr %_1071))
                              '#f)))
                        (null? (cdr %_1071)))
                       '#f)))
                 (null? %_1071))))
            (null? %_1070))))
       (lambda (%_1068)
         ((lambda (%_1069)
            (if %_1069
              %_1069
              (if (pair? %_1068)
                (%_1067 %_1068 (cdr %_1068))
                '#f)))
          (null? %_1068)))))
   #f))
(define expt
  (lambda (%_1075 %_1076)
    (if (if (integer? %_1076) (= %_1075 '2) '#f)
      (ashl '1 %_1076)
      (((lambda (%_1077)
          (begin
            (set! %_1077
              (lambda (%_1078 %_1079 %_1080)
                (if (zero? %_1078)
                  %_1079
                  (%_1077
                    (quotient %_1078 '2)
                    (if (odd? %_1078) (* %_1079 %_1080) %_1079)
                    (* %_1080 %_1080)))))
            %_1077))
        #f)
       %_1076
       '1
       %_1075))))
(define modpow
  (lambda (%_1081 %_1082 %_1083)
    ((lambda (%_1084)
       (if (= %_1082 '1)
         (modulo %_1081 %_1083)
         (if (even? %_1082)
           ((lambda (%_1086)
              (modulo (* %_1086 %_1086) %_1083))
            (modpow %_1081 (/ %_1082 '2) %_1083))
           ((lambda (%_1085)
              (begin
                (set! %_1085 (modulo (* %_1085 %_1085) %_1083))
                (modulo (* %_1081 %_1085) %_1083)))
            (modpow %_1081 (/ (- %_1082 '1) '2) %_1083)))))
     '0)))
(define integer?
  ((lambda (%_1087)
     (lambda (%_1088)
       ((lambda (%_1089)
          (if %_1089
            %_1089
            (if (real? %_1088) (= (round %_1088) %_1088) '#f)))
        (%_1087 %_1088))))
   integer?))
(define real?
  ((lambda (%_1090)
     (lambda (%_1091)
       (if (number? %_1091) (not (%_1090 %_1091)) '#f)))
   complex?))
(define complex? number?)
(define abs
  (lambda (%_1092)
    (if (not (real? %_1092))
      ((lambda (%_1093 %_1094)
         (sqrt (+ (* %_1093 %_1093) (* %_1094 %_1094))))
       (real-part %_1092)
       (imag-part %_1092))
      (if (< %_1092 '0) (- %_1092) %_1092))))
(define min (void))
(define max (void))
((lambda (%_1095)
   (begin
     (set! %_1095
       (lambda (%_1100 %_1101 %_1102 %_1103)
         (if (null? %_1102)
           (if (if %_1103 (exact? %_1101) '#f)
             (exact->inexact %_1101)
             %_1101)
           (if (%_1100 (car %_1102) %_1101)
             (%_1095
               %_1100
               (car %_1102)
               (cdr %_1102)
               ((lambda (%_1104)
                  (if %_1104 %_1104 (inexact? (car %_1102))))
                %_1103))
             (%_1095 %_1100 %_1101 (cdr %_1102) %_1103)))))
     (begin
       (set! min
         (lambda (%_1097 . %_1096)
           (if (null? %_1096)
             %_1097
             (%_1095 < %_1097 %_1096 (inexact? %_1097)))))
       (set! max
         (lambda (%_1099 . %_1098)
           (if (null? %_1098)
             %_1099
             (%_1095 > %_1099 %_1098 (inexact? %_1099))))))))
 #f)
(define negative?
  (lambda (%_1105) (< %_1105 '0)))
(define positive?
  (lambda (%_1106) (> %_1106 '0)))
(define even?
  (lambda (%_1107) (= '0 (modulo %_1107 '2))))
(define odd?
  (lambda (%_1108) (not (even? %_1108))))
(define zero? (lambda (%_1109) (= %_1109 '0)))
(define add1 (lambda (%_1110) (+ %_1110 '1)))
(define sub1 (lambda (%_1111) (- %_1111 '1)))
(define >= (void))
(define <= (void))
((lambda (%_1112 %_1113)
   (begin
     (set! <=
       (%_1112
         (lambda (%_1114 %_1115)
           ((lambda (%_1116)
              (if %_1116 %_1116 (= %_1114 %_1115)))
            (< %_1114 %_1115)))
         %_1113
         '#t))
     (set! >=
       (%_1112
         (lambda (%_1117 %_1118)
           ((lambda (%_1119)
              (if %_1119 %_1119 (= %_1117 %_1118)))
            (> %_1117 %_1118)))
         %_1113
         '#t))))
 (lambda (%_1120 %_1121 %_1122)
   (lambda %_1123
     (((lambda (%_1124)
         (begin
           (set! %_1124
             (lambda (%_1125)
               (if (null? %_1125)
                 %_1122
                 (if (null? (cdr %_1125))
                   %_1122
                   (%_1121
                     (%_1120 (car %_1125) (cadr %_1125))
                     (%_1124 (cdr %_1125)))))))
           %_1124))
       #f)
      %_1123)))
 (lambda (%_1126 %_1127) (if %_1126 %_1127 '#f)))
((lambda (%_1128)
   (begin
     (set! >= (%_1128 > >=))
     (set! <= (%_1128 < <=))))
 (lambda (%_1129 %_1130)
   (lambda %_1131
     ((lambda (%_1132)
        (if %_1132
          %_1132
          ((lambda (%_1133)
             (if %_1133
               %_1133
               (if ((lambda (%_1134)
                      (if %_1134
                        %_1134
                        (%_1129 (car %_1131) (cadr %_1131))))
                    (= (car %_1131) (cadr %_1131)))
                 (apply %_1130 (cdr %_1131))
                 '#f)))
           (null? (cdr %_1131)))))
      (null? %_1131)))))
(define gcd
  (lambda %_1135
    (if (null? %_1135)
      '0
      (if (null? (cdr %_1135))
        (car %_1135)
        (_gcd (car %_1135) (cadr %_1135))))))
(define lcm
  (lambda %_1136
    (if (null? %_1136)
      '1
      (if (null? (cdr %_1136))
        (car %_1136)
        (_lcm (car %_1136) (cadr %_1136))))))
(max-precision '1500)
(define pi-10 (string->number '"3.1415926536"))
(define pi-70
  (string->number
    '"3.1415926535897932384626433832795028841971693993751058209749445923078164"))
(define pi-1000
  (string->number
    '"3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679821480865132823066470938446095505822317253594081284811174502841027019385211055596446229489549303819644288109756659334461284756482337867831652712019091456485669234603486104543266482133936072602491412737245870066063155881748815209209628292540917153643678925903600113305305488204665213841469519415116094330572703657595919530921861173819326117931051185480744623799627495673518857527248912279381830119491298336733624406566430860213949463952247371907021798609437027705392171762931767523846748184676694051320005681271452635608277857713427577896091736371787214684409012249534301465495853710507922796892589235420199561121290219608640344181598136297747713099605187072113499999983729780499510597317328160963185950244594553469083026425223082533446850352619311881710100031378387528865875332083814206171776691473035982534904287554687311595628638823537875937519577818577805321712268066130019278766111959092164201989"))
(define pi pi-10)
(define e-10 (string->number '"2.7182818285"))
(define e-70
  (string->number
    '"2.7182818284590452353602874713526624977572470936999595749669676277240766"))
(define e-1000
  (string->number
    '"2.7182818284590452353602874713526624977572470936999595749669676277240766303535475945713821785251664274274663919320030599218174135966290435729003342952605956307381323286279434907632338298807531952510190115738341879307021540891499348841675092447614606680822648001684774118537423454424371075390777449920695517027618386062613313845830007520449338265602976067371132007093287091274437470472306969772093101416928368190255151086574637721112523897844250569536967707854499699679468644549059879316368892300987931277361782154249992295763514822082698951936680331825288693984964651058209392398294887933203625094431173012381970684161403970198376793206832823764648042953118023287825098194558153017567173613320698112509961818815930416903515988885193458072738667385894228792284998920868058257492796104841984443634632449684875602336248270419786232090021609902353043699418491463140934317381436405462531520961836908887070167683964243781405927145635490613031072085103837505101157477041718986106873969655212671546889570350354"))
(define e e-10)
(max-precision '32)
(define string-append
  (lambda %_1137
    (if (null? %_1137)
      '""
      (if (null? (cdr %_1137))
        (car %_1137)
        (apply string-append
               (_string-append (car %_1137) (cadr %_1137))
               (cddr %_1137))))))
(define char-downcase
  ((lambda (%_1138)
     ((lambda (%_1139)
        ((lambda (%_1140)
           ((lambda ()
              (lambda (%_1141)
                ((lambda (%_1142)
                   (if (if (>= %_1142 %_1138) (<= %_1142 %_1139) '#f)
                     (integer->char (+ %_1142 %_1140))
                     %_1141))
                 (char->integer %_1141))))))
         (- (char->integer '#\a) %_1138)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_1143)
     ((lambda (%_1144)
        ((lambda (%_1145)
           ((lambda ()
              (lambda (%_1146)
                ((lambda (%_1147)
                   (if (if (>= %_1147 %_1143) (<= %_1147 %_1144) '#f)
                     (integer->char (- %_1147 %_1145))
                     %_1146))
                 (char->integer %_1146))))))
         (- %_1143 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_1148 %_1149)
    (> (char->integer %_1148) (char->integer %_1149))))
(define char<?
  (lambda (%_1150 %_1151)
    (< (char->integer %_1150) (char->integer %_1151))))
(define char=? eq?)
(define char>=?
  (lambda (%_1152 %_1153)
    ((lambda (%_1154)
       (if %_1154 %_1154 (char=? %_1152 %_1153)))
     (char>? %_1152 %_1153))))
(define char<=?
  (lambda (%_1155 %_1156)
    ((lambda (%_1157)
       (if %_1157 %_1157 (char=? %_1155 %_1156)))
     (char<? %_1155 %_1156))))
(define char-ci>?
  (lambda (%_1158 %_1159)
    (char>?
      (char-downcase %_1158)
      (char-downcase %_1159))))
(define char-ci<?
  (lambda (%_1160 %_1161)
    (char<?
      (char-downcase %_1160)
      (char-downcase %_1161))))
(define char-ci=?
  (lambda (%_1162 %_1163)
    (char=?
      (char-downcase %_1162)
      (char-downcase %_1163))))
(define char-ci>=?
  (lambda (%_1164 %_1165)
    ((lambda (%_1166)
       (if %_1166 %_1166 (char-ci=? %_1164 %_1165)))
     (char-ci>? %_1164 %_1165))))
(define char-ci<=?
  (lambda (%_1167 %_1168)
    ((lambda (%_1169)
       (if %_1169 %_1169 (char-ci=? %_1167 %_1168)))
     (char-ci<? %_1167 %_1168))))
(define char-alphabetic?
  (lambda (%_1170)
    (if (char-ci>=? %_1170 '#\a)
      (char-ci<=? %_1170 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_1171)
    (if (char-ci>=? %_1171 '#\0)
      (char-ci<=? %_1171 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_1172)
    (if (memq %_1172 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_1173)
    (if (char-alphabetic? %_1173)
      (char>? %_1173 '#\a)
      '#f)))
(define char-lower-case?
  (lambda (%_1174)
    (if (char-alphabetic? %_1174)
      (char>? %_1174 '#\Z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
((lambda (%_1175)
   (begin
     (set! %_1175
       (lambda (%_1180 %_1181 %_1182 %_1183 %_1184)
         (if (< %_1183 %_1184)
           (begin
             (string-set!
               %_1181
               %_1183
               (%_1182 (string-ref %_1180 %_1183)))
             (%_1175
               %_1180
               %_1181
               %_1182
               (+ %_1183 '1)
               %_1184))
           %_1181)))
     (begin
       (set! string-downcase
         (lambda (%_1176)
           ((lambda (%_1177)
              (%_1175
                %_1176
                %_1177
                char-downcase
                '0
                (string-length %_1176)))
            (make-string (string-length %_1176)))))
       (set! string-upcase
         (lambda (%_1178)
           ((lambda (%_1179)
              (%_1175
                %_1178
                %_1179
                char-upcase
                '0
                (string-length %_1178)))
            (make-string (string-length %_1178))))))))
 #f)
(define string=? equal?)
(define string<?
  ((lambda (%_1185)
     (begin
       (set! %_1185
         (lambda (%_1188 %_1189)
           (if (null? %_1188)
             (not (null? %_1189))
             (if (null? %_1189)
               '#f
               ((lambda (%_1190 %_1191)
                  (if (char<? %_1190 %_1191)
                    '#t
                    (if (char>? %_1190 %_1191)
                      '#f
                      (%_1185 (cdr %_1188) (cdr %_1189)))))
                (car %_1188)
                (car %_1189))))))
       (lambda (%_1186 %_1187)
         (%_1185
           (string->list %_1186)
           (string->list %_1187)))))
   #f))
(define string>?
  ((lambda (%_1192)
     (begin
       (set! %_1192
         (lambda (%_1195 %_1196)
           (if (null? %_1196)
             (not (null? %_1195))
             (if (null? %_1195)
               '#f
               ((lambda (%_1197 %_1198)
                  (if (char>? %_1197 %_1198)
                    '#t
                    (if (char<? %_1197 %_1198)
                      '#f
                      (%_1192 (cdr %_1195) (cdr %_1196)))))
                (car %_1195)
                (car %_1196))))))
       (lambda (%_1193 %_1194)
         (%_1192
           (string->list %_1193)
           (string->list %_1194)))))
   #f))
(define string<=?
  (lambda (%_1199 %_1200)
    ((lambda (%_1201)
       (if %_1201 %_1201 (string=? %_1199 %_1200)))
     (string<? %_1199 %_1200))))
(define string>=?
  (lambda (%_1202 %_1203)
    ((lambda (%_1204)
       (if %_1204 %_1204 (string=? %_1202 %_1203)))
     (string>? %_1202 %_1203))))
(define string-ci=?
  (lambda (%_1205 %_1206)
    (string=?
      (string-downcase %_1205)
      (string-downcase %_1206))))
(define string-ci<?
  (lambda (%_1207 %_1208)
    (string<?
      (string-downcase %_1207)
      (string-downcase %_1208))))
(define string-ci>?
  (lambda (%_1209 %_1210)
    (string>?
      (string-downcase %_1209)
      (string-downcase %_1210))))
(define string-ci>=?
  (lambda (%_1211 %_1212)
    (string>=?
      (string-downcase %_1211)
      (string-downcase %_1212))))
(define string-ci<=?
  (lambda (%_1213 %_1214)
    (string<=?
      (string-downcase %_1213)
      (string-downcase %_1214))))
(define substring
  ((lambda (%_1215)
     (begin
       (set! %_1215
         (lambda (%_1220 %_1221 %_1222 %_1223 %_1224)
           (if (< %_1223 %_1224)
             (begin
               (string-set!
                 %_1221
                 %_1222
                 (string-ref %_1220 %_1223))
               (%_1215
                 %_1220
                 %_1221
                 (+ %_1222 '1)
                 (+ %_1223 '1)
                 %_1224))
             (void))))
       (lambda (%_1216 %_1217 %_1218)
         ((lambda (%_1219)
            (begin
              (%_1215 %_1216 %_1219 '0 %_1217 %_1218)
              %_1219))
          (make-string (- %_1218 %_1217))))))
   #f))
(define format
  ((lambda (%_1225)
     (begin
       (set! %_1225
         (lambda (%_1228 %_1229 %_1230)
           (if (null? %_1228)
             (get-output-string %_1230)
             (if (eq? (car %_1228) '#\~)
               (begin
                 ((lambda (%_1231)
                    (if (memv %_1231 '(#\s))
                      (write (car %_1229) %_1230)
                      (if (memv %_1231 '(#\a))
                        (display (car %_1229) %_1230)
                        (if (memv %_1231 '(#\%))
                          (display '#\newline %_1230)
                          (if (memv %_1231 '(#\~))
                            (display '#\~ %_1230)
                            (void))))))
                  (cadr %_1228))
                 (%_1225
                   (cddr %_1228)
                   (if (not (null? %_1229)) (cdr %_1229) '())
                   %_1230))
               (begin
                 (display (car %_1228) %_1230)
                 (%_1225 (cdr %_1228) %_1229 %_1230))))))
       (lambda (%_1227 . %_1226)
         (%_1225
           (string->list %_1227)
           %_1226
           (open-output-string)))))
   #f))
(define error
  ((lambda (%_1232)
     (lambda %_1233
       ((lambda (%_1234)
          ((lambda (%_1235)
             ((lambda (%_1236)
                ((lambda ()
                   (if %_1234
                     (if %_1235
                       (%_1232
                         (format
                           '"Error in ~s: ~a"
                           %_1234
                           (apply format (cons %_1235 %_1236))))
                       (%_1232 (format '"Error in ~s." %_1234)))
                     (if %_1235
                       (if (string? %_1235)
                         (%_1232
                           (format
                             '"Error: ~a"
                             (apply format (cons %_1235 %_1236))))
                         (if (null? %_1236)
                           (%_1232 %_1235)
                           (error 'error
                                  '"cannot specify error arguments to a non format-string error.")))
                       (%_1232 '"Error."))))))
              (if (not %_1235)
                '()
                (if (not %_1234)
                  (if (not (null? %_1233))
                    (if (not (car %_1233))
                      (cddr %_1233)
                      (cdr %_1233))
                    (cdr %_1233))
                  (cddr %_1233)))))
           (if (not %_1234)
             (if (not (null? %_1233))
               (if (not (car %_1233))
                 (cadr %_1233)
                 (car %_1233))
               '#f)
             (if (not (null? (cdr %_1233))) (cadr %_1233) '#f))))
        (if (if (not (null? %_1233))
              (symbol? (car %_1233))
              '#f)
          (car %_1233)
          '#f))))
   error))
(define list-ref
  (lambda (%_1237 %_1238)
    (if (zero? %_1238)
      (car %_1237)
      (list-ref (cdr %_1237) (- %_1238 '1)))))
(define values
  (lambda %_1239
    (call-with-current-continuation
      (lambda (%_1240) (apply %_1240 %_1239)))))
