(define for-each
  (lambda (%_869 . %_868)
    (if (null? %_868)
      (error 'for-each
             '"invalid number of arguments to procedure for-each")
      (if (not (null? (car %_868)))
        (begin
          (apply %_869 (map car %_868))
          (apply for-each (cons %_869 (map cdr %_868))))
        (void)))))
(define exit (lambda () '#!eof))
(define eof-object?
  (lambda (%_870) (eq? %_870 '#!eof)))
(define not (lambda (%_871) (if %_871 '#f '#t)))
(define eqv? eq?)
(define newline
  (lambda %_872
    (apply display (cons '#\newline %_872))))
(define map (void))
((lambda (%_873)
   (begin
     (set! %_873
       ((lambda (%_874)
          (begin
            (set! %_874
              (lambda (%_875 %_876 %_877 %_878)
                (if (null? %_878)
                  %_876
                  (begin
                    (set-cdr! %_877 (cons (%_875 (car %_878)) '()))
                    (%_874 %_875 %_876 (cdr %_877) (cdr %_878))))))
            (lambda (%_879 %_880)
              (if (null? %_880)
                '()
                ((lambda (%_881)
                   (%_874 %_879 %_881 %_881 (cdr %_880)))
                 (cons (%_879 (car %_880)) '()))))))
        #f))
     (set! map %_873)))
 #f)
(define compose
  (lambda %_882
    (if (null? %_882)
      (lambda (%_883) %_883)
      ((lambda (%_884 %_885)
         (lambda (%_886) (%_884 (%_885 %_886))))
       (car %_882)
       (apply compose (cdr %_882))))))
(define compose2
  (lambda (%_887 %_888)
    (lambda (%_889) (%_887 (%_888 %_889)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
((lambda (%_890 %_891)
   (begin
     (set! %_890
       (lambda (%_892 %_893 %_894)
         (if (null? %_894)
           '#f
           (if (%_892 (caar %_894) %_893)
             (car %_894)
             (%_890 %_892 %_893 (cdr %_894))))))
     (set! %_891
       (lambda (%_895 %_896 %_897)
         (if (null? %_897)
           '#f
           (if (%_895 (car %_897) %_896)
             %_897
             (%_891 %_895 %_896 (cdr %_897))))))
     (begin
       (set! assq
         (lambda (%_898 %_899) (%_890 eq? %_898 %_899)))
       (set! assv
         (lambda (%_900 %_901) (%_890 eqv? %_900 %_901)))
       (set! assoc
         (lambda (%_902 %_903) (%_890 equal? %_902 %_903)))
       (set! memq
         (lambda (%_904 %_905) (%_891 eq? %_904 %_905)))
       (set! memv
         (lambda (%_906 %_907) (%_891 eqv? %_906 %_907)))
       (set! member
         (lambda (%_908 %_909) (%_891 equal? %_908 %_909))))))
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
  (lambda (%_910 %_911)
    (if (null? %_910)
      %_911
      (cons (car %_910) (append2 (cdr %_910) %_911)))))
(define append append2)
(define list->string
  (lambda (%_912)
    ((lambda (%_913)
       (begin
         (set! %_913
           (lambda (%_914 %_915 %_916)
             (if (null? %_914)
               %_915
               (begin
                 (string-set! %_915 %_916 (car %_914))
                 (%_913 (cdr %_914) %_915 (+ %_916 '1))))))
         (%_913 %_912 (make-string (length %_912)) '0)))
     #f)))
(define string->list
  ((lambda (%_917)
     (begin
       (set! %_917
         (lambda (%_918 %_919 %_920)
           (if (< %_920 '0)
             %_919
             (%_917 %_918
                    (cons (string-ref %_918 %_920) %_919)
                    (- %_920 '1)))))
       (lambda (%_921)
         (%_917 %_921 '() (- (string-length %_921) '1)))))
   #f))
(define list->vector
  ((lambda (%_922)
     (begin
       (set! %_922
         (lambda (%_923 %_924 %_925)
           (if (null? %_923)
             %_924
             (begin
               (vector-set! %_924 %_925 (car %_923))
               (%_922 (cdr %_923) %_924 (+ %_925 '1))))))
       (lambda (%_926)
         (if (not (circular? %_926))
           (%_922 %_926 (make-vector (length %_926)) '0)
           (error 'list->vector
                  '"cannot convert a circular list"
                  %_926)))))
   #f))
(define vector
  (lambda %_927 (list->vector %_927)))
(define string
  (lambda %_928 (list->string %_928)))
(define detect-os
  (lambda ()
    ((lambda (%_929)
       (if (> (string-length %_929) '3)
         (if (equal? (substring %_929 '0 '3) '"mac")
           'macos
           (if (equal? (substring %_929 '0 '3) '"win")
             'ms-dos
             (if (equal? (substring %_929 '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring %_929 '0 '3) '"uni")
                 'unix
                 (if (equal? (substring %_929 '0 '3) '"lin")
                   'unix
                   (if (equal? (substring %_929 '0 '4) '"os/")
                     'os2
                     (if (equal? (substring %_929 '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase
       (getprop 'os.name '*environment-variables*)))))
(define current-directory (void))
((lambda (%_930 %_931 %_932)
   (begin
     (set! %_930
       (lambda %_933
         (if (null? %_933)
           (getprop 'current-directory '*sisc*)
           (putprop 'current-directory '*sisc* (car %_933)))))
     (set! %_931
       (lambda (%_934)
         (if ((lambda (%_935)
                (if %_935
                  %_935
                  (if (memq (detect-os) '(ms-dos windows))
                    (if (> (string-length %_934) '1)
                      (eq? (string-ref %_934 '1) '#\:)
                      '#f)
                    '#f)))
              (absolute-path? %_934))
           %_934
           (make-path (%_930) %_934))))
     (set! %_932
       (lambda (%_936 %_937)
         (if (eq? (file-type %_936) %_937)
           '#t
           (error 'file-type
                  '"~s is not of type ~s"
                  %_936
                  %_937))))
     ((lambda (%_941 %_940 %_939 %_938)
        (begin
          (set! %_941
            ((lambda (%_942)
               (lambda (%_943) (%_942 (%_931 %_943))))
             load))
          (set! %_940
            ((lambda (%_944)
               (lambda (%_945)
                 ((lambda (%_946)
                    (if (not (memq (file-type %_946) '(no-file file)))
                      (error 'open-output-file
                             '"~s points to a directory"
                             %_946)
                      (%_944 %_946)))
                  (%_931 %_945))))
             open-output-file))
          (set! %_939
            ((lambda (%_947)
               (lambda (%_948)
                 ((lambda (%_949)
                    (begin (%_932 %_949 'file) (%_947 %_949)))
                  (%_931 %_948))))
             open-input-file))
          (set! %_938
            (lambda %_950
              (if (null? %_950)
                (%_930)
                ((lambda (%_951)
                   (begin (%_932 %_951 'directory) (%_930 %_951)))
                 (%_931 (car %_950))))))
          (begin
            (%_930 '".")
            (set! load %_941)
            (set! current-directory %_938)
            (set! open-input-file %_939)
            (set! open-output-file %_940))))
      #f
      #f
      #f
      #f)))
 #f
 #f
 #f)
(define load-module
  (lambda (%_952)
    ((lambda (%_953)
       ((lambda (%_954)
          ((lambda ()
             (for-each
               (lambda (%_955)
                 (putprop
                   %_955
                   '*toplevel*
                   (get-native-library-binding %_953 %_955)))
               %_954))))
        (get-native-library-binding-names %_953)))
     (load-native-library %_952))))
(define reverse
  ((lambda (%_956)
     (begin
       (set! %_956
         (lambda (%_957 %_958)
           (if (null? %_957)
             %_958
             (%_956 (cdr %_957) (cons (car %_957) %_958)))))
       (lambda (%_959) (%_956 %_959 '()))))
   #f))
(define remove
  (lambda (%_960 %_961)
    (if (null? %_961)
      '()
      (if (equal? (car %_961) %_960)
        (remove %_960 (cdr %_961))
        (cons (car %_961) (remove %_960 (cdr %_961)))))))
(define append
  ((lambda (%_962)
     (begin
       (set! %_962
         (lambda (%_964 . %_963)
           (if (null? %_963)
             %_964
             (if (null? %_964)
               (apply %_962 %_963)
               (apply %_962
                      (cons (append2 %_964 (car %_963)) (cdr %_963)))))))
       (lambda %_965
         (if (null? %_965)
           '()
           (if (null? (cdr %_965))
             (car %_965)
             (apply %_962 (cons (car %_965) (cdr %_965))))))))
   #f))
(define map
  ((lambda (%_966 %_967)
     (begin
       (set! %_966 map)
       (set! %_967
         (lambda (%_968 %_969 %_970 %_971)
           (if (null? (car %_969))
             (if (andmap null? %_969)
               %_970
               (error 'map '"lists are not of equal length"))
             ((lambda (%_972 %_973)
                (begin
                  (if (not (null? %_971))
                    (set-cdr! %_971 %_972)
                    (void))
                  (if (null? %_970)
                    (%_967 %_968 %_973 %_972 %_972)
                    (%_967 %_968 %_973 %_970 %_972))))
              (cons (apply %_968 (%_966 car %_969)) '())
              (%_966 cdr %_969)))))
       (lambda (%_976 %_975 . %_974)
         (if (null? %_974)
           (%_966 %_976 %_975)
           (%_967 %_976 (cons %_975 %_974) '() '())))))
   #f
   #f))
(define circular?
  (lambda (%_977)
    ((lambda (%_982 %_981 %_980 %_979 %_978)
       (begin
         (set! %_982
           (lambda (%_983 %_984)
             ((lambda (%_985)
                (begin
                  (set! %_985
                    (lambda (%_986 %_987)
                      ((lambda (%_988)
                         (if %_988
                           (%_982 (%_981 %_986) (%_981 %_988))
                           '#f))
                       (%_981 %_987))))
                  (if %_984
                    (if (not (eq? (car %_984) (car %_983)))
                      (%_985 %_983 %_984)
                      (((lambda (%_989)
                          (begin
                            (set! %_989
                              (lambda (%_990 %_991)
                                ((lambda (%_992)
                                   (if %_992
                                     %_992
                                     (if (if (= (cadr %_990) (cadr %_991))
                                           (eq? (caddr %_990) (caddr %_991))
                                           '#f)
                                       (%_989 (cddr %_990) (cddr %_991))
                                       ((lambda (%_993)
                                          (((lambda (%_994)
                                              (begin
                                                (set! %_994
                                                  (lambda (%_995)
                                                    (if %_995
                                                      ((lambda (%_996)
                                                         (if %_996
                                                           %_996
                                                           (%_994 (%_981 %_995))))
                                                       (eq? (car %_995) %_993))
                                                      (%_985 %_990 %_991))))
                                                %_994))
                                            #f)
                                           (%_981 (list %_993))))
                                        (car %_990)))))
                                 (null? (cdr %_990)))))
                            %_989))
                        #f)
                       %_983
                       %_984))
                    '#f)))
              #f)))
         (set! %_981
           (lambda (%_997)
             ((lambda (%_998)
                (((lambda (%_999)
                    (begin
                      (set! %_999
                        (lambda (%_1000 %_1001 %_1002)
                          (if (>= %_1001 '0)
                            ((lambda (%_1003)
                               (if (%_978 %_1003)
                                 (cons %_1003 (cons %_1001 %_1002))
                                 (%_999 %_1000 (- %_1001 '1) %_1002)))
                             (%_980 %_1000 %_1001))
                            ((lambda (%_1004)
                               (if (pair? %_1004)
                                 ((lambda (%_1005 %_1006)
                                    (%_999 (car %_1006) (- %_1005 '1) %_1006))
                                  (car %_1004)
                                  (cdr %_1004))
                                 '#f))
                             (cdr %_1002)))))
                      %_999))
                  #f)
                 %_998
                 (- (%_979 %_998) '1)
                 %_997))
              (car %_997))))
         (set! %_980
           (lambda (%_1007 %_1008)
             (if (vector? %_1007)
               (vector-ref %_1007 %_1008)
               (if (box? %_1007)
                 (unbox %_1007)
                 (if (pair? (cdr %_1007))
                   ((if (zero? %_1008) car cadr) %_1007)
                   ((if (zero? %_1008) car cdr) %_1007))))))
         (set! %_979
           (lambda (%_1009)
             (if (pair? %_1009)
               '2
               (if (box? %_1009) '1 (vector-length %_1009)))))
         (set! %_978
           (lambda (%_1010)
             ((lambda (%_1011)
                (if %_1011
                  %_1011
                  ((lambda (%_1012)
                     (if %_1012
                       %_1012
                       (if (vector? %_1010)
                         (not (zero? (vector-length %_1010)))
                         '#f)))
                   (box? %_1010))))
              (pair? %_1010))))
         (if (%_978 %_977)
           ((lambda (%_1013) (%_982 %_1013 (%_981 %_1013)))
            (list %_977))
           '#f)))
     #f
     #f
     #f
     #f
     #f)))
(define list?
  ((lambda (%_1014)
     (begin
       (set! %_1014
         (lambda (%_1015 %_1016)
           ((lambda (%_1017)
              (if %_1017
                %_1017
                ((lambda (%_1018)
                   (if %_1018
                     %_1018
                     (if (pair? %_1016)
                       ((lambda (%_1019)
                          (if %_1019
                            %_1019
                            (if (not (eq? %_1015 %_1016))
                              (%_1014 (cdr %_1015) (cddr %_1016))
                              '#f)))
                        (null? (cdr %_1016)))
                       '#f)))
                 (null? %_1016))))
            (null? %_1015))))
       (lambda (%_1020)
         ((lambda (%_1021)
            (if %_1021
              %_1021
              (if (pair? %_1020)
                (%_1014 %_1020 (cdr %_1020))
                '#f)))
          (null? %_1020)))))
   #f))
(define expt
  (lambda (%_1022 %_1023)
    (if (if (integer? %_1023) (= %_1022 '2) '#f)
      (ashl '1 %_1023)
      (((lambda (%_1024)
          (begin
            (set! %_1024
              (lambda (%_1025 %_1026 %_1027)
                (if (zero? %_1025)
                  %_1026
                  (%_1024
                    (quotient %_1025 '2)
                    (if (odd? %_1025) (* %_1026 %_1027) %_1026)
                    (* %_1027 %_1027)))))
            %_1024))
        #f)
       %_1023
       '1
       %_1022))))
(define modpow
  (lambda (%_1028 %_1029 %_1030)
    ((lambda (%_1031)
       (if (= %_1029 '1)
         (modulo %_1028 %_1030)
         (if (even? %_1029)
           ((lambda (%_1032)
              (modulo (* %_1032 %_1032) %_1030))
            (modpow %_1028 (/ %_1029 '2) %_1030))
           ((lambda (%_1033)
              (begin
                (set! %_1033 (modulo (* %_1033 %_1033) %_1030))
                (modulo (* %_1028 %_1033) %_1030)))
            (modpow %_1028 (/ (- %_1029 '1) '2) %_1030)))))
     '0)))
(define integer?
  ((lambda (%_1034)
     (lambda (%_1035)
       ((lambda (%_1036)
          (if %_1036
            %_1036
            (if (real? %_1035) (= (round %_1035) %_1035) '#f)))
        (%_1034 %_1035))))
   integer?))
(define real?
  ((lambda (%_1037)
     (lambda (%_1038) (not (%_1037 %_1038))))
   complex?))
(define complex? number?)
(define abs
  (lambda (%_1039)
    (if (not (real? %_1039))
      ((lambda (%_1040 %_1041)
         (sqrt (+ (* %_1040 %_1040) (* %_1041 %_1041))))
       (real-part %_1039)
       (imag-part %_1039))
      (if (< %_1039 '0) (- %_1039) %_1039))))
(define min (void))
(define max (void))
((lambda (%_1042)
   (begin
     (set! %_1042
       (lambda (%_1043 %_1044 %_1045 %_1046)
         (if (null? %_1045)
           (if (if %_1046 (exact? %_1044) '#f)
             (exact->inexact %_1044)
             %_1044)
           (if (%_1043 (car %_1045) %_1044)
             (%_1042
               %_1043
               (car %_1045)
               (cdr %_1045)
               ((lambda (%_1047)
                  (if %_1047 %_1047 (inexact? (car %_1045))))
                %_1046))
             (%_1042 %_1043 %_1044 (cdr %_1045) %_1046)))))
     (begin
       (set! min
         (lambda (%_1049 . %_1048)
           (if (null? %_1048)
             %_1049
             (%_1042 < %_1049 %_1048 (inexact? (car %_1048))))))
       (set! max
         (lambda (%_1051 . %_1050)
           (if (null? %_1050)
             %_1051
             (%_1042 > %_1051 %_1050 (inexact? (car %_1050)))))))))
 #f)
(define negative?
  (lambda (%_1052) (< %_1052 '0)))
(define positive?
  (lambda (%_1053) (> %_1053 '0)))
(define even?
  (lambda (%_1054) (= '0 (modulo %_1054 '2))))
(define odd?
  (lambda (%_1055) (not (even? %_1055))))
(define zero? (lambda (%_1056) (= %_1056 '0)))
(define add1 (lambda (%_1057) (+ %_1057 '1)))
(define sub1 (lambda (%_1058) (- %_1058 '1)))
(define >= (void))
(define <= (void))
((lambda (%_1059 %_1060)
   (begin
     (set! <=
       (%_1059
         (lambda (%_1061 %_1062)
           ((lambda (%_1063)
              (if %_1063 %_1063 (= %_1061 %_1062)))
            (< %_1061 %_1062)))
         %_1060
         '#t))
     (set! >=
       (%_1059
         (lambda (%_1064 %_1065)
           ((lambda (%_1066)
              (if %_1066 %_1066 (= %_1064 %_1065)))
            (> %_1064 %_1065)))
         %_1060
         '#t))))
 (lambda (%_1067 %_1068 %_1069)
   (lambda %_1070
     (((lambda (%_1071)
         (begin
           (set! %_1071
             (lambda (%_1072)
               (if (null? %_1072)
                 %_1069
                 (if (null? (cdr %_1072))
                   %_1069
                   (%_1068
                     (%_1067 (car %_1072) (cadr %_1072))
                     (%_1071 (cdr %_1072)))))))
           %_1071))
       #f)
      %_1070)))
 (lambda (%_1073 %_1074) (if %_1073 %_1074 '#f)))
((lambda (%_1075)
   (begin
     (set! >= (%_1075 > >=))
     (set! <= (%_1075 < <=))))
 (lambda (%_1076 %_1077)
   (lambda %_1078
     ((lambda (%_1079)
        (if %_1079
          %_1079
          ((lambda (%_1080)
             (if %_1080
               %_1080
               (if ((lambda (%_1081)
                      (if %_1081
                        %_1081
                        (%_1076 (car %_1078) (cadr %_1078))))
                    (= (car %_1078) (cadr %_1078)))
                 (apply %_1077 (cdr %_1078))
                 '#f)))
           (null? (cdr %_1078)))))
      (null? %_1078)))))
(define gcd
  (lambda %_1082
    (if (null? %_1082)
      '0
      (if (null? (cdr %_1082))
        (car %_1082)
        (_gcd (car %_1082) (cadr %_1082))))))
(define lcm
  (lambda %_1083
    (if (null? %_1083)
      '1
      (if (null? (cdr %_1083))
        (car %_1083)
        (_lcm (car %_1083) (cadr %_1083))))))
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
  (lambda %_1084
    (if (null? %_1084)
      '""
      (if (null? (cdr %_1084))
        (car %_1084)
        (apply string-append
               (_string-append (car %_1084) (cadr %_1084))
               (cddr %_1084))))))
(define char-downcase
  ((lambda (%_1085)
     ((lambda (%_1086)
        ((lambda (%_1087)
           ((lambda ()
              (lambda (%_1088)
                ((lambda (%_1089)
                   (if (if (>= %_1089 %_1085) (<= %_1089 %_1086) '#f)
                     (integer->char (+ %_1089 %_1087))
                     %_1088))
                 (char->integer %_1088))))))
         (- (char->integer '#\a) %_1085)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_1090)
     ((lambda (%_1091)
        ((lambda (%_1092)
           ((lambda ()
              (lambda (%_1093)
                ((lambda (%_1094)
                   (if (if (>= %_1094 %_1090) (<= %_1094 %_1091) '#f)
                     (integer->char (- %_1094 %_1092))
                     %_1093))
                 (char->integer %_1093))))))
         (- %_1090 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_1095 %_1096)
    (> (char->integer %_1095) (char->integer %_1096))))
(define char<?
  (lambda (%_1097 %_1098)
    (< (char->integer %_1097) (char->integer %_1098))))
(define char=? eq?)
(define char>=?
  (lambda (%_1099 %_1100)
    ((lambda (%_1101)
       (if %_1101 %_1101 (char=? %_1099 %_1100)))
     (char>? %_1099 %_1100))))
(define char<=?
  (lambda (%_1102 %_1103)
    ((lambda (%_1104)
       (if %_1104 %_1104 (char=? %_1102 %_1103)))
     (char<? %_1102 %_1103))))
(define char-ci>?
  (lambda (%_1105 %_1106)
    (char>?
      (char-downcase %_1105)
      (char-downcase %_1106))))
(define char-ci<?
  (lambda (%_1107 %_1108)
    (char<?
      (char-downcase %_1107)
      (char-downcase %_1108))))
(define char-ci=?
  (lambda (%_1109 %_1110)
    (char=?
      (char-downcase %_1109)
      (char-downcase %_1110))))
(define char-ci>=?
  (lambda (%_1111 %_1112)
    ((lambda (%_1113)
       (if %_1113 %_1113 (char-ci=? %_1111 %_1112)))
     (char-ci>? %_1111 %_1112))))
(define char-ci<=?
  (lambda (%_1114 %_1115)
    ((lambda (%_1116)
       (if %_1116 %_1116 (char-ci=? %_1114 %_1115)))
     (char-ci<? %_1114 %_1115))))
(define char-alphabetic?
  (lambda (%_1117)
    (if (char-ci>=? %_1117 '#\a)
      (char-ci<=? %_1117 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_1118)
    (if (char-ci>=? %_1118 '#\0)
      (char-ci<=? %_1118 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_1119)
    (if (memq %_1119 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_1120)
    (if (char-alphabetic? %_1120)
      (char<? %_1120 '#\a)
      '#f)))
(define char-lower-case?
  (lambda (%_1121)
    (if (char-alphabetic? %_1121)
      (char>? %_1121 '#\z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
((lambda (%_1122)
   (begin
     (set! %_1122
       (lambda (%_1123 %_1124 %_1125 %_1126 %_1127)
         (if (< %_1126 %_1127)
           (begin
             (string-set!
               %_1124
               %_1126
               (%_1125 (string-ref %_1123 %_1126)))
             (%_1122
               %_1123
               %_1124
               %_1125
               (+ %_1126 '1)
               %_1127))
           %_1124)))
     (begin
       (set! string-downcase
         (lambda (%_1128)
           ((lambda (%_1129)
              (%_1122
                %_1128
                %_1129
                char-downcase
                '0
                (string-length %_1128)))
            (make-string (string-length %_1128)))))
       (set! string-upcase
         (lambda (%_1130)
           ((lambda (%_1131)
              (%_1122
                %_1130
                %_1131
                char-upcase
                '0
                (string-length %_1130)))
            (make-string (string-length %_1130))))))))
 #f)
(define string=? equal?)
(define string<?
  ((lambda (%_1132)
     (begin
       (set! %_1132
         (lambda (%_1133 %_1134)
           (if (null? %_1133)
             (not (null? %_1134))
             (if (null? %_1134)
               '#f
               ((lambda (%_1135 %_1136)
                  (if (char<? %_1135 %_1136)
                    '#t
                    (if (char>? %_1135 %_1136)
                      '#f
                      (%_1132 (cdr %_1133) (cdr %_1134)))))
                (car %_1133)
                (car %_1134))))))
       (lambda (%_1137 %_1138)
         (%_1132
           (string->list %_1137)
           (string->list %_1138)))))
   #f))
(define string>?
  ((lambda (%_1139)
     (begin
       (set! %_1139
         (lambda (%_1140 %_1141)
           (if (null? %_1141)
             (not (null? %_1140))
             (if (null? %_1140)
               '#f
               ((lambda (%_1142 %_1143)
                  (if (char>? %_1142 %_1143)
                    '#t
                    (if (char<? %_1142 %_1143)
                      '#f
                      (%_1139 (cdr %_1140) (cdr %_1141)))))
                (car %_1140)
                (car %_1141))))))
       (lambda (%_1144 %_1145)
         (%_1139
           (string->list %_1144)
           (string->list %_1145)))))
   #f))
(define string<=?
  (lambda (%_1146 %_1147)
    ((lambda (%_1148)
       (if %_1148 %_1148 (string=? %_1146 %_1147)))
     (string<? %_1146 %_1147))))
(define string>=?
  (lambda (%_1149 %_1150)
    ((lambda (%_1151)
       (if %_1151 %_1151 (string=? %_1149 %_1150)))
     (string>? %_1149 %_1150))))
(define string-ci=?
  (lambda (%_1152 %_1153)
    (string=?
      (string-downcase %_1152)
      (string-downcase %_1153))))
(define string-ci<?
  (lambda (%_1154 %_1155)
    (string<?
      (string-downcase %_1154)
      (string-downcase %_1155))))
(define string-ci>?
  (lambda (%_1156 %_1157)
    (string>?
      (string-downcase %_1156)
      (string-downcase %_1157))))
(define string-ci>=?
  (lambda (%_1158 %_1159)
    (string>=?
      (string-downcase %_1158)
      (string-downcase %_1159))))
(define string-ci<=?
  (lambda (%_1160 %_1161)
    (string<=?
      (string-downcase %_1160)
      (string-downcase %_1161))))
(define substring
  ((lambda (%_1162)
     (begin
       (set! %_1162
         (lambda (%_1163 %_1164 %_1165 %_1166 %_1167)
           (if (< %_1166 %_1167)
             (begin
               (string-set!
                 %_1164
                 %_1165
                 (string-ref %_1163 %_1166))
               (%_1162
                 %_1163
                 %_1164
                 (+ %_1165 '1)
                 (+ %_1166 '1)
                 %_1167))
             (void))))
       (lambda (%_1168 %_1169 %_1170)
         ((lambda (%_1171)
            (begin
              (%_1162 %_1168 %_1171 '0 %_1169 %_1170)
              %_1171))
          (make-string (- %_1170 %_1169))))))
   #f))
(define format
  ((lambda (%_1172)
     (begin
       (set! %_1172
         (lambda (%_1173 %_1174 %_1175)
           (if (null? %_1173)
             (get-output-string %_1175)
             (if (eq? (car %_1173) '#\~)
               (begin
                 ((lambda (%_1176)
                    (if (memv %_1176 '(#\s))
                      (write (car %_1174) %_1175)
                      (if (memv %_1176 '(#\a))
                        (display (car %_1174) %_1175)
                        (if (memv %_1176 '(#\%))
                          (display '#\newline %_1175)
                          (if (memv %_1176 '(#\~))
                            (display '#\~ %_1175)
                            (void))))))
                  (cadr %_1173))
                 (%_1172
                   (cddr %_1173)
                   (if (not (null? %_1174)) (cdr %_1174) '())
                   %_1175))
               (begin
                 (display (car %_1173) %_1175)
                 (%_1172 (cdr %_1173) %_1174 %_1175))))))
       (lambda (%_1178 . %_1177)
         (%_1172
           (string->list %_1178)
           %_1177
           (open-output-string)))))
   #f))
(define error
  ((lambda (%_1179)
     (lambda %_1180
       ((lambda (%_1181)
          ((lambda (%_1182)
             ((lambda (%_1183)
                ((lambda ()
                   (if %_1181
                     (if %_1182
                       (%_1179
                         (format
                           '"Error in ~s: ~a"
                           %_1181
                           (apply format (cons %_1182 %_1183))))
                       (%_1179 (format '"Error in ~s." %_1181)))
                     (if %_1182
                       (if (string? %_1182)
                         (%_1179
                           (format
                             '"Error: ~a"
                             (apply format (cons %_1182 %_1183))))
                         (if (null? %_1183)
                           (%_1179 %_1182)
                           (error 'error
                                  '"cannot specify error arguments to a non format-string error.")))
                       (%_1179 '"Error."))))))
              (if (not %_1182)
                '()
                (if (not %_1181)
                  (if (not (null? %_1180))
                    (if (not (car %_1180))
                      (cddr %_1180)
                      (cdr %_1180))
                    (cdr %_1180))
                  (cddr %_1180)))))
           (if (not %_1181)
             (if (not (null? %_1180))
               (if (not (car %_1180))
                 (cadr %_1180)
                 (car %_1180))
               '#f)
             (if (not (null? (cdr %_1180))) (cadr %_1180) '#f))))
        (if (if (not (null? %_1180))
              (symbol? (car %_1180))
              '#f)
          (car %_1180)
          '#f))))
   error))
(define list-ref
  (lambda (%_1184 %_1185)
    (if (zero? %_1185)
      (car %_1184)
      (list-ref (cdr %_1184) (- %_1185 '1)))))
(define iota
  ((lambda (%_1186)
     (begin
       (set! %_1186
         (lambda (%_1187 %_1188)
           (if (> %_1187 %_1188)
             '()
             (cons %_1187 (%_1186 (+ %_1187 '1) %_1188)))))
       (lambda (%_1189) (%_1186 '0 %_1189))))
   #f))
(define values
  (lambda %_1190
    (call-with-current-continuation
      (lambda (%_1191) (apply %_1191 %_1190)))))
