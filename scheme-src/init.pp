(define for-each
  (lambda (%_866 . %_865)
    (if (null? %_865)
      (error 'for-each
             '"invalid number of arguments to procedure for-each.")
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
         (if (proper-list? %_920)
           (%_919 %_920 (make-vector (length %_920)) '0)
           (error 'list->vector
                  '"can only convert a proper list."
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
                  '"~s is not of type ~s."
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
                             '"~s points to a directory."
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
               (error 'map '"lists are not of equal length."))
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
(define proper-list?
  (lambda (%_974)
    (((lambda (%_975)
        (begin
          (set! %_975
            (lambda (%_976 %_977)
              (if (pair? %_976)
                ((lambda (%_978)
                   (if (pair? %_978)
                     ((lambda (%_979 %_980)
                        (if (not (eq? %_979 %_980))
                          (%_975 %_979 %_980)
                          '#f))
                      (cdr %_978)
                      (cdr %_977))
                     (null? %_978)))
                 (cdr %_976))
                (null? %_976))))
          %_975))
      #f)
     %_974
     %_974)))
(define circular?
  (lambda (%_981)
    ((lambda (%_986 %_985 %_984 %_983 %_982)
       (begin
         (set! %_986
           (lambda (%_988 %_989)
             ((lambda (%_990)
                (begin
                  (set! %_990
                    (lambda (%_999 %_1000)
                      ((lambda (%_1001)
                         (if %_1001
                           (%_986 (%_985 %_999) (%_985 %_1001))
                           '#f))
                       (%_985 %_1000))))
                  (if %_989
                    (if (not (eq? (car %_989) (car %_988)))
                      (%_990 %_988 %_989)
                      (((lambda (%_991)
                          (begin
                            (set! %_991
                              (lambda (%_992 %_993)
                                ((lambda (%_994)
                                   (if %_994
                                     %_994
                                     (if (if (= (cadr %_992) (cadr %_993))
                                           (eq? (caddr %_992) (caddr %_993))
                                           '#f)
                                       (%_991 (cddr %_992) (cddr %_993))
                                       ((lambda (%_995)
                                          (((lambda (%_996)
                                              (begin
                                                (set! %_996
                                                  (lambda (%_997)
                                                    (if %_997
                                                      ((lambda (%_998)
                                                         (if %_998
                                                           %_998
                                                           (%_996 (%_985 %_997))))
                                                       (eq? (car %_997) %_995))
                                                      (%_990 %_992 %_993))))
                                                %_996))
                                            #f)
                                           (%_985 (list %_995))))
                                        (car %_992)))))
                                 (null? (cdr %_992)))))
                            %_991))
                        #f)
                       %_988
                       %_989))
                    '#f)))
              #f)))
         (set! %_985
           (lambda (%_1002)
             ((lambda (%_1003)
                (((lambda (%_1004)
                    (begin
                      (set! %_1004
                        (lambda (%_1005 %_1006 %_1007)
                          (if (>= %_1006 '0)
                            ((lambda (%_1011)
                               (if (%_982 %_1011)
                                 (cons %_1011 (cons %_1006 %_1007))
                                 (%_1004 %_1005 (- %_1006 '1) %_1007)))
                             (%_984 %_1005 %_1006))
                            ((lambda (%_1008)
                               (if (pair? %_1008)
                                 ((lambda (%_1009 %_1010)
                                    (%_1004 (car %_1010) (- %_1009 '1) %_1010))
                                  (car %_1008)
                                  (cdr %_1008))
                                 '#f))
                             (cdr %_1007)))))
                      %_1004))
                  #f)
                 %_1003
                 (- (%_983 %_1003) '1)
                 %_1002))
              (car %_1002))))
         (set! %_984
           (lambda (%_1012 %_1013)
             (if (vector? %_1012)
               (vector-ref %_1012 %_1013)
               (if (box? %_1012)
                 (unbox %_1012)
                 ((if (zero? %_1013) car cdr) %_1012)))))
         (set! %_983
           (lambda (%_1014)
             (if (pair? %_1014)
               '2
               (if (box? %_1014) '1 (vector-length %_1014)))))
         (set! %_982
           (lambda (%_1015)
             ((lambda (%_1016)
                (if %_1016
                  %_1016
                  ((lambda (%_1017)
                     (if %_1017
                       %_1017
                       (if (vector? %_1015)
                         (not (zero? (vector-length %_1015)))
                         '#f)))
                   (box? %_1015))))
              (pair? %_1015))))
         (if (%_982 %_981)
           ((lambda (%_987) (%_986 %_987 (%_985 %_987)))
            (list %_981))
           '#f)))
     #f
     #f
     #f
     #f
     #f)))
(define list?
  ((lambda (%_1018)
     (begin
       (set! %_1018
         (lambda (%_1021 %_1022)
           ((lambda (%_1023)
              (if %_1023
                %_1023
                ((lambda (%_1024)
                   (if %_1024
                     %_1024
                     (if (pair? %_1022)
                       ((lambda (%_1025)
                          (if %_1025
                            %_1025
                            (if (not (eq? %_1021 %_1022))
                              (%_1018 (cdr %_1021) (cddr %_1022))
                              '#f)))
                        (null? (cdr %_1022)))
                       '#f)))
                 (null? %_1022))))
            (null? %_1021))))
       (lambda (%_1019)
         ((lambda (%_1020)
            (if %_1020
              %_1020
              (if (pair? %_1019)
                (%_1018 %_1019 (cdr %_1019))
                '#f)))
          (null? %_1019)))))
   #f))
(define expt
  (lambda (%_1026 %_1027)
    (if (if (integer? %_1027) (= %_1026 '2) '#f)
      (ashl '1 %_1027)
      (((lambda (%_1028)
          (begin
            (set! %_1028
              (lambda (%_1029 %_1030 %_1031)
                (if (zero? %_1029)
                  %_1030
                  (%_1028
                    (quotient %_1029 '2)
                    (if (odd? %_1029) (* %_1030 %_1031) %_1030)
                    (* %_1031 %_1031)))))
            %_1028))
        #f)
       %_1027
       '1
       %_1026))))
(define modpow
  (lambda (%_1032 %_1033 %_1034)
    ((lambda (%_1035)
       (if (= %_1033 '1)
         (modulo %_1032 %_1034)
         (if (even? %_1033)
           ((lambda (%_1037)
              (modulo (* %_1037 %_1037) %_1034))
            (modpow %_1032 (/ %_1033 '2) %_1034))
           ((lambda (%_1036)
              (begin
                (set! %_1036 (modulo (* %_1036 %_1036) %_1034))
                (modulo (* %_1032 %_1036) %_1034)))
            (modpow %_1032 (/ (- %_1033 '1) '2) %_1034)))))
     '0)))
(define integer?
  ((lambda (%_1038)
     (lambda (%_1039)
       ((lambda (%_1040)
          (if %_1040
            %_1040
            (if (real? %_1039) (= (round %_1039) %_1039) '#f)))
        (%_1038 %_1039))))
   integer?))
(define real?
  ((lambda (%_1041)
     (lambda (%_1042)
       (if (number? %_1042) (not (%_1041 %_1042)) '#f)))
   complex?))
(define complex? number?)
(define abs
  (lambda (%_1043)
    (if (not (real? %_1043))
      ((lambda (%_1044 %_1045)
         (sqrt (+ (* %_1044 %_1044) (* %_1045 %_1045))))
       (real-part %_1043)
       (imag-part %_1043))
      (if (< %_1043 '0) (- %_1043) %_1043))))
(define min (void))
(define max (void))
((lambda (%_1046)
   (begin
     (set! %_1046
       (lambda (%_1051 %_1052 %_1053 %_1054)
         (if (null? %_1053)
           (if (if %_1054 (exact? %_1052) '#f)
             (exact->inexact %_1052)
             %_1052)
           (if (%_1051 (car %_1053) %_1052)
             (%_1046
               %_1051
               (car %_1053)
               (cdr %_1053)
               ((lambda (%_1055)
                  (if %_1055 %_1055 (inexact? (car %_1053))))
                %_1054))
             (%_1046 %_1051 %_1052 (cdr %_1053) %_1054)))))
     (begin
       (set! min
         (lambda (%_1048 . %_1047)
           (if (null? %_1047)
             %_1048
             (%_1046 < %_1048 %_1047 (inexact? %_1048)))))
       (set! max
         (lambda (%_1050 . %_1049)
           (if (null? %_1049)
             %_1050
             (%_1046 > %_1050 %_1049 (inexact? %_1050))))))))
 #f)
(define negative?
  (lambda (%_1056) (< %_1056 '0)))
(define positive?
  (lambda (%_1057) (> %_1057 '0)))
(define even?
  (lambda (%_1058) (= '0 (modulo %_1058 '2))))
(define odd?
  (lambda (%_1059) (not (even? %_1059))))
(define zero? (lambda (%_1060) (= %_1060 '0)))
(define add1 (lambda (%_1061) (+ %_1061 '1)))
(define sub1 (lambda (%_1062) (- %_1062 '1)))
(define >= (void))
(define <= (void))
((lambda (%_1063 %_1064)
   (begin
     (set! <=
       (%_1063
         (lambda (%_1065 %_1066)
           ((lambda (%_1067)
              (if %_1067 %_1067 (= %_1065 %_1066)))
            (< %_1065 %_1066)))
         %_1064
         '#t))
     (set! >=
       (%_1063
         (lambda (%_1068 %_1069)
           ((lambda (%_1070)
              (if %_1070 %_1070 (= %_1068 %_1069)))
            (> %_1068 %_1069)))
         %_1064
         '#t))))
 (lambda (%_1071 %_1072 %_1073)
   (lambda %_1074
     (((lambda (%_1075)
         (begin
           (set! %_1075
             (lambda (%_1076)
               (if (null? %_1076)
                 %_1073
                 (if (null? (cdr %_1076))
                   %_1073
                   (%_1072
                     (%_1071 (car %_1076) (cadr %_1076))
                     (%_1075 (cdr %_1076)))))))
           %_1075))
       #f)
      %_1074)))
 (lambda (%_1077 %_1078) (if %_1077 %_1078 '#f)))
((lambda (%_1079)
   (begin
     (set! >= (%_1079 > >=))
     (set! <= (%_1079 < <=))))
 (lambda (%_1080 %_1081)
   (lambda %_1082
     ((lambda (%_1083)
        (if %_1083
          %_1083
          ((lambda (%_1084)
             (if %_1084
               %_1084
               (if ((lambda (%_1085)
                      (if %_1085
                        %_1085
                        (%_1080 (car %_1082) (cadr %_1082))))
                    (= (car %_1082) (cadr %_1082)))
                 (apply %_1081 (cdr %_1082))
                 '#f)))
           (null? (cdr %_1082)))))
      (null? %_1082)))))
(define gcd
  (lambda %_1086
    (if (null? %_1086)
      '0
      (if (null? (cdr %_1086))
        (car %_1086)
        (_gcd (car %_1086) (cadr %_1086))))))
(define lcm
  (lambda %_1087
    (if (null? %_1087)
      '1
      (if (null? (cdr %_1087))
        (car %_1087)
        (_lcm (car %_1087) (cadr %_1087))))))
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
  (lambda %_1088
    (if (null? %_1088)
      '""
      (if (null? (cdr %_1088))
        (car %_1088)
        (apply string-append
               (_string-append (car %_1088) (cadr %_1088))
               (cddr %_1088))))))
(define char-downcase
  ((lambda (%_1089)
     ((lambda (%_1090)
        ((lambda (%_1091)
           ((lambda ()
              (lambda (%_1092)
                ((lambda (%_1093)
                   (if (if (>= %_1093 %_1089) (<= %_1093 %_1090) '#f)
                     (integer->char (+ %_1093 %_1091))
                     %_1092))
                 (char->integer %_1092))))))
         (- (char->integer '#\a) %_1089)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_1094)
     ((lambda (%_1095)
        ((lambda (%_1096)
           ((lambda ()
              (lambda (%_1097)
                ((lambda (%_1098)
                   (if (if (>= %_1098 %_1094) (<= %_1098 %_1095) '#f)
                     (integer->char (- %_1098 %_1096))
                     %_1097))
                 (char->integer %_1097))))))
         (- %_1094 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_1099 %_1100)
    (> (char->integer %_1099) (char->integer %_1100))))
(define char<?
  (lambda (%_1101 %_1102)
    (< (char->integer %_1101) (char->integer %_1102))))
(define char=? eq?)
(define char>=?
  (lambda (%_1103 %_1104)
    ((lambda (%_1105)
       (if %_1105 %_1105 (char=? %_1103 %_1104)))
     (char>? %_1103 %_1104))))
(define char<=?
  (lambda (%_1106 %_1107)
    ((lambda (%_1108)
       (if %_1108 %_1108 (char=? %_1106 %_1107)))
     (char<? %_1106 %_1107))))
(define char-ci>?
  (lambda (%_1109 %_1110)
    (char>?
      (char-downcase %_1109)
      (char-downcase %_1110))))
(define char-ci<?
  (lambda (%_1111 %_1112)
    (char<?
      (char-downcase %_1111)
      (char-downcase %_1112))))
(define char-ci=?
  (lambda (%_1113 %_1114)
    (char=?
      (char-downcase %_1113)
      (char-downcase %_1114))))
(define char-ci>=?
  (lambda (%_1115 %_1116)
    ((lambda (%_1117)
       (if %_1117 %_1117 (char-ci=? %_1115 %_1116)))
     (char-ci>? %_1115 %_1116))))
(define char-ci<=?
  (lambda (%_1118 %_1119)
    ((lambda (%_1120)
       (if %_1120 %_1120 (char-ci=? %_1118 %_1119)))
     (char-ci<? %_1118 %_1119))))
(define char-alphabetic?
  (lambda (%_1121)
    (if (char-ci>=? %_1121 '#\a)
      (char-ci<=? %_1121 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_1122)
    (if (char-ci>=? %_1122 '#\0)
      (char-ci<=? %_1122 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_1123)
    (if (memq %_1123 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_1124)
    (if (char-alphabetic? %_1124)
      (char>? %_1124 '#\a)
      '#f)))
(define char-lower-case?
  (lambda (%_1125)
    (if (char-alphabetic? %_1125)
      (char>? %_1125 '#\Z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
((lambda (%_1126)
   (begin
     (set! %_1126
       (lambda (%_1131 %_1132 %_1133 %_1134 %_1135)
         (if (< %_1134 %_1135)
           (begin
             (string-set!
               %_1132
               %_1134
               (%_1133 (string-ref %_1131 %_1134)))
             (%_1126
               %_1131
               %_1132
               %_1133
               (+ %_1134 '1)
               %_1135))
           %_1132)))
     (begin
       (set! string-downcase
         (lambda (%_1127)
           ((lambda (%_1128)
              (%_1126
                %_1127
                %_1128
                char-downcase
                '0
                (string-length %_1127)))
            (make-string (string-length %_1127)))))
       (set! string-upcase
         (lambda (%_1129)
           ((lambda (%_1130)
              (%_1126
                %_1129
                %_1130
                char-upcase
                '0
                (string-length %_1129)))
            (make-string (string-length %_1129))))))))
 #f)
(define string=? equal?)
(define string<?
  ((lambda (%_1136)
     (begin
       (set! %_1136
         (lambda (%_1139 %_1140)
           (if (null? %_1139)
             (not (null? %_1140))
             (if (null? %_1140)
               '#f
               ((lambda (%_1141 %_1142)
                  (if (char<? %_1141 %_1142)
                    '#t
                    (if (char>? %_1141 %_1142)
                      '#f
                      (%_1136 (cdr %_1139) (cdr %_1140)))))
                (car %_1139)
                (car %_1140))))))
       (lambda (%_1137 %_1138)
         (%_1136
           (string->list %_1137)
           (string->list %_1138)))))
   #f))
(define string>?
  ((lambda (%_1143)
     (begin
       (set! %_1143
         (lambda (%_1146 %_1147)
           (if (null? %_1147)
             (not (null? %_1146))
             (if (null? %_1146)
               '#f
               ((lambda (%_1148 %_1149)
                  (if (char>? %_1148 %_1149)
                    '#t
                    (if (char<? %_1148 %_1149)
                      '#f
                      (%_1143 (cdr %_1146) (cdr %_1147)))))
                (car %_1146)
                (car %_1147))))))
       (lambda (%_1144 %_1145)
         (%_1143
           (string->list %_1144)
           (string->list %_1145)))))
   #f))
(define string<=?
  (lambda (%_1150 %_1151)
    ((lambda (%_1152)
       (if %_1152 %_1152 (string=? %_1150 %_1151)))
     (string<? %_1150 %_1151))))
(define string>=?
  (lambda (%_1153 %_1154)
    ((lambda (%_1155)
       (if %_1155 %_1155 (string=? %_1153 %_1154)))
     (string>? %_1153 %_1154))))
(define string-ci=?
  (lambda (%_1156 %_1157)
    (string=?
      (string-downcase %_1156)
      (string-downcase %_1157))))
(define string-ci<?
  (lambda (%_1158 %_1159)
    (string<?
      (string-downcase %_1158)
      (string-downcase %_1159))))
(define string-ci>?
  (lambda (%_1160 %_1161)
    (string>?
      (string-downcase %_1160)
      (string-downcase %_1161))))
(define string-ci>=?
  (lambda (%_1162 %_1163)
    (string>=?
      (string-downcase %_1162)
      (string-downcase %_1163))))
(define string-ci<=?
  (lambda (%_1164 %_1165)
    (string<=?
      (string-downcase %_1164)
      (string-downcase %_1165))))
(define substring
  ((lambda (%_1166)
     (begin
       (set! %_1166
         (lambda (%_1171 %_1172 %_1173 %_1174 %_1175)
           (if (< %_1174 %_1175)
             (begin
               (string-set!
                 %_1172
                 %_1173
                 (string-ref %_1171 %_1174))
               (%_1166
                 %_1171
                 %_1172
                 (+ %_1173 '1)
                 (+ %_1174 '1)
                 %_1175))
             (void))))
       (lambda (%_1167 %_1168 %_1169)
         ((lambda (%_1170)
            (begin
              (%_1166 %_1167 %_1170 '0 %_1168 %_1169)
              %_1170))
          (make-string (- %_1169 %_1168))))))
   #f))
(define format
  ((lambda (%_1176)
     (begin
       (set! %_1176
         (lambda (%_1179 %_1180 %_1181)
           (if (null? %_1179)
             (get-output-string %_1181)
             (if (eq? (car %_1179) '#\~)
               (begin
                 ((lambda (%_1182)
                    (if (memv %_1182 '(#\s))
                      (write (car %_1180) %_1181)
                      (if (memv %_1182 '(#\a))
                        (display (car %_1180) %_1181)
                        (if (memv %_1182 '(#\%))
                          (display '#\newline %_1181)
                          (if (memv %_1182 '(#\~))
                            (display '#\~ %_1181)
                            (void))))))
                  (cadr %_1179))
                 (%_1176
                   (cddr %_1179)
                   (if (not (null? %_1180)) (cdr %_1180) '())
                   %_1181))
               (begin
                 (display (car %_1179) %_1181)
                 (%_1176 (cdr %_1179) %_1180 %_1181))))))
       (lambda (%_1178 . %_1177)
         (%_1176
           (string->list %_1178)
           %_1177
           (open-output-string)))))
   #f))
(define error
  ((lambda (%_1183)
     (lambda %_1184
       ((lambda (%_1185)
          ((lambda (%_1186)
             ((lambda (%_1187)
                ((lambda ()
                   (if %_1185
                     (if %_1186
                       (%_1183
                         (format
                           '"Error in ~s: ~a"
                           %_1185
                           (apply format (cons %_1186 %_1187))))
                       (%_1183 (format '"Error in ~s." %_1185)))
                     (if %_1186
                       (if (string? %_1186)
                         (%_1183
                           (format
                             '"Error: ~a"
                             (apply format (cons %_1186 %_1187))))
                         (if (null? %_1187)
                           (%_1183 %_1186)
                           (error 'error
                                  '"cannot specify error arguments to a non format-string error.")))
                       (%_1183 '"Error."))))))
              (if (not %_1186)
                '()
                (if (not %_1185)
                  (if (not (null? %_1184))
                    (if (not (car %_1184))
                      (cddr %_1184)
                      (cdr %_1184))
                    (cdr %_1184))
                  (cddr %_1184)))))
           (if (not %_1185)
             (if (not (null? %_1184))
               (if (not (car %_1184))
                 (cadr %_1184)
                 (car %_1184))
               '#f)
             (if (not (null? (cdr %_1184))) (cadr %_1184) '#f))))
        (if (if (not (null? %_1184))
              (symbol? (car %_1184))
              '#f)
          (car %_1184)
          '#f))))
   error))
(define list-ref
  (lambda (%_1188 %_1189)
    (if (zero? %_1189)
      (car %_1188)
      (list-ref (cdr %_1188) (- %_1189 '1)))))
(define iota
  ((lambda (%_1190)
     (begin
       (set! %_1190
         (lambda (%_1192 %_1193)
           (if (> %_1192 %_1193)
             '()
             (cons %_1192 (%_1190 (+ %_1192 '1) %_1193)))))
       (lambda (%_1191) (%_1190 '0 %_1191))))
   #f))
(define values
  (lambda %_1194
    (call-with-current-continuation
      (lambda (%_1195) (apply %_1195 %_1194)))))
