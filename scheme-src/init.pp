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
         (if (not (circular? %_920))
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
(define circular?
  (lambda (%_974)
    ((lambda (%_979 %_978 %_977 %_976 %_975)
       (begin
         (set! %_979
           (lambda (%_981 %_982)
             ((lambda (%_983)
                (begin
                  (set! %_983
                    (lambda (%_992 %_993)
                      ((lambda (%_994)
                         (if %_994
                           (%_979 (%_978 %_992) (%_978 %_994))
                           '#f))
                       (%_978 %_993))))
                  (if %_982
                    (if (not (eq? (car %_982) (car %_981)))
                      (%_983 %_981 %_982)
                      (((lambda (%_984)
                          (begin
                            (set! %_984
                              (lambda (%_985 %_986)
                                ((lambda (%_987)
                                   (if %_987
                                     %_987
                                     (if (if (= (cadr %_985) (cadr %_986))
                                           (eq? (caddr %_985) (caddr %_986))
                                           '#f)
                                       (%_984 (cddr %_985) (cddr %_986))
                                       ((lambda (%_988)
                                          (((lambda (%_989)
                                              (begin
                                                (set! %_989
                                                  (lambda (%_990)
                                                    (if %_990
                                                      ((lambda (%_991)
                                                         (if %_991
                                                           %_991
                                                           (%_989 (%_978 %_990))))
                                                       (eq? (car %_990) %_988))
                                                      (%_983 %_985 %_986))))
                                                %_989))
                                            #f)
                                           (%_978 (list %_988))))
                                        (car %_985)))))
                                 (null? (cdr %_985)))))
                            %_984))
                        #f)
                       %_981
                       %_982))
                    '#f)))
              #f)))
         (set! %_978
           (lambda (%_995)
             ((lambda (%_996)
                (((lambda (%_997)
                    (begin
                      (set! %_997
                        (lambda (%_998 %_999 %_1000)
                          (if (>= %_999 '0)
                            ((lambda (%_1004)
                               (if (%_975 %_1004)
                                 (cons %_1004 (cons %_999 %_1000))
                                 (%_997 %_998 (- %_999 '1) %_1000)))
                             (%_977 %_998 %_999))
                            ((lambda (%_1001)
                               (if (pair? %_1001)
                                 ((lambda (%_1002 %_1003)
                                    (%_997 (car %_1003) (- %_1002 '1) %_1003))
                                  (car %_1001)
                                  (cdr %_1001))
                                 '#f))
                             (cdr %_1000)))))
                      %_997))
                  #f)
                 %_996
                 (- (%_976 %_996) '1)
                 %_995))
              (car %_995))))
         (set! %_977
           (lambda (%_1005 %_1006)
             (if (vector? %_1005)
               (vector-ref %_1005 %_1006)
               (if (box? %_1005)
                 (unbox %_1005)
                 ((if (zero? %_1006) car cdr) %_1005)))))
         (set! %_976
           (lambda (%_1007)
             (if (pair? %_1007)
               '2
               (if (box? %_1007) '1 (vector-length %_1007)))))
         (set! %_975
           (lambda (%_1008)
             ((lambda (%_1009)
                (if %_1009
                  %_1009
                  ((lambda (%_1010)
                     (if %_1010
                       %_1010
                       (if (vector? %_1008)
                         (not (zero? (vector-length %_1008)))
                         '#f)))
                   (box? %_1008))))
              (pair? %_1008))))
         (if (%_975 %_974)
           ((lambda (%_980) (%_979 %_980 (%_978 %_980)))
            (list %_974))
           '#f)))
     #f
     #f
     #f
     #f
     #f)))
(define list?
  ((lambda (%_1011)
     (begin
       (set! %_1011
         (lambda (%_1014 %_1015)
           ((lambda (%_1016)
              (if %_1016
                %_1016
                ((lambda (%_1017)
                   (if %_1017
                     %_1017
                     (if (pair? %_1015)
                       ((lambda (%_1018)
                          (if %_1018
                            %_1018
                            (if (not (eq? %_1014 %_1015))
                              (%_1011 (cdr %_1014) (cddr %_1015))
                              '#f)))
                        (null? (cdr %_1015)))
                       '#f)))
                 (null? %_1015))))
            (null? %_1014))))
       (lambda (%_1012)
         ((lambda (%_1013)
            (if %_1013
              %_1013
              (if (pair? %_1012)
                (%_1011 %_1012 (cdr %_1012))
                '#f)))
          (null? %_1012)))))
   #f))
(define expt
  (lambda (%_1019 %_1020)
    (if (if (integer? %_1020) (= %_1019 '2) '#f)
      (ashl '1 %_1020)
      (((lambda (%_1021)
          (begin
            (set! %_1021
              (lambda (%_1022 %_1023 %_1024)
                (if (zero? %_1022)
                  %_1023
                  (%_1021
                    (quotient %_1022 '2)
                    (if (odd? %_1022) (* %_1023 %_1024) %_1023)
                    (* %_1024 %_1024)))))
            %_1021))
        #f)
       %_1020
       '1
       %_1019))))
(define modpow
  (lambda (%_1025 %_1026 %_1027)
    ((lambda (%_1028)
       (if (= %_1026 '1)
         (modulo %_1025 %_1027)
         (if (even? %_1026)
           ((lambda (%_1030)
              (modulo (* %_1030 %_1030) %_1027))
            (modpow %_1025 (/ %_1026 '2) %_1027))
           ((lambda (%_1029)
              (begin
                (set! %_1029 (modulo (* %_1029 %_1029) %_1027))
                (modulo (* %_1025 %_1029) %_1027)))
            (modpow %_1025 (/ (- %_1026 '1) '2) %_1027)))))
     '0)))
(define integer?
  ((lambda (%_1031)
     (lambda (%_1032)
       ((lambda (%_1033)
          (if %_1033
            %_1033
            (if (real? %_1032) (= (round %_1032) %_1032) '#f)))
        (%_1031 %_1032))))
   integer?))
(define real?
  ((lambda (%_1034)
     (lambda (%_1035) (not (%_1034 %_1035))))
   complex?))
(define complex? number?)
(define abs
  (lambda (%_1036)
    (if (not (real? %_1036))
      ((lambda (%_1037 %_1038)
         (sqrt (+ (* %_1037 %_1037) (* %_1038 %_1038))))
       (real-part %_1036)
       (imag-part %_1036))
      (if (< %_1036 '0) (- %_1036) %_1036))))
(define min (void))
(define max (void))
((lambda (%_1039)
   (begin
     (set! %_1039
       (lambda (%_1044 %_1045 %_1046 %_1047)
         (if (null? %_1046)
           (if (if %_1047 (exact? %_1045) '#f)
             (exact->inexact %_1045)
             %_1045)
           (if (%_1044 (car %_1046) %_1045)
             (%_1039
               %_1044
               (car %_1046)
               (cdr %_1046)
               ((lambda (%_1048)
                  (if %_1048 %_1048 (inexact? (car %_1046))))
                %_1047))
             (%_1039 %_1044 %_1045 (cdr %_1046) %_1047)))))
     (begin
       (set! min
         (lambda (%_1041 . %_1040)
           (if (null? %_1040)
             %_1041
             (%_1039 < %_1041 %_1040 (inexact? (car %_1040))))))
       (set! max
         (lambda (%_1043 . %_1042)
           (if (null? %_1042)
             %_1043
             (%_1039 > %_1043 %_1042 (inexact? (car %_1042)))))))))
 #f)
(define negative?
  (lambda (%_1049) (< %_1049 '0)))
(define positive?
  (lambda (%_1050) (> %_1050 '0)))
(define even?
  (lambda (%_1051) (= '0 (modulo %_1051 '2))))
(define odd?
  (lambda (%_1052) (not (even? %_1052))))
(define zero? (lambda (%_1053) (= %_1053 '0)))
(define add1 (lambda (%_1054) (+ %_1054 '1)))
(define sub1 (lambda (%_1055) (- %_1055 '1)))
(define >= (void))
(define <= (void))
((lambda (%_1056 %_1057)
   (begin
     (set! <=
       (%_1056
         (lambda (%_1058 %_1059)
           ((lambda (%_1060)
              (if %_1060 %_1060 (= %_1058 %_1059)))
            (< %_1058 %_1059)))
         %_1057
         '#t))
     (set! >=
       (%_1056
         (lambda (%_1061 %_1062)
           ((lambda (%_1063)
              (if %_1063 %_1063 (= %_1061 %_1062)))
            (> %_1061 %_1062)))
         %_1057
         '#t))))
 (lambda (%_1064 %_1065 %_1066)
   (lambda %_1067
     (((lambda (%_1068)
         (begin
           (set! %_1068
             (lambda (%_1069)
               (if (null? %_1069)
                 %_1066
                 (if (null? (cdr %_1069))
                   %_1066
                   (%_1065
                     (%_1064 (car %_1069) (cadr %_1069))
                     (%_1068 (cdr %_1069)))))))
           %_1068))
       #f)
      %_1067)))
 (lambda (%_1070 %_1071) (if %_1070 %_1071 '#f)))
((lambda (%_1072)
   (begin
     (set! >= (%_1072 > >=))
     (set! <= (%_1072 < <=))))
 (lambda (%_1073 %_1074)
   (lambda %_1075
     ((lambda (%_1076)
        (if %_1076
          %_1076
          ((lambda (%_1077)
             (if %_1077
               %_1077
               (if ((lambda (%_1078)
                      (if %_1078
                        %_1078
                        (%_1073 (car %_1075) (cadr %_1075))))
                    (= (car %_1075) (cadr %_1075)))
                 (apply %_1074 (cdr %_1075))
                 '#f)))
           (null? (cdr %_1075)))))
      (null? %_1075)))))
(define gcd
  (lambda %_1079
    (if (null? %_1079)
      '0
      (if (null? (cdr %_1079))
        (car %_1079)
        (_gcd (car %_1079) (cadr %_1079))))))
(define lcm
  (lambda %_1080
    (if (null? %_1080)
      '1
      (if (null? (cdr %_1080))
        (car %_1080)
        (_lcm (car %_1080) (cadr %_1080))))))
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
  (lambda %_1081
    (if (null? %_1081)
      '""
      (if (null? (cdr %_1081))
        (car %_1081)
        (apply string-append
               (_string-append (car %_1081) (cadr %_1081))
               (cddr %_1081))))))
(define char-downcase
  ((lambda (%_1082)
     ((lambda (%_1083)
        ((lambda (%_1084)
           ((lambda ()
              (lambda (%_1085)
                ((lambda (%_1086)
                   (if (if (>= %_1086 %_1082) (<= %_1086 %_1083) '#f)
                     (integer->char (+ %_1086 %_1084))
                     %_1085))
                 (char->integer %_1085))))))
         (- (char->integer '#\a) %_1082)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_1087)
     ((lambda (%_1088)
        ((lambda (%_1089)
           ((lambda ()
              (lambda (%_1090)
                ((lambda (%_1091)
                   (if (if (>= %_1091 %_1087) (<= %_1091 %_1088) '#f)
                     (integer->char (- %_1091 %_1089))
                     %_1090))
                 (char->integer %_1090))))))
         (- %_1087 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_1092 %_1093)
    (> (char->integer %_1092) (char->integer %_1093))))
(define char<?
  (lambda (%_1094 %_1095)
    (< (char->integer %_1094) (char->integer %_1095))))
(define char=? eq?)
(define char>=?
  (lambda (%_1096 %_1097)
    ((lambda (%_1098)
       (if %_1098 %_1098 (char=? %_1096 %_1097)))
     (char>? %_1096 %_1097))))
(define char<=?
  (lambda (%_1099 %_1100)
    ((lambda (%_1101)
       (if %_1101 %_1101 (char=? %_1099 %_1100)))
     (char<? %_1099 %_1100))))
(define char-ci>?
  (lambda (%_1102 %_1103)
    (char>?
      (char-downcase %_1102)
      (char-downcase %_1103))))
(define char-ci<?
  (lambda (%_1104 %_1105)
    (char<?
      (char-downcase %_1104)
      (char-downcase %_1105))))
(define char-ci=?
  (lambda (%_1106 %_1107)
    (char=?
      (char-downcase %_1106)
      (char-downcase %_1107))))
(define char-ci>=?
  (lambda (%_1108 %_1109)
    ((lambda (%_1110)
       (if %_1110 %_1110 (char-ci=? %_1108 %_1109)))
     (char-ci>? %_1108 %_1109))))
(define char-ci<=?
  (lambda (%_1111 %_1112)
    ((lambda (%_1113)
       (if %_1113 %_1113 (char-ci=? %_1111 %_1112)))
     (char-ci<? %_1111 %_1112))))
(define char-alphabetic?
  (lambda (%_1114)
    (if (char-ci>=? %_1114 '#\a)
      (char-ci<=? %_1114 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_1115)
    (if (char-ci>=? %_1115 '#\0)
      (char-ci<=? %_1115 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_1116)
    (if (memq %_1116 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_1117)
    (if (char-alphabetic? %_1117)
      (char<? %_1117 '#\a)
      '#f)))
(define char-lower-case?
  (lambda (%_1118)
    (if (char-alphabetic? %_1118)
      (char>? %_1118 '#\z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
((lambda (%_1119)
   (begin
     (set! %_1119
       (lambda (%_1124 %_1125 %_1126 %_1127 %_1128)
         (if (< %_1127 %_1128)
           (begin
             (string-set!
               %_1125
               %_1127
               (%_1126 (string-ref %_1124 %_1127)))
             (%_1119
               %_1124
               %_1125
               %_1126
               (+ %_1127 '1)
               %_1128))
           %_1125)))
     (begin
       (set! string-downcase
         (lambda (%_1120)
           ((lambda (%_1121)
              (%_1119
                %_1120
                %_1121
                char-downcase
                '0
                (string-length %_1120)))
            (make-string (string-length %_1120)))))
       (set! string-upcase
         (lambda (%_1122)
           ((lambda (%_1123)
              (%_1119
                %_1122
                %_1123
                char-upcase
                '0
                (string-length %_1122)))
            (make-string (string-length %_1122))))))))
 #f)
(define string=? equal?)
(define string<?
  ((lambda (%_1129)
     (begin
       (set! %_1129
         (lambda (%_1132 %_1133)
           (if (null? %_1132)
             (not (null? %_1133))
             (if (null? %_1133)
               '#f
               ((lambda (%_1134 %_1135)
                  (if (char<? %_1134 %_1135)
                    '#t
                    (if (char>? %_1134 %_1135)
                      '#f
                      (%_1129 (cdr %_1132) (cdr %_1133)))))
                (car %_1132)
                (car %_1133))))))
       (lambda (%_1130 %_1131)
         (%_1129
           (string->list %_1130)
           (string->list %_1131)))))
   #f))
(define string>?
  ((lambda (%_1136)
     (begin
       (set! %_1136
         (lambda (%_1139 %_1140)
           (if (null? %_1140)
             (not (null? %_1139))
             (if (null? %_1139)
               '#f
               ((lambda (%_1141 %_1142)
                  (if (char>? %_1141 %_1142)
                    '#t
                    (if (char<? %_1141 %_1142)
                      '#f
                      (%_1136 (cdr %_1139) (cdr %_1140)))))
                (car %_1139)
                (car %_1140))))))
       (lambda (%_1137 %_1138)
         (%_1136
           (string->list %_1137)
           (string->list %_1138)))))
   #f))
(define string<=?
  (lambda (%_1143 %_1144)
    ((lambda (%_1145)
       (if %_1145 %_1145 (string=? %_1143 %_1144)))
     (string<? %_1143 %_1144))))
(define string>=?
  (lambda (%_1146 %_1147)
    ((lambda (%_1148)
       (if %_1148 %_1148 (string=? %_1146 %_1147)))
     (string>? %_1146 %_1147))))
(define string-ci=?
  (lambda (%_1149 %_1150)
    (string=?
      (string-downcase %_1149)
      (string-downcase %_1150))))
(define string-ci<?
  (lambda (%_1151 %_1152)
    (string<?
      (string-downcase %_1151)
      (string-downcase %_1152))))
(define string-ci>?
  (lambda (%_1153 %_1154)
    (string>?
      (string-downcase %_1153)
      (string-downcase %_1154))))
(define string-ci>=?
  (lambda (%_1155 %_1156)
    (string>=?
      (string-downcase %_1155)
      (string-downcase %_1156))))
(define string-ci<=?
  (lambda (%_1157 %_1158)
    (string<=?
      (string-downcase %_1157)
      (string-downcase %_1158))))
(define substring
  ((lambda (%_1159)
     (begin
       (set! %_1159
         (lambda (%_1164 %_1165 %_1166 %_1167 %_1168)
           (if (< %_1167 %_1168)
             (begin
               (string-set!
                 %_1165
                 %_1166
                 (string-ref %_1164 %_1167))
               (%_1159
                 %_1164
                 %_1165
                 (+ %_1166 '1)
                 (+ %_1167 '1)
                 %_1168))
             (void))))
       (lambda (%_1160 %_1161 %_1162)
         ((lambda (%_1163)
            (begin
              (%_1159 %_1160 %_1163 '0 %_1161 %_1162)
              %_1163))
          (make-string (- %_1162 %_1161))))))
   #f))
(define format
  ((lambda (%_1169)
     (begin
       (set! %_1169
         (lambda (%_1172 %_1173 %_1174)
           (if (null? %_1172)
             (get-output-string %_1174)
             (if (eq? (car %_1172) '#\~)
               (begin
                 ((lambda (%_1175)
                    (if (memv %_1175 '(#\s))
                      (write (car %_1173) %_1174)
                      (if (memv %_1175 '(#\a))
                        (display (car %_1173) %_1174)
                        (if (memv %_1175 '(#\%))
                          (display '#\newline %_1174)
                          (if (memv %_1175 '(#\~))
                            (display '#\~ %_1174)
                            (void))))))
                  (cadr %_1172))
                 (%_1169
                   (cddr %_1172)
                   (if (not (null? %_1173)) (cdr %_1173) '())
                   %_1174))
               (begin
                 (display (car %_1172) %_1174)
                 (%_1169 (cdr %_1172) %_1173 %_1174))))))
       (lambda (%_1171 . %_1170)
         (%_1169
           (string->list %_1171)
           %_1170
           (open-output-string)))))
   #f))
(define error
  ((lambda (%_1176)
     (lambda %_1177
       ((lambda (%_1178)
          ((lambda (%_1179)
             ((lambda (%_1180)
                ((lambda ()
                   (if %_1178
                     (if %_1179
                       (%_1176
                         (format
                           '"Error in ~s: ~a"
                           %_1178
                           (apply format (cons %_1179 %_1180))))
                       (%_1176 (format '"Error in ~s." %_1178)))
                     (if %_1179
                       (if (string? %_1179)
                         (%_1176
                           (format
                             '"Error: ~a"
                             (apply format (cons %_1179 %_1180))))
                         (if (null? %_1180)
                           (%_1176 %_1179)
                           (error 'error
                                  '"cannot specify error arguments to a non format-string error.")))
                       (%_1176 '"Error."))))))
              (if (not %_1179)
                '()
                (if (not %_1178)
                  (if (not (null? %_1177))
                    (if (not (car %_1177))
                      (cddr %_1177)
                      (cdr %_1177))
                    (cdr %_1177))
                  (cddr %_1177)))))
           (if (not %_1178)
             (if (not (null? %_1177))
               (if (not (car %_1177))
                 (cadr %_1177)
                 (car %_1177))
               '#f)
             (if (not (null? (cdr %_1177))) (cadr %_1177) '#f))))
        (if (if (not (null? %_1177))
              (symbol? (car %_1177))
              '#f)
          (car %_1177)
          '#f))))
   error))
(define list-ref
  (lambda (%_1181 %_1182)
    (if (zero? %_1182)
      (car %_1181)
      (list-ref (cdr %_1181) (- %_1182 '1)))))
(define iota
  ((lambda (%_1183)
     (begin
       (set! %_1183
         (lambda (%_1185 %_1186)
           (if (> %_1185 %_1186)
             '()
             (cons %_1185 (%_1183 (+ %_1185 '1) %_1186)))))
       (lambda (%_1184) (%_1183 '0 %_1184))))
   #f))
(define values
  (lambda %_1187
    (call-with-current-continuation
      (lambda (%_1188) (apply %_1188 %_1187)))))
