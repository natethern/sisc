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
(define _current-directory (make-parameter '"."))
((lambda (%_927 %_928 %_929)
   (begin
     (set! %_927
       (lambda %_953
         (if (null? %_953)
           (_current-directory)
           (_current-directory (car %_953)))))
     (set! %_928
       (lambda (%_954)
         (if ((lambda (%_955)
                (if %_955
                  %_955
                  (if (memq (detect-os) '(ms-dos windows))
                    (if (> (string-length %_954) '1)
                      (eq? (string-ref %_954 '1) '#\:)
                      '#f)
                    '#f)))
              (absolute-path? %_954))
           %_954
           (make-path (%_927) %_954))))
     (set! %_929
       (lambda (%_956 %_957)
         (if (eq? (file/type %_956) %_957)
           '#t
           (error 'file/type
                  '"~s is not of type ~s."
                  %_956
                  %_957))))
     ((lambda (%_934 %_933 %_932 %_931 %_930)
        (begin
          (set! %_934
            ((lambda (%_935)
               (lambda (%_936)
                 ((lambda (%_937 %_938)
                    (begin
                      (current-directory (file/parent %_938))
                      (call-with-failure-continuation
                        (lambda () (%_935 %_938))
                        (lambda (%_939 %_940 %_941)
                          (begin
                            (current-directory %_937)
                            (%_941 %_939 %_940))))
                      (current-directory %_937)
                      (void)))
                  (current-directory)
                  (%_928 %_936))))
             load))
          (set! %_933
            ((lambda (%_942)
               (lambda (%_943)
                 ((lambda (%_944)
                    (if (not (memq (file/type %_944) '(no-file file)))
                      (error 'open-output-file
                             '"~s points to a directory."
                             %_944)
                      (%_942 %_944)))
                  (%_928 %_943))))
             open-output-file))
          (set! %_932
            ((lambda (%_945)
               (lambda (%_946)
                 ((lambda (%_947)
                    (begin (%_929 %_947 'file) (%_945 %_947)))
                  (%_928 %_946))))
             open-source-input-file))
          (set! %_931
            ((lambda (%_948)
               (lambda (%_949)
                 ((lambda (%_950)
                    (begin (%_929 %_950 'file) (%_948 %_950)))
                  (%_928 %_949))))
             open-input-file))
          (set! %_930
            (lambda %_951
              (if (null? %_951)
                (%_927)
                ((lambda (%_952)
                   (begin (%_929 %_952 'directory) (%_927 %_952)))
                 (%_928 (car %_951))))))
          (begin
            (%_927 '".")
            (set! load %_934)
            (set! current-directory %_930)
            (set! open-input-file %_931)
            (set! open-output-file %_933)
            (set! open-source-input-file %_932))))
      #f
      #f
      #f
      #f
      #f)))
 #f
 #f
 #f)
(define load-module
  (lambda (%_958)
    ((lambda (%_959)
       ((lambda (%_960)
          ((lambda ()
             (for-each
               (lambda (%_961)
                 (putprop
                   %_961
                   '*toplevel*
                   (native-library-binding %_959 %_961)))
               %_960))))
        (native-library-binding-names %_959)))
     (load-native-library %_958))))
(define reverse
  ((lambda (%_962)
     (begin
       (set! %_962
         (lambda (%_964 %_965)
           (if (null? %_964)
             %_965
             (%_962 (cdr %_964) (cons (car %_964) %_965)))))
       (lambda (%_963) (%_962 %_963 '()))))
   #f))
(define remove
  (lambda (%_966 %_967)
    (if (null? %_967)
      '()
      (if (equal? (car %_967) %_966)
        (remove %_966 (cdr %_967))
        (cons (car %_967) (remove %_966 (cdr %_967)))))))
(define append
  ((lambda (%_968)
     (begin
       (set! %_968
         (lambda (%_971 . %_970)
           (if (null? %_970)
             %_971
             (if (null? %_971)
               (apply %_968 %_970)
               (apply %_968
                      (cons (append2 %_971 (car %_970)) (cdr %_970)))))))
       (lambda %_969
         (if (null? %_969)
           '()
           (if (null? (cdr %_969))
             (car %_969)
             (apply %_968 (cons (car %_969) (cdr %_969))))))))
   #f))
(define map
  ((lambda (%_972 %_973)
     (begin
       (set! %_972 map)
       (set! %_973
         (lambda (%_977 %_978 %_979 %_980)
           (if (null? (car %_978))
             (if (andmap null? %_978)
               %_979
               (error 'map '"lists are not of equal length."))
             ((lambda (%_981 %_982)
                (begin
                  (if (not (null? %_980))
                    (set-cdr! %_980 %_981)
                    (void))
                  (if (null? %_979)
                    (%_973 %_977 %_982 %_981 %_981)
                    (%_973 %_977 %_982 %_979 %_981))))
              (cons (apply %_977 (%_972 car %_978)) '())
              (%_972 cdr %_978)))))
       (lambda (%_976 %_975 . %_974)
         (if (null? %_974)
           (%_972 %_976 %_975)
           (%_973 %_976 (cons %_975 %_974) '() '())))))
   #f
   #f))
(define proper-list?
  (lambda (%_983)
    (((lambda (%_984)
        (begin
          (set! %_984
            (lambda (%_985 %_986)
              (if (pair? %_985)
                ((lambda (%_987)
                   (if (pair? %_987)
                     ((lambda (%_988 %_989)
                        (if (not (eq? %_988 %_989))
                          (%_984 %_988 %_989)
                          '#f))
                      (cdr %_987)
                      (cdr %_986))
                     (null? %_987)))
                 (cdr %_985))
                (null? %_985))))
          %_984))
      #f)
     %_983
     %_983)))
(define circular?
  (lambda (%_990)
    ((lambda (%_995 %_994 %_993 %_992 %_991)
       (begin
         (set! %_995
           (lambda (%_997 %_998)
             ((lambda (%_999)
                (begin
                  (set! %_999
                    (lambda (%_1008 %_1009)
                      ((lambda (%_1010)
                         (if %_1010
                           (%_995 (%_994 %_1008) (%_994 %_1010))
                           '#f))
                       (%_994 %_1009))))
                  (if %_998
                    (if (not (eq? (car %_998) (car %_997)))
                      (%_999 %_997 %_998)
                      (((lambda (%_1000)
                          (begin
                            (set! %_1000
                              (lambda (%_1001 %_1002)
                                ((lambda (%_1003)
                                   (if %_1003
                                     %_1003
                                     (if (if (= (cadr %_1001) (cadr %_1002))
                                           (eq? (caddr %_1001) (caddr %_1002))
                                           '#f)
                                       (%_1000 (cddr %_1001) (cddr %_1002))
                                       ((lambda (%_1004)
                                          (((lambda (%_1005)
                                              (begin
                                                (set! %_1005
                                                  (lambda (%_1006)
                                                    (if %_1006
                                                      ((lambda (%_1007)
                                                         (if %_1007
                                                           %_1007
                                                           (%_1005
                                                             (%_994 %_1006))))
                                                       (eq? (car %_1006)
                                                            %_1004))
                                                      (%_999 %_1001 %_1002))))
                                                %_1005))
                                            #f)
                                           (%_994 (list %_1004))))
                                        (car %_1001)))))
                                 (null? (cdr %_1001)))))
                            %_1000))
                        #f)
                       %_997
                       %_998))
                    '#f)))
              #f)))
         (set! %_994
           (lambda (%_1011)
             ((lambda (%_1012)
                (((lambda (%_1013)
                    (begin
                      (set! %_1013
                        (lambda (%_1014 %_1015 %_1016)
                          (if (>= %_1015 '0)
                            ((lambda (%_1020)
                               (if (%_991 %_1020)
                                 (cons %_1020 (cons %_1015 %_1016))
                                 (%_1013 %_1014 (- %_1015 '1) %_1016)))
                             (%_993 %_1014 %_1015))
                            ((lambda (%_1017)
                               (if (pair? %_1017)
                                 ((lambda (%_1018 %_1019)
                                    (%_1013 (car %_1019) (- %_1018 '1) %_1019))
                                  (car %_1017)
                                  (cdr %_1017))
                                 '#f))
                             (cdr %_1016)))))
                      %_1013))
                  #f)
                 %_1012
                 (- (%_992 %_1012) '1)
                 %_1011))
              (car %_1011))))
         (set! %_993
           (lambda (%_1021 %_1022)
             (if (vector? %_1021)
               (vector-ref %_1021 %_1022)
               (if (box? %_1021)
                 (unbox %_1021)
                 ((if (zero? %_1022) car cdr) %_1021)))))
         (set! %_992
           (lambda (%_1023)
             (if (pair? %_1023)
               '2
               (if (box? %_1023) '1 (vector-length %_1023)))))
         (set! %_991
           (lambda (%_1024)
             ((lambda (%_1025)
                (if %_1025
                  %_1025
                  ((lambda (%_1026)
                     (if %_1026
                       %_1026
                       (if (vector? %_1024)
                         (not (zero? (vector-length %_1024)))
                         '#f)))
                   (box? %_1024))))
              (pair? %_1024))))
         (if (%_991 %_990)
           ((lambda (%_996) (%_995 %_996 (%_994 %_996)))
            (list %_990))
           '#f)))
     #f
     #f
     #f
     #f
     #f)))
(define list?
  ((lambda (%_1027)
     (begin
       (set! %_1027
         (lambda (%_1030 %_1031)
           ((lambda (%_1032)
              (if %_1032
                %_1032
                ((lambda (%_1033)
                   (if %_1033
                     %_1033
                     (if (pair? %_1031)
                       ((lambda (%_1034)
                          (if %_1034
                            %_1034
                            (if (not (eq? %_1030 %_1031))
                              (%_1027 (cdr %_1030) (cddr %_1031))
                              '#f)))
                        (null? (cdr %_1031)))
                       '#f)))
                 (null? %_1031))))
            (null? %_1030))))
       (lambda (%_1028)
         ((lambda (%_1029)
            (if %_1029
              %_1029
              (if (pair? %_1028)
                (%_1027 %_1028 (cdr %_1028))
                '#f)))
          (null? %_1028)))))
   #f))
(define expt
  (lambda (%_1035 %_1036)
    (if (if (integer? %_1036) (= %_1035 '2) '#f)
      (ashl '1 %_1036)
      (((lambda (%_1037)
          (begin
            (set! %_1037
              (lambda (%_1038 %_1039 %_1040)
                (if (zero? %_1038)
                  %_1039
                  (%_1037
                    (quotient %_1038 '2)
                    (if (odd? %_1038) (* %_1039 %_1040) %_1039)
                    (* %_1040 %_1040)))))
            %_1037))
        #f)
       %_1036
       '1
       %_1035))))
(define modpow
  (lambda (%_1041 %_1042 %_1043)
    ((lambda (%_1044)
       (if (= %_1042 '1)
         (modulo %_1041 %_1043)
         (if (even? %_1042)
           ((lambda (%_1046)
              (modulo (* %_1046 %_1046) %_1043))
            (modpow %_1041 (/ %_1042 '2) %_1043))
           ((lambda (%_1045)
              (begin
                (set! %_1045 (modulo (* %_1045 %_1045) %_1043))
                (modulo (* %_1041 %_1045) %_1043)))
            (modpow %_1041 (/ (- %_1042 '1) '2) %_1043)))))
     '0)))
(define integer?
  ((lambda (%_1047)
     (lambda (%_1048)
       ((lambda (%_1049)
          (if %_1049
            %_1049
            (if (real? %_1048) (= (round %_1048) %_1048) '#f)))
        (%_1047 %_1048))))
   integer?))
(define real?
  ((lambda (%_1050)
     (lambda (%_1051)
       (if (number? %_1051) (not (%_1050 %_1051)) '#f)))
   complex?))
(define complex? number?)
(define abs
  (lambda (%_1052)
    (if (not (real? %_1052))
      ((lambda (%_1053 %_1054)
         (sqrt (+ (* %_1053 %_1053) (* %_1054 %_1054))))
       (real-part %_1052)
       (imag-part %_1052))
      (if (< %_1052 '0) (- %_1052) %_1052))))
(define min (void))
(define max (void))
((lambda (%_1055)
   (begin
     (set! %_1055
       (lambda (%_1060 %_1061 %_1062 %_1063)
         (if (null? %_1062)
           (if (if %_1063 (exact? %_1061) '#f)
             (exact->inexact %_1061)
             %_1061)
           (if (%_1060 (car %_1062) %_1061)
             (%_1055
               %_1060
               (car %_1062)
               (cdr %_1062)
               ((lambda (%_1064)
                  (if %_1064 %_1064 (inexact? (car %_1062))))
                %_1063))
             (%_1055 %_1060 %_1061 (cdr %_1062) %_1063)))))
     (begin
       (set! min
         (lambda (%_1057 . %_1056)
           (if (null? %_1056)
             %_1057
             (%_1055 < %_1057 %_1056 (inexact? %_1057)))))
       (set! max
         (lambda (%_1059 . %_1058)
           (if (null? %_1058)
             %_1059
             (%_1055 > %_1059 %_1058 (inexact? %_1059))))))))
 #f)
(define negative?
  (lambda (%_1065) (< %_1065 '0)))
(define positive?
  (lambda (%_1066) (> %_1066 '0)))
(define even?
  (lambda (%_1067) (= '0 (modulo %_1067 '2))))
(define odd?
  (lambda (%_1068) (not (even? %_1068))))
(define zero? (lambda (%_1069) (= %_1069 '0)))
(define add1 (lambda (%_1070) (+ %_1070 '1)))
(define sub1 (lambda (%_1071) (- %_1071 '1)))
(define >= (void))
(define <= (void))
((lambda (%_1072 %_1073)
   (begin
     (set! <=
       (%_1072
         (lambda (%_1074 %_1075)
           ((lambda (%_1076)
              (if %_1076 %_1076 (= %_1074 %_1075)))
            (< %_1074 %_1075)))
         %_1073
         '#t))
     (set! >=
       (%_1072
         (lambda (%_1077 %_1078)
           ((lambda (%_1079)
              (if %_1079 %_1079 (= %_1077 %_1078)))
            (> %_1077 %_1078)))
         %_1073
         '#t))))
 (lambda (%_1080 %_1081 %_1082)
   (lambda %_1083
     (((lambda (%_1084)
         (begin
           (set! %_1084
             (lambda (%_1085)
               (if (null? %_1085)
                 %_1082
                 (if (null? (cdr %_1085))
                   %_1082
                   (%_1081
                     (%_1080 (car %_1085) (cadr %_1085))
                     (%_1084 (cdr %_1085)))))))
           %_1084))
       #f)
      %_1083)))
 (lambda (%_1086 %_1087) (if %_1086 %_1087 '#f)))
((lambda (%_1088)
   (begin
     (set! >= (%_1088 > >=))
     (set! <= (%_1088 < <=))))
 (lambda (%_1089 %_1090)
   (lambda %_1091
     ((lambda (%_1092)
        (if %_1092
          %_1092
          ((lambda (%_1093)
             (if %_1093
               %_1093
               (if ((lambda (%_1094)
                      (if %_1094
                        %_1094
                        (%_1089 (car %_1091) (cadr %_1091))))
                    (= (car %_1091) (cadr %_1091)))
                 (apply %_1090 (cdr %_1091))
                 '#f)))
           (null? (cdr %_1091)))))
      (null? %_1091)))))
(define gcd
  (lambda %_1095
    (if (null? %_1095)
      '0
      (if (null? (cdr %_1095))
        (car %_1095)
        (_gcd (car %_1095) (cadr %_1095))))))
(define lcm
  (lambda %_1096
    (if (null? %_1096)
      '1
      (if (null? (cdr %_1096))
        (car %_1096)
        (_lcm (car %_1096) (cadr %_1096))))))
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
  (lambda %_1097
    (if (null? %_1097)
      '""
      (if (null? (cdr %_1097))
        (car %_1097)
        (apply string-append
               (_string-append (car %_1097) (cadr %_1097))
               (cddr %_1097))))))
(define char-downcase
  ((lambda (%_1098)
     ((lambda (%_1099)
        ((lambda (%_1100)
           ((lambda ()
              (lambda (%_1101)
                ((lambda (%_1102)
                   (if (if (>= %_1102 %_1098) (<= %_1102 %_1099) '#f)
                     (integer->char (+ %_1102 %_1100))
                     %_1101))
                 (char->integer %_1101))))))
         (- (char->integer '#\a) %_1098)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_1103)
     ((lambda (%_1104)
        ((lambda (%_1105)
           ((lambda ()
              (lambda (%_1106)
                ((lambda (%_1107)
                   (if (if (>= %_1107 %_1103) (<= %_1107 %_1104) '#f)
                     (integer->char (- %_1107 %_1105))
                     %_1106))
                 (char->integer %_1106))))))
         (- %_1103 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_1108 %_1109)
    (> (char->integer %_1108) (char->integer %_1109))))
(define char<?
  (lambda (%_1110 %_1111)
    (< (char->integer %_1110) (char->integer %_1111))))
(define char=? eq?)
(define char>=?
  (lambda (%_1112 %_1113)
    ((lambda (%_1114)
       (if %_1114 %_1114 (char=? %_1112 %_1113)))
     (char>? %_1112 %_1113))))
(define char<=?
  (lambda (%_1115 %_1116)
    ((lambda (%_1117)
       (if %_1117 %_1117 (char=? %_1115 %_1116)))
     (char<? %_1115 %_1116))))
(define char-ci>?
  (lambda (%_1118 %_1119)
    (char>?
      (char-downcase %_1118)
      (char-downcase %_1119))))
(define char-ci<?
  (lambda (%_1120 %_1121)
    (char<?
      (char-downcase %_1120)
      (char-downcase %_1121))))
(define char-ci=?
  (lambda (%_1122 %_1123)
    (char=?
      (char-downcase %_1122)
      (char-downcase %_1123))))
(define char-ci>=?
  (lambda (%_1124 %_1125)
    ((lambda (%_1126)
       (if %_1126 %_1126 (char-ci=? %_1124 %_1125)))
     (char-ci>? %_1124 %_1125))))
(define char-ci<=?
  (lambda (%_1127 %_1128)
    ((lambda (%_1129)
       (if %_1129 %_1129 (char-ci=? %_1127 %_1128)))
     (char-ci<? %_1127 %_1128))))
(define char-alphabetic?
  (lambda (%_1130)
    (if (char-ci>=? %_1130 '#\a)
      (char-ci<=? %_1130 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_1131)
    (if (char-ci>=? %_1131 '#\0)
      (char-ci<=? %_1131 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_1132)
    (if (memq %_1132 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_1133)
    (if (char-alphabetic? %_1133)
      (char>? %_1133 '#\a)
      '#f)))
(define char-lower-case?
  (lambda (%_1134)
    (if (char-alphabetic? %_1134)
      (char>? %_1134 '#\Z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
((lambda (%_1135)
   (begin
     (set! %_1135
       (lambda (%_1140 %_1141 %_1142 %_1143 %_1144)
         (if (< %_1143 %_1144)
           (begin
             (string-set!
               %_1141
               %_1143
               (%_1142 (string-ref %_1140 %_1143)))
             (%_1135
               %_1140
               %_1141
               %_1142
               (+ %_1143 '1)
               %_1144))
           %_1141)))
     (begin
       (set! string-downcase
         (lambda (%_1136)
           ((lambda (%_1137)
              (%_1135
                %_1136
                %_1137
                char-downcase
                '0
                (string-length %_1136)))
            (make-string (string-length %_1136)))))
       (set! string-upcase
         (lambda (%_1138)
           ((lambda (%_1139)
              (%_1135
                %_1138
                %_1139
                char-upcase
                '0
                (string-length %_1138)))
            (make-string (string-length %_1138))))))))
 #f)
(define string=? equal?)
(define string<?
  ((lambda (%_1145)
     (begin
       (set! %_1145
         (lambda (%_1148 %_1149)
           (if (null? %_1148)
             (not (null? %_1149))
             (if (null? %_1149)
               '#f
               ((lambda (%_1150 %_1151)
                  (if (char<? %_1150 %_1151)
                    '#t
                    (if (char>? %_1150 %_1151)
                      '#f
                      (%_1145 (cdr %_1148) (cdr %_1149)))))
                (car %_1148)
                (car %_1149))))))
       (lambda (%_1146 %_1147)
         (%_1145
           (string->list %_1146)
           (string->list %_1147)))))
   #f))
(define string>?
  ((lambda (%_1152)
     (begin
       (set! %_1152
         (lambda (%_1155 %_1156)
           (if (null? %_1156)
             (not (null? %_1155))
             (if (null? %_1155)
               '#f
               ((lambda (%_1157 %_1158)
                  (if (char>? %_1157 %_1158)
                    '#t
                    (if (char<? %_1157 %_1158)
                      '#f
                      (%_1152 (cdr %_1155) (cdr %_1156)))))
                (car %_1155)
                (car %_1156))))))
       (lambda (%_1153 %_1154)
         (%_1152
           (string->list %_1153)
           (string->list %_1154)))))
   #f))
(define string<=?
  (lambda (%_1159 %_1160)
    ((lambda (%_1161)
       (if %_1161 %_1161 (string=? %_1159 %_1160)))
     (string<? %_1159 %_1160))))
(define string>=?
  (lambda (%_1162 %_1163)
    ((lambda (%_1164)
       (if %_1164 %_1164 (string=? %_1162 %_1163)))
     (string>? %_1162 %_1163))))
(define string-ci=?
  (lambda (%_1165 %_1166)
    (string=?
      (string-downcase %_1165)
      (string-downcase %_1166))))
(define string-ci<?
  (lambda (%_1167 %_1168)
    (string<?
      (string-downcase %_1167)
      (string-downcase %_1168))))
(define string-ci>?
  (lambda (%_1169 %_1170)
    (string>?
      (string-downcase %_1169)
      (string-downcase %_1170))))
(define string-ci>=?
  (lambda (%_1171 %_1172)
    (string>=?
      (string-downcase %_1171)
      (string-downcase %_1172))))
(define string-ci<=?
  (lambda (%_1173 %_1174)
    (string<=?
      (string-downcase %_1173)
      (string-downcase %_1174))))
(define substring
  ((lambda (%_1175)
     (begin
       (set! %_1175
         (lambda (%_1180 %_1181 %_1182 %_1183 %_1184)
           (if (< %_1183 %_1184)
             (begin
               (string-set!
                 %_1181
                 %_1182
                 (string-ref %_1180 %_1183))
               (%_1175
                 %_1180
                 %_1181
                 (+ %_1182 '1)
                 (+ %_1183 '1)
                 %_1184))
             (void))))
       (lambda (%_1176 %_1177 %_1178)
         ((lambda (%_1179)
            (begin
              (%_1175 %_1176 %_1179 '0 %_1177 %_1178)
              %_1179))
          (make-string (- %_1178 %_1177))))))
   #f))
(define format
  ((lambda (%_1185)
     (begin
       (set! %_1185
         (lambda (%_1188 %_1189 %_1190)
           (if (null? %_1188)
             (get-output-string %_1190)
             (if (eq? (car %_1188) '#\~)
               (begin
                 ((lambda (%_1191)
                    (if (memv %_1191 '(#\s))
                      (write (car %_1189) %_1190)
                      (if (memv %_1191 '(#\a))
                        (display (car %_1189) %_1190)
                        (if (memv %_1191 '(#\%))
                          (display '#\newline %_1190)
                          (if (memv %_1191 '(#\~))
                            (display '#\~ %_1190)
                            (void))))))
                  (cadr %_1188))
                 (%_1185
                   (cddr %_1188)
                   (if (not (null? %_1189)) (cdr %_1189) '())
                   %_1190))
               (begin
                 (display (car %_1188) %_1190)
                 (%_1185 (cdr %_1188) %_1189 %_1190))))))
       (lambda (%_1187 . %_1186)
         (%_1185
           (string->list %_1187)
           %_1186
           (open-output-string)))))
   #f))
(define error
  ((lambda (%_1192)
     (lambda %_1193
       ((lambda (%_1194)
          ((lambda (%_1195)
             ((lambda (%_1196)
                ((lambda ()
                   (if %_1194
                     (if %_1195
                       (%_1192
                         (format
                           '"Error in ~s: ~a"
                           %_1194
                           (apply format (cons %_1195 %_1196))))
                       (%_1192 (format '"Error in ~s." %_1194)))
                     (if %_1195
                       (if (string? %_1195)
                         (%_1192
                           (format
                             '"Error: ~a"
                             (apply format (cons %_1195 %_1196))))
                         (if (null? %_1196)
                           (%_1192 %_1195)
                           (error 'error
                                  '"cannot specify error arguments to a non format-string error.")))
                       (%_1192 '"Error."))))))
              (if (not %_1195)
                '()
                (if (not %_1194)
                  (if (not (null? %_1193))
                    (if (not (car %_1193))
                      (cddr %_1193)
                      (cdr %_1193))
                    (cdr %_1193))
                  (cddr %_1193)))))
           (if (not %_1194)
             (if (not (null? %_1193))
               (if (not (car %_1193))
                 (cadr %_1193)
                 (car %_1193))
               '#f)
             (if (not (null? (cdr %_1193))) (cadr %_1193) '#f))))
        (if (if (not (null? %_1193))
              (symbol? (car %_1193))
              '#f)
          (car %_1193)
          '#f))))
   error))
(define list-ref
  (lambda (%_1197 %_1198)
    (if (zero? %_1198)
      (car %_1197)
      (list-ref (cdr %_1197) (- %_1198 '1)))))
(define iota
  ((lambda (%_1199)
     (begin
       (set! %_1199
         (lambda (%_1201 %_1202)
           (if (> %_1201 %_1202)
             '()
             (cons %_1201 (%_1199 (+ %_1201 '1) %_1202)))))
       (lambda (%_1200) (%_1199 '0 %_1200))))
   #f))
(define values
  (lambda %_1203
    (call-with-current-continuation
      (lambda (%_1204) (apply %_1204 %_1203)))))
