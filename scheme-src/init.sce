(define for-each
  (lambda (%_2623 . %_2622)
    (if (null? %_2622)
      (error 'for-each
             '"invalid number of arguments to procedure for-each.")
      (if (not (null? (car %_2622)))
        (begin
          (apply %_2623 (map car %_2622))
          (apply for-each (cons %_2623 (map cdr %_2622))))
        (void)))))
(define eof-object?
  (lambda (%_2624) (eq? %_2624 '#!eof)))
(define not
  (lambda (%_2625) (if %_2625 '#f '#t)))
(define eqv? eq?)
(define newline
  (lambda %_2626
    (apply display (cons '#\newline %_2626))))
(define map (void))
(letrec ((%_2627
           (letrec ((%_2628
                      (lambda (%_2632 %_2633 %_2634 %_2635)
                        (if (null? %_2635)
                          %_2633
                          (begin
                            (set-cdr!
                              %_2634
                              (cons (%_2632 (car %_2635)) '()))
                            (%_2628
                              %_2632
                              %_2633
                              (cdr %_2634)
                              (cdr %_2635)))))))
             (lambda (%_2629 %_2630)
               (if (null? %_2630)
                 '()
                 ((lambda (%_2631)
                    (%_2628 %_2629 %_2631 %_2631 (cdr %_2630)))
                  (cons (%_2629 (car %_2630)) '())))))))
  (set! map %_2627))
(define compose
  (lambda %_2636
    (if (null? %_2636)
      (lambda (%_2640) %_2640)
      ((lambda (%_2638 %_2637)
         (lambda (%_2639) (%_2637 (%_2638 %_2639))))
       (apply compose (cdr %_2636))
       (car %_2636)))))
(define compose2
  (lambda (%_2641 %_2642)
    (lambda (%_2643) (%_2641 (%_2642 %_2643)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
(letrec ((%_2645
           (lambda (%_2661 %_2662 %_2663)
             (if (null? %_2663)
               '#f
               (if (%_2661 (car %_2663) %_2662)
                 %_2663
                 (%_2645 %_2661 %_2662 (cdr %_2663))))))
         (%_2644
           (lambda (%_2658 %_2659 %_2660)
             (if (null? %_2660)
               '#f
               (if (%_2658 (caar %_2660) %_2659)
                 (car %_2660)
                 (%_2644 %_2658 %_2659 (cdr %_2660)))))))
  (begin
    (set! assq
      (lambda (%_2646 %_2647)
        (%_2644 eq? %_2646 %_2647)))
    (set! assv
      (lambda (%_2648 %_2649)
        (%_2644 eqv? %_2648 %_2649)))
    (set! assoc
      (lambda (%_2650 %_2651)
        (%_2644 equal? %_2650 %_2651)))
    (set! memq
      (lambda (%_2652 %_2653)
        (%_2645 eq? %_2652 %_2653)))
    (set! memv
      (lambda (%_2654 %_2655)
        (%_2645 eqv? %_2654 %_2655)))
    (set! member
      (lambda (%_2656 %_2657)
        (%_2645 equal? %_2656 %_2657)))))
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
  (lambda (%_2664 %_2665)
    (if (null? %_2664)
      %_2665
      (cons (car %_2664) (append2 (cdr %_2664) %_2665)))))
(define append append2)
(define list->string
  (lambda (%_2666)
    (letrec ((%_2667
               (lambda (%_2668 %_2669 %_2670)
                 (if (null? %_2668)
                   %_2669
                   (begin
                     (string-set! %_2669 %_2670 (car %_2668))
                     (%_2667 (cdr %_2668) %_2669 (+ %_2670 '1)))))))
      (%_2667 %_2666 (make-string (length %_2666)) '0))))
(define string->list
  (letrec ((%_2671
             (lambda (%_2673 %_2674 %_2675)
               (if (< %_2675 '0)
                 %_2674
                 (%_2671
                   %_2673
                   (cons (string-ref %_2673 %_2675) %_2674)
                   (- %_2675 '1))))))
    (lambda (%_2672)
      (%_2671 %_2672 '() (- (string-length %_2672) '1)))))
(define list->vector
  (letrec ((%_2676
             (lambda (%_2678 %_2679 %_2680)
               (if (null? %_2678)
                 %_2679
                 (begin
                   (vector-set! %_2679 %_2680 (car %_2678))
                   (%_2676 (cdr %_2678) %_2679 (+ %_2680 '1)))))))
    (lambda (%_2677)
      (if (proper-list? %_2677)
        (%_2676 %_2677 (make-vector (length %_2677)) '0)
        (error 'list->vector
               '"can only convert a proper list."
               %_2677)))))
(define vector
  (lambda %_2681 (list->vector %_2681)))
(define string
  (lambda %_2682 (list->string %_2682)))
(define detect-os
  (lambda ()
    ((lambda (%_2683)
       (if (> (string-length %_2683) '3)
         (if (equal? (substring %_2683 '0 '3) '"mac")
           'macos
           (if (equal? (substring %_2683 '0 '3) '"win")
             'ms-dos
             (if (equal? (substring %_2683 '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring %_2683 '0 '3) '"uni")
                 'unix
                 (if (equal? (substring %_2683 '0 '3) '"lin")
                   'unix
                   (if (equal? (substring %_2683 '0 '4) '"os/")
                     'os2
                     (if (equal? (substring %_2683 '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase
       (getprop 'os.name '*environment-variables*)))))
(define current-url (make-parameter '"file:."))
(define current-directory
  (lambda %_2684
    (if (null? %_2684)
      (normalize-url (current-url) '".")
      (current-url
        (normalize-url
          (current-url)
          ((lambda (%_2685)
             ((lambda (%_2686)
                (if (eq? (string-ref %_2685 (- %_2686 '1)) '#\/)
                  %_2685
                  (string-append %_2685 '"/")))
              (string-length %_2685)))
           (car %_2684)))))))
(define load-expanded load)
((lambda (%_2687)
   ((lambda (%_2690 %_2689 %_2688)
      (begin
        (set! open-input-file (%_2688 open-input-file))
        (set! open-source-input-file
          (%_2688 open-source-input-file))
        (set! open-output-file (%_2688 open-output-file))
        (set! load
          (lambda (%_2691)
            (begin
              ((lambda (%_2692)
                 (begin
                   (current-url (normalize-url %_2692 %_2691))
                   (with-failure-continuation
                     (lambda (%_2693 %_2694)
                       (begin
                         (current-url %_2692)
                         (call-with-failure-continuation
                           (lambda (%_2695) (%_2695 %_2693 %_2694)))))
                     (lambda ()
                       ((lambda (%_2696)
                          ((%_2689 (if %_2696 %_2696 '"scm"))
                           (current-url)))
                        (%_2690 (current-url)))))
                   (current-url %_2692)))
               (current-url))
              (void))))))
    (lambda (%_2702)
      ((letrec ((%_2703
                  (lambda (%_2704 %_2705)
                    (if (null? %_2704)
                      '#f
                      (if (equal? (car %_2704) '#\.)
                        (list->string %_2705)
                        (%_2703 (cdr %_2704) (cons (car %_2704) %_2705)))))))
         %_2703)
       (reverse (string->list %_2702))
       '()))
    (lambda (%_2700)
      ((lambda (%_2701)
         (if (memv %_2701 '(sce pp)) load-expanded %_2687))
       (string->symbol (string-downcase %_2700))))
    (lambda (%_2697)
      (lambda (%_2699 . %_2698)
        (apply %_2697
               (normalize-url (current-url) %_2699)
               %_2698)))))
 load)
(define load-module
  (lambda (%_2706)
    ((lambda (%_2707)
       ((lambda (%_2708)
          (for-each
            (lambda (%_2709)
              (putprop
                %_2709
                '*toplevel*
                (native-library-binding %_2707 %_2709)))
            %_2708))
        (native-library-binding-names %_2707)))
     (load-native-library %_2706))))
(define reverse
  (letrec ((%_2710
             (lambda (%_2712 %_2713)
               (if (null? %_2712)
                 %_2713
                 (%_2710 (cdr %_2712) (cons (car %_2712) %_2713))))))
    (lambda (%_2711) (%_2710 %_2711 '()))))
(define append
  (letrec ((%_2714
             (lambda (%_2717 . %_2716)
               (if (null? %_2716)
                 %_2717
                 (if (null? %_2717)
                   (apply %_2714 %_2716)
                   (apply %_2714
                          (cons (append2 %_2717 (car %_2716))
                                (cdr %_2716))))))))
    (lambda %_2715
      (if (null? %_2715)
        '()
        (if (null? (cdr %_2715))
          (car %_2715)
          (apply %_2714 (cons (car %_2715) (cdr %_2715))))))))
(define map
  (letrec ((%_2719
             (lambda (%_2723 %_2724 %_2725 %_2726)
               (if (null? (car %_2724))
                 (if (andmap null? %_2724)
                   %_2725
                   (error 'map '"lists are not of equal length."))
                 ((lambda (%_2728 %_2727)
                    (begin
                      (if (not (null? %_2726))
                        (set-cdr! %_2726 %_2727)
                        (void))
                      (if (null? %_2725)
                        (%_2719 %_2723 %_2728 %_2727 %_2727)
                        (%_2719 %_2723 %_2728 %_2725 %_2727))))
                  (%_2718 cdr %_2724)
                  (cons (apply %_2723 (%_2718 car %_2724)) '())))))
           (%_2718 map))
    (lambda (%_2722 %_2721 . %_2720)
      (if (null? %_2720)
        (%_2718 %_2722 %_2721)
        (%_2719 %_2722 (cons %_2721 %_2720) '() '())))))
(define proper-list?
  (lambda (%_2729)
    ((letrec ((%_2730
                (lambda (%_2731 %_2732)
                  (if (pair? %_2731)
                    ((lambda (%_2733)
                       (if (pair? %_2733)
                         ((lambda (%_2735 %_2734)
                            (if (not (eq? %_2734 %_2735))
                              (%_2730 %_2734 %_2735)
                              '#f))
                          (cdr %_2732)
                          (cdr %_2733))
                         (null? %_2733)))
                     (cdr %_2731))
                    (null? %_2731)))))
       %_2730)
     %_2729
     %_2729)))
(define circular?
  (lambda (%_2736)
    (letrec ((%_2741
               (lambda (%_2759 %_2760)
                 (letrec ((%_2761
                            (lambda (%_2770 %_2771)
                              ((lambda (%_2772)
                                 (if %_2772
                                   (%_2741 (%_2740 %_2770) (%_2740 %_2772))
                                   '#f))
                               (%_2740 %_2771)))))
                   (if %_2760
                     (if (not (eq? (car %_2760) (car %_2759)))
                       (%_2761 %_2759 %_2760)
                       ((letrec ((%_2762
                                   (lambda (%_2763 %_2764)
                                     ((lambda (%_2765)
                                        (if %_2765
                                          %_2765
                                          (if (if (= (cadr %_2763)
                                                     (cadr %_2764))
                                                (eq? (caddr %_2763)
                                                     (caddr %_2764))
                                                '#f)
                                            (%_2762
                                              (cddr %_2763)
                                              (cddr %_2764))
                                            ((lambda (%_2766)
                                               ((letrec ((%_2767
                                                           (lambda (%_2768)
                                                             (if %_2768
                                                               ((lambda (%_2769)
                                                                  (if %_2769
                                                                    %_2769
                                                                    (%_2767
                                                                      (%_2740
                                                                        %_2768))))
                                                                (eq? (car %_2768)
                                                                     %_2766))
                                                               (%_2761
                                                                 %_2763
                                                                 %_2764)))))
                                                  %_2767)
                                                (%_2740 (list %_2766))))
                                             (car %_2763)))))
                                      (null? (cdr %_2763))))))
                          %_2762)
                        %_2759
                        %_2760))
                     '#f))))
             (%_2740
               (lambda (%_2749)
                 ((lambda (%_2750)
                    ((letrec ((%_2751
                                (lambda (%_2752 %_2753 %_2754)
                                  (if (>= %_2753 '0)
                                    ((lambda (%_2758)
                                       (if (%_2737 %_2758)
                                         (cons %_2758 (cons %_2753 %_2754))
                                         (%_2751 %_2752 (- %_2753 '1) %_2754)))
                                     (%_2739 %_2752 %_2753))
                                    ((lambda (%_2755)
                                       (if (pair? %_2755)
                                         ((lambda (%_2757 %_2756)
                                            (%_2751
                                              (car %_2757)
                                              (- %_2756 '1)
                                              %_2757))
                                          (cdr %_2755)
                                          (car %_2755))
                                         '#f))
                                     (cdr %_2754))))))
                       %_2751)
                     %_2750
                     (- (%_2738 %_2750) '1)
                     %_2749))
                  (car %_2749))))
             (%_2739
               (lambda (%_2747 %_2748)
                 (if (vector? %_2747)
                   (vector-ref %_2747 %_2748)
                   (if (box? %_2747)
                     (unbox %_2747)
                     ((if (zero? %_2748) car cdr) %_2747)))))
             (%_2738
               (lambda (%_2746)
                 (if (pair? %_2746)
                   '2
                   (if (box? %_2746) '1 (vector-length %_2746)))))
             (%_2737
               (lambda (%_2743)
                 ((lambda (%_2744)
                    (if %_2744
                      %_2744
                      ((lambda (%_2745)
                         (if %_2745
                           %_2745
                           (if (vector? %_2743)
                             (not (zero? (vector-length %_2743)))
                             '#f)))
                       (box? %_2743))))
                  (pair? %_2743)))))
      (if (%_2737 %_2736)
        ((lambda (%_2742) (%_2741 %_2742 (%_2740 %_2742)))
         (list %_2736))
        '#f))))
(define list? proper-list?)
(define expt
  (letrec ((%_2774
             (lambda (%_2779 %_2780)
               (if (negative? %_2780)
                 (/ (%_2774 %_2779 (abs %_2780)))
                 (if (if (exact? %_2779) (= %_2779 '2) '#f)
                   (ashl '1 %_2780)
                   ((letrec ((%_2781
                               (lambda (%_2782 %_2783 %_2784)
                                 (if (zero? %_2782)
                                   %_2783
                                   (%_2781
                                     (quotient %_2782 '2)
                                     (if (odd? %_2782)
                                       (* %_2783 %_2784)
                                       %_2783)
                                     (* %_2784 %_2784))))))
                      %_2781)
                    %_2780
                    '1
                    %_2779)))))
           (%_2773
             (lambda (%_2777 %_2778)
               (exp (* %_2778 (log %_2777))))))
    (lambda (%_2775 %_2776)
      (if (zero? %_2776)
        (if (exact? %_2776) '1 '1.0)
        (if (zero? %_2775)
          (if (exact? %_2776) %_2775 '0.0)
          (if (if (exact? %_2776) (integer? %_2776) '#f)
            (%_2774 %_2775 %_2776)
            (%_2773 %_2775 %_2776)))))))
(define modpow
  (lambda (%_2785 %_2786 %_2787)
    (if (= %_2786 '1)
      (modulo %_2785 %_2787)
      (if (even? %_2786)
        ((lambda (%_2790)
           (modulo (* %_2790 %_2790) %_2787))
         (modpow %_2785 (/ %_2786 '2) %_2787))
        ((lambda (%_2789)
           (begin
             (set! %_2789 (modulo (* %_2789 %_2789) %_2787))
             (modulo (* %_2785 %_2789) %_2787)))
         (modpow %_2785 (/ (- %_2786 '1) '2) %_2787))))))
(define integer?
  ((lambda (%_2791)
     (lambda (%_2792)
       ((lambda (%_2793)
          (if %_2793
            %_2793
            (if (real? %_2792) (= (round %_2792) %_2792) '#f)))
        (%_2791 %_2792))))
   integer?))
(define real?
  ((lambda (%_2794)
     (lambda (%_2795)
       (if (number? %_2795) (not (%_2794 %_2795)) '#f)))
   complex?))
(define rational? real?)
(define complex? number?)
(define abs
  (lambda (%_2796)
    (if (not (real? %_2796))
      ((lambda (%_2798 %_2797)
         (sqrt (+ (* %_2797 %_2797) (* %_2798 %_2798))))
       (imag-part %_2796)
       (real-part %_2796))
      (if (< %_2796 '0) (- %_2796) %_2796))))
(define min (void))
(define max (void))
(letrec ((%_2799
           (lambda (%_2804 %_2805 %_2806 %_2807)
             (if (null? %_2806)
               (if (if %_2807 (exact? %_2805) '#f)
                 (exact->inexact %_2805)
                 %_2805)
               (if (%_2804 (car %_2806) %_2805)
                 (%_2799
                   %_2804
                   (car %_2806)
                   (cdr %_2806)
                   (if %_2807 %_2807 (inexact? (car %_2806))))
                 (%_2799 %_2804 %_2805 (cdr %_2806) %_2807))))))
  (begin
    (set! min
      (lambda (%_2801 . %_2800)
        (if (null? %_2800)
          %_2801
          (%_2799 < %_2801 %_2800 (inexact? %_2801)))))
    (set! max
      (lambda (%_2803 . %_2802)
        (if (null? %_2802)
          %_2803
          (%_2799 > %_2803 %_2802 (inexact? %_2803)))))))
(define negative?
  (lambda (%_2809) (< %_2809 '0)))
(define positive?
  (lambda (%_2810) (> %_2810 '0)))
(define even?
  (lambda (%_2811) (= '0 (modulo %_2811 '2))))
(define odd?
  (lambda (%_2812) (not (even? %_2812))))
(define zero? (lambda (%_2813) (= %_2813 '0)))
(define add1 (lambda (%_2814) (+ %_2814 '1)))
(define sub1 (lambda (%_2815) (- %_2815 '1)))
(define >= (void))
(define <= (void))
((lambda (%_2817 %_2816)
   (begin
     (set! <=
       (%_2816
         (lambda (%_2818 %_2819)
           ((lambda (%_2820)
              (if %_2820 %_2820 (= %_2818 %_2819)))
            (< %_2818 %_2819)))
         %_2817
         '#t))
     (set! >=
       (%_2816
         (lambda (%_2821 %_2822)
           ((lambda (%_2823)
              (if %_2823 %_2823 (= %_2821 %_2822)))
            (> %_2821 %_2822)))
         %_2817
         '#t))))
 (lambda (%_2830 %_2831) (if %_2830 %_2831 '#f))
 (lambda (%_2824 %_2825 %_2826)
   (lambda %_2827
     ((letrec ((%_2828
                 (lambda (%_2829)
                   (if (null? %_2829)
                     %_2826
                     (if (null? (cdr %_2829))
                       %_2826
                       (%_2825
                         (%_2824 (car %_2829) (cadr %_2829))
                         (%_2828 (cdr %_2829))))))))
        %_2828)
      %_2827))))
((lambda (%_2832)
   (begin
     (set! >= (%_2832 > >=))
     (set! <= (%_2832 < <=))))
 (lambda (%_2833 %_2834)
   (lambda %_2835
     ((lambda (%_2836)
        (if %_2836
          %_2836
          ((lambda (%_2837)
             (if %_2837
               %_2837
               (if ((lambda (%_2838)
                      (if %_2838
                        %_2838
                        (%_2833 (car %_2835) (cadr %_2835))))
                    (= (car %_2835) (cadr %_2835)))
                 (apply %_2834 (cdr %_2835))
                 '#f)))
           (null? (cdr %_2835)))))
      (null? %_2835)))))
(define gcd
  (lambda %_2839
    (if (null? %_2839)
      '0
      (if (null? (cdr %_2839))
        (car %_2839)
        (_gcd (car %_2839) (cadr %_2839))))))
(define lcm
  (lambda %_2840
    (if (null? %_2840)
      '1
      (if (null? (cdr %_2840))
        (car %_2840)
        (_lcm (car %_2840) (cadr %_2840))))))
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
  (lambda (%_2648 %_2649)
    ((lambda (%_2650)
       (if (if (negative? %_2649)
               (positive? %_2650)
               (negative? %_2650))
           (+ %_2650 %_2649)
           %_2650))
     (remainder %_2648 %_2649))))
(max-precision '32)
(define string-append
  (lambda %_2841
    (if (null? %_2841)
      '""
      (if (null? (cdr %_2841))
        (car %_2841)
        (apply string-append
               (_string-append (car %_2841) (cadr %_2841))
               (cddr %_2841))))))
(define char-downcase
  ((lambda (%_2842)
     ((lambda (%_2843)
        ((lambda (%_2844)
           (lambda (%_2845)
             ((lambda (%_2846)
                (if (if (>= %_2846 %_2842) (<= %_2846 %_2843) '#f)
                  (integer->char (+ %_2846 %_2844))
                  %_2845))
              (char->integer %_2845))))
         (- (char->integer '#\a) %_2842)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_2847)
     ((lambda (%_2848)
        ((lambda (%_2849)
           (lambda (%_2850)
             ((lambda (%_2851)
                (if (if (>= %_2851 %_2847) (<= %_2851 %_2848) '#f)
                  (integer->char (- %_2851 %_2849))
                  %_2850))
              (char->integer %_2850))))
         (- %_2847 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_2852 %_2853)
    (> (char->integer %_2852) (char->integer %_2853))))
(define char<?
  (lambda (%_2854 %_2855)
    (< (char->integer %_2854) (char->integer %_2855))))
(define char=? eq?)
(define char>=?
  (lambda (%_2856 %_2857)
    ((lambda (%_2858)
       (if %_2858 %_2858 (char=? %_2856 %_2857)))
     (char>? %_2856 %_2857))))
(define char<=?
  (lambda (%_2859 %_2860)
    ((lambda (%_2861)
       (if %_2861 %_2861 (char=? %_2859 %_2860)))
     (char<? %_2859 %_2860))))
(define char-ci>?
  (lambda (%_2862 %_2863)
    (char>?
      (char-downcase %_2862)
      (char-downcase %_2863))))
(define char-ci<?
  (lambda (%_2864 %_2865)
    (char<?
      (char-downcase %_2864)
      (char-downcase %_2865))))
(define char-ci=?
  (lambda (%_2866 %_2867)
    (char=?
      (char-downcase %_2866)
      (char-downcase %_2867))))
(define char-ci>=?
  (lambda (%_2868 %_2869)
    ((lambda (%_2870)
       (if %_2870 %_2870 (char-ci=? %_2868 %_2869)))
     (char-ci>? %_2868 %_2869))))
(define char-ci<=?
  (lambda (%_2871 %_2872)
    ((lambda (%_2873)
       (if %_2873 %_2873 (char-ci=? %_2871 %_2872)))
     (char-ci<? %_2871 %_2872))))
(define char-alphabetic?
  (lambda (%_2874)
    (if (char-ci>=? %_2874 '#\a)
      (char-ci<=? %_2874 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_2875)
    (if (char-ci>=? %_2875 '#\0)
      (char-ci<=? %_2875 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_2876)
    (if (memq %_2876 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_2877)
    (if (char-alphabetic? %_2877)
      (char<? %_2877 '#\a)
      '#f)))
(define char-lower-case?
  (lambda (%_2878)
    (if (char-alphabetic? %_2878)
      (char>? %_2878 '#\Z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
(letrec ((%_2879
           (lambda (%_2884 %_2885 %_2886 %_2887 %_2888)
             (if (< %_2887 %_2888)
               (begin
                 (string-set!
                   %_2885
                   %_2887
                   (%_2886 (string-ref %_2884 %_2887)))
                 (%_2879
                   %_2884
                   %_2885
                   %_2886
                   (+ %_2887 '1)
                   %_2888))
               %_2885))))
  (begin
    (set! string-downcase
      (lambda (%_2880)
        ((lambda (%_2881)
           (%_2879
             %_2880
             %_2881
             char-downcase
             '0
             (string-length %_2880)))
         (make-string (string-length %_2880)))))
    (set! string-upcase
      (lambda (%_2882)
        ((lambda (%_2883)
           (%_2879
             %_2882
             %_2883
             char-upcase
             '0
             (string-length %_2882)))
         (make-string (string-length %_2882)))))))
(define string=? equal?)
(define string<?
  (letrec ((%_2889
             (lambda (%_2892 %_2893)
               (if (null? %_2892)
                 (not (null? %_2893))
                 (if (null? %_2893)
                   '#f
                   ((lambda (%_2895 %_2894)
                      (if (char<? %_2894 %_2895)
                        '#t
                        (if (char>? %_2894 %_2895)
                          '#f
                          (%_2889 (cdr %_2892) (cdr %_2893)))))
                    (car %_2893)
                    (car %_2892)))))))
    (lambda (%_2890 %_2891)
      (%_2889
        (string->list %_2890)
        (string->list %_2891)))))
(define string>?
  (letrec ((%_2896
             (lambda (%_2899 %_2900)
               (if (null? %_2900)
                 (not (null? %_2899))
                 (if (null? %_2899)
                   '#f
                   ((lambda (%_2902 %_2901)
                      (if (char>? %_2901 %_2902)
                        '#t
                        (if (char<? %_2901 %_2902)
                          '#f
                          (%_2896 (cdr %_2899) (cdr %_2900)))))
                    (car %_2900)
                    (car %_2899)))))))
    (lambda (%_2897 %_2898)
      (%_2896
        (string->list %_2897)
        (string->list %_2898)))))
(define string<=?
  (lambda (%_2903 %_2904)
    ((lambda (%_2905)
       (if %_2905 %_2905 (string=? %_2903 %_2904)))
     (string<? %_2903 %_2904))))
(define string>=?
  (lambda (%_2906 %_2907)
    ((lambda (%_2908)
       (if %_2908 %_2908 (string=? %_2906 %_2907)))
     (string>? %_2906 %_2907))))
(define string-ci=?
  (lambda (%_2909 %_2910)
    (string=?
      (string-downcase %_2909)
      (string-downcase %_2910))))
(define string-ci<?
  (lambda (%_2911 %_2912)
    (string<?
      (string-downcase %_2911)
      (string-downcase %_2912))))
(define string-ci>?
  (lambda (%_2913 %_2914)
    (string>?
      (string-downcase %_2913)
      (string-downcase %_2914))))
(define string-ci>=?
  (lambda (%_2915 %_2916)
    (string>=?
      (string-downcase %_2915)
      (string-downcase %_2916))))
(define string-ci<=?
  (lambda (%_2917 %_2918)
    (string<=?
      (string-downcase %_2917)
      (string-downcase %_2918))))
(define substring
  (letrec ((%_2919
             (lambda (%_2924 %_2925 %_2926 %_2927 %_2928)
               (if (< %_2927 %_2928)
                 (begin
                   (string-set!
                     %_2925
                     %_2926
                     (string-ref %_2924 %_2927))
                   (%_2919
                     %_2924
                     %_2925
                     (+ %_2926 '1)
                     (+ %_2927 '1)
                     %_2928))
                 (void)))))
    (lambda (%_2920 %_2921 %_2922)
      ((lambda (%_2923)
         (begin
           (%_2919 %_2920 %_2923 '0 %_2921 %_2922)
           %_2923))
       (make-string (- %_2922 %_2921))))))
(define format
  (lambda (%_2930 . %_2929)
    ((lambda (%_2931)
       ((letrec ((%_2932
                   (lambda (%_2933 %_2934)
                     (if (null? %_2933)
                       (get-output-string %_2931)
                       (if (char=? (car %_2933) '#\~)
                         (if (null? (cdr %_2933))
                           (error 'format '"Incomplete escape sequence")
                           ((lambda (%_2935)
                              (if (memv %_2935 '(#\a))
                                (if (null? %_2934)
                                  (error 'format
                                         '"No value for escape sequence")
                                  (begin
                                    (display (car %_2934) %_2931)
                                    (%_2932 (cddr %_2933) (cdr %_2934))))
                                (if (memv %_2935 '(#\s))
                                  (if (null? %_2934)
                                    (error 'format
                                           '"No value for escape sequence")
                                    (begin
                                      (write (car %_2934) %_2931)
                                      (%_2932 (cddr %_2933) (cdr %_2934))))
                                  (if (memv %_2935 '(#\%))
                                    (begin
                                      (display '#\newline %_2931)
                                      (%_2932 (cddr %_2933) %_2934))
                                    (if (memv %_2935 '(#\~))
                                      (begin
                                        (display '#\~ %_2931)
                                        (%_2932 (cddr %_2933) %_2934))
                                      (error 'format
                                             '"Unrecognized escape sequence"))))))
                            (cadr %_2933)))
                         (begin
                           (display (car %_2933) %_2931)
                           (%_2932 (cdr %_2933) %_2934)))))))
          %_2932)
        (string->list %_2930)
        %_2929))
     (open-output-string))))
(define list-ref
  (lambda (%_2936 %_2937)
    (if (zero? %_2937)
      (car %_2936)
      (list-ref (cdr %_2936) (- %_2937 '1)))))
(define values
  (lambda %_2938
    (call-with-current-continuation
      (lambda (%_2939) (apply %_2939 %_2938)))))
