(define for-each
  (lambda (%_310 . %_309)
    (if (null? %_309)
      (error 'for-each
             '"invalid number of arguments to procedure for-each")
      (if (not (null? (car %_309)))
        (begin
          (apply %_310 (map car %_309))
          (apply for-each (cons %_310 (map cdr %_309))))
        (void)))))
(define exit (lambda () '#!eof))
(define eof-object?
  (lambda (%_311) (eq? %_311 '#!eof)))
(define not (lambda (%_312) (if %_312 '#f '#t)))
(define eqv?
  (lambda (%_313 %_314)
    ((lambda (%_315)
       (if %_315
         %_315
         (if (number? %_313)
           (if (number? %_314)
             (if ((lambda (%_316)
                    (if %_316
                      %_316
                      (if (inexact? %_313) (inexact? %_314) '#f)))
                  (if (exact? %_313) (exact? %_314) '#f))
               (= %_313 %_314)
               '#f)
             '#f)
           '#f)))
     (eq? %_313 %_314))))
(define newline
  (lambda %_317
    (apply display (cons '#\newline %_317))))
(define map (void))
((lambda (%_318)
   (begin
     (set! %_318
       ((lambda (%_319)
          (begin
            (set! %_319
              (lambda (%_323 %_324 %_325 %_326)
                (if (null? %_326)
                  %_324
                  (begin
                    (set-cdr! %_325 (cons (%_323 (car %_326)) '()))
                    (%_319 %_323 %_324 (cdr %_325) (cdr %_326))))))
            (lambda (%_320 %_321)
              (if (null? %_321)
                '()
                ((lambda (%_322)
                   (%_319 %_320 %_322 %_322 (cdr %_321)))
                 (cons (%_320 (car %_321)) '()))))))
        #f))
     (set! map %_318)))
 #f)
(define compose
  (lambda (%_327 %_328)
    (lambda (%_329) (%_327 (%_328 %_329)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
((lambda (%_330 %_331)
   (begin
     (set! %_330
       (lambda (%_344 %_345 %_346)
         (if (null? %_346)
           '#f
           (if (%_344 (caar %_346) %_345)
             (car %_346)
             (%_330 %_344 %_345 (cdr %_346))))))
     (set! %_331
       (lambda (%_347 %_348 %_349)
         (if (null? %_349)
           '#f
           (if (%_347 (car %_349) %_348)
             %_349
             (%_331 %_347 %_348 (cdr %_349))))))
     (begin
       (set! assq
         (lambda (%_332 %_333) (%_330 eq? %_332 %_333)))
       (set! assv
         (lambda (%_334 %_335) (%_330 eqv? %_334 %_335)))
       (set! assoc
         (lambda (%_336 %_337) (%_330 equal? %_336 %_337)))
       (set! memq
         (lambda (%_338 %_339) (%_331 eq? %_338 %_339)))
       (set! memv
         (lambda (%_340 %_341) (%_331 eqv? %_340 %_341)))
       (set! member
         (lambda (%_342 %_343) (%_331 equal? %_342 %_343))))))
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
  (lambda (%_350 %_351)
    (if (null? %_350)
      %_351
      (cons (car %_350) (append2 (cdr %_350) %_351)))))
(define append append2)
(define list->string
  (lambda (%_352)
    ((lambda (%_353)
       (begin
         (set! %_353
           (lambda (%_354 %_355 %_356)
             (if (null? %_354)
               %_355
               (begin
                 (string-set! %_355 %_356 (car %_354))
                 (%_353 (cdr %_354) %_355 (+ %_356 '1))))))
         (%_353 %_352 (make-string (length %_352)) '0)))
     #f)))
(define string->list
  ((lambda (%_357)
     (begin
       (set! %_357
         (lambda (%_359 %_360 %_361)
           (if (< %_361 '0)
             %_360
             (%_357 %_359
                    (cons (string-ref %_359 %_361) %_360)
                    (- %_361 '1)))))
       (lambda (%_358)
         (%_357 %_358 '() (- (string-length %_358) '1)))))
   #f))
(define list->vector
  ((lambda (%_362)
     (begin
       (set! %_362
         (lambda (%_364 %_365 %_366)
           (if (null? %_364)
             %_365
             (begin
               (vector-set! %_365 %_366 (car %_364))
               (%_362 (cdr %_364) %_365 (+ %_366 '1))))))
       (lambda (%_363)
         (%_362 %_363 (make-vector (length %_363)) '0))))
   #f))
(define vector
  (lambda %_367 (list->vector %_367)))
(define string
  (lambda %_368 (list->string %_368)))
(define detect-os
  (lambda ()
    ((lambda (%_369)
       (if (> (string-length %_369) '3)
         (if (equal? (substring %_369 '0 '3) '"mac")
           'macos
           (if (equal? (substring %_369 '0 '3) '"win")
             'ms-dos
             (if (equal? (substring %_369 '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring %_369 '0 '3) '"uni")
                 'unix
                 (if (equal? (substring %_369 '0 '3) '"lin")
                   'unix
                   (if (equal? (substring %_369 '0 '4) '"os/")
                     'os2
                     (if (equal? (substring %_369 '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase
       (getprop 'os.name '*environment-variables*)))))
(define current-directory (void))
((lambda (%_370 %_371 %_372)
   (begin
     (set! %_370
       (lambda %_387
         (if (null? %_387)
           (getprop 'current-directory '*sisc*)
           (putprop 'current-directory '*sisc* (car %_387)))))
     (set! %_371
       (lambda (%_388)
         (if ((lambda (%_389)
                (if %_389
                  %_389
                  (if (memq (detect-os) '(ms-dos windows))
                    (if (> (string-length %_388) '1)
                      (eq? (string-ref %_388 '1) '#\:)
                      '#f)
                    '#f)))
              (absolute-path? %_388))
           %_388
           (make-path (%_370) %_388))))
     (set! %_372
       (lambda (%_390 %_391)
         (if (eq? (file-type %_390) %_391)
           '#t
           (error 'file-type
                  '"~s is not of type ~s"
                  %_390
                  %_391))))
     ((lambda (%_376 %_375 %_374 %_373)
        (begin
          (set! %_376
            ((lambda (%_377)
               (lambda (%_378) (%_377 (%_371 %_378))))
             load))
          (set! %_375
            ((lambda (%_379)
               (lambda (%_380)
                 ((lambda (%_381)
                    (if (not (memq (file-type %_381) '(no-file file)))
                      (error 'open-output-file
                             '"~s points to a directory"
                             %_381)
                      (%_379 %_381)))
                  (%_371 %_380))))
             open-output-file))
          (set! %_374
            ((lambda (%_382)
               (lambda (%_383)
                 ((lambda (%_384)
                    (begin (%_372 %_384 'file) (%_382 %_384)))
                  (%_371 %_383))))
             open-input-file))
          (set! %_373
            (lambda %_385
              (if (null? %_385)
                (%_370)
                ((lambda (%_386)
                   (begin (%_372 %_386 'directory) (%_370 %_386)))
                 (%_371 (car %_385))))))
          (begin
            (%_370 '".")
            (set! load %_376)
            (set! current-directory %_373)
            (set! open-input-file %_374)
            (set! open-output-file %_375))))
      #f
      #f
      #f
      #f)))
 #f
 #f
 #f)
(define load-module
  (lambda (%_392)
    ((lambda (%_393)
       ((lambda (%_394)
          ((lambda ()
             (for-each
               (lambda (%_395)
                 (putprop
                   %_395
                   '*toplevel*
                   (get-native-library-binding %_393 %_395)))
               %_394))))
        (get-native-library-binding-names %_393)))
     (load-native-library %_392))))
(define reverse
  ((lambda (%_396)
     (begin
       (set! %_396
         (lambda (%_398 %_399)
           (if (null? %_398)
             %_399
             (%_396 (cdr %_398) (cons (car %_398) %_399)))))
       (lambda (%_397) (%_396 %_397 '()))))
   #f))
(define remove
  (lambda (%_400 %_401)
    (if (null? %_401)
      '()
      (if (equal? (car %_401) %_400)
        (remove %_400 (cdr %_401))
        (cons (car %_401) (remove %_400 (cdr %_401)))))))
(define append
  ((lambda (%_402)
     (begin
       (set! %_402
         (lambda (%_405 . %_404)
           (if (null? %_404)
             %_405
             (if (null? %_405)
               (apply %_402 %_404)
               (apply %_402
                      (cons (append2 %_405 (car %_404)) (cdr %_404)))))))
       (lambda %_403
         (if (null? %_403)
           '()
           (if (null? (cdr %_403))
             (car %_403)
             (apply %_402 (cons (car %_403) (cdr %_403))))))))
   #f))
(define map
  ((lambda (%_406 %_407)
     (begin
       (set! %_406 map)
       (set! %_407
         (lambda (%_411 %_412 %_413 %_414)
           (if (null? (car %_412))
             (if (andmap null? %_412)
               %_413
               (error 'map '"lists are not of equal length"))
             ((lambda (%_415 %_416)
                (begin
                  (if (not (null? %_414))
                    (set-cdr! %_414 %_415)
                    (void))
                  (if (null? %_413)
                    (%_407 %_411 %_416 %_415 %_415)
                    (%_407 %_411 %_416 %_413 %_415))))
              (cons (apply %_411 (%_406 car %_412)) '())
              (%_406 cdr %_412)))))
       (lambda (%_410 %_409 . %_408)
         (if (null? %_408)
           (%_406 %_410 %_409)
           (%_407 %_410 (cons %_409 %_408) '() '())))))
   #f
   #f))
(define circular?
  ((lambda (%_417)
     (begin
       (set! %_417
         (lambda (%_419 %_420)
           (if ((lambda (%_422) (if %_422 %_422 (null? %_420)))
                (null? %_419))
             '#f
             (if (if (pair? %_420) (null? (cdr %_420)) '#f)
               '#f
               (if ((lambda (%_421)
                      (if %_421 %_421 (not (pair? (cdr %_420)))))
                    (not (pair? %_420)))
                 '#f
                 (if (eq? %_419 %_420)
                   '#t
                   (%_417 (cdr %_419) (cddr %_420))))))))
       (lambda (%_418)
         (if (pair? %_418) (%_417 %_418 (cdr %_418)) '#f))))
   #f))
(define list?
  ((lambda (%_423)
     (begin
       (set! %_423
         (lambda (%_426 %_427)
           ((lambda (%_428)
              (if %_428
                %_428
                ((lambda (%_429)
                   (if %_429
                     %_429
                     (if (pair? %_427)
                       ((lambda (%_430)
                          (if %_430
                            %_430
                            (if (not (eq? %_426 %_427))
                              (%_423 (cdr %_426) (cddr %_427))
                              '#f)))
                        (null? (cdr %_427)))
                       '#f)))
                 (null? %_427))))
            (null? %_426))))
       (lambda (%_424)
         ((lambda (%_425)
            (if %_425
              %_425
              (if (pair? %_424) (%_423 %_424 (cdr %_424)) '#f)))
          (null? %_424)))))
   #f))
(define expt
  (lambda (%_431 %_432)
    (if (if (integer? %_432) (= %_431 '2) '#f)
      (ashl '1 %_432)
      (((lambda (%_433)
          (begin
            (set! %_433
              (lambda (%_434 %_435 %_436)
                (if (zero? %_434)
                  %_435
                  (%_433 (quotient %_434 '2)
                         (if (odd? %_434) (* %_435 %_436) %_435)
                         (* %_436 %_436)))))
            %_433))
        #f)
       %_432
       '1
       %_431))))
(define modpow
  (lambda (%_437 %_438 %_439)
    ((lambda (%_440)
       (if (= %_438 '1)
         (modulo %_437 %_439)
         (if (even? %_438)
           ((lambda (%_442) (modulo (* %_442 %_442) %_439))
            (modpow %_437 (/ %_438 '2) %_439))
           ((lambda (%_441)
              (begin
                (set! %_441 (modulo (* %_441 %_441) %_439))
                (modulo (* %_437 %_441) %_439)))
            (modpow %_437 (/ (- %_438 '1) '2) %_439)))))
     '0)))
(define integer?
  ((lambda (%_443)
     (lambda (%_444)
       ((lambda (%_445)
          (if %_445
            %_445
            (if (real? %_444) (= (round %_444) %_444) '#f)))
        (%_443 %_444))))
   integer?))
(define real?
  ((lambda (%_446)
     (lambda (%_447) (not (%_446 %_447))))
   complex?))
(define complex? number?)
(define abs
  (lambda (%_448)
    (if (not (real? %_448))
      ((lambda (%_449 %_450)
         (sqrt (+ (* %_449 %_449) (* %_450 %_450))))
       (real-part %_448)
       (imag-part %_448))
      (if (< %_448 '0) (- %_448) %_448))))
(define min (void))
(define max (void))
((lambda (%_451)
   (begin
     (set! %_451
       (lambda (%_454 %_455 %_456 %_457)
         (if (null? %_456)
           (if (if %_457 (exact? %_455) '#f)
             (exact->inexact %_455)
             %_455)
           (if (%_454 (car %_456) %_455)
             (%_451 %_454
                    (car %_456)
                    (cdr %_456)
                    ((lambda (%_458)
                       (if %_458 %_458 (inexact? (car %_456))))
                     %_457))
             (%_451 %_454 %_455 (cdr %_456) %_457)))))
     (begin
       (set! min
         (lambda %_452
           (if (null? %_452)
             '0
             (%_451 <
                    (car %_452)
                    (cdr %_452)
                    (inexact? (car %_452))))))
       (set! max
         (lambda %_453
           (if (null? %_453)
             '0
             (%_451 >
                    (car %_453)
                    (cdr %_453)
                    (inexact? (car %_453)))))))))
 #f)
(define negative? (lambda (%_459) (< %_459 '0)))
(define positive? (lambda (%_460) (> %_460 '0)))
(define even?
  (lambda (%_461) (= '0 (modulo %_461 '2))))
(define odd?
  (lambda (%_462) (not (even? %_462))))
(define zero? (lambda (%_463) (= %_463 '0)))
(define >= (void))
(define <= (void))
((lambda (%_464 %_465)
   (begin
     (set! <=
       (%_464 (lambda (%_466 %_467)
                ((lambda (%_468) (if %_468 %_468 (= %_466 %_467)))
                 (< %_466 %_467)))
              %_465
              '#t))
     (set! >=
       (%_464 (lambda (%_469 %_470)
                ((lambda (%_471) (if %_471 %_471 (= %_469 %_470)))
                 (> %_469 %_470)))
              %_465
              '#t))))
 (lambda (%_472 %_473 %_474)
   (lambda %_475
     (((lambda (%_476)
         (begin
           (set! %_476
             (lambda (%_477)
               (if (null? %_477)
                 %_474
                 (if (null? (cdr %_477))
                   %_474
                   (%_473 (%_472 (car %_477) (cadr %_477))
                          (%_476 (cdr %_477)))))))
           %_476))
       #f)
      %_475)))
 (lambda (%_478 %_479) (if %_478 %_479 '#f)))
((lambda (%_480)
   (begin
     (set! >= (%_480 > >=))
     (set! <= (%_480 < <=))))
 (lambda (%_481 %_482)
   (lambda %_483
     ((lambda (%_484)
        (if %_484
          %_484
          ((lambda (%_485)
             (if %_485
               %_485
               (if ((lambda (%_486)
                      (if %_486 %_486 (%_481 (car %_483) (cadr %_483))))
                    (= (car %_483) (cadr %_483)))
                 (apply %_482 (cdr %_483))
                 '#f)))
           (null? (cdr %_483)))))
      (null? %_483)))))
(define gcd
  (lambda %_487
    (if (null? %_487)
      '0
      (if (null? (cdr %_487))
        (car %_487)
        (_gcd (car %_487) (cadr %_487))))))
(define lcm
  (lambda %_488
    (if (null? %_488)
      '1
      (if (null? (cdr %_488))
        (car %_488)
        (_lcm (car %_488) (cadr %_488))))))
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
  (lambda %_489
    (if (null? %_489)
      '""
      (if (null? (cdr %_489))
        (car %_489)
        (apply string-append
               (_string-append (car %_489) (cadr %_489))
               (cddr %_489))))))
(define char-downcase
  ((lambda (%_490)
     ((lambda (%_491)
        ((lambda (%_492)
           ((lambda ()
              (lambda (%_493)
                ((lambda (%_494)
                   (if (if (>= %_494 %_490) (<= %_494 %_491) '#f)
                     (integer->char (+ %_494 %_492))
                     %_493))
                 (char->integer %_493))))))
         (- (char->integer '#\a) %_490)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_495)
     ((lambda (%_496)
        ((lambda (%_497)
           ((lambda ()
              (lambda (%_498)
                ((lambda (%_499)
                   (if (if (>= %_499 %_495) (<= %_499 %_496) '#f)
                     (integer->char (- %_499 %_497))
                     %_498))
                 (char->integer %_498))))))
         (- %_495 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_500 %_501)
    (> (char->integer %_500) (char->integer %_501))))
(define char<?
  (lambda (%_502 %_503)
    (< (char->integer %_502) (char->integer %_503))))
(define char=? eq?)
(define char>=?
  (lambda (%_504 %_505)
    ((lambda (%_506)
       (if %_506 %_506 (char=? %_504 %_505)))
     (char>? %_504 %_505))))
(define char<=?
  (lambda (%_507 %_508)
    ((lambda (%_509)
       (if %_509 %_509 (char=? %_507 %_508)))
     (char<? %_507 %_508))))
(define char-ci>?
  (lambda (%_510 %_511)
    (char>?
      (char-downcase %_510)
      (char-downcase %_511))))
(define char-ci<?
  (lambda (%_512 %_513)
    (char<?
      (char-downcase %_512)
      (char-downcase %_513))))
(define char-ci=?
  (lambda (%_514 %_515)
    (char=?
      (char-downcase %_514)
      (char-downcase %_515))))
(define char-ci>=?
  (lambda (%_516 %_517)
    ((lambda (%_518)
       (if %_518 %_518 (char-ci=? %_516 %_517)))
     (char-ci>? %_516 %_517))))
(define char-ci<=?
  (lambda (%_519 %_520)
    ((lambda (%_521)
       (if %_521 %_521 (char-ci=? %_519 %_520)))
     (char-ci<? %_519 %_520))))
(define char-alphabetic?
  (lambda (%_522)
    (if (char-ci>=? %_522 '#\a)
      (char-ci<=? %_522 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_523)
    (if (char-ci>=? %_523 '#\0)
      (char-ci<=? %_523 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_524)
    (if (memq %_524 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_525)
    (if (char-alphabetic? %_525) (char<? '#\a) '#f)))
(define char-lower-case?
  (lambda (%_526)
    (if (char-alphabetic? %_526) (char>? '#\z) '#f)))
(define string-downcase (void))
(define string-upcase (void))
((lambda (%_527)
   (begin
     (set! %_527
       (lambda (%_532 %_533 %_534 %_535 %_536)
         (if (< %_535 %_536)
           (begin
             (string-set!
               %_533
               %_535
               (%_534 (string-ref %_532 %_535)))
             (%_527 %_532 %_533 %_534 (+ %_535 '1) %_536))
           %_533)))
     (begin
       (set! string-downcase
         (lambda (%_528)
           ((lambda (%_529)
              (%_527 %_528
                     %_529
                     char-downcase
                     '0
                     (string-length %_528)))
            (make-string (string-length %_528)))))
       (set! string-upcase
         (lambda (%_530)
           ((lambda (%_531)
              (%_527 %_530
                     %_531
                     char-upcase
                     '0
                     (string-length %_530)))
            (make-string (string-length %_530))))))))
 #f)
(define string=? equal?)
(define string<?
  ((lambda (%_537)
     (begin
       (set! %_537
         (lambda (%_540 %_541)
           (if (null? %_540)
             '#f
             (if (null? %_541)
               '#t
               ((lambda (%_542 %_543)
                  (if (char<? %_542 %_543)
                    '#t
                    (if (char=? %_542 %_543)
                      '#f
                      (%_537 (cdr %_540) (cdr %_541)))))
                (car %_540)
                (car %_541))))))
       (lambda (%_538 %_539)
         (%_537 (string->list %_538) (string->list %_539)))))
   #f))
(define string>?
  ((lambda (%_544)
     (begin
       (set! %_544
         (lambda (%_547 %_548)
           (if (null? %_547)
             '#f
             (if (null? %_548)
               '#t
               ((lambda (%_549 %_550)
                  (if (char>? %_549 %_550)
                    '#t
                    (if (char=? %_549 %_550)
                      '#f
                      (%_544 (cdr %_547) (cdr %_548)))))
                (car %_547)
                (car %_548))))))
       (lambda (%_545 %_546)
         (%_544 (string->list %_545) (string->list %_546)))))
   #f))
(define string<=?
  (lambda (%_551 %_552)
    ((lambda (%_553)
       (if %_553 %_553 (string=? %_551 %_552)))
     (string<? %_551 %_552))))
(define string>=?
  (lambda (%_554 %_555)
    ((lambda (%_556)
       (if %_556 %_556 (string=? %_554 %_555)))
     (string>? %_554 %_555))))
(define string-ci=?
  (lambda (%_557 %_558)
    (string=?
      (string-downcase %_557)
      (string-downcase %_558))))
(define string-ci<?
  (lambda (%_559 %_560)
    (string<?
      (string-downcase %_559)
      (string-downcase %_560))))
(define string-ci>?
  (lambda (%_561 %_562)
    (string>?
      (string-downcase %_561)
      (string-downcase %_562))))
(define string-ci>=?
  (lambda (%_563 %_564)
    (string>=?
      (string-downcase %_563)
      (string-downcase %_564))))
(define string-ci<=?
  (lambda (%_565 %_566)
    (string<=?
      (string-downcase %_565)
      (string-downcase %_566))))
(define substring
  ((lambda (%_567)
     (begin
       (set! %_567
         (lambda (%_572 %_573 %_574 %_575 %_576)
           (if (< %_575 %_576)
             (begin
               (string-set!
                 %_573
                 %_574
                 (string-ref %_572 %_575))
               (%_567 %_572
                      %_573
                      (+ %_574 '1)
                      (+ %_575 '1)
                      %_576))
             (void))))
       (lambda (%_568 %_569 %_570)
         ((lambda (%_571)
            (begin (%_567 %_568 %_571 '0 %_569 %_570) %_571))
          (make-string (- %_570 %_569))))))
   #f))
(define format
  ((lambda (%_577)
     (begin
       (set! %_577
         (lambda (%_580 %_581 %_582)
           (if (null? %_580)
             (get-output-string %_582)
             (if (eq? (car %_580) '#\~)
               (begin
                 ((lambda (%_583)
                    (if (memv %_583 '(#\s))
                      (write (car %_581) %_582)
                      (if (memv %_583 '(#\a))
                        (display (car %_581) %_582)
                        (if (memv %_583 '(#\a))
                          (write-char (car %_581) %_582)
                          (if (memv %_583 '(#\%))
                            (display '#\newline %_582)
                            (if (memv %_583 '(#\~))
                              (display '#\~ %_582)
                              (void)))))))
                  (cadr %_580))
                 (%_577 (cddr %_580)
                        (if (not (null? %_581)) (cdr %_581) '())
                        %_582))
               (begin
                 (display (car %_580) %_582)
                 (%_577 (cdr %_580) %_581 %_582))))))
       (lambda (%_579 . %_578)
         (%_577 (string->list %_579)
                %_578
                (open-output-string)))))
   #f))
(define error
  ((lambda (%_584)
     (lambda %_585
       ((lambda (%_586)
          ((lambda (%_587)
             ((lambda (%_588)
                ((lambda ()
                   (if %_586
                     (if %_587
                       (%_584 (format
                                '"Error in ~s: ~a"
                                %_586
                                (apply format (cons %_587 %_588))))
                       (%_584 (format '"Error in ~s." %_586)))
                     (if %_587
                       (%_584 (format
                                '"Error: ~a"
                                (apply format (cons %_587 %_588))))
                       (%_584 '"Error."))))))
              (if (not %_587)
                '#f
                (if (not %_586) (cdr %_585) (cddr %_585)))))
           (if (not %_586)
             (if (not (null? %_585))
               (if (not (car %_585)) (cadr %_585) (car %_585))
               '#f)
             (if (not (null? (cdr %_585))) (cadr %_585) '#f))))
        (if (if (not (null? %_585))
              (symbol? (car %_585))
              '#f)
          (car %_585)
          '#f))))
   error))
(define list-ref
  (lambda (%_589 %_590)
    (if (zero? %_590)
      (car %_589)
      (list-ref (cdr %_589) (- %_590 '1)))))
(define iota
  ((lambda (%_591)
     (begin
       (set! %_591
         (lambda (%_593 %_594)
           (if (> %_593 %_594)
             '()
             (cons %_593 (%_591 (+ %_593 '1) %_594)))))
       (lambda (%_592) (%_591 '0 %_592))))
   #f))
(define values
  (lambda %_595
    (call-with-current-continuation
      (lambda (%_596) (apply %_596 %_595)))))
(if (not (getprop 'lite '*sisc*))
  (for-each load-module '("sisc.modules.SNative"))
  (void))
