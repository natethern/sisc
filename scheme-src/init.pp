(begin
  (void)
  (define for-each
    (lambda (%_350 . %_349)
      (if (null? %_349)
        (error 'for-each
               '"invalid number of arguments to procedure for-each")
        (if (not (null? (car %_349)))
          (begin
            (apply %_350 (map car %_349))
            (apply for-each (cons %_350 (map cdr %_349))))
          (void))))))
(begin (void) (define exit (lambda () '#!eof)))
(begin
  (void)
  (define eof-object?
    (lambda (%_351) (eq? %_351 '#!eof))))
(begin
  (void)
  (define not (lambda (%_352) (if %_352 '#f '#t))))
(begin
  (void)
  (define eqv?
    (lambda (%_353 %_354)
      ((lambda (%_355)
         (if %_355
           %_355
           (if (number? %_353)
             (if (number? %_354)
               (if ((lambda (%_356)
                      (if %_356
                        %_356
                        (if (inexact? %_353) (inexact? %_354) '#f)))
                    (if (exact? %_353) (exact? %_354) '#f))
                 (= %_353 %_354)
                 '#f)
               '#f)
             '#f)))
       (eq? %_353 %_354)))))
(begin
  (void)
  (define newline
    (lambda %_357
      (apply display (cons '#\newline %_357)))))
(begin (void) (define map (void)))
((lambda (%_358)
   (begin
     (set! %_358
       ((lambda (%_359)
          (begin
            (set! %_359
              (lambda (%_363 %_364 %_365 %_366)
                (if (null? %_366)
                  %_364
                  (begin
                    (set-cdr! %_365 (cons (%_363 (car %_366)) '()))
                    (%_359 %_363 %_364 (cdr %_365) (cdr %_366))))))
            (lambda (%_360 %_361)
              (if (null? %_361)
                '()
                ((lambda (%_362)
                   (%_359 %_360 %_362 %_362 (cdr %_361)))
                 (cons (%_360 (car %_361)) '()))))))
        #f))
     (set! map %_358)))
 #f)
(begin
  (void)
  (define compose
    (lambda (%_367 %_368)
      (lambda (%_369) (%_367 (%_368 %_369))))))
(begin (void) (define assq (void)))
(begin (void) (define assv (void)))
(begin (void) (define assoc (void)))
(begin (void) (define memq (void)))
(begin (void) (define memv (void)))
(begin (void) (define member (void)))
((lambda (%_370 %_371)
   (begin
     (set! %_370
       (lambda (%_384 %_385 %_386)
         (if (null? %_386)
           '#f
           (if (%_384 (caar %_386) %_385)
             (car %_386)
             (%_370 %_384 %_385 (cdr %_386))))))
     (set! %_371
       (lambda (%_387 %_388 %_389)
         (if (null? %_389)
           '#f
           (if (%_387 (car %_389) %_388)
             %_389
             (%_371 %_387 %_388 (cdr %_389))))))
     (begin
       (set! assq
         (lambda (%_372 %_373) (%_370 eq? %_372 %_373)))
       (set! assv
         (lambda (%_374 %_375) (%_370 eqv? %_374 %_375)))
       (set! assoc
         (lambda (%_376 %_377) (%_370 equal? %_376 %_377)))
       (set! memq
         (lambda (%_378 %_379) (%_371 eq? %_378 %_379)))
       (set! memv
         (lambda (%_380 %_381) (%_371 eqv? %_380 %_381)))
       (set! member
         (lambda (%_382 %_383) (%_371 equal? %_382 %_383))))))
 #f
 #f)
(begin (void) (define cadr (compose car cdr)))
(begin (void) (define cdar (compose cdr car)))
(begin (void) (define cddr (compose cdr cdr)))
(begin (void) (define caar (compose car car)))
(begin (void) (define caaar (compose car caar)))
(begin (void) (define caadr (compose car cadr)))
(begin (void) (define cadar (compose car cdar)))
(begin (void) (define caddr (compose car cddr)))
(begin (void) (define cdaar (compose cdr caar)))
(begin (void) (define cdadr (compose cdr cadr)))
(begin (void) (define cddar (compose cdr cdar)))
(begin (void) (define cdddr (compose cdr cddr)))
(begin
  (void)
  (define caaaar (compose car caaar)))
(begin
  (void)
  (define caaadr (compose car caadr)))
(begin
  (void)
  (define caadar (compose car cadar)))
(begin
  (void)
  (define caaddr (compose car caddr)))
(begin
  (void)
  (define cadaar (compose car cdaar)))
(begin
  (void)
  (define cadadr (compose car cdadr)))
(begin
  (void)
  (define caddar (compose car cddar)))
(begin
  (void)
  (define cadddr (compose car cdddr)))
(begin
  (void)
  (define cdaaar (compose cdr caaar)))
(begin
  (void)
  (define cdaadr (compose cdr caadr)))
(begin
  (void)
  (define cdadar (compose cdr cadar)))
(begin
  (void)
  (define cdaddr (compose cdr caddr)))
(begin
  (void)
  (define cddaar (compose cdr cdaar)))
(begin
  (void)
  (define cddadr (compose cdr cdadr)))
(begin
  (void)
  (define cdddar (compose cdr cddar)))
(begin
  (void)
  (define cddddr (compose cdr cdddr)))
(begin
  (void)
  (define append2
    (lambda (%_390 %_391)
      (if (null? %_390)
        %_391
        (cons (car %_390) (append2 (cdr %_390) %_391))))))
(begin (void) (define append append2))
(begin
  (void)
  (define list->string
    (lambda (%_392)
      ((lambda (%_393)
         (begin
           (set! %_393
             (lambda (%_394 %_395 %_396)
               (if (null? %_394)
                 %_395
                 (begin
                   (string-set! %_395 %_396 (car %_394))
                   (%_393 (cdr %_394) %_395 (+ %_396 '1))))))
           (%_393 %_392 (make-string (length %_392)) '0)))
       #f))))
(begin
  (void)
  (define string->list
    ((lambda (%_397)
       (begin
         (set! %_397
           (lambda (%_399 %_400 %_401)
             (if (< %_401 '0)
               %_400
               (%_397 %_399
                      (cons (string-ref %_399 %_401) %_400)
                      (- %_401 '1)))))
         (lambda (%_398)
           (%_397 %_398 '() (- (string-length %_398) '1)))))
     #f)))
(begin
  (void)
  (define list->vector
    ((lambda (%_402)
       (begin
         (set! %_402
           (lambda (%_404 %_405 %_406)
             (if (null? %_404)
               %_405
               (begin
                 (vector-set! %_405 %_406 (car %_404))
                 (%_402 (cdr %_404) %_405 (+ %_406 '1))))))
         (lambda (%_403)
           (%_402 %_403 (make-vector (length %_403)) '0))))
     #f)))
(begin
  (void)
  (define vector
    (lambda %_407 (list->vector %_407))))
(begin
  (void)
  (define string
    (lambda %_408 (list->string %_408))))
(begin
  (void)
  (define detect-os
    (lambda ()
      ((lambda (%_409)
         (if (> (string-length %_409) '3)
           (if (equal? (substring %_409 '0 '3) '"mac")
             'macos
             (if (equal? (substring %_409 '0 '3) '"win")
               'ms-dos
               (if (equal? (substring %_409 '0 '3) '"ms-")
                 'ms-dos
                 (if (equal? (substring %_409 '0 '3) '"uni")
                   'unix
                   (if (equal? (substring %_409 '0 '3) '"lin")
                     'unix
                     (if (equal? (substring %_409 '0 '4) '"os/")
                       'os2
                       (if (equal? (substring %_409 '0 '3) '"vax")
                         'vax
                         (void))))))))
           'unix))
       (string-downcase
         (getprop 'os.name '*environment-variables*))))))
(begin (void) (define current-directory (void)))
((lambda (%_410 %_411 %_412)
   (begin
     (set! %_410
       (lambda %_427
         (if (null? %_427)
           (getprop 'current-directory '*sisc*)
           (putprop 'current-directory '*sisc* (car %_427)))))
     (set! %_411
       (lambda (%_428)
         (if ((lambda (%_429)
                (if %_429
                  %_429
                  (if (memq (detect-os) '(ms-dos windows))
                    (if (> (string-length %_428) '1)
                      (eq? (string-ref %_428 '1) '#\:)
                      '#f)
                    '#f)))
              (absolute-path? %_428))
           %_428
           (make-path (%_410) %_428))))
     (set! %_412
       (lambda (%_430 %_431)
         (if (eq? (file-type %_430) %_431)
           '#t
           (error 'file-type
                  '"~s is not of type ~s"
                  %_430
                  %_431))))
     ((lambda (%_416 %_415 %_414 %_413)
        (begin
          (set! %_416
            ((lambda (%_417)
               (lambda (%_418) (%_417 (%_411 %_418))))
             load))
          (set! %_415
            ((lambda (%_419)
               (lambda (%_420)
                 ((lambda (%_421)
                    (if (not (memq (file-type %_421) '(no-file file)))
                      (error 'open-output-file
                             '"~s points to a directory"
                             %_421)
                      (%_419 %_421)))
                  (%_411 %_420))))
             open-output-file))
          (set! %_414
            ((lambda (%_422)
               (lambda (%_423)
                 ((lambda (%_424)
                    (begin (%_412 %_424 'file) (%_422 %_424)))
                  (%_411 %_423))))
             open-input-file))
          (set! %_413
            (lambda %_425
              (if (null? %_425)
                (%_410)
                ((lambda (%_426)
                   (begin (%_412 %_426 'directory) (%_410 %_426)))
                 (%_411 (car %_425))))))
          (begin
            (%_410 '".")
            (set! load %_416)
            (set! current-directory %_413)
            (set! open-input-file %_414)
            (set! open-output-file %_415))))
      #f
      #f
      #f
      #f)))
 #f
 #f
 #f)
(begin
  (void)
  (define with-input-from-file
    (lambda (%_432 %_433)
      ((lambda (%_434 %_435)
         (dynamic-wind
           void
           (lambda ()
             (begin (current-input-port %_435) (%_433)))
           (lambda () (current-input-port %_434))))
       (current-input-port)
       (open-input-file %_432)))))
(begin
  (void)
  (define with-output-to-file
    (lambda (%_436 %_437)
      ((lambda (%_438 %_439)
         (dynamic-wind
           void
           (lambda ()
             (begin (current-output-port %_439) (%_437)))
           (lambda () (current-output-port %_438))))
       (current-output-port)
       (open-output-file %_436)))))
(begin
  (void)
  (define call-with-input-file
    (lambda (%_440 %_441)
      ((lambda (%_442)
         ((lambda (%_443)
            ((lambda ()
               (begin (close-input-port %_442) %_443))))
          (%_441 %_442)))
       (open-input-file %_440)))))
(begin
  (void)
  (define call-with-output-file
    (lambda (%_444 %_445)
      ((lambda (%_446)
         ((lambda (%_447)
            ((lambda ()
               (begin (close-output-port %_446) %_447))))
          (%_445 %_446)))
       (open-output-file %_444)))))
(begin
  (void)
  (define reverse
    ((lambda (%_448)
       (begin
         (set! %_448
           (lambda (%_450 %_451)
             (if (null? %_450)
               %_451
               (%_448 (cdr %_450) (cons (car %_450) %_451)))))
         (lambda (%_449) (%_448 %_449 '()))))
     #f)))
(begin
  (void)
  (define remove
    (lambda (%_452 %_453)
      (if (null? %_453)
        '()
        (if (equal? (car %_453) %_452)
          (remove %_452 (cdr %_453))
          (cons (car %_453) (remove %_452 (cdr %_453))))))))
(begin
  (void)
  (define append
    ((lambda (%_454)
       (begin
         (set! %_454
           (lambda (%_457 . %_456)
             (if (null? %_456)
               %_457
               (if (null? %_457)
                 (apply %_454 %_456)
                 (apply %_454
                        (cons (append2 %_457 (car %_456)) (cdr %_456)))))))
         (lambda %_455
           (if (null? %_455)
             '()
             (if (null? (cdr %_455))
               (car %_455)
               (apply %_454 (cons (car %_455) (cdr %_455))))))))
     #f)))
(begin
  (void)
  (define map
    ((lambda (%_458 %_459)
       (begin
         (set! %_458 map)
         (set! %_459
           (lambda (%_463 %_464 %_465 %_466)
             (if (null? (car %_464))
               (if (andmap null? %_464)
                 %_465
                 (error 'map '"lists are not of equal length"))
               ((lambda (%_467 %_468)
                  (begin
                    (if (not (null? %_466))
                      (set-cdr! %_466 %_467)
                      (void))
                    (if (null? %_465)
                      (%_459 %_463 %_468 %_467 %_467)
                      (%_459 %_463 %_468 %_465 %_467))))
                (cons (apply %_463 (%_458 car %_464)) '())
                (%_458 cdr %_464)))))
         (lambda (%_462 %_461 . %_460)
           (if (null? %_460)
             (%_458 %_462 %_461)
             (%_459 %_462 (cons %_461 %_460) '() '())))))
     #f
     #f)))
(begin
  (void)
  (define circular?
    ((lambda (%_469)
       (begin
         (set! %_469
           (lambda (%_471 %_472)
             (if ((lambda (%_474) (if %_474 %_474 (null? %_472)))
                  (null? %_471))
               '#f
               (if (if (pair? %_472) (null? (cdr %_472)) '#f)
                 '#f
                 (if ((lambda (%_473)
                        (if %_473 %_473 (not (pair? (cdr %_472)))))
                      (not (pair? %_472)))
                   '#f
                   (if (eq? %_471 %_472)
                     '#t
                     (%_469 (cdr %_471) (cddr %_472))))))))
         (lambda (%_470)
           (if (pair? %_470) (%_469 %_470 (cdr %_470)) '#f))))
     #f)))
(begin
  (void)
  (define list?
    ((lambda (%_475)
       (begin
         (set! %_475
           (lambda (%_478 %_479)
             ((lambda (%_480)
                (if %_480
                  %_480
                  ((lambda (%_481)
                     (if %_481
                       %_481
                       (if (pair? %_479)
                         ((lambda (%_482)
                            (if %_482
                              %_482
                              (if (not (eq? %_478 %_479))
                                (%_475 (cdr %_478) (cddr %_479))
                                '#f)))
                          (null? (cdr %_479)))
                         '#f)))
                   (null? %_479))))
              (null? %_478))))
         (lambda (%_476)
           ((lambda (%_477)
              (if %_477
                %_477
                (if (pair? %_476) (%_475 %_476 (cdr %_476)) '#f)))
            (null? %_476)))))
     #f)))
(begin
  (void)
  (define expt
    (lambda (%_483 %_484)
      (if (if (integer? %_484) (= %_483 '2) '#f)
        (ashl '1 %_484)
        (((lambda (%_485)
            (begin
              (set! %_485
                (lambda (%_486 %_487 %_488)
                  (if (zero? %_486)
                    %_487
                    (%_485 (quotient %_486 '2)
                           (if (odd? %_486) (* %_487 %_488) %_487)
                           (* %_488 %_488)))))
              %_485))
          #f)
         %_484
         '1
         %_483)))))
(begin
  (void)
  (define modpow
    (lambda (%_489 %_490 %_491)
      ((lambda (%_492)
         (if (= %_490 '1)
           (modulo %_489 %_491)
           (if (even? %_490)
             ((lambda (%_494) (modulo (* %_494 %_494) %_491))
              (modpow %_489 (/ %_490 '2) %_491))
             ((lambda (%_493)
                (begin
                  (set! %_493 (modulo (* %_493 %_493) %_491))
                  (modulo (* %_489 %_493) %_491)))
              (modpow %_489 (/ (- %_490 '1) '2) %_491)))))
       '0))))
(begin
  (void)
  (define integer?
    ((lambda (%_495)
       (lambda (%_496)
         ((lambda (%_497)
            (if %_497
              %_497
              (if (real? %_496) (= (round %_496) %_496) '#f)))
          (%_495 %_496))))
     integer?)))
(begin
  (void)
  (define real?
    ((lambda (%_498)
       (lambda (%_499) (not (%_498 %_499))))
     complex?)))
(begin (void) (define complex? number?))
(begin
  (void)
  (define abs
    (lambda (%_500)
      (if (not (real? %_500))
        ((lambda (%_501 %_502)
           (sqrt (+ (* %_501 %_501) (* %_502 %_502))))
         (real-part %_500)
         (imag-part %_500))
        (if (< %_500 '0) (- %_500) %_500)))))
(begin (void) (define min (void)))
(begin (void) (define max (void)))
((lambda (%_503)
   (begin
     (set! %_503
       (lambda (%_506 %_507 %_508 %_509)
         (if (null? %_508)
           (if (if %_509 (exact? %_507) '#f)
             (exact->inexact %_507)
             %_507)
           (if (%_506 (car %_508) %_507)
             (%_503 %_506
                    (car %_508)
                    (cdr %_508)
                    ((lambda (%_510)
                       (if %_510 %_510 (inexact? (car %_508))))
                     %_509))
             (%_503 %_506 %_507 (cdr %_508) %_509)))))
     (begin
       (set! min
         (lambda %_504
           (if (null? %_504)
             '0
             (%_503 <
                    (car %_504)
                    (cdr %_504)
                    (inexact? (car %_504))))))
       (set! max
         (lambda %_505
           (if (null? %_505)
             '0
             (%_503 >
                    (car %_505)
                    (cdr %_505)
                    (inexact? (car %_505)))))))))
 #f)
(begin
  (void)
  (define negative? (lambda (%_511) (< %_511 '0))))
(begin
  (void)
  (define positive? (lambda (%_512) (> %_512 '0))))
(begin
  (void)
  (define even?
    (lambda (%_513) (= '0 (modulo %_513 '2)))))
(begin
  (void)
  (define odd?
    (lambda (%_514) (not (even? %_514)))))
(begin
  (void)
  (define zero? (lambda (%_515) (= %_515 '0))))
(begin (void) (define >= (void)))
(begin (void) (define <= (void)))
((lambda (%_516 %_517)
   (begin
     (set! <=
       (%_516 (lambda (%_518 %_519)
                ((lambda (%_520) (if %_520 %_520 (= %_518 %_519)))
                 (< %_518 %_519)))
              %_517
              '#t))
     (set! >=
       (%_516 (lambda (%_521 %_522)
                ((lambda (%_523) (if %_523 %_523 (= %_521 %_522)))
                 (> %_521 %_522)))
              %_517
              '#t))))
 (lambda (%_524 %_525 %_526)
   (lambda %_527
     (((lambda (%_528)
         (begin
           (set! %_528
             (lambda (%_529)
               (if (null? %_529)
                 %_526
                 (if (null? (cdr %_529))
                   %_526
                   (%_525 (%_524 (car %_529) (cadr %_529))
                          (%_528 (cdr %_529)))))))
           %_528))
       #f)
      %_527)))
 (lambda (%_530 %_531) (if %_530 %_531 '#f)))
((lambda (%_532)
   (begin
     (set! >= (%_532 > >=))
     (set! <= (%_532 < <=))))
 (lambda (%_533 %_534)
   (lambda %_535
     ((lambda (%_536)
        (if %_536
          %_536
          ((lambda (%_537)
             (if %_537
               %_537
               (if ((lambda (%_538)
                      (if %_538 %_538 (%_533 (car %_535) (cadr %_535))))
                    (= (car %_535) (cadr %_535)))
                 (apply %_534 (cdr %_535))
                 '#f)))
           (null? (cdr %_535)))))
      (null? %_535)))))
(begin
  (void)
  (define gcd
    (lambda %_539
      (if (null? %_539)
        '0
        (if (null? (cdr %_539))
          (car %_539)
          (_gcd (car %_539) (cadr %_539)))))))
(begin
  (void)
  (define lcm
    (lambda %_540
      (if (null? %_540)
        '1
        (if (null? (cdr %_540))
          (car %_540)
          (_lcm (car %_540) (cadr %_540)))))))
;(max-precision '1500)
(begin (void) (define pi-10 '3.1415926536))
(begin (void) (define pi-70 '3.141592653589793))
(begin
  (void)
  (define pi-1000 '3.141592653589793))
(begin (void) (define pi pi-10))
(begin (void) (define e-10 '2.7182818285))
(begin (void) (define e-70 '2.718281828459045))
(begin (void) (define e-1000 '2.718281828459045))
(begin (void) (define e e-10))
;(max-precision '16)
(begin
  (void)
  (define string-append
    (lambda %_541
      (if (null? %_541)
        '""
        (if (null? (cdr %_541))
          (car %_541)
          (apply string-append
                 (_string-append (car %_541) (cadr %_541))
                 (cddr %_541)))))))
(begin
  (void)
  (define char-downcase
    ((lambda (%_542)
       ((lambda (%_543)
          ((lambda (%_544)
             ((lambda ()
                (lambda (%_545)
                  ((lambda (%_546)
                     (if (if (>= %_546 %_542) (<= %_546 %_543) '#f)
                       (integer->char (+ %_546 %_544))
                       %_545))
                   (char->integer %_545))))))
           (- (char->integer '#\a) %_542)))
        (char->integer '#\Z)))
     (char->integer '#\A))))
(begin
  (void)
  (define char-upcase
    ((lambda (%_547)
       ((lambda (%_548)
          ((lambda (%_549)
             ((lambda ()
                (lambda (%_550)
                  ((lambda (%_551)
                     (if (if (>= %_551 %_547) (<= %_551 %_548) '#f)
                       (integer->char (- %_551 %_549))
                       %_550))
                   (char->integer %_550))))))
           (- %_547 (char->integer '#\A))))
        (char->integer '#\z)))
     (char->integer '#\a))))
(begin
  (void)
  (define char>?
    (lambda (%_552 %_553)
      (> (char->integer %_552) (char->integer %_553)))))
(begin
  (void)
  (define char<?
    (lambda (%_554 %_555)
      (< (char->integer %_554) (char->integer %_555)))))
(begin (void) (define char=? eq?))
(begin
  (void)
  (define char>=?
    (lambda (%_556 %_557)
      ((lambda (%_558)
         (if %_558 %_558 (char=? %_556 %_557)))
       (char>? %_556 %_557)))))
(begin
  (void)
  (define char<=?
    (lambda (%_559 %_560)
      ((lambda (%_561)
         (if %_561 %_561 (char=? %_559 %_560)))
       (char<? %_559 %_560)))))
(begin
  (void)
  (define char-ci>?
    (lambda (%_562 %_563)
      (char>?
        (char-downcase %_562)
        (char-downcase %_563)))))
(begin
  (void)
  (define char-ci<?
    (lambda (%_564 %_565)
      (char<?
        (char-downcase %_564)
        (char-downcase %_565)))))
(begin
  (void)
  (define char-ci=?
    (lambda (%_566 %_567)
      (char=?
        (char-downcase %_566)
        (char-downcase %_567)))))
(begin
  (void)
  (define char-ci>=?
    (lambda (%_568 %_569)
      ((lambda (%_570)
         (if %_570 %_570 (char-ci=? %_568 %_569)))
       (char-ci>? %_568 %_569)))))
(begin
  (void)
  (define char-ci<=?
    (lambda (%_571 %_572)
      ((lambda (%_573)
         (if %_573 %_573 (char-ci=? %_571 %_572)))
       (char-ci<? %_571 %_572)))))
(begin
  (void)
  (define char-alphabetic?
    (lambda (%_574)
      (if (char-ci>=? %_574 '#\a)
        (char-ci<=? %_574 '#\z)
        '#f))))
(begin
  (void)
  (define char-numeric?
    (lambda (%_575)
      (if (char-ci>=? %_575 '#\0)
        (char-ci<=? %_575 '#\9)
        '#f))))
(begin
  (void)
  (define char-whitespace?
    (lambda (%_576)
      (if (memq %_576 '(#\space #\tab #\newline))
        '#t
        '#f))))
(begin
  (void)
  (define char-upper-case?
    (lambda (%_577)
      (if (char-alphabetic? %_577) (char<? '#\a) '#f))))
(begin
  (void)
  (define char-lower-case?
    (lambda (%_578)
      (if (char-alphabetic? %_578) (char>? '#\z) '#f))))
(begin (void) (define string-downcase (void)))
(begin (void) (define string-upcase (void)))
((lambda (%_579)
   (begin
     (set! %_579
       (lambda (%_584 %_585 %_586 %_587 %_588)
         (if (< %_587 %_588)
           (begin
             (string-set!
               %_585
               %_587
               (%_586 (string-ref %_584 %_587)))
             (%_579 %_584 %_585 %_586 (+ %_587 '1) %_588))
           %_585)))
     (begin
       (set! string-downcase
         (lambda (%_580)
           ((lambda (%_581)
              (%_579 %_580
                     %_581
                     char-downcase
                     '0
                     (string-length %_580)))
            (make-string (string-length %_580)))))
       (set! string-upcase
         (lambda (%_582)
           ((lambda (%_583)
              (%_579 %_582
                     %_583
                     char-upcase
                     '0
                     (string-length %_582)))
            (make-string (string-length %_582))))))))
 #f)
(begin (void) (define string=? equal?))
(begin
  (void)
  (define string<?
    ((lambda (%_589)
       (begin
         (set! %_589
           (lambda (%_592 %_593)
             (if (null? %_592)
               '#f
               (if (null? %_593)
                 '#t
                 ((lambda (%_594 %_595)
                    (if (char<? %_594 %_595)
                      '#t
                      (if (char=? %_594 %_595)
                        '#f
                        (%_589 (cdr %_592) (cdr %_593)))))
                  (car %_592)
                  (car %_593))))))
         (lambda (%_590 %_591)
           (%_589 (string->list %_590) (string->list %_591)))))
     #f)))
(begin
  (void)
  (define string>?
    ((lambda (%_596)
       (begin
         (set! %_596
           (lambda (%_599 %_600)
             (if (null? %_599)
               '#f
               (if (null? %_600)
                 '#t
                 ((lambda (%_601 %_602)
                    (if (char>? %_601 %_602)
                      '#t
                      (if (char=? %_601 %_602)
                        '#f
                        (%_596 (cdr %_599) (cdr %_600)))))
                  (car %_599)
                  (car %_600))))))
         (lambda (%_597 %_598)
           (%_596 (string->list %_597) (string->list %_598)))))
     #f)))
(begin
  (void)
  (define string<=?
    (lambda (%_603 %_604)
      ((lambda (%_605)
         (if %_605 %_605 (string=? %_603 %_604)))
       (string<? %_603 %_604)))))
(begin
  (void)
  (define string>=?
    (lambda (%_606 %_607)
      ((lambda (%_608)
         (if %_608 %_608 (string=? %_606 %_607)))
       (string>? %_606 %_607)))))
(begin
  (void)
  (define string-ci=?
    (lambda (%_609 %_610)
      (string=?
        (string-downcase %_609)
        (string-downcase %_610)))))
(begin
  (void)
  (define string-ci<?
    (lambda (%_611 %_612)
      (string<?
        (string-downcase %_611)
        (string-downcase %_612)))))
(begin
  (void)
  (define string-ci>?
    (lambda (%_613 %_614)
      (string>?
        (string-downcase %_613)
        (string-downcase %_614)))))
(begin
  (void)
  (define string-ci>=?
    (lambda (%_615 %_616)
      (string>=?
        (string-downcase %_615)
        (string-downcase %_616)))))
(begin
  (void)
  (define string-ci<=?
    (lambda (%_617 %_618)
      (string<=?
        (string-downcase %_617)
        (string-downcase %_618)))))
(begin
  (void)
  (define substring
    ((lambda (%_619)
       (begin
         (set! %_619
           (lambda (%_624 %_625 %_626 %_627 %_628)
             (if (< %_627 %_628)
               (begin
                 (string-set!
                   %_625
                   %_626
                   (string-ref %_624 %_627))
                 (%_619 %_624
                        %_625
                        (+ %_626 '1)
                        (+ %_627 '1)
                        %_628))
               (void))))
         (lambda (%_620 %_621 %_622)
           ((lambda (%_623)
              (begin (%_619 %_620 %_623 '0 %_621 %_622) %_623))
            (make-string (- %_622 %_621))))))
     #f)))
(begin
  (void)
  (define format
    ((lambda (%_629)
       (begin
         (set! %_629
           (lambda (%_632 %_633 %_634)
             (if (null? %_632)
               (get-output-string %_634)
               (if (eq? (car %_632) '#\~)
                 (begin
                   ((lambda (%_635)
                      (if (memv %_635 '(#\s))
                        (write (car %_633) %_634)
                        (if (memv %_635 '(#\a))
                          (display (car %_633) %_634)
                          (if (memv %_635 '(#\a))
                            (write-char (car %_633) %_634)
                            (if (memv %_635 '(#\%))
                              (display '#\newline %_634)
                              (if (memv %_635 '(#\~))
                                (display '#\~ %_634)
                                (void)))))))
                    (cadr %_632))
                   (%_629 (cddr %_632)
                          (if (not (null? %_633)) (cdr %_633) '())
                          %_634))
                 (begin
                   (display (car %_632) %_634)
                   (%_629 (cdr %_632) %_633 %_634))))))
         (lambda (%_631 . %_630)
           (%_629 (string->list %_631)
                  %_630
                  (open-output-string)))))
     #f)))
(begin
  (void)
  (define error
    ((lambda (%_636)
       (lambda %_637
         ((lambda (%_638)
            ((lambda (%_639)
               ((lambda (%_640)
                  ((lambda ()
                     (if %_638
                       (if %_639
                         (%_636 (format
                                  '"Error in ~s: ~a"
                                  %_638
                                  (apply format (cons %_639 %_640))))
                         (%_636 (format '"Error in ~s." %_638)))
                       (if %_639
                         (%_636 (format
                                  '"Error: ~a"
                                  (apply format (cons %_639 %_640))))
                         (%_636 '"Error."))))))
                (if (not %_639)
                  '#f
                  (if (not %_638) (cdr %_637) (cddr %_637)))))
             (if (not %_638)
               (if (not (null? %_637))
                 (if (not (car %_637)) (cadr %_637) (car %_637))
                 '#f)
               (if (not (null? (cdr %_637))) (cadr %_637) '#f))))
          (if (if (not (null? %_637))
                (symbol? (car %_637))
                '#f)
            (car %_637)
            '#f))))
     error)))
(begin
  (void)
  (define list-ref
    (lambda (%_641 %_642)
      (if (zero? %_642)
        (car %_641)
        (list-ref (cdr %_641) (- %_642 '1))))))
(begin
  (void)
  (define iota
    ((lambda (%_643)
       (begin
         (set! %_643
           (lambda (%_645 %_646)
             (if (> %_645 %_646)
               '()
               (cons %_645 (%_643 (+ %_645 '1) %_646)))))
         (lambda (%_644) (%_643 '0 %_644))))
     #f)))
(begin
  (void)
  (define values
    (lambda %_647
      (call-with-current-continuation
        (lambda (%_648) (apply %_648 %_647))))))
;(if (not (getprop 'lite '*sisc*))
;  (for-each
;    load-module
;    '("sisc.modules.SNative"
;      "sisc.modules.J2S"
;      "sisc.modules.SNetwork"
;      "sisc.modules.SDebug"))
;  (void))
