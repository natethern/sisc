(define for-each
  (lambda (%_889 . %_888)
    (if (null? %_888)
      (error 'for-each
             '"invalid number of arguments to procedure for-each.")
      (if (not (null? (car %_888)))
        (begin
          (apply %_889 (map car %_888))
          (apply for-each (cons %_889 (map cdr %_888))))
        (void)))))
(define exit (lambda () '#!eof))
(define eof-object?
  (lambda (%_890) (eq? %_890 '#!eof)))
(define not (lambda (%_891) (if %_891 '#f '#t)))
(define eqv? eq?)
(define newline
  (lambda %_892
    (apply display (cons '#\newline %_892))))
(define map (void))
((lambda (%_893)
   (begin
     (set! %_893
       ((lambda (%_894)
          (begin
            (set! %_894
              (lambda (%_898 %_899 %_900 %_901)
                (if (null? %_901)
                  %_899
                  (begin
                    (set-cdr! %_900 (cons (%_898 (car %_901)) '()))
                    (%_894 %_898 %_899 (cdr %_900) (cdr %_901))))))
            (lambda (%_895 %_896)
              (if (null? %_896)
                '()
                ((lambda (%_897)
                   (%_894 %_895 %_897 %_897 (cdr %_896)))
                 (cons (%_895 (car %_896)) '()))))))
        #f))
     (set! map %_893)))
 #f)
(define compose
  (lambda %_902
    (if (null? %_902)
      (lambda (%_906) %_906)
      ((lambda (%_903 %_904)
         (lambda (%_905) (%_903 (%_904 %_905))))
       (car %_902)
       (apply compose (cdr %_902))))))
(define compose2
  (lambda (%_907 %_908)
    (lambda (%_909) (%_907 (%_908 %_909)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
((lambda (%_910 %_911)
   (begin
     (set! %_910
       (lambda (%_924 %_925 %_926)
         (if (null? %_926)
           '#f
           (if (%_924 (caar %_926) %_925)
             (car %_926)
             (%_910 %_924 %_925 (cdr %_926))))))
     (set! %_911
       (lambda (%_927 %_928 %_929)
         (if (null? %_929)
           '#f
           (if (%_927 (car %_929) %_928)
             %_929
             (%_911 %_927 %_928 (cdr %_929))))))
     (begin
       (set! assq
         (lambda (%_912 %_913) (%_910 eq? %_912 %_913)))
       (set! assv
         (lambda (%_914 %_915) (%_910 eqv? %_914 %_915)))
       (set! assoc
         (lambda (%_916 %_917) (%_910 equal? %_916 %_917)))
       (set! memq
         (lambda (%_918 %_919) (%_911 eq? %_918 %_919)))
       (set! memv
         (lambda (%_920 %_921) (%_911 eqv? %_920 %_921)))
       (set! member
         (lambda (%_922 %_923) (%_911 equal? %_922 %_923))))))
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
  (lambda (%_930 %_931)
    (if (null? %_930)
      %_931
      (cons (car %_930) (append2 (cdr %_930) %_931)))))
(define append append2)
(define list->string
  (lambda (%_932)
    ((lambda (%_933)
       (begin
         (set! %_933
           (lambda (%_934 %_935 %_936)
             (if (null? %_934)
               %_935
               (begin
                 (string-set! %_935 %_936 (car %_934))
                 (%_933 (cdr %_934) %_935 (+ %_936 '1))))))
         (%_933 %_932 (make-string (length %_932)) '0)))
     #f)))
(define string->list
  ((lambda (%_937)
     (begin
       (set! %_937
         (lambda (%_939 %_940 %_941)
           (if (< %_941 '0)
             %_940
             (%_937 %_939
                    (cons (string-ref %_939 %_941) %_940)
                    (- %_941 '1)))))
       (lambda (%_938)
         (%_937 %_938 '() (- (string-length %_938) '1)))))
   #f))
(define list->vector
  ((lambda (%_942)
     (begin
       (set! %_942
         (lambda (%_944 %_945 %_946)
           (if (null? %_944)
             %_945
             (begin
               (vector-set! %_945 %_946 (car %_944))
               (%_942 (cdr %_944) %_945 (+ %_946 '1))))))
       (lambda (%_943)
         (if (proper-list? %_943)
           (%_942 %_943 (make-vector (length %_943)) '0)
           (error 'list->vector
                  '"can only convert a proper list."
                  %_943)))))
   #f))
(define vector
  (lambda %_947 (list->vector %_947)))
(define string
  (lambda %_948 (list->string %_948)))
(define detect-os
  (lambda ()
    ((lambda (%_949)
       (if (> (string-length %_949) '3)
         (if (equal? (substring %_949 '0 '3) '"mac")
           'macos
           (if (equal? (substring %_949 '0 '3) '"win")
             'ms-dos
             (if (equal? (substring %_949 '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring %_949 '0 '3) '"uni")
                 'unix
                 (if (equal? (substring %_949 '0 '3) '"lin")
                   'unix
                   (if (equal? (substring %_949 '0 '4) '"os/")
                     'os2
                     (if (equal? (substring %_949 '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase
       (getprop 'os.name '*environment-variables*)))))
(define current-url (make-parameter '"file:."))
(define current-directory
  (lambda %_950
    (if (null? %_950)
      (normalize-url (current-url) '".")
      (current-url
        (normalize-url (current-url) (car %_950))))))
((lambda (%_951)
   (begin
     (set! open-input-file (%_951 open-input-file))
     (set! open-source-input-file
       (%_951 open-source-input-file))
     (set! open-output-file (%_951 open-output-file))
     (set! load
       ((lambda (%_952)
          (lambda (%_953)
            (begin
              ((lambda (%_954)
                 (begin
                   (current-url (normalize-url %_954 %_953))
                   (call-with-failure-continuation
                     (lambda () (%_952 (current-url)))
                     (lambda (%_955 %_956 %_957)
                       (begin (current-url %_954) (%_957 %_955 %_956))))
                   (current-url %_954)))
               (current-url))
              (void))))
        load))))
 (lambda (%_958)
   (lambda (%_959)
     (%_958 (normalize-url (current-url) %_959)))))
(define load-module
  (lambda (%_960)
    ((lambda (%_961)
       ((lambda (%_962)
          ((lambda ()
             (for-each
               (lambda (%_963)
                 (putprop
                   %_963
                   '*toplevel*
                   (native-library-binding %_961 %_963)))
               %_962))))
        (native-library-binding-names %_961)))
     (load-native-library %_960))))
(define reverse
  ((lambda (%_964)
     (begin
       (set! %_964
         (lambda (%_966 %_967)
           (if (null? %_966)
             %_967
             (%_964 (cdr %_966) (cons (car %_966) %_967)))))
       (lambda (%_965) (%_964 %_965 '()))))
   #f))
(define remove
  (lambda (%_968 %_969)
    (if (null? %_969)
      '()
      (if (equal? (car %_969) %_968)
        (remove %_968 (cdr %_969))
        (cons (car %_969) (remove %_968 (cdr %_969)))))))
(define append
  ((lambda (%_970)
     (begin
       (set! %_970
         (lambda (%_973 . %_972)
           (if (null? %_972)
             %_973
             (if (null? %_973)
               (apply %_970 %_972)
               (apply %_970
                      (cons (append2 %_973 (car %_972)) (cdr %_972)))))))
       (lambda %_971
         (if (null? %_971)
           '()
           (if (null? (cdr %_971))
             (car %_971)
             (apply %_970 (cons (car %_971) (cdr %_971))))))))
   #f))
(define map
  ((lambda (%_974 %_975)
     (begin
       (set! %_974 map)
       (set! %_975
         (lambda (%_979 %_980 %_981 %_982)
           (if (null? (car %_980))
             (if (andmap null? %_980)
               %_981
               (error 'map '"lists are not of equal length."))
             ((lambda (%_983 %_984)
                (begin
                  (if (not (null? %_982))
                    (set-cdr! %_982 %_983)
                    (void))
                  (if (null? %_981)
                    (%_975 %_979 %_984 %_983 %_983)
                    (%_975 %_979 %_984 %_981 %_983))))
              (cons (apply %_979 (%_974 car %_980)) '())
              (%_974 cdr %_980)))))
       (lambda (%_978 %_977 . %_976)
         (if (null? %_976)
           (%_974 %_978 %_977)
           (%_975 %_978 (cons %_977 %_976) '() '())))))
   #f
   #f))
(define proper-list?
  (lambda (%_985)
    (((lambda (%_986)
        (begin
          (set! %_986
            (lambda (%_987 %_988)
              (if (pair? %_987)
                ((lambda (%_989)
                   (if (pair? %_989)
                     ((lambda (%_990 %_991)
                        (if (not (eq? %_990 %_991))
                          (%_986 %_990 %_991)
                          '#f))
                      (cdr %_989)
                      (cdr %_988))
                     (null? %_989)))
                 (cdr %_987))
                (null? %_987))))
          %_986))
      #f)
     %_985
     %_985)))
(define circular?
  (lambda (%_992)
    ((lambda (%_997 %_996 %_995 %_994 %_993)
       (begin
         (set! %_997
           (lambda (%_999 %_1000)
             ((lambda (%_1001)
                (begin
                  (set! %_1001
                    (lambda (%_1010 %_1011)
                      ((lambda (%_1012)
                         (if %_1012
                           (%_997 (%_996 %_1010) (%_996 %_1012))
                           '#f))
                       (%_996 %_1011))))
                  (if %_1000
                    (if (not (eq? (car %_1000) (car %_999)))
                      (%_1001 %_999 %_1000)
                      (((lambda (%_1002)
                          (begin
                            (set! %_1002
                              (lambda (%_1003 %_1004)
                                ((lambda (%_1005)
                                   (if %_1005
                                     %_1005
                                     (if (if (= (cadr %_1003) (cadr %_1004))
                                           (eq? (caddr %_1003) (caddr %_1004))
                                           '#f)
                                       (%_1002 (cddr %_1003) (cddr %_1004))
                                       ((lambda (%_1006)
                                          (((lambda (%_1007)
                                              (begin
                                                (set! %_1007
                                                  (lambda (%_1008)
                                                    (if %_1008
                                                      ((lambda (%_1009)
                                                         (if %_1009
                                                           %_1009
                                                           (%_1007
                                                             (%_996 %_1008))))
                                                       (eq? (car %_1008)
                                                            %_1006))
                                                      (%_1001 %_1003 %_1004))))
                                                %_1007))
                                            #f)
                                           (%_996 (list %_1006))))
                                        (car %_1003)))))
                                 (null? (cdr %_1003)))))
                            %_1002))
                        #f)
                       %_999
                       %_1000))
                    '#f)))
              #f)))
         (set! %_996
           (lambda (%_1013)
             ((lambda (%_1014)
                (((lambda (%_1015)
                    (begin
                      (set! %_1015
                        (lambda (%_1016 %_1017 %_1018)
                          (if (>= %_1017 '0)
                            ((lambda (%_1022)
                               (if (%_993 %_1022)
                                 (cons %_1022 (cons %_1017 %_1018))
                                 (%_1015 %_1016 (- %_1017 '1) %_1018)))
                             (%_995 %_1016 %_1017))
                            ((lambda (%_1019)
                               (if (pair? %_1019)
                                 ((lambda (%_1020 %_1021)
                                    (%_1015 (car %_1021) (- %_1020 '1) %_1021))
                                  (car %_1019)
                                  (cdr %_1019))
                                 '#f))
                             (cdr %_1018)))))
                      %_1015))
                  #f)
                 %_1014
                 (- (%_994 %_1014) '1)
                 %_1013))
              (car %_1013))))
         (set! %_995
           (lambda (%_1023 %_1024)
             (if (vector? %_1023)
               (vector-ref %_1023 %_1024)
               (if (box? %_1023)
                 (unbox %_1023)
                 ((if (zero? %_1024) car cdr) %_1023)))))
         (set! %_994
           (lambda (%_1025)
             (if (pair? %_1025)
               '2
               (if (box? %_1025) '1 (vector-length %_1025)))))
         (set! %_993
           (lambda (%_1026)
             ((lambda (%_1027)
                (if %_1027
                  %_1027
                  ((lambda (%_1028)
                     (if %_1028
                       %_1028
                       (if (vector? %_1026)
                         (not (zero? (vector-length %_1026)))
                         '#f)))
                   (box? %_1026))))
              (pair? %_1026))))
         (if (%_993 %_992)
           ((lambda (%_998) (%_997 %_998 (%_996 %_998)))
            (list %_992))
           '#f)))
     #f
     #f
     #f
     #f
     #f)))
(define list?
  ((lambda (%_1029)
     (begin
       (set! %_1029
         (lambda (%_1032 %_1033)
           ((lambda (%_1034)
              (if %_1034
                %_1034
                ((lambda (%_1035)
                   (if %_1035
                     %_1035
                     (if (pair? %_1033)
                       ((lambda (%_1036)
                          (if %_1036
                            %_1036
                            (if (not (eq? %_1032 %_1033))
                              (%_1029 (cdr %_1032) (cddr %_1033))
                              '#f)))
                        (null? (cdr %_1033)))
                       '#f)))
                 (null? %_1033))))
            (null? %_1032))))
       (lambda (%_1030)
         ((lambda (%_1031)
            (if %_1031
              %_1031
              (if (pair? %_1030)
                (%_1029 %_1030 (cdr %_1030))
                '#f)))
          (null? %_1030)))))
   #f))
(define expt
  (lambda (%_1037 %_1038)
    (if (if (integer? %_1038) (= %_1037 '2) '#f)
      (ashl '1 %_1038)
      (((lambda (%_1039)
          (begin
            (set! %_1039
              (lambda (%_1040 %_1041 %_1042)
                (if (zero? %_1040)
                  %_1041
                  (%_1039
                    (quotient %_1040 '2)
                    (if (odd? %_1040) (* %_1041 %_1042) %_1041)
                    (* %_1042 %_1042)))))
            %_1039))
        #f)
       %_1038
       '1
       %_1037))))
(define modpow
  (lambda (%_1043 %_1044 %_1045)
    ((lambda (%_1046)
       (if (= %_1044 '1)
         (modulo %_1043 %_1045)
         (if (even? %_1044)
           ((lambda (%_1048)
              (modulo (* %_1048 %_1048) %_1045))
            (modpow %_1043 (/ %_1044 '2) %_1045))
           ((lambda (%_1047)
              (begin
                (set! %_1047 (modulo (* %_1047 %_1047) %_1045))
                (modulo (* %_1043 %_1047) %_1045)))
            (modpow %_1043 (/ (- %_1044 '1) '2) %_1045)))))
     '0)))
(define integer?
  ((lambda (%_1049)
     (lambda (%_1050)
       ((lambda (%_1051)
          (if %_1051
            %_1051
            (if (real? %_1050) (= (round %_1050) %_1050) '#f)))
        (%_1049 %_1050))))
   integer?))
(define real?
  ((lambda (%_1052)
     (lambda (%_1053)
       (if (number? %_1053) (not (%_1052 %_1053)) '#f)))
   complex?))
(define complex? number?)
(define abs
  (lambda (%_1054)
    (if (not (real? %_1054))
      ((lambda (%_1055 %_1056)
         (sqrt (+ (* %_1055 %_1055) (* %_1056 %_1056))))
       (real-part %_1054)
       (imag-part %_1054))
      (if (< %_1054 '0) (- %_1054) %_1054))))
(define min (void))
(define max (void))
((lambda (%_1057)
   (begin
     (set! %_1057
       (lambda (%_1062 %_1063 %_1064 %_1065)
         (if (null? %_1064)
           (if (if %_1065 (exact? %_1063) '#f)
             (exact->inexact %_1063)
             %_1063)
           (if (%_1062 (car %_1064) %_1063)
             (%_1057
               %_1062
               (car %_1064)
               (cdr %_1064)
               ((lambda (%_1066)
                  (if %_1066 %_1066 (inexact? (car %_1064))))
                %_1065))
             (%_1057 %_1062 %_1063 (cdr %_1064) %_1065)))))
     (begin
       (set! min
         (lambda (%_1059 . %_1058)
           (if (null? %_1058)
             %_1059
             (%_1057 < %_1059 %_1058 (inexact? %_1059)))))
       (set! max
         (lambda (%_1061 . %_1060)
           (if (null? %_1060)
             %_1061
             (%_1057 > %_1061 %_1060 (inexact? %_1061))))))))
 #f)
(define negative?
  (lambda (%_1067) (< %_1067 '0)))
(define positive?
  (lambda (%_1068) (> %_1068 '0)))
(define even?
  (lambda (%_1069) (= '0 (modulo %_1069 '2))))
(define odd?
  (lambda (%_1070) (not (even? %_1070))))
(define zero? (lambda (%_1071) (= %_1071 '0)))
(define add1 (lambda (%_1072) (+ %_1072 '1)))
(define sub1 (lambda (%_1073) (- %_1073 '1)))
(define >= (void))
(define <= (void))
((lambda (%_1074 %_1075)
   (begin
     (set! <=
       (%_1074
         (lambda (%_1076 %_1077)
           ((lambda (%_1078)
              (if %_1078 %_1078 (= %_1076 %_1077)))
            (< %_1076 %_1077)))
         %_1075
         '#t))
     (set! >=
       (%_1074
         (lambda (%_1079 %_1080)
           ((lambda (%_1081)
              (if %_1081 %_1081 (= %_1079 %_1080)))
            (> %_1079 %_1080)))
         %_1075
         '#t))))
 (lambda (%_1082 %_1083 %_1084)
   (lambda %_1085
     (((lambda (%_1086)
         (begin
           (set! %_1086
             (lambda (%_1087)
               (if (null? %_1087)
                 %_1084
                 (if (null? (cdr %_1087))
                   %_1084
                   (%_1083
                     (%_1082 (car %_1087) (cadr %_1087))
                     (%_1086 (cdr %_1087)))))))
           %_1086))
       #f)
      %_1085)))
 (lambda (%_1088 %_1089) (if %_1088 %_1089 '#f)))
((lambda (%_1090)
   (begin
     (set! >= (%_1090 > >=))
     (set! <= (%_1090 < <=))))
 (lambda (%_1091 %_1092)
   (lambda %_1093
     ((lambda (%_1094)
        (if %_1094
          %_1094
          ((lambda (%_1095)
             (if %_1095
               %_1095
               (if ((lambda (%_1096)
                      (if %_1096
                        %_1096
                        (%_1091 (car %_1093) (cadr %_1093))))
                    (= (car %_1093) (cadr %_1093)))
                 (apply %_1092 (cdr %_1093))
                 '#f)))
           (null? (cdr %_1093)))))
      (null? %_1093)))))
(define gcd
  (lambda %_1097
    (if (null? %_1097)
      '0
      (if (null? (cdr %_1097))
        (car %_1097)
        (_gcd (car %_1097) (cadr %_1097))))))
(define lcm
  (lambda %_1098
    (if (null? %_1098)
      '1
      (if (null? (cdr %_1098))
        (car %_1098)
        (_lcm (car %_1098) (cadr %_1098))))))
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
  (lambda %_1099
    (if (null? %_1099)
      '""
      (if (null? (cdr %_1099))
        (car %_1099)
        (apply string-append
               (_string-append (car %_1099) (cadr %_1099))
               (cddr %_1099))))))
(define char-downcase
  ((lambda (%_1100)
     ((lambda (%_1101)
        ((lambda (%_1102)
           ((lambda ()
              (lambda (%_1103)
                ((lambda (%_1104)
                   (if (if (>= %_1104 %_1100) (<= %_1104 %_1101) '#f)
                     (integer->char (+ %_1104 %_1102))
                     %_1103))
                 (char->integer %_1103))))))
         (- (char->integer '#\a) %_1100)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_1105)
     ((lambda (%_1106)
        ((lambda (%_1107)
           ((lambda ()
              (lambda (%_1108)
                ((lambda (%_1109)
                   (if (if (>= %_1109 %_1105) (<= %_1109 %_1106) '#f)
                     (integer->char (- %_1109 %_1107))
                     %_1108))
                 (char->integer %_1108))))))
         (- %_1105 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_1110 %_1111)
    (> (char->integer %_1110) (char->integer %_1111))))
(define char<?
  (lambda (%_1112 %_1113)
    (< (char->integer %_1112) (char->integer %_1113))))
(define char=? eq?)
(define char>=?
  (lambda (%_1114 %_1115)
    ((lambda (%_1116)
       (if %_1116 %_1116 (char=? %_1114 %_1115)))
     (char>? %_1114 %_1115))))
(define char<=?
  (lambda (%_1117 %_1118)
    ((lambda (%_1119)
       (if %_1119 %_1119 (char=? %_1117 %_1118)))
     (char<? %_1117 %_1118))))
(define char-ci>?
  (lambda (%_1120 %_1121)
    (char>?
      (char-downcase %_1120)
      (char-downcase %_1121))))
(define char-ci<?
  (lambda (%_1122 %_1123)
    (char<?
      (char-downcase %_1122)
      (char-downcase %_1123))))
(define char-ci=?
  (lambda (%_1124 %_1125)
    (char=?
      (char-downcase %_1124)
      (char-downcase %_1125))))
(define char-ci>=?
  (lambda (%_1126 %_1127)
    ((lambda (%_1128)
       (if %_1128 %_1128 (char-ci=? %_1126 %_1127)))
     (char-ci>? %_1126 %_1127))))
(define char-ci<=?
  (lambda (%_1129 %_1130)
    ((lambda (%_1131)
       (if %_1131 %_1131 (char-ci=? %_1129 %_1130)))
     (char-ci<? %_1129 %_1130))))
(define char-alphabetic?
  (lambda (%_1132)
    (if (char-ci>=? %_1132 '#\a)
      (char-ci<=? %_1132 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_1133)
    (if (char-ci>=? %_1133 '#\0)
      (char-ci<=? %_1133 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_1134)
    (if (memq %_1134 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_1135)
    (if (char-alphabetic? %_1135)
      (char>? %_1135 '#\a)
      '#f)))
(define char-lower-case?
  (lambda (%_1136)
    (if (char-alphabetic? %_1136)
      (char>? %_1136 '#\Z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
((lambda (%_1137)
   (begin
     (set! %_1137
       (lambda (%_1142 %_1143 %_1144 %_1145 %_1146)
         (if (< %_1145 %_1146)
           (begin
             (string-set!
               %_1143
               %_1145
               (%_1144 (string-ref %_1142 %_1145)))
             (%_1137
               %_1142
               %_1143
               %_1144
               (+ %_1145 '1)
               %_1146))
           %_1143)))
     (begin
       (set! string-downcase
         (lambda (%_1138)
           ((lambda (%_1139)
              (%_1137
                %_1138
                %_1139
                char-downcase
                '0
                (string-length %_1138)))
            (make-string (string-length %_1138)))))
       (set! string-upcase
         (lambda (%_1140)
           ((lambda (%_1141)
              (%_1137
                %_1140
                %_1141
                char-upcase
                '0
                (string-length %_1140)))
            (make-string (string-length %_1140))))))))
 #f)
(define string=? equal?)
(define string<?
  ((lambda (%_1147)
     (begin
       (set! %_1147
         (lambda (%_1150 %_1151)
           (if (null? %_1150)
             (not (null? %_1151))
             (if (null? %_1151)
               '#f
               ((lambda (%_1152 %_1153)
                  (if (char<? %_1152 %_1153)
                    '#t
                    (if (char>? %_1152 %_1153)
                      '#f
                      (%_1147 (cdr %_1150) (cdr %_1151)))))
                (car %_1150)
                (car %_1151))))))
       (lambda (%_1148 %_1149)
         (%_1147
           (string->list %_1148)
           (string->list %_1149)))))
   #f))
(define string>?
  ((lambda (%_1154)
     (begin
       (set! %_1154
         (lambda (%_1157 %_1158)
           (if (null? %_1158)
             (not (null? %_1157))
             (if (null? %_1157)
               '#f
               ((lambda (%_1159 %_1160)
                  (if (char>? %_1159 %_1160)
                    '#t
                    (if (char<? %_1159 %_1160)
                      '#f
                      (%_1154 (cdr %_1157) (cdr %_1158)))))
                (car %_1157)
                (car %_1158))))))
       (lambda (%_1155 %_1156)
         (%_1154
           (string->list %_1155)
           (string->list %_1156)))))
   #f))
(define string<=?
  (lambda (%_1161 %_1162)
    ((lambda (%_1163)
       (if %_1163 %_1163 (string=? %_1161 %_1162)))
     (string<? %_1161 %_1162))))
(define string>=?
  (lambda (%_1164 %_1165)
    ((lambda (%_1166)
       (if %_1166 %_1166 (string=? %_1164 %_1165)))
     (string>? %_1164 %_1165))))
(define string-ci=?
  (lambda (%_1167 %_1168)
    (string=?
      (string-downcase %_1167)
      (string-downcase %_1168))))
(define string-ci<?
  (lambda (%_1169 %_1170)
    (string<?
      (string-downcase %_1169)
      (string-downcase %_1170))))
(define string-ci>?
  (lambda (%_1171 %_1172)
    (string>?
      (string-downcase %_1171)
      (string-downcase %_1172))))
(define string-ci>=?
  (lambda (%_1173 %_1174)
    (string>=?
      (string-downcase %_1173)
      (string-downcase %_1174))))
(define string-ci<=?
  (lambda (%_1175 %_1176)
    (string<=?
      (string-downcase %_1175)
      (string-downcase %_1176))))
(define substring
  ((lambda (%_1177)
     (begin
       (set! %_1177
         (lambda (%_1182 %_1183 %_1184 %_1185 %_1186)
           (if (< %_1185 %_1186)
             (begin
               (string-set!
                 %_1183
                 %_1184
                 (string-ref %_1182 %_1185))
               (%_1177
                 %_1182
                 %_1183
                 (+ %_1184 '1)
                 (+ %_1185 '1)
                 %_1186))
             (void))))
       (lambda (%_1178 %_1179 %_1180)
         ((lambda (%_1181)
            (begin
              (%_1177 %_1178 %_1181 '0 %_1179 %_1180)
              %_1181))
          (make-string (- %_1180 %_1179))))))
   #f))
(define format
  ((lambda (%_1187)
     (begin
       (set! %_1187
         (lambda (%_1190 %_1191 %_1192)
           (if (null? %_1190)
             (get-output-string %_1192)
             (if (eq? (car %_1190) '#\~)
               (begin
                 ((lambda (%_1193)
                    (if (memv %_1193 '(#\s))
                      (write (car %_1191) %_1192)
                      (if (memv %_1193 '(#\a))
                        (display (car %_1191) %_1192)
                        (if (memv %_1193 '(#\%))
                          (display '#\newline %_1192)
                          (if (memv %_1193 '(#\~))
                            (display '#\~ %_1192)
                            (void))))))
                  (cadr %_1190))
                 (%_1187
                   (cddr %_1190)
                   (if (not (null? %_1191)) (cdr %_1191) '())
                   %_1192))
               (begin
                 (display (car %_1190) %_1192)
                 (%_1187 (cdr %_1190) %_1191 %_1192))))))
       (lambda (%_1189 . %_1188)
         (%_1187
           (string->list %_1189)
           %_1188
           (open-output-string)))))
   #f))
(define error
  ((lambda (%_1194)
     (lambda %_1195
       ((lambda (%_1196)
          ((lambda (%_1197)
             ((lambda (%_1198)
                ((lambda ()
                   (if %_1196
                     (if %_1197
                       (%_1194
                         (format
                           '"Error in ~s: ~a"
                           %_1196
                           (apply format (cons %_1197 %_1198))))
                       (%_1194 (format '"Error in ~s." %_1196)))
                     (if %_1197
                       (if (string? %_1197)
                         (%_1194
                           (format
                             '"Error: ~a"
                             (apply format (cons %_1197 %_1198))))
                         (if (null? %_1198)
                           (%_1194 %_1197)
                           (error 'error
                                  '"cannot specify error arguments to a non format-string error.")))
                       (%_1194 '"Error."))))))
              (if (not %_1197)
                '()
                (if (not %_1196)
                  (if (not (null? %_1195))
                    (if (not (car %_1195))
                      (cddr %_1195)
                      (cdr %_1195))
                    (cdr %_1195))
                  (cddr %_1195)))))
           (if (not %_1196)
             (if (not (null? %_1195))
               (if (not (car %_1195))
                 (cadr %_1195)
                 (car %_1195))
               '#f)
             (if (not (null? (cdr %_1195))) (cadr %_1195) '#f))))
        (if (if (not (null? %_1195))
              (symbol? (car %_1195))
              '#f)
          (car %_1195)
          '#f))))
   error))
(define list-ref
  (lambda (%_1199 %_1200)
    (if (zero? %_1200)
      (car %_1199)
      (list-ref (cdr %_1199) (- %_1200 '1)))))
(define iota
  ((lambda (%_1201)
     (begin
       (set! %_1201
         (lambda (%_1203 %_1204)
           (if (> %_1203 %_1204)
             '()
             (cons %_1203 (%_1201 (+ %_1203 '1) %_1204)))))
       (lambda (%_1202) (%_1201 '0 %_1202))))
   #f))
(define values
  (lambda %_1205
    (call-with-current-continuation
      (lambda (%_1206) (apply %_1206 %_1205)))))
