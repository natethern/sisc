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
  (lambda (%_490 %_491)
    (lambda (%_492) (%_490 (%_491 %_492)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
((lambda (%_493 %_494)
   (begin
     (set! %_493
       (lambda (%_507 %_508 %_509)
         (if (null? %_509)
           '#f
           (if (%_507 (caar %_509) %_508)
             (car %_509)
             (%_493 %_507 %_508 (cdr %_509))))))
     (set! %_494
       (lambda (%_510 %_511 %_512)
         (if (null? %_512)
           '#f
           (if (%_510 (car %_512) %_511)
             %_512
             (%_494 %_510 %_511 (cdr %_512))))))
     (begin
       (set! assq
         (lambda (%_495 %_496) (%_493 eq? %_495 %_496)))
       (set! assv
         (lambda (%_497 %_498) (%_493 eqv? %_497 %_498)))
       (set! assoc
         (lambda (%_499 %_500) (%_493 equal? %_499 %_500)))
       (set! memq
         (lambda (%_501 %_502) (%_494 eq? %_501 %_502)))
       (set! memv
         (lambda (%_503 %_504) (%_494 eqv? %_503 %_504)))
       (set! member
         (lambda (%_505 %_506) (%_494 equal? %_505 %_506))))))
 #f
 #f)
(define cadr (compose car cdr))
(define cdar (compose cdr car))
(define cddr (compose cdr cdr))
(define caar (compose car car))
(define caaar (compose car caar))
(define caadr (compose car cadr))
(define cadar (compose car cdar))
(define caddr (compose car cddr))
(define cdaar (compose cdr caar))
(define cdadr (compose cdr cadr))
(define cddar (compose cdr cdar))
(define cdddr (compose cdr cddr))
(define caaaar (compose car caaar))
(define caaadr (compose car caadr))
(define caadar (compose car cadar))
(define caaddr (compose car caddr))
(define cadaar (compose car cdaar))
(define cadadr (compose car cdadr))
(define caddar (compose car cddar))
(define cadddr (compose car cdddr))
(define cdaaar (compose cdr caaar))
(define cdaadr (compose cdr caadr))
(define cdadar (compose cdr cadar))
(define cdaddr (compose cdr caddr))
(define cddaar (compose cdr cdaar))
(define cddadr (compose cdr cdadr))
(define cdddar (compose cdr cddar))
(define cddddr (compose cdr cdddr))
(define append2
  (lambda (%_513 %_514)
    (if (null? %_513)
      %_514
      (cons (car %_513) (append2 (cdr %_513) %_514)))))
(define append append2)
(define list->string
  (lambda (%_515)
    ((lambda (%_516)
       (begin
         (set! %_516
           (lambda (%_517 %_518 %_519)
             (if (null? %_517)
               %_518
               (begin
                 (string-set! %_518 %_519 (car %_517))
                 (%_516 (cdr %_517) %_518 (+ %_519 '1))))))
         (%_516 %_515 (make-string (length %_515)) '0)))
     #f)))
(define string->list
  ((lambda (%_520)
     (begin
       (set! %_520
         (lambda (%_522 %_523 %_524)
           (if (< %_524 '0)
             %_523
             (%_520 %_522
                    (cons (string-ref %_522 %_524) %_523)
                    (- %_524 '1)))))
       (lambda (%_521)
         (%_520 %_521 '() (- (string-length %_521) '1)))))
   #f))
(define list->vector
  ((lambda (%_525)
     (begin
       (set! %_525
         (lambda (%_527 %_528 %_529)
           (if (null? %_527)
             %_528
             (begin
               (vector-set! %_528 %_529 (car %_527))
               (%_525 (cdr %_527) %_528 (+ %_529 '1))))))
       (lambda (%_526)
         (%_525 %_526 (make-vector (length %_526)) '0))))
   #f))
(define vector
  (lambda %_530 (list->vector %_530)))
(define string
  (lambda %_531 (list->string %_531)))
(define detect-os
  (lambda ()
    ((lambda (%_532)
       (if (> (string-length %_532) '3)
         (if (equal? (substring %_532 '0 '3) '"mac")
           'macos
           (if (equal? (substring %_532 '0 '3) '"win")
             'ms-dos
             (if (equal? (substring %_532 '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring %_532 '0 '3) '"uni")
                 'unix
                 (if (equal? (substring %_532 '0 '3) '"lin")
                   'unix
                   (if (equal? (substring %_532 '0 '4) '"os/")
                     'os2
                     (if (equal? (substring %_532 '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase
       (getprop 'os.name '*environment-variables*)))))
(define current-directory (void))
((lambda (%_533 %_534 %_535)
   (begin
     (set! %_533
       (lambda %_550
         (if (null? %_550)
           (getprop 'current-directory '*sisc*)
           (putprop 'current-directory '*sisc* (car %_550)))))
     (set! %_534
       (lambda (%_551)
         (if ((lambda (%_552)
                (if %_552
                  %_552
                  (if (memq (detect-os) '(ms-dos windows))
                    (if (> (string-length %_551) '1)
                      (eq? (string-ref %_551 '1) '#\:)
                      '#f)
                    '#f)))
              (absolute-path? %_551))
           %_551
           (make-path (%_533) %_551))))
     (set! %_535
       (lambda (%_553 %_554)
         (if (eq? (file-type %_553) %_554)
           '#t
           (error 'file-type
                  '"~s is not of type ~s"
                  %_553
                  %_554))))
     ((lambda (%_539 %_538 %_537 %_536)
        (begin
          (set! %_539
            ((lambda (%_540)
               (lambda (%_541) (%_540 (%_534 %_541))))
             load))
          (set! %_538
            ((lambda (%_542)
               (lambda (%_543)
                 ((lambda (%_544)
                    (if (not (memq (file-type %_544) '(no-file file)))
                      (error 'open-output-file
                             '"~s points to a directory"
                             %_544)
                      (%_542 %_544)))
                  (%_534 %_543))))
             open-output-file))
          (set! %_537
            ((lambda (%_545)
               (lambda (%_546)
                 ((lambda (%_547)
                    (begin (%_535 %_547 'file) (%_545 %_547)))
                  (%_534 %_546))))
             open-input-file))
          (set! %_536
            (lambda %_548
              (if (null? %_548)
                (%_533)
                ((lambda (%_549)
                   (begin (%_535 %_549 'directory) (%_533 %_549)))
                 (%_534 (car %_548))))))
          (begin
            (%_533 '".")
            (set! load %_539)
            (set! current-directory %_536)
            (set! open-input-file %_537)
            (set! open-output-file %_538))))
      #f
      #f
      #f
      #f)))
 #f
 #f
 #f)
(define load-module
  (lambda (%_555)
    ((lambda (%_556)
       ((lambda (%_557)
          ((lambda ()
             (for-each
               (lambda (%_558)
                 (putprop
                   %_558
                   '*toplevel*
                   (get-native-library-binding %_556 %_558)))
               %_557))))
        (get-native-library-binding-names %_556)))
     (load-native-library %_555))))
(define reverse
  ((lambda (%_559)
     (begin
       (set! %_559
         (lambda (%_561 %_562)
           (if (null? %_561)
             %_562
             (%_559 (cdr %_561) (cons (car %_561) %_562)))))
       (lambda (%_560) (%_559 %_560 '()))))
   #f))
(define remove
  (lambda (%_563 %_564)
    (if (null? %_564)
      '()
      (if (equal? (car %_564) %_563)
        (remove %_563 (cdr %_564))
        (cons (car %_564) (remove %_563 (cdr %_564)))))))
(define append
  ((lambda (%_565)
     (begin
       (set! %_565
         (lambda (%_568 . %_567)
           (if (null? %_567)
             %_568
             (if (null? %_568)
               (apply %_565 %_567)
               (apply %_565
                      (cons (append2 %_568 (car %_567)) (cdr %_567)))))))
       (lambda %_566
         (if (null? %_566)
           '()
           (if (null? (cdr %_566))
             (car %_566)
             (apply %_565 (cons (car %_566) (cdr %_566))))))))
   #f))
(define map
  ((lambda (%_569 %_570)
     (begin
       (set! %_569 map)
       (set! %_570
         (lambda (%_574 %_575 %_576 %_577)
           (if (null? (car %_575))
             (if (andmap null? %_575)
               %_576
               (error 'map '"lists are not of equal length"))
             ((lambda (%_578 %_579)
                (begin
                  (if (not (null? %_577))
                    (set-cdr! %_577 %_578)
                    (void))
                  (if (null? %_576)
                    (%_570 %_574 %_579 %_578 %_578)
                    (%_570 %_574 %_579 %_576 %_578))))
              (cons (apply %_574 (%_569 car %_575)) '())
              (%_569 cdr %_575)))))
       (lambda (%_573 %_572 . %_571)
         (if (null? %_571)
           (%_569 %_573 %_572)
           (%_570 %_573 (cons %_572 %_571) '() '())))))
   #f
   #f))
(define circular?
  ((lambda (%_580)
     (begin
       (set! %_580
         (lambda (%_582 %_583)
           (if ((lambda (%_585) (if %_585 %_585 (null? %_583)))
                (null? %_582))
             '#f
             (if (if (pair? %_583) (null? (cdr %_583)) '#f)
               '#f
               (if ((lambda (%_584)
                      (if %_584 %_584 (not (pair? (cdr %_583)))))
                    (not (pair? %_583)))
                 '#f
                 (if (eq? %_582 %_583)
                   '#t
                   (%_580 (cdr %_582) (cddr %_583))))))))
       (lambda (%_581)
         (if (pair? %_581) (%_580 %_581 (cdr %_581)) '#f))))
   #f))
(define list?
  ((lambda (%_586)
     (begin
       (set! %_586
         (lambda (%_589 %_590)
           ((lambda (%_591)
              (if %_591
                %_591
                ((lambda (%_592)
                   (if %_592
                     %_592
                     (if (pair? %_590)
                       ((lambda (%_593)
                          (if %_593
                            %_593
                            (if (not (eq? %_589 %_590))
                              (%_586 (cdr %_589) (cddr %_590))
                              '#f)))
                        (null? (cdr %_590)))
                       '#f)))
                 (null? %_590))))
            (null? %_589))))
       (lambda (%_587)
         ((lambda (%_588)
            (if %_588
              %_588
              (if (pair? %_587) (%_586 %_587 (cdr %_587)) '#f)))
          (null? %_587)))))
   #f))
(define expt
  (lambda (%_594 %_595)
    (if (if (integer? %_595) (= %_594 '2) '#f)
      (ashl '1 %_595)
      (((lambda (%_596)
          (begin
            (set! %_596
              (lambda (%_597 %_598 %_599)
                (if (zero? %_597)
                  %_598
                  (%_596 (quotient %_597 '2)
                         (if (odd? %_597) (* %_598 %_599) %_598)
                         (* %_599 %_599)))))
            %_596))
        #f)
       %_595
       '1
       %_594))))
(define modpow
  (lambda (%_600 %_601 %_602)
    ((lambda (%_603)
       (if (= %_601 '1)
         (modulo %_600 %_602)
         (if (even? %_601)
           ((lambda (%_605) (modulo (* %_605 %_605) %_602))
            (modpow %_600 (/ %_601 '2) %_602))
           ((lambda (%_604)
              (begin
                (set! %_604 (modulo (* %_604 %_604) %_602))
                (modulo (* %_600 %_604) %_602)))
            (modpow %_600 (/ (- %_601 '1) '2) %_602)))))
     '0)))
(define integer?
  ((lambda (%_606)
     (lambda (%_607)
       ((lambda (%_608)
          (if %_608
            %_608
            (if (real? %_607) (= (round %_607) %_607) '#f)))
        (%_606 %_607))))
   integer?))
(define real?
  ((lambda (%_609)
     (lambda (%_610) (not (%_609 %_610))))
   complex?))
(define complex? number?)
(define abs
  (lambda (%_611)
    (if (not (real? %_611))
      ((lambda (%_612 %_613)
         (sqrt (+ (* %_612 %_612) (* %_613 %_613))))
       (real-part %_611)
       (imag-part %_611))
      (if (< %_611 '0) (- %_611) %_611))))
(define min (void))
(define max (void))
((lambda (%_614)
   (begin
     (set! %_614
       (lambda (%_617 %_618 %_619 %_620)
         (if (null? %_619)
           (if (if %_620 (exact? %_618) '#f)
             (exact->inexact %_618)
             %_618)
           (if (%_617 (car %_619) %_618)
             (%_614 %_617
                    (car %_619)
                    (cdr %_619)
                    ((lambda (%_621)
                       (if %_621 %_621 (inexact? (car %_619))))
                     %_620))
             (%_614 %_617 %_618 (cdr %_619) %_620)))))
     (begin
       (set! min
         (lambda %_615
           (if (null? %_615)
             '0
             (%_614 <
                    (car %_615)
                    (cdr %_615)
                    (inexact? (car %_615))))))
       (set! max
         (lambda %_616
           (if (null? %_616)
             '0
             (%_614 >
                    (car %_616)
                    (cdr %_616)
                    (inexact? (car %_616)))))))))
 #f)
(define negative? (lambda (%_622) (< %_622 '0)))
(define positive? (lambda (%_623) (> %_623 '0)))
(define even?
  (lambda (%_624) (= '0 (modulo %_624 '2))))
(define odd?
  (lambda (%_625) (not (even? %_625))))
(define zero? (lambda (%_626) (= %_626 '0)))
(define >= (void))
(define <= (void))
((lambda (%_627 %_628)
   (begin
     (set! <=
       (%_627 (lambda (%_629 %_630)
                ((lambda (%_631) (if %_631 %_631 (= %_629 %_630)))
                 (< %_629 %_630)))
              %_628
              '#t))
     (set! >=
       (%_627 (lambda (%_632 %_633)
                ((lambda (%_634) (if %_634 %_634 (= %_632 %_633)))
                 (> %_632 %_633)))
              %_628
              '#t))))
 (lambda (%_635 %_636 %_637)
   (lambda %_638
     (((lambda (%_639)
         (begin
           (set! %_639
             (lambda (%_640)
               (if (null? %_640)
                 %_637
                 (if (null? (cdr %_640))
                   %_637
                   (%_636 (%_635 (car %_640) (cadr %_640))
                          (%_639 (cdr %_640)))))))
           %_639))
       #f)
      %_638)))
 (lambda (%_641 %_642) (if %_641 %_642 '#f)))
((lambda (%_643)
   (begin
     (set! >= (%_643 > >=))
     (set! <= (%_643 < <=))))
 (lambda (%_644 %_645)
   (lambda %_646
     ((lambda (%_647)
        (if %_647
          %_647
          ((lambda (%_648)
             (if %_648
               %_648
               (if ((lambda (%_649)
                      (if %_649 %_649 (%_644 (car %_646) (cadr %_646))))
                    (= (car %_646) (cadr %_646)))
                 (apply %_645 (cdr %_646))
                 '#f)))
           (null? (cdr %_646)))))
      (null? %_646)))))
(define gcd
  (lambda %_650
    (if (null? %_650)
      '0
      (if (null? (cdr %_650))
        (car %_650)
        (_gcd (car %_650) (cadr %_650))))))
(define lcm
  (lambda %_651
    (if (null? %_651)
      '1
      (if (null? (cdr %_651))
        (car %_651)
        (_lcm (car %_651) (cadr %_651))))))
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
  (lambda %_652
    (if (null? %_652)
      '""
      (if (null? (cdr %_652))
        (car %_652)
        (apply string-append
               (_string-append (car %_652) (cadr %_652))
               (cddr %_652))))))
(define char-downcase
  ((lambda (%_653)
     ((lambda (%_654)
        ((lambda (%_655)
           ((lambda ()
              (lambda (%_656)
                ((lambda (%_657)
                   (if (if (>= %_657 %_653) (<= %_657 %_654) '#f)
                     (integer->char (+ %_657 %_655))
                     %_656))
                 (char->integer %_656))))))
         (- (char->integer '#\a) %_653)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_658)
     ((lambda (%_659)
        ((lambda (%_660)
           ((lambda ()
              (lambda (%_661)
                ((lambda (%_662)
                   (if (if (>= %_662 %_658) (<= %_662 %_659) '#f)
                     (integer->char (- %_662 %_660))
                     %_661))
                 (char->integer %_661))))))
         (- %_658 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_663 %_664)
    (> (char->integer %_663) (char->integer %_664))))
(define char<?
  (lambda (%_665 %_666)
    (< (char->integer %_665) (char->integer %_666))))
(define char=? eq?)
(define char>=?
  (lambda (%_667 %_668)
    ((lambda (%_669)
       (if %_669 %_669 (char=? %_667 %_668)))
     (char>? %_667 %_668))))
(define char<=?
  (lambda (%_670 %_671)
    ((lambda (%_672)
       (if %_672 %_672 (char=? %_670 %_671)))
     (char<? %_670 %_671))))
(define char-ci>?
  (lambda (%_673 %_674)
    (char>?
      (char-downcase %_673)
      (char-downcase %_674))))
(define char-ci<?
  (lambda (%_675 %_676)
    (char<?
      (char-downcase %_675)
      (char-downcase %_676))))
(define char-ci=?
  (lambda (%_677 %_678)
    (char=?
      (char-downcase %_677)
      (char-downcase %_678))))
(define char-ci>=?
  (lambda (%_679 %_680)
    ((lambda (%_681)
       (if %_681 %_681 (char-ci=? %_679 %_680)))
     (char-ci>? %_679 %_680))))
(define char-ci<=?
  (lambda (%_682 %_683)
    ((lambda (%_684)
       (if %_684 %_684 (char-ci=? %_682 %_683)))
     (char-ci<? %_682 %_683))))
(define char-alphabetic?
  (lambda (%_685)
    (if (char-ci>=? %_685 '#\a)
      (char-ci<=? %_685 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_686)
    (if (char-ci>=? %_686 '#\0)
      (char-ci<=? %_686 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_687)
    (if (memq %_687 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_688)
    (if (char-alphabetic? %_688) (char<? '#\a) '#f)))
(define char-lower-case?
  (lambda (%_689)
    (if (char-alphabetic? %_689) (char>? '#\z) '#f)))
(define string-downcase (void))
(define string-upcase (void))
((lambda (%_690)
   (begin
     (set! %_690
       (lambda (%_695 %_696 %_697 %_698 %_699)
         (if (< %_698 %_699)
           (begin
             (string-set!
               %_696
               %_698
               (%_697 (string-ref %_695 %_698)))
             (%_690 %_695 %_696 %_697 (+ %_698 '1) %_699))
           %_696)))
     (begin
       (set! string-downcase
         (lambda (%_691)
           ((lambda (%_692)
              (%_690 %_691
                     %_692
                     char-downcase
                     '0
                     (string-length %_691)))
            (make-string (string-length %_691)))))
       (set! string-upcase
         (lambda (%_693)
           ((lambda (%_694)
              (%_690 %_693
                     %_694
                     char-upcase
                     '0
                     (string-length %_693)))
            (make-string (string-length %_693))))))))
 #f)
(define string=? equal?)
(define string<?
  ((lambda (%_700)
     (begin
       (set! %_700
         (lambda (%_703 %_704)
           (if (null? %_703)
             (not (null? %_704))
             (if (null? %_704)
               '#f
               ((lambda (%_705 %_706)
                  (if (char<? %_705 %_706)
                    '#t
                    (if (char>? %_705 %_706)
                      '#f
                      (%_700 (cdr %_703) (cdr %_704)))))
                (car %_703)
                (car %_704))))))
       (lambda (%_701 %_702)
         (%_700 (string->list %_701) (string->list %_702)))))
   #f))
(define string>?
  ((lambda (%_707)
     (begin
       (set! %_707
         (lambda (%_710 %_711)
           (if (null? %_711)
             (not (null? %_710))
             (if (null? %_710)
               '#f
               ((lambda (%_712 %_713)
                  (if (char>? %_712 %_713)
                    '#t
                    (if (char<? %_712 %_713)
                      '#f
                      (%_707 (cdr %_710) (cdr %_711)))))
                (car %_710)
                (car %_711))))))
       (lambda (%_708 %_709)
         (%_707 (string->list %_708) (string->list %_709)))))
   #f))
(define string<=?
  (lambda (%_714 %_715)
    ((lambda (%_716)
       (if %_716 %_716 (string=? %_714 %_715)))
     (string<? %_714 %_715))))
(define string>=?
  (lambda (%_717 %_718)
    ((lambda (%_719)
       (if %_719 %_719 (string=? %_717 %_718)))
     (string>? %_717 %_718))))
(define string-ci=?
  (lambda (%_720 %_721)
    (string=?
      (string-downcase %_720)
      (string-downcase %_721))))
(define string-ci<?
  (lambda (%_722 %_723)
    (string<?
      (string-downcase %_722)
      (string-downcase %_723))))
(define string-ci>?
  (lambda (%_724 %_725)
    (string>?
      (string-downcase %_724)
      (string-downcase %_725))))
(define string-ci>=?
  (lambda (%_726 %_727)
    (string>=?
      (string-downcase %_726)
      (string-downcase %_727))))
(define string-ci<=?
  (lambda (%_728 %_729)
    (string<=?
      (string-downcase %_728)
      (string-downcase %_729))))
(define substring
  ((lambda (%_730)
     (begin
       (set! %_730
         (lambda (%_735 %_736 %_737 %_738 %_739)
           (if (< %_738 %_739)
             (begin
               (string-set!
                 %_736
                 %_737
                 (string-ref %_735 %_738))
               (%_730 %_735
                      %_736
                      (+ %_737 '1)
                      (+ %_738 '1)
                      %_739))
             (void))))
       (lambda (%_731 %_732 %_733)
         ((lambda (%_734)
            (begin (%_730 %_731 %_734 '0 %_732 %_733) %_734))
          (make-string (- %_733 %_732))))))
   #f))
(define format
  ((lambda (%_740)
     (begin
       (set! %_740
         (lambda (%_743 %_744 %_745)
           (if (null? %_743)
             (get-output-string %_745)
             (if (eq? (car %_743) '#\~)
               (begin
                 ((lambda (%_746)
                    (if (memv %_746 '(#\s))
                      (write (car %_744) %_745)
                      (if (memv %_746 '(#\a))
                        (display (car %_744) %_745)
                        (if (memv %_746 '(#\a))
                          (write-char (car %_744) %_745)
                          (if (memv %_746 '(#\%))
                            (display '#\newline %_745)
                            (if (memv %_746 '(#\~))
                              (display '#\~ %_745)
                              (void)))))))
                  (cadr %_743))
                 (%_740 (cddr %_743)
                        (if (not (null? %_744)) (cdr %_744) '())
                        %_745))
               (begin
                 (display (car %_743) %_745)
                 (%_740 (cdr %_743) %_744 %_745))))))
       (lambda (%_742 . %_741)
         (%_740 (string->list %_742)
                %_741
                (open-output-string)))))
   #f))
(define error
  ((lambda (%_747)
     (lambda %_748
       ((lambda (%_749)
          ((lambda (%_750)
             ((lambda (%_751)
                ((lambda ()
                   (if %_749
                     (if %_750
                       (%_747 (format
                                '"Error in ~s: ~a"
                                %_749
                                (apply format (cons %_750 %_751))))
                       (%_747 (format '"Error in ~s." %_749)))
                     (if %_750
                       (%_747 (format
                                '"Error: ~a"
                                (apply format (cons %_750 %_751))))
                       (%_747 '"Error."))))))
              (if (not %_750)
                '#f
                (if (not %_749) (cdr %_748) (cddr %_748)))))
           (if (not %_749)
             (if (not (null? %_748))
               (if (not (car %_748)) (cadr %_748) (car %_748))
               '#f)
             (if (not (null? (cdr %_748))) (cadr %_748) '#f))))
        (if (if (not (null? %_748))
              (symbol? (car %_748))
              '#f)
          (car %_748)
          '#f))))
   error))
(define list-ref
  (lambda (%_752 %_753)
    (if (zero? %_753)
      (car %_752)
      (list-ref (cdr %_752) (- %_753 '1)))))
(define iota
  ((lambda (%_754)
     (begin
       (set! %_754
         (lambda (%_756 %_757)
           (if (> %_756 %_757)
             '()
             (cons %_756 (%_754 (+ %_756 '1) %_757)))))
       (lambda (%_755) (%_754 '0 %_755))))
   #f))
(define values
  (lambda %_758
    (call-with-current-continuation
      (lambda (%_759) (apply %_759 %_758)))))
(if (not (getprop 'lite '*sisc*))
  (for-each load-module '("sisc.modules.SNative"))
  (void))
