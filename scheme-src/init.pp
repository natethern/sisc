(define for-each
  (lambda (%_921 . %_920)
    (if (null? %_920)
      (error 'for-each
             '"invalid number of arguments to procedure for-each")
      (if (not (null? (car %_920)))
        (begin
          (apply %_921 (map car %_920))
          (apply for-each (cons %_921 (map cdr %_920))))
        (void)))))
(define exit (lambda () '#!eof))
(define eof-object?
  (lambda (%_922) (eq? %_922 '#!eof)))
(define not (lambda (%_923) (if %_923 '#f '#t)))
(define eqv? eq?)
(define newline
  (lambda %_928
    (apply display (cons '#\newline %_928))))
(define map (void))
((lambda (%_929)
   (begin
     (set! %_929
       ((lambda (%_930)
          (begin
            (set! %_930
              (lambda (%_934 %_935 %_936 %_937)
                (if (null? %_937)
                  %_935
                  (begin
                    (set-cdr! %_936 (cons (%_934 (car %_937)) '()))
                    (%_930 %_934 %_935 (cdr %_936) (cdr %_937))))))
            (lambda (%_931 %_932)
              (if (null? %_932)
                '()
                ((lambda (%_933)
                   (%_930 %_931 %_933 %_933 (cdr %_932)))
                 (cons (%_931 (car %_932)) '()))))))
        #f))
     (set! map %_929)))
 #f)
(define compose
  (lambda %_938
    (if (null? %_938)
      (lambda (%_942) %_942)
      ((lambda (%_939 %_940)
         (lambda (%_941) (%_939 (%_940 %_941))))
       (car %_938)
       (apply compose (cdr %_938))))))
(define compose2
  (lambda (%_943 %_944)
    (lambda (%_945) (%_943 (%_944 %_945)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
((lambda (%_946 %_947)
   (begin
     (set! %_946
       (lambda (%_960 %_961 %_962)
         (if (null? %_962)
           '#f
           (if (%_960 (caar %_962) %_961)
             (car %_962)
             (%_946 %_960 %_961 (cdr %_962))))))
     (set! %_947
       (lambda (%_963 %_964 %_965)
         (if (null? %_965)
           '#f
           (if (%_963 (car %_965) %_964)
             %_965
             (%_947 %_963 %_964 (cdr %_965))))))
     (begin
       (set! assq
         (lambda (%_948 %_949) (%_946 eq? %_948 %_949)))
       (set! assv
         (lambda (%_950 %_951) (%_946 eqv? %_950 %_951)))
       (set! assoc
         (lambda (%_952 %_953) (%_946 equal? %_952 %_953)))
       (set! memq
         (lambda (%_954 %_955) (%_947 eq? %_954 %_955)))
       (set! memv
         (lambda (%_956 %_957) (%_947 eqv? %_956 %_957)))
       (set! member
         (lambda (%_958 %_959) (%_947 equal? %_958 %_959))))))
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
  (lambda (%_966 %_967)
    (if (null? %_966)
      %_967
      (cons (car %_966) (append2 (cdr %_966) %_967)))))
(define append append2)
(define list->string
  (lambda (%_968)
    ((lambda (%_969)
       (begin
         (set! %_969
           (lambda (%_970 %_971 %_972)
             (if (null? %_970)
               %_971
               (begin
                 (string-set! %_971 %_972 (car %_970))
                 (%_969 (cdr %_970) %_971 (+ %_972 '1))))))
         (%_969 %_968 (make-string (length %_968)) '0)))
     #f)))
(define string->list
  ((lambda (%_973)
     (begin
       (set! %_973
         (lambda (%_975 %_976 %_977)
           (if (< %_977 '0)
             %_976
             (%_973 %_975
                    (cons (string-ref %_975 %_977) %_976)
                    (- %_977 '1)))))
       (lambda (%_974)
         (%_973 %_974 '() (- (string-length %_974) '1)))))
   #f))
(define list->vector
  ((lambda (%_978)
     (begin
       (set! %_978
         (lambda (%_980 %_981 %_982)
           (if (null? %_980)
             %_981
             (begin
               (vector-set! %_981 %_982 (car %_980))
               (%_978 (cdr %_980) %_981 (+ %_982 '1))))))
       (lambda (%_979)
         (if (not (circular? %_979))
           (%_978 %_979 (make-vector (length %_979)) '0)
           (error 'list->vector
                  '"cannot convert a circular list"
                  %_979)))))
   #f))
(define vector
  (lambda %_983 (list->vector %_983)))
(define string
  (lambda %_984 (list->string %_984)))
(define detect-os
  (lambda ()
    ((lambda (%_985)
       (if (> (string-length %_985) '3)
         (if (equal? (substring %_985 '0 '3) '"mac")
           'macos
           (if (equal? (substring %_985 '0 '3) '"win")
             'ms-dos
             (if (equal? (substring %_985 '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring %_985 '0 '3) '"uni")
                 'unix
                 (if (equal? (substring %_985 '0 '3) '"lin")
                   'unix
                   (if (equal? (substring %_985 '0 '4) '"os/")
                     'os2
                     (if (equal? (substring %_985 '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase
       (getprop 'os.name '*environment-variables*)))))
(define current-directory (void))
((lambda (%_986 %_987 %_988)
   (begin
     (set! %_986
       (lambda %_1003
         (if (null? %_1003)
           (getprop 'current-directory '*sisc*)
           (putprop 'current-directory '*sisc* (car %_1003)))))
     (set! %_987
       (lambda (%_1004)
         (if ((lambda (%_1005)
                (if %_1005
                  %_1005
                  (if (memq (detect-os) '(ms-dos windows))
                    (if (> (string-length %_1004) '1)
                      (eq? (string-ref %_1004 '1) '#\:)
                      '#f)
                    '#f)))
              (absolute-path? %_1004))
           %_1004
           (make-path (%_986) %_1004))))
     (set! %_988
       (lambda (%_1006 %_1007)
         (if (eq? (file-type %_1006) %_1007)
           '#t
           (error 'file-type
                  '"~s is not of type ~s"
                  %_1006
                  %_1007))))
     ((lambda (%_992 %_991 %_990 %_989)
        (begin
          (set! %_992
            ((lambda (%_993)
               (lambda (%_994) (%_993 (%_987 %_994))))
             load))
          (set! %_991
            ((lambda (%_995)
               (lambda (%_996)
                 ((lambda (%_997)
                    (if (not (memq (file-type %_997) '(no-file file)))
                      (error 'open-output-file
                             '"~s points to a directory"
                             %_997)
                      (%_995 %_997)))
                  (%_987 %_996))))
             open-output-file))
          (set! %_990
            ((lambda (%_998)
               (lambda (%_999)
                 ((lambda (%_1000)
                    (begin (%_988 %_1000 'file) (%_998 %_1000)))
                  (%_987 %_999))))
             open-input-file))
          (set! %_989
            (lambda %_1001
              (if (null? %_1001)
                (%_986)
                ((lambda (%_1002)
                   (begin (%_988 %_1002 'directory) (%_986 %_1002)))
                 (%_987 (car %_1001))))))
          (begin
            (%_986 '".")
            (set! load %_992)
            (set! current-directory %_989)
            (set! open-input-file %_990)
            (set! open-output-file %_991))))
      #f
      #f
      #f
      #f)))
 #f
 #f
 #f)
(define load-module
  (lambda (%_1008)
    ((lambda (%_1009)
       ((lambda (%_1010)
          ((lambda ()
             (for-each
               (lambda (%_1011)
                 (putprop
                   %_1011
                   '*toplevel*
                   (get-native-library-binding %_1009 %_1011)))
               %_1010))))
        (get-native-library-binding-names %_1009)))
     (load-native-library %_1008))))
(define reverse
  ((lambda (%_1012)
     (begin
       (set! %_1012
         (lambda (%_1014 %_1015)
           (if (null? %_1014)
             %_1015
             (%_1012 (cdr %_1014) (cons (car %_1014) %_1015)))))
       (lambda (%_1013) (%_1012 %_1013 '()))))
   #f))
(define remove
  (lambda (%_1016 %_1017)
    (if (null? %_1017)
      '()
      (if (equal? (car %_1017) %_1016)
        (remove %_1016 (cdr %_1017))
        (cons (car %_1017) (remove %_1016 (cdr %_1017)))))))
(define append
  ((lambda (%_1018)
     (begin
       (set! %_1018
         (lambda (%_1021 . %_1020)
           (if (null? %_1020)
             %_1021
             (if (null? %_1021)
               (apply %_1018 %_1020)
               (apply %_1018
                      (cons (append2 %_1021 (car %_1020)) (cdr %_1020)))))))
       (lambda %_1019
         (if (null? %_1019)
           '()
           (if (null? (cdr %_1019))
             (car %_1019)
             (apply %_1018 (cons (car %_1019) (cdr %_1019))))))))
   #f))
(define map
  ((lambda (%_1022 %_1023)
     (begin
       (set! %_1022 map)
       (set! %_1023
         (lambda (%_1027 %_1028 %_1029 %_1030)
           (if (null? (car %_1028))
             (if (andmap null? %_1028)
               %_1029
               (error 'map '"lists are not of equal length"))
             ((lambda (%_1031 %_1032)
                (begin
                  (if (not (null? %_1030))
                    (set-cdr! %_1030 %_1031)
                    (void))
                  (if (null? %_1029)
                    (%_1023 %_1027 %_1032 %_1031 %_1031)
                    (%_1023 %_1027 %_1032 %_1029 %_1031))))
              (cons (apply %_1027 (%_1022 car %_1028)) '())
              (%_1022 cdr %_1028)))))
       (lambda (%_1026 %_1025 . %_1024)
         (if (null? %_1024)
           (%_1022 %_1026 %_1025)
           (%_1023 %_1026 (cons %_1025 %_1024) '() '())))))
   #f
   #f))
(define circular?
  ((lambda (%_1033)
     (begin
       (set! %_1033
         (lambda (%_1035 %_1036)
           (if ((lambda (%_1038)
                  (if %_1038 %_1038 (null? %_1036)))
                (null? %_1035))
             '#f
             (if (if (pair? %_1036) (null? (cdr %_1036)) '#f)
               '#f
               (if ((lambda (%_1037)
                      (if %_1037 %_1037 (not (pair? (cdr %_1036)))))
                    (not (pair? %_1036)))
                 '#f
                 (if (eq? %_1035 %_1036)
                   '#t
                   (%_1033 (cdr %_1035) (cddr %_1036))))))))
       (lambda (%_1034)
         (if (pair? %_1034)
           (%_1033 %_1034 (cdr %_1034))
           '#f))))
   #f))
(define list?
  ((lambda (%_1039)
     (begin
       (set! %_1039
         (lambda (%_1042 %_1043)
           ((lambda (%_1044)
              (if %_1044
                %_1044
                ((lambda (%_1045)
                   (if %_1045
                     %_1045
                     (if (pair? %_1043)
                       ((lambda (%_1046)
                          (if %_1046
                            %_1046
                            (if (not (eq? %_1042 %_1043))
                              (%_1039 (cdr %_1042) (cddr %_1043))
                              '#f)))
                        (null? (cdr %_1043)))
                       '#f)))
                 (null? %_1043))))
            (null? %_1042))))
       (lambda (%_1040)
         ((lambda (%_1041)
            (if %_1041
              %_1041
              (if (pair? %_1040)
                (%_1039 %_1040 (cdr %_1040))
                '#f)))
          (null? %_1040)))))
   #f))
(define expt
  (lambda (%_1047 %_1048)
    (if (if (integer? %_1048) (= %_1047 '2) '#f)
      (ashl '1 %_1048)
      (((lambda (%_1049)
          (begin
            (set! %_1049
              (lambda (%_1050 %_1051 %_1052)
                (if (zero? %_1050)
                  %_1051
                  (%_1049
                    (quotient %_1050 '2)
                    (if (odd? %_1050) (* %_1051 %_1052) %_1051)
                    (* %_1052 %_1052)))))
            %_1049))
        #f)
       %_1048
       '1
       %_1047))))
(define modpow
  (lambda (%_1053 %_1054 %_1055)
    ((lambda (%_1056)
       (if (= %_1054 '1)
         (modulo %_1053 %_1055)
         (if (even? %_1054)
           ((lambda (%_1058)
              (modulo (* %_1058 %_1058) %_1055))
            (modpow %_1053 (/ %_1054 '2) %_1055))
           ((lambda (%_1057)
              (begin
                (set! %_1057 (modulo (* %_1057 %_1057) %_1055))
                (modulo (* %_1053 %_1057) %_1055)))
            (modpow %_1053 (/ (- %_1054 '1) '2) %_1055)))))
     '0)))
(define integer?
  ((lambda (%_1059)
     (lambda (%_1060)
       ((lambda (%_1061)
          (if %_1061
            %_1061
            (if (real? %_1060) (= (round %_1060) %_1060) '#f)))
        (%_1059 %_1060))))
   integer?))
(define real?
  ((lambda (%_1062)
     (lambda (%_1063) (not (%_1062 %_1063))))
   complex?))
(define complex? number?)
(define abs
  (lambda (%_1064)
    (if (not (real? %_1064))
      ((lambda (%_1065 %_1066)
         (sqrt (+ (* %_1065 %_1065) (* %_1066 %_1066))))
       (real-part %_1064)
       (imag-part %_1064))
      (if (< %_1064 '0) (- %_1064) %_1064))))
(define min (void))
(define max (void))
((lambda (%_1067)
   (begin
     (set! %_1067
       (lambda (%_1070 %_1071 %_1072 %_1073)
         (if (null? %_1072)
           (if (if %_1073 (exact? %_1071) '#f)
             (exact->inexact %_1071)
             %_1071)
           (if (%_1070 (car %_1072) %_1071)
             (%_1067
               %_1070
               (car %_1072)
               (cdr %_1072)
               ((lambda (%_1074)
                  (if %_1074 %_1074 (inexact? (car %_1072))))
                %_1073))
             (%_1067 %_1070 %_1071 (cdr %_1072) %_1073)))))
     (begin
       (set! min
         (lambda %_1068
           (if (null? %_1068)
             '0
             (%_1067
               <
               (car %_1068)
               (cdr %_1068)
               (inexact? (car %_1068))))))
       (set! max
         (lambda %_1069
           (if (null? %_1069)
             '0
             (%_1067
               >
               (car %_1069)
               (cdr %_1069)
               (inexact? (car %_1069)))))))))
 #f)
(define negative?
  (lambda (%_1075) (< %_1075 '0)))
(define positive?
  (lambda (%_1076) (> %_1076 '0)))
(define even?
  (lambda (%_1077) (= '0 (modulo %_1077 '2))))
(define odd?
  (lambda (%_1078) (not (even? %_1078))))
(define zero? (lambda (%_1079) (= %_1079 '0)))
(define add1 (lambda (%_1080) (+ %_1080 '1)))
(define sub1 (lambda (%_1081) (- %_1081 '1)))
(define >= (void))
(define <= (void))
((lambda (%_1082 %_1083)
   (begin
     (set! <=
       (%_1082
         (lambda (%_1084 %_1085)
           ((lambda (%_1086)
              (if %_1086 %_1086 (= %_1084 %_1085)))
            (< %_1084 %_1085)))
         %_1083
         '#t))
     (set! >=
       (%_1082
         (lambda (%_1087 %_1088)
           ((lambda (%_1089)
              (if %_1089 %_1089 (= %_1087 %_1088)))
            (> %_1087 %_1088)))
         %_1083
         '#t))))
 (lambda (%_1090 %_1091 %_1092)
   (lambda %_1093
     (((lambda (%_1094)
         (begin
           (set! %_1094
             (lambda (%_1095)
               (if (null? %_1095)
                 %_1092
                 (if (null? (cdr %_1095))
                   %_1092
                   (%_1091
                     (%_1090 (car %_1095) (cadr %_1095))
                     (%_1094 (cdr %_1095)))))))
           %_1094))
       #f)
      %_1093)))
 (lambda (%_1096 %_1097) (if %_1096 %_1097 '#f)))
((lambda (%_1098)
   (begin
     (set! >= (%_1098 > >=))
     (set! <= (%_1098 < <=))))
 (lambda (%_1099 %_1100)
   (lambda %_1101
     ((lambda (%_1102)
        (if %_1102
          %_1102
          ((lambda (%_1103)
             (if %_1103
               %_1103
               (if ((lambda (%_1104)
                      (if %_1104
                        %_1104
                        (%_1099 (car %_1101) (cadr %_1101))))
                    (= (car %_1101) (cadr %_1101)))
                 (apply %_1100 (cdr %_1101))
                 '#f)))
           (null? (cdr %_1101)))))
      (null? %_1101)))))
(define gcd
  (lambda %_1105
    (if (null? %_1105)
      '0
      (if (null? (cdr %_1105))
        (car %_1105)
        (_gcd (car %_1105) (cadr %_1105))))))
(define lcm
  (lambda %_1106
    (if (null? %_1106)
      '1
      (if (null? (cdr %_1106))
        (car %_1106)
        (_lcm (car %_1106) (cadr %_1106))))))
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
  (lambda %_1107
    (if (null? %_1107)
      '""
      (if (null? (cdr %_1107))
        (car %_1107)
        (apply string-append
               (_string-append (car %_1107) (cadr %_1107))
               (cddr %_1107))))))
(define char-downcase
  ((lambda (%_1108)
     ((lambda (%_1109)
        ((lambda (%_1110)
           ((lambda ()
              (lambda (%_1111)
                ((lambda (%_1112)
                   (if (if (>= %_1112 %_1108) (<= %_1112 %_1109) '#f)
                     (integer->char (+ %_1112 %_1110))
                     %_1111))
                 (char->integer %_1111))))))
         (- (char->integer '#\a) %_1108)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_1113)
     ((lambda (%_1114)
        ((lambda (%_1115)
           ((lambda ()
              (lambda (%_1116)
                ((lambda (%_1117)
                   (if (if (>= %_1117 %_1113) (<= %_1117 %_1114) '#f)
                     (integer->char (- %_1117 %_1115))
                     %_1116))
                 (char->integer %_1116))))))
         (- %_1113 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_1118 %_1119)
    (> (char->integer %_1118) (char->integer %_1119))))
(define char<?
  (lambda (%_1120 %_1121)
    (< (char->integer %_1120) (char->integer %_1121))))
(define char=? eq?)
(define char>=?
  (lambda (%_1122 %_1123)
    ((lambda (%_1124)
       (if %_1124 %_1124 (char=? %_1122 %_1123)))
     (char>? %_1122 %_1123))))
(define char<=?
  (lambda (%_1125 %_1126)
    ((lambda (%_1127)
       (if %_1127 %_1127 (char=? %_1125 %_1126)))
     (char<? %_1125 %_1126))))
(define char-ci>?
  (lambda (%_1128 %_1129)
    (char>?
      (char-downcase %_1128)
      (char-downcase %_1129))))
(define char-ci<?
  (lambda (%_1130 %_1131)
    (char<?
      (char-downcase %_1130)
      (char-downcase %_1131))))
(define char-ci=?
  (lambda (%_1132 %_1133)
    (char=?
      (char-downcase %_1132)
      (char-downcase %_1133))))
(define char-ci>=?
  (lambda (%_1134 %_1135)
    ((lambda (%_1136)
       (if %_1136 %_1136 (char-ci=? %_1134 %_1135)))
     (char-ci>? %_1134 %_1135))))
(define char-ci<=?
  (lambda (%_1137 %_1138)
    ((lambda (%_1139)
       (if %_1139 %_1139 (char-ci=? %_1137 %_1138)))
     (char-ci<? %_1137 %_1138))))
(define char-alphabetic?
  (lambda (%_1140)
    (if (char-ci>=? %_1140 '#\a)
      (char-ci<=? %_1140 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_1141)
    (if (char-ci>=? %_1141 '#\0)
      (char-ci<=? %_1141 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_1142)
    (if (memq %_1142 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_1143)
    (if (char-alphabetic? %_1143)
      (char<? %_1143 '#\a)
      '#f)))
(define char-lower-case?
  (lambda (%_1144)
    (if (char-alphabetic? %_1144)
      (char>? %_1144 '#\z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
((lambda (%_1145)
   (begin
     (set! %_1145
       (lambda (%_1150 %_1151 %_1152 %_1153 %_1154)
         (if (< %_1153 %_1154)
           (begin
             (string-set!
               %_1151
               %_1153
               (%_1152 (string-ref %_1150 %_1153)))
             (%_1145
               %_1150
               %_1151
               %_1152
               (+ %_1153 '1)
               %_1154))
           %_1151)))
     (begin
       (set! string-downcase
         (lambda (%_1146)
           ((lambda (%_1147)
              (%_1145
                %_1146
                %_1147
                char-downcase
                '0
                (string-length %_1146)))
            (make-string (string-length %_1146)))))
       (set! string-upcase
         (lambda (%_1148)
           ((lambda (%_1149)
              (%_1145
                %_1148
                %_1149
                char-upcase
                '0
                (string-length %_1148)))
            (make-string (string-length %_1148))))))))
 #f)
(define string=? equal?)
(define string<?
  ((lambda (%_1155)
     (begin
       (set! %_1155
         (lambda (%_1158 %_1159)
           (if (null? %_1158)
             (not (null? %_1159))
             (if (null? %_1159)
               '#f
               ((lambda (%_1160 %_1161)
                  (if (char<? %_1160 %_1161)
                    '#t
                    (if (char>? %_1160 %_1161)
                      '#f
                      (%_1155 (cdr %_1158) (cdr %_1159)))))
                (car %_1158)
                (car %_1159))))))
       (lambda (%_1156 %_1157)
         (%_1155
           (string->list %_1156)
           (string->list %_1157)))))
   #f))
(define string>?
  ((lambda (%_1162)
     (begin
       (set! %_1162
         (lambda (%_1165 %_1166)
           (if (null? %_1166)
             (not (null? %_1165))
             (if (null? %_1165)
               '#f
               ((lambda (%_1167 %_1168)
                  (if (char>? %_1167 %_1168)
                    '#t
                    (if (char<? %_1167 %_1168)
                      '#f
                      (%_1162 (cdr %_1165) (cdr %_1166)))))
                (car %_1165)
                (car %_1166))))))
       (lambda (%_1163 %_1164)
         (%_1162
           (string->list %_1163)
           (string->list %_1164)))))
   #f))
(define string<=?
  (lambda (%_1169 %_1170)
    ((lambda (%_1171)
       (if %_1171 %_1171 (string=? %_1169 %_1170)))
     (string<? %_1169 %_1170))))
(define string>=?
  (lambda (%_1172 %_1173)
    ((lambda (%_1174)
       (if %_1174 %_1174 (string=? %_1172 %_1173)))
     (string>? %_1172 %_1173))))
(define string-ci=?
  (lambda (%_1175 %_1176)
    (string=?
      (string-downcase %_1175)
      (string-downcase %_1176))))
(define string-ci<?
  (lambda (%_1177 %_1178)
    (string<?
      (string-downcase %_1177)
      (string-downcase %_1178))))
(define string-ci>?
  (lambda (%_1179 %_1180)
    (string>?
      (string-downcase %_1179)
      (string-downcase %_1180))))
(define string-ci>=?
  (lambda (%_1181 %_1182)
    (string>=?
      (string-downcase %_1181)
      (string-downcase %_1182))))
(define string-ci<=?
  (lambda (%_1183 %_1184)
    (string<=?
      (string-downcase %_1183)
      (string-downcase %_1184))))
(define substring
  ((lambda (%_1185)
     (begin
       (set! %_1185
         (lambda (%_1190 %_1191 %_1192 %_1193 %_1194)
           (if (< %_1193 %_1194)
             (begin
               (string-set!
                 %_1191
                 %_1192
                 (string-ref %_1190 %_1193))
               (%_1185
                 %_1190
                 %_1191
                 (+ %_1192 '1)
                 (+ %_1193 '1)
                 %_1194))
             (void))))
       (lambda (%_1186 %_1187 %_1188)
         ((lambda (%_1189)
            (begin
              (%_1185 %_1186 %_1189 '0 %_1187 %_1188)
              %_1189))
          (make-string (- %_1188 %_1187))))))
   #f))
(define format
  ((lambda (%_1195)
     (begin
       (set! %_1195
         (lambda (%_1198 %_1199 %_1200)
           (if (null? %_1198)
             (get-output-string %_1200)
             (if (eq? (car %_1198) '#\~)
               (begin
                 ((lambda (%_1201)
                    (if (memv %_1201 '(#\s))
                      (write (car %_1199) %_1200)
                      (if (memv %_1201 '(#\a))
                        (display (car %_1199) %_1200)
                        (if (memv %_1201 '(#\%))
                          (display '#\newline %_1200)
                          (if (memv %_1201 '(#\~))
                            (display '#\~ %_1200)
                            (void))))))
                  (cadr %_1198))
                 (%_1195
                   (cddr %_1198)
                   (if (not (null? %_1199)) (cdr %_1199) '())
                   %_1200))
               (begin
                 (display (car %_1198) %_1200)
                 (%_1195 (cdr %_1198) %_1199 %_1200))))))
       (lambda (%_1197 . %_1196)
         (%_1195
           (string->list %_1197)
           %_1196
           (open-output-string)))))
   #f))
(define error
  ((lambda (%_1202)
     (lambda %_1203
       ((lambda (%_1204)
          ((lambda (%_1205)
             ((lambda (%_1206)
                ((lambda ()
                   (if %_1204
                     (if %_1205
                       (%_1202
                         (format
                           '"Error in ~s: ~a"
                           %_1204
                           (apply format (cons %_1205 %_1206))))
                       (%_1202 (format '"Error in ~s." %_1204)))
                     (if %_1205
                       (if (string? %_1205)
                         (%_1202
                           (format
                             '"Error: ~a"
                             (apply format (cons %_1205 %_1206))))
                         (if (null? %_1206)
                           (%_1202 %_1205)
                           (error 'error
                                  '"cannot specify error arguments to a non format-string error.")))
                       (%_1202 '"Error."))))))
              (if (not %_1205)
                '()
                (if (not %_1204)
                  (if (not (null? %_1203))
                    (if (not (car %_1203))
                      (cddr %_1203)
                      (cdr %_1203))
                    (cdr %_1203))
                  (cddr %_1203)))))
           (if (not %_1204)
             (if (not (null? %_1203))
               (if (not (car %_1203))
                 (cadr %_1203)
                 (car %_1203))
               '#f)
             (if (not (null? (cdr %_1203))) (cadr %_1203) '#f))))
        (if (if (not (null? %_1203))
              (symbol? (car %_1203))
              '#f)
          (car %_1203)
          '#f))))
   error))
(define list-ref
  (lambda (%_1207 %_1208)
    (if (zero? %_1208)
      (car %_1207)
      (list-ref (cdr %_1207) (- %_1208 '1)))))
(define iota
  ((lambda (%_1209)
     (begin
       (set! %_1209
         (lambda (%_1211 %_1212)
           (if (> %_1211 %_1212)
             '()
             (cons %_1211 (%_1209 (+ %_1211 '1) %_1212)))))
       (lambda (%_1210) (%_1209 '0 %_1210))))
   #f))
(define values
  (lambda %_1213
    (call-with-current-continuation
      (lambda (%_1214) (apply %_1214 %_1213)))))
