(define for-each
  (lambda (%_2633 . %_2632)
    (if (null? %_2632)
      (error 'for-each
             '"invalid number of arguments to procedure for-each.")
      (if (not (null? (car %_2632)))
        (begin
          (apply %_2633 (map car %_2632))
          (apply for-each (cons %_2633 (map cdr %_2632))))
        (void)))))
(define eof-object?
  (lambda (%_2634) (eq? %_2634 '#!eof)))
(define not
  (lambda (%_2635) (if %_2635 '#f '#t)))
(define eqv? eq?)
(define newline
  (lambda %_2636
    (apply display (cons '#\newline %_2636))))
(define map (void))
(letrec ((%_2637
           (letrec ((%_2638
                      (lambda (%_2642 %_2643 %_2644 %_2645)
                        (if (null? %_2645)
                          %_2643
                          (begin
                            (set-cdr!
                              %_2644
                              (cons (%_2642 (car %_2645)) '()))
                            (%_2638
                              %_2642
                              %_2643
                              (cdr %_2644)
                              (cdr %_2645)))))))
             (lambda (%_2639 %_2640)
               (if (null? %_2640)
                 '()
                 ((lambda (%_2641)
                    (%_2638 %_2639 %_2641 %_2641 (cdr %_2640)))
                  (cons (%_2639 (car %_2640)) '())))))))
  (set! map %_2637))
(define compose
  (lambda %_2646
    (if (null? %_2646)
      (lambda (%_2650) %_2650)
      ((lambda (%_2648 %_2647)
         (lambda (%_2649) (%_2647 (%_2648 %_2649))))
       (apply compose (cdr %_2646))
       (car %_2646)))))
(define compose2
  (lambda (%_2651 %_2652)
    (lambda (%_2653) (%_2651 (%_2652 %_2653)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
(letrec ((%_2655
           (lambda (%_2671 %_2672 %_2673)
             (if (null? %_2673)
               '#f
               (if (%_2671 (car %_2673) %_2672)
                 %_2673
                 (%_2655 %_2671 %_2672 (cdr %_2673))))))
         (%_2654
           (lambda (%_2668 %_2669 %_2670)
             (if (null? %_2670)
               '#f
               (if (%_2668 (caar %_2670) %_2669)
                 (car %_2670)
                 (%_2654 %_2668 %_2669 (cdr %_2670)))))))
  (begin
    (set! assq
      (lambda (%_2656 %_2657)
        (%_2654 eq? %_2656 %_2657)))
    (set! assv
      (lambda (%_2658 %_2659)
        (%_2654 eqv? %_2658 %_2659)))
    (set! assoc
      (lambda (%_2660 %_2661)
        (%_2654 equal? %_2660 %_2661)))
    (set! memq
      (lambda (%_2662 %_2663)
        (%_2655 eq? %_2662 %_2663)))
    (set! memv
      (lambda (%_2664 %_2665)
        (%_2655 eqv? %_2664 %_2665)))
    (set! member
      (lambda (%_2666 %_2667)
        (%_2655 equal? %_2666 %_2667)))))
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
  (lambda (%_2674 %_2675)
    (if (null? %_2674)
      %_2675
      (cons (car %_2674) (append2 (cdr %_2674) %_2675)))))
(define append append2)
(define list->string
  (lambda (%_2676)
    (letrec ((%_2677
               (lambda (%_2678 %_2679 %_2680)
                 (if (null? %_2678)
                   %_2679
                   (begin
                     (string-set! %_2679 %_2680 (car %_2678))
                     (%_2677 (cdr %_2678) %_2679 (+ %_2680 '1)))))))
      (%_2677 %_2676 (make-string (length %_2676)) '0))))
(define string->list
  (letrec ((%_2681
             (lambda (%_2683 %_2684 %_2685)
               (if (< %_2685 '0)
                 %_2684
                 (%_2681
                   %_2683
                   (cons (string-ref %_2683 %_2685) %_2684)
                   (- %_2685 '1))))))
    (lambda (%_2682)
      (%_2681 %_2682 '() (- (string-length %_2682) '1)))))
(define list->vector
  (letrec ((%_2686
             (lambda (%_2688 %_2689 %_2690)
               (if (null? %_2688)
                 %_2689
                 (begin
                   (vector-set! %_2689 %_2690 (car %_2688))
                   (%_2686 (cdr %_2688) %_2689 (+ %_2690 '1)))))))
    (lambda (%_2687)
      (if (proper-list? %_2687)
        (%_2686 %_2687 (make-vector (length %_2687)) '0)
        (error 'list->vector
               '"can only convert a proper list."
               %_2687)))))
(define vector
  (lambda %_2691 (list->vector %_2691)))
(define string
  (lambda %_2692 (list->string %_2692)))
(define throw
  (lambda (%_2694 . %_2693)
    (call-with-failure-continuation
      (lambda (%_2695)
        (if (null? %_2693)
          (call-with-current-continuation
            (lambda (%_2696) (%_2695 %_2694 %_2696)))
          (%_2695 %_2694 (car %_2693)))))))
(define detect-os
  (lambda ()
    ((lambda (%_2697)
       (if (> (string-length %_2697) '3)
         (if (equal? (substring %_2697 '0 '3) '"mac")
           'macos
           (if (equal? (substring %_2697 '0 '3) '"win")
             'ms-dos
             (if (equal? (substring %_2697 '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring %_2697 '0 '3) '"uni")
                 'unix
                 (if (equal? (substring %_2697 '0 '3) '"lin")
                   'unix
                   (if (equal? (substring %_2697 '0 '4) '"os/")
                     'os2
                     (if (equal? (substring %_2697 '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase
       (getprop 'os.name '*environment-variables*)))))
(define current-url (make-parameter '"file:."))
(define current-directory
  (lambda %_2698
    (if (null? %_2698)
      (normalize-url (current-url) '".")
      (current-url
        (normalize-url
          (current-url)
          ((lambda (%_2699)
             ((lambda (%_2700)
                (if (eq? (string-ref %_2699 (- %_2700 '1)) '#\/)
                  %_2699
                  (string-append %_2699 '"/")))
              (string-length %_2699)))
           (car %_2698)))))))
(define load-expanded load)
((lambda (%_2701)
   ((lambda (%_2704 %_2703 %_2702)
      (begin
        (set! open-input-file (%_2702 open-input-file))
        (set! open-source-input-file
          (%_2702 open-source-input-file))
        (set! open-output-file (%_2702 open-output-file))
        (set! load
          (lambda (%_2705)
            (begin
              ((lambda (%_2706)
                 (begin
                   (current-url (normalize-url %_2706 %_2705))
                   (with-failure-continuation
                     (lambda (%_2707 %_2708)
                       (begin
                         (current-url %_2706)
                         (throw %_2707 %_2708)))
                     (lambda ()
                       ((lambda (%_2709)
                          ((%_2703 (if %_2709 %_2709 '"scm"))
                           (current-url)))
                        (%_2704 (current-url)))))
                   (current-url %_2706)))
               (current-url))
              (void))))))
    (lambda (%_2715)
      ((letrec ((%_2716
                  (lambda (%_2717 %_2718)
                    (if (null? %_2717)
                      '#f
                      (if (equal? (car %_2717) '#\.)
                        (list->string %_2718)
                        (%_2716 (cdr %_2717) (cons (car %_2717) %_2718)))))))
         %_2716)
       (reverse (string->list %_2715))
       '()))
    (lambda (%_2713)
      ((lambda (%_2714)
         (if (memv %_2714 '(sce pp)) load-expanded %_2701))
       (string->symbol (string-downcase %_2713))))
    (lambda (%_2710)
      (lambda (%_2712 . %_2711)
        (apply %_2710
               (normalize-url (current-url) %_2712)
               %_2711)))))
 load)
(define load-module
  (lambda (%_2719)
    ((lambda (%_2720)
       ((lambda (%_2721)
          (for-each
            (lambda (%_2722)
              (putprop
                %_2722
                '*toplevel*
                (native-library-binding %_2720 %_2722)))
            %_2721))
        (native-library-binding-names %_2720)))
     (load-native-library %_2719))))
(define reverse
  (letrec ((%_2723
             (lambda (%_2725 %_2726)
               (if (null? %_2725)
                 %_2726
                 (%_2723 (cdr %_2725) (cons (car %_2725) %_2726))))))
    (lambda (%_2724) (%_2723 %_2724 '()))))
(define append
  (letrec ((%_2727
             (lambda (%_2730 . %_2729)
               (if (null? %_2729)
                 %_2730
                 (if (null? %_2730)
                   (apply %_2727 %_2729)
                   (apply %_2727
                          (cons (append2 %_2730 (car %_2729))
                                (cdr %_2729))))))))
    (lambda %_2728
      (if (null? %_2728)
        '()
        (if (null? (cdr %_2728))
          (car %_2728)
          (apply %_2727 (cons (car %_2728) (cdr %_2728))))))))
(define map
  (letrec ((%_2732
             (lambda (%_2736 %_2737 %_2738 %_2739)
               (if (null? (car %_2737))
                 (if (andmap null? %_2737)
                   %_2738
                   (error 'map '"lists are not of equal length."))
                 ((lambda (%_2740 %_2741)
                    (begin
                      (if (not (null? %_2739))
                        (set-cdr! %_2739 %_2740)
                        (void))
                      (if (null? %_2738)
                        (%_2732 %_2736 %_2741 %_2740 %_2740)
                        (%_2732 %_2736 %_2741 %_2738 %_2740))))
                  (cons (apply %_2736 (%_2731 car %_2737)) '())
                  (%_2731 cdr %_2737)))))
           (%_2731 map))
    (lambda (%_2735 %_2734 . %_2733)
      (if (null? %_2733)
        (%_2731 %_2735 %_2734)
        (%_2732 %_2735 (cons %_2734 %_2733) '() '())))))
(define proper-list?
  (lambda (%_2742)
    ((letrec ((%_2743
                (lambda (%_2744 %_2745)
                  (if (pair? %_2744)
                    ((lambda (%_2746)
                       (if (pair? %_2746)
                         ((lambda (%_2747 %_2748)
                            (if (not (eq? %_2747 %_2748))
                              (%_2743 %_2747 %_2748)
                              '#f))
                          (cdr %_2746)
                          (cdr %_2745))
                         (null? %_2746)))
                     (cdr %_2744))
                    (null? %_2744)))))
       %_2743)
     %_2742
     %_2742)))
(define circular?
  (lambda (%_2749)
    (letrec ((%_2754
               (lambda (%_2772 %_2773)
                 (letrec ((%_2774
                            (lambda (%_2783 %_2784)
                              ((lambda (%_2785)
                                 (if %_2785
                                   (%_2754 (%_2753 %_2783) (%_2753 %_2785))
                                   '#f))
                               (%_2753 %_2784)))))
                   (if %_2773
                     (if (not (eq? (car %_2773) (car %_2772)))
                       (%_2774 %_2772 %_2773)
                       ((letrec ((%_2775
                                   (lambda (%_2776 %_2777)
                                     ((lambda (%_2778)
                                        (if %_2778
                                          %_2778
                                          (if (if (= (cadr %_2776)
                                                     (cadr %_2777))
                                                (eq? (caddr %_2776)
                                                     (caddr %_2777))
                                                '#f)
                                            (%_2775
                                              (cddr %_2776)
                                              (cddr %_2777))
                                            ((lambda (%_2779)
                                               ((letrec ((%_2780
                                                           (lambda (%_2781)
                                                             (if %_2781
                                                               ((lambda (%_2782)
                                                                  (if %_2782
                                                                    %_2782
                                                                    (%_2780
                                                                      (%_2753
                                                                        %_2781))))
                                                                (eq? (car %_2781)
                                                                     %_2779))
                                                               (%_2774
                                                                 %_2776
                                                                 %_2777)))))
                                                  %_2780)
                                                (%_2753 (list %_2779))))
                                             (car %_2776)))))
                                      (null? (cdr %_2776))))))
                          %_2775)
                        %_2772
                        %_2773))
                     '#f))))
             (%_2753
               (lambda (%_2762)
                 ((lambda (%_2763)
                    ((letrec ((%_2764
                                (lambda (%_2765 %_2766 %_2767)
                                  (if (>= %_2766 '0)
                                    ((lambda (%_2771)
                                       (if (%_2750 %_2771)
                                         (cons %_2771 (cons %_2766 %_2767))
                                         (%_2764 %_2765 (- %_2766 '1) %_2767)))
                                     (%_2752 %_2765 %_2766))
                                    ((lambda (%_2768)
                                       (if (pair? %_2768)
                                         ((lambda (%_2769 %_2770)
                                            (%_2764
                                              (car %_2770)
                                              (- %_2769 '1)
                                              %_2770))
                                          (car %_2768)
                                          (cdr %_2768))
                                         '#f))
                                     (cdr %_2767))))))
                       %_2764)
                     %_2763
                     (- (%_2751 %_2763) '1)
                     %_2762))
                  (car %_2762))))
             (%_2752
               (lambda (%_2760 %_2761)
                 (if (vector? %_2760)
                   (vector-ref %_2760 %_2761)
                   (if (box? %_2760)
                     (unbox %_2760)
                     ((if (zero? %_2761) car cdr) %_2760)))))
             (%_2751
               (lambda (%_2759)
                 (if (pair? %_2759)
                   '2
                   (if (box? %_2759) '1 (vector-length %_2759)))))
             (%_2750
               (lambda (%_2756)
                 ((lambda (%_2757)
                    (if %_2757
                      %_2757
                      ((lambda (%_2758)
                         (if %_2758
                           %_2758
                           (if (vector? %_2756)
                             (not (zero? (vector-length %_2756)))
                             '#f)))
                       (box? %_2756))))
                  (pair? %_2756)))))
      (if (%_2750 %_2749)
        ((lambda (%_2755) (%_2754 %_2755 (%_2753 %_2755)))
         (list %_2749))
        '#f))))
(define list?
  (letrec ((%_2786
             (lambda (%_2789 %_2790)
               ((lambda (%_2791)
                  (if %_2791
                    %_2791
                    ((lambda (%_2792)
                       (if %_2792
                         %_2792
                         (if (pair? %_2790)
                           ((lambda (%_2793)
                              (if %_2793
                                %_2793
                                (if (not (eq? %_2789 %_2790))
                                  (%_2786 (cdr %_2789) (cddr %_2790))
                                  '#f)))
                            (null? (cdr %_2790)))
                           '#f)))
                     (null? %_2790))))
                (null? %_2789)))))
    (lambda (%_2787)
      ((lambda (%_2788)
         (if %_2788
           %_2788
           (if (pair? %_2787)
             (%_2786 %_2787 (cdr %_2787))
             '#f)))
       (null? %_2787)))))
(define expt
  (letrec ((%_2795
             (lambda (%_2800 %_2801)
               (if (negative? %_2801)
                 (/ (%_2795 %_2800 (abs %_2801)))
                 (if (if (exact? %_2800) (= %_2800 '2) '#f)
                   (ashl '1 %_2801)
                   ((letrec ((%_2802
                               (lambda (%_2803 %_2804 %_2805)
                                 (if (zero? %_2803)
                                   %_2804
                                   (%_2802
                                     (quotient %_2803 '2)
                                     (if (odd? %_2803)
                                       (* %_2804 %_2805)
                                       %_2804)
                                     (* %_2805 %_2805))))))
                      %_2802)
                    %_2801
                    '1
                    %_2800)))))
           (%_2794
             (lambda (%_2798 %_2799)
               (exp (* %_2799 (log %_2798))))))
    (lambda (%_2796 %_2797)
      (if (zero? %_2797)
        (if (exact? %_2797) '1 '1.0)
        (if (zero? %_2796)
          (if (exact? %_2797) %_2796 '0.0)
          (if (if (exact? %_2797) (integer? %_2797) '#f)
            (%_2795 %_2796 %_2797)
            (%_2794 %_2796 %_2797)))))))
(define modpow
  (lambda (%_2806 %_2807 %_2808)
    (if (= %_2807 '1)
      (modulo %_2806 %_2808)
      (if (even? %_2807)
        ((lambda (%_2811)
           (modulo (* %_2811 %_2811) %_2808))
         (modpow %_2806 (/ %_2807 '2) %_2808))
        ((lambda (%_2810)
           (begin
             (set! %_2810 (modulo (* %_2810 %_2810) %_2808))
             (modulo (* %_2806 %_2810) %_2808)))
         (modpow %_2806 (/ (- %_2807 '1) '2) %_2808))))))
(define integer?
  ((lambda (%_2812)
     (lambda (%_2813)
       ((lambda (%_2814)
          (if %_2814
            %_2814
            (if (real? %_2813) (= (round %_2813) %_2813) '#f)))
        (%_2812 %_2813))))
   integer?))
(define real?
  ((lambda (%_2815)
     (lambda (%_2816)
       (if (number? %_2816) (not (%_2815 %_2816)) '#f)))
   complex?))
(define rational? real?)
(define complex? number?)
(define abs
  (lambda (%_2817)
    (if (not (real? %_2817))
      ((lambda (%_2819 %_2818)
         (sqrt (+ (* %_2818 %_2818) (* %_2819 %_2819))))
       (imag-part %_2817)
       (real-part %_2817))
      (if (< %_2817 '0) (- %_2817) %_2817))))
(define min (void))
(define max (void))
(letrec ((%_2820
           (lambda (%_2825 %_2826 %_2827 %_2828)
             (if (null? %_2827)
               (if (if %_2828 (exact? %_2826) '#f)
                 (exact->inexact %_2826)
                 %_2826)
               (if (%_2825 (car %_2827) %_2826)
                 (%_2820
                   %_2825
                   (car %_2827)
                   (cdr %_2827)
                   ((lambda (%_2829)
                      (if %_2829 %_2829 (inexact? (car %_2827))))
                    %_2828))
                 (%_2820 %_2825 %_2826 (cdr %_2827) %_2828))))))
  (begin
    (set! min
      (lambda (%_2822 . %_2821)
        (if (null? %_2821)
          %_2822
          (%_2820 < %_2822 %_2821 (inexact? %_2822)))))
    (set! max
      (lambda (%_2824 . %_2823)
        (if (null? %_2823)
          %_2824
          (%_2820 > %_2824 %_2823 (inexact? %_2824)))))))
(define negative?
  (lambda (%_2830) (< %_2830 '0)))
(define positive?
  (lambda (%_2831) (> %_2831 '0)))
(define even?
  (lambda (%_2832) (= '0 (modulo %_2832 '2))))
(define odd?
  (lambda (%_2833) (not (even? %_2833))))
(define zero? (lambda (%_2834) (= %_2834 '0)))
(define add1 (lambda (%_2835) (+ %_2835 '1)))
(define sub1 (lambda (%_2836) (- %_2836 '1)))
(define >= (void))
(define <= (void))
((lambda (%_2838 %_2837)
   (begin
     (set! <=
       (%_2837
         (lambda (%_2839 %_2840)
           ((lambda (%_2841)
              (if %_2841 %_2841 (= %_2839 %_2840)))
            (< %_2839 %_2840)))
         %_2838
         '#t))
     (set! >=
       (%_2837
         (lambda (%_2842 %_2843)
           ((lambda (%_2844)
              (if %_2844 %_2844 (= %_2842 %_2843)))
            (> %_2842 %_2843)))
         %_2838
         '#t))))
 (lambda (%_2851 %_2852) (if %_2851 %_2852 '#f))
 (lambda (%_2845 %_2846 %_2847)
   (lambda %_2848
     ((letrec ((%_2849
                 (lambda (%_2850)
                   (if (null? %_2850)
                     %_2847
                     (if (null? (cdr %_2850))
                       %_2847
                       (%_2846
                         (%_2845 (car %_2850) (cadr %_2850))
                         (%_2849 (cdr %_2850))))))))
        %_2849)
      %_2848))))
((lambda (%_2853)
   (begin
     (set! >= (%_2853 > >=))
     (set! <= (%_2853 < <=))))
 (lambda (%_2854 %_2855)
   (lambda %_2856
     ((lambda (%_2857)
        (if %_2857
          %_2857
          ((lambda (%_2858)
             (if %_2858
               %_2858
               (if ((lambda (%_2859)
                      (if %_2859
                        %_2859
                        (%_2854 (car %_2856) (cadr %_2856))))
                    (= (car %_2856) (cadr %_2856)))
                 (apply %_2855 (cdr %_2856))
                 '#f)))
           (null? (cdr %_2856)))))
      (null? %_2856)))))
(define gcd
  (lambda %_2860
    (if (null? %_2860)
      '0
      (if (null? (cdr %_2860))
        (car %_2860)
        (_gcd (car %_2860) (cadr %_2860))))))
(define lcm
  (lambda %_2861
    (if (null? %_2861)
      '1
      (if (null? (cdr %_2861))
        (car %_2861)
        (_lcm (car %_2861) (cadr %_2861))))))
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
  (lambda %_2862
    (if (null? %_2862)
      '""
      (if (null? (cdr %_2862))
        (car %_2862)
        (apply string-append
               (_string-append (car %_2862) (cadr %_2862))
               (cddr %_2862))))))
(define char-downcase
  ((lambda (%_2863)
     ((lambda (%_2864)
        ((lambda (%_2865)
           (lambda (%_2866)
             ((lambda (%_2867)
                (if (if (>= %_2867 %_2863) (<= %_2867 %_2864) '#f)
                  (integer->char (+ %_2867 %_2865))
                  %_2866))
              (char->integer %_2866))))
         (- (char->integer '#\a) %_2863)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_2868)
     ((lambda (%_2869)
        ((lambda (%_2870)
           (lambda (%_2871)
             ((lambda (%_2872)
                (if (if (>= %_2872 %_2868) (<= %_2872 %_2869) '#f)
                  (integer->char (- %_2872 %_2870))
                  %_2871))
              (char->integer %_2871))))
         (- %_2868 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_2873 %_2874)
    (> (char->integer %_2873) (char->integer %_2874))))
(define char<?
  (lambda (%_2875 %_2876)
    (< (char->integer %_2875) (char->integer %_2876))))
(define char=? eq?)
(define char>=?
  (lambda (%_2877 %_2878)
    ((lambda (%_2879)
       (if %_2879 %_2879 (char=? %_2877 %_2878)))
     (char>? %_2877 %_2878))))
(define char<=?
  (lambda (%_2880 %_2881)
    ((lambda (%_2882)
       (if %_2882 %_2882 (char=? %_2880 %_2881)))
     (char<? %_2880 %_2881))))
(define char-ci>?
  (lambda (%_2883 %_2884)
    (char>?
      (char-downcase %_2883)
      (char-downcase %_2884))))
(define char-ci<?
  (lambda (%_2885 %_2886)
    (char<?
      (char-downcase %_2885)
      (char-downcase %_2886))))
(define char-ci=?
  (lambda (%_2887 %_2888)
    (char=?
      (char-downcase %_2887)
      (char-downcase %_2888))))
(define char-ci>=?
  (lambda (%_2889 %_2890)
    ((lambda (%_2891)
       (if %_2891 %_2891 (char-ci=? %_2889 %_2890)))
     (char-ci>? %_2889 %_2890))))
(define char-ci<=?
  (lambda (%_2892 %_2893)
    ((lambda (%_2894)
       (if %_2894 %_2894 (char-ci=? %_2892 %_2893)))
     (char-ci<? %_2892 %_2893))))
(define char-alphabetic?
  (lambda (%_2895)
    (if (char-ci>=? %_2895 '#\a)
      (char-ci<=? %_2895 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_2896)
    (if (char-ci>=? %_2896 '#\0)
      (char-ci<=? %_2896 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_2897)
    (if (memq %_2897 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_2898)
    (if (char-alphabetic? %_2898)
      (char<? %_2898 '#\a)
      '#f)))
(define char-lower-case?
  (lambda (%_2899)
    (if (char-alphabetic? %_2899)
      (char>? %_2899 '#\Z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
(letrec ((%_2900
           (lambda (%_2905 %_2906 %_2907 %_2908 %_2909)
             (if (< %_2908 %_2909)
               (begin
                 (string-set!
                   %_2906
                   %_2908
                   (%_2907 (string-ref %_2905 %_2908)))
                 (%_2900
                   %_2905
                   %_2906
                   %_2907
                   (+ %_2908 '1)
                   %_2909))
               %_2906))))
  (begin
    (set! string-downcase
      (lambda (%_2901)
        ((lambda (%_2902)
           (%_2900
             %_2901
             %_2902
             char-downcase
             '0
             (string-length %_2901)))
         (make-string (string-length %_2901)))))
    (set! string-upcase
      (lambda (%_2903)
        ((lambda (%_2904)
           (%_2900
             %_2903
             %_2904
             char-upcase
             '0
             (string-length %_2903)))
         (make-string (string-length %_2903)))))))
(define string=? equal?)
(define string<?
  (letrec ((%_2910
             (lambda (%_2913 %_2914)
               (if (null? %_2913)
                 (not (null? %_2914))
                 (if (null? %_2914)
                   '#f
                   ((lambda (%_2915 %_2916)
                      (if (char<? %_2915 %_2916)
                        '#t
                        (if (char>? %_2915 %_2916)
                          '#f
                          (%_2910 (cdr %_2913) (cdr %_2914)))))
                    (car %_2913)
                    (car %_2914)))))))
    (lambda (%_2911 %_2912)
      (%_2910
        (string->list %_2911)
        (string->list %_2912)))))
(define string>?
  (letrec ((%_2917
             (lambda (%_2920 %_2921)
               (if (null? %_2921)
                 (not (null? %_2920))
                 (if (null? %_2920)
                   '#f
                   ((lambda (%_2922 %_2923)
                      (if (char>? %_2922 %_2923)
                        '#t
                        (if (char<? %_2922 %_2923)
                          '#f
                          (%_2917 (cdr %_2920) (cdr %_2921)))))
                    (car %_2920)
                    (car %_2921)))))))
    (lambda (%_2918 %_2919)
      (%_2917
        (string->list %_2918)
        (string->list %_2919)))))
(define string<=?
  (lambda (%_2924 %_2925)
    ((lambda (%_2926)
       (if %_2926 %_2926 (string=? %_2924 %_2925)))
     (string<? %_2924 %_2925))))
(define string>=?
  (lambda (%_2927 %_2928)
    ((lambda (%_2929)
       (if %_2929 %_2929 (string=? %_2927 %_2928)))
     (string>? %_2927 %_2928))))
(define string-ci=?
  (lambda (%_2930 %_2931)
    (string=?
      (string-downcase %_2930)
      (string-downcase %_2931))))
(define string-ci<?
  (lambda (%_2932 %_2933)
    (string<?
      (string-downcase %_2932)
      (string-downcase %_2933))))
(define string-ci>?
  (lambda (%_2934 %_2935)
    (string>?
      (string-downcase %_2934)
      (string-downcase %_2935))))
(define string-ci>=?
  (lambda (%_2936 %_2937)
    (string>=?
      (string-downcase %_2936)
      (string-downcase %_2937))))
(define string-ci<=?
  (lambda (%_2938 %_2939)
    (string<=?
      (string-downcase %_2938)
      (string-downcase %_2939))))
(define substring
  (letrec ((%_2940
             (lambda (%_2945 %_2946 %_2947 %_2948 %_2949)
               (if (< %_2948 %_2949)
                 (begin
                   (string-set!
                     %_2946
                     %_2947
                     (string-ref %_2945 %_2948))
                   (%_2940
                     %_2945
                     %_2946
                     (+ %_2947 '1)
                     (+ %_2948 '1)
                     %_2949))
                 (void)))))
    (lambda (%_2941 %_2942 %_2943)
      ((lambda (%_2944)
         (begin
           (%_2940 %_2941 %_2944 '0 %_2942 %_2943)
           %_2944))
       (make-string (- %_2943 %_2942))))))
(define format
  (lambda (%_2951 . %_2950)
    ((lambda (%_2952)
       ((letrec ((%_2953
                   (lambda (%_2954 %_2955)
                     (if (null? %_2954)
                       (get-output-string %_2952)
                       (if (char=? (car %_2954) '#\~)
                         (if (null? (cdr %_2954))
                           (error 'format '"Incomplete escape sequence")
                           ((lambda (%_2956)
                              (if (memv %_2956 '(#\a))
                                (if (null? %_2955)
                                  (error 'format
                                         '"No value for escape sequence")
                                  (begin
                                    (display (car %_2955) %_2952)
                                    (%_2953 (cddr %_2954) (cdr %_2955))))
                                (if (memv %_2956 '(#\s))
                                  (if (null? %_2955)
                                    (error 'format
                                           '"No value for escape sequence")
                                    (begin
                                      (write (car %_2955) %_2952)
                                      (%_2953 (cddr %_2954) (cdr %_2955))))
                                  (if (memv %_2956 '(#\%))
                                    (begin
                                      (display '#\newline %_2952)
                                      (%_2953 (cddr %_2954) %_2955))
                                    (if (memv %_2956 '(#\~))
                                      (begin
                                        (display '#\~ %_2952)
                                        (%_2953 (cddr %_2954) %_2955))
                                      (error 'format
                                             '"Unrecognized escape sequence"))))))
                            (cadr %_2954)))
                         (begin
                           (display (car %_2954) %_2952)
                           (%_2953 (cdr %_2954) %_2955)))))))
          %_2953)
        (string->list %_2951)
        %_2950))
     (open-output-string))))
(define list-ref
  (lambda (%_2957 %_2958)
    (if (zero? %_2958)
      (car %_2957)
      (list-ref (cdr %_2957) (- %_2958 '1)))))
(define values
  (lambda %_2959
    (call-with-current-continuation
      (lambda (%_2960) (apply %_2960 %_2959)))))
