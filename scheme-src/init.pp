(define for-each
  (lambda (%_294 . %_293)
    (if (null? %_293)
      (error 'for-each
             '"invalid number of arguments to procedure for-each")
      (if (not (null? (car %_293)))
        (begin
          (apply %_294 (map car %_293))
          (apply for-each (cons %_294 (map cdr %_293))))
        (void)))))
(define exit (lambda () '#!eof))
(define eof-object?
  (lambda (%_295) (eq? %_295 '#!eof)))
(define not (lambda (%_296) (if %_296 '#f '#t)))
(define eqv?
  (lambda (%_297 %_298)
    ((lambda (%_299)
       (if %_299
         %_299
         (if (number? %_297)
           (if (number? %_298)
             (if ((lambda (%_300)
                    (if %_300
                      %_300
                      (if (inexact? %_297) (inexact? %_298) '#f)))
                  (if (exact? %_297) (exact? %_298) '#f))
               (= %_297 %_298)
               '#f)
             '#f)
           '#f)))
     (eq? %_297 %_298))))
(define newline
  (lambda %_301
    (apply display (cons '#\newline %_301))))
(define map (void))
((lambda (%_302)
   (begin
     (set! %_302
       ((lambda (%_303)
          (begin
            (set! %_303
              (lambda (%_307 %_308 %_309 %_310)
                (if (null? %_310)
                  %_308
                  (begin
                    (set-cdr! %_309 (cons (%_307 (car %_310)) '()))
                    (%_303 %_307 %_308 (cdr %_309) (cdr %_310))))))
            (lambda (%_304 %_305)
              (if (null? %_305)
                '()
                ((lambda (%_306)
                   (%_303 %_304 %_306 %_306 (cdr %_305)))
                 (cons (%_304 (car %_305)) '()))))))
        #f))
     (set! map %_302)))
 #f)
(define compose
  (lambda (%_311 %_312)
    (lambda (%_313) (%_311 (%_312 %_313)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
((lambda (%_314 %_315)
   (begin
     (set! %_314
       (lambda (%_328 %_329 %_330)
         (if (null? %_330)
           '#f
           (if (%_328 (caar %_330) %_329)
             (car %_330)
             (%_314 %_328 %_329 (cdr %_330))))))
     (set! %_315
       (lambda (%_331 %_332 %_333)
         (if (null? %_333)
           '#f
           (if (%_331 (car %_333) %_332)
             %_333
             (%_315 %_331 %_332 (cdr %_333))))))
     (begin
       (set! assq
         (lambda (%_316 %_317) (%_314 eq? %_316 %_317)))
       (set! assv
         (lambda (%_318 %_319) (%_314 eqv? %_318 %_319)))
       (set! assoc
         (lambda (%_320 %_321) (%_314 equal? %_320 %_321)))
       (set! memq
         (lambda (%_322 %_323) (%_315 eq? %_322 %_323)))
       (set! memv
         (lambda (%_324 %_325) (%_315 eqv? %_324 %_325)))
       (set! member
         (lambda (%_326 %_327) (%_315 equal? %_326 %_327))))))
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
  (lambda (%_334 %_335)
    (if (null? %_334)
      %_335
      (cons (car %_334) (append2 (cdr %_334) %_335)))))
(define append append2)
(define list->string
  (lambda (%_336)
    ((lambda (%_337)
       (begin
         (set! %_337
           (lambda (%_338 %_339 %_340)
             (if (null? %_338)
               %_339
               (begin
                 (string-set! %_339 %_340 (car %_338))
                 (%_337 (cdr %_338) %_339 (+ %_340 '1))))))
         (%_337 %_336 (make-string (length %_336)) '0)))
     #f)))
(define string->list
  ((lambda (%_341)
     (begin
       (set! %_341
         (lambda (%_343 %_344 %_345)
           (if (< %_345 '0)
             %_344
             (%_341 %_343
                    (cons (string-ref %_343 %_345) %_344)
                    (- %_345 '1)))))
       (lambda (%_342)
         (%_341 %_342 '() (- (string-length %_342) '1)))))
   #f))
(define list->vector
  ((lambda (%_346)
     (begin
       (set! %_346
         (lambda (%_348 %_349 %_350)
           (if (null? %_348)
             %_349
             (begin
               (vector-set! %_349 %_350 (car %_348))
               (%_346 (cdr %_348) %_349 (+ %_350 '1))))))
       (lambda (%_347)
         (%_346 %_347 (make-vector (length %_347)) '0))))
   #f))
(define vector
  (lambda %_351 (list->vector %_351)))
(define string
  (lambda %_352 (list->string %_352)))
(define detect-os
  (lambda ()
    ((lambda (%_353)
       (if (> (string-length %_353) '3)
         (if (equal? (substring %_353 '0 '3) '"mac")
           'macos
           (if (equal? (substring %_353 '0 '3) '"win")
             'ms-dos
             (if (equal? (substring %_353 '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring %_353 '0 '3) '"uni")
                 'unix
                 (if (equal? (substring %_353 '0 '3) '"lin")
                   'unix
                   (if (equal? (substring %_353 '0 '4) '"os/")
                     'os2
                     (if (equal? (substring %_353 '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase
       (getprop 'os.name '*environment-variables*)))))
(define current-directory (void))
((lambda (%_354 %_355 %_356)
   (begin
     (set! %_354
       (lambda %_371
         (if (null? %_371)
           (getprop 'current-directory '*sisc*)
           (putprop 'current-directory '*sisc* (car %_371)))))
     (set! %_355
       (lambda (%_372)
         (if ((lambda (%_373)
                (if %_373
                  %_373
                  (if (memq (detect-os) '(ms-dos windows))
                    (if (> (string-length %_372) '1)
                      (eq? (string-ref %_372 '1) '#\:)
                      '#f)
                    '#f)))
              (absolute-path? %_372))
           %_372
           (make-path (%_354) %_372))))
     (set! %_356
       (lambda (%_374 %_375)
         (if (eq? (file-type %_374) %_375)
           '#t
           (error 'file-type
                  '"~s is not of type ~s"
                  %_374
                  %_375))))
     ((lambda (%_360 %_359 %_358 %_357)
        (begin
          (set! %_360
            ((lambda (%_361)
               (lambda (%_362) (%_361 (%_355 %_362))))
             load))
          (set! %_359
            ((lambda (%_363)
               (lambda (%_364)
                 ((lambda (%_365)
                    (if (not (memq (file-type %_365) '(no-file file)))
                      (error 'open-output-file
                             '"~s points to a directory"
                             %_365)
                      (%_363 %_365)))
                  (%_355 %_364))))
             open-output-file))
          (set! %_358
            ((lambda (%_366)
               (lambda (%_367)
                 ((lambda (%_368)
                    (begin (%_356 %_368 'file) (%_366 %_368)))
                  (%_355 %_367))))
             open-input-file))
          (set! %_357
            (lambda %_369
              (if (null? %_369)
                (%_354)
                ((lambda (%_370)
                   (begin (%_356 %_370 'directory) (%_354 %_370)))
                 (%_355 (car %_369))))))
          (begin
            (%_354 '".")
            (set! load %_360)
            (set! current-directory %_357)
            (set! open-input-file %_358)
            (set! open-output-file %_359))))
      #f
      #f
      #f
      #f)))
 #f
 #f
 #f)
(define with-input-from-file
  (lambda (%_376 %_377)
    ((lambda (%_378 %_379)
       (dynamic-wind
         void
         (lambda ()
           (begin (current-input-port %_379) (%_377)))
         (lambda () (current-input-port %_378))))
     (current-input-port)
     (open-input-file %_376))))
(define with-output-to-file
  (lambda (%_380 %_381)
    ((lambda (%_382 %_383)
       (dynamic-wind
         void
         (lambda ()
           (begin (current-output-port %_383) (%_381)))
         (lambda () (current-output-port %_382))))
     (current-output-port)
     (open-output-file %_380))))
(define call-with-input-file
  (lambda (%_384 %_385)
    ((lambda (%_386)
       ((lambda (%_387)
          ((lambda ()
             (begin (close-input-port %_386) %_387))))
        (%_385 %_386)))
     (open-input-file %_384))))
(define call-with-output-file
  (lambda (%_388 %_389)
    ((lambda (%_390)
       ((lambda (%_391)
          ((lambda ()
             (begin (close-output-port %_390) %_391))))
        (%_389 %_390)))
     (open-output-file %_388))))
(define reverse
  ((lambda (%_392)
     (begin
       (set! %_392
         (lambda (%_394 %_395)
           (if (null? %_394)
             %_395
             (%_392 (cdr %_394) (cons (car %_394) %_395)))))
       (lambda (%_393) (%_392 %_393 '()))))
   #f))
(define remove
  (lambda (%_396 %_397)
    (if (null? %_397)
      '()
      (if (equal? (car %_397) %_396)
        (remove %_396 (cdr %_397))
        (cons (car %_397) (remove %_396 (cdr %_397)))))))
(define append
  ((lambda (%_398)
     (begin
       (set! %_398
         (lambda (%_401 . %_400)
           (if (null? %_400)
             %_401
             (if (null? %_401)
               (apply %_398 %_400)
               (apply %_398
                      (cons (append2 %_401 (car %_400)) (cdr %_400)))))))
       (lambda %_399
         (if (null? %_399)
           '()
           (if (null? (cdr %_399))
             (car %_399)
             (apply %_398 (cons (car %_399) (cdr %_399))))))))
   #f))
(define map
  ((lambda (%_402 %_403)
     (begin
       (set! %_402 map)
       (set! %_403
         (lambda (%_407 %_408 %_409 %_410)
           (if (null? (car %_408))
             (if (andmap null? %_408)
               %_409
               (error 'map '"lists are not of equal length"))
             ((lambda (%_411 %_412)
                (begin
                  (if (not (null? %_410))
                    (set-cdr! %_410 %_411)
                    (void))
                  (if (null? %_409)
                    (%_403 %_407 %_412 %_411 %_411)
                    (%_403 %_407 %_412 %_409 %_411))))
              (cons (apply %_407 (%_402 car %_408)) '())
              (%_402 cdr %_408)))))
       (lambda (%_406 %_405 . %_404)
         (if (null? %_404)
           (%_402 %_406 %_405)
           (%_403 %_406 (cons %_405 %_404) '() '())))))
   #f
   #f))
(define circular?
  ((lambda (%_413)
     (begin
       (set! %_413
         (lambda (%_415 %_416)
           (if ((lambda (%_418) (if %_418 %_418 (null? %_416)))
                (null? %_415))
             '#f
             (if (if (pair? %_416) (null? (cdr %_416)) '#f)
               '#f
               (if ((lambda (%_417)
                      (if %_417 %_417 (not (pair? (cdr %_416)))))
                    (not (pair? %_416)))
                 '#f
                 (if (eq? %_415 %_416)
                   '#t
                   (%_413 (cdr %_415) (cddr %_416))))))))
       (lambda (%_414)
         (if (pair? %_414) (%_413 %_414 (cdr %_414)) '#f))))
   #f))
(define list?
  ((lambda (%_419)
     (begin
       (set! %_419
         (lambda (%_422 %_423)
           ((lambda (%_424)
              (if %_424
                %_424
                ((lambda (%_425)
                   (if %_425
                     %_425
                     (if (pair? %_423)
                       ((lambda (%_426)
                          (if %_426
                            %_426
                            (if (not (eq? %_422 %_423))
                              (%_419 (cdr %_422) (cddr %_423))
                              '#f)))
                        (null? (cdr %_423)))
                       '#f)))
                 (null? %_423))))
            (null? %_422))))
       (lambda (%_420)
         ((lambda (%_421)
            (if %_421
              %_421
              (if (pair? %_420) (%_419 %_420 (cdr %_420)) '#f)))
          (null? %_420)))))
   #f))
(define expt
  (lambda (%_427 %_428)
    (if (if (integer? %_428) (= %_427 '2) '#f)
      (ashl '1 %_428)
      (((lambda (%_429)
          (begin
            (set! %_429
              (lambda (%_430 %_431 %_432)
                (if (zero? %_430)
                  %_431
                  (%_429 (quotient %_430 '2)
                         (if (odd? %_430) (* %_431 %_432) %_431)
                         (* %_432 %_432)))))
            %_429))
        #f)
       %_428
       '1
       %_427))))
(define modpow
  (lambda (%_433 %_434 %_435)
    ((lambda (%_436)
       (if (= %_434 '1)
         (modulo %_433 %_435)
         (if (even? %_434)
           ((lambda (%_438) (modulo (* %_438 %_438) %_435))
            (modpow %_433 (/ %_434 '2) %_435))
           ((lambda (%_437)
              (begin
                (set! %_437 (modulo (* %_437 %_437) %_435))
                (modulo (* %_433 %_437) %_435)))
            (modpow %_433 (/ (- %_434 '1) '2) %_435)))))
     '0)))
(define integer?
  ((lambda (%_439)
     (lambda (%_440)
       ((lambda (%_441)
          (if %_441
            %_441
            (if (real? %_440) (= (round %_440) %_440) '#f)))
        (%_439 %_440))))
   integer?))
(define real?
  ((lambda (%_442)
     (lambda (%_443) (not (%_442 %_443))))
   complex?))
(define complex? number?)
(define abs
  (lambda (%_444)
    (if (not (real? %_444))
      ((lambda (%_445 %_446)
         (sqrt (+ (* %_445 %_445) (* %_446 %_446))))
       (real-part %_444)
       (imag-part %_444))
      (if (< %_444 '0) (- %_444) %_444))))
(define min (void))
(define max (void))
((lambda (%_447)
   (begin
     (set! %_447
       (lambda (%_450 %_451 %_452 %_453)
         (if (null? %_452)
           (if (if %_453 (exact? %_451) '#f)
             (exact->inexact %_451)
             %_451)
           (if (%_450 (car %_452) %_451)
             (%_447 %_450
                    (car %_452)
                    (cdr %_452)
                    ((lambda (%_454)
                       (if %_454 %_454 (inexact? (car %_452))))
                     %_453))
             (%_447 %_450 %_451 (cdr %_452) %_453)))))
     (begin
       (set! min
         (lambda %_448
           (if (null? %_448)
             '0
             (%_447 <
                    (car %_448)
                    (cdr %_448)
                    (inexact? (car %_448))))))
       (set! max
         (lambda %_449
           (if (null? %_449)
             '0
             (%_447 >
                    (car %_449)
                    (cdr %_449)
                    (inexact? (car %_449)))))))))
 #f)
(define negative? (lambda (%_455) (< %_455 '0)))
(define positive? (lambda (%_456) (> %_456 '0)))
(define even?
  (lambda (%_457) (= '0 (modulo %_457 '2))))
(define odd?
  (lambda (%_458) (not (even? %_458))))
(define zero? (lambda (%_459) (= %_459 '0)))
(define >= (void))
(define <= (void))
((lambda (%_460 %_461)
   (begin
     (set! <=
       (%_460 (lambda (%_462 %_463)
                ((lambda (%_464) (if %_464 %_464 (= %_462 %_463)))
                 (< %_462 %_463)))
              %_461
              '#t))
     (set! >=
       (%_460 (lambda (%_465 %_466)
                ((lambda (%_467) (if %_467 %_467 (= %_465 %_466)))
                 (> %_465 %_466)))
              %_461
              '#t))))
 (lambda (%_468 %_469 %_470)
   (lambda %_471
     (((lambda (%_472)
         (begin
           (set! %_472
             (lambda (%_473)
               (if (null? %_473)
                 %_470
                 (if (null? (cdr %_473))
                   %_470
                   (%_469 (%_468 (car %_473) (cadr %_473))
                          (%_472 (cdr %_473)))))))
           %_472))
       #f)
      %_471)))
 (lambda (%_474 %_475) (if %_474 %_475 '#f)))
((lambda (%_476)
   (begin
     (set! >= (%_476 > >=))
     (set! <= (%_476 < <=))))
 (lambda (%_477 %_478)
   (lambda %_479
     ((lambda (%_480)
        (if %_480
          %_480
          ((lambda (%_481)
             (if %_481
               %_481
               (if ((lambda (%_482)
                      (if %_482 %_482 (%_477 (car %_479) (cadr %_479))))
                    (= (car %_479) (cadr %_479)))
                 (apply %_478 (cdr %_479))
                 '#f)))
           (null? (cdr %_479)))))
      (null? %_479)))))
(define gcd
  (lambda %_483
    (if (null? %_483)
      '0
      (if (null? (cdr %_483))
        (car %_483)
        (_gcd (car %_483) (cadr %_483))))))
(define lcm
  (lambda %_484
    (if (null? %_484)
      '1
      (if (null? (cdr %_484))
        (car %_484)
        (_lcm (car %_484) (cadr %_484))))))
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
  (lambda %_485
    (if (null? %_485)
      '""
      (if (null? (cdr %_485))
        (car %_485)
        (apply string-append
               (_string-append (car %_485) (cadr %_485))
               (cddr %_485))))))
(define char-downcase
  ((lambda (%_486)
     ((lambda (%_487)
        ((lambda (%_488)
           ((lambda ()
              (lambda (%_489)
                ((lambda (%_490)
                   (if (if (>= %_490 %_486) (<= %_490 %_487) '#f)
                     (integer->char (+ %_490 %_488))
                     %_489))
                 (char->integer %_489))))))
         (- (char->integer '#\a) %_486)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_491)
     ((lambda (%_492)
        ((lambda (%_493)
           ((lambda ()
              (lambda (%_494)
                ((lambda (%_495)
                   (if (if (>= %_495 %_491) (<= %_495 %_492) '#f)
                     (integer->char (- %_495 %_493))
                     %_494))
                 (char->integer %_494))))))
         (- %_491 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_496 %_497)
    (> (char->integer %_496) (char->integer %_497))))
(define char<?
  (lambda (%_498 %_499)
    (< (char->integer %_498) (char->integer %_499))))
(define char=? eq?)
(define char>=?
  (lambda (%_500 %_501)
    ((lambda (%_502)
       (if %_502 %_502 (char=? %_500 %_501)))
     (char>? %_500 %_501))))
(define char<=?
  (lambda (%_503 %_504)
    ((lambda (%_505)
       (if %_505 %_505 (char=? %_503 %_504)))
     (char<? %_503 %_504))))
(define char-ci>?
  (lambda (%_506 %_507)
    (char>?
      (char-downcase %_506)
      (char-downcase %_507))))
(define char-ci<?
  (lambda (%_508 %_509)
    (char<?
      (char-downcase %_508)
      (char-downcase %_509))))
(define char-ci=?
  (lambda (%_510 %_511)
    (char=?
      (char-downcase %_510)
      (char-downcase %_511))))
(define char-ci>=?
  (lambda (%_512 %_513)
    ((lambda (%_514)
       (if %_514 %_514 (char-ci=? %_512 %_513)))
     (char-ci>? %_512 %_513))))
(define char-ci<=?
  (lambda (%_515 %_516)
    ((lambda (%_517)
       (if %_517 %_517 (char-ci=? %_515 %_516)))
     (char-ci<? %_515 %_516))))
(define char-alphabetic?
  (lambda (%_518)
    (if (char-ci>=? %_518 '#\a)
      (char-ci<=? %_518 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_519)
    (if (char-ci>=? %_519 '#\0)
      (char-ci<=? %_519 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_520)
    (if (memq %_520 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_521)
    (if (char-alphabetic? %_521) (char<? '#\a) '#f)))
(define char-lower-case?
  (lambda (%_522)
    (if (char-alphabetic? %_522) (char>? '#\z) '#f)))
(define string-downcase (void))
(define string-upcase (void))
((lambda (%_523)
   (begin
     (set! %_523
       (lambda (%_528 %_529 %_530 %_531 %_532)
         (if (< %_531 %_532)
           (begin
             (string-set!
               %_529
               %_531
               (%_530 (string-ref %_528 %_531)))
             (%_523 %_528 %_529 %_530 (+ %_531 '1) %_532))
           %_529)))
     (begin
       (set! string-downcase
         (lambda (%_524)
           ((lambda (%_525)
              (%_523 %_524
                     %_525
                     char-downcase
                     '0
                     (string-length %_524)))
            (make-string (string-length %_524)))))
       (set! string-upcase
         (lambda (%_526)
           ((lambda (%_527)
              (%_523 %_526
                     %_527
                     char-upcase
                     '0
                     (string-length %_526)))
            (make-string (string-length %_526))))))))
 #f)
(define string=? equal?)
(define string<?
  ((lambda (%_533)
     (begin
       (set! %_533
         (lambda (%_536 %_537)
           (if (null? %_536)
             '#f
             (if (null? %_537)
               '#t
               ((lambda (%_538 %_539)
                  (if (char<? %_538 %_539)
                    '#t
                    (if (char=? %_538 %_539)
                      '#f
                      (%_533 (cdr %_536) (cdr %_537)))))
                (car %_536)
                (car %_537))))))
       (lambda (%_534 %_535)
         (%_533 (string->list %_534) (string->list %_535)))))
   #f))
(define string>?
  ((lambda (%_540)
     (begin
       (set! %_540
         (lambda (%_543 %_544)
           (if (null? %_543)
             '#f
             (if (null? %_544)
               '#t
               ((lambda (%_545 %_546)
                  (if (char>? %_545 %_546)
                    '#t
                    (if (char=? %_545 %_546)
                      '#f
                      (%_540 (cdr %_543) (cdr %_544)))))
                (car %_543)
                (car %_544))))))
       (lambda (%_541 %_542)
         (%_540 (string->list %_541) (string->list %_542)))))
   #f))
(define string<=?
  (lambda (%_547 %_548)
    ((lambda (%_549)
       (if %_549 %_549 (string=? %_547 %_548)))
     (string<? %_547 %_548))))
(define string>=?
  (lambda (%_550 %_551)
    ((lambda (%_552)
       (if %_552 %_552 (string=? %_550 %_551)))
     (string>? %_550 %_551))))
(define string-ci=?
  (lambda (%_553 %_554)
    (string=?
      (string-downcase %_553)
      (string-downcase %_554))))
(define string-ci<?
  (lambda (%_555 %_556)
    (string<?
      (string-downcase %_555)
      (string-downcase %_556))))
(define string-ci>?
  (lambda (%_557 %_558)
    (string>?
      (string-downcase %_557)
      (string-downcase %_558))))
(define string-ci>=?
  (lambda (%_559 %_560)
    (string>=?
      (string-downcase %_559)
      (string-downcase %_560))))
(define string-ci<=?
  (lambda (%_561 %_562)
    (string<=?
      (string-downcase %_561)
      (string-downcase %_562))))
(define substring
  ((lambda (%_563)
     (begin
       (set! %_563
         (lambda (%_568 %_569 %_570 %_571 %_572)
           (if (< %_571 %_572)
             (begin
               (string-set!
                 %_569
                 %_570
                 (string-ref %_568 %_571))
               (%_563 %_568
                      %_569
                      (+ %_570 '1)
                      (+ %_571 '1)
                      %_572))
             (void))))
       (lambda (%_564 %_565 %_566)
         ((lambda (%_567)
            (begin (%_563 %_564 %_567 '0 %_565 %_566) %_567))
          (make-string (- %_566 %_565))))))
   #f))
(define format
  ((lambda (%_573)
     (begin
       (set! %_573
         (lambda (%_576 %_577 %_578)
           (if (null? %_576)
             (get-output-string %_578)
             (if (eq? (car %_576) '#\~)
               (begin
                 ((lambda (%_579)
                    (if (memv %_579 '(#\s))
                      (write (car %_577) %_578)
                      (if (memv %_579 '(#\a))
                        (display (car %_577) %_578)
                        (if (memv %_579 '(#\a))
                          (write-char (car %_577) %_578)
                          (if (memv %_579 '(#\%))
                            (display '#\newline %_578)
                            (if (memv %_579 '(#\~))
                              (display '#\~ %_578)
                              (void)))))))
                  (cadr %_576))
                 (%_573 (cddr %_576)
                        (if (not (null? %_577)) (cdr %_577) '())
                        %_578))
               (begin
                 (display (car %_576) %_578)
                 (%_573 (cdr %_576) %_577 %_578))))))
       (lambda (%_575 . %_574)
         (%_573 (string->list %_575)
                %_574
                (open-output-string)))))
   #f))
(define error
  ((lambda (%_580)
     (lambda %_581
       ((lambda (%_582)
          ((lambda (%_583)
             ((lambda (%_584)
                ((lambda ()
                   (if %_582
                     (if %_583
                       (%_580 (format
                                '"Error in ~s: ~a"
                                %_582
                                (apply format (cons %_583 %_584))))
                       (%_580 (format '"Error in ~s." %_582)))
                     (if %_583
                       (%_580 (format
                                '"Error: ~a"
                                (apply format (cons %_583 %_584))))
                       (%_580 '"Error."))))))
              (if (not %_583)
                '#f
                (if (not %_582) (cdr %_581) (cddr %_581)))))
           (if (not %_582)
             (if (not (null? %_581))
               (if (not (car %_581)) (cadr %_581) (car %_581))
               '#f)
             (if (not (null? (cdr %_581))) (cadr %_581) '#f))))
        (if (if (not (null? %_581))
              (symbol? (car %_581))
              '#f)
          (car %_581)
          '#f))))
   error))
(define list-ref
  (lambda (%_585 %_586)
    (if (zero? %_586)
      (car %_585)
      (list-ref (cdr %_585) (- %_586 '1)))))
(define iota
  ((lambda (%_587)
     (begin
       (set! %_587
         (lambda (%_589 %_590)
           (if (> %_589 %_590)
             '()
             (cons %_589 (%_587 (+ %_589 '1) %_590)))))
       (lambda (%_588) (%_587 '0 %_588))))
   #f))
(define values
  (lambda %_591
    (call-with-current-continuation
      (lambda (%_592) (apply %_592 %_591)))))
(if (not (getprop 'lite '*sisc*))
  (for-each
    load-module
    '("sisc.modules.SNative"
      "sisc.modules.J2S"
      "sisc.modules.SLogicOps"
      "sisc.modules.SNetwork"
      "sisc.modules.SDebug"))
  (void))
