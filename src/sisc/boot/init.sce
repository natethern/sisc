(#%program
  ((_make-native-parameter . 1))
  ()
  (_make-native-parameter)
  (#%define hedged-inlining
    (_make-native-parameter "hedgedInlining")))
(#%program
  ((hedged-inlining . 1))
  ()
  (hedged-inlining)
  (hedged-inlining #f))
(#%program () () () #!void)
(#%program
  ((map-cdr . 1)
   (for-each . 1)
   (map-car . 1)
   (|%%_tiugbER1t_proc| . 2)
   (apply . 2)
   (cons . 1)
   (|%%_tiOnfKQ1t_lists| . 4)
   (|%%_ti8kdbR1t_ls1| . 2)
   (null? . 1))
  ((|%%_tiOnfKQ1t_lists| . 1))
  (cons map-car apply map-cdr for-each null?)
  (#%define for-each
    (#%lambda #t
      (|%%_tiugbER1t_proc|
        |%%_ti8kdbR1t_ls1|
        .
        |%%_tiOnfKQ1t_lists|)
      ()
      (#%if (null? |%%_ti8kdbR1t_ls1|)
        #!void
        (#%begin
          (#%set! |%%_tiOnfKQ1t_lists|
            (cons |%%_ti8kdbR1t_ls1| |%%_tiOnfKQ1t_lists|))
          (apply |%%_tiugbER1t_proc|
                 (map-car |%%_tiOnfKQ1t_lists|))
          (apply for-each
                 |%%_tiugbER1t_proc|
                 (map-cdr |%%_tiOnfKQ1t_lists|)))))))
(#%program
  ((|%%_tiQc95S1t_x| . 1) (eq? . 1))
  ()
  (eq?)
  (#%define eof-object?
    (#%lambda #t
      (|%%_tiQc95S1t_x|)
      ()
      (eq? |%%_tiQc95S1t_x| #!eof))))
(#%program
  ((|%%_tia97yS1t_x| . 1))
  ()
  ()
  (#%define not
    (#%lambda #t
      (|%%_tia97yS1t_x|)
      ()
      (#%if |%%_tia97yS1t_x| #f #t))))
(#%program
  ((|%%_tiw55_S1t_port| . 1)
   (display . 1)
   (apply . 1))
  ()
  (display apply)
  (#%define newline
    (#%lambda #t
      |%%_tiw55_S1t_port|
      ()
      (apply display #\newline |%%_tiw55_S1t_port|))))
(#%program
  ((|%%_tic-0VT1t_ls| . 1)
   (car . 1)
   (cons . 1)
   (cdr . 1)
   (|%%_tiS13sT1t_iter| . 2)
   (|%%_tiUSYOU1t_acc| . 2)
   (|%%_tiyW-lU1t_ls| . 3)
   (null? . 1))
  ((|%%_tiS13sT1t_iter| . 1))
  (cdr car cons null?)
  (#%define reverse
    (#%letrec #t
      ((|%%_tiS13sT1t_iter|
         (#%lambda #t
           (|%%_tiyW-lU1t_ls| |%%_tiUSYOU1t_acc|)
           (|%%_tiS13sT1t_iter|)
           (#%if (null? |%%_tiyW-lU1t_ls|)
             |%%_tiUSYOU1t_acc|
             (|%%_tiS13sT1t_iter|
               (cdr |%%_tiyW-lU1t_ls|)
               (cons (car |%%_tiyW-lU1t_ls|) |%%_tiUSYOU1t_acc|))))))
      ()
      (#%lambda #t
        (|%%_tic-0VT1t_ls|)
        (|%%_tiS13sT1t_iter|)
        (|%%_tiS13sT1t_iter| |%%_tic-0VT1t_ls| ())))))
(#%program
  ((|%%_tiALUIV1t_s| . 1)
   (cdr . 1)
   (|%%_tiCAO3X1t_d| . 1)
   (|%%_tiePWfV1t_iter| . 2)
   (set-cdr! . 1)
   (|%%_tigEQCW1t_r| . 2)
   (|%%_tiWHS9W1t_s| . 4)
   (null? . 1))
  ((|%%_tiePWfV1t_iter| . 1))
  (set-cdr! cdr null?)
  (#%define reverse!
    (#%letrec #t
      ((|%%_tiePWfV1t_iter|
         (#%lambda #t
           (|%%_tiWHS9W1t_s| |%%_tigEQCW1t_r|)
           (|%%_tiePWfV1t_iter|)
           (#%if (null? |%%_tiWHS9W1t_s|)
             |%%_tigEQCW1t_r|
             ((#%lambda #t
                (|%%_tiCAO3X1t_d|)
                (|%%_tigEQCW1t_r|
                  |%%_tiWHS9W1t_s|
                  |%%_tiePWfV1t_iter|)
                (#%begin
                  (set-cdr! |%%_tiWHS9W1t_s| |%%_tigEQCW1t_r|)
                  (|%%_tiePWfV1t_iter|
                    |%%_tiCAO3X1t_d|
                    |%%_tiWHS9W1t_s|)))
              (cdr |%%_tiWHS9W1t_s|))))))
      ()
      (#%lambda #t
        (|%%_tiALUIV1t_s|)
        (|%%_tiePWfV1t_iter|)
        (|%%_tiePWfV1t_iter| |%%_tiALUIV1t_s| ())))))
(#%program
  ((cdr . 1)
   (map-car . 1)
   (caar . 1)
   (cons . 1)
   (|%%_tiYwMwX1t_ls| . 3)
   (null? . 1))
  ()
  (cons caar cdr map-car null?)
  (#%define map-car
    (#%lambda #t
      (|%%_tiYwMwX1t_ls|)
      ()
      (#%if (null? |%%_tiYwMwX1t_ls|)
        ()
        (cons (caar |%%_tiYwMwX1t_ls|)
              (map-car (cdr |%%_tiYwMwX1t_ls|)))))))
(#%program
  ((cdr . 1)
   (map-cdr . 1)
   (cdar . 1)
   (cons . 1)
   (|%%_tiitKZX1t_ls| . 3)
   (null? . 1))
  ()
  (cons cdar cdr map-cdr null?)
  (#%define map-cdr
    (#%lambda #t
      (|%%_tiitKZX1t_ls|)
      ()
      (#%if (null? |%%_tiitKZX1t_ls|)
        ()
        (cons (cdar |%%_tiitKZX1t_ls|)
              (map-cdr (cdr |%%_tiitKZX1t_ls|)))))))
(#%program
  ((|%%_tiGeCNZ1t_list1| . 2)
   (|%%_ti0bAe-1t_proc| . 2)
   (|%%_tikiEkZ1t_lists| . 2)
   (map-car . 1)
   (apply . 1)
   (|%%_ti4RnY02t_lists| . 2)
   (map-cdr . 1)
   (|%%_tioYr202t_proc| . 2)
   (|%%_ti-lGTY1t_loop| . 2)
   (|%%_tiqNlp12t_c| . 2)
   (|%%_tiKUpv02t_list1| . 3)
   (car . 2)
   (cons . 2)
   (cdr . 2)
   (|%%_tim7yH-1t_proc| . 2)
   (|%%_tiEpIqY1t_map1| . 2)
   (|%%_ti20uB_1t_acc| . 2)
   (reverse . 2)
   (|%%_tiI3w8_1t_list| . 3)
   (null? . 3))
  ((|%%_ti-lGTY1t_loop| . 1)
   (|%%_tiEpIqY1t_map1| . 1))
  (map-cdr
    apply
    map-car
    cdr
    car
    cons
    reverse
    null?)
  (#%define map
    (#%letrec #t
      ((|%%_tiEpIqY1t_map1|
         (#%lambda #t
           (|%%_tim7yH-1t_proc|
             |%%_tiI3w8_1t_list|
             |%%_ti20uB_1t_acc|)
           (|%%_tiEpIqY1t_map1|)
           (#%if (null? |%%_tiI3w8_1t_list|)
             (reverse |%%_ti20uB_1t_acc|)
             (|%%_tiEpIqY1t_map1|
               |%%_tim7yH-1t_proc|
               (cdr |%%_tiI3w8_1t_list|)
               (cons (|%%_tim7yH-1t_proc| (car |%%_tiI3w8_1t_list|))
                     |%%_ti20uB_1t_acc|)))))
       (|%%_ti-lGTY1t_loop|
         (#%lambda #t
           (|%%_tioYr202t_proc|
             |%%_tiKUpv02t_list1|
             |%%_ti4RnY02t_lists|
             |%%_tiqNlp12t_c|)
           (|%%_ti-lGTY1t_loop|)
           (#%if (null? |%%_tiKUpv02t_list1|)
             (reverse |%%_tiqNlp12t_c|)
             (|%%_ti-lGTY1t_loop|
               |%%_tioYr202t_proc|
               (cdr |%%_tiKUpv02t_list1|)
               (map-cdr |%%_ti4RnY02t_lists|)
               (cons (apply |%%_tioYr202t_proc|
                            (car |%%_tiKUpv02t_list1|)
                            (map-car |%%_ti4RnY02t_lists|))
                     |%%_tiqNlp12t_c|))))))
      ()
      (#%lambda #t
        (|%%_ti0bAe-1t_proc|
          |%%_tiGeCNZ1t_list1|
          .
          |%%_tikiEkZ1t_lists|)
        (|%%_ti-lGTY1t_loop| |%%_tiEpIqY1t_map1|)
        (#%if (null? |%%_tikiEkZ1t_lists|)
          (|%%_tiEpIqY1t_map1|
            |%%_ti0bAe-1t_proc|
            |%%_tiGeCNZ1t_list1|
            ())
          (|%%_ti-lGTY1t_loop|
            |%%_ti0bAe-1t_proc|
            |%%_tiGeCNZ1t_list1|
            |%%_tikiEkZ1t_lists|
            ()))))))
(#%program
  ((|%%_tisCfM22t_x| . 1)
   (|%%_ti6Ghj22t_g| . 1)
   (|%%_tiMJjS12t_f| . 1))
  ()
  ()
  (#%define compose2
    (#%lambda #t
      (|%%_tiMJjS12t_f| |%%_ti6Ghj22t_g|)
      ()
      (#%lambda #t
        (|%%_tisCfM22t_x|)
        (|%%_ti6Ghj22t_g| |%%_tiMJjS12t_f|)
        (|%%_tiMJjS12t_f|
          (|%%_ti6Ghj22t_g| |%%_tisCfM22t_x|))))))
(#%program
  ((void . 1))
  ()
  (void)
  (#%define assq (void)))
(#%program
  ((void . 1))
  ()
  (void)
  (#%define assv (void)))
(#%program
  ((void . 1))
  ()
  (void)
  (#%define assoc (void)))
(#%program
  ((void . 1))
  ()
  (void)
  (#%define memq (void)))
(#%program
  ((void . 1))
  ()
  (void)
  (#%define memv (void)))
(#%program
  ((void . 1))
  ()
  (void)
  (#%define member (void)))
(#%program
  ((|%%_tigPO592t_list| . 1)
   (|%%_tiWSQE82t_obj| . 1)
   (member . 1)
   (|%%_tiAWSb82t_list| . 1)
   (|%%_tie-UK72t_obj| . 1)
   (memv . 1)
   (|%%_tiU1Xh72t_list| . 1)
   (|%%_tiy5ZQ62t_obj| . 1)
   (memq . 1)
   (%%_tic9_n62t_alist . 1)
   (|%%_tiSc1X52t_obj| . 1)
   (equal? . 2)
   (assoc . 1)
   (%%_tiwg3u52t_alist . 1)
   (%%_tiak5152t_obj . 1)
   (eqv? . 2)
   (assv . 1)
   (|%%_tiQn7A42t_alist| . 1)
   (%%_tiur9742t_obj . 1)
   (eq? . 2)
   (assq . 1)
   (|%%_ti8vbG32t_memn| . 4)
   (|%%_ti-wEmb2t_obj| . 2)
   (|%%_tiEAGVa2t_n| . 2)
   (|%%_tiktCPb2t_list| . 4)
   (cdr . 2)
   (|%%_tiOydd32t_assn| . 4)
   (car . 2)
   (|%%_tiYHK_92t_obj| . 2)
   (caar . 1)
   (|%%_tiCLMy92t_n| . 2)
   (|%%_tiiEIsa2t_alist| . 4)
   (null? . 2))
  ((member . 1)
   (memv . 1)
   (memq . 1)
   (assoc . 1)
   (assv . 1)
   (assq . 1)
   (|%%_ti8vbG32t_memn| . 1)
   (|%%_tiOydd32t_assn| . 1))
  (assq eq?
        assv
        eqv?
        assoc
        equal?
        memq
        memv
        member
        caar
        car
        cdr
        null?)
  (#%letrec #t
    ((|%%_tiOydd32t_assn|
       (#%lambda #t
         (|%%_tiCLMy92t_n|
           |%%_tiYHK_92t_obj|
           |%%_tiiEIsa2t_alist|)
         (|%%_tiOydd32t_assn|)
         (#%if (null? |%%_tiiEIsa2t_alist|)
           #f
           (#%if (|%%_tiCLMy92t_n|
                   (caar |%%_tiiEIsa2t_alist|)
                   |%%_tiYHK_92t_obj|)
             (car |%%_tiiEIsa2t_alist|)
             (|%%_tiOydd32t_assn|
               |%%_tiCLMy92t_n|
               |%%_tiYHK_92t_obj|
               (cdr |%%_tiiEIsa2t_alist|))))))
     (|%%_ti8vbG32t_memn|
       (#%lambda #t
         (|%%_tiEAGVa2t_n|
           |%%_ti-wEmb2t_obj|
           |%%_tiktCPb2t_list|)
         (|%%_ti8vbG32t_memn|)
         (#%if (null? |%%_tiktCPb2t_list|)
           #f
           (#%if (|%%_tiEAGVa2t_n|
                   (car |%%_tiktCPb2t_list|)
                   |%%_ti-wEmb2t_obj|)
             |%%_tiktCPb2t_list|
             (|%%_ti8vbG32t_memn|
               |%%_tiEAGVa2t_n|
               |%%_ti-wEmb2t_obj|
               (cdr |%%_tiktCPb2t_list|)))))))
    ()
    (#%begin
      (#%set! assq
        (#%lambda #t
          (%%_tiur9742t_obj |%%_tiQn7A42t_alist|)
          (|%%_tiOydd32t_assn|)
          (|%%_tiOydd32t_assn|
            eq?
            %%_tiur9742t_obj
            |%%_tiQn7A42t_alist|)))
      (#%set! assv
        (#%lambda #t
          (%%_tiak5152t_obj %%_tiwg3u52t_alist)
          (|%%_tiOydd32t_assn|)
          (|%%_tiOydd32t_assn|
            eqv?
            %%_tiak5152t_obj
            %%_tiwg3u52t_alist)))
      (#%set! assoc
        (#%lambda #t
          (|%%_tiSc1X52t_obj| %%_tic9_n62t_alist)
          (|%%_tiOydd32t_assn|)
          (|%%_tiOydd32t_assn|
            equal?
            |%%_tiSc1X52t_obj|
            %%_tic9_n62t_alist)))
      (#%set! memq
        (#%lambda #t
          (|%%_tiy5ZQ62t_obj| |%%_tiU1Xh72t_list|)
          (|%%_ti8vbG32t_memn|)
          (|%%_ti8vbG32t_memn|
            eq?
            |%%_tiy5ZQ62t_obj|
            |%%_tiU1Xh72t_list|)))
      (#%set! memv
        (#%lambda #t
          (|%%_tie-UK72t_obj| |%%_tiAWSb82t_list|)
          (|%%_ti8vbG32t_memn|)
          (|%%_ti8vbG32t_memn|
            eqv?
            |%%_tie-UK72t_obj|
            |%%_tiAWSb82t_list|)))
      (#%set! member
        (#%lambda #t
          (|%%_tiWSQE82t_obj| |%%_tigPO592t_list|)
          (|%%_ti8vbG32t_memn|)
          (|%%_ti8vbG32t_memn|
            equal?
            |%%_tiWSQE82t_obj|
            |%%_tigPO592t_list|))))))
(#%program
  ((cdr . 1) (car . 1) (compose2 . 1))
  ()
  (cdr car compose2)
  (#%define cadr (compose2 car cdr)))
(#%program
  ((car . 1) (cdr . 1) (compose2 . 1))
  ()
  (car cdr compose2)
  (#%define cdar (compose2 cdr car)))
(#%program
  ((cdr . 2) (compose2 . 1))
  ()
  (cdr compose2)
  (#%define cddr (compose2 cdr cdr)))
(#%program
  ((car . 2) (compose2 . 1))
  ()
  (car compose2)
  (#%define caar (compose2 car car)))
(#%program
  ((caar . 1) (car . 1) (compose2 . 1))
  ()
  (caar car compose2)
  (#%define caaar (compose2 car caar)))
(#%program
  ((cadr . 1) (car . 1) (compose2 . 1))
  ()
  (cadr car compose2)
  (#%define caadr (compose2 car cadr)))
(#%program
  ((cdar . 1) (car . 1) (compose2 . 1))
  ()
  (cdar car compose2)
  (#%define cadar (compose2 car cdar)))
(#%program
  ((cddr . 1) (car . 1) (compose2 . 1))
  ()
  (cddr car compose2)
  (#%define caddr (compose2 car cddr)))
(#%program
  ((caar . 1) (cdr . 1) (compose2 . 1))
  ()
  (caar cdr compose2)
  (#%define cdaar (compose2 cdr caar)))
(#%program
  ((cadr . 1) (cdr . 1) (compose2 . 1))
  ()
  (cadr cdr compose2)
  (#%define cdadr (compose2 cdr cadr)))
(#%program
  ((cdar . 1) (cdr . 1) (compose2 . 1))
  ()
  (cdar cdr compose2)
  (#%define cddar (compose2 cdr cdar)))
(#%program
  ((cddr . 1) (cdr . 1) (compose2 . 1))
  ()
  (cddr cdr compose2)
  (#%define cdddr (compose2 cdr cddr)))
(#%program
  ((caaar . 1) (car . 1) (compose2 . 1))
  ()
  (caaar car compose2)
  (#%define caaaar (compose2 car caaar)))
(#%program
  ((caadr . 1) (car . 1) (compose2 . 1))
  ()
  (caadr car compose2)
  (#%define caaadr (compose2 car caadr)))
(#%program
  ((cadar . 1) (car . 1) (compose2 . 1))
  ()
  (cadar car compose2)
  (#%define caadar (compose2 car cadar)))
(#%program
  ((caddr . 1) (car . 1) (compose2 . 1))
  ()
  (caddr car compose2)
  (#%define caaddr (compose2 car caddr)))
(#%program
  ((cdaar . 1) (car . 1) (compose2 . 1))
  ()
  (cdaar car compose2)
  (#%define cadaar (compose2 car cdaar)))
(#%program
  ((cdadr . 1) (car . 1) (compose2 . 1))
  ()
  (cdadr car compose2)
  (#%define cadadr (compose2 car cdadr)))
(#%program
  ((cddar . 1) (car . 1) (compose2 . 1))
  ()
  (cddar car compose2)
  (#%define caddar (compose2 car cddar)))
(#%program
  ((cdddr . 1) (car . 1) (compose2 . 1))
  ()
  (cdddr car compose2)
  (#%define cadddr (compose2 car cdddr)))
(#%program
  ((caaar . 1) (cdr . 1) (compose2 . 1))
  ()
  (caaar cdr compose2)
  (#%define cdaaar (compose2 cdr caaar)))
(#%program
  ((caadr . 1) (cdr . 1) (compose2 . 1))
  ()
  (caadr cdr compose2)
  (#%define cdaadr (compose2 cdr caadr)))
(#%program
  ((cadar . 1) (cdr . 1) (compose2 . 1))
  ()
  (cadar cdr compose2)
  (#%define cdadar (compose2 cdr cadar)))
(#%program
  ((caddr . 1) (cdr . 1) (compose2 . 1))
  ()
  (caddr cdr compose2)
  (#%define cdaddr (compose2 cdr caddr)))
(#%program
  ((cdaar . 1) (cdr . 1) (compose2 . 1))
  ()
  (cdaar cdr compose2)
  (#%define cddaar (compose2 cdr cdaar)))
(#%program
  ((cdadr . 1) (cdr . 1) (compose2 . 1))
  ()
  (cdadr cdr compose2)
  (#%define cddadr (compose2 cdr cdadr)))
(#%program
  ((cddar . 1) (cdr . 1) (compose2 . 1))
  ()
  (cddar cdr compose2)
  (#%define cdddar (compose2 cdr cddar)))
(#%program
  ((cdddr . 1) (cdr . 1) (compose2 . 1))
  ()
  (cdddr cdr compose2)
  (#%define cddddr (compose2 cdr cdddr)))
(#%program
  ((cdr . 1)
   (append2 . 1)
   (car . 1)
   (cons . 1)
   (|%%_ti0myJc2t_ls2| . 2)
   (|%%_tiGpAgc2t_ls1| . 3)
   (null? . 1))
  ()
  (cons car cdr append2 null?)
  (#%define append2
    (#%lambda #t
      (|%%_tiGpAgc2t_ls1| |%%_ti0myJc2t_ls2|)
      ()
      (#%if (null? |%%_tiGpAgc2t_ls1|)
        |%%_ti0myJc2t_ls2|
        (cons (car |%%_tiGpAgc2t_ls1|)
              (append2
                (cdr |%%_tiGpAgc2t_ls1|)
                |%%_ti0myJc2t_ls2|))))))
(#%program
  ((append2 . 1))
  ()
  (append2)
  (#%define append append2))
(#%program
  ((|%%_tiIeuDd2t_base-case| . 1)
   (%%_tio7qxe2t_args . 3)
   (cdr . 2)
   (car . 2)
   (%%_timiwad2t_proc . 1)
   (%%_ti2bs4e2t_helper . 2)
   (|%%_tiK3o-e2t_acc| . 2)
   (%%_ti40mrf2t_argls . 3)
   (null? . 2))
  ((%%_ti2bs4e2t_helper . 1))
  (null? cdr car)
  (#%define _make-left-pairwise-nary
    (#%lambda #t
      (%%_timiwad2t_proc |%%_tiIeuDd2t_base-case|)
      ()
      (#%letrec #t
        ((%%_ti2bs4e2t_helper
           (#%lambda #t
             (|%%_tiK3o-e2t_acc| %%_ti40mrf2t_argls)
             (%%_ti2bs4e2t_helper %%_timiwad2t_proc)
             (#%if (null? %%_ti40mrf2t_argls)
               |%%_tiK3o-e2t_acc|
               (%%_ti2bs4e2t_helper
                 (%%_timiwad2t_proc
                   |%%_tiK3o-e2t_acc|
                   (car %%_ti40mrf2t_argls))
                 (cdr %%_ti40mrf2t_argls))))))
        (|%%_tiIeuDd2t_base-case| %%_timiwad2t_proc)
        (#%lambda #t
          %%_tio7qxe2t_args
          (%%_ti2bs4e2t_helper |%%_tiIeuDd2t_base-case|)
          (#%if (null? %%_tio7qxe2t_args)
            |%%_tiIeuDd2t_base-case|
            (%%_ti2bs4e2t_helper
              (car %%_tio7qxe2t_args)
              (cdr %%_tio7qxe2t_args))))))))
(#%program
  ((|%%_tiMUhlg2t_base-case| . 1)
   (|%%_tisNdfh2t_args| . 3)
   (cdr . 2)
   (car . 2)
   (|%%_tiqYjUf2t_proc| . 1)
   (helper . 2)
   (|%%_tiOJbIh2t_acc| . 2)
   (|%%_ti8G99i2t_argls| . 3)
   (null? . 2))
  ()
  (helper car cdr null?)
  (#%define _make-right-pairwise-nary
    (#%lambda #t
      (|%%_tiqYjUf2t_proc| |%%_tiMUhlg2t_base-case|)
      ()
      (#%begin
        (#%lambda #t
          (|%%_tiOJbIh2t_acc| |%%_ti8G99i2t_argls|)
          (|%%_tiqYjUf2t_proc|)
          (#%if (null? |%%_ti8G99i2t_argls|)
            |%%_tiOJbIh2t_acc|
            (helper
              (|%%_tiqYjUf2t_proc|
                (car |%%_ti8G99i2t_argls|)
                |%%_tiOJbIh2t_acc|)
              (cdr |%%_ti8G99i2t_argls|))))
        (#%lambda #t
          |%%_tisNdfh2t_args|
          (|%%_tiMUhlg2t_base-case|)
          (#%if (null? |%%_tisNdfh2t_args|)
            |%%_tiMUhlg2t_base-case|
            (helper
              (car |%%_tisNdfh2t_args|)
              (cdr |%%_tisNdfh2t_args|))))))))
(#%program
  ((length . 1)
   (make-string . 1)
   (|%%_tiQy53j2t_l| . 2)
   (+ . 1)
   (cdr . 1)
   (|%%_tiuC7Ci2t_l2s| . 2)
   (car . 1)
   (|%%_tiSn_pk2t_n| . 2)
   (string-set! . 1)
   (|%%_tiwr1Zj2t_s| . 3)
   (%%_tiav3wj2t_l . 3)
   (null? . 1))
  ((|%%_tiuC7Ci2t_l2s| . 1))
  (make-string length car string-set! + cdr null?)
  (#%define list->string
    (#%letrec #t
      ((|%%_tiuC7Ci2t_l2s|
         (#%lambda #t
           (%%_tiav3wj2t_l
             |%%_tiwr1Zj2t_s|
             |%%_tiSn_pk2t_n|)
           (|%%_tiuC7Ci2t_l2s|)
           (#%if (null? %%_tiav3wj2t_l)
             |%%_tiwr1Zj2t_s|
             (#%begin
               (string-set!
                 |%%_tiwr1Zj2t_s|
                 |%%_tiSn_pk2t_n|
                 (car %%_tiav3wj2t_l))
               (|%%_tiuC7Ci2t_l2s|
                 (cdr %%_tiav3wj2t_l)
                 |%%_tiwr1Zj2t_s|
                 (+ |%%_tiSn_pk2t_n| 1)))))))
      ()
      (#%lambda #t
        (|%%_tiQy53j2t_l|)
        (|%%_tiuC7Ci2t_l2s|)
        (|%%_tiuC7Ci2t_l2s|
          |%%_tiQy53j2t_l|
          (make-string (length |%%_tiQy53j2t_l|))
          0)))))
(#%program
  ((string-length . 1)
   (|%%_tiygXjl2t_s| . 2)
   (- . 2)
   (string-ref . 1)
   (cons . 1)
   (|%%_tiUcVMl2t_s| . 2)
   (|%%_tickZSk2t_s2l| . 2)
   (|%%_tie9Tdm2t_h| . 2)
   (|%%_tiA5RGm2t_n| . 3)
   (< . 1))
  ((|%%_tickZSk2t_s2l| . 1))
  (string-length string-ref cons - <)
  (#%define string->list
    (#%letrec #t
      ((|%%_tickZSk2t_s2l|
         (#%lambda #t
           (|%%_tiUcVMl2t_s|
             |%%_tie9Tdm2t_h|
             |%%_tiA5RGm2t_n|)
           (|%%_tickZSk2t_s2l|)
           (#%if (< |%%_tiA5RGm2t_n| 0)
             |%%_tie9Tdm2t_h|
             (|%%_tickZSk2t_s2l|
               |%%_tiUcVMl2t_s|
               (cons (string-ref |%%_tiUcVMl2t_s| |%%_tiA5RGm2t_n|)
                     |%%_tie9Tdm2t_h|)
               (- |%%_tiA5RGm2t_n| 1))))))
      ()
      (#%lambda #t
        (|%%_tiygXjl2t_s|)
        (|%%_tickZSk2t_s2l|)
        (|%%_tickZSk2t_s2l|
          |%%_tiygXjl2t_s|
          ()
          (- (string-length |%%_tiygXjl2t_s|) 1))))))
(#%program
  ((|%%_tiW1P7n2t_elems| . 1) (list->vector . 1))
  ()
  (list->vector)
  (#%define vector
    (#%lambda #t
      |%%_tiW1P7n2t_elems|
      ()
      (list->vector |%%_tiW1P7n2t_elems|))))
(#%program
  ((|%%_tig-MAn2t_elems| . 1) (list->string . 1))
  ()
  (list->string)
  (#%define string
    (#%lambda #t
      |%%_tig-MAn2t_elems|
      ()
      (list->string |%%_tig-MAn2t_elems|))))
(#%program
  ((_make-parameter . 1))
  ()
  (_make-parameter)
  (#%define current-url (_make-parameter "file:.")))
(#%program
  ((car . 1)
   (string-length . 1)
   (string-append . 1)
   (|%%_tiiPGXo2t_l| . 1)
   (- . 1)
   (|%%_tiYSIuo2t_v| . 4)
   (string-ref . 1)
   (eqv? . 1)
   (current-url . 3)
   (normalize-url . 2)
   (|%%_tiCWK1o2t_rest| . 2)
   (null? . 1))
  ()
  (string-length
    string-ref
    -
    eqv?
    string-append
    car
    normalize-url
    current-url
    null?)
  (#%define current-directory
    (#%lambda #t
      |%%_tiCWK1o2t_rest|
      ()
      (#%if (null? |%%_tiCWK1o2t_rest|)
        (normalize-url (current-url) ".")
        (current-url
          (normalize-url
            (current-url)
            ((#%lambda #t
               (|%%_tiYSIuo2t_v|)
               ()
               ((#%lambda #t
                  (|%%_tiiPGXo2t_l|)
                  (|%%_tiYSIuo2t_v|)
                  (#%if (eqv? (string-ref
                                |%%_tiYSIuo2t_v|
                                (- |%%_tiiPGXo2t_l| 1))
                              #\/)
                    |%%_tiYSIuo2t_v|
                    (string-append |%%_tiYSIuo2t_v| "/")))
                (string-length |%%_tiYSIuo2t_v|)))
             (car |%%_tiCWK1o2t_rest|))))))))
(#%program
  ((void . 1))
  ()
  (void)
  (#%define file-handler (void)))
(#%program
  ((void . 1))
  ()
  (void)
  (#%define add-file-handler (void)))
(#%program
  ((load . 1)
   (%%_ti0xwcr2t_extension . 1)
   (string-downcase . 1)
   (string->symbol . 1)
   (|%%_tiGAyLq2t__load| . 1)
   (cdr . 1)
   (|%%_timtuFr2t_t| . 2)
   (file-handler . 1)
   (|%%_tikEAiq2t_thunk| . 1)
   (cons . 2)
   (|%%_tiELEop2t_*file-handlers*| . 4)
   (|%%_ti-HCRp2t_extension| . 2)
   (assq . 2)
   (not . 1)
   (add-file-handler . 1))
  ((file-handler . 1)
   (|%%_tiELEop2t_*file-handlers*| . 1)
   (add-file-handler . 1))
  (cdr string->symbol
       string-downcase
       load
       file-handler
       cons
       not
       assq
       add-file-handler)
  ((#%lambda #t
     (|%%_tiELEop2t_*file-handlers*|)
     ()
     (#%begin
       (#%set! add-file-handler
         (#%lambda #t
           (|%%_ti-HCRp2t_extension| |%%_tikEAiq2t_thunk|)
           (|%%_tiELEop2t_*file-handlers*|)
           (#%if (not (assq |%%_ti-HCRp2t_extension|
                            |%%_tiELEop2t_*file-handlers*|))
             (#%set! |%%_tiELEop2t_*file-handlers*|
               (cons (cons |%%_ti-HCRp2t_extension|
                           |%%_tikEAiq2t_thunk|)
                     |%%_tiELEop2t_*file-handlers*|))
             #!void)))
       (#%set! file-handler
         ((#%lambda #t
            (|%%_tiGAyLq2t__load|)
            (|%%_tiELEop2t_*file-handlers*|)
            (#%lambda #t
              (%%_ti0xwcr2t_extension)
              (|%%_tiGAyLq2t__load|
                |%%_tiELEop2t_*file-handlers*|)
              ((#%lambda #t
                 (|%%_timtuFr2t_t|)
                 (|%%_tiGAyLq2t__load|)
                 (#%if |%%_timtuFr2t_t|
                   (cdr |%%_timtuFr2t_t|)
                   |%%_tiGAyLq2t__load|))
               (assq (string->symbol
                       (string-downcase %%_ti0xwcr2t_extension))
                     |%%_tiELEop2t_*file-handlers*|))))
          load))))
   ()))
(#%program
  ((%%_ti2mqzs2t_rest . 1)
   (%%_tioio0t2t_file . 1)
   (current-url . 1)
   (normalize-url . 1)
   (|%%_tiIps6s2t_proc| . 1)
   (apply . 1))
  ()
  (apply current-url normalize-url)
  (#%define make-io-proc
    (#%lambda #t
      (|%%_tiIps6s2t_proc|)
      ()
      (#%lambda #t
        (%%_tioio0t2t_file . %%_ti2mqzs2t_rest)
        (|%%_tiIps6s2t_proc|)
        (apply |%%_tiIps6s2t_proc|
               (normalize-url (current-url) %%_tioio0t2t_file)
               %%_ti2mqzs2t_rest)))))
(#%program
  ((|%%_ti8R7Ew2t_url| . 1)
   (string->list . 1)
   (reverse! . 1)
   (cons . 1)
   (cdr . 1)
   (|%%_tiuN55x2t_loop| . 2)
   (|%%_tiaG1_x2t_acc| . 2)
   (list->string . 1)
   (car . 2)
   (equal? . 1)
   (|%%_tiQJ3yx2t_x| . 4)
   (null? . 1)
   (void . 1)
   (|%%_tiKemtt2t_file-extension| . 1)
   (|%%_tiOU9bw2t_fe| . 2)
   (file-handler . 1)
   (%%_ti60ehv2t_e . 1)
   (|%%_tiM3gQu2t_m| . 1)
   (|%%_tisYbKv2t_fk| . 1)
   (call-with-failure-continuation . 1)
   (with-failure-continuation . 1)
   (|%%_ti4bkWt2t_file| . 1)
   (%%_tiq7inu2t_previous-url . 3)
   (normalize-url . 1)
   (current-url . 6)
   (load . 1)
   (open-output-file . 2)
   (open-source-input-file . 2)
   (make-io-proc . 3)
   (open-input-file . 2))
  ((|%%_tiuN55x2t_loop| . 1)
   (load . 1)
   (open-output-file . 1)
   (open-source-input-file . 1)
   (open-input-file . 1))
  (open-input-file
    open-input-file
    make-io-proc
    open-source-input-file
    open-source-input-file
    open-output-file
    open-output-file
    load
    normalize-url
    current-url
    file-handler
    call-with-failure-continuation
    with-failure-continuation
    void
    reverse!
    string->list
    null?
    cdr
    cons
    list->string
    equal?
    car)
  ((#%lambda #t
     (|%%_tiKemtt2t_file-extension|)
     ()
     (#%begin
       (#%set! open-input-file
         (make-io-proc open-input-file))
       (#%set! open-source-input-file
         (make-io-proc open-source-input-file))
       (#%set! open-output-file
         (make-io-proc open-output-file))
       (#%set! load
         (#%lambda #t
           (|%%_ti4bkWt2t_file|)
           (|%%_tiKemtt2t_file-extension|)
           (#%begin
             ((#%lambda #t
                (%%_tiq7inu2t_previous-url)
                (|%%_ti4bkWt2t_file|
                  |%%_tiKemtt2t_file-extension|)
                (#%begin
                  (current-url
                    (normalize-url
                      %%_tiq7inu2t_previous-url
                      |%%_ti4bkWt2t_file|))
                  (with-failure-continuation
                    (#%lambda #t
                      (|%%_tiM3gQu2t_m| %%_ti60ehv2t_e)
                      (%%_tiq7inu2t_previous-url)
                      (#%begin
                        (current-url %%_tiq7inu2t_previous-url)
                        (call-with-failure-continuation
                          (#%lambda #t
                            (|%%_tisYbKv2t_fk|)
                            (%%_ti60ehv2t_e |%%_tiM3gQu2t_m|)
                            (|%%_tisYbKv2t_fk|
                              |%%_tiM3gQu2t_m|
                              %%_ti60ehv2t_e)))))
                    (#%lambda #t
                      ()
                      (|%%_tiKemtt2t_file-extension|)
                      ((#%lambda #t
                         (|%%_tiOU9bw2t_fe|)
                         ()
                         ((file-handler
                            (#%if |%%_tiOU9bw2t_fe| |%%_tiOU9bw2t_fe| "scm"))
                          (current-url)))
                       (|%%_tiKemtt2t_file-extension| (current-url)))))
                  (current-url %%_tiq7inu2t_previous-url)))
              (current-url))
             (void))))))
   (#%lambda #t
     (|%%_ti8R7Ew2t_url|)
     ()
     ((#%letrec #t
        ((|%%_tiuN55x2t_loop|
           (#%lambda #t
             (|%%_tiQJ3yx2t_x| |%%_tiaG1_x2t_acc|)
             (|%%_tiuN55x2t_loop|)
             (#%if (null? |%%_tiQJ3yx2t_x|)
               #f
               (#%if (equal? (car |%%_tiQJ3yx2t_x|) #\.)
                 (list->string |%%_tiaG1_x2t_acc|)
                 (|%%_tiuN55x2t_loop|
                   (cdr |%%_tiQJ3yx2t_x|)
                   (cons (car |%%_tiQJ3yx2t_x|) |%%_tiaG1_x2t_acc|)))))))
        ()
        |%%_tiuN55x2t_loop|)
      (reverse! (string->list |%%_ti8R7Ew2t_url|))
      ()))))
(#%program
  ((|%%_tiwC_ry2t_str| . 1)
   (load-native-library . 1)
   (native-library-binding-names . 1)
   (|%%_ticvXlz2t_binding-names| . 1)
   (|%%_tiSyZUy2t_nl| . 2)
   (native-library-binding . 1)
   (|%%_tiyrVOz2t_name| . 2)
   (putprop . 1)
   (for-each . 1))
  ()
  (load-native-library
    native-library-binding
    putprop
    for-each
    native-library-binding-names)
  (#%define load-module
    (#%lambda #t
      (|%%_tiwC_ry2t_str|)
      ()
      ((#%lambda #t
         (|%%_tiSyZUy2t_nl|)
         ()
         ((#%lambda #t
            (|%%_ticvXlz2t_binding-names|)
            (|%%_tiSyZUy2t_nl|)
            (for-each
              (#%lambda #t
                (|%%_tiyrVOz2t_name|)
                (|%%_tiSyZUy2t_nl|)
                (putprop
                  |%%_tiyrVOz2t_name|
                  (native-library-binding
                    |%%_tiSyZUy2t_nl|
                    |%%_tiyrVOz2t_name|)))
              |%%_ticvXlz2t_binding-names|))
          (native-library-binding-names |%%_tiSyZUy2t_nl|)))
       (load-native-library |%%_tiwC_ry2t_str|)))))
(#%program
  ((append2 . 1) (_make-left-pairwise-nary . 1))
  ()
  (append2 _make-left-pairwise-nary)
  (#%define append
    (_make-left-pairwise-nary append2 ())))
(#%program
  ((|%%_tiUnTfA2t_x| . 2)
   (null? . 2)
   (|%%_tiWcNCB2t_lag| . 1)
   (cdr . 3)
   (|%%_tiekRIA2t_lp| . 2)
   (|%%_tiY1HZC2t_lag| . 2)
   (|%%_tiC5JwC2t_x| . 2)
   (eq? . 1)
   (not . 1)
   (|%%_tig9L3C2t_x| . 3)
   (|%%_tiAgP9B2t_x| . 3)
   (pair? . 2))
  ((|%%_tiekRIA2t_lp| . 1))
  (pair? cdr eq? not null?)
  (#%define proper-list?
    (#%lambda #t
      (|%%_tiUnTfA2t_x|)
      ()
      ((#%letrec #t
         ((|%%_tiekRIA2t_lp|
            (#%lambda #t
              (|%%_tiAgP9B2t_x| |%%_tiWcNCB2t_lag|)
              (|%%_tiekRIA2t_lp|)
              (#%if (pair? |%%_tiAgP9B2t_x|)
                ((#%lambda #t
                   (|%%_tig9L3C2t_x|)
                   (|%%_tiWcNCB2t_lag| |%%_tiekRIA2t_lp|)
                   (#%if (pair? |%%_tig9L3C2t_x|)
                     ((#%lambda #t
                        (|%%_tiC5JwC2t_x| |%%_tiY1HZC2t_lag|)
                        (|%%_tiekRIA2t_lp|)
                        (#%if (not (eq? |%%_tiC5JwC2t_x| |%%_tiY1HZC2t_lag|))
                          (|%%_tiekRIA2t_lp|
                            |%%_tiC5JwC2t_x|
                            |%%_tiY1HZC2t_lag|)
                          #f))
                      (cdr |%%_tig9L3C2t_x|)
                      (cdr |%%_tiWcNCB2t_lag|))
                     (null? |%%_tig9L3C2t_x|)))
                 (cdr |%%_tiAgP9B2t_x|))
                (null? |%%_tiAgP9B2t_x|)))))
         ()
         |%%_tiekRIA2t_lp|)
       |%%_tiUnTfA2t_x|
       |%%_tiUnTfA2t_x|))))
(#%program
  ((proper-list? . 1))
  ()
  (proper-list?)
  (#%define list? proper-list?))
(#%program
  ((|%%_tii-EqD2t_general-expt| . 1)
   (denominator . 1)
   (numerator . 1)
   (|%%_tiEWCTD2t_rational-expt| . 1)
   (integer? . 2)
   (not . 1)
   (rational? . 1)
   (|%%_tikPyNE2t_base| . 9)
   (|%%_tiGLweF2t_exponent| . 8)
   (|%%_tis7adK2t_squaring| . 3)
   (odd? . 1)
   (quotient . 1)
   (|%%_tiqigSI2t_loop| . 2)
   (|%%_ti6bcMJ2t_result| . 3)
   (|%%_tiMeejJ2t_rest| . 3)
   (zero? . 3)
   (ashl . 1)
   (= . 1)
   (exact? . 5)
   (abs . 1)
   (|%%_tiKpkYH2t_base| . 4)
   (|%%_ti-SAkE2t_integer-expt| . 2)
   (|%%_ti4mipI2t_exponent| . 4)
   (negative? . 1)
   (|%%_ti2xo2H2t_base-denominator| . 1)
   (|%%_tiotmvH2t_exponent| . 2)
   (|%%_tiIAqBG2t_base-numerator| . 1)
   (expt . 2)
   (/ . 2)
   (|%%_ti0IuHF2t_base| . 1)
   (log . 1)
   (|%%_timEs8G2t_exponent| . 1)
   (* . 3)
   (exp . 1))
  ((|%%_tiqigSI2t_loop| . 1)
   (|%%_ti-SAkE2t_integer-expt| . 1)
   (|%%_tiEWCTD2t_rational-expt| . 1)
   (|%%_tii-EqD2t_general-expt| . 1))
  (numerator
    denominator
    not
    integer?
    rational?
    =
    exact?
    ashl
    zero?
    odd?
    quotient
    abs
    negative?
    expt
    /
    *
    log
    exp)
  (#%define expt
    (#%letrec #t
      ((|%%_tii-EqD2t_general-expt|
         (#%lambda #t
           (|%%_ti0IuHF2t_base| |%%_timEs8G2t_exponent|)
           ()
           (exp (* |%%_timEs8G2t_exponent|
                   (log |%%_ti0IuHF2t_base|)))))
       (|%%_tiEWCTD2t_rational-expt|
         (#%lambda #t
           (|%%_tiIAqBG2t_base-numerator|
             |%%_ti2xo2H2t_base-denominator|
             |%%_tiotmvH2t_exponent|)
           ()
           (/ (expt |%%_tiIAqBG2t_base-numerator|
                    |%%_tiotmvH2t_exponent|)
              (expt |%%_ti2xo2H2t_base-denominator|
                    |%%_tiotmvH2t_exponent|))))
       (|%%_ti-SAkE2t_integer-expt|
         (#%lambda #t
           (|%%_tiKpkYH2t_base| |%%_ti4mipI2t_exponent|)
           (|%%_ti-SAkE2t_integer-expt|)
           (#%if (negative? |%%_ti4mipI2t_exponent|)
             (/ (|%%_ti-SAkE2t_integer-expt|
                  |%%_tiKpkYH2t_base|
                  (abs |%%_ti4mipI2t_exponent|)))
             (#%if (#%if (exact? |%%_tiKpkYH2t_base|)
                     (= |%%_tiKpkYH2t_base| 2)
                     #f)
               (ashl 1 |%%_ti4mipI2t_exponent|)
               ((#%letrec #t
                  ((|%%_tiqigSI2t_loop|
                     (#%lambda #t
                       (|%%_tiMeejJ2t_rest|
                         |%%_ti6bcMJ2t_result|
                         |%%_tis7adK2t_squaring|)
                       (|%%_tiqigSI2t_loop|)
                       (#%if (zero? |%%_tiMeejJ2t_rest|)
                         |%%_ti6bcMJ2t_result|
                         (|%%_tiqigSI2t_loop|
                           (quotient |%%_tiMeejJ2t_rest| 2)
                           (#%if (odd? |%%_tiMeejJ2t_rest|)
                             (* |%%_ti6bcMJ2t_result| |%%_tis7adK2t_squaring|)
                             |%%_ti6bcMJ2t_result|)
                           (* |%%_tis7adK2t_squaring|
                              |%%_tis7adK2t_squaring|))))))
                  ()
                  |%%_tiqigSI2t_loop|)
                |%%_ti4mipI2t_exponent|
                1
                |%%_tiKpkYH2t_base|))))))
      ()
      (#%lambda #t
        (|%%_tikPyNE2t_base| |%%_tiGLweF2t_exponent|)
        (|%%_ti-SAkE2t_integer-expt|
          |%%_tiEWCTD2t_rational-expt|
          |%%_tii-EqD2t_general-expt|)
        (#%if (zero? |%%_tiGLweF2t_exponent|)
          (#%if (exact? |%%_tiGLweF2t_exponent|) 1 1.0)
          (#%if (zero? |%%_tikPyNE2t_base|)
            (#%if (exact? |%%_tiGLweF2t_exponent|)
              |%%_tikPyNE2t_base|
              0.0)
            (#%if (#%if (exact? |%%_tikPyNE2t_base|)
                    (#%if (rational? |%%_tikPyNE2t_base|)
                      (not (integer? |%%_tikPyNE2t_base|))
                      #f)
                    #f)
              (|%%_tiEWCTD2t_rational-expt|
                (numerator |%%_tikPyNE2t_base|)
                (denominator |%%_tikPyNE2t_base|)
                |%%_tiGLweF2t_exponent|)
              (#%if (#%if (exact? |%%_tiGLweF2t_exponent|)
                      (integer? |%%_tiGLweF2t_exponent|)
                      #f)
                (|%%_ti-SAkE2t_integer-expt|
                  |%%_tikPyNE2t_base|
                  |%%_tiGLweF2t_exponent|)
                (|%%_tii-EqD2t_general-expt|
                  |%%_tikPyNE2t_base|
                  |%%_tiGLweF2t_exponent|)))))))))
(#%program
  ((- . 1)
   (|%%_tiQU11M2t_tmp| . 2)
   (/ . 2)
   (modpow . 2)
   (|%%_tiaR_tM2t_tmp| . 2)
   (* . 3)
   (even? . 1)
   (|%%_tiuY3AL2t_n| . 6)
   (|%%_tiO38GK2t_x| . 4)
   (modulo . 4)
   (|%%_ti8067L2t_y| . 4)
   (= . 1))
  ()
  (even? modpow / * - modulo =)
  (#%define modpow
    (#%lambda #t
      (|%%_tiO38GK2t_x|
        |%%_ti8067L2t_y|
        |%%_tiuY3AL2t_n|)
      ()
      (#%if (= |%%_ti8067L2t_y| 1)
        (modulo |%%_tiO38GK2t_x| |%%_tiuY3AL2t_n|)
        (#%if (even? |%%_ti8067L2t_y|)
          ((#%lambda #t
             (|%%_tiaR_tM2t_tmp|)
             (|%%_tiuY3AL2t_n|)
             (modulo
               (* |%%_tiaR_tM2t_tmp| |%%_tiaR_tM2t_tmp|)
               |%%_tiuY3AL2t_n|))
           (modpow
             |%%_tiO38GK2t_x|
             (/ |%%_ti8067L2t_y| 2)
             |%%_tiuY3AL2t_n|))
          ((#%lambda #t
             (|%%_tiQU11M2t_tmp|)
             (|%%_tiuY3AL2t_n| |%%_tiO38GK2t_x|)
             (modulo
               (* |%%_tiO38GK2t_x|
                  (modulo
                    (* |%%_tiQU11M2t_tmp| |%%_tiQU11M2t_tmp|)
                    |%%_tiuY3AL2t_n|))
               |%%_tiuY3AL2t_n|))
           (modpow
             |%%_tiO38GK2t_x|
             (/ (- |%%_ti8067L2t_y| 1) 2)
             |%%_tiuY3AL2t_n|)))))))
(#%program
  ((round . 1)
   (= . 1)
   (real? . 1)
   (|%%_tiwNZWM2t_n| . 4)
   (_integer? . 1))
  ()
  (real? round = _integer?)
  (#%define integer?
    (#%lambda #t
      (|%%_tiwNZWM2t_n|)
      ()
      (#%if (_integer? |%%_tiwNZWM2t_n|)
        #t
        (#%if (real? |%%_tiwNZWM2t_n|)
          (= (round |%%_tiwNZWM2t_n|) |%%_tiwNZWM2t_n|)
          #f)))))
(#%program
  ((complex? . 1)
   (|%%_tiSJXnN2t_oldcomp?| . 1)
   (not . 1)
   (|%%_ticGVQN2t_n| . 2)
   (number? . 1))
  ()
  (complex? number? not)
  (#%define real?
    ((#%lambda #t
       (|%%_tiSJXnN2t_oldcomp?|)
       ()
       (#%lambda #t
         (|%%_ticGVQN2t_n|)
         (|%%_tiSJXnN2t_oldcomp?|)
         (#%if (number? |%%_ticGVQN2t_n|)
           (not (|%%_tiSJXnN2t_oldcomp?| |%%_ticGVQN2t_n|))
           #f)))
     complex?)))
(#%program
  ((real? . 1))
  ()
  (real?)
  (#%define rational? real?))
(#%program
  ((number? . 1))
  ()
  (number?)
  (#%define complex? number?))
(#%program
  ((- . 1)
   (< . 1)
   (imag-part . 1)
   (real-part . 1)
   (|%%_tievPbP2t_b| . 2)
   (|%%_tiUyRKO2t_a| . 2)
   (* . 2)
   (+ . 1)
   (sqrt . 1)
   (|%%_tiyCThO2t_num| . 6)
   (real? . 1)
   (not . 1))
  ()
  (< - + * sqrt real-part imag-part not real?)
  (#%define abs
    (#%lambda #t
      (|%%_tiyCThO2t_num|)
      ()
      (#%if (not (real? |%%_tiyCThO2t_num|))
        ((#%lambda #t
           (|%%_tiUyRKO2t_a| |%%_tievPbP2t_b|)
           ()
           (sqrt (+ (* |%%_tiUyRKO2t_a| |%%_tiUyRKO2t_a|)
                    (* |%%_tievPbP2t_b| |%%_tievPbP2t_b|))))
         (real-part |%%_tiyCThO2t_num|)
         (imag-part |%%_tiyCThO2t_num|))
        (#%if (< |%%_tiyCThO2t_num| 0)
          (- |%%_tiyCThO2t_num|)
          |%%_tiyCThO2t_num|)))))
(#%program
  ((void . 1))
  ()
  (void)
  (#%define min (void)))
(#%program
  ((void . 1))
  ()
  (void)
  (#%define max (void)))
(#%program
  ((> . 1)
   (|%%_tiYcFsR2t_x1| . 3)
   (|%%_tiCgH_Q2t_args| . 2)
   (max . 1)
   (< . 1)
   (|%%_tigkJyQ2t_x1| . 3)
   (|%%_tiWnL5Q2t_args| . 2)
   (min . 1)
   (inexact? . 3)
   (cdr . 2)
   (|%%_tiArNEP2t__min_max| . 4)
   (car . 3)
   (|%%_tii9DVR2t_proc| . 3)
   (exact->inexact . 1)
   (|%%_tiE5BmS2t_mv| . 5)
   (exact? . 1)
   (|%%_tik-wgT2t_inexact| . 3)
   (|%%_ti-1zPS2t_args| . 6)
   (null? . 3))
  ((max . 1)
   (min . 1)
   (|%%_tiArNEP2t__min_max| . 1))
  (min <
       max
       >
       car
       inexact?
       cdr
       exact?
       exact->inexact
       null?)
  (#%letrec #t
    ((|%%_tiArNEP2t__min_max|
       (#%lambda #t
         (|%%_tii9DVR2t_proc|
           |%%_tiE5BmS2t_mv|
           |%%_ti-1zPS2t_args|
           |%%_tik-wgT2t_inexact|)
         (|%%_tiArNEP2t__min_max|)
         (#%if (null? |%%_ti-1zPS2t_args|)
           (#%if (#%if |%%_tik-wgT2t_inexact|
                   (exact? |%%_tiE5BmS2t_mv|)
                   #f)
             (exact->inexact |%%_tiE5BmS2t_mv|)
             |%%_tiE5BmS2t_mv|)
           (#%if (|%%_tii9DVR2t_proc|
                   (car |%%_ti-1zPS2t_args|)
                   |%%_tiE5BmS2t_mv|)
             (|%%_tiArNEP2t__min_max|
               |%%_tii9DVR2t_proc|
               (car |%%_ti-1zPS2t_args|)
               (cdr |%%_ti-1zPS2t_args|)
               (#%if |%%_tik-wgT2t_inexact|
                 #t
                 (inexact? (car |%%_ti-1zPS2t_args|))))
             (|%%_tiArNEP2t__min_max|
               |%%_tii9DVR2t_proc|
               |%%_tiE5BmS2t_mv|
               (cdr |%%_ti-1zPS2t_args|)
               |%%_tik-wgT2t_inexact|))))))
    ()
    (#%begin
      (#%set! min
        (#%lambda #t
          (|%%_tigkJyQ2t_x1| . |%%_tiWnL5Q2t_args|)
          (|%%_tiArNEP2t__min_max|)
          (#%if (null? |%%_tiWnL5Q2t_args|)
            |%%_tigkJyQ2t_x1|
            (|%%_tiArNEP2t__min_max|
              <
              |%%_tigkJyQ2t_x1|
              |%%_tiWnL5Q2t_args|
              (inexact? |%%_tigkJyQ2t_x1|)))))
      (#%set! max
        (#%lambda #t
          (|%%_tiYcFsR2t_x1| . |%%_tiCgH_Q2t_args|)
          (|%%_tiArNEP2t__min_max|)
          (#%if (null? |%%_tiCgH_Q2t_args|)
            |%%_tiYcFsR2t_x1|
            (|%%_tiArNEP2t__min_max|
              >
              |%%_tiYcFsR2t_x1|
              |%%_tiCgH_Q2t_args|
              (inexact? |%%_tiYcFsR2t_x1|))))))))
(#%program
  ((|%%_tiGWuJT2t_n| . 1) (< . 1))
  ()
  (<)
  (#%define negative?
    (#%lambda #t
      (|%%_tiGWuJT2t_n|)
      ()
      (< |%%_tiGWuJT2t_n| 0))))
(#%program
  ((|%%_ti0TsaU2t_n| . 1) (> . 1))
  ()
  (>)
  (#%define positive?
    (#%lambda #t
      (|%%_ti0TsaU2t_n|)
      ()
      (> |%%_ti0TsaU2t_n| 0))))
(#%program
  ((|%%_timPqDU2t_n| . 1) (modulo . 1) (= . 1))
  ()
  (modulo =)
  (#%define even?
    (#%lambda #t
      (|%%_timPqDU2t_n|)
      ()
      (= 0 (modulo |%%_timPqDU2t_n| 2)))))
(#%program
  ((|%%_tiILo4V2t_n| . 1) (even? . 1) (not . 1))
  ()
  (even? not)
  (#%define odd?
    (#%lambda #t
      (|%%_tiILo4V2t_n|)
      ()
      (not (even? |%%_tiILo4V2t_n|)))))
(#%program
  ((|%%_ti2ImxV2t_n| . 1) (= . 1))
  ()
  (=)
  (#%define zero?
    (#%lambda #t
      (|%%_ti2ImxV2t_n|)
      ()
      (= |%%_ti2ImxV2t_n| 0))))
(#%program
  ((|%%_tioEk-V2t_n| . 1) (+ . 1))
  ()
  (+)
  (#%define add1
    (#%lambda #t
      (|%%_tioEk-V2t_n|)
      ()
      (+ |%%_tioEk-V2t_n| 1))))
(#%program
  ((|%%_tiKAirW2t_n| . 1) (- . 1))
  ()
  (-)
  (#%define sub1
    (#%lambda #t
      (|%%_tiKAirW2t_n|)
      ()
      (- |%%_tiKAirW2t_n| 1))))
(#%program
  ((void . 1))
  ()
  (void)
  (#%define >= (void)))
(#%program
  ((void . 1))
  ()
  (void)
  (#%define <= (void)))
(#%program
  ((|%%_tiyNRM03t_y| . 1)
   (|%%_ticRTj03t_x| . 1)
   (|%%_tia0-Y-2t_args| . 1)
   (|%%_tiwYXp_2t_loop| . 2)
   (cadr . 1)
   (car . 1)
   (|%%_ti8b4CZ2t_comparator| . 1)
   (%%_tiu723-2t_chainer . 1)
   (cdr . 2)
   (|%%_tiQ30w-2t_endstate| . 2)
   (|%%_tiSUVS_2t_x| . 5)
   (null? . 2)
   (|%%_tiOe69Z2t_b| . 2)
   (|%%_tisi8IY2t_a| . 2)
   (> . 1)
   (>= . 1)
   (|%%_tiqtelX2t__and2| . 2)
   (= . 2)
   (|%%_ti6mafY2t_b| . 2)
   (|%%_tiMpcOX2t_a| . 2)
   (< . 1)
   (|%%_ti4xgUW2t__comp_help| . 2)
   (<= . 1))
  ((|%%_tiwYXp_2t_loop| . 1) (>= . 1) (<= . 1))
  (null? cadr car cdr <= = < >= >)
  ((#%lambda #t
     (|%%_ti4xgUW2t__comp_help| |%%_tiqtelX2t__and2|)
     ()
     (#%begin
       (#%set! <=
         (|%%_ti4xgUW2t__comp_help|
           (#%lambda #t
             (|%%_tiMpcOX2t_a| |%%_ti6mafY2t_b|)
             ()
             (#%if (< |%%_tiMpcOX2t_a| |%%_ti6mafY2t_b|)
               #t
               (= |%%_tiMpcOX2t_a| |%%_ti6mafY2t_b|)))
           |%%_tiqtelX2t__and2|
           #t))
       (#%set! >=
         (|%%_ti4xgUW2t__comp_help|
           (#%lambda #t
             (|%%_tisi8IY2t_a| |%%_tiOe69Z2t_b|)
             ()
             (#%if (> |%%_tisi8IY2t_a| |%%_tiOe69Z2t_b|)
               #t
               (= |%%_tisi8IY2t_a| |%%_tiOe69Z2t_b|)))
           |%%_tiqtelX2t__and2|
           #t))))
   (#%lambda #t
     (|%%_ti8b4CZ2t_comparator|
       %%_tiu723-2t_chainer
       |%%_tiQ30w-2t_endstate|)
     ()
     (#%lambda #t
       |%%_tia0-Y-2t_args|
       (|%%_tiQ30w-2t_endstate|
         %%_tiu723-2t_chainer
         |%%_ti8b4CZ2t_comparator|)
       ((#%letrec #t
          ((|%%_tiwYXp_2t_loop|
             (#%lambda #t
               (|%%_tiSUVS_2t_x|)
               (|%%_tiwYXp_2t_loop|
                 |%%_tiQ30w-2t_endstate|
                 %%_tiu723-2t_chainer
                 |%%_ti8b4CZ2t_comparator|)
               (#%if (null? |%%_tiSUVS_2t_x|)
                 |%%_tiQ30w-2t_endstate|
                 (#%if (null? (cdr |%%_tiSUVS_2t_x|))
                   |%%_tiQ30w-2t_endstate|
                   (%%_tiu723-2t_chainer
                     (|%%_ti8b4CZ2t_comparator|
                       (car |%%_tiSUVS_2t_x|)
                       (cadr |%%_tiSUVS_2t_x|))
                     (|%%_tiwYXp_2t_loop| (cdr |%%_tiSUVS_2t_x|))))))))
          (|%%_tiQ30w-2t_endstate|
            %%_tiu723-2t_chainer
            |%%_ti8b4CZ2t_comparator|)
          |%%_tiwYXp_2t_loop|)
        |%%_tia0-Y-2t_args|)))
   (#%lambda #t
     (|%%_ticRTj03t_x| |%%_tiyNRM03t_y|)
     ()
     (#%if |%%_ticRTj03t_x| |%%_tiyNRM03t_y| #f))))
(#%program
  ((|%%_tiACL723t_chainer| . 1)
   (apply . 1)
   (|%%_tieGNG13t_comparator| . 1)
   (cadr . 2)
   (car . 2)
   (= . 1)
   (cdr . 2)
   (|%%_tiWyJA23t_args| . 7)
   (null? . 2)
   (< . 1)
   (<= . 2)
   (> . 1)
   (|%%_tiUJPd13t__?=| . 2)
   (>= . 2))
  ((<= . 1) (>= . 1))
  (< <= <= > >= >= null? = car cadr apply cdr)
  ((#%lambda #t
     (|%%_tiUJPd13t__?=|)
     ()
     (#%begin
       (#%set! >= (|%%_tiUJPd13t__?=| > >=))
       (#%set! <= (|%%_tiUJPd13t__?=| < <=))))
   (#%lambda #t
     (|%%_tieGNG13t_comparator|
       |%%_tiACL723t_chainer|)
     ()
     (#%lambda #t
       |%%_tiWyJA23t_args|
       (|%%_tiACL723t_chainer|
         |%%_tieGNG13t_comparator|)
       (#%if (null? |%%_tiWyJA23t_args|)
         #t
         (#%if (null? (cdr |%%_tiWyJA23t_args|))
           #t
           (#%if (#%if (= (car |%%_tiWyJA23t_args|)
                          (cadr |%%_tiWyJA23t_args|))
                   #t
                   (|%%_tieGNG13t_comparator|
                     (car |%%_tiWyJA23t_args|)
                     (cadr |%%_tiWyJA23t_args|)))
             (apply |%%_tiACL723t_chainer|
                    (cdr |%%_tiWyJA23t_args|))
             #f)))))))
(#%program
  ((cadr . 1)
   (_gcd . 1)
   (car . 2)
   (cdr . 1)
   (|%%_tiCrFu33t_args| . 5)
   (null? . 2))
  ()
  (cdr car cadr _gcd null?)
  (#%define gcd
    (#%lambda #t
      |%%_tiCrFu33t_args|
      ()
      (#%if (null? |%%_tiCrFu33t_args|)
        0
        (#%if (null? (cdr |%%_tiCrFu33t_args|))
          (car |%%_tiCrFu33t_args|)
          (_gcd (car |%%_tiCrFu33t_args|)
                (cadr |%%_tiCrFu33t_args|)))))))
(#%program
  ((cadr . 1)
   (_lcm . 1)
   (car . 2)
   (cdr . 1)
   (|%%_tiYnDX33t_args| . 5)
   (null? . 2))
  ()
  (cdr car cadr _lcm null?)
  (#%define lcm
    (#%lambda #t
      |%%_tiYnDX33t_args|
      ()
      (#%if (null? |%%_tiYnDX33t_args|)
        1
        (#%if (null? (cdr |%%_tiYnDX33t_args|))
          (car |%%_tiYnDX33t_args|)
          (_lcm (car |%%_tiYnDX33t_args|)
                (cadr |%%_tiYnDX33t_args|)))))))
(#%program
  ((|%%_tiikBo43t_x| . 1)
   (remainder . 1)
   (+ . 1)
   (%%_ti-cxi53t_r . 3)
   (positive? . 1)
   (|%%_tiEgzR43t_y| . 3)
   (negative? . 2))
  ()
  (remainder positive? negative? +)
  (#%define modulo
    (#%lambda #t
      (|%%_tiikBo43t_x| |%%_tiEgzR43t_y|)
      ()
      ((#%lambda #t
         (%%_ti-cxi53t_r)
         (|%%_tiEgzR43t_y|)
         (#%if ((#%if (negative? |%%_tiEgzR43t_y|)
                  positive?
                  negative?)
                %%_ti-cxi53t_r)
           (+ %%_ti-cxi53t_r |%%_tiEgzR43t_y|)
           %%_ti-cxi53t_r))
       (remainder |%%_tiikBo43t_x| |%%_tiEgzR43t_y|)))))
(#%program
  ((_string-append . 1)
   (_make-left-pairwise-nary . 1))
  ()
  (_string-append _make-left-pairwise-nary)
  (#%define string-append
    (_make-left-pairwise-nary _string-append "")))
(#%program
  ((- . 1)
   (char->integer . 4)
   (%%_tim-o673t_c . 2)
   (|%%_ti02rF63t_lc-offset| . 1)
   (+ . 1)
   (integer->char . 1)
   (|%%_tiG5tc63t_z| . 1)
   (<= . 1)
   (|%%_tik9vL53t_a| . 2)
   (|%%_tiIWmz73t_cv| . 3)
   (>= . 1))
  ()
  (integer->char + >= <= char->integer -)
  (#%define char-downcase
    ((#%lambda #t
       (|%%_tik9vL53t_a|)
       ()
       ((#%lambda #t
          (|%%_tiG5tc63t_z|)
          (|%%_tik9vL53t_a|)
          ((#%lambda #t
             (|%%_ti02rF63t_lc-offset|)
             (|%%_tiG5tc63t_z| |%%_tik9vL53t_a|)
             (#%lambda #t
               (%%_tim-o673t_c)
               (|%%_ti02rF63t_lc-offset|
                 |%%_tiG5tc63t_z|
                 |%%_tik9vL53t_a|)
               ((#%lambda #t
                  (|%%_tiIWmz73t_cv|)
                  (%%_tim-o673t_c
                    |%%_ti02rF63t_lc-offset|
                    |%%_tiG5tc63t_z|
                    |%%_tik9vL53t_a|)
                  (#%if (#%if (>= |%%_tiIWmz73t_cv| |%%_tik9vL53t_a|)
                          (<= |%%_tiIWmz73t_cv| |%%_tiG5tc63t_z|)
                          #f)
                    (integer->char
                      (+ |%%_tiIWmz73t_cv| |%%_ti02rF63t_lc-offset|))
                    %%_tim-o673t_c))
                (char->integer %%_tim-o673t_c))))
           (- (char->integer #\a) |%%_tik9vL53t_a|)))
        (char->integer #\Z)))
     (char->integer #\A))))
(#%program
  ((char->integer . 4)
   (|%%_ti4Ien93t_c| . 2)
   (|%%_tiKLgW83t_uc-offset| . 1)
   (- . 2)
   (integer->char . 1)
   (|%%_tioPit83t_z| . 1)
   (<= . 1)
   (|%%_ti2Tk083t_a| . 2)
   (|%%_tiqEcQ93t_cv| . 3)
   (>= . 1))
  ()
  (integer->char - >= <= char->integer)
  (#%define char-upcase
    ((#%lambda #t
       (|%%_ti2Tk083t_a|)
       ()
       ((#%lambda #t
          (|%%_tioPit83t_z|)
          (|%%_ti2Tk083t_a|)
          ((#%lambda #t
             (|%%_tiKLgW83t_uc-offset|)
             (|%%_tioPit83t_z| |%%_ti2Tk083t_a|)
             (#%lambda #t
               (|%%_ti4Ien93t_c|)
               (|%%_tiKLgW83t_uc-offset|
                 |%%_tioPit83t_z|
                 |%%_ti2Tk083t_a|)
               ((#%lambda #t
                  (|%%_tiqEcQ93t_cv|)
                  (|%%_ti4Ien93t_c|
                    |%%_tiKLgW83t_uc-offset|
                    |%%_tioPit83t_z|
                    |%%_ti2Tk083t_a|)
                  (#%if (#%if (>= |%%_tiqEcQ93t_cv| |%%_ti2Tk083t_a|)
                          (<= |%%_tiqEcQ93t_cv| |%%_tioPit83t_z|)
                          #f)
                    (integer->char
                      (- |%%_tiqEcQ93t_cv| |%%_tiKLgW83t_uc-offset|))
                    |%%_ti4Ien93t_c|))
                (char->integer |%%_ti4Ien93t_c|))))
           (- |%%_ti2Tk083t_a| (char->integer #\A))))
        (char->integer #\z)))
     (char->integer #\a))))
(#%program
  ((|%%_tiMAaha3t_args| . 1)
   (map . 1)
   (|%%_ti6x8Ka3t_c2| . 1)
   (%%_tist6bb3t_c1 . 1)
   (char->integer . 3)
   (> . 1)
   (apply . 1))
  ()
  (map char->integer > apply)
  (#%define char>?
    (#%lambda #t
      (%%_tist6bb3t_c1
        |%%_ti6x8Ka3t_c2|
        .
        |%%_tiMAaha3t_args|)
      ()
      (apply >
             (char->integer %%_tist6bb3t_c1)
             (char->integer |%%_ti6x8Ka3t_c2|)
             (map char->integer |%%_tiMAaha3t_args|)))))
(#%program
  ((|%%_tiOp4Eb3t_args| . 1)
   (map . 1)
   (%%_ti8m25c3t_c2 . 1)
   (%%_tiui0yc3t_c1 . 1)
   (char->integer . 3)
   (< . 1)
   (apply . 1))
  ()
  (map char->integer < apply)
  (#%define char<?
    (#%lambda #t
      (%%_tiui0yc3t_c1
        %%_ti8m25c3t_c2
        .
        |%%_tiOp4Eb3t_args|)
      ()
      (apply <
             (char->integer %%_tiui0yc3t_c1)
             (char->integer %%_ti8m25c3t_c2)
             (map char->integer |%%_tiOp4Eb3t_args|)))))
(#%program
  ((eqv? . 1))
  ()
  (eqv?)
  (#%define char=? eqv?))
(#%program
  ((char=? . 1)
   (|%%_tiabYrd3t_c2| . 2)
   (|%%_tiQe--c3t_c1| . 2)
   (char>? . 1))
  ()
  (char=? char>?)
  (#%define char>=?
    (#%lambda #t
      (|%%_tiQe--c3t_c1| |%%_tiabYrd3t_c2|)
      ()
      (#%if (char>? |%%_tiQe--c3t_c1| |%%_tiabYrd3t_c2|)
        #t
        (char=? |%%_tiQe--c3t_c1| |%%_tiabYrd3t_c2|)))))
(#%program
  ((char=? . 1)
   (|%%_tiS3Ule3t_c2| . 2)
   (|%%_tiw7WUd3t_c1| . 2)
   (char<? . 1))
  ()
  (char=? char<?)
  (#%define char<=?
    (#%lambda #t
      (|%%_tiw7WUd3t_c1| |%%_tiS3Ule3t_c2|)
      ()
      (#%if (char<? |%%_tiw7WUd3t_c1| |%%_tiS3Ule3t_c2|)
        #t
        (char=? |%%_tiw7WUd3t_c1| |%%_tiS3Ule3t_c2|)))))
(#%program
  ((|%%_tic0SOe3t_args| . 1)
   (map . 1)
   (|%%_tiyYPff3t_c2| . 1)
   (|%%_tiUUNIf3t_c1| . 1)
   (char-downcase . 3)
   (char>? . 1)
   (apply . 1))
  ()
  (map char-downcase char>? apply)
  (#%define char-ci>?
    (#%lambda #t
      (|%%_tiUUNIf3t_c1|
        |%%_tiyYPff3t_c2|
        .
        |%%_tic0SOe3t_args|)
      ()
      (apply char>?
             (char-downcase |%%_tiUUNIf3t_c1|)
             (char-downcase |%%_tiyYPff3t_c2|)
             (map char-downcase |%%_tic0SOe3t_args|)))))
(#%program
  ((|%%_tieRL9g3t_args| . 1)
   (map . 1)
   (|%%_tiANJCg3t_c2| . 1)
   (|%%_tiWJH3h3t_c1| . 1)
   (char-downcase . 3)
   (char<? . 1)
   (apply . 1))
  ()
  (map char-downcase char<? apply)
  (#%define char-ci<?
    (#%lambda #t
      (|%%_tiWJH3h3t_c1|
        |%%_tiANJCg3t_c2|
        .
        |%%_tieRL9g3t_args|)
      ()
      (apply char<?
             (char-downcase |%%_tiWJH3h3t_c1|)
             (char-downcase |%%_tiANJCg3t_c2|)
             (map char-downcase |%%_tieRL9g3t_args|)))))
(#%program
  ((|%%_tigGFwh3t_args| . 1)
   (map . 1)
   (|%%_tiCCDZh3t_c2| . 1)
   (|%%_tiYyBqi3t_c1| . 1)
   (char-downcase . 3)
   (char=? . 1)
   (apply . 1))
  ()
  (map char-downcase char=? apply)
  (#%define char-ci=?
    (#%lambda #t
      (|%%_tiYyBqi3t_c1|
        |%%_tiCCDZh3t_c2|
        .
        |%%_tigGFwh3t_args|)
      ()
      (apply char=?
             (char-downcase |%%_tiYyBqi3t_c1|)
             (char-downcase |%%_tiCCDZh3t_c2|)
             (map char-downcase |%%_tigGFwh3t_args|)))))
(#%program
  ((char-ci=? . 1)
   (|%%_tiErxkj3t_c2| . 2)
   (|%%_tiivzTi3t_c1| . 2)
   (char-ci>? . 1))
  ()
  (char-ci=? char-ci>?)
  (#%define char-ci>=?
    (#%lambda #t
      (|%%_tiivzTi3t_c1| |%%_tiErxkj3t_c2|)
      ()
      (#%if (char-ci>? |%%_tiivzTi3t_c1| |%%_tiErxkj3t_c2|)
        #t
        (char-ci=? |%%_tiivzTi3t_c1| |%%_tiErxkj3t_c2|)))))
(#%program
  ((char-ci=? . 1)
   (%%_tikktek3t_c2 . 2)
   (|%%_ti-nvNj3t_c1| . 2)
   (char-ci<? . 1))
  ()
  (char-ci=? char-ci<?)
  (#%define char-ci<=?
    (#%lambda #t
      (|%%_ti-nvNj3t_c1| %%_tikktek3t_c2)
      ()
      (#%if (char-ci<? |%%_ti-nvNj3t_c1| %%_tikktek3t_c2)
        #t
        (char-ci=? |%%_ti-nvNj3t_c1| %%_tikktek3t_c2)))))
(#%program
  ((|%%_tiGgrHk3t_c| . 2) (char<? . 2))
  ()
  (char<?)
  (#%define char-alphabetic?
    (#%lambda #t
      (|%%_tiGgrHk3t_c|)
      ()
      (#%if (char<? #\@ |%%_tiGgrHk3t_c| #\[)
        #t
        (char<? #\` |%%_tiGgrHk3t_c| #\{)))))
(#%program
  ((%%_ti0dp8l3t_c . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-numeric?
    (#%lambda #t
      (%%_ti0dp8l3t_c)
      ()
      (char<? #\/ %%_ti0dp8l3t_c #\:))))
(#%program
  ((|%%_tim9nBl3t_c| . 4) (char=? . 4))
  ()
  (char=?)
  (#%define char-whitespace?
    (#%lambda #t
      (|%%_tim9nBl3t_c|)
      ()
      (#%if (char=? |%%_tim9nBl3t_c| #\space)
        #t
        (#%if (char=? |%%_tim9nBl3t_c| #\tab)
          #t
          (#%if (char=? |%%_tim9nBl3t_c| #\newline)
            #t
            (char=? |%%_tim9nBl3t_c| #\return)))))))
(#%program
  ((|%%_tiI5l2m3t_c| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-upper-case?
    (#%lambda #t
      (|%%_tiI5l2m3t_c|)
      ()
      (char<? #\@ |%%_tiI5l2m3t_c| #\[))))
(#%program
  ((%%_ti22jvm3t_c . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-lower-case?
    (#%lambda #t
      (%%_ti22jvm3t_c)
      ()
      (char<? #\` %%_ti22jvm3t_c #\{))))
(#%program
  ((void . 1))
  ()
  (void)
  (#%define string-downcase (void)))
(#%program
  ((void . 1))
  ()
  (void)
  (#%define string-upcase (void)))
(#%program
  ((char-upcase . 1)
   (|%%_tiML8Mo3t_newstr| . 1)
   (|%%_tiqPajo3t_str| . 3)
   (string-upcase . 1)
   (make-string . 2)
   (string-length . 4)
   (char-downcase . 1)
   (|%%_ti4TcSn3t_newstr| . 1)
   (|%%_tiKWepn3t_str| . 3)
   (string-downcase . 1)
   (+ . 1)
   (|%%_tio-gYm3t_string-map| . 3)
   (|%%_ti6I6dp3t_strsrc| . 2)
   (string-ref . 1)
   (|%%_tiOA27q3t_proc| . 2)
   (|%%_tisE4Gp3t_strdst| . 3)
   (string-set! . 1)
   (%%_tiut-0r3t_l . 2)
   (|%%_ti8x0Aq3t_n| . 4)
   (< . 1))
  ((string-upcase . 1)
   (string-downcase . 1)
   (|%%_tio-gYm3t_string-map| . 1))
  (string-downcase
    string-length
    char-downcase
    make-string
    string-upcase
    char-upcase
    string-ref
    string-set!
    +
    <)
  (#%letrec #t
    ((|%%_tio-gYm3t_string-map|
       (#%lambda #t
         (|%%_ti6I6dp3t_strsrc|
           |%%_tisE4Gp3t_strdst|
           |%%_tiOA27q3t_proc|
           |%%_ti8x0Aq3t_n|
           %%_tiut-0r3t_l)
         (|%%_tio-gYm3t_string-map|)
         (#%if (< |%%_ti8x0Aq3t_n| %%_tiut-0r3t_l)
           (#%begin
             (string-set!
               |%%_tisE4Gp3t_strdst|
               |%%_ti8x0Aq3t_n|
               (|%%_tiOA27q3t_proc|
                 (string-ref
                   |%%_ti6I6dp3t_strsrc|
                   |%%_ti8x0Aq3t_n|)))
             (|%%_tio-gYm3t_string-map|
               |%%_ti6I6dp3t_strsrc|
               |%%_tisE4Gp3t_strdst|
               |%%_tiOA27q3t_proc|
               (+ |%%_ti8x0Aq3t_n| 1)
               %%_tiut-0r3t_l))
           |%%_tisE4Gp3t_strdst|))))
    ()
    (#%begin
      (#%set! string-downcase
        (#%lambda #t
          (|%%_tiKWepn3t_str|)
          (|%%_tio-gYm3t_string-map|)
          ((#%lambda #t
             (|%%_ti4TcSn3t_newstr|)
             (|%%_tiKWepn3t_str| |%%_tio-gYm3t_string-map|)
             (|%%_tio-gYm3t_string-map|
               |%%_tiKWepn3t_str|
               |%%_ti4TcSn3t_newstr|
               char-downcase
               0
               (string-length |%%_tiKWepn3t_str|)))
           (make-string (string-length |%%_tiKWepn3t_str|)))))
      (#%set! string-upcase
        (#%lambda #t
          (|%%_tiqPajo3t_str|)
          (|%%_tio-gYm3t_string-map|)
          ((#%lambda #t
             (|%%_tiML8Mo3t_newstr|)
             (|%%_tiqPajo3t_str| |%%_tio-gYm3t_string-map|)
             (|%%_tio-gYm3t_string-map|
               |%%_tiqPajo3t_str|
               |%%_tiML8Mo3t_newstr|
               char-upcase
               0
               (string-length |%%_tiqPajo3t_str|)))
           (make-string (string-length |%%_tiqPajo3t_str|))))))))
(#%program
  ((equal? . 1))
  ()
  (equal?)
  (#%define string=? equal?))
(#%program
  ((|%%_tiwiUns3t_s2| . 1)
   (|%%_tiamWWr3t_s1| . 1)
   (string->list . 2)
   (car . 2)
   (cdr . 2)
   (|%%_tiQpYtr3t_s<?| . 2)
   (char>? . 1)
   (|%%_tiU3Mbu3t_c2| . 2)
   (|%%_tiy7OKt3t_c1| . 2)
   (char<? . 1)
   (|%%_ticbQht3t_s2| . 4)
   (not . 1)
   (|%%_tiSeSQs3t_s1| . 3)
   (null? . 3))
  ((|%%_tiQpYtr3t_s<?| . 1))
  (string->list car char<? cdr char>? not null?)
  (#%define string<?
    (#%letrec #t
      ((|%%_tiQpYtr3t_s<?|
         (#%lambda #t
           (|%%_tiSeSQs3t_s1| |%%_ticbQht3t_s2|)
           (|%%_tiQpYtr3t_s<?|)
           (#%if (null? |%%_tiSeSQs3t_s1|)
             (not (null? |%%_ticbQht3t_s2|))
             (#%if (null? |%%_ticbQht3t_s2|)
               #f
               ((#%lambda #t
                  (|%%_tiy7OKt3t_c1| |%%_tiU3Mbu3t_c2|)
                  (|%%_ticbQht3t_s2|
                    |%%_tiSeSQs3t_s1|
                    |%%_tiQpYtr3t_s<?|)
                  (#%if (char<? |%%_tiy7OKt3t_c1| |%%_tiU3Mbu3t_c2|)
                    #t
                    (#%if (char>? |%%_tiy7OKt3t_c1| |%%_tiU3Mbu3t_c2|)
                      #f
                      (|%%_tiQpYtr3t_s<?|
                        (cdr |%%_tiSeSQs3t_s1|)
                        (cdr |%%_ticbQht3t_s2|)))))
                (car |%%_tiSeSQs3t_s1|)
                (car |%%_ticbQht3t_s2|)))))))
      ()
      (#%lambda #t
        (|%%_tiamWWr3t_s1| |%%_tiwiUns3t_s2|)
        (|%%_tiQpYtr3t_s<?|)
        (|%%_tiQpYtr3t_s<?|
          (string->list |%%_tiamWWr3t_s1|)
          (string->list |%%_tiwiUns3t_s2|))))))
(#%program
  ((|%%_tiWUFyv3t_s2| . 1)
   (|%%_tiAYH5v3t_s1| . 1)
   (string->list . 2)
   (car . 2)
   (cdr . 2)
   (|%%_tie0KEu3t_s>?| . 2)
   (char<? . 1)
   (|%%_tiiGxmx3t_c2| . 2)
   (|%%_tiYJzVw3t_c1| . 2)
   (char>? . 1)
   (|%%_tigRD_v3t_s1| . 4)
   (not . 1)
   (|%%_tiCNBsw3t_s2| . 3)
   (null? . 3))
  ((|%%_tie0KEu3t_s>?| . 1))
  (string->list car char>? cdr char<? not null?)
  (#%define string>?
    (#%letrec #t
      ((|%%_tie0KEu3t_s>?|
         (#%lambda #t
           (|%%_tigRD_v3t_s1| |%%_tiCNBsw3t_s2|)
           (|%%_tie0KEu3t_s>?|)
           (#%if (null? |%%_tiCNBsw3t_s2|)
             (not (null? |%%_tigRD_v3t_s1|))
             (#%if (null? |%%_tigRD_v3t_s1|)
               #f
               ((#%lambda #t
                  (|%%_tiYJzVw3t_c1| |%%_tiiGxmx3t_c2|)
                  (|%%_tiCNBsw3t_s2|
                    |%%_tigRD_v3t_s1|
                    |%%_tie0KEu3t_s>?|)
                  (#%if (char>? |%%_tiYJzVw3t_c1| |%%_tiiGxmx3t_c2|)
                    #t
                    (#%if (char<? |%%_tiYJzVw3t_c1| |%%_tiiGxmx3t_c2|)
                      #f
                      (|%%_tie0KEu3t_s>?|
                        (cdr |%%_tigRD_v3t_s1|)
                        (cdr |%%_tiCNBsw3t_s2|)))))
                (car |%%_tigRD_v3t_s1|)
                (car |%%_tiCNBsw3t_s2|)))))))
      ()
      (#%lambda #t
        (|%%_tiAYH5v3t_s1| |%%_tiWUFyv3t_s2|)
        (|%%_tie0KEu3t_s>?|)
        (|%%_tie0KEu3t_s>?|
          (string->list |%%_tiAYH5v3t_s1|)
          (string->list |%%_tiWUFyv3t_s2|))))))
(#%program
  ((string=? . 1)
   (%%_ti-ytgy3t_s2 . 2)
   (|%%_tiECvPx3t_s1| . 2)
   (string<? . 1))
  ()
  (string=? string<?)
  (#%define string<=?
    (#%lambda #t
      (|%%_tiECvPx3t_s1| %%_ti-ytgy3t_s2)
      ()
      (#%if (string<? |%%_tiECvPx3t_s1| %%_ti-ytgy3t_s2)
        #t
        (string=? |%%_tiECvPx3t_s1| %%_ti-ytgy3t_s2)))))
(#%program
  ((string=? . 1)
   (|%%_tiGrpaz3t_s2| . 2)
   (|%%_tikvrJy3t_s1| . 2)
   (string>? . 1))
  ()
  (string=? string>?)
  (#%define string>=?
    (#%lambda #t
      (|%%_tikvrJy3t_s1| |%%_tiGrpaz3t_s2|)
      ()
      (#%if (string>? |%%_tikvrJy3t_s1| |%%_tiGrpaz3t_s2|)
        #t
        (string=? |%%_tikvrJy3t_s1| |%%_tiGrpaz3t_s2|)))))
(#%program
  ((|%%_timkl4A3t_s2| . 1)
   (|%%_ti0onDz3t_s1| . 1)
   (string-downcase . 2)
   (string=? . 1))
  ()
  (string-downcase string=?)
  (#%define string-ci=?
    (#%lambda #t
      (|%%_ti0onDz3t_s1| |%%_timkl4A3t_s2|)
      ()
      (string=?
        (string-downcase |%%_ti0onDz3t_s1|)
        (string-downcase |%%_timkl4A3t_s2|)))))
(#%program
  ((|%%_ti2dh-A3t_s2| . 1)
   (|%%_tiIgjxA3t_s1| . 1)
   (string-downcase . 2)
   (string<? . 1))
  ()
  (string-downcase string<?)
  (#%define string-ci<?
    (#%lambda #t
      (|%%_tiIgjxA3t_s1| |%%_ti2dh-A3t_s2|)
      ()
      (string<?
        (string-downcase |%%_tiIgjxA3t_s1|)
        (string-downcase |%%_ti2dh-A3t_s2|)))))
(#%program
  ((|%%_tiK5dUB3t_s2| . 1)
   (|%%_tio9frB3t_s1| . 1)
   (string-downcase . 2)
   (string>? . 1))
  ()
  (string-downcase string>?)
  (#%define string-ci>?
    (#%lambda #t
      (|%%_tio9frB3t_s1| |%%_tiK5dUB3t_s2|)
      ()
      (string>?
        (string-downcase |%%_tio9frB3t_s1|)
        (string-downcase |%%_tiK5dUB3t_s2|)))))
(#%program
  ((|%%_tiq-8OC3t_s2| . 1)
   (|%%_ti42blC3t_s1| . 1)
   (string-downcase . 2)
   (string>=? . 1))
  ()
  (string-downcase string>=?)
  (#%define string-ci>=?
    (#%lambda #t
      (|%%_ti42blC3t_s1| |%%_tiq-8OC3t_s2|)
      ()
      (string>=?
        (string-downcase |%%_ti42blC3t_s1|)
        (string-downcase |%%_tiq-8OC3t_s2|)))))
(#%program
  ((|%%_ti6T4ID3t_s2| . 1)
   (|%%_tiMW6fD3t_s1| . 1)
   (string-downcase . 2)
   (string<=? . 1))
  ()
  (string-downcase string<=?)
  (#%define string-ci<=?
    (#%lambda #t
      (|%%_tiMW6fD3t_s1| |%%_ti6T4ID3t_s2|)
      ()
      (string<=?
        (string-downcase |%%_tiMW6fD3t_s1|)
        (string-downcase |%%_ti6T4ID3t_s2|)))))
(#%program
  ((- . 1)
   (make-string . 1)
   (|%%_tiuEYvF3t_end| . 2)
   (|%%_ti8I-2F3t_start| . 2)
   (|%%_tiQAWYF3t_newstr| . 2)
   (|%%_tiOL0CE3t_str| . 1)
   (+ . 2)
   (|%%_tisP29E3t_fill-string| . 2)
   (|%%_tiaxUpG3t_sstr| . 2)
   (string-ref . 1)
   (|%%_tiSpQjH3t_n| . 2)
   (|%%_tiwtSSG3t_dstr| . 2)
   (string-set! . 1)
   (|%%_tiyiMdI3t_e| . 2)
   (|%%_ticmOMH3t_s| . 3)
   (< . 1))
  ((|%%_tisP29E3t_fill-string| . 1))
  (make-string - string-ref string-set! + <)
  (#%define substring
    (#%letrec #t
      ((|%%_tisP29E3t_fill-string|
         (#%lambda #t
           (|%%_tiaxUpG3t_sstr|
             |%%_tiwtSSG3t_dstr|
             |%%_tiSpQjH3t_n|
             |%%_ticmOMH3t_s|
             |%%_tiyiMdI3t_e|)
           (|%%_tisP29E3t_fill-string|)
           (#%if (< |%%_ticmOMH3t_s| |%%_tiyiMdI3t_e|)
             (#%begin
               (string-set!
                 |%%_tiwtSSG3t_dstr|
                 |%%_tiSpQjH3t_n|
                 (string-ref |%%_tiaxUpG3t_sstr| |%%_ticmOMH3t_s|))
               (|%%_tisP29E3t_fill-string|
                 |%%_tiaxUpG3t_sstr|
                 |%%_tiwtSSG3t_dstr|
                 (+ |%%_tiSpQjH3t_n| 1)
                 (+ |%%_ticmOMH3t_s| 1)
                 |%%_tiyiMdI3t_e|))
             #!void))))
      ()
      (#%lambda #t
        (|%%_tiOL0CE3t_str|
          |%%_ti8I-2F3t_start|
          |%%_tiuEYvF3t_end|)
        (|%%_tisP29E3t_fill-string|)
        ((#%lambda #t
           (|%%_tiQAWYF3t_newstr|)
           (|%%_tiuEYvF3t_end|
             |%%_ti8I-2F3t_start|
             |%%_tiOL0CE3t_str|
             |%%_tisP29E3t_fill-string|)
           (#%begin
             (|%%_tisP29E3t_fill-string|
               |%%_tiOL0CE3t_str|
               |%%_tiQAWYF3t_newstr|
               0
               |%%_ti8I-2F3t_start|
               |%%_tiuEYvF3t_end|)
             |%%_tiQAWYF3t_newstr|))
         (make-string
           (- |%%_tiuEYvF3t_end| |%%_ti8I-2F3t_start|)))))))
(#%program
  ((- . 1)
   (cdr . 1)
   (list-ref . 1)
   (|%%_tiUeKGI3t_list| . 2)
   (car . 1)
   (|%%_tiebI7J3t_n| . 2)
   (zero? . 1))
  ()
  (list-ref cdr - car zero?)
  (#%define list-ref
    (#%lambda #t
      (|%%_tiUeKGI3t_list| |%%_tiebI7J3t_n|)
      ()
      (#%if (zero? |%%_tiebI7J3t_n|)
        (car |%%_tiUeKGI3t_list|)
        (list-ref
          (cdr |%%_tiUeKGI3t_list|)
          (- |%%_tiebI7J3t_n| 1))))))
(#%program
  ((|%%_tiA7GAJ3t_args| . 1)
   (|%%_tiW3E1K3t_k| . 1)
   (apply . 1)
   (call-with-current-continuation . 1))
  ()
  (apply call-with-current-continuation)
  (#%define values
    (#%lambda #t
      |%%_tiA7GAJ3t_args|
      ()
      (call-with-current-continuation
        (#%lambda #t
          (|%%_tiW3E1K3t_k|)
          (|%%_tiA7GAJ3t_args|)
          (apply |%%_tiW3E1K3t_k| |%%_tiA7GAJ3t_args|))))))
