(define for-each
  (lambda (%_2649 . %_2648)
    (if (null? %_2648)
      (error 'for-each
             '"invalid number of arguments to procedure for-each.")
      (if (not (null? (car %_2648)))
        (begin
          (apply %_2649 (map car %_2648))
          (apply for-each (cons %_2649 (map cdr %_2648))))
        (void)))))
(define eof-object?
  (lambda (%_2650) (eq? %_2650 '#!eof)))
(define not
  (lambda (%_2651) (if %_2651 '#f '#t)))
(define eqv? eq?)
(define newline
  (lambda %_2652
    (apply display (cons '#\newline %_2652))))
(define map (void))
(letrec ((%_2653
           (letrec ((%_2654
                      (lambda (%_2658 %_2659 %_2660 %_2661)
                        (if (null? %_2661)
                          %_2659
                          (begin
                            (set-cdr!
                              %_2660
                              (cons (%_2658 (car %_2661)) '()))
                            (%_2654
                              %_2658
                              %_2659
                              (cdr %_2660)
                              (cdr %_2661)))))))
             (lambda (%_2655 %_2656)
               (if (null? %_2656)
                 '()
                 ((lambda (%_2657)
                    (%_2654 %_2655 %_2657 %_2657 (cdr %_2656)))
                  (cons (%_2655 (car %_2656)) '())))))))
  (set! map %_2653))
(define compose
  (lambda %_2662
    (if (null? %_2662)
      (lambda (%_2666) %_2666)
      ((lambda (%_2664 %_2663)
         (lambda (%_2665) (%_2663 (%_2664 %_2665))))
       (apply compose (cdr %_2662))
       (car %_2662)))))
(define compose2
  (lambda (%_2667 %_2668)
    (lambda (%_2669) (%_2667 (%_2668 %_2669)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
(letrec ((%_2671
           (lambda (%_2687 %_2688 %_2689)
             (if (null? %_2689)
               '#f
               (if (%_2687 (car %_2689) %_2688)
                 %_2689
                 (%_2671 %_2687 %_2688 (cdr %_2689))))))
         (%_2670
           (lambda (%_2684 %_2685 %_2686)
             (if (null? %_2686)
               '#f
               (if (%_2684 (caar %_2686) %_2685)
                 (car %_2686)
                 (%_2670 %_2684 %_2685 (cdr %_2686)))))))
  (begin
    (set! assq
      (lambda (%_2672 %_2673)
        (%_2670 eq? %_2672 %_2673)))
    (set! assv
      (lambda (%_2674 %_2675)
        (%_2670 eqv? %_2674 %_2675)))
    (set! assoc
      (lambda (%_2676 %_2677)
        (%_2670 equal? %_2676 %_2677)))
    (set! memq
      (lambda (%_2678 %_2679)
        (%_2671 eq? %_2678 %_2679)))
    (set! memv
      (lambda (%_2680 %_2681)
        (%_2671 eqv? %_2680 %_2681)))
    (set! member
      (lambda (%_2682 %_2683)
        (%_2671 equal? %_2682 %_2683)))))
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
  (lambda (%_2690 %_2691)
    (if (null? %_2690)
      %_2691
      (cons (car %_2690) (append2 (cdr %_2690) %_2691)))))
(define append append2)
(define list->string
  (lambda (%_2692)
    (letrec ((%_2693
               (lambda (%_2694 %_2695 %_2696)
                 (if (null? %_2694)
                   %_2695
                   (begin
                     (string-set! %_2695 %_2696 (car %_2694))
                     (%_2693 (cdr %_2694) %_2695 (+ %_2696 '1)))))))
      (%_2693 %_2692 (make-string (length %_2692)) '0))))
(define string->list
  (letrec ((%_2697
             (lambda (%_2699 %_2700 %_2701)
               (if (< %_2701 '0)
                 %_2700
                 (%_2697
                   %_2699
                   (cons (string-ref %_2699 %_2701) %_2700)
                   (- %_2701 '1))))))
    (lambda (%_2698)
      (%_2697 %_2698 '() (- (string-length %_2698) '1)))))
(define list->vector
  (letrec ((%_2702
             (lambda (%_2704 %_2705 %_2706)
               (if (null? %_2704)
                 %_2705
                 (begin
                   (vector-set! %_2705 %_2706 (car %_2704))
                   (%_2702 (cdr %_2704) %_2705 (+ %_2706 '1)))))))
    (lambda (%_2703)
      (if (proper-list? %_2703)
        (%_2702 %_2703 (make-vector (length %_2703)) '0)
        (error 'list->vector
               '"can only convert a proper list."
               %_2703)))))
(define vector
  (lambda %_2707 (list->vector %_2707)))
(define string
  (lambda %_2708 (list->string %_2708)))
(define detect-os
  (lambda ()
    ((lambda (%_2709)
       (if (> (string-length %_2709) '3)
         (if (equal? (substring %_2709 '0 '3) '"mac")
           'macos
           (if (equal? (substring %_2709 '0 '3) '"win")
             'ms-dos
             (if (equal? (substring %_2709 '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring %_2709 '0 '3) '"uni")
                 'unix
                 (if (equal? (substring %_2709 '0 '3) '"lin")
                   'unix
                   (if (equal? (substring %_2709 '0 '4) '"os/")
                     'os2
                     (if (equal? (substring %_2709 '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase
       (getprop 'os.name '*environment-variables*)))))
(define current-url (make-parameter '"file:."))
(define current-directory
  (lambda %_2710
    (if (null? %_2710)
      (normalize-url (current-url) '".")
      (current-url
        (normalize-url
          (current-url)
          ((lambda (%_2711)
             ((lambda (%_2712)
                (if (eq? (string-ref %_2711 (- %_2712 '1)) '#\/)
                  %_2711
                  (string-append %_2711 '"/")))
              (string-length %_2711)))
           (car %_2710)))))))
(define load-expanded load)
((lambda (%_2713)
   ((lambda (%_2716 %_2715 %_2714)
      (begin
        (set! open-input-file (%_2714 open-input-file))
        (set! open-source-input-file
          (%_2714 open-source-input-file))
        (set! open-output-file (%_2714 open-output-file))
        (set! load
          (lambda (%_2717)
            (begin
              ((lambda (%_2718)
                 (begin
                   (current-url (normalize-url %_2718 %_2717))
                   (with-failure-continuation
                     (lambda (%_2719 %_2720)
                       (begin
                         (current-url %_2718)
                         (call-with-failure-continuation
                           (lambda (%_2721) (%_2721 %_2719 %_2720)))))
                     (lambda ()
                       ((lambda (%_2722)
                          ((%_2715 (if %_2722 %_2722 '"scm"))
                           (current-url)))
                        (%_2716 (current-url)))))
                   (current-url %_2718)))
               (current-url))
              (void))))))
    (lambda (%_2731)
      ((letrec ((%_2732
                  (lambda (%_2733 %_2734)
                    (if (null? %_2733)
                      '#f
                      (if (equal? (car %_2733) '#\.)
                        (list->string %_2734)
                        (%_2732 (cdr %_2733) (cons (car %_2733) %_2734)))))))
         %_2732)
       (reverse (string->list %_2731))
       '()))
    (lambda (%_2726)
      ((lambda (%_2727)
         (if (memv %_2727 '(sce pp))
           load-expanded
           (if (memv %_2727 '(sll))
             (with-failure-continuation
               (lambda (%_2728 %_2729)
                 (lambda (%_2730)
                   (error 'load
                          '"shared libraries not supported in this build.")))
               (lambda ()
                 (eval '(lambda (name)
                          (import compiled-libraries)
                          (link-library (open-library name))))))
             %_2713)))
       (string->symbol (string-downcase %_2726))))
    (lambda (%_2723)
      (lambda (%_2725 . %_2724)
        (apply %_2723
               (normalize-url (current-url) %_2725)
               %_2724)))))
 load)
(define load-module
  (lambda (%_2735)
    ((lambda (%_2736)
       ((lambda (%_2737)
          (for-each
            (lambda (%_2738)
              (putprop
                %_2738
                '*toplevel*
                (native-library-binding %_2736 %_2738)))
            %_2737))
        (native-library-binding-names %_2736)))
     (load-native-library %_2735))))
(define reverse
  (letrec ((%_2739
             (lambda (%_2741 %_2742)
               (if (null? %_2741)
                 %_2742
                 (%_2739 (cdr %_2741) (cons (car %_2741) %_2742))))))
    (lambda (%_2740) (%_2739 %_2740 '()))))
(define append
  (letrec ((%_2743
             (lambda (%_2746 . %_2745)
               (if (null? %_2745)
                 %_2746
                 (if (null? %_2746)
                   (apply %_2743 %_2745)
                   (apply %_2743
                          (cons (append2 %_2746 (car %_2745))
                                (cdr %_2745))))))))
    (lambda %_2744
      (if (null? %_2744)
        '()
        (if (null? (cdr %_2744))
          (car %_2744)
          (apply %_2743 (cons (car %_2744) (cdr %_2744))))))))
(define map
  (letrec ((%_2748
             (lambda (%_2752 %_2753 %_2754 %_2755)
               (if (null? (car %_2753))
                 (if (andmap null? %_2753)
                   %_2754
                   (error 'map '"lists are not of equal length."))
                 ((lambda (%_2757 %_2756)
                    (begin
                      (if (not (null? %_2755))
                        (set-cdr! %_2755 %_2756)
                        (void))
                      (if (null? %_2754)
                        (%_2748 %_2752 %_2757 %_2756 %_2756)
                        (%_2748 %_2752 %_2757 %_2754 %_2756))))
                  (%_2747 cdr %_2753)
                  (cons (apply %_2752 (%_2747 car %_2753)) '())))))
           (%_2747 map))
    (lambda (%_2751 %_2750 . %_2749)
      (if (null? %_2749)
        (%_2747 %_2751 %_2750)
        (%_2748 %_2751 (cons %_2750 %_2749) '() '())))))
(define proper-list?
  (lambda (%_2758)
    ((letrec ((%_2759
                (lambda (%_2760 %_2761)
                  (if (pair? %_2760)
                    ((lambda (%_2762)
                       (if (pair? %_2762)
                         ((lambda (%_2764 %_2763)
                            (if (not (eq? %_2763 %_2764))
                              (%_2759 %_2763 %_2764)
                              '#f))
                          (cdr %_2761)
                          (cdr %_2762))
                         (null? %_2762)))
                     (cdr %_2760))
                    (null? %_2760)))))
       %_2759)
     %_2758
     %_2758)))
(define list? proper-list?)
(define expt
  (letrec ((%_2803
             (lambda (%_2808 %_2809)
               (if (negative? %_2809)
                 (/ (%_2803 %_2808 (abs %_2809)))
                 (if (if (exact? %_2808) (= %_2808 '2) '#f)
                   (ashl '1 %_2809)
                   ((letrec ((%_2810
                               (lambda (%_2811 %_2812 %_2813)
                                 (if (zero? %_2811)
                                   %_2812
                                   (%_2810
                                     (quotient %_2811 '2)
                                     (if (odd? %_2811)
                                       (* %_2812 %_2813)
                                       %_2812)
                                     (* %_2813 %_2813))))))
                      %_2810)
                    %_2809
                    '1
                    %_2808)))))
           (%_2802
             (lambda (%_2806 %_2807)
               (exp (* %_2807 (log %_2806))))))
    (lambda (%_2804 %_2805)
      (if (zero? %_2805)
        (if (exact? %_2805) '1 '1.0)
        (if (zero? %_2804)
          (if (exact? %_2805) %_2804 '0.0)
          (if (if (exact? %_2805) (integer? %_2805) '#f)
            (%_2803 %_2804 %_2805)
            (%_2802 %_2804 %_2805)))))))
(define modpow
  (lambda (%_2814 %_2815 %_2816)
    (if (= %_2815 '1)
      (modulo %_2814 %_2816)
      (if (even? %_2815)
        ((lambda (%_2819)
           (modulo (* %_2819 %_2819) %_2816))
         (modpow %_2814 (/ %_2815 '2) %_2816))
        ((lambda (%_2818)
           (begin
             (set! %_2818 (modulo (* %_2818 %_2818) %_2816))
             (modulo (* %_2814 %_2818) %_2816)))
         (modpow %_2814 (/ (- %_2815 '1) '2) %_2816))))))
(define integer?
  ((lambda (%_2820)
     (lambda (%_2821)
       ((lambda (%_2822)
          (if %_2822
            %_2822
            (if (real? %_2821) (= (round %_2821) %_2821) '#f)))
        (%_2820 %_2821))))
   integer?))
(define real?
  ((lambda (%_2823)
     (lambda (%_2824)
       (if (number? %_2824) (not (%_2823 %_2824)) '#f)))
   complex?))
(define rational? real?)
(define complex? number?)
(define abs
  (lambda (%_2825)
    (if (not (real? %_2825))
      ((lambda (%_2827 %_2826)
         (sqrt (+ (* %_2826 %_2826) (* %_2827 %_2827))))
       (imag-part %_2825)
       (real-part %_2825))
      (if (< %_2825 '0) (- %_2825) %_2825))))
(define min (void))
(define max (void))
(letrec ((%_2828
           (lambda (%_2833 %_2834 %_2835 %_2836)
             (if (null? %_2835)
               (if (if %_2836 (exact? %_2834) '#f)
                 (exact->inexact %_2834)
                 %_2834)
               (if (%_2833 (car %_2835) %_2834)
                 (%_2828
                   %_2833
                   (car %_2835)
                   (cdr %_2835)
                   (if %_2836 %_2836 (inexact? (car %_2835))))
                 (%_2828 %_2833 %_2834 (cdr %_2835) %_2836))))))
  (begin
    (set! min
      (lambda (%_2830 . %_2829)
        (if (null? %_2829)
          %_2830
          (%_2828 < %_2830 %_2829 (inexact? %_2830)))))
    (set! max
      (lambda (%_2832 . %_2831)
        (if (null? %_2831)
          %_2832
          (%_2828 > %_2832 %_2831 (inexact? %_2832)))))))
(define negative?
  (lambda (%_2838) (< %_2838 '0)))
(define positive?
  (lambda (%_2839) (> %_2839 '0)))
(define even?
  (lambda (%_2840) (= '0 (modulo %_2840 '2))))
(define odd?
  (lambda (%_2841) (not (even? %_2841))))
(define zero? (lambda (%_2842) (= %_2842 '0)))
(define add1 (lambda (%_2843) (+ %_2843 '1)))
(define sub1 (lambda (%_2844) (- %_2844 '1)))
(define >= (void))
(define <= (void))
((lambda (%_2846 %_2845)
   (begin
     (set! <=
       (%_2845
         (lambda (%_2847 %_2848)
           ((lambda (%_2849)
              (if %_2849 %_2849 (= %_2847 %_2848)))
            (< %_2847 %_2848)))
         %_2846
         '#t))
     (set! >=
       (%_2845
         (lambda (%_2850 %_2851)
           ((lambda (%_2852)
              (if %_2852 %_2852 (= %_2850 %_2851)))
            (> %_2850 %_2851)))
         %_2846
         '#t))))
 (lambda (%_2859 %_2860) (if %_2859 %_2860 '#f))
 (lambda (%_2853 %_2854 %_2855)
   (lambda %_2856
     ((letrec ((%_2857
                 (lambda (%_2858)
                   (if (null? %_2858)
                     %_2855
                     (if (null? (cdr %_2858))
                       %_2855
                       (%_2854
                         (%_2853 (car %_2858) (cadr %_2858))
                         (%_2857 (cdr %_2858))))))))
        %_2857)
      %_2856))))
((lambda (%_2861)
   (begin
     (set! >= (%_2861 > >=))
     (set! <= (%_2861 < <=))))
 (lambda (%_2862 %_2863)
   (lambda %_2864
     ((lambda (%_2865)
        (if %_2865
          %_2865
          ((lambda (%_2866)
             (if %_2866
               %_2866
               (if ((lambda (%_2867)
                      (if %_2867
                        %_2867
                        (%_2862 (car %_2864) (cadr %_2864))))
                    (= (car %_2864) (cadr %_2864)))
                 (apply %_2863 (cdr %_2864))
                 '#f)))
           (null? (cdr %_2864)))))
      (null? %_2864)))))
(define gcd
  (lambda %_2868
    (if (null? %_2868)
      '0
      (if (null? (cdr %_2868))
        (car %_2868)
        (_gcd (car %_2868) (cadr %_2868))))))
(define lcm
  (lambda %_2869
    (if (null? %_2869)
      '1
      (if (null? (cdr %_2869))
        (car %_2869)
        (_lcm (car %_2869) (cadr %_2869))))))
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
(define modulo
  (lambda (%_2870 %_2871)
    ((lambda (%_2872)
       (if (if (negative? %_2871)
             (positive? %_2872)
             (negative? %_2872))
         (+ %_2872 %_2871)
         %_2872))
     (remainder %_2870 %_2871))))
(max-precision '32)
(define string-append
  (lambda %_2873
    (if (null? %_2873)
      '""
      (if (null? (cdr %_2873))
        (car %_2873)
        (apply string-append
               (_string-append (car %_2873) (cadr %_2873))
               (cddr %_2873))))))
(define char-downcase
  ((lambda (%_2874)
     ((lambda (%_2875)
        ((lambda (%_2876)
           (lambda (%_2877)
             ((lambda (%_2878)
                (if (if (>= %_2878 %_2874) (<= %_2878 %_2875) '#f)
                  (integer->char (+ %_2878 %_2876))
                  %_2877))
              (char->integer %_2877))))
         (- (char->integer '#\a) %_2874)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_2879)
     ((lambda (%_2880)
        ((lambda (%_2881)
           (lambda (%_2882)
             ((lambda (%_2883)
                (if (if (>= %_2883 %_2879) (<= %_2883 %_2880) '#f)
                  (integer->char (- %_2883 %_2881))
                  %_2882))
              (char->integer %_2882))))
         (- %_2879 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_2884 %_2885)
    (> (char->integer %_2884) (char->integer %_2885))))
(define char<?
  (lambda (%_2886 %_2887)
    (< (char->integer %_2886) (char->integer %_2887))))
(define char=? eq?)
(define char>=?
  (lambda (%_2888 %_2889)
    ((lambda (%_2890)
       (if %_2890 %_2890 (char=? %_2888 %_2889)))
     (char>? %_2888 %_2889))))
(define char<=?
  (lambda (%_2891 %_2892)
    ((lambda (%_2893)
       (if %_2893 %_2893 (char=? %_2891 %_2892)))
     (char<? %_2891 %_2892))))
(define char-ci>?
  (lambda (%_2894 %_2895)
    (char>?
      (char-downcase %_2894)
      (char-downcase %_2895))))
(define char-ci<?
  (lambda (%_2896 %_2897)
    (char<?
      (char-downcase %_2896)
      (char-downcase %_2897))))
(define char-ci=?
  (lambda (%_2898 %_2899)
    (char=?
      (char-downcase %_2898)
      (char-downcase %_2899))))
(define char-ci>=?
  (lambda (%_2900 %_2901)
    ((lambda (%_2902)
       (if %_2902 %_2902 (char-ci=? %_2900 %_2901)))
     (char-ci>? %_2900 %_2901))))
(define char-ci<=?
  (lambda (%_2903 %_2904)
    ((lambda (%_2905)
       (if %_2905 %_2905 (char-ci=? %_2903 %_2904)))
     (char-ci<? %_2903 %_2904))))
(define char-alphabetic?
  (lambda (%_2906)
    (if (char-ci>=? %_2906 '#\a)
      (char-ci<=? %_2906 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_2907)
    (if (char-ci>=? %_2907 '#\0)
      (char-ci<=? %_2907 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_2908)
    (if (memq %_2908 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_2909)
    (if (char-alphabetic? %_2909)
      (char<? %_2909 '#\a)
      '#f)))
(define char-lower-case?
  (lambda (%_2910)
    (if (char-alphabetic? %_2910)
      (char>? %_2910 '#\Z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
(letrec ((%_2911
           (lambda (%_2916 %_2917 %_2918 %_2919 %_2920)
             (if (< %_2919 %_2920)
               (begin
                 (string-set!
                   %_2917
                   %_2919
                   (%_2918 (string-ref %_2916 %_2919)))
                 (%_2911
                   %_2916
                   %_2917
                   %_2918
                   (+ %_2919 '1)
                   %_2920))
               %_2917))))
  (begin
    (set! string-downcase
      (lambda (%_2912)
        ((lambda (%_2913)
           (%_2911
             %_2912
             %_2913
             char-downcase
             '0
             (string-length %_2912)))
         (make-string (string-length %_2912)))))
    (set! string-upcase
      (lambda (%_2914)
        ((lambda (%_2915)
           (%_2911
             %_2914
             %_2915
             char-upcase
             '0
             (string-length %_2914)))
         (make-string (string-length %_2914)))))))
(define string=? equal?)
(define string<?
  (letrec ((%_2921
             (lambda (%_2924 %_2925)
               (if (null? %_2924)
                 (not (null? %_2925))
                 (if (null? %_2925)
                   '#f
                   ((lambda (%_2927 %_2926)
                      (if (char<? %_2926 %_2927)
                        '#t
                        (if (char>? %_2926 %_2927)
                          '#f
                          (%_2921 (cdr %_2924) (cdr %_2925)))))
                    (car %_2925)
                    (car %_2924)))))))
    (lambda (%_2922 %_2923)
      (%_2921
        (string->list %_2922)
        (string->list %_2923)))))
(define string>?
  (letrec ((%_2928
             (lambda (%_2931 %_2932)
               (if (null? %_2932)
                 (not (null? %_2931))
                 (if (null? %_2931)
                   '#f
                   ((lambda (%_2934 %_2933)
                      (if (char>? %_2933 %_2934)
                        '#t
                        (if (char<? %_2933 %_2934)
                          '#f
                          (%_2928 (cdr %_2931) (cdr %_2932)))))
                    (car %_2932)
                    (car %_2931)))))))
    (lambda (%_2929 %_2930)
      (%_2928
        (string->list %_2929)
        (string->list %_2930)))))
(define string<=?
  (lambda (%_2935 %_2936)
    ((lambda (%_2937)
       (if %_2937 %_2937 (string=? %_2935 %_2936)))
     (string<? %_2935 %_2936))))
(define string>=?
  (lambda (%_2938 %_2939)
    ((lambda (%_2940)
       (if %_2940 %_2940 (string=? %_2938 %_2939)))
     (string>? %_2938 %_2939))))
(define string-ci=?
  (lambda (%_2941 %_2942)
    (string=?
      (string-downcase %_2941)
      (string-downcase %_2942))))
(define string-ci<?
  (lambda (%_2943 %_2944)
    (string<?
      (string-downcase %_2943)
      (string-downcase %_2944))))
(define string-ci>?
  (lambda (%_2945 %_2946)
    (string>?
      (string-downcase %_2945)
      (string-downcase %_2946))))
(define string-ci>=?
  (lambda (%_2947 %_2948)
    (string>=?
      (string-downcase %_2947)
      (string-downcase %_2948))))
(define string-ci<=?
  (lambda (%_2949 %_2950)
    (string<=?
      (string-downcase %_2949)
      (string-downcase %_2950))))
(define substring
  (letrec ((%_2951
             (lambda (%_2956 %_2957 %_2958 %_2959 %_2960)
               (if (< %_2959 %_2960)
                 (begin
                   (string-set!
                     %_2957
                     %_2958
                     (string-ref %_2956 %_2959))
                   (%_2951
                     %_2956
                     %_2957
                     (+ %_2958 '1)
                     (+ %_2959 '1)
                     %_2960))
                 (void)))))
    (lambda (%_2952 %_2953 %_2954)
      ((lambda (%_2955)
         (begin
           (%_2951 %_2952 %_2955 '0 %_2953 %_2954)
           %_2955))
       (make-string (- %_2954 %_2953))))))
(define list-ref
  (lambda (%_2968 %_2969)
    (if (zero? %_2969)
      (car %_2968)
      (list-ref (cdr %_2968) (- %_2969 '1)))))
(define values
  (lambda %_2970
    (call-with-current-continuation
      (lambda (%_2971) (apply %_2971 %_2970)))))
