(define for-each
  (lambda (%_953 . %_952)
    (if (null? %_952)
      (error 'for-each
             '"invalid number of arguments to procedure for-each.")
      (if (not (null? (car %_952)))
        (begin
          (apply %_953 (map car %_952))
          (apply for-each (cons %_953 (map cdr %_952))))
        (void)))))
(define eof-object?
  (lambda (%_954) (eq? %_954 '#!eof)))
(define not (lambda (%_955) (if %_955 '#f '#t)))
(define eqv? eq?)
(define newline
  (lambda %_956
    (apply display (cons '#\newline %_956))))
(define map (void))
(letrec ((%_957 (letrec ((%_958 (lambda (%_962 %_963 %_964 %_965)
                                  (if (null? %_965)
                                    %_963
                                    (begin
                                      (set-cdr!
                                        %_964
                                        (cons (%_962 (car %_965)) '()))
                                      (%_958 %_962
                                             %_963
                                             (cdr %_964)
                                             (cdr %_965)))))))
                  (lambda (%_959 %_960)
                    (if (null? %_960)
                      '()
                      ((lambda (%_961)
                         (%_958 %_959 %_961 %_961 (cdr %_960)))
                       (cons (%_959 (car %_960)) '())))))))
  (set! map %_957))
(define compose
  (lambda %_966
    (if (null? %_966)
      (lambda (%_970) %_970)
      ((lambda (%_967 %_968)
         (lambda (%_969) (%_967 (%_968 %_969))))
       (car %_966)
       (apply compose (cdr %_966))))))
(define compose2
  (lambda (%_971 %_972)
    (lambda (%_973) (%_971 (%_972 %_973)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
(letrec ((%_974 (lambda (%_988 %_989 %_990)
                  (if (null? %_990)
                    '#f
                    (if (%_988 (caar %_990) %_989)
                      (car %_990)
                      (%_974 %_988 %_989 (cdr %_990))))))
         (%_975 (lambda (%_991 %_992 %_993)
                  (if (null? %_993)
                    '#f
                    (if (%_991 (car %_993) %_992)
                      %_993
                      (%_975 %_991 %_992 (cdr %_993)))))))
  (begin
    (set! assq
      (lambda (%_976 %_977) (%_974 eq? %_976 %_977)))
    (set! assv
      (lambda (%_978 %_979) (%_974 eqv? %_978 %_979)))
    (set! assoc
      (lambda (%_980 %_981) (%_974 equal? %_980 %_981)))
    (set! memq
      (lambda (%_982 %_983) (%_975 eq? %_982 %_983)))
    (set! memv
      (lambda (%_984 %_985) (%_975 eqv? %_984 %_985)))
    (set! member
      (lambda (%_986 %_987) (%_975 equal? %_986 %_987)))))
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
  (lambda (%_994 %_995)
    (if (null? %_994)
      %_995
      (cons (car %_994) (append2 (cdr %_994) %_995)))))
(define append append2)
(define list->string
  (lambda (%_996)
    (letrec ((%_997 (lambda (%_998 %_999 %_1000)
                      (if (null? %_998)
                        %_999
                        (begin
                          (string-set! %_999 %_1000 (car %_998))
                          (%_997 (cdr %_998) %_999 (+ %_1000 '1)))))))
      (%_997 %_996 (make-string (length %_996)) '0))))
(define string->list
  (letrec ((%_1001
             (lambda (%_1003 %_1004 %_1005)
               (if (< %_1005 '0)
                 %_1004
                 (%_1001
                   %_1003
                   (cons (string-ref %_1003 %_1005) %_1004)
                   (- %_1005 '1))))))
    (lambda (%_1002)
      (%_1001 %_1002 '() (- (string-length %_1002) '1)))))
(define list->vector
  (letrec ((%_1006
             (lambda (%_1008 %_1009 %_1010)
               (if (null? %_1008)
                 %_1009
                 (begin
                   (vector-set! %_1009 %_1010 (car %_1008))
                   (%_1006 (cdr %_1008) %_1009 (+ %_1010 '1)))))))
    (lambda (%_1007)
      (if (proper-list? %_1007)
        (%_1006 %_1007 (make-vector (length %_1007)) '0)
        (error 'list->vector
               '"can only convert a proper list."
               %_1007)))))
(define vector
  (lambda %_1011 (list->vector %_1011)))
(define string
  (lambda %_1012 (list->string %_1012)))
(define detect-os
  (lambda ()
    ((lambda (%_1013)
       (if (> (string-length %_1013) '3)
         (if (equal? (substring %_1013 '0 '3) '"mac")
           'macos
           (if (equal? (substring %_1013 '0 '3) '"win")
             'ms-dos
             (if (equal? (substring %_1013 '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring %_1013 '0 '3) '"uni")
                 'unix
                 (if (equal? (substring %_1013 '0 '3) '"lin")
                   'unix
                   (if (equal? (substring %_1013 '0 '4) '"os/")
                     'os2
                     (if (equal? (substring %_1013 '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase
       (getprop 'os.name '*environment-variables*)))))
(define current-url (make-parameter '"file:."))
(define current-directory
  (lambda %_1014
    (if (null? %_1014)
      (normalize-url (current-url) '".")
      (current-url
        (normalize-url (current-url) (car %_1014))))))
(define load-expanded load)
((lambda (%_1015)
   ((lambda (%_1016 %_1017 %_1018)
      (begin
        (set! open-input-file (%_1016 open-input-file))
        (set! open-source-input-file
          (%_1016 open-source-input-file))
        (set! open-output-file (%_1016 open-output-file))
        (set! load
          (lambda (%_1019)
            (begin
              ((lambda (%_1020)
                 (begin
                   (current-url (normalize-url %_1020 %_1019))
                   (call-with-failure-continuation
                     (lambda ()
                       ((%_1017 (string->symbol (%_1018 (current-url))))
                        (current-url)))
                     (lambda (%_1021 %_1022 %_1023)
                       (begin
                         (current-url %_1020)
                         (%_1023 %_1021 %_1022))))
                   (current-url %_1020)))
               (current-url))
              (void))))))
    (lambda (%_1024)
      (lambda (%_1026 . %_1025)
        (apply %_1024
               (normalize-url (current-url) %_1026)
               %_1025)))
    (lambda (%_1027)
      ((lambda (%_1028)
         (if (memv %_1028 '(sce pp)) load-expanded %_1015))
       %_1027))
    (lambda (%_1029)
      ((letrec ((%_1030
                  (lambda (%_1031 %_1032)
                    (if (null? %_1031)
                      '#f
                      (if (equal? (car %_1031) '#\.)
                        (list->string %_1032)
                        (%_1030 (cdr %_1031) (cons (car %_1031) %_1032)))))))
         %_1030)
       (reverse (string->list %_1029))
       '()))))
 load)
(define load-module
  (lambda (%_1033)
    ((lambda (%_1034)
       ((lambda (%_1035)
          ((lambda ()
             (for-each
               (lambda (%_1036)
                 (putprop
                   %_1036
                   '*toplevel*
                   (native-library-binding %_1034 %_1036)))
               %_1035))))
        (native-library-binding-names %_1034)))
     (load-native-library %_1033))))
(define reverse
  (letrec ((%_1037
             (lambda (%_1039 %_1040)
               (if (null? %_1039)
                 %_1040
                 (%_1037 (cdr %_1039) (cons (car %_1039) %_1040))))))
    (lambda (%_1038) (%_1037 %_1038 '()))))
(define remove
  (lambda (%_1041 %_1042)
    (if (null? %_1042)
      '()
      (if (equal? (car %_1042) %_1041)
        (remove %_1041 (cdr %_1042))
        (cons (car %_1042) (remove %_1041 (cdr %_1042)))))))
(define append
  (letrec ((%_1043
             (lambda (%_1046 . %_1045)
               (if (null? %_1045)
                 %_1046
                 (if (null? %_1046)
                   (apply %_1043 %_1045)
                   (apply %_1043
                          (cons (append2 %_1046 (car %_1045))
                                (cdr %_1045))))))))
    (lambda %_1044
      (if (null? %_1044)
        '()
        (if (null? (cdr %_1044))
          (car %_1044)
          (apply %_1043 (cons (car %_1044) (cdr %_1044))))))))
(define map
  (letrec ((%_1047 map)
           (%_1048
             (lambda (%_1052 %_1053 %_1054 %_1055)
               (if (null? (car %_1053))
                 (if (andmap null? %_1053)
                   %_1054
                   (error 'map '"lists are not of equal length."))
                 ((lambda (%_1056 %_1057)
                    (begin
                      (if (not (null? %_1055))
                        (set-cdr! %_1055 %_1056)
                        (void))
                      (if (null? %_1054)
                        (%_1048 %_1052 %_1057 %_1056 %_1056)
                        (%_1048 %_1052 %_1057 %_1054 %_1056))))
                  (cons (apply %_1052 (%_1047 car %_1053)) '())
                  (%_1047 cdr %_1053))))))
    (lambda (%_1051 %_1050 . %_1049)
      (if (null? %_1049)
        (%_1047 %_1051 %_1050)
        (%_1048 %_1051 (cons %_1050 %_1049) '() '())))))
(define proper-list?
  (lambda (%_1058)
    ((letrec ((%_1059
                (lambda (%_1060 %_1061)
                  (if (pair? %_1060)
                    ((lambda (%_1062)
                       (if (pair? %_1062)
                         ((lambda (%_1063 %_1064)
                            (if (not (eq? %_1063 %_1064))
                              (%_1059 %_1063 %_1064)
                              '#f))
                          (cdr %_1062)
                          (cdr %_1061))
                         (null? %_1062)))
                     (cdr %_1060))
                    (null? %_1060)))))
       %_1059)
     %_1058
     %_1058)))
(define circular?
  (lambda (%_1065)
    (letrec ((%_1066
               (lambda (%_1072)
                 ((lambda (%_1073)
                    (if %_1073
                      %_1073
                      ((lambda (%_1074)
                         (if %_1074
                           %_1074
                           (if (vector? %_1072)
                             (not (zero? (vector-length %_1072)))
                             '#f)))
                       (box? %_1072))))
                  (pair? %_1072))))
             (%_1067
               (lambda (%_1075)
                 (if (pair? %_1075)
                   '2
                   (if (box? %_1075) '1 (vector-length %_1075)))))
             (%_1068
               (lambda (%_1076 %_1077)
                 (if (vector? %_1076)
                   (vector-ref %_1076 %_1077)
                   (if (box? %_1076)
                     (unbox %_1076)
                     ((if (zero? %_1077) car cdr) %_1076)))))
             (%_1069
               (lambda (%_1078)
                 ((lambda (%_1079)
                    ((letrec ((%_1080
                                (lambda (%_1081 %_1082 %_1083)
                                  (if (>= %_1082 '0)
                                    ((lambda (%_1087)
                                       (if (%_1066 %_1087)
                                         (cons %_1087 (cons %_1082 %_1083))
                                         (%_1080 %_1081 (- %_1082 '1) %_1083)))
                                     (%_1068 %_1081 %_1082))
                                    ((lambda (%_1084)
                                       (if (pair? %_1084)
                                         ((lambda (%_1085 %_1086)
                                            (%_1080
                                              (car %_1086)
                                              (- %_1085 '1)
                                              %_1086))
                                          (car %_1084)
                                          (cdr %_1084))
                                         '#f))
                                     (cdr %_1083))))))
                       %_1080)
                     %_1079
                     (- (%_1067 %_1079) '1)
                     %_1078))
                  (car %_1078))))
             (%_1070
               (lambda (%_1088 %_1089)
                 (letrec ((%_1090
                            (lambda (%_1099 %_1100)
                              ((lambda (%_1101)
                                 (if %_1101
                                   (%_1070 (%_1069 %_1099) (%_1069 %_1101))
                                   '#f))
                               (%_1069 %_1100)))))
                   (if %_1089
                     (if (not (eq? (car %_1089) (car %_1088)))
                       (%_1090 %_1088 %_1089)
                       ((letrec ((%_1091
                                   (lambda (%_1092 %_1093)
                                     ((lambda (%_1094)
                                        (if %_1094
                                          %_1094
                                          (if (if (= (cadr %_1092)
                                                     (cadr %_1093))
                                                (eq? (caddr %_1092)
                                                     (caddr %_1093))
                                                '#f)
                                            (%_1091
                                              (cddr %_1092)
                                              (cddr %_1093))
                                            ((lambda (%_1095)
                                               ((letrec ((%_1096
                                                           (lambda (%_1097)
                                                             (if %_1097
                                                               ((lambda (%_1098)
                                                                  (if %_1098
                                                                    %_1098
                                                                    (%_1096
                                                                      (%_1069
                                                                        %_1097))))
                                                                (eq? (car %_1097)
                                                                     %_1095))
                                                               (%_1090
                                                                 %_1092
                                                                 %_1093)))))
                                                  %_1096)
                                                (%_1069 (list %_1095))))
                                             (car %_1092)))))
                                      (null? (cdr %_1092))))))
                          %_1091)
                        %_1088
                        %_1089))
                     '#f)))))
      (if (%_1066 %_1065)
        ((lambda (%_1071) (%_1070 %_1071 (%_1069 %_1071)))
         (list %_1065))
        '#f))))
(define list?
  (letrec ((%_1102
             (lambda (%_1105 %_1106)
               ((lambda (%_1107)
                  (if %_1107
                    %_1107
                    ((lambda (%_1108)
                       (if %_1108
                         %_1108
                         (if (pair? %_1106)
                           ((lambda (%_1109)
                              (if %_1109
                                %_1109
                                (if (not (eq? %_1105 %_1106))
                                  (%_1102 (cdr %_1105) (cddr %_1106))
                                  '#f)))
                            (null? (cdr %_1106)))
                           '#f)))
                     (null? %_1106))))
                (null? %_1105)))))
    (lambda (%_1103)
      ((lambda (%_1104)
         (if %_1104
           %_1104
           (if (pair? %_1103)
             (%_1102 %_1103 (cdr %_1103))
             '#f)))
       (null? %_1103)))))
(define expt
  (lambda (%_1110 %_1111)
    (if (if (integer? %_1111) (= %_1110 '2) '#f)
      (ashl '1 %_1111)
      ((letrec ((%_1112
                  (lambda (%_1113 %_1114 %_1115)
                    (if (zero? %_1113)
                      %_1114
                      (%_1112
                        (quotient %_1113 '2)
                        (if (odd? %_1113) (* %_1114 %_1115) %_1114)
                        (* %_1115 %_1115))))))
         %_1112)
       %_1111
       '1
       %_1110))))
(define modpow
  (lambda (%_1116 %_1117 %_1118)
    ((lambda (%_1119)
       (if (= %_1117 '1)
         (modulo %_1116 %_1118)
         (if (even? %_1117)
           ((lambda (%_1121)
              (modulo (* %_1121 %_1121) %_1118))
            (modpow %_1116 (/ %_1117 '2) %_1118))
           ((lambda (%_1120)
              (begin
                (set! %_1120 (modulo (* %_1120 %_1120) %_1118))
                (modulo (* %_1116 %_1120) %_1118)))
            (modpow %_1116 (/ (- %_1117 '1) '2) %_1118)))))
     '0)))
(define integer?
  ((lambda (%_1122)
     (lambda (%_1123)
       ((lambda (%_1124)
          (if %_1124
            %_1124
            (if (real? %_1123) (= (round %_1123) %_1123) '#f)))
        (%_1122 %_1123))))
   integer?))
(define real?
  ((lambda (%_1125)
     (lambda (%_1126)
       (if (number? %_1126) (not (%_1125 %_1126)) '#f)))
   complex?))
(define complex? number?)
(define abs
  (lambda (%_1127)
    (if (not (real? %_1127))
      ((lambda (%_1128 %_1129)
         (sqrt (+ (* %_1128 %_1128) (* %_1129 %_1129))))
       (real-part %_1127)
       (imag-part %_1127))
      (if (< %_1127 '0) (- %_1127) %_1127))))
(define min (void))
(define max (void))
(letrec ((%_1130
           (lambda (%_1135 %_1136 %_1137 %_1138)
             (if (null? %_1137)
               (if (if %_1138 (exact? %_1136) '#f)
                 (exact->inexact %_1136)
                 %_1136)
               (if (%_1135 (car %_1137) %_1136)
                 (%_1130
                   %_1135
                   (car %_1137)
                   (cdr %_1137)
                   ((lambda (%_1139)
                      (if %_1139 %_1139 (inexact? (car %_1137))))
                    %_1138))
                 (%_1130 %_1135 %_1136 (cdr %_1137) %_1138))))))
  (begin
    (set! min
      (lambda (%_1132 . %_1131)
        (if (null? %_1131)
          %_1132
          (%_1130 < %_1132 %_1131 (inexact? %_1132)))))
    (set! max
      (lambda (%_1134 . %_1133)
        (if (null? %_1133)
          %_1134
          (%_1130 > %_1134 %_1133 (inexact? %_1134)))))))
(define negative?
  (lambda (%_1140) (< %_1140 '0)))
(define positive?
  (lambda (%_1141) (> %_1141 '0)))
(define even?
  (lambda (%_1142) (= '0 (modulo %_1142 '2))))
(define odd?
  (lambda (%_1143) (not (even? %_1143))))
(define zero? (lambda (%_1144) (= %_1144 '0)))
(define add1 (lambda (%_1145) (+ %_1145 '1)))
(define sub1 (lambda (%_1146) (- %_1146 '1)))
(define >= (void))
(define <= (void))
((lambda (%_1147 %_1148)
   (begin
     (set! <=
       (%_1147
         (lambda (%_1149 %_1150)
           ((lambda (%_1151)
              (if %_1151 %_1151 (= %_1149 %_1150)))
            (< %_1149 %_1150)))
         %_1148
         '#t))
     (set! >=
       (%_1147
         (lambda (%_1152 %_1153)
           ((lambda (%_1154)
              (if %_1154 %_1154 (= %_1152 %_1153)))
            (> %_1152 %_1153)))
         %_1148
         '#t))))
 (lambda (%_1155 %_1156 %_1157)
   (lambda %_1158
     ((letrec ((%_1159
                 (lambda (%_1160)
                   (if (null? %_1160)
                     %_1157
                     (if (null? (cdr %_1160))
                       %_1157
                       (%_1156
                         (%_1155 (car %_1160) (cadr %_1160))
                         (%_1159 (cdr %_1160))))))))
        %_1159)
      %_1158)))
 (lambda (%_1161 %_1162) (if %_1161 %_1162 '#f)))
((lambda (%_1163)
   (begin
     (set! >= (%_1163 > >=))
     (set! <= (%_1163 < <=))))
 (lambda (%_1164 %_1165)
   (lambda %_1166
     ((lambda (%_1167)
        (if %_1167
          %_1167
          ((lambda (%_1168)
             (if %_1168
               %_1168
               (if ((lambda (%_1169)
                      (if %_1169
                        %_1169
                        (%_1164 (car %_1166) (cadr %_1166))))
                    (= (car %_1166) (cadr %_1166)))
                 (apply %_1165 (cdr %_1166))
                 '#f)))
           (null? (cdr %_1166)))))
      (null? %_1166)))))
(define gcd
  (lambda %_1170
    (if (null? %_1170)
      '0
      (if (null? (cdr %_1170))
        (car %_1170)
        (_gcd (car %_1170) (cadr %_1170))))))
(define lcm
  (lambda %_1171
    (if (null? %_1171)
      '1
      (if (null? (cdr %_1171))
        (car %_1171)
        (_lcm (car %_1171) (cadr %_1171))))))
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
  (lambda %_1172
    (if (null? %_1172)
      '""
      (if (null? (cdr %_1172))
        (car %_1172)
        (apply string-append
               (_string-append (car %_1172) (cadr %_1172))
               (cddr %_1172))))))
(define char-downcase
  ((lambda (%_1173)
     ((lambda (%_1174)
        ((lambda (%_1175)
           ((lambda ()
              (lambda (%_1176)
                ((lambda (%_1177)
                   (if (if (>= %_1177 %_1173) (<= %_1177 %_1174) '#f)
                     (integer->char (+ %_1177 %_1175))
                     %_1176))
                 (char->integer %_1176))))))
         (- (char->integer '#\a) %_1173)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_1178)
     ((lambda (%_1179)
        ((lambda (%_1180)
           ((lambda ()
              (lambda (%_1181)
                ((lambda (%_1182)
                   (if (if (>= %_1182 %_1178) (<= %_1182 %_1179) '#f)
                     (integer->char (- %_1182 %_1180))
                     %_1181))
                 (char->integer %_1181))))))
         (- %_1178 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_1183 %_1184)
    (> (char->integer %_1183) (char->integer %_1184))))
(define char<?
  (lambda (%_1185 %_1186)
    (< (char->integer %_1185) (char->integer %_1186))))
(define char=? eq?)
(define char>=?
  (lambda (%_1187 %_1188)
    ((lambda (%_1189)
       (if %_1189 %_1189 (char=? %_1187 %_1188)))
     (char>? %_1187 %_1188))))
(define char<=?
  (lambda (%_1190 %_1191)
    ((lambda (%_1192)
       (if %_1192 %_1192 (char=? %_1190 %_1191)))
     (char<? %_1190 %_1191))))
(define char-ci>?
  (lambda (%_1193 %_1194)
    (char>?
      (char-downcase %_1193)
      (char-downcase %_1194))))
(define char-ci<?
  (lambda (%_1195 %_1196)
    (char<?
      (char-downcase %_1195)
      (char-downcase %_1196))))
(define char-ci=?
  (lambda (%_1197 %_1198)
    (char=?
      (char-downcase %_1197)
      (char-downcase %_1198))))
(define char-ci>=?
  (lambda (%_1199 %_1200)
    ((lambda (%_1201)
       (if %_1201 %_1201 (char-ci=? %_1199 %_1200)))
     (char-ci>? %_1199 %_1200))))
(define char-ci<=?
  (lambda (%_1202 %_1203)
    ((lambda (%_1204)
       (if %_1204 %_1204 (char-ci=? %_1202 %_1203)))
     (char-ci<? %_1202 %_1203))))
(define char-alphabetic?
  (lambda (%_1205)
    (if (char-ci>=? %_1205 '#\a)
      (char-ci<=? %_1205 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_1206)
    (if (char-ci>=? %_1206 '#\0)
      (char-ci<=? %_1206 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_1207)
    (if (memq %_1207 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_1208)
    (if (char-alphabetic? %_1208)
      (char>? %_1208 '#\a)
      '#f)))
(define char-lower-case?
  (lambda (%_1209)
    (if (char-alphabetic? %_1209)
      (char>? %_1209 '#\Z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
(letrec ((%_1210
           (lambda (%_1215 %_1216 %_1217 %_1218 %_1219)
             (if (< %_1218 %_1219)
               (begin
                 (string-set!
                   %_1216
                   %_1218
                   (%_1217 (string-ref %_1215 %_1218)))
                 (%_1210
                   %_1215
                   %_1216
                   %_1217
                   (+ %_1218 '1)
                   %_1219))
               %_1216))))
  (begin
    (set! string-downcase
      (lambda (%_1211)
        ((lambda (%_1212)
           (%_1210
             %_1211
             %_1212
             char-downcase
             '0
             (string-length %_1211)))
         (make-string (string-length %_1211)))))
    (set! string-upcase
      (lambda (%_1213)
        ((lambda (%_1214)
           (%_1210
             %_1213
             %_1214
             char-upcase
             '0
             (string-length %_1213)))
         (make-string (string-length %_1213)))))))
(define string=? equal?)
(define string<?
  (letrec ((%_1220
             (lambda (%_1223 %_1224)
               (if (null? %_1223)
                 (not (null? %_1224))
                 (if (null? %_1224)
                   '#f
                   ((lambda (%_1225 %_1226)
                      (if (char<? %_1225 %_1226)
                        '#t
                        (if (char>? %_1225 %_1226)
                          '#f
                          (%_1220 (cdr %_1223) (cdr %_1224)))))
                    (car %_1223)
                    (car %_1224)))))))
    (lambda (%_1221 %_1222)
      (%_1220
        (string->list %_1221)
        (string->list %_1222)))))
(define string>?
  (letrec ((%_1227
             (lambda (%_1230 %_1231)
               (if (null? %_1231)
                 (not (null? %_1230))
                 (if (null? %_1230)
                   '#f
                   ((lambda (%_1232 %_1233)
                      (if (char>? %_1232 %_1233)
                        '#t
                        (if (char<? %_1232 %_1233)
                          '#f
                          (%_1227 (cdr %_1230) (cdr %_1231)))))
                    (car %_1230)
                    (car %_1231)))))))
    (lambda (%_1228 %_1229)
      (%_1227
        (string->list %_1228)
        (string->list %_1229)))))
(define string<=?
  (lambda (%_1234 %_1235)
    ((lambda (%_1236)
       (if %_1236 %_1236 (string=? %_1234 %_1235)))
     (string<? %_1234 %_1235))))
(define string>=?
  (lambda (%_1237 %_1238)
    ((lambda (%_1239)
       (if %_1239 %_1239 (string=? %_1237 %_1238)))
     (string>? %_1237 %_1238))))
(define string-ci=?
  (lambda (%_1240 %_1241)
    (string=?
      (string-downcase %_1240)
      (string-downcase %_1241))))
(define string-ci<?
  (lambda (%_1242 %_1243)
    (string<?
      (string-downcase %_1242)
      (string-downcase %_1243))))
(define string-ci>?
  (lambda (%_1244 %_1245)
    (string>?
      (string-downcase %_1244)
      (string-downcase %_1245))))
(define string-ci>=?
  (lambda (%_1246 %_1247)
    (string>=?
      (string-downcase %_1246)
      (string-downcase %_1247))))
(define string-ci<=?
  (lambda (%_1248 %_1249)
    (string<=?
      (string-downcase %_1248)
      (string-downcase %_1249))))
(define substring
  (letrec ((%_1250
             (lambda (%_1255 %_1256 %_1257 %_1258 %_1259)
               (if (< %_1258 %_1259)
                 (begin
                   (string-set!
                     %_1256
                     %_1257
                     (string-ref %_1255 %_1258))
                   (%_1250
                     %_1255
                     %_1256
                     (+ %_1257 '1)
                     (+ %_1258 '1)
                     %_1259))
                 (void)))))
    (lambda (%_1251 %_1252 %_1253)
      ((lambda (%_1254)
         (begin
           (%_1250 %_1251 %_1254 '0 %_1252 %_1253)
           %_1254))
       (make-string (- %_1253 %_1252))))))
(define format
  (letrec ((%_1260
             (lambda (%_1263 %_1264 %_1265)
               (if (null? %_1263)
                 (get-output-string %_1265)
                 (if (eq? (car %_1263) '#\~)
                   (begin
                     ((lambda (%_1266)
                        (if (memv %_1266 '(#\s))
                          (write (car %_1264) %_1265)
                          (if (memv %_1266 '(#\a))
                            (display (car %_1264) %_1265)
                            (if (memv %_1266 '(#\%))
                              (display '#\newline %_1265)
                              (if (memv %_1266 '(#\~))
                                (display '#\~ %_1265)
                                (void))))))
                      (cadr %_1263))
                     (%_1260
                       (cddr %_1263)
                       (if (not (null? %_1264)) (cdr %_1264) '())
                       %_1265))
                   (begin
                     (display (car %_1263) %_1265)
                     (%_1260 (cdr %_1263) %_1264 %_1265)))))))
    (lambda (%_1262 . %_1261)
      (%_1260
        (string->list %_1262)
        %_1261
        (open-output-string)))))
(define error
  ((lambda (%_1267)
     (lambda %_1268
       ((lambda (%_1269)
          (begin
            (if (null? %_1268)
              (void)
              (if (if (not (null? %_1268))
                    (symbol? (car %_1268))
                    '#f)
                (begin
                  (set! %_1269
                    (cons (cons 'location (car %_1268)) %_1269))
                  (set! %_1268 (cdr %_1268)))
                (if (not (car %_1268))
                  (set! %_1268 (cdr %_1268))
                  (void))))
            ((lambda (%_1270)
               (begin
                 (set! %_1268 (cdr %_1268))
                 (if (null? %_1268)
                   (if %_1270
                     (set! %_1269
                       (cons (cons 'message %_1270) %_1269))
                     (void))
                   (if (string? %_1270)
                     (set! %_1269
                       (cons (cons 'message
                                   (apply format (cons %_1270 %_1268)))
                             %_1269))
                     (error 'error
                            '"cannot specify arguments to a non format-string error.")))))
             (if (not (null? %_1268)) (car %_1268) '#f))
            (%_1267 %_1269)))
        '())))
   error))
(define list-ref
  (lambda (%_1271 %_1272)
    (if (zero? %_1272)
      (car %_1271)
      (list-ref (cdr %_1271) (- %_1272 '1)))))
(define values
  (lambda %_1273
    (call-with-current-continuation
      (lambda (%_1274) (apply %_1274 %_1273)))))
