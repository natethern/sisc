(define for-each
  (lambda (%_2865 . %_2864)
    (if (null? %_2864)
      (error 'for-each
             '"invalid number of arguments to procedure for-each.")
      (if (not (null? (car %_2864)))
        (begin
          (apply %_2865 (map car %_2864))
          (apply for-each (cons %_2865 (map cdr %_2864))))
        (void)))))
(define eof-object?
  (lambda (%_2866) (eq? %_2866 '#!eof)))
(define not
  (lambda (%_2867) (if %_2867 '#f '#t)))
(define eqv? eq?)
(define newline
  (lambda %_2868
    (apply display (cons '#\newline %_2868))))
(define map (void))
(letrec ((%_2869
           (letrec ((%_2870
                      (lambda (%_2874 %_2875 %_2876 %_2877)
                        (if (null? %_2877)
                          %_2875
                          (begin
                            (set-cdr!
                              %_2876
                              (cons (%_2874 (car %_2877)) '()))
                            (%_2870
                              %_2874
                              %_2875
                              (cdr %_2876)
                              (cdr %_2877)))))))
             (lambda (%_2871 %_2872)
               (if (null? %_2872)
                 '()
                 ((lambda (%_2873)
                    (%_2870 %_2871 %_2873 %_2873 (cdr %_2872)))
                  (cons (%_2871 (car %_2872)) '())))))))
  (set! map %_2869))
(define compose
  (lambda %_2878
    (if (null? %_2878)
      (lambda (%_2882) %_2882)
      ((lambda (%_2880 %_2879)
         (lambda (%_2881) (%_2879 (%_2880 %_2881))))
       (apply compose (cdr %_2878))
       (car %_2878)))))
(define compose2
  (lambda (%_2883 %_2884)
    (lambda (%_2885) (%_2883 (%_2884 %_2885)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
(letrec ((%_2887
           (lambda (%_2903 %_2904 %_2905)
             (if (null? %_2905)
               '#f
               (if (%_2903 (car %_2905) %_2904)
                 %_2905
                 (%_2887 %_2903 %_2904 (cdr %_2905))))))
         (%_2886
           (lambda (%_2900 %_2901 %_2902)
             (if (null? %_2902)
               '#f
               (if (%_2900 (caar %_2902) %_2901)
                 (car %_2902)
                 (%_2886 %_2900 %_2901 (cdr %_2902)))))))
  (begin
    (set! assq
      (lambda (%_2888 %_2889)
        (%_2886 eq? %_2888 %_2889)))
    (set! assv
      (lambda (%_2890 %_2891)
        (%_2886 eqv? %_2890 %_2891)))
    (set! assoc
      (lambda (%_2892 %_2893)
        (%_2886 equal? %_2892 %_2893)))
    (set! memq
      (lambda (%_2894 %_2895)
        (%_2887 eq? %_2894 %_2895)))
    (set! memv
      (lambda (%_2896 %_2897)
        (%_2887 eqv? %_2896 %_2897)))
    (set! member
      (lambda (%_2898 %_2899)
        (%_2887 equal? %_2898 %_2899)))))
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
  (lambda (%_2906 %_2907)
    (if (null? %_2906)
      %_2907
      (cons (car %_2906) (append2 (cdr %_2906) %_2907)))))
(define append append2)
(define list->string
  (lambda (%_2908)
    (letrec ((%_2909
               (lambda (%_2910 %_2911 %_2912)
                 (if (null? %_2910)
                   %_2911
                   (begin
                     (string-set! %_2911 %_2912 (car %_2910))
                     (%_2909 (cdr %_2910) %_2911 (+ %_2912 '1)))))))
      (%_2909 %_2908 (make-string (length %_2908)) '0))))
(define string->list
  (letrec ((%_2913
             (lambda (%_2915 %_2916 %_2917)
               (if (< %_2917 '0)
                 %_2916
                 (%_2913
                   %_2915
                   (cons (string-ref %_2915 %_2917) %_2916)
                   (- %_2917 '1))))))
    (lambda (%_2914)
      (%_2913 %_2914 '() (- (string-length %_2914) '1)))))
(define list->vector
  (letrec ((%_2918
             (lambda (%_2920 %_2921 %_2922)
               (if (null? %_2920)
                 %_2921
                 (begin
                   (vector-set! %_2921 %_2922 (car %_2920))
                   (%_2918 (cdr %_2920) %_2921 (+ %_2922 '1)))))))
    (lambda (%_2919)
      (if (proper-list? %_2919)
        (%_2918 %_2919 (make-vector (length %_2919)) '0)
        (error 'list->vector
               '"can only convert a proper list."
               %_2919)))))
(define vector
  (lambda %_2923 (list->vector %_2923)))
(define string
  (lambda %_2924 (list->string %_2924)))
(define throw
  (lambda (%_2926 . %_2925)
    (call-with-failure-continuation
      (lambda (%_2927)
        (if (null? %_2925)
          (call-with-current-continuation
            (lambda (%_2928) (%_2927 %_2926 %_2928)))
          (%_2927 %_2926 (car %_2925)))))))
(define detect-os
  (lambda ()
    ((lambda (%_2929)
       (if (> (string-length %_2929) '3)
         (if (equal? (substring %_2929 '0 '3) '"mac")
           'macos
           (if (equal? (substring %_2929 '0 '3) '"win")
             'ms-dos
             (if (equal? (substring %_2929 '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring %_2929 '0 '3) '"uni")
                 'unix
                 (if (equal? (substring %_2929 '0 '3) '"lin")
                   'unix
                   (if (equal? (substring %_2929 '0 '4) '"os/")
                     'os2
                     (if (equal? (substring %_2929 '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase
       (getprop 'os.name '*environment-variables*)))))
(define current-url (make-parameter '"file:."))
(define current-directory
  (lambda %_2930
    (if (null? %_2930)
      (normalize-url (current-url) '".")
      (current-url
        (normalize-url
          (current-url)
          ((lambda (%_2931)
             ((lambda (%_2932)
                (if (eq? (string-ref %_2931 (- %_2932 '1)) '#\/)
                  %_2931
                  (string-append %_2931 '"/")))
              (string-length %_2931)))
           (car %_2930)))))))
(define load-expanded load)
((lambda (%_2933)
   ((lambda (%_2936 %_2935 %_2934)
      (begin
        (set! open-input-file (%_2934 open-input-file))
        (set! open-source-input-file
          (%_2934 open-source-input-file))
        (set! open-output-file (%_2934 open-output-file))
        (set! load
          (lambda (%_2937)
            (begin
              ((lambda (%_2938)
                 (begin
                   (current-url (normalize-url %_2938 %_2937))
                   (with-failure-continuation
                     (lambda (%_2939 %_2940)
                       (begin
                         (current-url %_2938)
                         (throw %_2939 %_2940)))
                     (lambda ()
                       ((lambda (%_2941)
                          ((%_2935 (if %_2941 %_2941 '"scm"))
                           (current-url)))
                        (%_2936 (current-url)))))
                   (current-url %_2938)))
               (current-url))
              (void))))))
    (lambda (%_2947)
      ((letrec ((%_2948
                  (lambda (%_2949 %_2950)
                    (if (null? %_2949)
                      '#f
                      (if (equal? (car %_2949) '#\.)
                        (list->string %_2950)
                        (%_2948 (cdr %_2949) (cons (car %_2949) %_2950)))))))
         %_2948)
       (reverse (string->list %_2947))
       '()))
    (lambda (%_2945)
      ((lambda (%_2946)
         (if (memv %_2946 '(sce pp)) load-expanded %_2933))
       (string->symbol (string-downcase %_2945))))
    (lambda (%_2942)
      (lambda (%_2944 . %_2943)
        (apply %_2942
               (normalize-url (current-url) %_2944)
               %_2943)))))
 load)
(define load-module
  (lambda (%_2951)
    ((lambda (%_2952)
       ((lambda (%_2953)
          (for-each
            (lambda (%_2954)
              (putprop
                %_2954
                '*toplevel*
                (native-library-binding %_2952 %_2954)))
            %_2953))
        (native-library-binding-names %_2952)))
     (load-native-library %_2951))))
(define reverse
  (letrec ((%_2955
             (lambda (%_2957 %_2958)
               (if (null? %_2957)
                 %_2958
                 (%_2955 (cdr %_2957) (cons (car %_2957) %_2958))))))
    (lambda (%_2956) (%_2955 %_2956 '()))))
(define append
  (letrec ((%_2959
             (lambda (%_2962 . %_2961)
               (if (null? %_2961)
                 %_2962
                 (if (null? %_2962)
                   (apply %_2959 %_2961)
                   (apply %_2959
                          (cons (append2 %_2962 (car %_2961))
                                (cdr %_2961))))))))
    (lambda %_2960
      (if (null? %_2960)
        '()
        (if (null? (cdr %_2960))
          (car %_2960)
          (apply %_2959 (cons (car %_2960) (cdr %_2960))))))))
(define map
  (letrec ((%_2964
             (lambda (%_2968 %_2969 %_2970 %_2971)
               (if (null? (car %_2969))
                 (if (andmap null? %_2969)
                   %_2970
                   (error 'map '"lists are not of equal length."))
                 ((lambda (%_2972 %_2973)
                    (begin
                      (if (not (null? %_2971))
                        (set-cdr! %_2971 %_2972)
                        (void))
                      (if (null? %_2970)
                        (%_2964 %_2968 %_2973 %_2972 %_2972)
                        (%_2964 %_2968 %_2973 %_2970 %_2972))))
                  (cons (apply %_2968 (%_2963 car %_2969)) '())
                  (%_2963 cdr %_2969)))))
           (%_2963 map))
    (lambda (%_2967 %_2966 . %_2965)
      (if (null? %_2965)
        (%_2963 %_2967 %_2966)
        (%_2964 %_2967 (cons %_2966 %_2965) '() '())))))
(define proper-list?
  (lambda (%_2974)
    ((letrec ((%_2975
                (lambda (%_2976 %_2977)
                  (if (pair? %_2976)
                    ((lambda (%_2978)
                       (if (pair? %_2978)
                         ((lambda (%_2979 %_2980)
                            (if (not (eq? %_2979 %_2980))
                              (%_2975 %_2979 %_2980)
                              '#f))
                          (cdr %_2978)
                          (cdr %_2977))
                         (null? %_2978)))
                     (cdr %_2976))
                    (null? %_2976)))))
       %_2975)
     %_2974
     %_2974)))
(define circular?
  (lambda (%_2981)
    (letrec ((%_2986
               (lambda (%_3004 %_3005)
                 (letrec ((%_3006
                            (lambda (%_3015 %_3016)
                              ((lambda (%_3017)
                                 (if %_3017
                                   (%_2986 (%_2985 %_3015) (%_2985 %_3017))
                                   '#f))
                               (%_2985 %_3016)))))
                   (if %_3005
                     (if (not (eq? (car %_3005) (car %_3004)))
                       (%_3006 %_3004 %_3005)
                       ((letrec ((%_3007
                                   (lambda (%_3008 %_3009)
                                     ((lambda (%_3010)
                                        (if %_3010
                                          %_3010
                                          (if (if (= (cadr %_3008)
                                                     (cadr %_3009))
                                                (eq? (caddr %_3008)
                                                     (caddr %_3009))
                                                '#f)
                                            (%_3007
                                              (cddr %_3008)
                                              (cddr %_3009))
                                            ((lambda (%_3011)
                                               ((letrec ((%_3012
                                                           (lambda (%_3013)
                                                             (if %_3013
                                                               ((lambda (%_3014)
                                                                  (if %_3014
                                                                    %_3014
                                                                    (%_3012
                                                                      (%_2985
                                                                        %_3013))))
                                                                (eq? (car %_3013)
                                                                     %_3011))
                                                               (%_3006
                                                                 %_3008
                                                                 %_3009)))))
                                                  %_3012)
                                                (%_2985 (list %_3011))))
                                             (car %_3008)))))
                                      (null? (cdr %_3008))))))
                          %_3007)
                        %_3004
                        %_3005))
                     '#f))))
             (%_2985
               (lambda (%_2994)
                 ((lambda (%_2995)
                    ((letrec ((%_2996
                                (lambda (%_2997 %_2998 %_2999)
                                  (if (>= %_2998 '0)
                                    ((lambda (%_3003)
                                       (if (%_2982 %_3003)
                                         (cons %_3003 (cons %_2998 %_2999))
                                         (%_2996 %_2997 (- %_2998 '1) %_2999)))
                                     (%_2984 %_2997 %_2998))
                                    ((lambda (%_3000)
                                       (if (pair? %_3000)
                                         ((lambda (%_3001 %_3002)
                                            (%_2996
                                              (car %_3002)
                                              (- %_3001 '1)
                                              %_3002))
                                          (car %_3000)
                                          (cdr %_3000))
                                         '#f))
                                     (cdr %_2999))))))
                       %_2996)
                     %_2995
                     (- (%_2983 %_2995) '1)
                     %_2994))
                  (car %_2994))))
             (%_2984
               (lambda (%_2992 %_2993)
                 (if (vector? %_2992)
                   (vector-ref %_2992 %_2993)
                   (if (box? %_2992)
                     (unbox %_2992)
                     ((if (zero? %_2993) car cdr) %_2992)))))
             (%_2983
               (lambda (%_2991)
                 (if (pair? %_2991)
                   '2
                   (if (box? %_2991) '1 (vector-length %_2991)))))
             (%_2982
               (lambda (%_2988)
                 ((lambda (%_2989)
                    (if %_2989
                      %_2989
                      ((lambda (%_2990)
                         (if %_2990
                           %_2990
                           (if (vector? %_2988)
                             (not (zero? (vector-length %_2988)))
                             '#f)))
                       (box? %_2988))))
                  (pair? %_2988)))))
      (if (%_2982 %_2981)
        ((lambda (%_2987) (%_2986 %_2987 (%_2985 %_2987)))
         (list %_2981))
        '#f))))
(define list?
  (letrec ((%_3018
             (lambda (%_3021 %_3022)
               ((lambda (%_3023)
                  (if %_3023
                    %_3023
                    ((lambda (%_3024)
                       (if %_3024
                         %_3024
                         (if (pair? %_3022)
                           ((lambda (%_3025)
                              (if %_3025
                                %_3025
                                (if (not (eq? %_3021 %_3022))
                                  (%_3018 (cdr %_3021) (cddr %_3022))
                                  '#f)))
                            (null? (cdr %_3022)))
                           '#f)))
                     (null? %_3022))))
                (null? %_3021)))))
    (lambda (%_3019)
      ((lambda (%_3020)
         (if %_3020
           %_3020
           (if (pair? %_3019)
             (%_3018 %_3019 (cdr %_3019))
             '#f)))
       (null? %_3019)))))
(define expt
  (lambda (%_3026 %_3027)
    (if (if (integer? %_3027) (= %_3026 '2) '#f)
      (ashl '1 %_3027)
      ((letrec ((%_3028
                  (lambda (%_3029 %_3030 %_3031)
                    (if (zero? %_3029)
                      %_3030
                      (%_3028
                        (quotient %_3029 '2)
                        (if (odd? %_3029) (* %_3030 %_3031) %_3030)
                        (* %_3031 %_3031))))))
         %_3028)
       %_3027
       '1
       %_3026))))
(define modpow
  (lambda (%_3032 %_3033 %_3034)
    (if (= %_3033 '1)
      (modulo %_3032 %_3034)
      (if (even? %_3033)
        ((lambda (%_3037)
           (modulo (* %_3037 %_3037) %_3034))
         (modpow %_3032 (/ %_3033 '2) %_3034))
        ((lambda (%_3036)
           (begin
             (set! %_3036 (modulo (* %_3036 %_3036) %_3034))
             (modulo (* %_3032 %_3036) %_3034)))
         (modpow %_3032 (/ (- %_3033 '1) '2) %_3034))))))
(define integer?
  ((lambda (%_3038)
     (lambda (%_3039)
       ((lambda (%_3040)
          (if %_3040
            %_3040
            (if (real? %_3039) (= (round %_3039) %_3039) '#f)))
        (%_3038 %_3039))))
   integer?))
(define real?
  ((lambda (%_3041)
     (lambda (%_3042)
       (if (number? %_3042) (not (%_3041 %_3042)) '#f)))
   complex?))
(define complex? number?)
(define abs
  (lambda (%_3043)
    (if (not (real? %_3043))
      ((lambda (%_3045 %_3044)
         (sqrt (+ (* %_3044 %_3044) (* %_3045 %_3045))))
       (imag-part %_3043)
       (real-part %_3043))
      (if (< %_3043 '0) (- %_3043) %_3043))))
(define min (void))
(define max (void))
(letrec ((%_3046
           (lambda (%_3051 %_3052 %_3053 %_3054)
             (if (null? %_3053)
               (if (if %_3054 (exact? %_3052) '#f)
                 (exact->inexact %_3052)
                 %_3052)
               (if (%_3051 (car %_3053) %_3052)
                 (%_3046
                   %_3051
                   (car %_3053)
                   (cdr %_3053)
                   ((lambda (%_3055)
                      (if %_3055 %_3055 (inexact? (car %_3053))))
                    %_3054))
                 (%_3046 %_3051 %_3052 (cdr %_3053) %_3054))))))
  (begin
    (set! min
      (lambda (%_3048 . %_3047)
        (if (null? %_3047)
          %_3048
          (%_3046 < %_3048 %_3047 (inexact? %_3048)))))
    (set! max
      (lambda (%_3050 . %_3049)
        (if (null? %_3049)
          %_3050
          (%_3046 > %_3050 %_3049 (inexact? %_3050)))))))
(define negative?
  (lambda (%_3056) (< %_3056 '0)))
(define positive?
  (lambda (%_3057) (> %_3057 '0)))
(define even?
  (lambda (%_3058) (= '0 (modulo %_3058 '2))))
(define odd?
  (lambda (%_3059) (not (even? %_3059))))
(define zero? (lambda (%_3060) (= %_3060 '0)))
(define add1 (lambda (%_3061) (+ %_3061 '1)))
(define sub1 (lambda (%_3062) (- %_3062 '1)))
(define >= (void))
(define <= (void))
((lambda (%_3064 %_3063)
   (begin
     (set! <=
       (%_3063
         (lambda (%_3065 %_3066)
           ((lambda (%_3067)
              (if %_3067 %_3067 (= %_3065 %_3066)))
            (< %_3065 %_3066)))
         %_3064
         '#t))
     (set! >=
       (%_3063
         (lambda (%_3068 %_3069)
           ((lambda (%_3070)
              (if %_3070 %_3070 (= %_3068 %_3069)))
            (> %_3068 %_3069)))
         %_3064
         '#t))))
 (lambda (%_3077 %_3078) (if %_3077 %_3078 '#f))
 (lambda (%_3071 %_3072 %_3073)
   (lambda %_3074
     ((letrec ((%_3075
                 (lambda (%_3076)
                   (if (null? %_3076)
                     %_3073
                     (if (null? (cdr %_3076))
                       %_3073
                       (%_3072
                         (%_3071 (car %_3076) (cadr %_3076))
                         (%_3075 (cdr %_3076))))))))
        %_3075)
      %_3074))))
((lambda (%_3079)
   (begin
     (set! >= (%_3079 > >=))
     (set! <= (%_3079 < <=))))
 (lambda (%_3080 %_3081)
   (lambda %_3082
     ((lambda (%_3083)
        (if %_3083
          %_3083
          ((lambda (%_3084)
             (if %_3084
               %_3084
               (if ((lambda (%_3085)
                      (if %_3085
                        %_3085
                        (%_3080 (car %_3082) (cadr %_3082))))
                    (= (car %_3082) (cadr %_3082)))
                 (apply %_3081 (cdr %_3082))
                 '#f)))
           (null? (cdr %_3082)))))
      (null? %_3082)))))
(define gcd
  (lambda %_3086
    (if (null? %_3086)
      '0
      (if (null? (cdr %_3086))
        (car %_3086)
        (_gcd (car %_3086) (cadr %_3086))))))
(define lcm
  (lambda %_3087
    (if (null? %_3087)
      '1
      (if (null? (cdr %_3087))
        (car %_3087)
        (_lcm (car %_3087) (cadr %_3087))))))
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
  (lambda %_3088
    (if (null? %_3088)
      '""
      (if (null? (cdr %_3088))
        (car %_3088)
        (apply string-append
               (_string-append (car %_3088) (cadr %_3088))
               (cddr %_3088))))))
(define char-downcase
  ((lambda (%_3089)
     ((lambda (%_3090)
        ((lambda (%_3091)
           (lambda (%_3092)
             ((lambda (%_3093)
                (if (if (>= %_3093 %_3089) (<= %_3093 %_3090) '#f)
                  (integer->char (+ %_3093 %_3091))
                  %_3092))
              (char->integer %_3092))))
         (- (char->integer '#\a) %_3089)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_3094)
     ((lambda (%_3095)
        ((lambda (%_3096)
           (lambda (%_3097)
             ((lambda (%_3098)
                (if (if (>= %_3098 %_3094) (<= %_3098 %_3095) '#f)
                  (integer->char (- %_3098 %_3096))
                  %_3097))
              (char->integer %_3097))))
         (- %_3094 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_3099 %_3100)
    (> (char->integer %_3099) (char->integer %_3100))))
(define char<?
  (lambda (%_3101 %_3102)
    (< (char->integer %_3101) (char->integer %_3102))))
(define char=? eq?)
(define char>=?
  (lambda (%_3103 %_3104)
    ((lambda (%_3105)
       (if %_3105 %_3105 (char=? %_3103 %_3104)))
     (char>? %_3103 %_3104))))
(define char<=?
  (lambda (%_3106 %_3107)
    ((lambda (%_3108)
       (if %_3108 %_3108 (char=? %_3106 %_3107)))
     (char<? %_3106 %_3107))))
(define char-ci>?
  (lambda (%_3109 %_3110)
    (char>?
      (char-downcase %_3109)
      (char-downcase %_3110))))
(define char-ci<?
  (lambda (%_3111 %_3112)
    (char<?
      (char-downcase %_3111)
      (char-downcase %_3112))))
(define char-ci=?
  (lambda (%_3113 %_3114)
    (char=?
      (char-downcase %_3113)
      (char-downcase %_3114))))
(define char-ci>=?
  (lambda (%_3115 %_3116)
    ((lambda (%_3117)
       (if %_3117 %_3117 (char-ci=? %_3115 %_3116)))
     (char-ci>? %_3115 %_3116))))
(define char-ci<=?
  (lambda (%_3118 %_3119)
    ((lambda (%_3120)
       (if %_3120 %_3120 (char-ci=? %_3118 %_3119)))
     (char-ci<? %_3118 %_3119))))
(define char-alphabetic?
  (lambda (%_3121)
    (if (char-ci>=? %_3121 '#\a)
      (char-ci<=? %_3121 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_3122)
    (if (char-ci>=? %_3122 '#\0)
      (char-ci<=? %_3122 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_3123)
    (if (memq %_3123 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_3124)
    (if (char-alphabetic? %_3124)
      (char>? %_3124 '#\a)
      '#f)))
(define char-lower-case?
  (lambda (%_3125)
    (if (char-alphabetic? %_3125)
      (char>? %_3125 '#\Z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
(letrec ((%_3126
           (lambda (%_3131 %_3132 %_3133 %_3134 %_3135)
             (if (< %_3134 %_3135)
               (begin
                 (string-set!
                   %_3132
                   %_3134
                   (%_3133 (string-ref %_3131 %_3134)))
                 (%_3126
                   %_3131
                   %_3132
                   %_3133
                   (+ %_3134 '1)
                   %_3135))
               %_3132))))
  (begin
    (set! string-downcase
      (lambda (%_3127)
        ((lambda (%_3128)
           (%_3126
             %_3127
             %_3128
             char-downcase
             '0
             (string-length %_3127)))
         (make-string (string-length %_3127)))))
    (set! string-upcase
      (lambda (%_3129)
        ((lambda (%_3130)
           (%_3126
             %_3129
             %_3130
             char-upcase
             '0
             (string-length %_3129)))
         (make-string (string-length %_3129)))))))
(define string=? equal?)
(define string<?
  (letrec ((%_3136
             (lambda (%_3139 %_3140)
               (if (null? %_3139)
                 (not (null? %_3140))
                 (if (null? %_3140)
                   '#f
                   ((lambda (%_3141 %_3142)
                      (if (char<? %_3141 %_3142)
                        '#t
                        (if (char>? %_3141 %_3142)
                          '#f
                          (%_3136 (cdr %_3139) (cdr %_3140)))))
                    (car %_3139)
                    (car %_3140)))))))
    (lambda (%_3137 %_3138)
      (%_3136
        (string->list %_3137)
        (string->list %_3138)))))
(define string>?
  (letrec ((%_3143
             (lambda (%_3146 %_3147)
               (if (null? %_3147)
                 (not (null? %_3146))
                 (if (null? %_3146)
                   '#f
                   ((lambda (%_3148 %_3149)
                      (if (char>? %_3148 %_3149)
                        '#t
                        (if (char<? %_3148 %_3149)
                          '#f
                          (%_3143 (cdr %_3146) (cdr %_3147)))))
                    (car %_3146)
                    (car %_3147)))))))
    (lambda (%_3144 %_3145)
      (%_3143
        (string->list %_3144)
        (string->list %_3145)))))
(define string<=?
  (lambda (%_3150 %_3151)
    ((lambda (%_3152)
       (if %_3152 %_3152 (string=? %_3150 %_3151)))
     (string<? %_3150 %_3151))))
(define string>=?
  (lambda (%_3153 %_3154)
    ((lambda (%_3155)
       (if %_3155 %_3155 (string=? %_3153 %_3154)))
     (string>? %_3153 %_3154))))
(define string-ci=?
  (lambda (%_3156 %_3157)
    (string=?
      (string-downcase %_3156)
      (string-downcase %_3157))))
(define string-ci<?
  (lambda (%_3158 %_3159)
    (string<?
      (string-downcase %_3158)
      (string-downcase %_3159))))
(define string-ci>?
  (lambda (%_3160 %_3161)
    (string>?
      (string-downcase %_3160)
      (string-downcase %_3161))))
(define string-ci>=?
  (lambda (%_3162 %_3163)
    (string>=?
      (string-downcase %_3162)
      (string-downcase %_3163))))
(define string-ci<=?
  (lambda (%_3164 %_3165)
    (string<=?
      (string-downcase %_3164)
      (string-downcase %_3165))))
(define substring
  (letrec ((%_3166
             (lambda (%_3171 %_3172 %_3173 %_3174 %_3175)
               (if (< %_3174 %_3175)
                 (begin
                   (string-set!
                     %_3172
                     %_3173
                     (string-ref %_3171 %_3174))
                   (%_3166
                     %_3171
                     %_3172
                     (+ %_3173 '1)
                     (+ %_3174 '1)
                     %_3175))
                 (void)))))
    (lambda (%_3167 %_3168 %_3169)
      ((lambda (%_3170)
         (begin
           (%_3166 %_3167 %_3170 '0 %_3168 %_3169)
           %_3170))
       (make-string (- %_3169 %_3168))))))
(define format
  (lambda (%_3177 . %_3176)
    ((lambda (%_3178)
       ((letrec ((%_3179
                   (lambda (%_3180 %_3181)
                     (if (null? %_3180)
                       (get-output-string %_3178)
                       (if (char=? (car %_3180) '#\~)
                         (if (null? (cdr %_3180))
                           (error 'format '"Incomplete escape sequence")
                           ((lambda (%_3182)
                              (if (memv %_3182 '(#\a))
                                (if (null? %_3181)
                                  (error 'format
                                         '"No value for escape sequence")
                                  (begin
                                    (display (car %_3181) %_3178)
                                    (%_3179 (cddr %_3180) (cdr %_3181))))
                                (if (memv %_3182 '(#\s))
                                  (if (null? %_3181)
                                    (error 'format
                                           '"No value for escape sequence")
                                    (begin
                                      (write (car %_3181) %_3178)
                                      (%_3179 (cddr %_3180) (cdr %_3181))))
                                  (if (memv %_3182 '(#\%))
                                    (begin
                                      (display '#\newline %_3178)
                                      (%_3179 (cddr %_3180) %_3181))
                                    (if (memv %_3182 '(#\~))
                                      (begin
                                        (display '#\~ %_3178)
                                        (%_3179 (cddr %_3180) %_3181))
                                      (error 'format
                                             '"Unrecognized escape sequence"))))))
                            (cadr %_3180)))
                         (begin
                           (display (car %_3180) %_3178)
                           (%_3179 (cdr %_3180) %_3181)))))))
          %_3179)
        (string->list %_3177)
        %_3176))
     (open-output-string))))
(define list-ref
  (lambda (%_3183 %_3184)
    (if (zero? %_3184)
      (car %_3183)
      (list-ref (cdr %_3183) (- %_3184 '1)))))
(define values
  (lambda %_3185
    (call-with-current-continuation
      (lambda (%_3186) (apply %_3186 %_3185)))))
