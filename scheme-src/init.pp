(define for-each
  (lambda (%_473 . %_472)
    (if (null? %_472)
      (error 'for-each
             '"invalid number of arguments to procedure for-each")
      (if (not (null? (car %_472)))
        (begin
          (apply %_473 (map car %_472))
          (apply for-each (cons %_473 (map cdr %_472))))
        (void)))))
(define exit (lambda () '#!eof))
(define eof-object?
  (lambda (%_474) (eq? %_474 '#!eof)))
(define not (lambda (%_475) (if %_475 '#f '#t)))
(define eqv?
  (lambda (%_476 %_477)
    ((lambda (%_478)
       (if %_478
         %_478
         (if (number? %_476)
           (if (number? %_477)
             (if ((lambda (%_479)
                    (if %_479
                      %_479
                      (if (inexact? %_476) (inexact? %_477) '#f)))
                  (if (exact? %_476) (exact? %_477) '#f))
               (= %_476 %_477)
               '#f)
             '#f)
           '#f)))
     (eq? %_476 %_477))))
(define newline
  (lambda %_480
    (apply display (cons '#\newline %_480))))
(define map (void))
((lambda (%_481)
   (begin
     (set! %_481
       ((lambda (%_482)
          (begin
            (set! %_482
              (lambda (%_486 %_487 %_488 %_489)
                (if (null? %_489)
                  %_487
                  (begin
                    (set-cdr! %_488 (cons (%_486 (car %_489)) '()))
                    (%_482 %_486 %_487 (cdr %_488) (cdr %_489))))))
            (lambda (%_483 %_484)
              (if (null? %_484)
                '()
                ((lambda (%_485)
                   (%_482 %_483 %_485 %_485 (cdr %_484)))
                 (cons (%_483 (car %_484)) '()))))))
        #f))
     (set! map %_481)))
 #f)
(define compose
  (lambda %_490
    (if (null? %_490)
      (lambda (%_494) %_494)
      ((lambda (%_491 %_492)
         (lambda (%_493) (%_491 (%_492 %_493))))
       (car %_490)
       (apply compose (cdr %_490))))))
(define compose2
  (lambda (%_495 %_496)
    (lambda (%_497) (%_495 (%_496 %_497)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
((lambda (%_498 %_499)
   (begin
     (set! %_498
       (lambda (%_512 %_513 %_514)
         (if (null? %_514)
           '#f
           (if (%_512 (caar %_514) %_513)
             (car %_514)
             (%_498 %_512 %_513 (cdr %_514))))))
     (set! %_499
       (lambda (%_515 %_516 %_517)
         (if (null? %_517)
           '#f
           (if (%_515 (car %_517) %_516)
             %_517
             (%_499 %_515 %_516 (cdr %_517))))))
     (begin
       (set! assq
         (lambda (%_500 %_501) (%_498 eq? %_500 %_501)))
       (set! assv
         (lambda (%_502 %_503) (%_498 eqv? %_502 %_503)))
       (set! assoc
         (lambda (%_504 %_505) (%_498 equal? %_504 %_505)))
       (set! memq
         (lambda (%_506 %_507) (%_499 eq? %_506 %_507)))
       (set! memv
         (lambda (%_508 %_509) (%_499 eqv? %_508 %_509)))
       (set! member
         (lambda (%_510 %_511) (%_499 equal? %_510 %_511))))))
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
  (lambda (%_518 %_519)
    (if (null? %_518)
      %_519
      (cons (car %_518) (append2 (cdr %_518) %_519)))))
(define append append2)
(define list->string
  (lambda (%_520)
    ((lambda (%_521)
       (begin
         (set! %_521
           (lambda (%_522 %_523 %_524)
             (if (null? %_522)
               %_523
               (begin
                 (string-set! %_523 %_524 (car %_522))
                 (%_521 (cdr %_522) %_523 (+ %_524 '1))))))
         (%_521 %_520 (make-string (length %_520)) '0)))
     #f)))
(define string->list
  ((lambda (%_525)
     (begin
       (set! %_525
         (lambda (%_527 %_528 %_529)
           (if (< %_529 '0)
             %_528
             (%_525 %_527
                    (cons (string-ref %_527 %_529) %_528)
                    (- %_529 '1)))))
       (lambda (%_526)
         (%_525 %_526 '() (- (string-length %_526) '1)))))
   #f))
(define list->vector
  ((lambda (%_530)
     (begin
       (set! %_530
         (lambda (%_532 %_533 %_534)
           (if (null? %_532)
             %_533
             (begin
               (vector-set! %_533 %_534 (car %_532))
               (%_530 (cdr %_532) %_533 (+ %_534 '1))))))
       (lambda (%_531)
         (if (not (circular? %_531))
           (%_530 %_531 (make-vector (length %_531)) '0)
           (error 'list->vector
                  '"cannot convert a circular list"
                  %_531)))))
   #f))
(define vector
  (lambda %_535 (list->vector %_535)))
(define string
  (lambda %_536 (list->string %_536)))
(define detect-os
  (lambda ()
    ((lambda (%_537)
       (if (> (string-length %_537) '3)
         (if (equal? (substring %_537 '0 '3) '"mac")
           'macos
           (if (equal? (substring %_537 '0 '3) '"win")
             'ms-dos
             (if (equal? (substring %_537 '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring %_537 '0 '3) '"uni")
                 'unix
                 (if (equal? (substring %_537 '0 '3) '"lin")
                   'unix
                   (if (equal? (substring %_537 '0 '4) '"os/")
                     'os2
                     (if (equal? (substring %_537 '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase
       (getprop 'os.name '*environment-variables*)))))
(define current-directory (void))
((lambda (%_538 %_539 %_540)
   (begin
     (set! %_538
       (lambda %_555
         (if (null? %_555)
           (getprop 'current-directory '*sisc*)
           (putprop 'current-directory '*sisc* (car %_555)))))
     (set! %_539
       (lambda (%_556)
         (if ((lambda (%_557)
                (if %_557
                  %_557
                  (if (memq (detect-os) '(ms-dos windows))
                    (if (> (string-length %_556) '1)
                      (eq? (string-ref %_556 '1) '#\:)
                      '#f)
                    '#f)))
              (absolute-path? %_556))
           %_556
           (make-path (%_538) %_556))))
     (set! %_540
       (lambda (%_558 %_559)
         (if (eq? (file-type %_558) %_559)
           '#t
           (error 'file-type
                  '"~s is not of type ~s"
                  %_558
                  %_559))))
     ((lambda (%_544 %_543 %_542 %_541)
        (begin
          (set! %_544
            ((lambda (%_545)
               (lambda (%_546) (%_545 (%_539 %_546))))
             load))
          (set! %_543
            ((lambda (%_547)
               (lambda (%_548)
                 ((lambda (%_549)
                    (if (not (memq (file-type %_549) '(no-file file)))
                      (error 'open-output-file
                             '"~s points to a directory"
                             %_549)
                      (%_547 %_549)))
                  (%_539 %_548))))
             open-output-file))
          (set! %_542
            ((lambda (%_550)
               (lambda (%_551)
                 ((lambda (%_552)
                    (begin (%_540 %_552 'file) (%_550 %_552)))
                  (%_539 %_551))))
             open-input-file))
          (set! %_541
            (lambda %_553
              (if (null? %_553)
                (%_538)
                ((lambda (%_554)
                   (begin (%_540 %_554 'directory) (%_538 %_554)))
                 (%_539 (car %_553))))))
          (begin
            (%_538 '".")
            (set! load %_544)
            (set! current-directory %_541)
            (set! open-input-file %_542)
            (set! open-output-file %_543))))
      #f
      #f
      #f
      #f)))
 #f
 #f
 #f)
(define load-module
  (lambda (%_560)
    ((lambda (%_561)
       ((lambda (%_562)
          ((lambda ()
             (for-each
               (lambda (%_563)
                 (putprop
                   %_563
                   '*toplevel*
                   (get-native-library-binding %_561 %_563)))
               %_562))))
        (get-native-library-binding-names %_561)))
     (load-native-library %_560))))
(define reverse
  ((lambda (%_564)
     (begin
       (set! %_564
         (lambda (%_566 %_567)
           (if (null? %_566)
             %_567
             (%_564 (cdr %_566) (cons (car %_566) %_567)))))
       (lambda (%_565) (%_564 %_565 '()))))
   #f))
(define remove
  (lambda (%_568 %_569)
    (if (null? %_569)
      '()
      (if (equal? (car %_569) %_568)
        (remove %_568 (cdr %_569))
        (cons (car %_569) (remove %_568 (cdr %_569)))))))
(define append
  ((lambda (%_570)
     (begin
       (set! %_570
         (lambda (%_573 . %_572)
           (if (null? %_572)
             %_573
             (if (null? %_573)
               (apply %_570 %_572)
               (apply %_570
                      (cons (append2 %_573 (car %_572)) (cdr %_572)))))))
       (lambda %_571
         (if (null? %_571)
           '()
           (if (null? (cdr %_571))
             (car %_571)
             (apply %_570 (cons (car %_571) (cdr %_571))))))))
   #f))
(define map
  ((lambda (%_574 %_575)
     (begin
       (set! %_574 map)
       (set! %_575
         (lambda (%_579 %_580 %_581 %_582)
           (if (null? (car %_580))
             (if (andmap null? %_580)
               %_581
               (error 'map '"lists are not of equal length"))
             ((lambda (%_583 %_584)
                (begin
                  (if (not (null? %_582))
                    (set-cdr! %_582 %_583)
                    (void))
                  (if (null? %_581)
                    (%_575 %_579 %_584 %_583 %_583)
                    (%_575 %_579 %_584 %_581 %_583))))
              (cons (apply %_579 (%_574 car %_580)) '())
              (%_574 cdr %_580)))))
       (lambda (%_578 %_577 . %_576)
         (if (null? %_576)
           (%_574 %_578 %_577)
           (%_575 %_578 (cons %_577 %_576) '() '())))))
   #f
   #f))
(define circular?
  ((lambda (%_585)
     (begin
       (set! %_585
         (lambda (%_587 %_588)
           (if ((lambda (%_590) (if %_590 %_590 (null? %_588)))
                (null? %_587))
             '#f
             (if (if (pair? %_588) (null? (cdr %_588)) '#f)
               '#f
               (if ((lambda (%_589)
                      (if %_589 %_589 (not (pair? (cdr %_588)))))
                    (not (pair? %_588)))
                 '#f
                 (if (eq? %_587 %_588)
                   '#t
                   (%_585 (cdr %_587) (cddr %_588))))))))
       (lambda (%_586)
         (if (pair? %_586) (%_585 %_586 (cdr %_586)) '#f))))
   #f))
(define list?
  ((lambda (%_591)
     (begin
       (set! %_591
         (lambda (%_594 %_595)
           ((lambda (%_596)
              (if %_596
                %_596
                ((lambda (%_597)
                   (if %_597
                     %_597
                     (if (pair? %_595)
                       ((lambda (%_598)
                          (if %_598
                            %_598
                            (if (not (eq? %_594 %_595))
                              (%_591 (cdr %_594) (cddr %_595))
                              '#f)))
                        (null? (cdr %_595)))
                       '#f)))
                 (null? %_595))))
            (null? %_594))))
       (lambda (%_592)
         ((lambda (%_593)
            (if %_593
              %_593
              (if (pair? %_592) (%_591 %_592 (cdr %_592)) '#f)))
          (null? %_592)))))
   #f))
(define expt
  (lambda (%_599 %_600)
    (if (if (integer? %_600) (= %_599 '2) '#f)
      (ashl '1 %_600)
      (((lambda (%_601)
          (begin
            (set! %_601
              (lambda (%_602 %_603 %_604)
                (if (zero? %_602)
                  %_603
                  (%_601 (quotient %_602 '2)
                         (if (odd? %_602) (* %_603 %_604) %_603)
                         (* %_604 %_604)))))
            %_601))
        #f)
       %_600
       '1
       %_599))))
(define modpow
  (lambda (%_605 %_606 %_607)
    ((lambda (%_608)
       (if (= %_606 '1)
         (modulo %_605 %_607)
         (if (even? %_606)
           ((lambda (%_610) (modulo (* %_610 %_610) %_607))
            (modpow %_605 (/ %_606 '2) %_607))
           ((lambda (%_609)
              (begin
                (set! %_609 (modulo (* %_609 %_609) %_607))
                (modulo (* %_605 %_609) %_607)))
            (modpow %_605 (/ (- %_606 '1) '2) %_607)))))
     '0)))
(define integer?
  ((lambda (%_611)
     (lambda (%_612)
       ((lambda (%_613)
          (if %_613
            %_613
            (if (real? %_612) (= (round %_612) %_612) '#f)))
        (%_611 %_612))))
   integer?))
(define real?
  ((lambda (%_614)
     (lambda (%_615) (not (%_614 %_615))))
   complex?))
(define complex? number?)
(define abs
  (lambda (%_616)
    (if (not (real? %_616))
      ((lambda (%_617 %_618)
         (sqrt (+ (* %_617 %_617) (* %_618 %_618))))
       (real-part %_616)
       (imag-part %_616))
      (if (< %_616 '0) (- %_616) %_616))))
(define min (void))
(define max (void))
((lambda (%_619)
   (begin
     (set! %_619
       (lambda (%_622 %_623 %_624 %_625)
         (if (null? %_624)
           (if (if %_625 (exact? %_623) '#f)
             (exact->inexact %_623)
             %_623)
           (if (%_622 (car %_624) %_623)
             (%_619 %_622
                    (car %_624)
                    (cdr %_624)
                    ((lambda (%_626)
                       (if %_626 %_626 (inexact? (car %_624))))
                     %_625))
             (%_619 %_622 %_623 (cdr %_624) %_625)))))
     (begin
       (set! min
         (lambda %_620
           (if (null? %_620)
             '0
             (%_619 <
                    (car %_620)
                    (cdr %_620)
                    (inexact? (car %_620))))))
       (set! max
         (lambda %_621
           (if (null? %_621)
             '0
             (%_619 >
                    (car %_621)
                    (cdr %_621)
                    (inexact? (car %_621)))))))))
 #f)
(define negative? (lambda (%_627) (< %_627 '0)))
(define positive? (lambda (%_628) (> %_628 '0)))
(define even?
  (lambda (%_629) (= '0 (modulo %_629 '2))))
(define odd?
  (lambda (%_630) (not (even? %_630))))
(define zero? (lambda (%_631) (= %_631 '0)))
(define add1 (lambda (%_632) (+ %_632 '1)))
(define sub1 (lambda (%_633) (- %_633 '1)))
(define >= (void))
(define <= (void))
((lambda (%_634 %_635)
   (begin
     (set! <=
       (%_634 (lambda (%_636 %_637)
                ((lambda (%_638) (if %_638 %_638 (= %_636 %_637)))
                 (< %_636 %_637)))
              %_635
              '#t))
     (set! >=
       (%_634 (lambda (%_639 %_640)
                ((lambda (%_641) (if %_641 %_641 (= %_639 %_640)))
                 (> %_639 %_640)))
              %_635
              '#t))))
 (lambda (%_642 %_643 %_644)
   (lambda %_645
     (((lambda (%_646)
         (begin
           (set! %_646
             (lambda (%_647)
               (if (null? %_647)
                 %_644
                 (if (null? (cdr %_647))
                   %_644
                   (%_643 (%_642 (car %_647) (cadr %_647))
                          (%_646 (cdr %_647)))))))
           %_646))
       #f)
      %_645)))
 (lambda (%_648 %_649) (if %_648 %_649 '#f)))
((lambda (%_650)
   (begin
     (set! >= (%_650 > >=))
     (set! <= (%_650 < <=))))
 (lambda (%_651 %_652)
   (lambda %_653
     ((lambda (%_654)
        (if %_654
          %_654
          ((lambda (%_655)
             (if %_655
               %_655
               (if ((lambda (%_656)
                      (if %_656 %_656 (%_651 (car %_653) (cadr %_653))))
                    (= (car %_653) (cadr %_653)))
                 (apply %_652 (cdr %_653))
                 '#f)))
           (null? (cdr %_653)))))
      (null? %_653)))))
(define gcd
  (lambda %_657
    (if (null? %_657)
      '0
      (if (null? (cdr %_657))
        (car %_657)
        (_gcd (car %_657) (cadr %_657))))))
(define lcm
  (lambda %_658
    (if (null? %_658)
      '1
      (if (null? (cdr %_658))
        (car %_658)
        (_lcm (car %_658) (cadr %_658))))))
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
  (lambda %_659
    (if (null? %_659)
      '""
      (if (null? (cdr %_659))
        (car %_659)
        (apply string-append
               (_string-append (car %_659) (cadr %_659))
               (cddr %_659))))))
(define char-downcase
  ((lambda (%_660)
     ((lambda (%_661)
        ((lambda (%_662)
           ((lambda ()
              (lambda (%_663)
                ((lambda (%_664)
                   (if (if (>= %_664 %_660) (<= %_664 %_661) '#f)
                     (integer->char (+ %_664 %_662))
                     %_663))
                 (char->integer %_663))))))
         (- (char->integer '#\a) %_660)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_665)
     ((lambda (%_666)
        ((lambda (%_667)
           ((lambda ()
              (lambda (%_668)
                ((lambda (%_669)
                   (if (if (>= %_669 %_665) (<= %_669 %_666) '#f)
                     (integer->char (- %_669 %_667))
                     %_668))
                 (char->integer %_668))))))
         (- %_665 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_670 %_671)
    (> (char->integer %_670) (char->integer %_671))))
(define char<?
  (lambda (%_672 %_673)
    (< (char->integer %_672) (char->integer %_673))))
(define char=? eq?)
(define char>=?
  (lambda (%_674 %_675)
    ((lambda (%_676)
       (if %_676 %_676 (char=? %_674 %_675)))
     (char>? %_674 %_675))))
(define char<=?
  (lambda (%_677 %_678)
    ((lambda (%_679)
       (if %_679 %_679 (char=? %_677 %_678)))
     (char<? %_677 %_678))))
(define char-ci>?
  (lambda (%_680 %_681)
    (char>?
      (char-downcase %_680)
      (char-downcase %_681))))
(define char-ci<?
  (lambda (%_682 %_683)
    (char<?
      (char-downcase %_682)
      (char-downcase %_683))))
(define char-ci=?
  (lambda (%_684 %_685)
    (char=?
      (char-downcase %_684)
      (char-downcase %_685))))
(define char-ci>=?
  (lambda (%_686 %_687)
    ((lambda (%_688)
       (if %_688 %_688 (char-ci=? %_686 %_687)))
     (char-ci>? %_686 %_687))))
(define char-ci<=?
  (lambda (%_689 %_690)
    ((lambda (%_691)
       (if %_691 %_691 (char-ci=? %_689 %_690)))
     (char-ci<? %_689 %_690))))
(define char-alphabetic?
  (lambda (%_692)
    (if (char-ci>=? %_692 '#\a)
      (char-ci<=? %_692 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_693)
    (if (char-ci>=? %_693 '#\0)
      (char-ci<=? %_693 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_694)
    (if (memq %_694 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_695)
    (if (char-alphabetic? %_695)
      (char<? %_695 '#\a)
      '#f)))
(define char-lower-case?
  (lambda (%_696)
    (if (char-alphabetic? %_696)
      (char>? %_696 '#\z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
((lambda (%_697)
   (begin
     (set! %_697
       (lambda (%_702 %_703 %_704 %_705 %_706)
         (if (< %_705 %_706)
           (begin
             (string-set!
               %_703
               %_705
               (%_704 (string-ref %_702 %_705)))
             (%_697 %_702 %_703 %_704 (+ %_705 '1) %_706))
           %_703)))
     (begin
       (set! string-downcase
         (lambda (%_698)
           ((lambda (%_699)
              (%_697 %_698
                     %_699
                     char-downcase
                     '0
                     (string-length %_698)))
            (make-string (string-length %_698)))))
       (set! string-upcase
         (lambda (%_700)
           ((lambda (%_701)
              (%_697 %_700
                     %_701
                     char-upcase
                     '0
                     (string-length %_700)))
            (make-string (string-length %_700))))))))
 #f)
(define string=? equal?)
(define string<?
  ((lambda (%_707)
     (begin
       (set! %_707
         (lambda (%_710 %_711)
           (if (null? %_710)
             (not (null? %_711))
             (if (null? %_711)
               '#f
               ((lambda (%_712 %_713)
                  (if (char<? %_712 %_713)
                    '#t
                    (if (char>? %_712 %_713)
                      '#f
                      (%_707 (cdr %_710) (cdr %_711)))))
                (car %_710)
                (car %_711))))))
       (lambda (%_708 %_709)
         (%_707 (string->list %_708) (string->list %_709)))))
   #f))
(define string>?
  ((lambda (%_714)
     (begin
       (set! %_714
         (lambda (%_717 %_718)
           (if (null? %_718)
             (not (null? %_717))
             (if (null? %_717)
               '#f
               ((lambda (%_719 %_720)
                  (if (char>? %_719 %_720)
                    '#t
                    (if (char<? %_719 %_720)
                      '#f
                      (%_714 (cdr %_717) (cdr %_718)))))
                (car %_717)
                (car %_718))))))
       (lambda (%_715 %_716)
         (%_714 (string->list %_715) (string->list %_716)))))
   #f))
(define string<=?
  (lambda (%_721 %_722)
    ((lambda (%_723)
       (if %_723 %_723 (string=? %_721 %_722)))
     (string<? %_721 %_722))))
(define string>=?
  (lambda (%_724 %_725)
    ((lambda (%_726)
       (if %_726 %_726 (string=? %_724 %_725)))
     (string>? %_724 %_725))))
(define string-ci=?
  (lambda (%_727 %_728)
    (string=?
      (string-downcase %_727)
      (string-downcase %_728))))
(define string-ci<?
  (lambda (%_729 %_730)
    (string<?
      (string-downcase %_729)
      (string-downcase %_730))))
(define string-ci>?
  (lambda (%_731 %_732)
    (string>?
      (string-downcase %_731)
      (string-downcase %_732))))
(define string-ci>=?
  (lambda (%_733 %_734)
    (string>=?
      (string-downcase %_733)
      (string-downcase %_734))))
(define string-ci<=?
  (lambda (%_735 %_736)
    (string<=?
      (string-downcase %_735)
      (string-downcase %_736))))
(define substring
  ((lambda (%_737)
     (begin
       (set! %_737
         (lambda (%_742 %_743 %_744 %_745 %_746)
           (if (< %_745 %_746)
             (begin
               (string-set!
                 %_743
                 %_744
                 (string-ref %_742 %_745))
               (%_737 %_742
                      %_743
                      (+ %_744 '1)
                      (+ %_745 '1)
                      %_746))
             (void))))
       (lambda (%_738 %_739 %_740)
         ((lambda (%_741)
            (begin (%_737 %_738 %_741 '0 %_739 %_740) %_741))
          (make-string (- %_740 %_739))))))
   #f))
(define format
  ((lambda (%_747)
     (begin
       (set! %_747
         (lambda (%_750 %_751 %_752)
           (if (null? %_750)
             (get-output-string %_752)
             (if (eq? (car %_750) '#\~)
               (begin
                 ((lambda (%_753)
                    (if (memv %_753 '(#\s))
                      (write (car %_751) %_752)
                      (if (memv %_753 '(#\a))
                        (display (car %_751) %_752)
                        (if (memv %_753 '(#\%))
                          (display '#\newline %_752)
                          (if (memv %_753 '(#\~))
                            (display '#\~ %_752)
                            (void))))))
                  (cadr %_750))
                 (%_747 (cddr %_750)
                        (if (not (null? %_751)) (cdr %_751) '())
                        %_752))
               (begin
                 (display (car %_750) %_752)
                 (%_747 (cdr %_750) %_751 %_752))))))
       (lambda (%_749 . %_748)
         (%_747 (string->list %_749)
                %_748
                (open-output-string)))))
   #f))
(define error
  ((lambda (%_754)
     (lambda %_755
       ((lambda (%_756)
          ((lambda (%_757)
             ((lambda (%_758)
                ((lambda ()
                   (if %_756
                     (if %_757
                       (%_754 (format
                                '"Error in ~s: ~a"
                                %_756
                                (apply format (cons %_757 %_758))))
                       (%_754 (format '"Error in ~s." %_756)))
                     (if %_757
                       (%_754 (format
                                '"Error: ~a"
                                (apply format (cons %_757 %_758))))
                       (%_754 '"Error."))))))
              (if (not %_757)
                '#f
                (if (not %_756)
                  (if (not (null? %_755))
                    (if (not (car %_755)) (cddr %_755) (cdr %_755))
                    (cdr %_755))
                  (cddr %_755)))))
           (if (not %_756)
             (if (not (null? %_755))
               (if (not (car %_755)) (cadr %_755) (car %_755))
               '#f)
             (if (not (null? (cdr %_755))) (cadr %_755) '#f))))
        (if (if (not (null? %_755))
              (symbol? (car %_755))
              '#f)
          (car %_755)
          '#f))))
   error))
(define list-ref
  (lambda (%_759 %_760)
    (if (zero? %_760)
      (car %_759)
      (list-ref (cdr %_759) (- %_760 '1)))))
(define iota
  ((lambda (%_761)
     (begin
       (set! %_761
         (lambda (%_763 %_764)
           (if (> %_763 %_764)
             '()
             (cons %_763 (%_761 (+ %_763 '1) %_764)))))
       (lambda (%_762) (%_761 '0 %_762))))
   #f))
(define values
  (lambda %_765
    (call-with-current-continuation
      (lambda (%_766) (apply %_766 %_765)))))
