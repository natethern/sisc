(define for-each
  (lambda (%_2398 . %_2397)
    (if (null? %_2397)
      (error 'for-each
             '"invalid number of arguments to procedure for-each.")
      (if (not (null? (car %_2397)))
        (begin
          (apply %_2398 (map car %_2397))
          (apply for-each (cons %_2398 (map cdr %_2397))))
        (void)))))
(define eof-object?
  (lambda (%_2399) (eq? %_2399 '#!eof)))
(define not
  (lambda (%_2400) (if %_2400 '#f '#t)))
(define eqv? eq?)
(define newline
  (lambda %_2401
    (apply display (cons '#\newline %_2401))))
(define map (void))
(letrec ((%_2402
           (letrec ((%_2403
                      (lambda (%_2407 %_2408 %_2409 %_2410)
                        (if (null? %_2410)
                          %_2408
                          (begin
                            (set-cdr!
                              %_2409
                              (cons (%_2407 (car %_2410)) '()))
                            (%_2403
                              %_2407
                              %_2408
                              (cdr %_2409)
                              (cdr %_2410)))))))
             (lambda (%_2404 %_2405)
               (if (null? %_2405)
                 '()
                 ((lambda (%_2406)
                    (%_2403 %_2404 %_2406 %_2406 (cdr %_2405)))
                  (cons (%_2404 (car %_2405)) '())))))))
  (set! map %_2402))
(define compose
  (lambda %_2411
    (if (null? %_2411)
      (lambda (%_2415) %_2415)
      ((lambda (%_2412 %_2413)
         (lambda (%_2414) (%_2412 (%_2413 %_2414))))
       (car %_2411)
       (apply compose (cdr %_2411))))))
(define compose2
  (lambda (%_2416 %_2417)
    (lambda (%_2418) (%_2416 (%_2417 %_2418)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
(letrec ((%_2419
           (lambda (%_2433 %_2434 %_2435)
             (if (null? %_2435)
               '#f
               (if (%_2433 (caar %_2435) %_2434)
                 (car %_2435)
                 (%_2419 %_2433 %_2434 (cdr %_2435))))))
         (%_2420
           (lambda (%_2436 %_2437 %_2438)
             (if (null? %_2438)
               '#f
               (if (%_2436 (car %_2438) %_2437)
                 %_2438
                 (%_2420 %_2436 %_2437 (cdr %_2438)))))))
  (begin
    (set! assq
      (lambda (%_2421 %_2422)
        (%_2419 eq? %_2421 %_2422)))
    (set! assv
      (lambda (%_2423 %_2424)
        (%_2419 eqv? %_2423 %_2424)))
    (set! assoc
      (lambda (%_2425 %_2426)
        (%_2419 equal? %_2425 %_2426)))
    (set! memq
      (lambda (%_2427 %_2428)
        (%_2420 eq? %_2427 %_2428)))
    (set! memv
      (lambda (%_2429 %_2430)
        (%_2420 eqv? %_2429 %_2430)))
    (set! member
      (lambda (%_2431 %_2432)
        (%_2420 equal? %_2431 %_2432)))))
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
  (lambda (%_2439 %_2440)
    (if (null? %_2439)
      %_2440
      (cons (car %_2439) (append2 (cdr %_2439) %_2440)))))
(define append append2)
(define list->string
  (lambda (%_2441)
    (letrec ((%_2442
               (lambda (%_2443 %_2444 %_2445)
                 (if (null? %_2443)
                   %_2444
                   (begin
                     (string-set! %_2444 %_2445 (car %_2443))
                     (%_2442 (cdr %_2443) %_2444 (+ %_2445 '1)))))))
      (%_2442 %_2441 (make-string (length %_2441)) '0))))
(define string->list
  (letrec ((%_2446
             (lambda (%_2448 %_2449 %_2450)
               (if (< %_2450 '0)
                 %_2449
                 (%_2446
                   %_2448
                   (cons (string-ref %_2448 %_2450) %_2449)
                   (- %_2450 '1))))))
    (lambda (%_2447)
      (%_2446 %_2447 '() (- (string-length %_2447) '1)))))
(define list->vector
  (letrec ((%_2451
             (lambda (%_2453 %_2454 %_2455)
               (if (null? %_2453)
                 %_2454
                 (begin
                   (vector-set! %_2454 %_2455 (car %_2453))
                   (%_2451 (cdr %_2453) %_2454 (+ %_2455 '1)))))))
    (lambda (%_2452)
      (if (proper-list? %_2452)
        (%_2451 %_2452 (make-vector (length %_2452)) '0)
        (error 'list->vector
               '"can only convert a proper list."
               %_2452)))))
(define vector
  (lambda %_2456 (list->vector %_2456)))
(define string
  (lambda %_2457 (list->string %_2457)))
(define throw
  (lambda (%_2459 . %_2458)
    (call-with-failure-continuation
      (lambda (%_2460)
        (if (null? %_2458)
          (call-with-current-continuation
            (lambda (%_2461) (%_2460 %_2459 %_2461)))
          (%_2460 %_2459 (car %_2458)))))))
(define detect-os
  (lambda ()
    ((lambda (%_2462)
       (if (> (string-length %_2462) '3)
         (if (equal? (substring %_2462 '0 '3) '"mac")
           'macos
           (if (equal? (substring %_2462 '0 '3) '"win")
             'ms-dos
             (if (equal? (substring %_2462 '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring %_2462 '0 '3) '"uni")
                 'unix
                 (if (equal? (substring %_2462 '0 '3) '"lin")
                   'unix
                   (if (equal? (substring %_2462 '0 '4) '"os/")
                     'os2
                     (if (equal? (substring %_2462 '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase
       (getprop 'os.name '*environment-variables*)))))
(define current-url (make-parameter '"file:."))
(define current-directory
  (lambda %_2463
    (if (null? %_2463)
      (normalize-url (current-url) '".")
      (current-url
        (normalize-url
          (current-url)
          ((lambda (%_2464)
             ((lambda (%_2465)
                ((lambda ()
                   (if (eq? (string-ref %_2464 (- %_2465 '1)) '#\/)
                     %_2464
                     (string-append %_2464 '"/")))))
              (string-length %_2464)))
           (car %_2463)))))))
(define load-expanded load)
((lambda (%_2466)
   ((lambda (%_2467 %_2468 %_2469)
      (begin
        (set! open-input-file (%_2467 open-input-file))
        (set! open-source-input-file
          (%_2467 open-source-input-file))
        (set! open-output-file (%_2467 open-output-file))
        (set! load
          (lambda (%_2470)
            (begin
              ((lambda (%_2471)
                 (begin
                   (current-url (normalize-url %_2471 %_2470))
                   (with-failure-continuation
                     (lambda (%_2472 %_2473)
                       (begin
                         (current-url %_2471)
                         (throw %_2472 %_2473)))
                     (lambda ()
                       ((lambda (%_2474)
                          ((%_2468 (if %_2474 %_2474 '"scm"))
                           (current-url)))
                        (%_2469 (current-url)))))
                   (current-url %_2471)))
               (current-url))
              (void))))))
    (lambda (%_2475)
      (lambda (%_2477 . %_2476)
        (apply %_2475
               (normalize-url (current-url) %_2477)
               %_2476)))
    (lambda (%_2478)
      ((lambda (%_2479)
         (if (memv %_2479 '(sce pp)) load-expanded %_2466))
       (string->symbol (string-downcase %_2478))))
    (lambda (%_2480)
      ((letrec ((%_2481
                  (lambda (%_2482 %_2483)
                    (if (null? %_2482)
                      '#f
                      (if (equal? (car %_2482) '#\.)
                        (list->string %_2483)
                        (%_2481 (cdr %_2482) (cons (car %_2482) %_2483)))))))
         %_2481)
       (reverse (string->list %_2480))
       '()))))
 load)
(define load-module
  (lambda (%_2484)
    ((lambda (%_2485)
       ((lambda (%_2486)
          ((lambda ()
             (for-each
               (lambda (%_2487)
                 (putprop
                   %_2487
                   '*toplevel*
                   (native-library-binding %_2485 %_2487)))
               %_2486))))
        (native-library-binding-names %_2485)))
     (load-native-library %_2484))))
(define reverse
  (letrec ((%_2488
             (lambda (%_2490 %_2491)
               (if (null? %_2490)
                 %_2491
                 (%_2488 (cdr %_2490) (cons (car %_2490) %_2491))))))
    (lambda (%_2489) (%_2488 %_2489 '()))))
(define append
  (letrec ((%_2492
             (lambda (%_2495 . %_2494)
               (if (null? %_2494)
                 %_2495
                 (if (null? %_2495)
                   (apply %_2492 %_2494)
                   (apply %_2492
                          (cons (append2 %_2495 (car %_2494))
                                (cdr %_2494))))))))
    (lambda %_2493
      (if (null? %_2493)
        '()
        (if (null? (cdr %_2493))
          (car %_2493)
          (apply %_2492 (cons (car %_2493) (cdr %_2493))))))))
(define map
  (letrec ((%_2496 map)
           (%_2497
             (lambda (%_2501 %_2502 %_2503 %_2504)
               (if (null? (car %_2502))
                 (if (andmap null? %_2502)
                   %_2503
                   (error 'map '"lists are not of equal length."))
                 ((lambda (%_2505 %_2506)
                    (begin
                      (if (not (null? %_2504))
                        (set-cdr! %_2504 %_2505)
                        (void))
                      (if (null? %_2503)
                        (%_2497 %_2501 %_2506 %_2505 %_2505)
                        (%_2497 %_2501 %_2506 %_2503 %_2505))))
                  (cons (apply %_2501 (%_2496 car %_2502)) '())
                  (%_2496 cdr %_2502))))))
    (lambda (%_2500 %_2499 . %_2498)
      (if (null? %_2498)
        (%_2496 %_2500 %_2499)
        (%_2497 %_2500 (cons %_2499 %_2498) '() '())))))
(define proper-list?
  (lambda (%_2507)
    ((letrec ((%_2508
                (lambda (%_2509 %_2510)
                  (if (pair? %_2509)
                    ((lambda (%_2511)
                       (if (pair? %_2511)
                         ((lambda (%_2512 %_2513)
                            (if (not (eq? %_2512 %_2513))
                              (%_2508 %_2512 %_2513)
                              '#f))
                          (cdr %_2511)
                          (cdr %_2510))
                         (null? %_2511)))
                     (cdr %_2509))
                    (null? %_2509)))))
       %_2508)
     %_2507
     %_2507)))
(define circular?
  (lambda (%_2514)
    (letrec ((%_2515
               (lambda (%_2521)
                 ((lambda (%_2522)
                    (if %_2522
                      %_2522
                      ((lambda (%_2523)
                         (if %_2523
                           %_2523
                           (if (vector? %_2521)
                             (not (zero? (vector-length %_2521)))
                             '#f)))
                       (box? %_2521))))
                  (pair? %_2521))))
             (%_2516
               (lambda (%_2524)
                 (if (pair? %_2524)
                   '2
                   (if (box? %_2524) '1 (vector-length %_2524)))))
             (%_2517
               (lambda (%_2525 %_2526)
                 (if (vector? %_2525)
                   (vector-ref %_2525 %_2526)
                   (if (box? %_2525)
                     (unbox %_2525)
                     ((if (zero? %_2526) car cdr) %_2525)))))
             (%_2518
               (lambda (%_2527)
                 ((lambda (%_2528)
                    ((letrec ((%_2529
                                (lambda (%_2530 %_2531 %_2532)
                                  (if (>= %_2531 '0)
                                    ((lambda (%_2536)
                                       (if (%_2515 %_2536)
                                         (cons %_2536 (cons %_2531 %_2532))
                                         (%_2529 %_2530 (- %_2531 '1) %_2532)))
                                     (%_2517 %_2530 %_2531))
                                    ((lambda (%_2533)
                                       (if (pair? %_2533)
                                         ((lambda (%_2534 %_2535)
                                            (%_2529
                                              (car %_2535)
                                              (- %_2534 '1)
                                              %_2535))
                                          (car %_2533)
                                          (cdr %_2533))
                                         '#f))
                                     (cdr %_2532))))))
                       %_2529)
                     %_2528
                     (- (%_2516 %_2528) '1)
                     %_2527))
                  (car %_2527))))
             (%_2519
               (lambda (%_2537 %_2538)
                 (letrec ((%_2539
                            (lambda (%_2548 %_2549)
                              ((lambda (%_2550)
                                 (if %_2550
                                   (%_2519 (%_2518 %_2548) (%_2518 %_2550))
                                   '#f))
                               (%_2518 %_2549)))))
                   (if %_2538
                     (if (not (eq? (car %_2538) (car %_2537)))
                       (%_2539 %_2537 %_2538)
                       ((letrec ((%_2540
                                   (lambda (%_2541 %_2542)
                                     ((lambda (%_2543)
                                        (if %_2543
                                          %_2543
                                          (if (if (= (cadr %_2541)
                                                     (cadr %_2542))
                                                (eq? (caddr %_2541)
                                                     (caddr %_2542))
                                                '#f)
                                            (%_2540
                                              (cddr %_2541)
                                              (cddr %_2542))
                                            ((lambda (%_2544)
                                               ((letrec ((%_2545
                                                           (lambda (%_2546)
                                                             (if %_2546
                                                               ((lambda (%_2547)
                                                                  (if %_2547
                                                                    %_2547
                                                                    (%_2545
                                                                      (%_2518
                                                                        %_2546))))
                                                                (eq? (car %_2546)
                                                                     %_2544))
                                                               (%_2539
                                                                 %_2541
                                                                 %_2542)))))
                                                  %_2545)
                                                (%_2518 (list %_2544))))
                                             (car %_2541)))))
                                      (null? (cdr %_2541))))))
                          %_2540)
                        %_2537
                        %_2538))
                     '#f)))))
      (if (%_2515 %_2514)
        ((lambda (%_2520) (%_2519 %_2520 (%_2518 %_2520)))
         (list %_2514))
        '#f))))
(define list?
  (letrec ((%_2551
             (lambda (%_2554 %_2555)
               ((lambda (%_2556)
                  (if %_2556
                    %_2556
                    ((lambda (%_2557)
                       (if %_2557
                         %_2557
                         (if (pair? %_2555)
                           ((lambda (%_2558)
                              (if %_2558
                                %_2558
                                (if (not (eq? %_2554 %_2555))
                                  (%_2551 (cdr %_2554) (cddr %_2555))
                                  '#f)))
                            (null? (cdr %_2555)))
                           '#f)))
                     (null? %_2555))))
                (null? %_2554)))))
    (lambda (%_2552)
      ((lambda (%_2553)
         (if %_2553
           %_2553
           (if (pair? %_2552)
             (%_2551 %_2552 (cdr %_2552))
             '#f)))
       (null? %_2552)))))
(define expt
  (lambda (%_2559 %_2560)
    (if (if (integer? %_2560) (= %_2559 '2) '#f)
      (ashl '1 %_2560)
      ((letrec ((%_2561
                  (lambda (%_2562 %_2563 %_2564)
                    (if (zero? %_2562)
                      %_2563
                      (%_2561
                        (quotient %_2562 '2)
                        (if (odd? %_2562) (* %_2563 %_2564) %_2563)
                        (* %_2564 %_2564))))))
         %_2561)
       %_2560
       '1
       %_2559))))
(define modpow
  (lambda (%_2565 %_2566 %_2567)
    ((lambda (%_2568)
       (if (= %_2566 '1)
         (modulo %_2565 %_2567)
         (if (even? %_2566)
           ((lambda (%_2570)
              (modulo (* %_2570 %_2570) %_2567))
            (modpow %_2565 (/ %_2566 '2) %_2567))
           ((lambda (%_2569)
              (begin
                (set! %_2569 (modulo (* %_2569 %_2569) %_2567))
                (modulo (* %_2565 %_2569) %_2567)))
            (modpow %_2565 (/ (- %_2566 '1) '2) %_2567)))))
     '0)))
(define integer?
  ((lambda (%_2571)
     (lambda (%_2572)
       ((lambda (%_2573)
          (if %_2573
            %_2573
            (if (real? %_2572) (= (round %_2572) %_2572) '#f)))
        (%_2571 %_2572))))
   integer?))
(define real?
  ((lambda (%_2574)
     (lambda (%_2575)
       (if (number? %_2575) (not (%_2574 %_2575)) '#f)))
   complex?))
(define complex? number?)
(define abs
  (lambda (%_2576)
    (if (not (real? %_2576))
      ((lambda (%_2577 %_2578)
         (sqrt (+ (* %_2577 %_2577) (* %_2578 %_2578))))
       (real-part %_2576)
       (imag-part %_2576))
      (if (< %_2576 '0) (- %_2576) %_2576))))
(define min (void))
(define max (void))
(letrec ((%_2579
           (lambda (%_2584 %_2585 %_2586 %_2587)
             (if (null? %_2586)
               (if (if %_2587 (exact? %_2585) '#f)
                 (exact->inexact %_2585)
                 %_2585)
               (if (%_2584 (car %_2586) %_2585)
                 (%_2579
                   %_2584
                   (car %_2586)
                   (cdr %_2586)
                   ((lambda (%_2588)
                      (if %_2588 %_2588 (inexact? (car %_2586))))
                    %_2587))
                 (%_2579 %_2584 %_2585 (cdr %_2586) %_2587))))))
  (begin
    (set! min
      (lambda (%_2581 . %_2580)
        (if (null? %_2580)
          %_2581
          (%_2579 < %_2581 %_2580 (inexact? %_2581)))))
    (set! max
      (lambda (%_2583 . %_2582)
        (if (null? %_2582)
          %_2583
          (%_2579 > %_2583 %_2582 (inexact? %_2583)))))))
(define negative?
  (lambda (%_2589) (< %_2589 '0)))
(define positive?
  (lambda (%_2590) (> %_2590 '0)))
(define even?
  (lambda (%_2591) (= '0 (modulo %_2591 '2))))
(define odd?
  (lambda (%_2592) (not (even? %_2592))))
(define zero? (lambda (%_2593) (= %_2593 '0)))
(define add1 (lambda (%_2594) (+ %_2594 '1)))
(define sub1 (lambda (%_2595) (- %_2595 '1)))
(define >= (void))
(define <= (void))
((lambda (%_2596 %_2597)
   (begin
     (set! <=
       (%_2596
         (lambda (%_2598 %_2599)
           ((lambda (%_2600)
              (if %_2600 %_2600 (= %_2598 %_2599)))
            (< %_2598 %_2599)))
         %_2597
         '#t))
     (set! >=
       (%_2596
         (lambda (%_2601 %_2602)
           ((lambda (%_2603)
              (if %_2603 %_2603 (= %_2601 %_2602)))
            (> %_2601 %_2602)))
         %_2597
         '#t))))
 (lambda (%_2604 %_2605 %_2606)
   (lambda %_2607
     ((letrec ((%_2608
                 (lambda (%_2609)
                   (if (null? %_2609)
                     %_2606
                     (if (null? (cdr %_2609))
                       %_2606
                       (%_2605
                         (%_2604 (car %_2609) (cadr %_2609))
                         (%_2608 (cdr %_2609))))))))
        %_2608)
      %_2607)))
 (lambda (%_2610 %_2611) (if %_2610 %_2611 '#f)))
((lambda (%_2612)
   (begin
     (set! >= (%_2612 > >=))
     (set! <= (%_2612 < <=))))
 (lambda (%_2613 %_2614)
   (lambda %_2615
     ((lambda (%_2616)
        (if %_2616
          %_2616
          ((lambda (%_2617)
             (if %_2617
               %_2617
               (if ((lambda (%_2618)
                      (if %_2618
                        %_2618
                        (%_2613 (car %_2615) (cadr %_2615))))
                    (= (car %_2615) (cadr %_2615)))
                 (apply %_2614 (cdr %_2615))
                 '#f)))
           (null? (cdr %_2615)))))
      (null? %_2615)))))
(define gcd
  (lambda %_2619
    (if (null? %_2619)
      '0
      (if (null? (cdr %_2619))
        (car %_2619)
        (_gcd (car %_2619) (cadr %_2619))))))
(define lcm
  (lambda %_2620
    (if (null? %_2620)
      '1
      (if (null? (cdr %_2620))
        (car %_2620)
        (_lcm (car %_2620) (cadr %_2620))))))
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
  (lambda %_2621
    (if (null? %_2621)
      '""
      (if (null? (cdr %_2621))
        (car %_2621)
        (apply string-append
               (_string-append (car %_2621) (cadr %_2621))
               (cddr %_2621))))))
(define char-downcase
  ((lambda (%_2622)
     ((lambda (%_2623)
        ((lambda (%_2624)
           ((lambda ()
              (lambda (%_2625)
                ((lambda (%_2626)
                   (if (if (>= %_2626 %_2622) (<= %_2626 %_2623) '#f)
                     (integer->char (+ %_2626 %_2624))
                     %_2625))
                 (char->integer %_2625))))))
         (- (char->integer '#\a) %_2622)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_2627)
     ((lambda (%_2628)
        ((lambda (%_2629)
           ((lambda ()
              (lambda (%_2630)
                ((lambda (%_2631)
                   (if (if (>= %_2631 %_2627) (<= %_2631 %_2628) '#f)
                     (integer->char (- %_2631 %_2629))
                     %_2630))
                 (char->integer %_2630))))))
         (- %_2627 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_2632 %_2633)
    (> (char->integer %_2632) (char->integer %_2633))))
(define char<?
  (lambda (%_2634 %_2635)
    (< (char->integer %_2634) (char->integer %_2635))))
(define char=? eq?)
(define char>=?
  (lambda (%_2636 %_2637)
    ((lambda (%_2638)
       (if %_2638 %_2638 (char=? %_2636 %_2637)))
     (char>? %_2636 %_2637))))
(define char<=?
  (lambda (%_2639 %_2640)
    ((lambda (%_2641)
       (if %_2641 %_2641 (char=? %_2639 %_2640)))
     (char<? %_2639 %_2640))))
(define char-ci>?
  (lambda (%_2642 %_2643)
    (char>?
      (char-downcase %_2642)
      (char-downcase %_2643))))
(define char-ci<?
  (lambda (%_2644 %_2645)
    (char<?
      (char-downcase %_2644)
      (char-downcase %_2645))))
(define char-ci=?
  (lambda (%_2646 %_2647)
    (char=?
      (char-downcase %_2646)
      (char-downcase %_2647))))
(define char-ci>=?
  (lambda (%_2648 %_2649)
    ((lambda (%_2650)
       (if %_2650 %_2650 (char-ci=? %_2648 %_2649)))
     (char-ci>? %_2648 %_2649))))
(define char-ci<=?
  (lambda (%_2651 %_2652)
    ((lambda (%_2653)
       (if %_2653 %_2653 (char-ci=? %_2651 %_2652)))
     (char-ci<? %_2651 %_2652))))
(define char-alphabetic?
  (lambda (%_2654)
    (if (char-ci>=? %_2654 '#\a)
      (char-ci<=? %_2654 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_2655)
    (if (char-ci>=? %_2655 '#\0)
      (char-ci<=? %_2655 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_2656)
    (if (memq %_2656 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_2657)
    (if (char-alphabetic? %_2657)
      (char>? %_2657 '#\a)
      '#f)))
(define char-lower-case?
  (lambda (%_2658)
    (if (char-alphabetic? %_2658)
      (char>? %_2658 '#\Z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
(letrec ((%_2659
           (lambda (%_2664 %_2665 %_2666 %_2667 %_2668)
             (if (< %_2667 %_2668)
               (begin
                 (string-set!
                   %_2665
                   %_2667
                   (%_2666 (string-ref %_2664 %_2667)))
                 (%_2659
                   %_2664
                   %_2665
                   %_2666
                   (+ %_2667 '1)
                   %_2668))
               %_2665))))
  (begin
    (set! string-downcase
      (lambda (%_2660)
        ((lambda (%_2661)
           (%_2659
             %_2660
             %_2661
             char-downcase
             '0
             (string-length %_2660)))
         (make-string (string-length %_2660)))))
    (set! string-upcase
      (lambda (%_2662)
        ((lambda (%_2663)
           (%_2659
             %_2662
             %_2663
             char-upcase
             '0
             (string-length %_2662)))
         (make-string (string-length %_2662)))))))
(define string=? equal?)
(define string<?
  (letrec ((%_2669
             (lambda (%_2672 %_2673)
               (if (null? %_2672)
                 (not (null? %_2673))
                 (if (null? %_2673)
                   '#f
                   ((lambda (%_2674 %_2675)
                      (if (char<? %_2674 %_2675)
                        '#t
                        (if (char>? %_2674 %_2675)
                          '#f
                          (%_2669 (cdr %_2672) (cdr %_2673)))))
                    (car %_2672)
                    (car %_2673)))))))
    (lambda (%_2670 %_2671)
      (%_2669
        (string->list %_2670)
        (string->list %_2671)))))
(define string>?
  (letrec ((%_2676
             (lambda (%_2679 %_2680)
               (if (null? %_2680)
                 (not (null? %_2679))
                 (if (null? %_2679)
                   '#f
                   ((lambda (%_2681 %_2682)
                      (if (char>? %_2681 %_2682)
                        '#t
                        (if (char<? %_2681 %_2682)
                          '#f
                          (%_2676 (cdr %_2679) (cdr %_2680)))))
                    (car %_2679)
                    (car %_2680)))))))
    (lambda (%_2677 %_2678)
      (%_2676
        (string->list %_2677)
        (string->list %_2678)))))
(define string<=?
  (lambda (%_2683 %_2684)
    ((lambda (%_2685)
       (if %_2685 %_2685 (string=? %_2683 %_2684)))
     (string<? %_2683 %_2684))))
(define string>=?
  (lambda (%_2686 %_2687)
    ((lambda (%_2688)
       (if %_2688 %_2688 (string=? %_2686 %_2687)))
     (string>? %_2686 %_2687))))
(define string-ci=?
  (lambda (%_2689 %_2690)
    (string=?
      (string-downcase %_2689)
      (string-downcase %_2690))))
(define string-ci<?
  (lambda (%_2691 %_2692)
    (string<?
      (string-downcase %_2691)
      (string-downcase %_2692))))
(define string-ci>?
  (lambda (%_2693 %_2694)
    (string>?
      (string-downcase %_2693)
      (string-downcase %_2694))))
(define string-ci>=?
  (lambda (%_2695 %_2696)
    (string>=?
      (string-downcase %_2695)
      (string-downcase %_2696))))
(define string-ci<=?
  (lambda (%_2697 %_2698)
    (string<=?
      (string-downcase %_2697)
      (string-downcase %_2698))))
(define substring
  (letrec ((%_2699
             (lambda (%_2704 %_2705 %_2706 %_2707 %_2708)
               (if (< %_2707 %_2708)
                 (begin
                   (string-set!
                     %_2705
                     %_2706
                     (string-ref %_2704 %_2707))
                   (%_2699
                     %_2704
                     %_2705
                     (+ %_2706 '1)
                     (+ %_2707 '1)
                     %_2708))
                 (void)))))
    (lambda (%_2700 %_2701 %_2702)
      ((lambda (%_2703)
         (begin
           (%_2699 %_2700 %_2703 '0 %_2701 %_2702)
           %_2703))
       (make-string (- %_2702 %_2701))))))
(define format
  (lambda (%_2710 . %_2709)
    ((lambda (%_2711)
       ((letrec ((%_2712
                   (lambda (%_2713 %_2714)
                     (if (null? %_2713)
                       (get-output-string %_2711)
                       (if (char=? (car %_2713) '#\~)
                         (if (null? (cdr %_2713))
                           (error 'format '"Incomplete escape sequence")
                           ((lambda (%_2715)
                              (if (memv %_2715 '(#\a))
                                (if (null? %_2714)
                                  (error 'format
                                         '"No value for escape sequence")
                                  (begin
                                    (display (car %_2714) %_2711)
                                    (%_2712 (cddr %_2713) (cdr %_2714))))
                                (if (memv %_2715 '(#\s))
                                  (if (null? %_2714)
                                    (error 'format
                                           '"No value for escape sequence")
                                    (begin
                                      (write (car %_2714) %_2711)
                                      (%_2712 (cddr %_2713) (cdr %_2714))))
                                  (if (memv %_2715 '(#\%))
                                    (begin
                                      (display '#\newline %_2711)
                                      (%_2712 (cddr %_2713) %_2714))
                                    (if (memv %_2715 '(#\~))
                                      (begin
                                        (display '#\~ %_2711)
                                        (%_2712 (cddr %_2713) %_2714))
                                      (error 'format
                                             '"Unrecognized escape sequence"))))))
                            (cadr %_2713)))
                         (begin
                           (display (car %_2713) %_2711)
                           (%_2712 (cdr %_2713) %_2714)))))))
          %_2712)
        (string->list %_2710)
        %_2709))
     (open-output-string))))
(define list-ref
  (lambda (%_2716 %_2717)
    (if (zero? %_2717)
      (car %_2716)
      (list-ref (cdr %_2716) (- %_2717 '1)))))
(define values
  (lambda %_2718
    (call-with-current-continuation
      (lambda (%_2719) (apply %_2719 %_2718)))))
