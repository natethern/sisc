(define for-each
  (lambda (%_877 . %_876)
    (if (null? %_876)
      (error 'for-each
             '"invalid number of arguments to procedure for-each")
      (if (not (null? (car %_876)))
        (begin
          (apply %_877 (map car %_876))
          (apply for-each (cons %_877 (map cdr %_876))))
        (void)))))
(define exit (lambda () '#!eof))
(define eof-object?
  (lambda (%_878) (eq? %_878 '#!eof)))
(define not (lambda (%_879) (if %_879 '#f '#t)))
(define eqv?
  (lambda (%_880 %_881)
    ((lambda (%_882)
       (if %_882
         %_882
         (if (number? %_880)
           (if (number? %_881)
             (if ((lambda (%_883)
                    (if %_883
                      %_883
                      (if (inexact? %_880) (inexact? %_881) '#f)))
                  (if (exact? %_880) (exact? %_881) '#f))
               (= %_880 %_881)
               '#f)
             '#f)
           '#f)))
     (eq? %_880 %_881))))
(define newline
  (lambda %_884
    (apply display (cons '#\newline %_884))))
(define map (void))
((lambda (%_885)
   (begin
     (set! %_885
       ((lambda (%_886)
          (begin
            (set! %_886
              (lambda (%_887 %_888 %_889 %_890)
                (if (null? %_890)
                  %_888
                  (begin
                    (set-cdr! %_889 (cons (%_887 (car %_890)) '()))
                    (%_886 %_887 %_888 (cdr %_889) (cdr %_890))))))
            (lambda (%_891 %_892)
              (if (null? %_892)
                '()
                ((lambda (%_893)
                   (%_886 %_891 %_893 %_893 (cdr %_892)))
                 (cons (%_891 (car %_892)) '()))))))
        #f))
     (set! map %_885)))
 #f)
(define compose
  (lambda %_894
    (if (null? %_894)
      (lambda (%_895) %_895)
      ((lambda (%_896 %_897)
         (lambda (%_898) (%_896 (%_897 %_898))))
       (car %_894)
       (apply compose (cdr %_894))))))
(define compose2
  (lambda (%_899 %_900)
    (lambda (%_901) (%_899 (%_900 %_901)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
((lambda (%_902 %_903)
   (begin
     (set! %_902
       (lambda (%_904 %_905 %_906)
         (if (null? %_906)
           '#f
           (if (%_904 (caar %_906) %_905)
             (car %_906)
             (%_902 %_904 %_905 (cdr %_906))))))
     (set! %_903
       (lambda (%_907 %_908 %_909)
         (if (null? %_909)
           '#f
           (if (%_907 (car %_909) %_908)
             %_909
             (%_903 %_907 %_908 (cdr %_909))))))
     (begin
       (set! assq
         (lambda (%_910 %_911) (%_902 eq? %_910 %_911)))
       (set! assv
         (lambda (%_912 %_913) (%_902 eqv? %_912 %_913)))
       (set! assoc
         (lambda (%_914 %_915) (%_902 equal? %_914 %_915)))
       (set! memq
         (lambda (%_916 %_917) (%_903 eq? %_916 %_917)))
       (set! memv
         (lambda (%_918 %_919) (%_903 eqv? %_918 %_919)))
       (set! member
         (lambda (%_920 %_921) (%_903 equal? %_920 %_921))))))
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
  (lambda (%_922 %_923)
    (if (null? %_922)
      %_923
      (cons (car %_922) (append2 (cdr %_922) %_923)))))
(define append append2)
(define list->string
  (lambda (%_924)
    ((lambda (%_925)
       (begin
         (set! %_925
           (lambda (%_926 %_927 %_928)
             (if (null? %_926)
               %_927
               (begin
                 (string-set! %_927 %_928 (car %_926))
                 (%_925 (cdr %_926) %_927 (+ %_928 '1))))))
         (%_925 %_924 (make-string (length %_924)) '0)))
     #f)))
(define string->list
  ((lambda (%_929)
     (begin
       (set! %_929
         (lambda (%_930 %_931 %_932)
           (if (< %_932 '0)
             %_931
             (%_929 %_930
                    (cons (string-ref %_930 %_932) %_931)
                    (- %_932 '1)))))
       (lambda (%_933)
         (%_929 %_933 '() (- (string-length %_933) '1)))))
   #f))
(define list->vector
  ((lambda (%_934)
     (begin
       (set! %_934
         (lambda (%_935 %_936 %_937)
           (if (null? %_935)
             %_936
             (begin
               (vector-set! %_936 %_937 (car %_935))
               (%_934 (cdr %_935) %_936 (+ %_937 '1))))))
       (lambda (%_938)
         (if (not (circular? %_938))
           (%_934 %_938 (make-vector (length %_938)) '0)
           (error 'list->vector
                  '"cannot convert a circular list"
                  %_938)))))
   #f))
(define vector
  (lambda %_939 (list->vector %_939)))
(define string
  (lambda %_940 (list->string %_940)))
(define detect-os
  (lambda ()
    ((lambda (%_941)
       (if (> (string-length %_941) '3)
         (if (equal? (substring %_941 '0 '3) '"mac")
           'macos
           (if (equal? (substring %_941 '0 '3) '"win")
             'ms-dos
             (if (equal? (substring %_941 '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring %_941 '0 '3) '"uni")
                 'unix
                 (if (equal? (substring %_941 '0 '3) '"lin")
                   'unix
                   (if (equal? (substring %_941 '0 '4) '"os/")
                     'os2
                     (if (equal? (substring %_941 '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase
       (getprop 'os.name '*environment-variables*)))))
(define current-directory (void))
((lambda (%_942 %_943 %_944)
   (begin
     (set! %_942
       (lambda %_945
         (if (null? %_945)
           (getprop 'current-directory '*sisc*)
           (putprop 'current-directory '*sisc* (car %_945)))))
     (set! %_943
       (lambda (%_946)
         (if ((lambda (%_947)
                (if %_947
                  %_947
                  (if (memq (detect-os) '(ms-dos windows))
                    (if (> (string-length %_946) '1)
                      (eq? (string-ref %_946 '1) '#\:)
                      '#f)
                    '#f)))
              (absolute-path? %_946))
           %_946
           (make-path (%_942) %_946))))
     (set! %_944
       (lambda (%_948 %_949)
         (if (eq? (file-type %_948) %_949)
           '#t
           (error 'file-type
                  '"~s is not of type ~s"
                  %_948
                  %_949))))
     ((lambda (%_953 %_952 %_951 %_950)
        (begin
          (set! %_953
            ((lambda (%_954)
               (lambda (%_955) (%_954 (%_943 %_955))))
             load))
          (set! %_952
            ((lambda (%_956)
               (lambda (%_957)
                 ((lambda (%_958)
                    (if (not (memq (file-type %_958) '(no-file file)))
                      (error 'open-output-file
                             '"~s points to a directory"
                             %_958)
                      (%_956 %_958)))
                  (%_943 %_957))))
             open-output-file))
          (set! %_951
            ((lambda (%_959)
               (lambda (%_960)
                 ((lambda (%_961)
                    (begin (%_944 %_961 'file) (%_959 %_961)))
                  (%_943 %_960))))
             open-input-file))
          (set! %_950
            (lambda %_962
              (if (null? %_962)
                (%_942)
                ((lambda (%_963)
                   (begin (%_944 %_963 'directory) (%_942 %_963)))
                 (%_943 (car %_962))))))
          (begin
            (%_942 '".")
            (set! load %_953)
            (set! current-directory %_950)
            (set! open-input-file %_951)
            (set! open-output-file %_952))))
      #f
      #f
      #f
      #f)))
 #f
 #f
 #f)
(define load-module
  (lambda (%_964)
    ((lambda (%_965)
       ((lambda (%_966)
          ((lambda ()
             (for-each
               (lambda (%_967)
                 (putprop
                   %_967
                   '*toplevel*
                   (get-native-library-binding %_965 %_967)))
               %_966))))
        (get-native-library-binding-names %_965)))
     (load-native-library %_964))))
(define reverse
  ((lambda (%_968)
     (begin
       (set! %_968
         (lambda (%_969 %_970)
           (if (null? %_969)
             %_970
             (%_968 (cdr %_969) (cons (car %_969) %_970)))))
       (lambda (%_971) (%_968 %_971 '()))))
   #f))
(define remove
  (lambda (%_972 %_973)
    (if (null? %_973)
      '()
      (if (equal? (car %_973) %_972)
        (remove %_972 (cdr %_973))
        (cons (car %_973) (remove %_972 (cdr %_973)))))))
(define append
  ((lambda (%_974)
     (begin
       (set! %_974
         (lambda (%_976 . %_975)
           (if (null? %_975)
             %_976
             (if (null? %_976)
               (apply %_974 %_975)
               (apply %_974
                      (cons (append2 %_976 (car %_975)) (cdr %_975)))))))
       (lambda %_977
         (if (null? %_977)
           '()
           (if (null? (cdr %_977))
             (car %_977)
             (apply %_974 (cons (car %_977) (cdr %_977))))))))
   #f))
(define map
  ((lambda (%_978 %_979)
     (begin
       (set! %_978 map)
       (set! %_979
         (lambda (%_980 %_981 %_982 %_983)
           (if (null? (car %_981))
             (if (andmap null? %_981)
               %_982
               (error 'map '"lists are not of equal length"))
             ((lambda (%_984 %_985)
                (begin
                  (if (not (null? %_983))
                    (set-cdr! %_983 %_984)
                    (void))
                  (if (null? %_982)
                    (%_979 %_980 %_985 %_984 %_984)
                    (%_979 %_980 %_985 %_982 %_984))))
              (cons (apply %_980 (%_978 car %_981)) '())
              (%_978 cdr %_981)))))
       (lambda (%_988 %_987 . %_986)
         (if (null? %_986)
           (%_978 %_988 %_987)
           (%_979 %_988 (cons %_987 %_986) '() '())))))
   #f
   #f))
(define circular?
  (lambda (%_989)
    ((lambda (%_994 %_993 %_992 %_991 %_990)
       (begin
         (set! %_994
           (lambda (%_995 %_996)
             ((lambda (%_997)
                (begin
                  (set! %_997
                    (lambda (%_998 %_999)
                      ((lambda (%_1000)
                         (if %_1000
                           (%_994 (%_993 %_998) (%_993 %_1000))
                           '#f))
                       (%_993 %_999))))
                  (if %_996
                    (if (not (eq? (car %_996) (car %_995)))
                      (%_997 %_995 %_996)
                      (((lambda (%_1001)
                          (begin
                            (set! %_1001
                              (lambda (%_1002 %_1003)
                                ((lambda (%_1004)
                                   (if %_1004
                                     %_1004
                                     (if (if (= (cadr %_1002) (cadr %_1003))
                                           (eq? (caddr %_1002) (caddr %_1003))
                                           '#f)
                                       (%_1001 (cddr %_1002) (cddr %_1003))
                                       ((lambda (%_1005)
                                          (((lambda (%_1006)
                                              (begin
                                                (set! %_1006
                                                  (lambda (%_1007)
                                                    (if %_1007
                                                      ((lambda (%_1008)
                                                         (if %_1008
                                                           %_1008
                                                           (%_1006
                                                             (%_993 %_1007))))
                                                       (eq? (car %_1007)
                                                            %_1005))
                                                      (%_997 %_1002 %_1003))))
                                                %_1006))
                                            #f)
                                           (%_993 (list %_1005))))
                                        (car %_1002)))))
                                 (null? (cdr %_1002)))))
                            %_1001))
                        #f)
                       %_995
                       %_996))
                    '#f)))
              #f)))
         (set! %_993
           (lambda (%_1009)
             ((lambda (%_1010)
                (((lambda (%_1011)
                    (begin
                      (set! %_1011
                        (lambda (%_1012 %_1013 %_1014)
                          (if (>= %_1013 '0)
                            ((lambda (%_1015)
                               (if (%_990 %_1015)
                                 (cons %_1015 (cons %_1013 %_1014))
                                 (%_1011 %_1012 (- %_1013 '1) %_1014)))
                             (%_992 %_1012 %_1013))
                            ((lambda (%_1016)
                               (if (pair? %_1016)
                                 ((lambda (%_1017 %_1018)
                                    (%_1011 (car %_1018) (- %_1017 '1) %_1018))
                                  (car %_1016)
                                  (cdr %_1016))
                                 '#f))
                             (cdr %_1014)))))
                      %_1011))
                  #f)
                 %_1010
                 (- (%_991 %_1010) '1)
                 %_1009))
              (car %_1009))))
         (set! %_992
           (lambda (%_1019 %_1020)
             (if (vector? %_1019)
               (vector-ref %_1019 %_1020)
               (if (box? %_1019)
                 (unbox %_1019)
                 ((if (zero? %_1020) car cadr) %_1019)))))
         (set! %_991
           (lambda (%_1021)
             (if (pair? %_1021)
               '2
               (if (box? %_1021) '1 (vector-length %_1021)))))
         (set! %_990
           (lambda (%_1022)
             ((lambda (%_1023)
                (if %_1023
                  %_1023
                  ((lambda (%_1024)
                     (if %_1024
                       %_1024
                       (if (vector? %_1022)
                         (not (zero? (vector-length %_1022)))
                         '#f)))
                   (box? %_1022))))
              (pair? %_1022))))
         (if (%_990 %_989)
           ((lambda (%_1025) (%_994 %_1025 (%_993 %_1025)))
            (list %_989))
           '#f)))
     #f
     #f
     #f
     #f
     #f)))
(define list?
  ((lambda (%_1026)
     (begin
       (set! %_1026
         (lambda (%_1027 %_1028)
           ((lambda (%_1029)
              (if %_1029
                %_1029
                ((lambda (%_1030)
                   (if %_1030
                     %_1030
                     (if (pair? %_1028)
                       ((lambda (%_1031)
                          (if %_1031
                            %_1031
                            (if (not (eq? %_1027 %_1028))
                              (%_1026 (cdr %_1027) (cddr %_1028))
                              '#f)))
                        (null? (cdr %_1028)))
                       '#f)))
                 (null? %_1028))))
            (null? %_1027))))
       (lambda (%_1032)
         ((lambda (%_1033)
            (if %_1033
              %_1033
              (if (pair? %_1032)
                (%_1026 %_1032 (cdr %_1032))
                '#f)))
          (null? %_1032)))))
   #f))
(define expt
  (lambda (%_1034 %_1035)
    (if (if (integer? %_1035) (= %_1034 '2) '#f)
      (ashl '1 %_1035)
      (((lambda (%_1036)
          (begin
            (set! %_1036
              (lambda (%_1037 %_1038 %_1039)
                (if (zero? %_1037)
                  %_1038
                  (%_1036
                    (quotient %_1037 '2)
                    (if (odd? %_1037) (* %_1038 %_1039) %_1038)
                    (* %_1039 %_1039)))))
            %_1036))
        #f)
       %_1035
       '1
       %_1034))))
(define modpow
  (lambda (%_1040 %_1041 %_1042)
    ((lambda (%_1043)
       (if (= %_1041 '1)
         (modulo %_1040 %_1042)
         (if (even? %_1041)
           ((lambda (%_1044)
              (modulo (* %_1044 %_1044) %_1042))
            (modpow %_1040 (/ %_1041 '2) %_1042))
           ((lambda (%_1045)
              (begin
                (set! %_1045 (modulo (* %_1045 %_1045) %_1042))
                (modulo (* %_1040 %_1045) %_1042)))
            (modpow %_1040 (/ (- %_1041 '1) '2) %_1042)))))
     '0)))
(define integer?
  ((lambda (%_1046)
     (lambda (%_1047)
       ((lambda (%_1048)
          (if %_1048
            %_1048
            (if (real? %_1047) (= (round %_1047) %_1047) '#f)))
        (%_1046 %_1047))))
   integer?))
(define real?
  ((lambda (%_1049)
     (lambda (%_1050) (not (%_1049 %_1050))))
   complex?))
(define complex? number?)
(define abs
  (lambda (%_1051)
    (if (not (real? %_1051))
      ((lambda (%_1052 %_1053)
         (sqrt (+ (* %_1052 %_1052) (* %_1053 %_1053))))
       (real-part %_1051)
       (imag-part %_1051))
      (if (< %_1051 '0) (- %_1051) %_1051))))
(define min (void))
(define max (void))
((lambda (%_1054)
   (begin
     (set! %_1054
       (lambda (%_1055 %_1056 %_1057 %_1058)
         (if (null? %_1057)
           (if (if %_1058 (exact? %_1056) '#f)
             (exact->inexact %_1056)
             %_1056)
           (if (%_1055 (car %_1057) %_1056)
             (%_1054
               %_1055
               (car %_1057)
               (cdr %_1057)
               ((lambda (%_1059)
                  (if %_1059 %_1059 (inexact? (car %_1057))))
                %_1058))
             (%_1054 %_1055 %_1056 (cdr %_1057) %_1058)))))
     (begin
       (set! min
         (lambda (%_1061 . %_1060)
           (if (null? %_1060)
             %_1061
             (%_1054 < %_1061 %_1060 (inexact? (car %_1060))))))
       (set! max
         (lambda (%_1063 . %_1062)
           (if (null? %_1062)
             %_1063
             (%_1054 > %_1063 %_1062 (inexact? (car %_1062)))))))))
 #f)
(define negative?
  (lambda (%_1064) (< %_1064 '0)))
(define positive?
  (lambda (%_1065) (> %_1065 '0)))
(define even?
  (lambda (%_1066) (= '0 (modulo %_1066 '2))))
(define odd?
  (lambda (%_1067) (not (even? %_1067))))
(define zero? (lambda (%_1068) (= %_1068 '0)))
(define add1 (lambda (%_1069) (+ %_1069 '1)))
(define sub1 (lambda (%_1070) (- %_1070 '1)))
(define >= (void))
(define <= (void))
((lambda (%_1071 %_1072)
   (begin
     (set! <=
       (%_1071
         (lambda (%_1073 %_1074)
           ((lambda (%_1075)
              (if %_1075 %_1075 (= %_1073 %_1074)))
            (< %_1073 %_1074)))
         %_1072
         '#t))
     (set! >=
       (%_1071
         (lambda (%_1076 %_1077)
           ((lambda (%_1078)
              (if %_1078 %_1078 (= %_1076 %_1077)))
            (> %_1076 %_1077)))
         %_1072
         '#t))))
 (lambda (%_1079 %_1080 %_1081)
   (lambda %_1082
     (((lambda (%_1083)
         (begin
           (set! %_1083
             (lambda (%_1084)
               (if (null? %_1084)
                 %_1081
                 (if (null? (cdr %_1084))
                   %_1081
                   (%_1080
                     (%_1079 (car %_1084) (cadr %_1084))
                     (%_1083 (cdr %_1084)))))))
           %_1083))
       #f)
      %_1082)))
 (lambda (%_1085 %_1086) (if %_1085 %_1086 '#f)))
((lambda (%_1087)
   (begin
     (set! >= (%_1087 > >=))
     (set! <= (%_1087 < <=))))
 (lambda (%_1088 %_1089)
   (lambda %_1090
     ((lambda (%_1091)
        (if %_1091
          %_1091
          ((lambda (%_1092)
             (if %_1092
               %_1092
               (if ((lambda (%_1093)
                      (if %_1093
                        %_1093
                        (%_1088 (car %_1090) (cadr %_1090))))
                    (= (car %_1090) (cadr %_1090)))
                 (apply %_1089 (cdr %_1090))
                 '#f)))
           (null? (cdr %_1090)))))
      (null? %_1090)))))
(define gcd
  (lambda %_1094
    (if (null? %_1094)
      '0
      (if (null? (cdr %_1094))
        (car %_1094)
        (_gcd (car %_1094) (cadr %_1094))))))
(define lcm
  (lambda %_1095
    (if (null? %_1095)
      '1
      (if (null? (cdr %_1095))
        (car %_1095)
        (_lcm (car %_1095) (cadr %_1095))))))
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
  (lambda %_1096
    (if (null? %_1096)
      '""
      (if (null? (cdr %_1096))
        (car %_1096)
        (apply string-append
               (_string-append (car %_1096) (cadr %_1096))
               (cddr %_1096))))))
(define char-downcase
  ((lambda (%_1097)
     ((lambda (%_1098)
        ((lambda (%_1099)
           ((lambda ()
              (lambda (%_1100)
                ((lambda (%_1101)
                   (if (if (>= %_1101 %_1097) (<= %_1101 %_1098) '#f)
                     (integer->char (+ %_1101 %_1099))
                     %_1100))
                 (char->integer %_1100))))))
         (- (char->integer '#\a) %_1097)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_1102)
     ((lambda (%_1103)
        ((lambda (%_1104)
           ((lambda ()
              (lambda (%_1105)
                ((lambda (%_1106)
                   (if (if (>= %_1106 %_1102) (<= %_1106 %_1103) '#f)
                     (integer->char (- %_1106 %_1104))
                     %_1105))
                 (char->integer %_1105))))))
         (- %_1102 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_1107 %_1108)
    (> (char->integer %_1107) (char->integer %_1108))))
(define char<?
  (lambda (%_1109 %_1110)
    (< (char->integer %_1109) (char->integer %_1110))))
(define char=? eq?)
(define char>=?
  (lambda (%_1111 %_1112)
    ((lambda (%_1113)
       (if %_1113 %_1113 (char=? %_1111 %_1112)))
     (char>? %_1111 %_1112))))
(define char<=?
  (lambda (%_1114 %_1115)
    ((lambda (%_1116)
       (if %_1116 %_1116 (char=? %_1114 %_1115)))
     (char<? %_1114 %_1115))))
(define char-ci>?
  (lambda (%_1117 %_1118)
    (char>?
      (char-downcase %_1117)
      (char-downcase %_1118))))
(define char-ci<?
  (lambda (%_1119 %_1120)
    (char<?
      (char-downcase %_1119)
      (char-downcase %_1120))))
(define char-ci=?
  (lambda (%_1121 %_1122)
    (char=?
      (char-downcase %_1121)
      (char-downcase %_1122))))
(define char-ci>=?
  (lambda (%_1123 %_1124)
    ((lambda (%_1125)
       (if %_1125 %_1125 (char-ci=? %_1123 %_1124)))
     (char-ci>? %_1123 %_1124))))
(define char-ci<=?
  (lambda (%_1126 %_1127)
    ((lambda (%_1128)
       (if %_1128 %_1128 (char-ci=? %_1126 %_1127)))
     (char-ci<? %_1126 %_1127))))
(define char-alphabetic?
  (lambda (%_1129)
    (if (char-ci>=? %_1129 '#\a)
      (char-ci<=? %_1129 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_1130)
    (if (char-ci>=? %_1130 '#\0)
      (char-ci<=? %_1130 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_1131)
    (if (memq %_1131 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_1132)
    (if (char-alphabetic? %_1132)
      (char<? %_1132 '#\a)
      '#f)))
(define char-lower-case?
  (lambda (%_1133)
    (if (char-alphabetic? %_1133)
      (char>? %_1133 '#\z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
((lambda (%_1134)
   (begin
     (set! %_1134
       (lambda (%_1135 %_1136 %_1137 %_1138 %_1139)
         (if (< %_1138 %_1139)
           (begin
             (string-set!
               %_1136
               %_1138
               (%_1137 (string-ref %_1135 %_1138)))
             (%_1134
               %_1135
               %_1136
               %_1137
               (+ %_1138 '1)
               %_1139))
           %_1136)))
     (begin
       (set! string-downcase
         (lambda (%_1140)
           ((lambda (%_1141)
              (%_1134
                %_1140
                %_1141
                char-downcase
                '0
                (string-length %_1140)))
            (make-string (string-length %_1140)))))
       (set! string-upcase
         (lambda (%_1142)
           ((lambda (%_1143)
              (%_1134
                %_1142
                %_1143
                char-upcase
                '0
                (string-length %_1142)))
            (make-string (string-length %_1142))))))))
 #f)
(define string=? equal?)
(define string<?
  ((lambda (%_1144)
     (begin
       (set! %_1144
         (lambda (%_1145 %_1146)
           (if (null? %_1145)
             (not (null? %_1146))
             (if (null? %_1146)
               '#f
               ((lambda (%_1147 %_1148)
                  (if (char<? %_1147 %_1148)
                    '#t
                    (if (char>? %_1147 %_1148)
                      '#f
                      (%_1144 (cdr %_1145) (cdr %_1146)))))
                (car %_1145)
                (car %_1146))))))
       (lambda (%_1149 %_1150)
         (%_1144
           (string->list %_1149)
           (string->list %_1150)))))
   #f))
(define string>?
  ((lambda (%_1151)
     (begin
       (set! %_1151
         (lambda (%_1152 %_1153)
           (if (null? %_1153)
             (not (null? %_1152))
             (if (null? %_1152)
               '#f
               ((lambda (%_1154 %_1155)
                  (if (char>? %_1154 %_1155)
                    '#t
                    (if (char<? %_1154 %_1155)
                      '#f
                      (%_1151 (cdr %_1152) (cdr %_1153)))))
                (car %_1152)
                (car %_1153))))))
       (lambda (%_1156 %_1157)
         (%_1151
           (string->list %_1156)
           (string->list %_1157)))))
   #f))
(define string<=?
  (lambda (%_1158 %_1159)
    ((lambda (%_1160)
       (if %_1160 %_1160 (string=? %_1158 %_1159)))
     (string<? %_1158 %_1159))))
(define string>=?
  (lambda (%_1161 %_1162)
    ((lambda (%_1163)
       (if %_1163 %_1163 (string=? %_1161 %_1162)))
     (string>? %_1161 %_1162))))
(define string-ci=?
  (lambda (%_1164 %_1165)
    (string=?
      (string-downcase %_1164)
      (string-downcase %_1165))))
(define string-ci<?
  (lambda (%_1166 %_1167)
    (string<?
      (string-downcase %_1166)
      (string-downcase %_1167))))
(define string-ci>?
  (lambda (%_1168 %_1169)
    (string>?
      (string-downcase %_1168)
      (string-downcase %_1169))))
(define string-ci>=?
  (lambda (%_1170 %_1171)
    (string>=?
      (string-downcase %_1170)
      (string-downcase %_1171))))
(define string-ci<=?
  (lambda (%_1172 %_1173)
    (string<=?
      (string-downcase %_1172)
      (string-downcase %_1173))))
(define substring
  ((lambda (%_1174)
     (begin
       (set! %_1174
         (lambda (%_1175 %_1176 %_1177 %_1178 %_1179)
           (if (< %_1178 %_1179)
             (begin
               (string-set!
                 %_1176
                 %_1177
                 (string-ref %_1175 %_1178))
               (%_1174
                 %_1175
                 %_1176
                 (+ %_1177 '1)
                 (+ %_1178 '1)
                 %_1179))
             (void))))
       (lambda (%_1180 %_1181 %_1182)
         ((lambda (%_1183)
            (begin
              (%_1174 %_1180 %_1183 '0 %_1181 %_1182)
              %_1183))
          (make-string (- %_1182 %_1181))))))
   #f))
(define format
  ((lambda (%_1184)
     (begin
       (set! %_1184
         (lambda (%_1185 %_1186 %_1187)
           (if (null? %_1185)
             (get-output-string %_1187)
             (if (eq? (car %_1185) '#\~)
               (begin
                 ((lambda (%_1188)
                    (if (memv %_1188 '(#\s))
                      (write (car %_1186) %_1187)
                      (if (memv %_1188 '(#\a))
                        (display (car %_1186) %_1187)
                        (if (memv %_1188 '(#\%))
                          (display '#\newline %_1187)
                          (if (memv %_1188 '(#\~))
                            (display '#\~ %_1187)
                            (void))))))
                  (cadr %_1185))
                 (%_1184
                   (cddr %_1185)
                   (if (not (null? %_1186)) (cdr %_1186) '())
                   %_1187))
               (begin
                 (display (car %_1185) %_1187)
                 (%_1184 (cdr %_1185) %_1186 %_1187))))))
       (lambda (%_1190 . %_1189)
         (%_1184
           (string->list %_1190)
           %_1189
           (open-output-string)))))
   #f))
(define error
  ((lambda (%_1191)
     (lambda %_1192
       ((lambda (%_1193)
          ((lambda (%_1194)
             ((lambda (%_1195)
                ((lambda ()
                   (if %_1193
                     (if %_1194
                       (%_1191
                         (format
                           '"Error in ~s: ~a"
                           %_1193
                           (apply format (cons %_1194 %_1195))))
                       (%_1191 (format '"Error in ~s." %_1193)))
                     (if %_1194
                       (if (string? %_1194)
                         (%_1191
                           (format
                             '"Error: ~a"
                             (apply format (cons %_1194 %_1195))))
                         (if (null? %_1195)
                           (%_1191 %_1194)
                           (error 'error
                                  '"cannot specify error arguments to a non format-string error.")))
                       (%_1191 '"Error."))))))
              (if (not %_1194)
                '()
                (if (not %_1193)
                  (if (not (null? %_1192))
                    (if (not (car %_1192))
                      (cddr %_1192)
                      (cdr %_1192))
                    (cdr %_1192))
                  (cddr %_1192)))))
           (if (not %_1193)
             (if (not (null? %_1192))
               (if (not (car %_1192))
                 (cadr %_1192)
                 (car %_1192))
               '#f)
             (if (not (null? (cdr %_1192))) (cadr %_1192) '#f))))
        (if (if (not (null? %_1192))
              (symbol? (car %_1192))
              '#f)
          (car %_1192)
          '#f))))
   error))
(define list-ref
  (lambda (%_1196 %_1197)
    (if (zero? %_1197)
      (car %_1196)
      (list-ref (cdr %_1196) (- %_1197 '1)))))
(define iota
  ((lambda (%_1198)
     (begin
       (set! %_1198
         (lambda (%_1199 %_1200)
           (if (> %_1199 %_1200)
             '()
             (cons %_1199 (%_1198 (+ %_1199 '1) %_1200)))))
       (lambda (%_1201) (%_1198 '0 %_1201))))
   #f))
(define values
  (lambda %_1202
    (call-with-current-continuation
      (lambda (%_1203) (apply %_1203 %_1202)))))
