(define for-each
  (lambda (%_887 . %_886)
    (if (null? %_886)
      (error 'for-each
             '"invalid number of arguments to procedure for-each.")
      (if (not (null? (car %_886)))
        (begin
          (apply %_887 (map car %_886))
          (apply for-each (cons %_887 (map cdr %_886))))
        (void)))))
(define exit (lambda () '#!eof))
(define eof-object?
  (lambda (%_888) (eq? %_888 '#!eof)))
(define not (lambda (%_889) (if %_889 '#f '#t)))
(define eqv? eq?)
(define newline
  (lambda %_890
    (apply display (cons '#\newline %_890))))
(define map (void))
((lambda (%_891)
   (begin
     (set! %_891
       ((lambda (%_892)
          (begin
            (set! %_892
              (lambda (%_896 %_897 %_898 %_899)
                (if (null? %_899)
                  %_897
                  (begin
                    (set-cdr! %_898 (cons (%_896 (car %_899)) '()))
                    (%_892 %_896 %_897 (cdr %_898) (cdr %_899))))))
            (lambda (%_893 %_894)
              (if (null? %_894)
                '()
                ((lambda (%_895)
                   (%_892 %_893 %_895 %_895 (cdr %_894)))
                 (cons (%_893 (car %_894)) '()))))))
        #f))
     (set! map %_891)))
 #f)
(define compose
  (lambda %_900
    (if (null? %_900)
      (lambda (%_904) %_904)
      ((lambda (%_901 %_902)
         (lambda (%_903) (%_901 (%_902 %_903))))
       (car %_900)
       (apply compose (cdr %_900))))))
(define compose2
  (lambda (%_905 %_906)
    (lambda (%_907) (%_905 (%_906 %_907)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
((lambda (%_908 %_909)
   (begin
     (set! %_908
       (lambda (%_922 %_923 %_924)
         (if (null? %_924)
           '#f
           (if (%_922 (caar %_924) %_923)
             (car %_924)
             (%_908 %_922 %_923 (cdr %_924))))))
     (set! %_909
       (lambda (%_925 %_926 %_927)
         (if (null? %_927)
           '#f
           (if (%_925 (car %_927) %_926)
             %_927
             (%_909 %_925 %_926 (cdr %_927))))))
     (begin
       (set! assq
         (lambda (%_910 %_911) (%_908 eq? %_910 %_911)))
       (set! assv
         (lambda (%_912 %_913) (%_908 eqv? %_912 %_913)))
       (set! assoc
         (lambda (%_914 %_915) (%_908 equal? %_914 %_915)))
       (set! memq
         (lambda (%_916 %_917) (%_909 eq? %_916 %_917)))
       (set! memv
         (lambda (%_918 %_919) (%_909 eqv? %_918 %_919)))
       (set! member
         (lambda (%_920 %_921) (%_909 equal? %_920 %_921))))))
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
  (lambda (%_928 %_929)
    (if (null? %_928)
      %_929
      (cons (car %_928) (append2 (cdr %_928) %_929)))))
(define append append2)
(define list->string
  (lambda (%_930)
    ((lambda (%_931)
       (begin
         (set! %_931
           (lambda (%_932 %_933 %_934)
             (if (null? %_932)
               %_933
               (begin
                 (string-set! %_933 %_934 (car %_932))
                 (%_931 (cdr %_932) %_933 (+ %_934 '1))))))
         (%_931 %_930 (make-string (length %_930)) '0)))
     #f)))
(define string->list
  ((lambda (%_935)
     (begin
       (set! %_935
         (lambda (%_937 %_938 %_939)
           (if (< %_939 '0)
             %_938
             (%_935 %_937
                    (cons (string-ref %_937 %_939) %_938)
                    (- %_939 '1)))))
       (lambda (%_936)
         (%_935 %_936 '() (- (string-length %_936) '1)))))
   #f))
(define list->vector
  ((lambda (%_940)
     (begin
       (set! %_940
         (lambda (%_942 %_943 %_944)
           (if (null? %_942)
             %_943
             (begin
               (vector-set! %_943 %_944 (car %_942))
               (%_940 (cdr %_942) %_943 (+ %_944 '1))))))
       (lambda (%_941)
         (if (proper-list? %_941)
           (%_940 %_941 (make-vector (length %_941)) '0)
           (error 'list->vector
                  '"can only convert a proper list."
                  %_941)))))
   #f))
(define vector
  (lambda %_945 (list->vector %_945)))
(define string
  (lambda %_946 (list->string %_946)))
(define detect-os
  (lambda ()
    ((lambda (%_947)
       (if (> (string-length %_947) '3)
         (if (equal? (substring %_947 '0 '3) '"mac")
           'macos
           (if (equal? (substring %_947 '0 '3) '"win")
             'ms-dos
             (if (equal? (substring %_947 '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring %_947 '0 '3) '"uni")
                 'unix
                 (if (equal? (substring %_947 '0 '3) '"lin")
                   'unix
                   (if (equal? (substring %_947 '0 '4) '"os/")
                     'os2
                     (if (equal? (substring %_947 '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase
       (getprop 'os.name '*environment-variables*)))))
(define current-url (make-parameter '"file:."))
(define current-directory
  (lambda %_948
    (if (null? %_948)
      (normalize-url (current-url) '".")
      (current-url
        (normalize-url (current-url) (car %_948))))))
((lambda (%_949)
   (begin
     (set! open-input-file (%_949 open-input-file))
     (set! open-source-input-file
       (%_949 open-source-input-file))
     (set! open-output-file (%_949 open-output-file))
     (set! load
       ((lambda (%_950)
          (lambda (%_951)
            (begin
              ((lambda (%_952)
                 (begin
                   (current-url (normalize-url %_952 %_951))
                   (call-with-failure-continuation
                     (lambda () (%_950 (current-url)))
                     (lambda (%_953 %_954 %_955)
                       (begin (current-url %_952) (%_955 %_953 %_954))))
                   (current-url %_952)))
               (current-url))
              (void))))
        load))))
 (lambda (%_956)
   (lambda (%_958 . %_957)
     (apply %_956
            (normalize-url (current-url) %_958)
            %_957))))
(define load-module
  (lambda (%_959)
    ((lambda (%_960)
       ((lambda (%_961)
          ((lambda ()
             (for-each
               (lambda (%_962)
                 (putprop
                   %_962
                   '*toplevel*
                   (native-library-binding %_960 %_962)))
               %_961))))
        (native-library-binding-names %_960)))
     (load-native-library %_959))))
(define reverse
  ((lambda (%_963)
     (begin
       (set! %_963
         (lambda (%_965 %_966)
           (if (null? %_965)
             %_966
             (%_963 (cdr %_965) (cons (car %_965) %_966)))))
       (lambda (%_964) (%_963 %_964 '()))))
   #f))
(define remove
  (lambda (%_967 %_968)
    (if (null? %_968)
      '()
      (if (equal? (car %_968) %_967)
        (remove %_967 (cdr %_968))
        (cons (car %_968) (remove %_967 (cdr %_968)))))))
(define append
  ((lambda (%_969)
     (begin
       (set! %_969
         (lambda (%_972 . %_971)
           (if (null? %_971)
             %_972
             (if (null? %_972)
               (apply %_969 %_971)
               (apply %_969
                      (cons (append2 %_972 (car %_971)) (cdr %_971)))))))
       (lambda %_970
         (if (null? %_970)
           '()
           (if (null? (cdr %_970))
             (car %_970)
             (apply %_969 (cons (car %_970) (cdr %_970))))))))
   #f))
(define map
  ((lambda (%_973 %_974)
     (begin
       (set! %_973 map)
       (set! %_974
         (lambda (%_978 %_979 %_980 %_981)
           (if (null? (car %_979))
             (if (andmap null? %_979)
               %_980
               (error 'map '"lists are not of equal length."))
             ((lambda (%_982 %_983)
                (begin
                  (if (not (null? %_981))
                    (set-cdr! %_981 %_982)
                    (void))
                  (if (null? %_980)
                    (%_974 %_978 %_983 %_982 %_982)
                    (%_974 %_978 %_983 %_980 %_982))))
              (cons (apply %_978 (%_973 car %_979)) '())
              (%_973 cdr %_979)))))
       (lambda (%_977 %_976 . %_975)
         (if (null? %_975)
           (%_973 %_977 %_976)
           (%_974 %_977 (cons %_976 %_975) '() '())))))
   #f
   #f))
(define proper-list?
  (lambda (%_984)
    (((lambda (%_985)
        (begin
          (set! %_985
            (lambda (%_986 %_987)
              (if (pair? %_986)
                ((lambda (%_988)
                   (if (pair? %_988)
                     ((lambda (%_989 %_990)
                        (if (not (eq? %_989 %_990))
                          (%_985 %_989 %_990)
                          '#f))
                      (cdr %_988)
                      (cdr %_987))
                     (null? %_988)))
                 (cdr %_986))
                (null? %_986))))
          %_985))
      #f)
     %_984
     %_984)))
(define circular?
  (lambda (%_991)
    ((lambda (%_996 %_995 %_994 %_993 %_992)
       (begin
         (set! %_996
           (lambda (%_998 %_999)
             ((lambda (%_1000)
                (begin
                  (set! %_1000
                    (lambda (%_1009 %_1010)
                      ((lambda (%_1011)
                         (if %_1011
                           (%_996 (%_995 %_1009) (%_995 %_1011))
                           '#f))
                       (%_995 %_1010))))
                  (if %_999
                    (if (not (eq? (car %_999) (car %_998)))
                      (%_1000 %_998 %_999)
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
                                                             (%_995 %_1007))))
                                                       (eq? (car %_1007)
                                                            %_1005))
                                                      (%_1000 %_1002 %_1003))))
                                                %_1006))
                                            #f)
                                           (%_995 (list %_1005))))
                                        (car %_1002)))))
                                 (null? (cdr %_1002)))))
                            %_1001))
                        #f)
                       %_998
                       %_999))
                    '#f)))
              #f)))
         (set! %_995
           (lambda (%_1012)
             ((lambda (%_1013)
                (((lambda (%_1014)
                    (begin
                      (set! %_1014
                        (lambda (%_1015 %_1016 %_1017)
                          (if (>= %_1016 '0)
                            ((lambda (%_1021)
                               (if (%_992 %_1021)
                                 (cons %_1021 (cons %_1016 %_1017))
                                 (%_1014 %_1015 (- %_1016 '1) %_1017)))
                             (%_994 %_1015 %_1016))
                            ((lambda (%_1018)
                               (if (pair? %_1018)
                                 ((lambda (%_1019 %_1020)
                                    (%_1014 (car %_1020) (- %_1019 '1) %_1020))
                                  (car %_1018)
                                  (cdr %_1018))
                                 '#f))
                             (cdr %_1017)))))
                      %_1014))
                  #f)
                 %_1013
                 (- (%_993 %_1013) '1)
                 %_1012))
              (car %_1012))))
         (set! %_994
           (lambda (%_1022 %_1023)
             (if (vector? %_1022)
               (vector-ref %_1022 %_1023)
               (if (box? %_1022)
                 (unbox %_1022)
                 ((if (zero? %_1023) car cdr) %_1022)))))
         (set! %_993
           (lambda (%_1024)
             (if (pair? %_1024)
               '2
               (if (box? %_1024) '1 (vector-length %_1024)))))
         (set! %_992
           (lambda (%_1025)
             ((lambda (%_1026)
                (if %_1026
                  %_1026
                  ((lambda (%_1027)
                     (if %_1027
                       %_1027
                       (if (vector? %_1025)
                         (not (zero? (vector-length %_1025)))
                         '#f)))
                   (box? %_1025))))
              (pair? %_1025))))
         (if (%_992 %_991)
           ((lambda (%_997) (%_996 %_997 (%_995 %_997)))
            (list %_991))
           '#f)))
     #f
     #f
     #f
     #f
     #f)))
(define list?
  ((lambda (%_1028)
     (begin
       (set! %_1028
         (lambda (%_1031 %_1032)
           ((lambda (%_1033)
              (if %_1033
                %_1033
                ((lambda (%_1034)
                   (if %_1034
                     %_1034
                     (if (pair? %_1032)
                       ((lambda (%_1035)
                          (if %_1035
                            %_1035
                            (if (not (eq? %_1031 %_1032))
                              (%_1028 (cdr %_1031) (cddr %_1032))
                              '#f)))
                        (null? (cdr %_1032)))
                       '#f)))
                 (null? %_1032))))
            (null? %_1031))))
       (lambda (%_1029)
         ((lambda (%_1030)
            (if %_1030
              %_1030
              (if (pair? %_1029)
                (%_1028 %_1029 (cdr %_1029))
                '#f)))
          (null? %_1029)))))
   #f))
(define expt
  (lambda (%_1036 %_1037)
    (if (if (integer? %_1037) (= %_1036 '2) '#f)
      (ashl '1 %_1037)
      (((lambda (%_1038)
          (begin
            (set! %_1038
              (lambda (%_1039 %_1040 %_1041)
                (if (zero? %_1039)
                  %_1040
                  (%_1038
                    (quotient %_1039 '2)
                    (if (odd? %_1039) (* %_1040 %_1041) %_1040)
                    (* %_1041 %_1041)))))
            %_1038))
        #f)
       %_1037
       '1
       %_1036))))
(define modpow
  (lambda (%_1042 %_1043 %_1044)
    ((lambda (%_1045)
       (if (= %_1043 '1)
         (modulo %_1042 %_1044)
         (if (even? %_1043)
           ((lambda (%_1047)
              (modulo (* %_1047 %_1047) %_1044))
            (modpow %_1042 (/ %_1043 '2) %_1044))
           ((lambda (%_1046)
              (begin
                (set! %_1046 (modulo (* %_1046 %_1046) %_1044))
                (modulo (* %_1042 %_1046) %_1044)))
            (modpow %_1042 (/ (- %_1043 '1) '2) %_1044)))))
     '0)))
(define integer?
  ((lambda (%_1048)
     (lambda (%_1049)
       ((lambda (%_1050)
          (if %_1050
            %_1050
            (if (real? %_1049) (= (round %_1049) %_1049) '#f)))
        (%_1048 %_1049))))
   integer?))
(define real?
  ((lambda (%_1051)
     (lambda (%_1052)
       (if (number? %_1052) (not (%_1051 %_1052)) '#f)))
   complex?))
(define complex? number?)
(define abs
  (lambda (%_1053)
    (if (not (real? %_1053))
      ((lambda (%_1054 %_1055)
         (sqrt (+ (* %_1054 %_1054) (* %_1055 %_1055))))
       (real-part %_1053)
       (imag-part %_1053))
      (if (< %_1053 '0) (- %_1053) %_1053))))
(define min (void))
(define max (void))
((lambda (%_1056)
   (begin
     (set! %_1056
       (lambda (%_1061 %_1062 %_1063 %_1064)
         (if (null? %_1063)
           (if (if %_1064 (exact? %_1062) '#f)
             (exact->inexact %_1062)
             %_1062)
           (if (%_1061 (car %_1063) %_1062)
             (%_1056
               %_1061
               (car %_1063)
               (cdr %_1063)
               ((lambda (%_1065)
                  (if %_1065 %_1065 (inexact? (car %_1063))))
                %_1064))
             (%_1056 %_1061 %_1062 (cdr %_1063) %_1064)))))
     (begin
       (set! min
         (lambda (%_1058 . %_1057)
           (if (null? %_1057)
             %_1058
             (%_1056 < %_1058 %_1057 (inexact? %_1058)))))
       (set! max
         (lambda (%_1060 . %_1059)
           (if (null? %_1059)
             %_1060
             (%_1056 > %_1060 %_1059 (inexact? %_1060))))))))
 #f)
(define negative?
  (lambda (%_1066) (< %_1066 '0)))
(define positive?
  (lambda (%_1067) (> %_1067 '0)))
(define even?
  (lambda (%_1068) (= '0 (modulo %_1068 '2))))
(define odd?
  (lambda (%_1069) (not (even? %_1069))))
(define zero? (lambda (%_1070) (= %_1070 '0)))
(define add1 (lambda (%_1071) (+ %_1071 '1)))
(define sub1 (lambda (%_1072) (- %_1072 '1)))
(define >= (void))
(define <= (void))
((lambda (%_1073 %_1074)
   (begin
     (set! <=
       (%_1073
         (lambda (%_1075 %_1076)
           ((lambda (%_1077)
              (if %_1077 %_1077 (= %_1075 %_1076)))
            (< %_1075 %_1076)))
         %_1074
         '#t))
     (set! >=
       (%_1073
         (lambda (%_1078 %_1079)
           ((lambda (%_1080)
              (if %_1080 %_1080 (= %_1078 %_1079)))
            (> %_1078 %_1079)))
         %_1074
         '#t))))
 (lambda (%_1081 %_1082 %_1083)
   (lambda %_1084
     (((lambda (%_1085)
         (begin
           (set! %_1085
             (lambda (%_1086)
               (if (null? %_1086)
                 %_1083
                 (if (null? (cdr %_1086))
                   %_1083
                   (%_1082
                     (%_1081 (car %_1086) (cadr %_1086))
                     (%_1085 (cdr %_1086)))))))
           %_1085))
       #f)
      %_1084)))
 (lambda (%_1087 %_1088) (if %_1087 %_1088 '#f)))
((lambda (%_1089)
   (begin
     (set! >= (%_1089 > >=))
     (set! <= (%_1089 < <=))))
 (lambda (%_1090 %_1091)
   (lambda %_1092
     ((lambda (%_1093)
        (if %_1093
          %_1093
          ((lambda (%_1094)
             (if %_1094
               %_1094
               (if ((lambda (%_1095)
                      (if %_1095
                        %_1095
                        (%_1090 (car %_1092) (cadr %_1092))))
                    (= (car %_1092) (cadr %_1092)))
                 (apply %_1091 (cdr %_1092))
                 '#f)))
           (null? (cdr %_1092)))))
      (null? %_1092)))))
(define gcd
  (lambda %_1096
    (if (null? %_1096)
      '0
      (if (null? (cdr %_1096))
        (car %_1096)
        (_gcd (car %_1096) (cadr %_1096))))))
(define lcm
  (lambda %_1097
    (if (null? %_1097)
      '1
      (if (null? (cdr %_1097))
        (car %_1097)
        (_lcm (car %_1097) (cadr %_1097))))))
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
  (lambda %_1098
    (if (null? %_1098)
      '""
      (if (null? (cdr %_1098))
        (car %_1098)
        (apply string-append
               (_string-append (car %_1098) (cadr %_1098))
               (cddr %_1098))))))
(define char-downcase
  ((lambda (%_1099)
     ((lambda (%_1100)
        ((lambda (%_1101)
           ((lambda ()
              (lambda (%_1102)
                ((lambda (%_1103)
                   (if (if (>= %_1103 %_1099) (<= %_1103 %_1100) '#f)
                     (integer->char (+ %_1103 %_1101))
                     %_1102))
                 (char->integer %_1102))))))
         (- (char->integer '#\a) %_1099)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_1104)
     ((lambda (%_1105)
        ((lambda (%_1106)
           ((lambda ()
              (lambda (%_1107)
                ((lambda (%_1108)
                   (if (if (>= %_1108 %_1104) (<= %_1108 %_1105) '#f)
                     (integer->char (- %_1108 %_1106))
                     %_1107))
                 (char->integer %_1107))))))
         (- %_1104 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_1109 %_1110)
    (> (char->integer %_1109) (char->integer %_1110))))
(define char<?
  (lambda (%_1111 %_1112)
    (< (char->integer %_1111) (char->integer %_1112))))
(define char=? eq?)
(define char>=?
  (lambda (%_1113 %_1114)
    ((lambda (%_1115)
       (if %_1115 %_1115 (char=? %_1113 %_1114)))
     (char>? %_1113 %_1114))))
(define char<=?
  (lambda (%_1116 %_1117)
    ((lambda (%_1118)
       (if %_1118 %_1118 (char=? %_1116 %_1117)))
     (char<? %_1116 %_1117))))
(define char-ci>?
  (lambda (%_1119 %_1120)
    (char>?
      (char-downcase %_1119)
      (char-downcase %_1120))))
(define char-ci<?
  (lambda (%_1121 %_1122)
    (char<?
      (char-downcase %_1121)
      (char-downcase %_1122))))
(define char-ci=?
  (lambda (%_1123 %_1124)
    (char=?
      (char-downcase %_1123)
      (char-downcase %_1124))))
(define char-ci>=?
  (lambda (%_1125 %_1126)
    ((lambda (%_1127)
       (if %_1127 %_1127 (char-ci=? %_1125 %_1126)))
     (char-ci>? %_1125 %_1126))))
(define char-ci<=?
  (lambda (%_1128 %_1129)
    ((lambda (%_1130)
       (if %_1130 %_1130 (char-ci=? %_1128 %_1129)))
     (char-ci<? %_1128 %_1129))))
(define char-alphabetic?
  (lambda (%_1131)
    (if (char-ci>=? %_1131 '#\a)
      (char-ci<=? %_1131 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_1132)
    (if (char-ci>=? %_1132 '#\0)
      (char-ci<=? %_1132 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_1133)
    (if (memq %_1133 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_1134)
    (if (char-alphabetic? %_1134)
      (char>? %_1134 '#\a)
      '#f)))
(define char-lower-case?
  (lambda (%_1135)
    (if (char-alphabetic? %_1135)
      (char>? %_1135 '#\Z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
((lambda (%_1136)
   (begin
     (set! %_1136
       (lambda (%_1141 %_1142 %_1143 %_1144 %_1145)
         (if (< %_1144 %_1145)
           (begin
             (string-set!
               %_1142
               %_1144
               (%_1143 (string-ref %_1141 %_1144)))
             (%_1136
               %_1141
               %_1142
               %_1143
               (+ %_1144 '1)
               %_1145))
           %_1142)))
     (begin
       (set! string-downcase
         (lambda (%_1137)
           ((lambda (%_1138)
              (%_1136
                %_1137
                %_1138
                char-downcase
                '0
                (string-length %_1137)))
            (make-string (string-length %_1137)))))
       (set! string-upcase
         (lambda (%_1139)
           ((lambda (%_1140)
              (%_1136
                %_1139
                %_1140
                char-upcase
                '0
                (string-length %_1139)))
            (make-string (string-length %_1139))))))))
 #f)
(define string=? equal?)
(define string<?
  ((lambda (%_1146)
     (begin
       (set! %_1146
         (lambda (%_1149 %_1150)
           (if (null? %_1149)
             (not (null? %_1150))
             (if (null? %_1150)
               '#f
               ((lambda (%_1151 %_1152)
                  (if (char<? %_1151 %_1152)
                    '#t
                    (if (char>? %_1151 %_1152)
                      '#f
                      (%_1146 (cdr %_1149) (cdr %_1150)))))
                (car %_1149)
                (car %_1150))))))
       (lambda (%_1147 %_1148)
         (%_1146
           (string->list %_1147)
           (string->list %_1148)))))
   #f))
(define string>?
  ((lambda (%_1153)
     (begin
       (set! %_1153
         (lambda (%_1156 %_1157)
           (if (null? %_1157)
             (not (null? %_1156))
             (if (null? %_1156)
               '#f
               ((lambda (%_1158 %_1159)
                  (if (char>? %_1158 %_1159)
                    '#t
                    (if (char<? %_1158 %_1159)
                      '#f
                      (%_1153 (cdr %_1156) (cdr %_1157)))))
                (car %_1156)
                (car %_1157))))))
       (lambda (%_1154 %_1155)
         (%_1153
           (string->list %_1154)
           (string->list %_1155)))))
   #f))
(define string<=?
  (lambda (%_1160 %_1161)
    ((lambda (%_1162)
       (if %_1162 %_1162 (string=? %_1160 %_1161)))
     (string<? %_1160 %_1161))))
(define string>=?
  (lambda (%_1163 %_1164)
    ((lambda (%_1165)
       (if %_1165 %_1165 (string=? %_1163 %_1164)))
     (string>? %_1163 %_1164))))
(define string-ci=?
  (lambda (%_1166 %_1167)
    (string=?
      (string-downcase %_1166)
      (string-downcase %_1167))))
(define string-ci<?
  (lambda (%_1168 %_1169)
    (string<?
      (string-downcase %_1168)
      (string-downcase %_1169))))
(define string-ci>?
  (lambda (%_1170 %_1171)
    (string>?
      (string-downcase %_1170)
      (string-downcase %_1171))))
(define string-ci>=?
  (lambda (%_1172 %_1173)
    (string>=?
      (string-downcase %_1172)
      (string-downcase %_1173))))
(define string-ci<=?
  (lambda (%_1174 %_1175)
    (string<=?
      (string-downcase %_1174)
      (string-downcase %_1175))))
(define substring
  ((lambda (%_1176)
     (begin
       (set! %_1176
         (lambda (%_1181 %_1182 %_1183 %_1184 %_1185)
           (if (< %_1184 %_1185)
             (begin
               (string-set!
                 %_1182
                 %_1183
                 (string-ref %_1181 %_1184))
               (%_1176
                 %_1181
                 %_1182
                 (+ %_1183 '1)
                 (+ %_1184 '1)
                 %_1185))
             (void))))
       (lambda (%_1177 %_1178 %_1179)
         ((lambda (%_1180)
            (begin
              (%_1176 %_1177 %_1180 '0 %_1178 %_1179)
              %_1180))
          (make-string (- %_1179 %_1178))))))
   #f))
(define format
  ((lambda (%_1186)
     (begin
       (set! %_1186
         (lambda (%_1189 %_1190 %_1191)
           (if (null? %_1189)
             (get-output-string %_1191)
             (if (eq? (car %_1189) '#\~)
               (begin
                 ((lambda (%_1192)
                    (if (memv %_1192 '(#\s))
                      (write (car %_1190) %_1191)
                      (if (memv %_1192 '(#\a))
                        (display (car %_1190) %_1191)
                        (if (memv %_1192 '(#\%))
                          (display '#\newline %_1191)
                          (if (memv %_1192 '(#\~))
                            (display '#\~ %_1191)
                            (void))))))
                  (cadr %_1189))
                 (%_1186
                   (cddr %_1189)
                   (if (not (null? %_1190)) (cdr %_1190) '())
                   %_1191))
               (begin
                 (display (car %_1189) %_1191)
                 (%_1186 (cdr %_1189) %_1190 %_1191))))))
       (lambda (%_1188 . %_1187)
         (%_1186
           (string->list %_1188)
           %_1187
           (open-output-string)))))
   #f))
(define error
  ((lambda (%_1193)
     (lambda %_1194
       ((lambda (%_1195)
          ((lambda (%_1196)
             ((lambda (%_1197)
                ((lambda ()
                   (if %_1195
                     (if %_1196
                       (%_1193
                         (format
                           '"Error in ~s: ~a"
                           %_1195
                           (apply format (cons %_1196 %_1197))))
                       (%_1193 (format '"Error in ~s." %_1195)))
                     (if %_1196
                       (if (string? %_1196)
                         (%_1193
                           (format
                             '"Error: ~a"
                             (apply format (cons %_1196 %_1197))))
                         (if (null? %_1197)
                           (%_1193 %_1196)
                           (error 'error
                                  '"cannot specify error arguments to a non format-string error.")))
                       (%_1193 '"Error."))))))
              (if (not %_1196)
                '()
                (if (not %_1195)
                  (if (not (null? %_1194))
                    (if (not (car %_1194))
                      (cddr %_1194)
                      (cdr %_1194))
                    (cdr %_1194))
                  (cddr %_1194)))))
           (if (not %_1195)
             (if (not (null? %_1194))
               (if (not (car %_1194))
                 (cadr %_1194)
                 (car %_1194))
               '#f)
             (if (not (null? (cdr %_1194))) (cadr %_1194) '#f))))
        (if (if (not (null? %_1194))
              (symbol? (car %_1194))
              '#f)
          (car %_1194)
          '#f))))
   error))
(define list-ref
  (lambda (%_1198 %_1199)
    (if (zero? %_1199)
      (car %_1198)
      (list-ref (cdr %_1198) (- %_1199 '1)))))
(define iota
  ((lambda (%_1200)
     (begin
       (set! %_1200
         (lambda (%_1202 %_1203)
           (if (> %_1202 %_1203)
             '()
             (cons %_1202 (%_1200 (+ %_1202 '1) %_1203)))))
       (lambda (%_1201) (%_1200 '0 %_1201))))
   #f))
(define values
  (lambda %_1204
    (call-with-current-continuation
      (lambda (%_1205) (apply %_1205 %_1204)))))
