(define for-each
  (lambda (%_866 . %_865)
    (if (null? %_865)
      (error 'for-each
             '"invalid number of arguments to procedure for-each")
      (if (not (null? (car %_865)))
        (begin
          (apply %_866 (map car %_865))
          (apply for-each (cons %_866 (map cdr %_865))))
        (void)))))
(define exit (lambda () '#!eof))
(define eof-object?
  (lambda (%_867) (eq? %_867 '#!eof)))
(define not (lambda (%_868) (if %_868 '#f '#t)))
(define eqv? eq?)
(define newline
  (lambda %_869
    (apply display (cons '#\newline %_869))))
(define map (void))
((lambda (%_870)
   (begin
     (set! %_870
       ((lambda (%_871)
          (begin
            (set! %_871
              (lambda (%_875 %_876 %_877 %_878)
                (if (null? %_878)
                  %_876
                  (begin
                    (set-cdr! %_877 (cons (%_875 (car %_878)) '()))
                    (%_871 %_875 %_876 (cdr %_877) (cdr %_878))))))
            (lambda (%_872 %_873)
              (if (null? %_873)
                '()
                ((lambda (%_874)
                   (%_871 %_872 %_874 %_874 (cdr %_873)))
                 (cons (%_872 (car %_873)) '()))))))
        #f))
     (set! map %_870)))
 #f)
(define compose
  (lambda %_879
    (if (null? %_879)
      (lambda (%_883) %_883)
      ((lambda (%_880 %_881)
         (lambda (%_882) (%_880 (%_881 %_882))))
       (car %_879)
       (apply compose (cdr %_879))))))
(define compose2
  (lambda (%_884 %_885)
    (lambda (%_886) (%_884 (%_885 %_886)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
((lambda (%_887 %_888)
   (begin
     (set! %_887
       (lambda (%_901 %_902 %_903)
         (if (null? %_903)
           '#f
           (if (%_901 (caar %_903) %_902)
             (car %_903)
             (%_887 %_901 %_902 (cdr %_903))))))
     (set! %_888
       (lambda (%_904 %_905 %_906)
         (if (null? %_906)
           '#f
           (if (%_904 (car %_906) %_905)
             %_906
             (%_888 %_904 %_905 (cdr %_906))))))
     (begin
       (set! assq
         (lambda (%_889 %_890) (%_887 eq? %_889 %_890)))
       (set! assv
         (lambda (%_891 %_892) (%_887 eqv? %_891 %_892)))
       (set! assoc
         (lambda (%_893 %_894) (%_887 equal? %_893 %_894)))
       (set! memq
         (lambda (%_895 %_896) (%_888 eq? %_895 %_896)))
       (set! memv
         (lambda (%_897 %_898) (%_888 eqv? %_897 %_898)))
       (set! member
         (lambda (%_899 %_900) (%_888 equal? %_899 %_900))))))
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
  (lambda (%_907 %_908)
    (if (null? %_907)
      %_908
      (cons (car %_907) (append2 (cdr %_907) %_908)))))
(define append append2)
(define list->string
  (lambda (%_909)
    ((lambda (%_910)
       (begin
         (set! %_910
           (lambda (%_911 %_912 %_913)
             (if (null? %_911)
               %_912
               (begin
                 (string-set! %_912 %_913 (car %_911))
                 (%_910 (cdr %_911) %_912 (+ %_913 '1))))))
         (%_910 %_909 (make-string (length %_909)) '0)))
     #f)))
(define string->list
  ((lambda (%_914)
     (begin
       (set! %_914
         (lambda (%_916 %_917 %_918)
           (if (< %_918 '0)
             %_917
             (%_914 %_916
                    (cons (string-ref %_916 %_918) %_917)
                    (- %_918 '1)))))
       (lambda (%_915)
         (%_914 %_915 '() (- (string-length %_915) '1)))))
   #f))
(define list->vector
  ((lambda (%_919)
     (begin
       (set! %_919
         (lambda (%_921 %_922 %_923)
           (if (null? %_921)
             %_922
             (begin
               (vector-set! %_922 %_923 (car %_921))
               (%_919 (cdr %_921) %_922 (+ %_923 '1))))))
       (lambda (%_920)
         (if (not (circular-list? %_920))
           (%_919 %_920 (make-vector (length %_920)) '0)
           (error 'list->vector
                  '"cannot convert a circular list"
                  %_920)))))
   #f))
(define vector
  (lambda %_924 (list->vector %_924)))
(define string
  (lambda %_925 (list->string %_925)))
(define detect-os
  (lambda ()
    ((lambda (%_926)
       (if (> (string-length %_926) '3)
         (if (equal? (substring %_926 '0 '3) '"mac")
           'macos
           (if (equal? (substring %_926 '0 '3) '"win")
             'ms-dos
             (if (equal? (substring %_926 '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring %_926 '0 '3) '"uni")
                 'unix
                 (if (equal? (substring %_926 '0 '3) '"lin")
                   'unix
                   (if (equal? (substring %_926 '0 '4) '"os/")
                     'os2
                     (if (equal? (substring %_926 '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase
       (getprop 'os.name '*environment-variables*)))))
(define current-directory (void))
((lambda (%_927 %_928 %_929)
   (begin
     (set! %_927
       (lambda %_944
         (if (null? %_944)
           (getprop 'current-directory '*sisc*)
           (putprop 'current-directory '*sisc* (car %_944)))))
     (set! %_928
       (lambda (%_945)
         (if ((lambda (%_946)
                (if %_946
                  %_946
                  (if (memq (detect-os) '(ms-dos windows))
                    (if (> (string-length %_945) '1)
                      (eq? (string-ref %_945 '1) '#\:)
                      '#f)
                    '#f)))
              (absolute-path? %_945))
           %_945
           (make-path (%_927) %_945))))
     (set! %_929
       (lambda (%_947 %_948)
         (if (eq? (file-type %_947) %_948)
           '#t
           (error 'file-type
                  '"~s is not of type ~s"
                  %_947
                  %_948))))
     ((lambda (%_933 %_932 %_931 %_930)
        (begin
          (set! %_933
            ((lambda (%_934)
               (lambda (%_935) (%_934 (%_928 %_935))))
             load))
          (set! %_932
            ((lambda (%_936)
               (lambda (%_937)
                 ((lambda (%_938)
                    (if (not (memq (file-type %_938) '(no-file file)))
                      (error 'open-output-file
                             '"~s points to a directory"
                             %_938)
                      (%_936 %_938)))
                  (%_928 %_937))))
             open-output-file))
          (set! %_931
            ((lambda (%_939)
               (lambda (%_940)
                 ((lambda (%_941)
                    (begin (%_929 %_941 'file) (%_939 %_941)))
                  (%_928 %_940))))
             open-input-file))
          (set! %_930
            (lambda %_942
              (if (null? %_942)
                (%_927)
                ((lambda (%_943)
                   (begin (%_929 %_943 'directory) (%_927 %_943)))
                 (%_928 (car %_942))))))
          (begin
            (%_927 '".")
            (set! load %_933)
            (set! current-directory %_930)
            (set! open-input-file %_931)
            (set! open-output-file %_932))))
      #f
      #f
      #f
      #f)))
 #f
 #f
 #f)
(define load-module
  (lambda (%_949)
    ((lambda (%_950)
       ((lambda (%_951)
          ((lambda ()
             (for-each
               (lambda (%_952)
                 (putprop
                   %_952
                   '*toplevel*
                   (get-native-library-binding %_950 %_952)))
               %_951))))
        (get-native-library-binding-names %_950)))
     (load-native-library %_949))))
(define reverse
  ((lambda (%_953)
     (begin
       (set! %_953
         (lambda (%_955 %_956)
           (if (null? %_955)
             %_956
             (%_953 (cdr %_955) (cons (car %_955) %_956)))))
       (lambda (%_954) (%_953 %_954 '()))))
   #f))
(define remove
  (lambda (%_957 %_958)
    (if (null? %_958)
      '()
      (if (equal? (car %_958) %_957)
        (remove %_957 (cdr %_958))
        (cons (car %_958) (remove %_957 (cdr %_958)))))))
(define append
  ((lambda (%_959)
     (begin
       (set! %_959
         (lambda (%_962 . %_961)
           (if (null? %_961)
             %_962
             (if (null? %_962)
               (apply %_959 %_961)
               (apply %_959
                      (cons (append2 %_962 (car %_961)) (cdr %_961)))))))
       (lambda %_960
         (if (null? %_960)
           '()
           (if (null? (cdr %_960))
             (car %_960)
             (apply %_959 (cons (car %_960) (cdr %_960))))))))
   #f))
(define map
  ((lambda (%_963 %_964)
     (begin
       (set! %_963 map)
       (set! %_964
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
                    (%_964 %_968 %_973 %_972 %_972)
                    (%_964 %_968 %_973 %_970 %_972))))
              (cons (apply %_968 (%_963 car %_969)) '())
              (%_963 cdr %_969)))))
       (lambda (%_967 %_966 . %_965)
         (if (null? %_965)
           (%_963 %_967 %_966)
           (%_964 %_967 (cons %_966 %_965) '() '())))))
   #f
   #f))
(define circular-list?
  (lambda (%_974)
    (((lambda (%_975)
        (begin
          (set! %_975
            (lambda (%_976 %_977)
              (if (pair? %_976)
                ((lambda (%_978)
                   (if (pair? %_978)
                     ((lambda (%_979 %_980)
                        ((lambda (%_981)
                           (if %_981 %_981 (%_975 %_979 %_980)))
                         (eq? %_979 %_980)))
                      (cdr %_978)
                      (cdr %_977))
                     '#f))
                 (cdr %_976))
                '#f)))
          %_975))
      #f)
     %_974
     %_974)))
(define circular?
  (lambda (%_982)
    ((lambda (%_987 %_986 %_985 %_984 %_983)
       (begin
         (set! %_987
           (lambda (%_989 %_990)
             ((lambda (%_991)
                (begin
                  (set! %_991
                    (lambda (%_1000 %_1001)
                      ((lambda (%_1002)
                         (if %_1002
                           (%_987 (%_986 %_1000) (%_986 %_1002))
                           '#f))
                       (%_986 %_1001))))
                  (if %_990
                    (if (not (eq? (car %_990) (car %_989)))
                      (%_991 %_989 %_990)
                      (((lambda (%_992)
                          (begin
                            (set! %_992
                              (lambda (%_993 %_994)
                                ((lambda (%_995)
                                   (if %_995
                                     %_995
                                     (if (if (= (cadr %_993) (cadr %_994))
                                           (eq? (caddr %_993) (caddr %_994))
                                           '#f)
                                       (%_992 (cddr %_993) (cddr %_994))
                                       ((lambda (%_996)
                                          (((lambda (%_997)
                                              (begin
                                                (set! %_997
                                                  (lambda (%_998)
                                                    (if %_998
                                                      ((lambda (%_999)
                                                         (if %_999
                                                           %_999
                                                           (%_997 (%_986 %_998))))
                                                       (eq? (car %_998) %_996))
                                                      (%_991 %_993 %_994))))
                                                %_997))
                                            #f)
                                           (%_986 (list %_996))))
                                        (car %_993)))))
                                 (null? (cdr %_993)))))
                            %_992))
                        #f)
                       %_989
                       %_990))
                    '#f)))
              #f)))
         (set! %_986
           (lambda (%_1003)
             ((lambda (%_1004)
                (((lambda (%_1005)
                    (begin
                      (set! %_1005
                        (lambda (%_1006 %_1007 %_1008)
                          (if (>= %_1007 '0)
                            ((lambda (%_1012)
                               (if (%_983 %_1012)
                                 (cons %_1012 (cons %_1007 %_1008))
                                 (%_1005 %_1006 (- %_1007 '1) %_1008)))
                             (%_985 %_1006 %_1007))
                            ((lambda (%_1009)
                               (if (pair? %_1009)
                                 ((lambda (%_1010 %_1011)
                                    (%_1005 (car %_1011) (- %_1010 '1) %_1011))
                                  (car %_1009)
                                  (cdr %_1009))
                                 '#f))
                             (cdr %_1008)))))
                      %_1005))
                  #f)
                 %_1004
                 (- (%_984 %_1004) '1)
                 %_1003))
              (car %_1003))))
         (set! %_985
           (lambda (%_1013 %_1014)
             (if (vector? %_1013)
               (vector-ref %_1013 %_1014)
               (if (box? %_1013)
                 (unbox %_1013)
                 ((if (zero? %_1014) car cdr) %_1013)))))
         (set! %_984
           (lambda (%_1015)
             (if (pair? %_1015)
               '2
               (if (box? %_1015) '1 (vector-length %_1015)))))
         (set! %_983
           (lambda (%_1016)
             ((lambda (%_1017)
                (if %_1017
                  %_1017
                  ((lambda (%_1018)
                     (if %_1018
                       %_1018
                       (if (vector? %_1016)
                         (not (zero? (vector-length %_1016)))
                         '#f)))
                   (box? %_1016))))
              (pair? %_1016))))
         (if (%_983 %_982)
           ((lambda (%_988) (%_987 %_988 (%_986 %_988)))
            (list %_982))
           '#f)))
     #f
     #f
     #f
     #f
     #f)))
(define list?
  ((lambda (%_1019)
     (begin
       (set! %_1019
         (lambda (%_1022 %_1023)
           ((lambda (%_1024)
              (if %_1024
                %_1024
                ((lambda (%_1025)
                   (if %_1025
                     %_1025
                     (if (pair? %_1023)
                       ((lambda (%_1026)
                          (if %_1026
                            %_1026
                            (if (not (eq? %_1022 %_1023))
                              (%_1019 (cdr %_1022) (cddr %_1023))
                              '#f)))
                        (null? (cdr %_1023)))
                       '#f)))
                 (null? %_1023))))
            (null? %_1022))))
       (lambda (%_1020)
         ((lambda (%_1021)
            (if %_1021
              %_1021
              (if (pair? %_1020)
                (%_1019 %_1020 (cdr %_1020))
                '#f)))
          (null? %_1020)))))
   #f))
(define expt
  (lambda (%_1027 %_1028)
    (if (if (integer? %_1028) (= %_1027 '2) '#f)
      (ashl '1 %_1028)
      (((lambda (%_1029)
          (begin
            (set! %_1029
              (lambda (%_1030 %_1031 %_1032)
                (if (zero? %_1030)
                  %_1031
                  (%_1029
                    (quotient %_1030 '2)
                    (if (odd? %_1030) (* %_1031 %_1032) %_1031)
                    (* %_1032 %_1032)))))
            %_1029))
        #f)
       %_1028
       '1
       %_1027))))
(define modpow
  (lambda (%_1033 %_1034 %_1035)
    ((lambda (%_1036)
       (if (= %_1034 '1)
         (modulo %_1033 %_1035)
         (if (even? %_1034)
           ((lambda (%_1038)
              (modulo (* %_1038 %_1038) %_1035))
            (modpow %_1033 (/ %_1034 '2) %_1035))
           ((lambda (%_1037)
              (begin
                (set! %_1037 (modulo (* %_1037 %_1037) %_1035))
                (modulo (* %_1033 %_1037) %_1035)))
            (modpow %_1033 (/ (- %_1034 '1) '2) %_1035)))))
     '0)))
(define integer?
  ((lambda (%_1039)
     (lambda (%_1040)
       ((lambda (%_1041)
          (if %_1041
            %_1041
            (if (real? %_1040) (= (round %_1040) %_1040) '#f)))
        (%_1039 %_1040))))
   integer?))
(define real?
  ((lambda (%_1042)
     (lambda (%_1043) (not (%_1042 %_1043))))
   complex?))
(define complex? number?)
(define abs
  (lambda (%_1044)
    (if (not (real? %_1044))
      ((lambda (%_1045 %_1046)
         (sqrt (+ (* %_1045 %_1045) (* %_1046 %_1046))))
       (real-part %_1044)
       (imag-part %_1044))
      (if (< %_1044 '0) (- %_1044) %_1044))))
(define min (void))
(define max (void))
((lambda (%_1047)
   (begin
     (set! %_1047
       (lambda (%_1052 %_1053 %_1054 %_1055)
         (if (null? %_1054)
           (if (if %_1055 (exact? %_1053) '#f)
             (exact->inexact %_1053)
             %_1053)
           (if (%_1052 (car %_1054) %_1053)
             (%_1047
               %_1052
               (car %_1054)
               (cdr %_1054)
               ((lambda (%_1056)
                  (if %_1056 %_1056 (inexact? (car %_1054))))
                %_1055))
             (%_1047 %_1052 %_1053 (cdr %_1054) %_1055)))))
     (begin
       (set! min
         (lambda (%_1049 . %_1048)
           (if (null? %_1048)
             %_1049
             (%_1047 < %_1049 %_1048 (inexact? (car %_1048))))))
       (set! max
         (lambda (%_1051 . %_1050)
           (if (null? %_1050)
             %_1051
             (%_1047 > %_1051 %_1050 (inexact? (car %_1050)))))))))
 #f)
(define negative?
  (lambda (%_1057) (< %_1057 '0)))
(define positive?
  (lambda (%_1058) (> %_1058 '0)))
(define even?
  (lambda (%_1059) (= '0 (modulo %_1059 '2))))
(define odd?
  (lambda (%_1060) (not (even? %_1060))))
(define zero? (lambda (%_1061) (= %_1061 '0)))
(define add1 (lambda (%_1062) (+ %_1062 '1)))
(define sub1 (lambda (%_1063) (- %_1063 '1)))
(define >= (void))
(define <= (void))
((lambda (%_1064 %_1065)
   (begin
     (set! <=
       (%_1064
         (lambda (%_1066 %_1067)
           ((lambda (%_1068)
              (if %_1068 %_1068 (= %_1066 %_1067)))
            (< %_1066 %_1067)))
         %_1065
         '#t))
     (set! >=
       (%_1064
         (lambda (%_1069 %_1070)
           ((lambda (%_1071)
              (if %_1071 %_1071 (= %_1069 %_1070)))
            (> %_1069 %_1070)))
         %_1065
         '#t))))
 (lambda (%_1072 %_1073 %_1074)
   (lambda %_1075
     (((lambda (%_1076)
         (begin
           (set! %_1076
             (lambda (%_1077)
               (if (null? %_1077)
                 %_1074
                 (if (null? (cdr %_1077))
                   %_1074
                   (%_1073
                     (%_1072 (car %_1077) (cadr %_1077))
                     (%_1076 (cdr %_1077)))))))
           %_1076))
       #f)
      %_1075)))
 (lambda (%_1078 %_1079) (if %_1078 %_1079 '#f)))
((lambda (%_1080)
   (begin
     (set! >= (%_1080 > >=))
     (set! <= (%_1080 < <=))))
 (lambda (%_1081 %_1082)
   (lambda %_1083
     ((lambda (%_1084)
        (if %_1084
          %_1084
          ((lambda (%_1085)
             (if %_1085
               %_1085
               (if ((lambda (%_1086)
                      (if %_1086
                        %_1086
                        (%_1081 (car %_1083) (cadr %_1083))))
                    (= (car %_1083) (cadr %_1083)))
                 (apply %_1082 (cdr %_1083))
                 '#f)))
           (null? (cdr %_1083)))))
      (null? %_1083)))))
(define gcd
  (lambda %_1087
    (if (null? %_1087)
      '0
      (if (null? (cdr %_1087))
        (car %_1087)
        (_gcd (car %_1087) (cadr %_1087))))))
(define lcm
  (lambda %_1088
    (if (null? %_1088)
      '1
      (if (null? (cdr %_1088))
        (car %_1088)
        (_lcm (car %_1088) (cadr %_1088))))))
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
  (lambda %_1089
    (if (null? %_1089)
      '""
      (if (null? (cdr %_1089))
        (car %_1089)
        (apply string-append
               (_string-append (car %_1089) (cadr %_1089))
               (cddr %_1089))))))
(define char-downcase
  ((lambda (%_1090)
     ((lambda (%_1091)
        ((lambda (%_1092)
           ((lambda ()
              (lambda (%_1093)
                ((lambda (%_1094)
                   (if (if (>= %_1094 %_1090) (<= %_1094 %_1091) '#f)
                     (integer->char (+ %_1094 %_1092))
                     %_1093))
                 (char->integer %_1093))))))
         (- (char->integer '#\a) %_1090)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_1095)
     ((lambda (%_1096)
        ((lambda (%_1097)
           ((lambda ()
              (lambda (%_1098)
                ((lambda (%_1099)
                   (if (if (>= %_1099 %_1095) (<= %_1099 %_1096) '#f)
                     (integer->char (- %_1099 %_1097))
                     %_1098))
                 (char->integer %_1098))))))
         (- %_1095 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_1100 %_1101)
    (> (char->integer %_1100) (char->integer %_1101))))
(define char<?
  (lambda (%_1102 %_1103)
    (< (char->integer %_1102) (char->integer %_1103))))
(define char=? eq?)
(define char>=?
  (lambda (%_1104 %_1105)
    ((lambda (%_1106)
       (if %_1106 %_1106 (char=? %_1104 %_1105)))
     (char>? %_1104 %_1105))))
(define char<=?
  (lambda (%_1107 %_1108)
    ((lambda (%_1109)
       (if %_1109 %_1109 (char=? %_1107 %_1108)))
     (char<? %_1107 %_1108))))
(define char-ci>?
  (lambda (%_1110 %_1111)
    (char>?
      (char-downcase %_1110)
      (char-downcase %_1111))))
(define char-ci<?
  (lambda (%_1112 %_1113)
    (char<?
      (char-downcase %_1112)
      (char-downcase %_1113))))
(define char-ci=?
  (lambda (%_1114 %_1115)
    (char=?
      (char-downcase %_1114)
      (char-downcase %_1115))))
(define char-ci>=?
  (lambda (%_1116 %_1117)
    ((lambda (%_1118)
       (if %_1118 %_1118 (char-ci=? %_1116 %_1117)))
     (char-ci>? %_1116 %_1117))))
(define char-ci<=?
  (lambda (%_1119 %_1120)
    ((lambda (%_1121)
       (if %_1121 %_1121 (char-ci=? %_1119 %_1120)))
     (char-ci<? %_1119 %_1120))))
(define char-alphabetic?
  (lambda (%_1122)
    (if (char-ci>=? %_1122 '#\a)
      (char-ci<=? %_1122 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_1123)
    (if (char-ci>=? %_1123 '#\0)
      (char-ci<=? %_1123 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_1124)
    (if (memq %_1124 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_1125)
    (if (char-alphabetic? %_1125)
      (char<? %_1125 '#\a)
      '#f)))
(define char-lower-case?
  (lambda (%_1126)
    (if (char-alphabetic? %_1126)
      (char>? %_1126 '#\z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
((lambda (%_1127)
   (begin
     (set! %_1127
       (lambda (%_1132 %_1133 %_1134 %_1135 %_1136)
         (if (< %_1135 %_1136)
           (begin
             (string-set!
               %_1133
               %_1135
               (%_1134 (string-ref %_1132 %_1135)))
             (%_1127
               %_1132
               %_1133
               %_1134
               (+ %_1135 '1)
               %_1136))
           %_1133)))
     (begin
       (set! string-downcase
         (lambda (%_1128)
           ((lambda (%_1129)
              (%_1127
                %_1128
                %_1129
                char-downcase
                '0
                (string-length %_1128)))
            (make-string (string-length %_1128)))))
       (set! string-upcase
         (lambda (%_1130)
           ((lambda (%_1131)
              (%_1127
                %_1130
                %_1131
                char-upcase
                '0
                (string-length %_1130)))
            (make-string (string-length %_1130))))))))
 #f)
(define string=? equal?)
(define string<?
  ((lambda (%_1137)
     (begin
       (set! %_1137
         (lambda (%_1140 %_1141)
           (if (null? %_1140)
             (not (null? %_1141))
             (if (null? %_1141)
               '#f
               ((lambda (%_1142 %_1143)
                  (if (char<? %_1142 %_1143)
                    '#t
                    (if (char>? %_1142 %_1143)
                      '#f
                      (%_1137 (cdr %_1140) (cdr %_1141)))))
                (car %_1140)
                (car %_1141))))))
       (lambda (%_1138 %_1139)
         (%_1137
           (string->list %_1138)
           (string->list %_1139)))))
   #f))
(define string>?
  ((lambda (%_1144)
     (begin
       (set! %_1144
         (lambda (%_1147 %_1148)
           (if (null? %_1148)
             (not (null? %_1147))
             (if (null? %_1147)
               '#f
               ((lambda (%_1149 %_1150)
                  (if (char>? %_1149 %_1150)
                    '#t
                    (if (char<? %_1149 %_1150)
                      '#f
                      (%_1144 (cdr %_1147) (cdr %_1148)))))
                (car %_1147)
                (car %_1148))))))
       (lambda (%_1145 %_1146)
         (%_1144
           (string->list %_1145)
           (string->list %_1146)))))
   #f))
(define string<=?
  (lambda (%_1151 %_1152)
    ((lambda (%_1153)
       (if %_1153 %_1153 (string=? %_1151 %_1152)))
     (string<? %_1151 %_1152))))
(define string>=?
  (lambda (%_1154 %_1155)
    ((lambda (%_1156)
       (if %_1156 %_1156 (string=? %_1154 %_1155)))
     (string>? %_1154 %_1155))))
(define string-ci=?
  (lambda (%_1157 %_1158)
    (string=?
      (string-downcase %_1157)
      (string-downcase %_1158))))
(define string-ci<?
  (lambda (%_1159 %_1160)
    (string<?
      (string-downcase %_1159)
      (string-downcase %_1160))))
(define string-ci>?
  (lambda (%_1161 %_1162)
    (string>?
      (string-downcase %_1161)
      (string-downcase %_1162))))
(define string-ci>=?
  (lambda (%_1163 %_1164)
    (string>=?
      (string-downcase %_1163)
      (string-downcase %_1164))))
(define string-ci<=?
  (lambda (%_1165 %_1166)
    (string<=?
      (string-downcase %_1165)
      (string-downcase %_1166))))
(define substring
  ((lambda (%_1167)
     (begin
       (set! %_1167
         (lambda (%_1172 %_1173 %_1174 %_1175 %_1176)
           (if (< %_1175 %_1176)
             (begin
               (string-set!
                 %_1173
                 %_1174
                 (string-ref %_1172 %_1175))
               (%_1167
                 %_1172
                 %_1173
                 (+ %_1174 '1)
                 (+ %_1175 '1)
                 %_1176))
             (void))))
       (lambda (%_1168 %_1169 %_1170)
         ((lambda (%_1171)
            (begin
              (%_1167 %_1168 %_1171 '0 %_1169 %_1170)
              %_1171))
          (make-string (- %_1170 %_1169))))))
   #f))
(define format
  ((lambda (%_1177)
     (begin
       (set! %_1177
         (lambda (%_1180 %_1181 %_1182)
           (if (null? %_1180)
             (get-output-string %_1182)
             (if (eq? (car %_1180) '#\~)
               (begin
                 ((lambda (%_1183)
                    (if (memv %_1183 '(#\s))
                      (write (car %_1181) %_1182)
                      (if (memv %_1183 '(#\a))
                        (display (car %_1181) %_1182)
                        (if (memv %_1183 '(#\%))
                          (display '#\newline %_1182)
                          (if (memv %_1183 '(#\~))
                            (display '#\~ %_1182)
                            (void))))))
                  (cadr %_1180))
                 (%_1177
                   (cddr %_1180)
                   (if (not (null? %_1181)) (cdr %_1181) '())
                   %_1182))
               (begin
                 (display (car %_1180) %_1182)
                 (%_1177 (cdr %_1180) %_1181 %_1182))))))
       (lambda (%_1179 . %_1178)
         (%_1177
           (string->list %_1179)
           %_1178
           (open-output-string)))))
   #f))
(define error
  ((lambda (%_1184)
     (lambda %_1185
       ((lambda (%_1186)
          ((lambda (%_1187)
             ((lambda (%_1188)
                ((lambda ()
                   (if %_1186
                     (if %_1187
                       (%_1184
                         (format
                           '"Error in ~s: ~a"
                           %_1186
                           (apply format (cons %_1187 %_1188))))
                       (%_1184 (format '"Error in ~s." %_1186)))
                     (if %_1187
                       (if (string? %_1187)
                         (%_1184
                           (format
                             '"Error: ~a"
                             (apply format (cons %_1187 %_1188))))
                         (if (null? %_1188)
                           (%_1184 %_1187)
                           (error 'error
                                  '"cannot specify error arguments to a non format-string error.")))
                       (%_1184 '"Error."))))))
              (if (not %_1187)
                '()
                (if (not %_1186)
                  (if (not (null? %_1185))
                    (if (not (car %_1185))
                      (cddr %_1185)
                      (cdr %_1185))
                    (cdr %_1185))
                  (cddr %_1185)))))
           (if (not %_1186)
             (if (not (null? %_1185))
               (if (not (car %_1185))
                 (cadr %_1185)
                 (car %_1185))
               '#f)
             (if (not (null? (cdr %_1185))) (cadr %_1185) '#f))))
        (if (if (not (null? %_1185))
              (symbol? (car %_1185))
              '#f)
          (car %_1185)
          '#f))))
   error))
(define list-ref
  (lambda (%_1189 %_1190)
    (if (zero? %_1190)
      (car %_1189)
      (list-ref (cdr %_1189) (- %_1190 '1)))))
(define iota
  ((lambda (%_1191)
     (begin
       (set! %_1191
         (lambda (%_1193 %_1194)
           (if (> %_1193 %_1194)
             '()
             (cons %_1193 (%_1191 (+ %_1193 '1) %_1194)))))
       (lambda (%_1192) (%_1191 '0 %_1192))))
   #f))
(define values
  (lambda %_1195
    (call-with-current-continuation
      (lambda (%_1196) (apply %_1196 %_1195)))))
