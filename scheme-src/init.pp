(define for-each
  (lambda (%_272 . %_271)
    (if (null? %_271)
      (error 'for-each
             '"invalid number of arguments to procedure for-each")
      (if (not (null? (car %_271)))
        (begin
          (apply %_272 (map car %_271))
          (apply for-each (cons %_272 (map cdr %_271))))
        (void)))))
(define exit (lambda () '#!eof))
(define eof-object?
  (lambda (%_273) (eq? %_273 '#!eof)))
(define not (lambda (%_274) (if %_274 '#f '#t)))
(define eqv?
  (lambda (%_275 %_276)
    ((lambda (%_277)
       (if %_277
         %_277
         (if ((lambda (%_278)
                (if %_278
                  %_278
                  (if (inexact? %_275) (inexact? %_276) '#f)))
              (if (exact? %_275) (exact? %_276) '#f))
           (= %_275 %_276)
           '#f)))
     (eq? %_275 %_276))))
(define newline
  (lambda %_279
    (apply display (cons '#\newline %_279))))
(define map (void))
((lambda (%_280)
   (begin
     (set! %_280
       ((lambda (%_281)
          (begin
            (set! %_281
              (lambda (%_285 %_286 %_287 %_288)
                (if (null? %_288)
                  %_286
                  (begin
                    (set-cdr! %_287 (cons (%_285 (car %_288)) '()))
                    (%_281 %_285 %_286 (cdr %_287) (cdr %_288))))))
            (lambda (%_282 %_283)
              (if (null? %_283)
                '()
                ((lambda (%_284)
                   (%_281 %_282 %_284 %_284 (cdr %_283)))
                 (cons (%_282 (car %_283)) '()))))))
        #f))
     (set! map %_280)))
 #f)
(define compose
  (lambda (%_289 %_290)
    (lambda (%_291) (%_289 (%_290 %_291)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
((lambda (%_292 %_293)
   (begin
     (set! %_292
       (lambda (%_306 %_307 %_308)
         (if (null? %_308)
           '#f
           (if (%_306 (caar %_308) %_307)
             (car %_308)
             (%_292 %_306 %_307 (cdr %_308))))))
     (set! %_293
       (lambda (%_309 %_310 %_311)
         (if (null? %_311)
           '#f
           (if (%_309 (car %_311) %_310)
             %_311
             (%_293 %_309 %_310 (cdr %_311))))))
     (begin
       (set! assq
         (lambda (%_294 %_295) (%_292 eq? %_294 %_295)))
       (set! assv
         (lambda (%_296 %_297) (%_292 eqv? %_296 %_297)))
       (set! assoc
         (lambda (%_298 %_299) (%_292 equal? %_298 %_299)))
       (set! memq
         (lambda (%_300 %_301) (%_293 eq? %_300 %_301)))
       (set! memv
         (lambda (%_302 %_303) (%_293 eqv? %_302 %_303)))
       (set! member
         (lambda (%_304 %_305) (%_293 equal? %_304 %_305))))))
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
  (lambda (%_312 %_313)
    (if (null? %_312)
      %_313
      (cons (car %_312) (append2 (cdr %_312) %_313)))))
(define append append2)
(define list->string
  (lambda (%_314)
    ((lambda (%_315)
       (begin
         (set! %_315
           (lambda (%_316 %_317 %_318)
             (if (null? %_316)
               %_317
               (begin
                 (string-set! %_317 %_318 (car %_316))
                 (%_315 (cdr %_316) %_317 (+ %_318 '1))))))
         (%_315 %_314 (make-string (length %_314)) '0)))
     #f)))
(define string->list
  ((lambda (%_319)
     (begin
       (set! %_319
         (lambda (%_321 %_322 %_323)
           (if (< %_323 '0)
             %_322
             (%_319 %_321
                    (cons (string-ref %_321 %_323) %_322)
                    (- %_323 '1)))))
       (lambda (%_320)
         (%_319 %_320 '() (- (string-length %_320) '1)))))
   #f))
(define list->vector
  ((lambda (%_324)
     (begin
       (set! %_324
         (lambda (%_326 %_327 %_328)
           (if (null? %_326)
             %_327
             (begin
               (vector-set! %_327 %_328 (car %_326))
               (%_324 (cdr %_326) %_327 (+ %_328 '1))))))
       (lambda (%_325)
         (%_324 %_325 (make-vector (length %_325)) '0))))
   #f))
(define vector
  (lambda %_329 (list->vector %_329)))
(define string
  (lambda %_330 (list->string %_330)))
(define detect-os
  (lambda ()
    ((lambda (%_331)
       (if (> (string-length %_331) '3)
         (if (equal? (substring %_331 '0 '3) '"mac")
           'macos
           (if (equal? (substring %_331 '0 '3) '"win")
             'ms-dos
             (if (equal? (substring %_331 '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring %_331 '0 '3) '"uni")
                 'unix
                 (if (equal? (substring %_331 '0 '3) '"lin")
                   'unix
                   (if (equal? (substring %_331 '0 '4) '"os/")
                     'os2
                     (if (equal? (substring %_331 '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase
       (getprop 'os.name '*environment-variables*)))))
(define current-directory (void))
((lambda (%_332 %_333 %_334)
   (begin
     (set! %_332
       (lambda %_349
         (if (null? %_349)
           (getprop 'current-directory '*sisc*)
           (putprop 'current-directory '*sisc* (car %_349)))))
     (set! %_333
       (lambda (%_350)
         (if ((lambda (%_351)
                (if %_351
                  %_351
                  (if (memq (detect-os) '(ms-dos windows))
                    (if (> (string-length %_350) '1)
                      (eq? (string-ref %_350 '1) '#\:)
                      '#f)
                    '#f)))
              (absolute-path? %_350))
           %_350
           (make-path (%_332) %_350))))
     (set! %_334
       (lambda (%_352 %_353)
         (if (eq? (file-type %_352) %_353)
           '#t
           (error 'file-type
                  '"~s is not of type ~s"
                  %_352
                  %_353))))
     ((lambda (%_338 %_337 %_336 %_335)
        (begin
          (set! %_338
            ((lambda (%_339)
               (lambda (%_340) (%_339 (%_333 %_340))))
             load))
          (set! %_337
            ((lambda (%_341)
               (lambda (%_342)
                 ((lambda (%_343)
                    (if (not (memq (file-type %_343) '(no-file file)))
                      (error 'open-output-file
                             '"~s points to a directory"
                             %_343)
                      (%_341 %_343)))
                  (%_333 %_342))))
             open-output-file))
          (set! %_336
            ((lambda (%_344)
               (lambda (%_345)
                 ((lambda (%_346)
                    (begin (%_334 %_346 'file) (%_344 %_346)))
                  (%_333 %_345))))
             open-input-file))
          (set! %_335
            (lambda %_347
              (if (null? %_347)
                (%_332)
                ((lambda (%_348)
                   (begin (%_334 %_348 'directory) (%_332 %_348)))
                 (%_333 (car %_347))))))
          (begin
            (%_332 '".")
            (set! load %_338)
            (set! current-directory %_335)
            (set! open-input-file %_336)
            (set! open-output-file %_337))))
      #f
      #f
      #f
      #f)))
 #f
 #f
 #f)
(define with-input-from-file
  (lambda (%_354 %_355)
    ((lambda (%_356 %_357)
       (dynamic-wind
         void
         (lambda ()
           (begin (current-input-port %_357) (%_355)))
         (lambda () (current-input-port %_356))))
     (current-input-port)
     (open-input-file %_354))))
(define with-output-to-file
  (lambda (%_358 %_359)
    ((lambda (%_360 %_361)
       (dynamic-wind
         void
         (lambda ()
           (begin (current-output-port %_361) (%_359)))
         (lambda () (current-output-port %_360))))
     (current-output-port)
     (open-output-file %_358))))
(define call-with-input-file
  (lambda (%_362 %_363)
    ((lambda (%_364)
       ((lambda (%_365)
          ((lambda ()
             (begin (close-input-port %_364) %_365))))
        (%_363 %_364)))
     (open-input-file %_362))))
(define call-with-output-file
  (lambda (%_366 %_367)
    ((lambda (%_368)
       ((lambda (%_369)
          ((lambda ()
             (begin (close-output-port %_368) %_369))))
        (%_367 %_368)))
     (open-output-file %_366))))
(define reverse
  ((lambda (%_370)
     (begin
       (set! %_370
         (lambda (%_372 %_373)
           (if (null? %_372)
             %_373
             (%_370 (cdr %_372) (cons (car %_372) %_373)))))
       (lambda (%_371) (%_370 %_371 '()))))
   #f))
(define remove
  (lambda (%_374 %_375)
    (if (null? %_375)
      '()
      (if (equal? (car %_375) %_374)
        (remove %_374 (cdr %_375))
        (cons (car %_375) (remove %_374 (cdr %_375)))))))
(define append
  ((lambda (%_376)
     (begin
       (set! %_376
         (lambda (%_379 . %_378)
           (if (null? %_378)
             %_379
             (if (null? %_379)
               (apply %_376 %_378)
               (apply %_376
                      (cons (append2 %_379 (car %_378)) (cdr %_378)))))))
       (lambda %_377
         (if (null? %_377)
           '()
           (if (null? (cdr %_377))
             (car %_377)
             (apply %_376 (cons (car %_377) (cdr %_377))))))))
   #f))
(define map
  ((lambda (%_380 %_381)
     (begin
       (set! %_380 map)
       (set! %_381
         (lambda (%_385 %_386 %_387 %_388)
           (if (null? (car %_386))
             (if (andmap null? %_386)
               %_387
               (error 'map '"lists are not of equal length"))
             ((lambda (%_389 %_390)
                (begin
                  (if (not (null? %_388))
                    (set-cdr! %_388 %_389)
                    (void))
                  (if (null? %_387)
                    (%_381 %_385 %_390 %_389 %_389)
                    (%_381 %_385 %_390 %_387 %_389))))
              (cons (apply %_385 (%_380 car %_386)) '())
              (%_380 cdr %_386)))))
       (lambda (%_384 %_383 . %_382)
         (if (null? %_382)
           (%_380 %_384 %_383)
           (%_381 %_384 (cons %_383 %_382) '() '())))))
   #f
   #f))
(define circular?
  ((lambda (%_391)
     (begin
       (set! %_391
         (lambda (%_393 %_394)
           (if ((lambda (%_396) (if %_396 %_396 (null? %_394)))
                (null? %_393))
             '#f
             (if (if (pair? %_394) (null? (cdr %_394)) '#f)
               '#f
               (if ((lambda (%_395)
                      (if %_395 %_395 (not (pair? (cdr %_394)))))
                    (not (pair? %_394)))
                 '#f
                 (if (eq? %_393 %_394)
                   '#t
                   (%_391 (cdr %_393) (cddr %_394))))))))
       (lambda (%_392)
         (if (pair? %_392) (%_391 %_392 (cdr %_392)) '#f))))
   #f))
(define list?
  ((lambda (%_397)
     (begin
       (set! %_397
         (lambda (%_400 %_401)
           ((lambda (%_402)
              (if %_402
                %_402
                ((lambda (%_403)
                   (if %_403
                     %_403
                     (if (pair? %_401)
                       ((lambda (%_404)
                          (if %_404
                            %_404
                            (if (not (eq? %_400 %_401))
                              (%_397 (cdr %_400) (cddr %_401))
                              '#f)))
                        (null? (cdr %_401)))
                       '#f)))
                 (null? %_401))))
            (null? %_400))))
       (lambda (%_398)
         ((lambda (%_399)
            (if %_399
              %_399
              (if (pair? %_398) (%_397 %_398 (cdr %_398)) '#f)))
          (null? %_398)))))
   #f))
(define expt
  (lambda (%_405 %_406)
    (if (if (integer? %_406) (= %_405 '2) '#f)
      (ashl '1 %_406)
      (((lambda (%_407)
          (begin
            (set! %_407
              (lambda (%_408 %_409 %_410)
                (if (zero? %_408)
                  %_409
                  (%_407 (quotient %_408 '2)
                         (if (odd? %_408) (* %_409 %_410) %_409)
                         (* %_410 %_410)))))
            %_407))
        #f)
       %_406
       '1
       %_405))))
(define modpow
  (lambda (%_411 %_412 %_413)
    ((lambda (%_414)
       (if (= %_412 '1)
         (modulo %_411 %_413)
         (if (even? %_412)
           ((lambda (%_416) (modulo (* %_416 %_416) %_413))
            (modpow %_411 (/ %_412 '2) %_413))
           ((lambda (%_415)
              (begin
                (set! %_415 (modulo (* %_415 %_415) %_413))
                (modulo (* %_411 %_415) %_413)))
            (modpow %_411 (/ (- %_412 '1) '2) %_413)))))
     '0)))
(define integer?
  ((lambda (%_417)
     (lambda (%_418)
       ((lambda (%_419)
          (if %_419
            %_419
            (if (real? %_418) (= (round %_418) %_418) '#f)))
        (%_417 %_418))))
   integer?))
(define real?
  ((lambda (%_420)
     (lambda (%_421) (not (%_420 %_421))))
   complex?))
(define complex? number?)
(define abs
  (lambda (%_422)
    (if (not (real? %_422))
      ((lambda (%_423 %_424)
         (sqrt (+ (* %_423 %_423) (* %_424 %_424))))
       (real-part %_422)
       (imag-part %_422))
      (if (< %_422 '0) (- %_422) %_422))))
(define min (void))
(define max (void))
((lambda (%_425)
   (begin
     (set! %_425
       (lambda (%_428 %_429 %_430 %_431)
         (if (null? %_430)
           (if (if %_431 (exact? %_429) '#f)
             (exact->inexact %_429)
             %_429)
           (if (%_428 (car %_430) %_429)
             (%_425 %_428
                    (car %_430)
                    (cdr %_430)
                    ((lambda (%_432)
                       (if %_432 %_432 (inexact? (car %_430))))
                     %_431))
             (%_425 %_428 %_429 (cdr %_430) %_431)))))
     (begin
       (set! min
         (lambda %_426
           (if (null? %_426)
             '0
             (%_425 <
                    (car %_426)
                    (cdr %_426)
                    (inexact? (car %_426))))))
       (set! max
         (lambda %_427
           (if (null? %_427)
             '0
             (%_425 >
                    (car %_427)
                    (cdr %_427)
                    (inexact? (car %_427)))))))))
 #f)
(define negative? (lambda (%_433) (< %_433 '0)))
(define positive? (lambda (%_434) (> %_434 '0)))
(define even?
  (lambda (%_435) (= '0 (modulo %_435 '2))))
(define odd?
  (lambda (%_436) (not (even? %_436))))
(define zero? (lambda (%_437) (= %_437 '0)))
(define >= (void))
(define <= (void))
((lambda (%_438 %_439)
   (begin
     (set! <=
       (%_438 (lambda (%_440 %_441)
                ((lambda (%_442) (if %_442 %_442 (= %_440 %_441)))
                 (< %_440 %_441)))
              %_439
              '#t))
     (set! >=
       (%_438 (lambda (%_443 %_444)
                ((lambda (%_445) (if %_445 %_445 (= %_443 %_444)))
                 (> %_443 %_444)))
              %_439
              '#t))))
 (lambda (%_446 %_447 %_448)
   (lambda %_449
     (((lambda (%_450)
         (begin
           (set! %_450
             (lambda (%_451)
               (if (null? %_451)
                 %_448
                 (if (null? (cdr %_451))
                   %_448
                   (%_447 (%_446 (car %_451) (cadr %_451))
                          (%_450 (cdr %_451)))))))
           %_450))
       #f)
      %_449)))
 (lambda (%_452 %_453) (if %_452 %_453 '#f)))
((lambda (%_454)
   (begin
     (set! >= (%_454 > >=))
     (set! <= (%_454 < <=))))
 (lambda (%_455 %_456)
   (lambda %_457
     ((lambda (%_458)
        (if %_458
          %_458
          ((lambda (%_459)
             (if %_459
               %_459
               (if ((lambda (%_460)
                      (if %_460 %_460 (%_455 (car %_457) (cadr %_457))))
                    (= (car %_457) (cadr %_457)))
                 (apply %_456 (cdr %_457))
                 '#f)))
           (null? (cdr %_457)))))
      (null? %_457)))))
(define gcd
  (lambda %_461
    (if (null? %_461)
      '0
      (if (null? (cdr %_461))
        (car %_461)
        (_gcd (car %_461) (cadr %_461))))))
(define lcm
  (lambda %_462
    (if (null? %_462)
      '1
      (if (null? (cdr %_462))
        (car %_462)
        (_lcm (car %_462) (cadr %_462))))))
(max-precision '1500)
(define pi-10 '3.1415926536)
(define pi-70
  '3.1415926535897932384626433832795028841971693993751058209749445923078164)
(define pi-1000
  '3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679821480865132823066470938446095505822317253594081284811174502841027019385211055596446229489549303819644288109756659334461284756482337867831652712019091456485669234603486104543266482133936072602491412737245870066063155881748815209209628292540917153643678925903600113305305488204665213841469519415116094330572703657595919530921861173819326117931051185480744623799627495673518857527248912279381830119491298336733624406566430860213949463952247371907021798609437027705392171762931767523846748184676694051320005681271452635608277857713427577896091736371787214684409012249534301465495853710507922796892589235420199561121290219608640344181598136297747713099605187072113499999983729780499510597317328160963185950244594553469083026425223082533446850352619311881710100031378387528865875332083814206171776691473035982534904287554687311595628638823537875937519577818577805321712268066130019278766111959092164201989)
(define pi pi-10)
(define e-10 '2.7182818285)
(define e-70
  '2.7182818284590452353602874713526624977572470936999595749669676277240766)
(define e-1000
  '2.7182818284590452353602874713526624977572470936999595749669676277240766303535475945713821785251664274274663919320030599218174135966290435729003342952605956307381323286279434907632338298807531952510190115738341879307021540891499348841675092447614606680822648001684774118537423454424371075390777449920695517027618386062613313845830007520449338265602976067371132007093287091274437470472306969772093101416928368190255151086574637721112523897844250569536967707854499699679468644549059879316368892300987931277361782154249992295763514822082698951936680331825288693984964651058209392398294887933203625094431173012381970684161403970198376793206832823764648042953118023287825098194558153017567173613320698112509961818815930416903515988885193458072738667385894228792284998920868058257492796104841984443634632449684875602336248270419786232090021609902353043699418491463140934317381436405462531520961836908887070167683964243781405927145635490613031072085103837505101157477041718986106873969655212671546889570350354)
(define e e-10)
(max-precision '16)
(define string-append
  (lambda %_463
    (if (null? %_463)
      '""
      (if (null? (cdr %_463))
        (car %_463)
        (apply string-append
               (_string-append (car %_463) (cadr %_463))
               (cddr %_463))))))
(define char-downcase
  ((lambda (%_464)
     ((lambda (%_465)
        ((lambda (%_466)
           ((lambda ()
              (lambda (%_467)
                ((lambda (%_468)
                   (if (if (>= %_468 %_464) (<= %_468 %_465) '#f)
                     (integer->char (+ %_468 %_466))
                     %_467))
                 (char->integer %_467))))))
         (- (char->integer '#\a) %_464)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_469)
     ((lambda (%_470)
        ((lambda (%_471)
           ((lambda ()
              (lambda (%_472)
                ((lambda (%_473)
                   (if (if (>= %_473 %_469) (<= %_473 %_470) '#f)
                     (integer->char (- %_473 %_471))
                     %_472))
                 (char->integer %_472))))))
         (- %_469 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_474 %_475)
    (> (char->integer %_474) (char->integer %_475))))
(define char<?
  (lambda (%_476 %_477)
    (< (char->integer %_476) (char->integer %_477))))
(define char=? eq?)
(define char>=?
  (lambda (%_478 %_479)
    ((lambda (%_480)
       (if %_480 %_480 (char=? %_478 %_479)))
     (char>? %_478 %_479))))
(define char<=?
  (lambda (%_481 %_482)
    ((lambda (%_483)
       (if %_483 %_483 (char=? %_481 %_482)))
     (char<? %_481 %_482))))
(define char-ci>?
  (lambda (%_484 %_485)
    (char>?
      (char-downcase %_484)
      (char-downcase %_485))))
(define char-ci<?
  (lambda (%_486 %_487)
    (char<?
      (char-downcase %_486)
      (char-downcase %_487))))
(define char-ci=?
  (lambda (%_488 %_489)
    (char=?
      (char-downcase %_488)
      (char-downcase %_489))))
(define char-ci>=?
  (lambda (%_490 %_491)
    ((lambda (%_492)
       (if %_492 %_492 (char-ci=? %_490 %_491)))
     (char-ci>? %_490 %_491))))
(define char-ci<=?
  (lambda (%_493 %_494)
    ((lambda (%_495)
       (if %_495 %_495 (char-ci=? %_493 %_494)))
     (char-ci<? %_493 %_494))))
(define char-alphabetic?
  (lambda (%_496)
    (if (char-ci>=? %_496 '#\a)
      (char-ci<=? %_496 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_497)
    (if (char-ci>=? %_497 '#\0)
      (char-ci<=? %_497 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_498)
    (if (memq %_498 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_499)
    (if (char-alphabetic? %_499) (char<? '#\a) '#f)))
(define char-lower-case?
  (lambda (%_500)
    (if (char-alphabetic? %_500) (char>? '#\z) '#f)))
(define string-downcase (void))
(define string-upcase (void))
((lambda (%_501)
   (begin
     (set! %_501
       (lambda (%_506 %_507 %_508 %_509 %_510)
         (if (< %_509 %_510)
           (begin
             (string-set!
               %_507
               %_509
               (%_508 (string-ref %_506 %_509)))
             (%_501 %_506 %_507 %_508 (+ %_509 '1) %_510))
           %_507)))
     (begin
       (set! string-downcase
         (lambda (%_502)
           ((lambda (%_503)
              (%_501 %_502
                     %_503
                     char-downcase
                     '0
                     (string-length %_502)))
            (make-string (string-length %_502)))))
       (set! string-upcase
         (lambda (%_504)
           ((lambda (%_505)
              (%_501 %_504
                     %_505
                     char-upcase
                     '0
                     (string-length %_504)))
            (make-string (string-length %_504))))))))
 #f)
(define string=? equal?)
(define string<?
  ((lambda (%_511)
     (begin
       (set! %_511
         (lambda (%_514 %_515)
           (if (null? %_514)
             '#f
             (if (null? %_515)
               '#t
               ((lambda (%_516 %_517)
                  (if (char<? %_516 %_517)
                    '#t
                    (if (char=? %_516 %_517)
                      '#f
                      (%_511 (cdr %_514) (cdr %_515)))))
                (car %_514)
                (car %_515))))))
       (lambda (%_512 %_513)
         (%_511 (string->list %_512) (string->list %_513)))))
   #f))
(define string>?
  ((lambda (%_518)
     (begin
       (set! %_518
         (lambda (%_521 %_522)
           (if (null? %_521)
             '#f
             (if (null? %_522)
               '#t
               ((lambda (%_523 %_524)
                  (if (char>? %_523 %_524)
                    '#t
                    (if (char=? %_523 %_524)
                      '#f
                      (%_518 (cdr %_521) (cdr %_522)))))
                (car %_521)
                (car %_522))))))
       (lambda (%_519 %_520)
         (%_518 (string->list %_519) (string->list %_520)))))
   #f))
(define string<=?
  (lambda (%_525 %_526)
    ((lambda (%_527)
       (if %_527 %_527 (string=? %_525 %_526)))
     (string<? %_525 %_526))))
(define string>=?
  (lambda (%_528 %_529)
    ((lambda (%_530)
       (if %_530 %_530 (string=? %_528 %_529)))
     (string>? %_528 %_529))))
(define string-ci=?
  (lambda (%_531 %_532)
    (string=?
      (string-downcase %_531)
      (string-downcase %_532))))
(define string-ci<?
  (lambda (%_533 %_534)
    (string<?
      (string-downcase %_533)
      (string-downcase %_534))))
(define string-ci>?
  (lambda (%_535 %_536)
    (string>?
      (string-downcase %_535)
      (string-downcase %_536))))
(define string-ci>=?
  (lambda (%_537 %_538)
    (string>=?
      (string-downcase %_537)
      (string-downcase %_538))))
(define string-ci<=?
  (lambda (%_539 %_540)
    (string<=?
      (string-downcase %_539)
      (string-downcase %_540))))
(define substring
  ((lambda (%_541)
     (begin
       (set! %_541
         (lambda (%_546 %_547 %_548 %_549 %_550)
           (if (< %_549 %_550)
             (begin
               (string-set!
                 %_547
                 %_548
                 (string-ref %_546 %_549))
               (%_541 %_546
                      %_547
                      (+ %_548 '1)
                      (+ %_549 '1)
                      %_550))
             (void))))
       (lambda (%_542 %_543 %_544)
         ((lambda (%_545)
            (begin (%_541 %_542 %_545 '0 %_543 %_544) %_545))
          (make-string (- %_544 %_543))))))
   #f))
(define format
  ((lambda (%_551)
     (begin
       (set! %_551
         (lambda (%_554 %_555 %_556)
           (if (null? %_554)
             (get-output-string %_556)
             (if (eq? (car %_554) '#\~)
               (begin
                 ((lambda (%_557)
                    (if (memv %_557 '(#\s))
                      (write (car %_555) %_556)
                      (if (memv %_557 '(#\a))
                        (display (car %_555) %_556)
                        (if (memv %_557 '(#\a))
                          (write-char (car %_555) %_556)
                          (if (memv %_557 '(#\%))
                            (display '#\newline %_556)
                            (if (memv %_557 '(#\~))
                              (display '#\~ %_556)
                              (void)))))))
                  (cadr %_554))
                 (%_551 (cddr %_554)
                        (if (not (null? %_555)) (cdr %_555) '())
                        %_556))
               (begin
                 (display (car %_554) %_556)
                 (%_551 (cdr %_554) %_555 %_556))))))
       (lambda (%_553 . %_552)
         (%_551 (string->list %_553)
                %_552
                (open-output-string)))))
   #f))
(define error
  ((lambda (%_558)
     (lambda %_559
       ((lambda (%_560)
          ((lambda (%_561)
             ((lambda (%_562)
                ((lambda ()
                   (if %_560
                     (if %_561
                       (%_558 (format
                                '"Error in ~s: ~a"
                                %_560
                                (apply format (cons %_561 %_562))))
                       (%_558 (format '"Error in ~s." %_560)))
                     (if %_561
                       (%_558 (format
                                '"Error: ~a"
                                (apply format (cons %_561 %_562))))
                       (%_558 '"Error."))))))
              (if (not %_561)
                '#f
                (if (not %_560) (cdr %_559) (cddr %_559)))))
           (if (not %_560)
             (if (not (null? %_559)) (car %_559) '#f)
             (if (not (null? (cdr %_559))) (cadr %_559) '#f))))
        (if (if (not (null? %_559))
              (symbol? (car %_559))
              '#f)
          (car %_559)
          '#f))))
   error))
(define list-ref
  (lambda (%_563 %_564)
    (if (zero? %_564)
      (car %_563)
      (list-ref (cdr %_563) (- %_564 '1)))))
(define iota
  ((lambda (%_565)
     (begin
       (set! %_565
         (lambda (%_567 %_568)
           (if (> %_567 %_568)
             '()
             (cons %_567 (%_565 (+ %_567 '1) %_568)))))
       (lambda (%_566) (%_565 '0 %_566))))
   #f))
(define values
  (lambda %_569
    (call-with-current-continuation
      (lambda (%_570) (apply %_570 %_569)))))
(load-module "sisc.modules.SNative")