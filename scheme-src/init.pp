(define for-each
  (lambda (%_349 . %_348)
    (if (null? %_348)
      (error 'for-each
             '"invalid number of arguments to procedure for-each")
      (if (not (null? (car %_348)))
        (begin
          (apply %_349 (map car %_348))
          (apply for-each (cons %_349 (map cdr %_348))))
        (void)))))
(define exit (lambda () '#!eof))
(define eof-object?
  (lambda (%_350) (eq? %_350 '#!eof)))
(define not (lambda (%_351) (if %_351 '#f '#t)))
(define eqv?
  (lambda (%_352 %_353)
    ((lambda (%_354)
       (if %_354
         %_354
         (if (number? %_352)
           (if (number? %_353)
             (if ((lambda (%_355)
                    (if %_355
                      %_355
                      (if (inexact? %_352) (inexact? %_353) '#f)))
                  (if (exact? %_352) (exact? %_353) '#f))
               (= %_352 %_353)
               '#f)
             '#f)
           '#f)))
     (eq? %_352 %_353))))
(define newline
  (lambda %_356
    (apply display (cons '#\newline %_356))))
(define map (void))
((lambda (%_357)
   (begin
     (set! %_357
       ((lambda (%_358)
          (begin
            (set! %_358
              (lambda (%_362 %_363 %_364 %_365)
                (if (null? %_365)
                  %_363
                  (begin
                    (set-cdr! %_364 (cons (%_362 (car %_365)) '()))
                    (%_358 %_362 %_363 (cdr %_364) (cdr %_365))))))
            (lambda (%_359 %_360)
              (if (null? %_360)
                '()
                ((lambda (%_361)
                   (%_358 %_359 %_361 %_361 (cdr %_360)))
                 (cons (%_359 (car %_360)) '()))))))
        #f))
     (set! map %_357)))
 #f)
(define compose
  (lambda (%_366 %_367)
    (lambda (%_368) (%_366 (%_367 %_368)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
((lambda (%_369 %_370)
   (begin
     (set! %_369
       (lambda (%_383 %_384 %_385)
         (if (null? %_385)
           '#f
           (if (%_383 (caar %_385) %_384)
             (car %_385)
             (%_369 %_383 %_384 (cdr %_385))))))
     (set! %_370
       (lambda (%_386 %_387 %_388)
         (if (null? %_388)
           '#f
           (if (%_386 (car %_388) %_387)
             %_388
             (%_370 %_386 %_387 (cdr %_388))))))
     (begin
       (set! assq
         (lambda (%_371 %_372) (%_369 eq? %_371 %_372)))
       (set! assv
         (lambda (%_373 %_374) (%_369 eqv? %_373 %_374)))
       (set! assoc
         (lambda (%_375 %_376) (%_369 equal? %_375 %_376)))
       (set! memq
         (lambda (%_377 %_378) (%_370 eq? %_377 %_378)))
       (set! memv
         (lambda (%_379 %_380) (%_370 eqv? %_379 %_380)))
       (set! member
         (lambda (%_381 %_382) (%_370 equal? %_381 %_382))))))
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
  (lambda (%_389 %_390)
    (if (null? %_389)
      %_390
      (cons (car %_389) (append2 (cdr %_389) %_390)))))
(define append append2)
(define list->string
  (lambda (%_391)
    ((lambda (%_392)
       (begin
         (set! %_392
           (lambda (%_393 %_394 %_395)
             (if (null? %_393)
               %_394
               (begin
                 (string-set! %_394 %_395 (car %_393))
                 (%_392 (cdr %_393) %_394 (+ %_395 '1))))))
         (%_392 %_391 (make-string (length %_391)) '0)))
     #f)))
(define string->list
  ((lambda (%_396)
     (begin
       (set! %_396
         (lambda (%_398 %_399 %_400)
           (if (< %_400 '0)
             %_399
             (%_396 %_398
                    (cons (string-ref %_398 %_400) %_399)
                    (- %_400 '1)))))
       (lambda (%_397)
         (%_396 %_397 '() (- (string-length %_397) '1)))))
   #f))
(define list->vector
  ((lambda (%_401)
     (begin
       (set! %_401
         (lambda (%_403 %_404 %_405)
           (if (null? %_403)
             %_404
             (begin
               (vector-set! %_404 %_405 (car %_403))
               (%_401 (cdr %_403) %_404 (+ %_405 '1))))))
       (lambda (%_402)
         (%_401 %_402 (make-vector (length %_402)) '0))))
   #f))
(define vector
  (lambda %_406 (list->vector %_406)))
(define string
  (lambda %_407 (list->string %_407)))
(define detect-os
  (lambda ()
    ((lambda (%_408)
       (if (> (string-length %_408) '3)
         (if (equal? (substring %_408 '0 '3) '"mac")
           'macos
           (if (equal? (substring %_408 '0 '3) '"win")
             'ms-dos
             (if (equal? (substring %_408 '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring %_408 '0 '3) '"uni")
                 'unix
                 (if (equal? (substring %_408 '0 '3) '"lin")
                   'unix
                   (if (equal? (substring %_408 '0 '4) '"os/")
                     'os2
                     (if (equal? (substring %_408 '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase
       (getprop 'os.name '*environment-variables*)))))
(define current-directory (void))
((lambda (%_409 %_410 %_411)
   (begin
     (set! %_409
       (lambda %_426
         (if (null? %_426)
           (getprop 'current-directory '*sisc*)
           (putprop 'current-directory '*sisc* (car %_426)))))
     (set! %_410
       (lambda (%_427)
         (if ((lambda (%_428)
                (if %_428
                  %_428
                  (if (memq (detect-os) '(ms-dos windows))
                    (if (> (string-length %_427) '1)
                      (eq? (string-ref %_427 '1) '#\:)
                      '#f)
                    '#f)))
              (absolute-path? %_427))
           %_427
           (make-path (%_409) %_427))))
     (set! %_411
       (lambda (%_429 %_430)
         (if (eq? (file-type %_429) %_430)
           '#t
           (error 'file-type
                  '"~s is not of type ~s"
                  %_429
                  %_430))))
     ((lambda (%_415 %_414 %_413 %_412)
        (begin
          (set! %_415
            ((lambda (%_416)
               (lambda (%_417) (%_416 (%_410 %_417))))
             load))
          (set! %_414
            ((lambda (%_418)
               (lambda (%_419)
                 ((lambda (%_420)
                    (if (not (memq (file-type %_420) '(no-file file)))
                      (error 'open-output-file
                             '"~s points to a directory"
                             %_420)
                      (%_418 %_420)))
                  (%_410 %_419))))
             open-output-file))
          (set! %_413
            ((lambda (%_421)
               (lambda (%_422)
                 ((lambda (%_423)
                    (begin (%_411 %_423 'file) (%_421 %_423)))
                  (%_410 %_422))))
             open-input-file))
          (set! %_412
            (lambda %_424
              (if (null? %_424)
                (%_409)
                ((lambda (%_425)
                   (begin (%_411 %_425 'directory) (%_409 %_425)))
                 (%_410 (car %_424))))))
          (begin
            (%_409 '".")
            (set! load %_415)
            (set! current-directory %_412)
            (set! open-input-file %_413)
            (set! open-output-file %_414))))
      #f
      #f
      #f
      #f)))
 #f
 #f
 #f)
(define load-module
  (lambda (%_431)
    ((lambda (%_432)
       ((lambda (%_433)
          ((lambda ()
             (for-each
               (lambda (%_434)
                 (putprop
                   %_434
                   '*toplevel*
                   (get-native-library-binding %_432 %_434)))
               %_433))))
        (get-native-library-binding-names %_432)))
     (load-native-library %_431))))
(define reverse
  ((lambda (%_435)
     (begin
       (set! %_435
         (lambda (%_437 %_438)
           (if (null? %_437)
             %_438
             (%_435 (cdr %_437) (cons (car %_437) %_438)))))
       (lambda (%_436) (%_435 %_436 '()))))
   #f))
(define remove
  (lambda (%_439 %_440)
    (if (null? %_440)
      '()
      (if (equal? (car %_440) %_439)
        (remove %_439 (cdr %_440))
        (cons (car %_440) (remove %_439 (cdr %_440)))))))
(define append
  ((lambda (%_441)
     (begin
       (set! %_441
         (lambda (%_444 . %_443)
           (if (null? %_443)
             %_444
             (if (null? %_444)
               (apply %_441 %_443)
               (apply %_441
                      (cons (append2 %_444 (car %_443)) (cdr %_443)))))))
       (lambda %_442
         (if (null? %_442)
           '()
           (if (null? (cdr %_442))
             (car %_442)
             (apply %_441 (cons (car %_442) (cdr %_442))))))))
   #f))
(define map
  ((lambda (%_445 %_446)
     (begin
       (set! %_445 map)
       (set! %_446
         (lambda (%_450 %_451 %_452 %_453)
           (if (null? (car %_451))
             (if (andmap null? %_451)
               %_452
               (error 'map '"lists are not of equal length"))
             ((lambda (%_454 %_455)
                (begin
                  (if (not (null? %_453))
                    (set-cdr! %_453 %_454)
                    (void))
                  (if (null? %_452)
                    (%_446 %_450 %_455 %_454 %_454)
                    (%_446 %_450 %_455 %_452 %_454))))
              (cons (apply %_450 (%_445 car %_451)) '())
              (%_445 cdr %_451)))))
       (lambda (%_449 %_448 . %_447)
         (if (null? %_447)
           (%_445 %_449 %_448)
           (%_446 %_449 (cons %_448 %_447) '() '())))))
   #f
   #f))
(define circular?
  ((lambda (%_456)
     (begin
       (set! %_456
         (lambda (%_458 %_459)
           (if ((lambda (%_461) (if %_461 %_461 (null? %_459)))
                (null? %_458))
             '#f
             (if (if (pair? %_459) (null? (cdr %_459)) '#f)
               '#f
               (if ((lambda (%_460)
                      (if %_460 %_460 (not (pair? (cdr %_459)))))
                    (not (pair? %_459)))
                 '#f
                 (if (eq? %_458 %_459)
                   '#t
                   (%_456 (cdr %_458) (cddr %_459))))))))
       (lambda (%_457)
         (if (pair? %_457) (%_456 %_457 (cdr %_457)) '#f))))
   #f))
(define list?
  ((lambda (%_462)
     (begin
       (set! %_462
         (lambda (%_465 %_466)
           ((lambda (%_467)
              (if %_467
                %_467
                ((lambda (%_468)
                   (if %_468
                     %_468
                     (if (pair? %_466)
                       ((lambda (%_469)
                          (if %_469
                            %_469
                            (if (not (eq? %_465 %_466))
                              (%_462 (cdr %_465) (cddr %_466))
                              '#f)))
                        (null? (cdr %_466)))
                       '#f)))
                 (null? %_466))))
            (null? %_465))))
       (lambda (%_463)
         ((lambda (%_464)
            (if %_464
              %_464
              (if (pair? %_463) (%_462 %_463 (cdr %_463)) '#f)))
          (null? %_463)))))
   #f))
(define expt
  (lambda (%_470 %_471)
    (if (if (integer? %_471) (= %_470 '2) '#f)
      (ashl '1 %_471)
      (((lambda (%_472)
          (begin
            (set! %_472
              (lambda (%_473 %_474 %_475)
                (if (zero? %_473)
                  %_474
                  (%_472 (quotient %_473 '2)
                         (if (odd? %_473) (* %_474 %_475) %_474)
                         (* %_475 %_475)))))
            %_472))
        #f)
       %_471
       '1
       %_470))))
(define modpow
  (lambda (%_476 %_477 %_478)
    ((lambda (%_479)
       (if (= %_477 '1)
         (modulo %_476 %_478)
         (if (even? %_477)
           ((lambda (%_481) (modulo (* %_481 %_481) %_478))
            (modpow %_476 (/ %_477 '2) %_478))
           ((lambda (%_480)
              (begin
                (set! %_480 (modulo (* %_480 %_480) %_478))
                (modulo (* %_476 %_480) %_478)))
            (modpow %_476 (/ (- %_477 '1) '2) %_478)))))
     '0)))
(define integer?
  ((lambda (%_482)
     (lambda (%_483)
       ((lambda (%_484)
          (if %_484
            %_484
            (if (real? %_483) (= (round %_483) %_483) '#f)))
        (%_482 %_483))))
   integer?))
(define real?
  ((lambda (%_485)
     (lambda (%_486) (not (%_485 %_486))))
   complex?))
(define complex? number?)
(define abs
  (lambda (%_487)
    (if (not (real? %_487))
      ((lambda (%_488 %_489)
         (sqrt (+ (* %_488 %_488) (* %_489 %_489))))
       (real-part %_487)
       (imag-part %_487))
      (if (< %_487 '0) (- %_487) %_487))))
(define min (void))
(define max (void))
((lambda (%_490)
   (begin
     (set! %_490
       (lambda (%_493 %_494 %_495 %_496)
         (if (null? %_495)
           (if (if %_496 (exact? %_494) '#f)
             (exact->inexact %_494)
             %_494)
           (if (%_493 (car %_495) %_494)
             (%_490 %_493
                    (car %_495)
                    (cdr %_495)
                    ((lambda (%_497)
                       (if %_497 %_497 (inexact? (car %_495))))
                     %_496))
             (%_490 %_493 %_494 (cdr %_495) %_496)))))
     (begin
       (set! min
         (lambda %_491
           (if (null? %_491)
             '0
             (%_490 <
                    (car %_491)
                    (cdr %_491)
                    (inexact? (car %_491))))))
       (set! max
         (lambda %_492
           (if (null? %_492)
             '0
             (%_490 >
                    (car %_492)
                    (cdr %_492)
                    (inexact? (car %_492)))))))))
 #f)
(define negative? (lambda (%_498) (< %_498 '0)))
(define positive? (lambda (%_499) (> %_499 '0)))
(define even?
  (lambda (%_500) (= '0 (modulo %_500 '2))))
(define odd?
  (lambda (%_501) (not (even? %_501))))
(define zero? (lambda (%_502) (= %_502 '0)))
(define >= (void))
(define <= (void))
((lambda (%_503 %_504)
   (begin
     (set! <=
       (%_503 (lambda (%_505 %_506)
                ((lambda (%_507) (if %_507 %_507 (= %_505 %_506)))
                 (< %_505 %_506)))
              %_504
              '#t))
     (set! >=
       (%_503 (lambda (%_508 %_509)
                ((lambda (%_510) (if %_510 %_510 (= %_508 %_509)))
                 (> %_508 %_509)))
              %_504
              '#t))))
 (lambda (%_511 %_512 %_513)
   (lambda %_514
     (((lambda (%_515)
         (begin
           (set! %_515
             (lambda (%_516)
               (if (null? %_516)
                 %_513
                 (if (null? (cdr %_516))
                   %_513
                   (%_512 (%_511 (car %_516) (cadr %_516))
                          (%_515 (cdr %_516)))))))
           %_515))
       #f)
      %_514)))
 (lambda (%_517 %_518) (if %_517 %_518 '#f)))
((lambda (%_519)
   (begin
     (set! >= (%_519 > >=))
     (set! <= (%_519 < <=))))
 (lambda (%_520 %_521)
   (lambda %_522
     ((lambda (%_523)
        (if %_523
          %_523
          ((lambda (%_524)
             (if %_524
               %_524
               (if ((lambda (%_525)
                      (if %_525 %_525 (%_520 (car %_522) (cadr %_522))))
                    (= (car %_522) (cadr %_522)))
                 (apply %_521 (cdr %_522))
                 '#f)))
           (null? (cdr %_522)))))
      (null? %_522)))))
(define gcd
  (lambda %_526
    (if (null? %_526)
      '0
      (if (null? (cdr %_526))
        (car %_526)
        (_gcd (car %_526) (cadr %_526))))))
(define lcm
  (lambda %_527
    (if (null? %_527)
      '1
      (if (null? (cdr %_527))
        (car %_527)
        (_lcm (car %_527) (cadr %_527))))))
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
  (lambda %_528
    (if (null? %_528)
      '""
      (if (null? (cdr %_528))
        (car %_528)
        (apply string-append
               (_string-append (car %_528) (cadr %_528))
               (cddr %_528))))))
(define char-downcase
  ((lambda (%_529)
     ((lambda (%_530)
        ((lambda (%_531)
           ((lambda ()
              (lambda (%_532)
                ((lambda (%_533)
                   (if (if (>= %_533 %_529) (<= %_533 %_530) '#f)
                     (integer->char (+ %_533 %_531))
                     %_532))
                 (char->integer %_532))))))
         (- (char->integer '#\a) %_529)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_534)
     ((lambda (%_535)
        ((lambda (%_536)
           ((lambda ()
              (lambda (%_537)
                ((lambda (%_538)
                   (if (if (>= %_538 %_534) (<= %_538 %_535) '#f)
                     (integer->char (- %_538 %_536))
                     %_537))
                 (char->integer %_537))))))
         (- %_534 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_539 %_540)
    (> (char->integer %_539) (char->integer %_540))))
(define char<?
  (lambda (%_541 %_542)
    (< (char->integer %_541) (char->integer %_542))))
(define char=? eq?)
(define char>=?
  (lambda (%_543 %_544)
    ((lambda (%_545)
       (if %_545 %_545 (char=? %_543 %_544)))
     (char>? %_543 %_544))))
(define char<=?
  (lambda (%_546 %_547)
    ((lambda (%_548)
       (if %_548 %_548 (char=? %_546 %_547)))
     (char<? %_546 %_547))))
(define char-ci>?
  (lambda (%_549 %_550)
    (char>?
      (char-downcase %_549)
      (char-downcase %_550))))
(define char-ci<?
  (lambda (%_551 %_552)
    (char<?
      (char-downcase %_551)
      (char-downcase %_552))))
(define char-ci=?
  (lambda (%_553 %_554)
    (char=?
      (char-downcase %_553)
      (char-downcase %_554))))
(define char-ci>=?
  (lambda (%_555 %_556)
    ((lambda (%_557)
       (if %_557 %_557 (char-ci=? %_555 %_556)))
     (char-ci>? %_555 %_556))))
(define char-ci<=?
  (lambda (%_558 %_559)
    ((lambda (%_560)
       (if %_560 %_560 (char-ci=? %_558 %_559)))
     (char-ci<? %_558 %_559))))
(define char-alphabetic?
  (lambda (%_561)
    (if (char-ci>=? %_561 '#\a)
      (char-ci<=? %_561 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_562)
    (if (char-ci>=? %_562 '#\0)
      (char-ci<=? %_562 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_563)
    (if (memq %_563 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_564)
    (if (char-alphabetic? %_564) (char<? '#\a) '#f)))
(define char-lower-case?
  (lambda (%_565)
    (if (char-alphabetic? %_565) (char>? '#\z) '#f)))
(define string-downcase (void))
(define string-upcase (void))
((lambda (%_566)
   (begin
     (set! %_566
       (lambda (%_571 %_572 %_573 %_574 %_575)
         (if (< %_574 %_575)
           (begin
             (string-set!
               %_572
               %_574
               (%_573 (string-ref %_571 %_574)))
             (%_566 %_571 %_572 %_573 (+ %_574 '1) %_575))
           %_572)))
     (begin
       (set! string-downcase
         (lambda (%_567)
           ((lambda (%_568)
              (%_566 %_567
                     %_568
                     char-downcase
                     '0
                     (string-length %_567)))
            (make-string (string-length %_567)))))
       (set! string-upcase
         (lambda (%_569)
           ((lambda (%_570)
              (%_566 %_569
                     %_570
                     char-upcase
                     '0
                     (string-length %_569)))
            (make-string (string-length %_569))))))))
 #f)
(define string=? equal?)
(define string<?
  ((lambda (%_576)
     (begin
       (set! %_576
         (lambda (%_579 %_580)
           (if (null? %_579)
             '#f
             (if (null? %_580)
               '#t
               ((lambda (%_581 %_582)
                  (if (char<? %_581 %_582)
                    '#t
                    (if (char=? %_581 %_582)
                      '#f
                      (%_576 (cdr %_579) (cdr %_580)))))
                (car %_579)
                (car %_580))))))
       (lambda (%_577 %_578)
         (%_576 (string->list %_577) (string->list %_578)))))
   #f))
(define string>?
  ((lambda (%_583)
     (begin
       (set! %_583
         (lambda (%_586 %_587)
           (if (null? %_586)
             '#f
             (if (null? %_587)
               '#t
               ((lambda (%_588 %_589)
                  (if (char>? %_588 %_589)
                    '#t
                    (if (char=? %_588 %_589)
                      '#f
                      (%_583 (cdr %_586) (cdr %_587)))))
                (car %_586)
                (car %_587))))))
       (lambda (%_584 %_585)
         (%_583 (string->list %_584) (string->list %_585)))))
   #f))
(define string<=?
  (lambda (%_590 %_591)
    ((lambda (%_592)
       (if %_592 %_592 (string=? %_590 %_591)))
     (string<? %_590 %_591))))
(define string>=?
  (lambda (%_593 %_594)
    ((lambda (%_595)
       (if %_595 %_595 (string=? %_593 %_594)))
     (string>? %_593 %_594))))
(define string-ci=?
  (lambda (%_596 %_597)
    (string=?
      (string-downcase %_596)
      (string-downcase %_597))))
(define string-ci<?
  (lambda (%_598 %_599)
    (string<?
      (string-downcase %_598)
      (string-downcase %_599))))
(define string-ci>?
  (lambda (%_600 %_601)
    (string>?
      (string-downcase %_600)
      (string-downcase %_601))))
(define string-ci>=?
  (lambda (%_602 %_603)
    (string>=?
      (string-downcase %_602)
      (string-downcase %_603))))
(define string-ci<=?
  (lambda (%_604 %_605)
    (string<=?
      (string-downcase %_604)
      (string-downcase %_605))))
(define substring
  ((lambda (%_606)
     (begin
       (set! %_606
         (lambda (%_611 %_612 %_613 %_614 %_615)
           (if (< %_614 %_615)
             (begin
               (string-set!
                 %_612
                 %_613
                 (string-ref %_611 %_614))
               (%_606 %_611
                      %_612
                      (+ %_613 '1)
                      (+ %_614 '1)
                      %_615))
             (void))))
       (lambda (%_607 %_608 %_609)
         ((lambda (%_610)
            (begin (%_606 %_607 %_610 '0 %_608 %_609) %_610))
          (make-string (- %_609 %_608))))))
   #f))
(define format
  ((lambda (%_616)
     (begin
       (set! %_616
         (lambda (%_619 %_620 %_621)
           (if (null? %_619)
             (get-output-string %_621)
             (if (eq? (car %_619) '#\~)
               (begin
                 ((lambda (%_622)
                    (if (memv %_622 '(#\s))
                      (write (car %_620) %_621)
                      (if (memv %_622 '(#\a))
                        (display (car %_620) %_621)
                        (if (memv %_622 '(#\a))
                          (write-char (car %_620) %_621)
                          (if (memv %_622 '(#\%))
                            (display '#\newline %_621)
                            (if (memv %_622 '(#\~))
                              (display '#\~ %_621)
                              (void)))))))
                  (cadr %_619))
                 (%_616 (cddr %_619)
                        (if (not (null? %_620)) (cdr %_620) '())
                        %_621))
               (begin
                 (display (car %_619) %_621)
                 (%_616 (cdr %_619) %_620 %_621))))))
       (lambda (%_618 . %_617)
         (%_616 (string->list %_618)
                %_617
                (open-output-string)))))
   #f))
(define error
  ((lambda (%_623)
     (lambda %_624
       ((lambda (%_625)
          ((lambda (%_626)
             ((lambda (%_627)
                ((lambda ()
                   (if %_625
                     (if %_626
                       (%_623 (format
                                '"Error in ~s: ~a"
                                %_625
                                (apply format (cons %_626 %_627))))
                       (%_623 (format '"Error in ~s." %_625)))
                     (if %_626
                       (%_623 (format
                                '"Error: ~a"
                                (apply format (cons %_626 %_627))))
                       (%_623 '"Error."))))))
              (if (not %_626)
                '#f
                (if (not %_625) (cdr %_624) (cddr %_624)))))
           (if (not %_625)
             (if (not (null? %_624))
               (if (not (car %_624)) (cadr %_624) (car %_624))
               '#f)
             (if (not (null? (cdr %_624))) (cadr %_624) '#f))))
        (if (if (not (null? %_624))
              (symbol? (car %_624))
              '#f)
          (car %_624)
          '#f))))
   error))
(define list-ref
  (lambda (%_628 %_629)
    (if (zero? %_629)
      (car %_628)
      (list-ref (cdr %_628) (- %_629 '1)))))
(define iota
  ((lambda (%_630)
     (begin
       (set! %_630
         (lambda (%_632 %_633)
           (if (> %_632 %_633)
             '()
             (cons %_632 (%_630 (+ %_632 '1) %_633)))))
       (lambda (%_631) (%_630 '0 %_631))))
   #f))
(define values
  (lambda %_634
    (call-with-current-continuation
      (lambda (%_635) (apply %_635 %_634)))))
(if (not (getprop 'lite '*sisc*))
  (for-each
    load-module
    '("sisc.modules.SNative"
      "sisc.modules.J2S"
      "sisc.modules.SLogicOps"
      "sisc.modules.SNetwork"
      "sisc.modules.SDebug"))
  (void))
