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
   (|%%_wL4cuH3S71_proc| . 2)
   (apply . 2)
   (cons . 1)
   (|%%_wLojyN2S71_lists| . 4)
   (|%%_wLKfwe3S71_ls1| . 2)
   (null? . 1))
  ((|%%_wLojyN2S71_lists| . 1))
  (cons map-car apply map-cdr for-each null?)
  (#%define for-each
    (#%lambda #t
      (|%%_wL4cuH3S71_proc|
        |%%_wLKfwe3S71_ls1|
        .
        |%%_wLojyN2S71_lists|)
      ()
      (#%if (null? |%%_wLKfwe3S71_ls1|)
        #!void
        (#%begin
          (#%set! |%%_wLojyN2S71_lists|
            (cons |%%_wLKfwe3S71_ls1| |%%_wLojyN2S71_lists|))
          (apply |%%_wL4cuH3S71_proc|
                 (map-car |%%_wLojyN2S71_lists|))
          (apply for-each
                 |%%_wL4cuH3S71_proc|
                 (map-cdr |%%_wLojyN2S71_lists|)))))))
(#%program
  ((|%%_wLq8s84S71_x| . 1) (eq? . 1))
  ()
  (eq?)
  (#%define eof-object?
    (#%lambda #t
      (|%%_wLq8s84S71_x|)
      ()
      (eq? |%%_wLq8s84S71_x| #!eof))))
(#%program
  ((|%%_wLM4qB4S71_x| . 1))
  ()
  ()
  (#%define not
    (#%lambda #t
      (|%%_wLM4qB4S71_x|)
      ()
      (#%if |%%_wLM4qB4S71_x| #f #t))))
(#%program
  ((|%%_wL61o25S71_port| . 1)
   (display . 1)
   (apply . 1))
  ()
  (display apply)
  (#%define newline
    (#%lambda #t
      |%%_wL61o25S71_port|
      ()
      (apply display #\newline |%%_wL61o25S71_port|))))
(#%program
  ((|%%_wLOVjY5S71_ls| . 1)
   (car . 1)
   (cons . 1)
   (cdr . 1)
   (|%%_wLsZlv5S71_iter| . 2)
   (|%%_wLuOfS6S71_acc| . 2)
   (|%%_wL8Shp6S71_ls| . 3)
   (null? . 1))
  ((|%%_wLsZlv5S71_iter| . 1))
  (cdr car cons null?)
  (#%define reverse
    (#%letrec #t
      ((|%%_wLsZlv5S71_iter|
         (#%lambda #t
           (|%%_wL8Shp6S71_ls| |%%_wLuOfS6S71_acc|)
           (|%%_wLsZlv5S71_iter|)
           (#%if (null? |%%_wL8Shp6S71_ls|)
             |%%_wLuOfS6S71_acc|
             (|%%_wLsZlv5S71_iter|
               (cdr |%%_wL8Shp6S71_ls|)
               (cons (car |%%_wL8Shp6S71_ls|)
                     |%%_wLuOfS6S71_acc|))))))
      ()
      (#%lambda #t
        (|%%_wLOVjY5S71_ls|)
        (|%%_wLsZlv5S71_iter|)
        (|%%_wLsZlv5S71_iter| |%%_wLOVjY5S71_ls| ())))))
(#%program
  ((|%%_wLaHbM7S71_s| . 1)
   (cdr . 1)
   (|%%_wLcw579S71_d| . 1)
   (|%%_wLQKdj7S71_iter| . 2)
   (set-cdr! . 1)
   (|%%_wLSz7G8S71_r| . 2)
   (|%%_wLwD9d8S71_s| . 4)
   (null? . 1))
  ((|%%_wLQKdj7S71_iter| . 1))
  (set-cdr! cdr null?)
  (#%define reverse!
    (#%letrec #t
      ((|%%_wLQKdj7S71_iter|
         (#%lambda #t
           (|%%_wLwD9d8S71_s| |%%_wLSz7G8S71_r|)
           (|%%_wLQKdj7S71_iter|)
           (#%if (null? |%%_wLwD9d8S71_s|)
             |%%_wLSz7G8S71_r|
             ((#%lambda #t
                (|%%_wLcw579S71_d|)
                (|%%_wLSz7G8S71_r|
                  |%%_wLwD9d8S71_s|
                  |%%_wLQKdj7S71_iter|)
                (#%begin
                  (set-cdr! |%%_wLwD9d8S71_s| |%%_wLSz7G8S71_r|)
                  (|%%_wLQKdj7S71_iter|
                    |%%_wLcw579S71_d|
                    |%%_wLwD9d8S71_s|)))
              (cdr |%%_wLwD9d8S71_s|))))))
      ()
      (#%lambda #t
        (|%%_wLaHbM7S71_s|)
        (|%%_wLQKdj7S71_iter|)
        (|%%_wLQKdj7S71_iter| |%%_wLaHbM7S71_s| ())))))
(#%program
  ((cdr . 1)
   (map-car . 1)
   (caar . 1)
   (cons . 1)
   (|%%_wLys3A9S71_ls| . 3)
   (null? . 1))
  ()
  (cons caar cdr map-car null?)
  (#%define map-car
    (#%lambda #t
      (|%%_wLys3A9S71_ls|)
      ()
      (#%if (null? |%%_wLys3A9S71_ls|)
        ()
        (cons (caar |%%_wLys3A9S71_ls|)
              (map-car (cdr |%%_wLys3A9S71_ls|)))))))
(#%program
  ((cdr . 1)
   (map-cdr . 1)
   (cdar . 1)
   (cons . 1)
   (|%%_wLUo11aS71_ls| . 3)
   (null? . 1))
  ()
  (cons cdar cdr map-cdr null?)
  (#%define map-cdr
    (#%lambda #t
      (|%%_wLUo11aS71_ls|)
      ()
      (#%if (null? |%%_wLUo11aS71_ls|)
        ()
        (cons (cdar |%%_wLUo11aS71_ls|)
              (map-cdr (cdr |%%_wLUo11aS71_ls|)))))))
(#%program
  ((|%%_wLgaVQbS71_list1| . 2)
   (|%%_wLC6ThcS71_proc| . 2)
   (|%%_wLWdXnbS71_lists| . 2)
   (map-car . 1)
   (apply . 1)
   (|%%_wLGMG_eS71_lists| . 2)
   (map-cdr . 1)
   (|%%_wL-TK5eS71_proc| . 2)
   (|%%_wLAhZWaS71_loop| . 2)
   (|%%_wL0JEsfS71_c| . 2)
   (|%%_wLkQIyeS71_list1| . 3)
   (car . 2)
   (cons . 2)
   (cdr . 2)
   (|%%_wLY2RKcS71_proc| . 2)
   (|%%_wLel_taS71_map1| . 2)
   (|%%_wLEXMEdS71_acc| . 2)
   (reverse . 2)
   (|%%_wLi_ObdS71_list| . 3)
   (null? . 3))
  ((|%%_wLAhZWaS71_loop| . 1)
   (|%%_wLel_taS71_map1| . 1))
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
      ((|%%_wLel_taS71_map1|
         (#%lambda #t
           (|%%_wLY2RKcS71_proc|
             |%%_wLi_ObdS71_list|
             |%%_wLEXMEdS71_acc|)
           (|%%_wLel_taS71_map1|)
           (#%if (null? |%%_wLi_ObdS71_list|)
             (reverse |%%_wLEXMEdS71_acc|)
             (|%%_wLel_taS71_map1|
               |%%_wLY2RKcS71_proc|
               (cdr |%%_wLi_ObdS71_list|)
               (cons (|%%_wLY2RKcS71_proc| (car |%%_wLi_ObdS71_list|))
                     |%%_wLEXMEdS71_acc|)))))
       (|%%_wLAhZWaS71_loop|
         (#%lambda #t
           (|%%_wL-TK5eS71_proc|
             |%%_wLkQIyeS71_list1|
             |%%_wLGMG_eS71_lists|
             |%%_wL0JEsfS71_c|)
           (|%%_wLAhZWaS71_loop|)
           (#%if (null? |%%_wLkQIyeS71_list1|)
             (reverse |%%_wL0JEsfS71_c|)
             (|%%_wLAhZWaS71_loop|
               |%%_wL-TK5eS71_proc|
               (cdr |%%_wLkQIyeS71_list1|)
               (map-cdr |%%_wLGMG_eS71_lists|)
               (cons (apply |%%_wL-TK5eS71_proc|
                            (car |%%_wLkQIyeS71_list1|)
                            (map-car |%%_wLGMG_eS71_lists|))
                     |%%_wL0JEsfS71_c|))))))
      ()
      (#%lambda #t
        (|%%_wLC6ThcS71_proc|
          |%%_wLgaVQbS71_list1|
          .
          |%%_wLWdXnbS71_lists|)
        (|%%_wLAhZWaS71_loop| |%%_wLel_taS71_map1|)
        (#%if (null? |%%_wLWdXnbS71_lists|)
          (|%%_wLel_taS71_map1|
            |%%_wLC6ThcS71_proc|
            |%%_wLgaVQbS71_list1|
            ())
          (|%%_wLAhZWaS71_loop|
            |%%_wLC6ThcS71_proc|
            |%%_wLgaVQbS71_list1|
            |%%_wLWdXnbS71_lists|
            ()))))))
(#%program
  ((|%%_wL2yyPgS71_x| . 1)
   (|%%_wLIBAmgS71_g| . 1)
   (|%%_wLmFCVfS71_f| . 1))
  ()
  ()
  (#%define compose2
    (#%lambda #t
      (|%%_wLmFCVfS71_f| |%%_wLIBAmgS71_g|)
      ()
      (#%lambda #t
        (|%%_wL2yyPgS71_x|)
        (|%%_wLIBAmgS71_g| |%%_wLmFCVfS71_f|)
        (|%%_wLmFCVfS71_f|
          (|%%_wLIBAmgS71_g| |%%_wL2yyPgS71_x|))))))
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
  ((|%%_wLSK59nS71_list| . 1)
   (|%%_wLwO7ImS71_obj| . 1)
   (member . 1)
   (|%%_wLaS9fmS71_list| . 1)
   (|%%_wLQVbOlS71_obj| . 1)
   (memv . 1)
   (|%%_wLuZdllS71_list| . 1)
   (|%%_wL81gUkS71_obj| . 1)
   (memq . 1)
   (|%%_wLO4irkS71_alist| . 1)
   (|%%_wLs8k-jS71_obj| . 1)
   (equal? . 2)
   (assoc . 1)
   (|%%_wL6cmxjS71_alist| . 1)
   (|%%_wLMfo4jS71_obj| . 1)
   (eqv? . 2)
   (assv . 1)
   (|%%_wLqjqDiS71_alist| . 1)
   (|%%_wL4nsaiS71_obj| . 1)
   (eq? . 2)
   (assq . 1)
   (|%%_wLKquJhS71_memn| . 4)
   (|%%_wLAsXppS71_obj| . 2)
   (|%%_wLewZYoS71_n| . 2)
   (|%%_wLWoVSpS71_list| . 4)
   (cdr . 2)
   (|%%_wLouwghS71_assn| . 4)
   (car . 2)
   (|%%_wLyD13oS71_obj| . 2)
   (caar . 1)
   (|%%_wLcH3CnS71_n| . 2)
   (|%%_wLUz_voS71_alist| . 4)
   (null? . 2))
  ((member . 1)
   (memv . 1)
   (memq . 1)
   (assoc . 1)
   (assv . 1)
   (assq . 1)
   (|%%_wLKquJhS71_memn| . 1)
   (|%%_wLouwghS71_assn| . 1))
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
    ((|%%_wLouwghS71_assn|
       (#%lambda #t
         (|%%_wLcH3CnS71_n|
           |%%_wLyD13oS71_obj|
           |%%_wLUz_voS71_alist|)
         (|%%_wLouwghS71_assn|)
         (#%if (null? |%%_wLUz_voS71_alist|)
           #f
           (#%if (|%%_wLcH3CnS71_n|
                   (caar |%%_wLUz_voS71_alist|)
                   |%%_wLyD13oS71_obj|)
             (car |%%_wLUz_voS71_alist|)
             (|%%_wLouwghS71_assn|
               |%%_wLcH3CnS71_n|
               |%%_wLyD13oS71_obj|
               (cdr |%%_wLUz_voS71_alist|))))))
     (|%%_wLKquJhS71_memn|
       (#%lambda #t
         (|%%_wLewZYoS71_n|
           |%%_wLAsXppS71_obj|
           |%%_wLWoVSpS71_list|)
         (|%%_wLKquJhS71_memn|)
         (#%if (null? |%%_wLWoVSpS71_list|)
           #f
           (#%if (|%%_wLewZYoS71_n|
                   (car |%%_wLWoVSpS71_list|)
                   |%%_wLAsXppS71_obj|)
             |%%_wLWoVSpS71_list|
             (|%%_wLKquJhS71_memn|
               |%%_wLewZYoS71_n|
               |%%_wLAsXppS71_obj|
               (cdr |%%_wLWoVSpS71_list|)))))))
    ()
    (#%begin
      (#%set! assq
        (#%lambda #t
          (|%%_wL4nsaiS71_obj| |%%_wLqjqDiS71_alist|)
          (|%%_wLouwghS71_assn|)
          (|%%_wLouwghS71_assn|
            eq?
            |%%_wL4nsaiS71_obj|
            |%%_wLqjqDiS71_alist|)))
      (#%set! assv
        (#%lambda #t
          (|%%_wLMfo4jS71_obj| |%%_wL6cmxjS71_alist|)
          (|%%_wLouwghS71_assn|)
          (|%%_wLouwghS71_assn|
            eqv?
            |%%_wLMfo4jS71_obj|
            |%%_wL6cmxjS71_alist|)))
      (#%set! assoc
        (#%lambda #t
          (|%%_wLs8k-jS71_obj| |%%_wLO4irkS71_alist|)
          (|%%_wLouwghS71_assn|)
          (|%%_wLouwghS71_assn|
            equal?
            |%%_wLs8k-jS71_obj|
            |%%_wLO4irkS71_alist|)))
      (#%set! memq
        (#%lambda #t
          (|%%_wL81gUkS71_obj| |%%_wLuZdllS71_list|)
          (|%%_wLKquJhS71_memn|)
          (|%%_wLKquJhS71_memn|
            eq?
            |%%_wL81gUkS71_obj|
            |%%_wLuZdllS71_list|)))
      (#%set! memv
        (#%lambda #t
          (|%%_wLQVbOlS71_obj| |%%_wLaS9fmS71_list|)
          (|%%_wLKquJhS71_memn|)
          (|%%_wLKquJhS71_memn|
            eqv?
            |%%_wLQVbOlS71_obj|
            |%%_wLaS9fmS71_list|)))
      (#%set! member
        (#%lambda #t
          (|%%_wLwO7ImS71_obj| |%%_wLSK59nS71_list|)
          (|%%_wLKquJhS71_memn|)
          (|%%_wLKquJhS71_memn|
            equal?
            |%%_wLwO7ImS71_obj|
            |%%_wLSK59nS71_list|))))))
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
   (|%%_wLChRMqS71_ls2| . 2)
   (|%%_wLglTjqS71_ls1| . 3)
   (null? . 1))
  ()
  (cons car cdr append2 null?)
  (#%define append2
    (#%lambda #t
      (|%%_wLglTjqS71_ls1| |%%_wLChRMqS71_ls2|)
      ()
      (#%if (null? |%%_wLglTjqS71_ls1|)
        |%%_wLChRMqS71_ls2|
        (cons (car |%%_wLglTjqS71_ls1|)
              (append2
                (cdr |%%_wLglTjqS71_ls1|)
                |%%_wLChRMqS71_ls2|))))))
(#%program
  ((append2 . 1))
  ()
  (append2)
  (#%define append append2))
(#%program
  ((|%%_wLiaNGrS71_base-case| . 1)
   (|%%_wL-2JAsS71_args| . 3)
   (cdr . 2)
   (car . 2)
   (|%%_wLYdPdrS71_proc| . 1)
   (|%%_wLE6L7sS71_helper| . 2)
   (|%%_wLk_G1tS71_acc| . 2)
   (|%%_wLGXEutS71_argls| . 3)
   (null? . 2))
  ((|%%_wLE6L7sS71_helper| . 1))
  (null? cdr car)
  (#%define _make-left-pairwise-nary
    (#%lambda #t
      (|%%_wLYdPdrS71_proc| |%%_wLiaNGrS71_base-case|)
      ()
      (#%letrec #t
        ((|%%_wLE6L7sS71_helper|
           (#%lambda #t
             (|%%_wLk_G1tS71_acc| |%%_wLGXEutS71_argls|)
             (|%%_wLE6L7sS71_helper| |%%_wLYdPdrS71_proc|)
             (#%if (null? |%%_wLGXEutS71_argls|)
               |%%_wLk_G1tS71_acc|
               (|%%_wLE6L7sS71_helper|
                 (|%%_wLYdPdrS71_proc|
                   |%%_wLk_G1tS71_acc|
                   (car |%%_wLGXEutS71_argls|))
                 (cdr |%%_wLGXEutS71_argls|))))))
        (|%%_wLiaNGrS71_base-case| |%%_wLYdPdrS71_proc|)
        (#%lambda #t
          |%%_wL-2JAsS71_args|
          (|%%_wLE6L7sS71_helper|
            |%%_wLiaNGrS71_base-case|)
          (#%if (null? |%%_wL-2JAsS71_args|)
            |%%_wLiaNGrS71_base-case|
            (|%%_wLE6L7sS71_helper|
              (car |%%_wL-2JAsS71_args|)
              (cdr |%%_wL-2JAsS71_args|))))))))
(#%program
  ((length . 1)
   (make-string . 1)
   (|%%_wLmQAouS71_l| . 2)
   (+ . 1)
   (cdr . 1)
   (|%%_wL0UCXtS71_l2s| . 2)
   (car . 1)
   (|%%_wLoFuLvS71_n| . 2)
   (string-set! . 1)
   (|%%_wL2JwivS71_s| . 3)
   (|%%_wLIMyRuS71_l| . 3)
   (null? . 1))
  ((|%%_wL0UCXtS71_l2s| . 1))
  (make-string length car string-set! + cdr null?)
  (#%define list->string
    (#%letrec #t
      ((|%%_wL0UCXtS71_l2s|
         (#%lambda #t
           (|%%_wLIMyRuS71_l|
             |%%_wL2JwivS71_s|
             |%%_wLoFuLvS71_n|)
           (|%%_wL0UCXtS71_l2s|)
           (#%if (null? |%%_wLIMyRuS71_l|)
             |%%_wL2JwivS71_s|
             (#%begin
               (string-set!
                 |%%_wL2JwivS71_s|
                 |%%_wLoFuLvS71_n|
                 (car |%%_wLIMyRuS71_l|))
               (|%%_wL0UCXtS71_l2s|
                 (cdr |%%_wLIMyRuS71_l|)
                 |%%_wL2JwivS71_s|
                 (+ |%%_wLoFuLvS71_n| 1)))))))
      ()
      (#%lambda #t
        (|%%_wLmQAouS71_l|)
        (|%%_wL0UCXtS71_l2s|)
        (|%%_wL0UCXtS71_l2s|
          |%%_wLmQAouS71_l|
          (make-string (length |%%_wLmQAouS71_l|))
          0)))))
(#%program
  ((string-length . 1)
   (|%%_wL4yqFwS71_s| . 2)
   (- . 2)
   (string-ref . 1)
   (cons . 1)
   (|%%_wLquo6xS71_s| . 2)
   (|%%_wLKBscwS71_s2l| . 2)
   (|%%_wLMqmzxS71_h| . 2)
   (|%%_wL6nk0yS71_n| . 3)
   (< . 1))
  ((|%%_wLKBscwS71_s2l| . 1))
  (string-length string-ref cons - <)
  (#%define string->list
    (#%letrec #t
      ((|%%_wLKBscwS71_s2l|
         (#%lambda #t
           (|%%_wLquo6xS71_s|
             |%%_wLMqmzxS71_h|
             |%%_wL6nk0yS71_n|)
           (|%%_wLKBscwS71_s2l|)
           (#%if (< |%%_wL6nk0yS71_n| 0)
             |%%_wLMqmzxS71_h|
             (|%%_wLKBscwS71_s2l|
               |%%_wLquo6xS71_s|
               (cons (string-ref |%%_wLquo6xS71_s| |%%_wL6nk0yS71_n|)
                     |%%_wLMqmzxS71_h|)
               (- |%%_wL6nk0yS71_n| 1))))))
      ()
      (#%lambda #t
        (|%%_wL4yqFwS71_s|)
        (|%%_wLKBscwS71_s2l|)
        (|%%_wLKBscwS71_s2l|
          |%%_wL4yqFwS71_s|
          ()
          (- (string-length |%%_wL4yqFwS71_s|) 1))))))
(#%program
  ((|%%_wLsjityS71_elems| . 1) (list->vector . 1))
  ()
  (list->vector)
  (#%define vector
    (#%lambda #t
      |%%_wLsjityS71_elems|
      ()
      (list->vector |%%_wLsjityS71_elems|))))
(#%program
  ((|%%_wLOfgWyS71_elems| . 1) (list->string . 1))
  ()
  (list->string)
  (#%define string
    (#%lambda #t
      |%%_wLOfgWyS71_elems|
      ()
      (list->string |%%_wLOfgWyS71_elems|))))
(#%program
  ((_make-parameter . 1))
  ()
  (_make-parameter)
  (#%define current-url (_make-parameter "file:.")))
(#%program
  ((car . 1)
   (string-length . 1)
   (string-append . 1)
   (|%%_wLQ4ahAS71_l| . 1)
   (- . 1)
   (|%%_wLu8cQzS71_v| . 4)
   (string-ref . 1)
   (eqv? . 1)
   (current-url . 3)
   (normalize-url . 2)
   (|%%_wL8cenzS71_rest| . 2)
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
      |%%_wL8cenzS71_rest|
      ()
      (#%if (null? |%%_wL8cenzS71_rest|)
        (normalize-url (current-url) ".")
        (current-url
          (normalize-url
            (current-url)
            ((#%lambda #t
               (|%%_wLu8cQzS71_v|)
               ()
               ((#%lambda #t
                  (|%%_wLQ4ahAS71_l|)
                  (|%%_wLu8cQzS71_v|)
                  (#%if (eqv? (string-ref
                                |%%_wLu8cQzS71_v|
                                (- |%%_wLQ4ahAS71_l| 1))
                              #\/)
                    |%%_wLu8cQzS71_v|
                    (string-append |%%_wLu8cQzS71_v| "/")))
                (string-length |%%_wLu8cQzS71_v|)))
             (car |%%_wL8cenzS71_rest|))))))))
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
   (|%%_wLyO_xCS71_extension| . 1)
   (string-downcase . 1)
   (string->symbol . 1)
   (|%%_wLcS15CS71__load| . 1)
   (cdr . 1)
   (|%%_wLUKZ-CS71_t| . 2)
   (file-handler . 1)
   (|%%_wLSV3EBS71_thunk| . 1)
   (cons . 2)
   (|%%_wLa18KAS71_*file-handlers*| . 4)
   (|%%_wLwZ5bBS71_extension| . 2)
   (assq . 2)
   (not . 1)
   (add-file-handler . 1))
  ((file-handler . 1)
   (|%%_wLa18KAS71_*file-handlers*| . 1)
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
     (|%%_wLa18KAS71_*file-handlers*|)
     ()
     (#%begin
       (#%set! add-file-handler
         (#%lambda #t
           (|%%_wLwZ5bBS71_extension| |%%_wLSV3EBS71_thunk|)
           (|%%_wLa18KAS71_*file-handlers*|)
           (#%if (not (assq |%%_wLwZ5bBS71_extension|
                            |%%_wLa18KAS71_*file-handlers*|))
             (#%set! |%%_wLa18KAS71_*file-handlers*|
               (cons (cons |%%_wLwZ5bBS71_extension|
                           |%%_wLSV3EBS71_thunk|)
                     |%%_wLa18KAS71_*file-handlers*|))
             #!void)))
       (#%set! file-handler
         ((#%lambda #t
            (|%%_wLcS15CS71__load|)
            (|%%_wLa18KAS71_*file-handlers*|)
            (#%lambda #t
              (|%%_wLyO_xCS71_extension|)
              (|%%_wLcS15CS71__load|
                |%%_wLa18KAS71_*file-handlers*|)
              ((#%lambda #t
                 (|%%_wLUKZ-CS71_t|)
                 (|%%_wLcS15CS71__load|)
                 (#%if |%%_wLUKZ-CS71_t|
                   (cdr |%%_wLUKZ-CS71_t|)
                   |%%_wLcS15CS71__load|))
               (assq (string->symbol
                       (string-downcase |%%_wLyO_xCS71_extension|))
                     |%%_wLa18KAS71_*file-handlers*|))))
          load))))
   ()))
(#%program
  ((|%%_wLADVUDS71_rest| . 1)
   (|%%_wLWzTlES71_file| . 1)
   (current-url . 1)
   (normalize-url . 1)
   (|%%_wLeHXrDS71_proc| . 1)
   (apply . 1))
  ()
  (apply current-url normalize-url)
  (#%define make-io-proc
    (#%lambda #t
      (|%%_wLeHXrDS71_proc|)
      ()
      (#%lambda #t
        (|%%_wLWzTlES71_file| . |%%_wLADVUDS71_rest|)
        (|%%_wLeHXrDS71_proc|)
        (apply |%%_wLeHXrDS71_proc|
               (normalize-url
                 (current-url)
                 |%%_wLWzTlES71_file|)
               |%%_wLADVUDS71_rest|)))))
(#%program
  ((|%%_wLG6DZHS71_url| . 1)
   (string->list . 1)
   (reverse! . 1)
   (cons . 1)
   (cdr . 1)
   (|%%_wL03BqIS71_loop| . 2)
   (|%%_wLIXwkJS71_acc| . 2)
   (list->string . 1)
   (car . 2)
   (equal? . 1)
   (|%%_wLm_yTIS71_x| . 4)
   (null? . 1)
   (void . 1)
   (|%%_wLgwROES71_file-extension| . 1)
   (|%%_wLkaFwHS71_fe| . 2)
   (file-handler . 1)
   (|%%_wLEhJCGS71_e| . 1)
   (|%%_wLilL9GS71_m| . 1)
   (|%%_wL-dH3HS71_fk| . 1)
   (call-with-failure-continuation . 1)
   (with-failure-continuation . 1)
   (|%%_wLCsPfFS71_file| . 1)
   (|%%_wLYoNIFS71_previous-url| . 3)
   (normalize-url . 1)
   (current-url . 6)
   (load . 1)
   (open-output-file . 2)
   (open-source-input-file . 2)
   (make-io-proc . 3)
   (open-input-file . 2))
  ((|%%_wL03BqIS71_loop| . 1)
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
     (|%%_wLgwROES71_file-extension|)
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
           (|%%_wLCsPfFS71_file|)
           (|%%_wLgwROES71_file-extension|)
           (#%begin
             ((#%lambda #t
                (|%%_wLYoNIFS71_previous-url|)
                (|%%_wLCsPfFS71_file|
                  |%%_wLgwROES71_file-extension|)
                (#%begin
                  (current-url
                    (normalize-url
                      |%%_wLYoNIFS71_previous-url|
                      |%%_wLCsPfFS71_file|))
                  (with-failure-continuation
                    (#%lambda #t
                      (|%%_wLilL9GS71_m| |%%_wLEhJCGS71_e|)
                      (|%%_wLYoNIFS71_previous-url|)
                      (#%begin
                        (current-url |%%_wLYoNIFS71_previous-url|)
                        (call-with-failure-continuation
                          (#%lambda #t
                            (|%%_wL-dH3HS71_fk|)
                            (|%%_wLEhJCGS71_e| |%%_wLilL9GS71_m|)
                            (|%%_wL-dH3HS71_fk|
                              |%%_wLilL9GS71_m|
                              |%%_wLEhJCGS71_e|)))))
                    (#%lambda #t
                      ()
                      (|%%_wLgwROES71_file-extension|)
                      ((#%lambda #t
                         (|%%_wLkaFwHS71_fe|)
                         ()
                         ((file-handler
                            (#%if |%%_wLkaFwHS71_fe|
                              |%%_wLkaFwHS71_fe|
                              "scm"))
                          (current-url)))
                       (|%%_wLgwROES71_file-extension| (current-url)))))
                  (current-url |%%_wLYoNIFS71_previous-url|)))
              (current-url))
             (void))))))
   (#%lambda #t
     (|%%_wLG6DZHS71_url|)
     ()
     ((#%letrec #t
        ((|%%_wL03BqIS71_loop|
           (#%lambda #t
             (|%%_wLm_yTIS71_x| |%%_wLIXwkJS71_acc|)
             (|%%_wL03BqIS71_loop|)
             (#%if (null? |%%_wLm_yTIS71_x|)
               #f
               (#%if (equal? (car |%%_wLm_yTIS71_x|) #\.)
                 (list->string |%%_wLIXwkJS71_acc|)
                 (|%%_wL03BqIS71_loop|
                   (cdr |%%_wLm_yTIS71_x|)
                   (cons (car |%%_wLm_yTIS71_x|)
                         |%%_wLIXwkJS71_acc|)))))))
        ()
        |%%_wL03BqIS71_loop|)
      (reverse! (string->list |%%_wLG6DZHS71_url|))
      ()))))
(#%program
  ((|%%_wL2UuNJS71_str| . 1)
   (load-native-library . 1)
   (native-library-binding-names . 1)
   (|%%_wLKMqHKS71_binding-names| . 1)
   (|%%_wLoQseKS71_nl| . 2)
   (native-library-binding . 1)
   (|%%_wL4Jo8LS71_name| . 2)
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
      (|%%_wL2UuNJS71_str|)
      ()
      ((#%lambda #t
         (|%%_wLoQseKS71_nl|)
         ()
         ((#%lambda #t
            (|%%_wLKMqHKS71_binding-names|)
            (|%%_wLoQseKS71_nl|)
            (for-each
              (#%lambda #t
                (|%%_wL4Jo8LS71_name|)
                (|%%_wLoQseKS71_nl|)
                (putprop
                  |%%_wL4Jo8LS71_name|
                  (native-library-binding
                    |%%_wLoQseKS71_nl|
                    |%%_wL4Jo8LS71_name|)))
              |%%_wLKMqHKS71_binding-names|))
          (native-library-binding-names |%%_wLoQseKS71_nl|)))
       (load-native-library |%%_wL2UuNJS71_str|)))))
(#%program
  ((append2 . 1) (_make-left-pairwise-nary . 1))
  ()
  (append2 _make-left-pairwise-nary)
  (#%define append
    (_make-left-pairwise-nary append2 ())))
(#%program
  ((|%%_wLqFmBLS71_x| . 2)
   (null? . 2)
   (|%%_wLsugYMS71_lag| . 1)
   (cdr . 3)
   (|%%_wLMBk2MS71_lp| . 2)
   (|%%_wLujajOS71_lag| . 2)
   (|%%_wL8ncSNS71_x| . 2)
   (eq? . 1)
   (not . 1)
   (|%%_wLOqepNS71_x| . 3)
   (|%%_wL6yivMS71_x| . 3)
   (pair? . 2))
  ((|%%_wLMBk2MS71_lp| . 1))
  (pair? cdr eq? not null?)
  (#%define proper-list?
    (#%lambda #t
      (|%%_wLqFmBLS71_x|)
      ()
      ((#%letrec #t
         ((|%%_wLMBk2MS71_lp|
            (#%lambda #t
              (|%%_wL6yivMS71_x| |%%_wLsugYMS71_lag|)
              (|%%_wLMBk2MS71_lp|)
              (#%if (pair? |%%_wL6yivMS71_x|)
                ((#%lambda #t
                   (|%%_wLOqepNS71_x|)
                   (|%%_wLsugYMS71_lag| |%%_wLMBk2MS71_lp|)
                   (#%if (pair? |%%_wLOqepNS71_x|)
                     ((#%lambda #t
                        (|%%_wL8ncSNS71_x| |%%_wLujajOS71_lag|)
                        (|%%_wLMBk2MS71_lp|)
                        (#%if (not (eq? |%%_wL8ncSNS71_x| |%%_wLujajOS71_lag|))
                          (|%%_wLMBk2MS71_lp|
                            |%%_wL8ncSNS71_x|
                            |%%_wLujajOS71_lag|)
                          #f))
                      (cdr |%%_wLOqepNS71_x|)
                      (cdr |%%_wLsugYMS71_lag|))
                     (null? |%%_wLOqepNS71_x|)))
                 (cdr |%%_wL6yivMS71_x|))
                (null? |%%_wL6yivMS71_x|)))))
         ()
         |%%_wLMBk2MS71_lp|)
       |%%_wLqFmBLS71_x|
       |%%_wLqFmBLS71_x|))))
(#%program
  ((proper-list? . 1))
  ()
  (proper-list?)
  (#%define list? proper-list?))
(#%program
  ((|%%_wLQf8MOS71_general-expt| . 1)
   (|%%_wLw84GPS71_integer-expt| . 1)
   (denominator . 1)
   (numerator . 1)
   (|%%_wLac6dPS71_rational-expt| . 1)
   (integer? . 2)
   (not . 1)
   (rational? . 1)
   (|%%_wLS427QS71_base| . 9)
   (|%%_wLc10AQS71_exponent| . 8)
   (|%%_wL-oFyVS71_squaring| . 3)
   (odd? . 1)
   (quotient . 1)
   (|%%_wLYzLbUS71_loop| . 2)
   (|%%_wLEsH5VS71_result| . 3)
   (|%%_wLiwJEUS71_rest| . 3)
   (zero? . 3)
   (abs . 2)
   (ashl . 2)
   (|%%_wLCDNKTS71_exponent| . 7)
   (negative? . 3)
   (= . 1)
   (|%%_wLgHPhTS71_base| . 4)
   (exact? . 5)
   (|%%_wLAOTnSS71_base-denominator| . 1)
   (|%%_wLWKRQSS71_exponent| . 2)
   (|%%_wLeSVWRS71_base-numerator| . 1)
   (expt . 2)
   (/ . 3)
   (|%%_wLyZZ0RS71_base| . 1)
   (log . 1)
   (|%%_wLUVXtRS71_exponent| . 1)
   (* . 3)
   (exp . 1))
  ((|%%_wLYzLbUS71_loop| . 1)
   (|%%_wLw84GPS71_integer-expt| . 1)
   (|%%_wLac6dPS71_rational-expt| . 1)
   (|%%_wLQf8MOS71_general-expt| . 1))
  (numerator
    denominator
    not
    integer?
    rational?
    quotient
    odd?
    zero?
    negative?
    ashl
    abs
    exact?
    =
    expt
    /
    *
    log
    exp)
  (#%define expt
    (#%letrec #t
      ((|%%_wLQf8MOS71_general-expt|
         (#%lambda #t
           (|%%_wLyZZ0RS71_base| |%%_wLUVXtRS71_exponent|)
           ()
           (exp (* |%%_wLUVXtRS71_exponent|
                   (log |%%_wLyZZ0RS71_base|)))))
       (|%%_wLac6dPS71_rational-expt|
         (#%lambda #t
           (|%%_wLeSVWRS71_base-numerator|
             |%%_wLAOTnSS71_base-denominator|
             |%%_wLWKRQSS71_exponent|)
           ()
           (/ (expt |%%_wLeSVWRS71_base-numerator|
                    |%%_wLWKRQSS71_exponent|)
              (expt |%%_wLAOTnSS71_base-denominator|
                    |%%_wLWKRQSS71_exponent|))))
       (|%%_wLw84GPS71_integer-expt|
         (#%lambda #t
           (|%%_wLgHPhTS71_base| |%%_wLCDNKTS71_exponent|)
           ()
           (#%if (#%if (exact? |%%_wLgHPhTS71_base|)
                   (= |%%_wLgHPhTS71_base| 2)
                   #f)
             (#%if (negative? |%%_wLCDNKTS71_exponent|)
               (/ (ashl 1 (abs |%%_wLCDNKTS71_exponent|)))
               (ashl 1 |%%_wLCDNKTS71_exponent|))
             ((#%letrec #t
                ((|%%_wLYzLbUS71_loop|
                   (#%lambda #t
                     (|%%_wLiwJEUS71_rest|
                       |%%_wLEsH5VS71_result|
                       |%%_wL-oFyVS71_squaring|)
                     (|%%_wLYzLbUS71_loop|)
                     (#%if (zero? |%%_wLiwJEUS71_rest|)
                       |%%_wLEsH5VS71_result|
                       (|%%_wLYzLbUS71_loop|
                         (quotient |%%_wLiwJEUS71_rest| 2)
                         (#%if (odd? |%%_wLiwJEUS71_rest|)
                           (* |%%_wLEsH5VS71_result|
                              |%%_wL-oFyVS71_squaring|)
                           |%%_wLEsH5VS71_result|)
                         (* |%%_wL-oFyVS71_squaring|
                            |%%_wL-oFyVS71_squaring|))))))
                ()
                |%%_wLYzLbUS71_loop|)
              (#%if (negative? |%%_wLCDNKTS71_exponent|)
                (abs |%%_wLCDNKTS71_exponent|)
                |%%_wLCDNKTS71_exponent|)
              1
              (#%if (negative? |%%_wLCDNKTS71_exponent|)
                (/ |%%_wLgHPhTS71_base|)
                |%%_wLgHPhTS71_base|))))))
      ()
      (#%lambda #t
        (|%%_wLS427QS71_base| |%%_wLc10AQS71_exponent|)
        (|%%_wLw84GPS71_integer-expt|
          |%%_wLac6dPS71_rational-expt|
          |%%_wLQf8MOS71_general-expt|)
        (#%if (zero? |%%_wLc10AQS71_exponent|)
          (#%if (exact? |%%_wLc10AQS71_exponent|) 1 1.0)
          (#%if (zero? |%%_wLS427QS71_base|)
            (#%if (exact? |%%_wLc10AQS71_exponent|)
              |%%_wLS427QS71_base|
              0.0)
            (#%if (#%if (exact? |%%_wLS427QS71_base|)
                    (#%if (rational? |%%_wLS427QS71_base|)
                      (not (integer? |%%_wLS427QS71_base|))
                      #f)
                    #f)
              (|%%_wLac6dPS71_rational-expt|
                (numerator |%%_wLS427QS71_base|)
                (denominator |%%_wLS427QS71_base|)
                |%%_wLc10AQS71_exponent|)
              (#%if (#%if (exact? |%%_wLc10AQS71_exponent|)
                      (integer? |%%_wLc10AQS71_exponent|)
                      #f)
                (|%%_wLw84GPS71_integer-expt|
                  |%%_wLS427QS71_base|
                  |%%_wLc10AQS71_exponent|)
                (|%%_wLQf8MOS71_general-expt|
                  |%%_wLS427QS71_base|
                  |%%_wLc10AQS71_exponent|)))))))))
(#%program
  ((- . 1)
   (|%%_wLmaxmXS71_tmp| . 2)
   (/ . 2)
   (modpow . 2)
   (|%%_wLI6vPXS71_tmp| . 2)
   (* . 3)
   (even? . 1)
   (|%%_wL0ezVWS71_n| . 6)
   (|%%_wLklD_VS71_x| . 4)
   (modulo . 4)
   (|%%_wLGhBsWS71_y| . 4)
   (= . 1))
  ()
  (even? modpow / * - modulo =)
  (#%define modpow
    (#%lambda #t
      (|%%_wLklD_VS71_x|
        |%%_wLGhBsWS71_y|
        |%%_wL0ezVWS71_n|)
      ()
      (#%if (= |%%_wLGhBsWS71_y| 1)
        (modulo |%%_wLklD_VS71_x| |%%_wL0ezVWS71_n|)
        (#%if (even? |%%_wLGhBsWS71_y|)
          ((#%lambda #t
             (|%%_wLI6vPXS71_tmp|)
             (|%%_wL0ezVWS71_n|)
             (modulo
               (* |%%_wLI6vPXS71_tmp| |%%_wLI6vPXS71_tmp|)
               |%%_wL0ezVWS71_n|))
           (modpow
             |%%_wLklD_VS71_x|
             (/ |%%_wLGhBsWS71_y| 2)
             |%%_wL0ezVWS71_n|))
          ((#%lambda #t
             (|%%_wLmaxmXS71_tmp|)
             (|%%_wL0ezVWS71_n| |%%_wLklD_VS71_x|)
             (modulo
               (* |%%_wLklD_VS71_x|
                  (modulo
                    (* |%%_wLmaxmXS71_tmp| |%%_wLmaxmXS71_tmp|)
                    |%%_wL0ezVWS71_n|))
               |%%_wL0ezVWS71_n|))
           (modpow
             |%%_wLklD_VS71_x|
             (/ (- |%%_wLGhBsWS71_y| 1) 2)
             |%%_wL0ezVWS71_n|)))))))
(#%program
  ((round . 1)
   (= . 1)
   (real? . 1)
   (|%%_wL23tgYS71_n| . 4)
   (_integer? . 1))
  ()
  (real? round = _integer?)
  (#%define integer?
    (#%lambda #t
      (|%%_wL23tgYS71_n|)
      ()
      (#%if (_integer? |%%_wL23tgYS71_n|)
        #t
        (#%if (real? |%%_wL23tgYS71_n|)
          (= (round |%%_wL23tgYS71_n|) |%%_wL23tgYS71_n|)
          #f)))))
(#%program
  ((complex? . 1)
   (|%%_wLo_qJYS71_oldcomp?| . 1)
   (not . 1)
   (|%%_wLKXoaZS71_n| . 2)
   (number? . 1))
  ()
  (complex? number? not)
  (#%define real?
    ((#%lambda #t
       (|%%_wLo_qJYS71_oldcomp?|)
       ()
       (#%lambda #t
         (|%%_wLKXoaZS71_n|)
         (|%%_wLo_qJYS71_oldcomp?|)
         (#%if (number? |%%_wLKXoaZS71_n|)
           (not (|%%_wLo_qJYS71_oldcomp?| |%%_wLKXoaZS71_n|))
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
   (|%%_wLMMix-S71_b| . 2)
   (|%%_wLqQk4-S71_a| . 2)
   (* . 2)
   (+ . 1)
   (sqrt . 1)
   (|%%_wL4UmDZS71_num| . 6)
   (real? . 1)
   (not . 1))
  ()
  (< - + * sqrt real-part imag-part not real?)
  (#%define abs
    (#%lambda #t
      (|%%_wL4UmDZS71_num|)
      ()
      (#%if (not (real? |%%_wL4UmDZS71_num|))
        ((#%lambda #t
           (|%%_wLqQk4-S71_a| |%%_wLMMix-S71_b|)
           ()
           (sqrt (+ (* |%%_wLqQk4-S71_a| |%%_wLqQk4-S71_a|)
                    (* |%%_wLMMix-S71_b| |%%_wLMMix-S71_b|))))
         (real-part |%%_wL4UmDZS71_num|)
         (imag-part |%%_wL4UmDZS71_num|))
        (#%if (< |%%_wL4UmDZS71_num| 0)
          (- |%%_wL4UmDZS71_num|)
          |%%_wL4UmDZS71_num|)))))
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
   (|%%_wLuu8O0T71_x1| . 3)
   (|%%_wL8yal0T71_args| . 2)
   (max . 1)
   (< . 1)
   (|%%_wLOBcU_S71_x1| . 3)
   (|%%_wLsFer_S71_args| . 2)
   (min . 1)
   (inexact? . 3)
   (cdr . 2)
   (|%%_wL6Jg--S71__min_max| . 4)
   (car . 3)
   (|%%_wLQq6f1T71_proc| . 3)
   (exact->inexact . 1)
   (|%%_wLan4I1T71_mv| . 5)
   (exact? . 1)
   (|%%_wLSf0C2T71_inexact| . 3)
   (|%%_wLwj292T71_args| . 6)
   (null? . 3))
  ((max . 1)
   (min . 1)
   (|%%_wL6Jg--S71__min_max| . 1))
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
    ((|%%_wL6Jg--S71__min_max|
       (#%lambda #t
         (|%%_wLQq6f1T71_proc|
           |%%_wLan4I1T71_mv|
           |%%_wLwj292T71_args|
           |%%_wLSf0C2T71_inexact|)
         (|%%_wL6Jg--S71__min_max|)
         (#%if (null? |%%_wLwj292T71_args|)
           (#%if (#%if |%%_wLSf0C2T71_inexact|
                   (exact? |%%_wLan4I1T71_mv|)
                   #f)
             (exact->inexact |%%_wLan4I1T71_mv|)
             |%%_wLan4I1T71_mv|)
           (#%if (|%%_wLQq6f1T71_proc|
                   (car |%%_wLwj292T71_args|)
                   |%%_wLan4I1T71_mv|)
             (|%%_wL6Jg--S71__min_max|
               |%%_wLQq6f1T71_proc|
               (car |%%_wLwj292T71_args|)
               (cdr |%%_wLwj292T71_args|)
               (#%if |%%_wLSf0C2T71_inexact|
                 #t
                 (inexact? (car |%%_wLwj292T71_args|))))
             (|%%_wL6Jg--S71__min_max|
               |%%_wLQq6f1T71_proc|
               |%%_wLan4I1T71_mv|
               (cdr |%%_wLwj292T71_args|)
               |%%_wLSf0C2T71_inexact|))))))
    ()
    (#%begin
      (#%set! min
        (#%lambda #t
          (|%%_wLOBcU_S71_x1| . |%%_wLsFer_S71_args|)
          (|%%_wL6Jg--S71__min_max|)
          (#%if (null? |%%_wLsFer_S71_args|)
            |%%_wLOBcU_S71_x1|
            (|%%_wL6Jg--S71__min_max|
              <
              |%%_wLOBcU_S71_x1|
              |%%_wLsFer_S71_args|
              (inexact? |%%_wLOBcU_S71_x1|)))))
      (#%set! max
        (#%lambda #t
          (|%%_wLuu8O0T71_x1| . |%%_wL8yal0T71_args|)
          (|%%_wL6Jg--S71__min_max|)
          (#%if (null? |%%_wL8yal0T71_args|)
            |%%_wLuu8O0T71_x1|
            (|%%_wL6Jg--S71__min_max|
              >
              |%%_wLuu8O0T71_x1|
              |%%_wL8yal0T71_args|
              (inexact? |%%_wLuu8O0T71_x1|))))))))
(#%program
  ((|%%_wLcc-23T71_n| . 1) (< . 1))
  ()
  (<)
  (#%define negative?
    (#%lambda #t
      (|%%_wLcc-23T71_n|)
      ()
      (< |%%_wLcc-23T71_n| 0))))
(#%program
  ((|%%_wLy8Yv3T71_n| . 1) (> . 1))
  ()
  (>)
  (#%define positive?
    (#%lambda #t
      (|%%_wLy8Yv3T71_n|)
      ()
      (> |%%_wLy8Yv3T71_n| 0))))
(#%program
  ((|%%_wLU4WY3T71_n| . 1) (modulo . 1) (= . 1))
  ()
  (modulo =)
  (#%define even?
    (#%lambda #t
      (|%%_wLU4WY3T71_n|)
      ()
      (= 0 (modulo |%%_wLU4WY3T71_n| 2)))))
(#%program
  ((|%%_wLe1Up4T71_n| . 1) (even? . 1) (not . 1))
  ()
  (even? not)
  (#%define odd?
    (#%lambda #t
      (|%%_wLe1Up4T71_n|)
      ()
      (not (even? |%%_wLe1Up4T71_n|)))))
(#%program
  ((|%%_wLAZRS4T71_n| . 1) (= . 1))
  ()
  (=)
  (#%define zero?
    (#%lambda #t
      (|%%_wLAZRS4T71_n|)
      ()
      (= |%%_wLAZRS4T71_n| 0))))
(#%program
  ((|%%_wLWVPj5T71_n| . 1) (+ . 1))
  ()
  (+)
  (#%define add1
    (#%lambda #t
      (|%%_wLWVPj5T71_n|)
      ()
      (+ |%%_wLWVPj5T71_n| 1))))
(#%program
  ((|%%_wLgSNM5T71_n| . 1) (- . 1))
  ()
  (-)
  (#%define sub1
    (#%lambda #t
      (|%%_wLgSNM5T71_n|)
      ()
      (- |%%_wLgSNM5T71_n| 1))))
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
  ((|%%_wL43l6cT71_y| . 1)
   (|%%_wLK6nFbT71_x| . 1)
   (|%%_wLIhtiaT71_args| . 1)
   (|%%_wL2erLaT71_loop| . 2)
   (cadr . 1)
   (car . 1)
   (|%%_wLGszX8T71_comparator| . 1)
   (|%%_wL0pxo9T71_chainer| . 1)
   (cdr . 2)
   (|%%_wLmlvR9T71_endstate| . 2)
   (|%%_wLoapcbT71_x| . 5)
   (null? . 2)
   (|%%_wLkwBu8T71_b| . 2)
   (|%%_wL-zD18T71_a| . 2)
   (> . 1)
   (>= . 1)
   (|%%_wLYKJG6T71__and2| . 2)
   (= . 2)
   (|%%_wLEDFA7T71_b| . 2)
   (|%%_wLiHH77T71_a| . 2)
   (< . 1)
   (|%%_wLCOLd6T71__comp_help| . 2)
   (<= . 1))
  ((|%%_wL2erLaT71_loop| . 1) (>= . 1) (<= . 1))
  (null? cadr car cdr <= = < >= >)
  ((#%lambda #t
     (|%%_wLCOLd6T71__comp_help|
       |%%_wLYKJG6T71__and2|)
     ()
     (#%begin
       (#%set! <=
         (|%%_wLCOLd6T71__comp_help|
           (#%lambda #t
             (|%%_wLiHH77T71_a| |%%_wLEDFA7T71_b|)
             ()
             (#%if (< |%%_wLiHH77T71_a| |%%_wLEDFA7T71_b|)
               #t
               (= |%%_wLiHH77T71_a| |%%_wLEDFA7T71_b|)))
           |%%_wLYKJG6T71__and2|
           #t))
       (#%set! >=
         (|%%_wLCOLd6T71__comp_help|
           (#%lambda #t
             (|%%_wL-zD18T71_a| |%%_wLkwBu8T71_b|)
             ()
             (#%if (> |%%_wL-zD18T71_a| |%%_wLkwBu8T71_b|)
               #t
               (= |%%_wL-zD18T71_a| |%%_wLkwBu8T71_b|)))
           |%%_wLYKJG6T71__and2|
           #t))))
   (#%lambda #t
     (|%%_wLGszX8T71_comparator|
       |%%_wL0pxo9T71_chainer|
       |%%_wLmlvR9T71_endstate|)
     ()
     (#%lambda #t
       |%%_wLIhtiaT71_args|
       (|%%_wLmlvR9T71_endstate|
         |%%_wL0pxo9T71_chainer|
         |%%_wLGszX8T71_comparator|)
       ((#%letrec #t
          ((|%%_wL2erLaT71_loop|
             (#%lambda #t
               (|%%_wLoapcbT71_x|)
               (|%%_wL2erLaT71_loop|
                 |%%_wLmlvR9T71_endstate|
                 |%%_wL0pxo9T71_chainer|
                 |%%_wLGszX8T71_comparator|)
               (#%if (null? |%%_wLoapcbT71_x|)
                 |%%_wLmlvR9T71_endstate|
                 (#%if (null? (cdr |%%_wLoapcbT71_x|))
                   |%%_wLmlvR9T71_endstate|
                   (|%%_wL0pxo9T71_chainer|
                     (|%%_wLGszX8T71_comparator|
                       (car |%%_wLoapcbT71_x|)
                       (cadr |%%_wLoapcbT71_x|))
                     (|%%_wL2erLaT71_loop| (cdr |%%_wLoapcbT71_x|))))))))
          (|%%_wLmlvR9T71_endstate|
            |%%_wL0pxo9T71_chainer|
            |%%_wLGszX8T71_comparator|)
          |%%_wL2erLaT71_loop|)
        |%%_wLIhtiaT71_args|)))
   (#%lambda #t
     (|%%_wLK6nFbT71_x| |%%_wL43l6cT71_y|)
     ()
     (#%if |%%_wLK6nFbT71_x| |%%_wL43l6cT71_y| #f))))
(#%program
  ((|%%_wL6UetdT71_chainer| . 1)
   (apply . 1)
   (|%%_wLMXg0dT71_comparator| . 1)
   (cadr . 2)
   (car . 2)
   (= . 1)
   (cdr . 2)
   (|%%_wLsQcWdT71_args| . 7)
   (null? . 2)
   (< . 1)
   (<= . 2)
   (> . 1)
   (|%%_wLq_izcT71__?=| . 2)
   (>= . 2))
  ((<= . 1) (>= . 1))
  (< <= <= > >= >= null? = car cadr apply cdr)
  ((#%lambda #t
     (|%%_wLq_izcT71__?=|)
     ()
     (#%begin
       (#%set! >= (|%%_wLq_izcT71__?=| > >=))
       (#%set! <= (|%%_wLq_izcT71__?=| < <=))))
   (#%lambda #t
     (|%%_wLMXg0dT71_comparator|
       |%%_wL6UetdT71_chainer|)
     ()
     (#%lambda #t
       |%%_wLsQcWdT71_args|
       (|%%_wL6UetdT71_chainer|
         |%%_wLMXg0dT71_comparator|)
       (#%if (null? |%%_wLsQcWdT71_args|)
         #t
         (#%if (null? (cdr |%%_wLsQcWdT71_args|))
           #t
           (#%if (#%if (= (car |%%_wLsQcWdT71_args|)
                          (cadr |%%_wLsQcWdT71_args|))
                   #t
                   (|%%_wLMXg0dT71_comparator|
                     (car |%%_wLsQcWdT71_args|)
                     (cadr |%%_wLsQcWdT71_args|)))
             (apply |%%_wL6UetdT71_chainer|
                    (cdr |%%_wLsQcWdT71_args|))
             #f)))))))
(#%program
  ((gcd . 2)
   (apply . 1)
   (_gcd . 1)
   (car . 2)
   (cdr . 1)
   (|%%_wL8J8QeT71_args| . 5)
   (null? . 2))
  ()
  (cdr car apply gcd _gcd null?)
  (#%define gcd
    (#%lambda #t
      |%%_wL8J8QeT71_args|
      ()
      (#%if (null? |%%_wL8J8QeT71_args|)
        0
        (#%if (null? (cdr |%%_wL8J8QeT71_args|))
          (car |%%_wL8J8QeT71_args|)
          (_gcd (car |%%_wL8J8QeT71_args|)
                (apply gcd (gcd |%%_wL8J8QeT71_args|))))))))
(#%program
  ((lcm . 1)
   (apply . 1)
   (_lcm . 1)
   (car . 2)
   (cdr . 2)
   (|%%_wLuF6hfT71_args| . 5)
   (null? . 2))
  ()
  (cdr car apply lcm _lcm null?)
  (#%define lcm
    (#%lambda #t
      |%%_wLuF6hfT71_args|
      ()
      (#%if (null? |%%_wLuF6hfT71_args|)
        1
        (#%if (null? (cdr |%%_wLuF6hfT71_args|))
          (car |%%_wLuF6hfT71_args|)
          (_lcm (car |%%_wLuF6hfT71_args|)
                (apply lcm (cdr |%%_wLuF6hfT71_args|))))))))
(#%program
  ((|%%_wLQB4KfT71_x| . 1)
   (remainder . 1)
   (+ . 1)
   (|%%_wLwu0EgT71_r| . 3)
   (positive? . 1)
   (|%%_wLay2bgT71_y| . 3)
   (negative? . 2))
  ()
  (remainder positive? negative? +)
  (#%define modulo
    (#%lambda #t
      (|%%_wLQB4KfT71_x| |%%_wLay2bgT71_y|)
      ()
      ((#%lambda #t
         (|%%_wLwu0EgT71_r|)
         (|%%_wLay2bgT71_y|)
         (#%if ((#%if (negative? |%%_wLay2bgT71_y|)
                  positive?
                  negative?)
                |%%_wLwu0EgT71_r|)
           (+ |%%_wLwu0EgT71_r| |%%_wLay2bgT71_y|)
           |%%_wLwu0EgT71_r|))
       (remainder |%%_wLQB4KfT71_x| |%%_wLay2bgT71_y|)))))
(#%program
  ((- . 1)
   (char->integer . 4)
   (|%%_wLUfUriT71_c| . 2)
   (|%%_wLyjW-hT71_lc-offset| . 1)
   (+ . 1)
   (integer->char . 1)
   (|%%_wLcnYxhT71_z| . 1)
   (<= . 1)
   (|%%_wLSq-4hT71_a| . 2)
   (|%%_wLecSUiT71_cv| . 3)
   (>= . 1))
  ()
  (integer->char + >= <= char->integer -)
  (#%define char-downcase
    ((#%lambda #t
       (|%%_wLSq-4hT71_a|)
       ()
       ((#%lambda #t
          (|%%_wLcnYxhT71_z|)
          (|%%_wLSq-4hT71_a|)
          ((#%lambda #t
             (|%%_wLyjW-hT71_lc-offset|)
             (|%%_wLcnYxhT71_z| |%%_wLSq-4hT71_a|)
             (#%lambda #t
               (|%%_wLUfUriT71_c|)
               (|%%_wLyjW-hT71_lc-offset|
                 |%%_wLcnYxhT71_z|
                 |%%_wLSq-4hT71_a|)
               ((#%lambda #t
                  (|%%_wLecSUiT71_cv|)
                  (|%%_wLUfUriT71_c|
                    |%%_wLyjW-hT71_lc-offset|
                    |%%_wLcnYxhT71_z|
                    |%%_wLSq-4hT71_a|)
                  (#%if (#%if (>= |%%_wLecSUiT71_cv| |%%_wLSq-4hT71_a|)
                          (<= |%%_wLecSUiT71_cv| |%%_wLcnYxhT71_z|)
                          #f)
                    (integer->char
                      (+ |%%_wLecSUiT71_cv| |%%_wLyjW-hT71_lc-offset|))
                    |%%_wLUfUriT71_c|))
                (char->integer |%%_wLUfUriT71_c|))))
           (- (char->integer #\a) |%%_wLSq-4hT71_a|)))
        (char->integer #\Z)))
     (char->integer #\A))))
(#%program
  ((char->integer . 4)
   (|%%_wLCZJIkT71_c| . 2)
   (|%%_wLg1MfkT71_uc-offset| . 1)
   (- . 2)
   (integer->char . 1)
   (|%%_wLW4OOjT71_z| . 1)
   (<= . 1)
   (|%%_wLA8QljT71_a| . 2)
   (|%%_wLYVH9lT71_cv| . 3)
   (>= . 1))
  ()
  (integer->char - >= <= char->integer)
  (#%define char-upcase
    ((#%lambda #t
       (|%%_wLA8QljT71_a|)
       ()
       ((#%lambda #t
          (|%%_wLW4OOjT71_z|)
          (|%%_wLA8QljT71_a|)
          ((#%lambda #t
             (|%%_wLg1MfkT71_uc-offset|)
             (|%%_wLW4OOjT71_z| |%%_wLA8QljT71_a|)
             (#%lambda #t
               (|%%_wLCZJIkT71_c|)
               (|%%_wLg1MfkT71_uc-offset|
                 |%%_wLW4OOjT71_z|
                 |%%_wLA8QljT71_a|)
               ((#%lambda #t
                  (|%%_wLYVH9lT71_cv|)
                  (|%%_wLCZJIkT71_c|
                    |%%_wLg1MfkT71_uc-offset|
                    |%%_wLW4OOjT71_z|
                    |%%_wLA8QljT71_a|)
                  (#%if (#%if (>= |%%_wLYVH9lT71_cv| |%%_wLA8QljT71_a|)
                          (<= |%%_wLYVH9lT71_cv| |%%_wLW4OOjT71_z|)
                          #f)
                    (integer->char
                      (- |%%_wLYVH9lT71_cv| |%%_wLg1MfkT71_uc-offset|))
                    |%%_wLCZJIkT71_c|))
                (char->integer |%%_wLCZJIkT71_c|))))
           (- |%%_wLA8QljT71_a| (char->integer #\A))))
        (char->integer #\z)))
     (char->integer #\a))))
(#%program
  ((|%%_wLiSFClT71_args| . 1)
   (map . 1)
   (|%%_wLEOD3mT71_c2| . 1)
   (|%%_wL-KBwmT71_c1| . 1)
   (char->integer . 3)
   (> . 1)
   (apply . 1))
  ()
  (map char->integer > apply)
  (#%define char>?
    (#%lambda #t
      (|%%_wL-KBwmT71_c1|
        |%%_wLEOD3mT71_c2|
        .
        |%%_wLiSFClT71_args|)
      ()
      (apply >
             (char->integer |%%_wL-KBwmT71_c1|)
             (char->integer |%%_wLEOD3mT71_c2|)
             (map char->integer |%%_wLiSFClT71_args|)))))
(#%program
  ((|%%_wLkHzZmT71_args| . 1)
   (map . 1)
   (|%%_wLGDxqnT71_c2| . 1)
   (|%%_wL0AvTnT71_c1| . 1)
   (char->integer . 3)
   (< . 1)
   (apply . 1))
  ()
  (map char->integer < apply)
  (#%define char<?
    (#%lambda #t
      (|%%_wL0AvTnT71_c1|
        |%%_wLGDxqnT71_c2|
        .
        |%%_wLkHzZmT71_args|)
      ()
      (apply <
             (char->integer |%%_wL0AvTnT71_c1|)
             (char->integer |%%_wLGDxqnT71_c2|)
             (map char->integer |%%_wLkHzZmT71_args|)))))
(#%program
  ((char=? . 1)
   (|%%_wLIsrNoT71_c2| . 2)
   (|%%_wLmwtkoT71_c1| . 2)
   (char>? . 1))
  ()
  (char=? char>?)
  (#%define char>=?
    (#%lambda #t
      (|%%_wLmwtkoT71_c1| |%%_wLIsrNoT71_c2|)
      ()
      (#%if (char>? |%%_wLmwtkoT71_c1| |%%_wLIsrNoT71_c2|)
        #t
        (char=? |%%_wLmwtkoT71_c1| |%%_wLIsrNoT71_c2|)))))
(#%program
  ((char=? . 1)
   (|%%_wLolnHpT71_c2| . 2)
   (|%%_wL2ppepT71_c1| . 2)
   (char<? . 1))
  ()
  (char=? char<?)
  (#%define char<=?
    (#%lambda #t
      (|%%_wL2ppepT71_c1| |%%_wLolnHpT71_c2|)
      ()
      (#%if (char<? |%%_wL2ppepT71_c1| |%%_wLolnHpT71_c2|)
        #t
        (char=? |%%_wL2ppepT71_c1| |%%_wLolnHpT71_c2|)))))
(#%program
  ((|%%_wLKhl8qT71_args| . 1)
   (map . 1)
   (|%%_wL4ejBqT71_c2| . 1)
   (|%%_wLqah2rT71_c1| . 1)
   (char-downcase . 3)
   (char>? . 1)
   (apply . 1))
  ()
  (map char-downcase char>? apply)
  (#%define char-ci>?
    (#%lambda #t
      (|%%_wLqah2rT71_c1|
        |%%_wL4ejBqT71_c2|
        .
        |%%_wLKhl8qT71_args|)
      ()
      (apply char>?
             (char-downcase |%%_wLqah2rT71_c1|)
             (char-downcase |%%_wL4ejBqT71_c2|)
             (map char-downcase |%%_wLKhl8qT71_args|)))))
(#%program
  ((|%%_wLM6fvrT71_args| . 1)
   (map . 1)
   (|%%_wL63dYrT71_c2| . 1)
   (|%%_wLs_apsT71_c1| . 1)
   (char-downcase . 3)
   (char<? . 1)
   (apply . 1))
  ()
  (map char-downcase char<? apply)
  (#%define char-ci<?
    (#%lambda #t
      (|%%_wLs_apsT71_c1|
        |%%_wL63dYrT71_c2|
        .
        |%%_wLM6fvrT71_args|)
      ()
      (apply char<?
             (char-downcase |%%_wLs_apsT71_c1|)
             (char-downcase |%%_wL63dYrT71_c2|)
             (map char-downcase |%%_wLM6fvrT71_args|)))))
(#%program
  ((|%%_wLOX8SsT71_args| . 1)
   (map . 1)
   (|%%_wL8U6jtT71_c2| . 1)
   (|%%_wLuQ4MtT71_c1| . 1)
   (char-downcase . 3)
   (char=? . 1)
   (apply . 1))
  ()
  (map char-downcase char=? apply)
  (#%define char-ci=?
    (#%lambda #t
      (|%%_wLuQ4MtT71_c1|
        |%%_wL8U6jtT71_c2|
        .
        |%%_wLOX8SsT71_args|)
      ()
      (apply char=?
             (char-downcase |%%_wLuQ4MtT71_c1|)
             (char-downcase |%%_wL8U6jtT71_c2|)
             (map char-downcase |%%_wLOX8SsT71_args|)))))
(#%program
  ((char-ci=? . 1)
   (|%%_wLaJ0GuT71_c2| . 2)
   (|%%_wLQM2duT71_c1| . 2)
   (char-ci>? . 1))
  ()
  (char-ci=? char-ci>?)
  (#%define char-ci>=?
    (#%lambda #t
      (|%%_wLQM2duT71_c1| |%%_wLaJ0GuT71_c2|)
      ()
      (#%if (char-ci>? |%%_wLQM2duT71_c1| |%%_wLaJ0GuT71_c2|)
        #t
        (char-ci=? |%%_wLQM2duT71_c1| |%%_wLaJ0GuT71_c2|)))))
(#%program
  ((char-ci=? . 1)
   (|%%_wLSBYzvT71_c2| . 2)
   (|%%_wLwF-6vT71_c1| . 2)
   (char-ci<? . 1))
  ()
  (char-ci=? char-ci<?)
  (#%define char-ci<=?
    (#%lambda #t
      (|%%_wLwF-6vT71_c1| |%%_wLSBYzvT71_c2|)
      ()
      (#%if (char-ci<? |%%_wLwF-6vT71_c1| |%%_wLSBYzvT71_c2|)
        #t
        (char-ci=? |%%_wLwF-6vT71_c1| |%%_wLSBYzvT71_c2|)))))
(#%program
  ((|%%_wLcyW0wT71_c| . 2) (char<? . 2))
  ()
  (char<?)
  (#%define char-alphabetic?
    (#%lambda #t
      (|%%_wLcyW0wT71_c|)
      ()
      (#%if (char<? #\@ |%%_wLcyW0wT71_c| #\[)
        #t
        (char<? #\` |%%_wLcyW0wT71_c| #\{)))))
(#%program
  ((|%%_wLyuUtwT71_c| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-numeric?
    (#%lambda #t
      (|%%_wLyuUtwT71_c|)
      ()
      (char<? #\/ |%%_wLyuUtwT71_c| #\:))))
(#%program
  ((|%%_wLUqSWwT71_c| . 4) (char=? . 4))
  ()
  (char=?)
  (#%define char-whitespace?
    (#%lambda #t
      (|%%_wLUqSWwT71_c|)
      ()
      (#%if (char=? |%%_wLUqSWwT71_c| #\space)
        #t
        (#%if (char=? |%%_wLUqSWwT71_c| #\tab)
          #t
          (#%if (char=? |%%_wLUqSWwT71_c| #\newline)
            #t
            (char=? |%%_wLUqSWwT71_c| #\return)))))))
(#%program
  ((|%%_wLenQnxT71_c| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-upper-case?
    (#%lambda #t
      (|%%_wLenQnxT71_c|)
      ()
      (char<? #\@ |%%_wLenQnxT71_c| #\[))))
(#%program
  ((|%%_wLAjOQxT71_c| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-lower-case?
    (#%lambda #t
      (|%%_wLAjOQxT71_c|)
      ()
      (char<? #\` |%%_wLAjOQxT71_c| #\{))))
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
   (|%%_wLi1E5AT71_newstr| . 1)
   (|%%_wLY4GEzT71_str| . 3)
   (string-upcase . 1)
   (make-string . 2)
   (string-length . 4)
   (char-downcase . 1)
   (|%%_wLC8IbzT71_newstr| . 1)
   (|%%_wLgcKKyT71_str| . 3)
   (string-downcase . 1)
   (+ . 1)
   (|%%_wLWfMhyT71_string-map| . 3)
   (|%%_wLEZByAT71_strsrc| . 2)
   (string-ref . 1)
   (|%%_wLkSxsBT71_proc| . 2)
   (|%%_wL-Vz_AT71_strdst| . 3)
   (string-set! . 1)
   (|%%_wL0LtmCT71_l| . 2)
   (|%%_wLGOvVBT71_n| . 4)
   (< . 1))
  ((string-upcase . 1)
   (string-downcase . 1)
   (|%%_wLWfMhyT71_string-map| . 1))
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
    ((|%%_wLWfMhyT71_string-map|
       (#%lambda #t
         (|%%_wLEZByAT71_strsrc|
           |%%_wL-Vz_AT71_strdst|
           |%%_wLkSxsBT71_proc|
           |%%_wLGOvVBT71_n|
           |%%_wL0LtmCT71_l|)
         (|%%_wLWfMhyT71_string-map|)
         (#%if (< |%%_wLGOvVBT71_n| |%%_wL0LtmCT71_l|)
           (#%begin
             (string-set!
               |%%_wL-Vz_AT71_strdst|
               |%%_wLGOvVBT71_n|
               (|%%_wLkSxsBT71_proc|
                 (string-ref
                   |%%_wLEZByAT71_strsrc|
                   |%%_wLGOvVBT71_n|)))
             (|%%_wLWfMhyT71_string-map|
               |%%_wLEZByAT71_strsrc|
               |%%_wL-Vz_AT71_strdst|
               |%%_wLkSxsBT71_proc|
               (+ |%%_wLGOvVBT71_n| 1)
               |%%_wL0LtmCT71_l|))
           |%%_wL-Vz_AT71_strdst|))))
    ()
    (#%begin
      (#%set! string-downcase
        (#%lambda #t
          (|%%_wLgcKKyT71_str|)
          (|%%_wLWfMhyT71_string-map|)
          ((#%lambda #t
             (|%%_wLC8IbzT71_newstr|)
             (|%%_wLgcKKyT71_str| |%%_wLWfMhyT71_string-map|)
             (|%%_wLWfMhyT71_string-map|
               |%%_wLgcKKyT71_str|
               |%%_wLC8IbzT71_newstr|
               char-downcase
               0
               (string-length |%%_wLgcKKyT71_str|)))
           (make-string (string-length |%%_wLgcKKyT71_str|)))))
      (#%set! string-upcase
        (#%lambda #t
          (|%%_wLY4GEzT71_str|)
          (|%%_wLWfMhyT71_string-map|)
          ((#%lambda #t
             (|%%_wLi1E5AT71_newstr|)
             (|%%_wLY4GEzT71_str| |%%_wLWfMhyT71_string-map|)
             (|%%_wLWfMhyT71_string-map|
               |%%_wLY4GEzT71_str|
               |%%_wLi1E5AT71_newstr|
               char-upcase
               0
               (string-length |%%_wLY4GEzT71_str|)))
           (make-string (string-length |%%_wLY4GEzT71_str|))))))))
(#%program
  ((|%%_wL2AnJDT71_s2| . 1)
   (|%%_wLIDpgDT71_s1| . 1)
   (string->list . 2)
   (car . 2)
   (cdr . 2)
   (|%%_wLmHrPCT71_s<?| . 2)
   (char>? . 1)
   (|%%_wLqlfxFT71_c2| . 2)
   (|%%_wL4ph4FT71_c1| . 2)
   (char<? . 1)
   (|%%_wLKsjDET71_s2| . 4)
   (not . 1)
   (|%%_wLowlaET71_s1| . 3)
   (null? . 3))
  ((|%%_wLmHrPCT71_s<?| . 1))
  (string->list car char<? cdr char>? not null?)
  (#%define string<?
    (#%letrec #t
      ((|%%_wLmHrPCT71_s<?|
         (#%lambda #t
           (|%%_wLowlaET71_s1| |%%_wLKsjDET71_s2|)
           (|%%_wLmHrPCT71_s<?|)
           (#%if (null? |%%_wLowlaET71_s1|)
             (not (null? |%%_wLKsjDET71_s2|))
             (#%if (null? |%%_wLKsjDET71_s2|)
               #f
               ((#%lambda #t
                  (|%%_wL4ph4FT71_c1| |%%_wLqlfxFT71_c2|)
                  (|%%_wLKsjDET71_s2|
                    |%%_wLowlaET71_s1|
                    |%%_wLmHrPCT71_s<?|)
                  (#%if (char<? |%%_wL4ph4FT71_c1| |%%_wLqlfxFT71_c2|)
                    #t
                    (#%if (char>? |%%_wL4ph4FT71_c1| |%%_wLqlfxFT71_c2|)
                      #f
                      (|%%_wLmHrPCT71_s<?|
                        (cdr |%%_wLowlaET71_s1|)
                        (cdr |%%_wLKsjDET71_s2|)))))
                (car |%%_wLowlaET71_s1|)
                (car |%%_wLKsjDET71_s2|)))))))
      ()
      (#%lambda #t
        (|%%_wLIDpgDT71_s1| |%%_wL2AnJDT71_s2|)
        (|%%_wLmHrPCT71_s<?|)
        (|%%_wLmHrPCT71_s<?|
          (string->list |%%_wLIDpgDT71_s1|)
          (string->list |%%_wL2AnJDT71_s2|))))))
(#%program
  ((|%%_wLsa9UGT71_s2| . 1)
   (|%%_wL6ebrGT71_s1| . 1)
   (string->list . 2)
   (car . 2)
   (cdr . 2)
   (|%%_wLMhd-FT71_s>?| . 2)
   (char<? . 1)
   (|%%_wLQX0IIT71_c2| . 2)
   (|%%_wLu_2fIT71_c1| . 2)
   (char>? . 1)
   (|%%_wLO67lHT71_s1| . 4)
   (not . 1)
   (|%%_wL835OHT71_s2| . 3)
   (null? . 3))
  ((|%%_wLMhd-FT71_s>?| . 1))
  (string->list car char>? cdr char<? not null?)
  (#%define string>?
    (#%letrec #t
      ((|%%_wLMhd-FT71_s>?|
         (#%lambda #t
           (|%%_wLO67lHT71_s1| |%%_wL835OHT71_s2|)
           (|%%_wLMhd-FT71_s>?|)
           (#%if (null? |%%_wL835OHT71_s2|)
             (not (null? |%%_wLO67lHT71_s1|))
             (#%if (null? |%%_wLO67lHT71_s1|)
               #f
               ((#%lambda #t
                  (|%%_wLu_2fIT71_c1| |%%_wLQX0IIT71_c2|)
                  (|%%_wL835OHT71_s2|
                    |%%_wLO67lHT71_s1|
                    |%%_wLMhd-FT71_s>?|)
                  (#%if (char>? |%%_wLu_2fIT71_c1| |%%_wLQX0IIT71_c2|)
                    #t
                    (#%if (char<? |%%_wLu_2fIT71_c1| |%%_wLQX0IIT71_c2|)
                      #f
                      (|%%_wLMhd-FT71_s>?|
                        (cdr |%%_wLO67lHT71_s1|)
                        (cdr |%%_wL835OHT71_s2|)))))
                (car |%%_wLO67lHT71_s1|)
                (car |%%_wL835OHT71_s2|)))))))
      ()
      (#%lambda #t
        (|%%_wL6ebrGT71_s1| |%%_wLsa9UGT71_s2|)
        (|%%_wLMhd-FT71_s>?|)
        (|%%_wLMhd-FT71_s>?|
          (string->list |%%_wL6ebrGT71_s1|)
          (string->list |%%_wLsa9UGT71_s2|))))))
(#%program
  ((string=? . 1)
   (|%%_wLwQYBJT71_s2| . 2)
   (|%%_wLaU-8JT71_s1| . 2)
   (string<? . 1))
  ()
  (string=? string<?)
  (#%define string<=?
    (#%lambda #t
      (|%%_wLaU-8JT71_s1| |%%_wLwQYBJT71_s2|)
      ()
      (#%if (string<? |%%_wLaU-8JT71_s1| |%%_wLwQYBJT71_s2|)
        #t
        (string=? |%%_wLaU-8JT71_s1| |%%_wLwQYBJT71_s2|)))))
(#%program
  ((string=? . 1)
   (|%%_wLcJUvKT71_s2| . 2)
   (|%%_wLSMW2KT71_s1| . 2)
   (string>? . 1))
  ()
  (string=? string>?)
  (#%define string>=?
    (#%lambda #t
      (|%%_wLSMW2KT71_s1| |%%_wLcJUvKT71_s2|)
      ()
      (#%if (string>? |%%_wLSMW2KT71_s1| |%%_wLcJUvKT71_s2|)
        #t
        (string=? |%%_wLSMW2KT71_s1| |%%_wLcJUvKT71_s2|)))))
(#%program
  ((|%%_wLUBQpLT71_s2| . 1)
   (|%%_wLyFSYKT71_s1| . 1)
   (string-downcase . 2)
   (string=? . 1))
  ()
  (string-downcase string=?)
  (#%define string-ci=?
    (#%lambda #t
      (|%%_wLyFSYKT71_s1| |%%_wLUBQpLT71_s2|)
      ()
      (string=?
        (string-downcase |%%_wLyFSYKT71_s1|)
        (string-downcase |%%_wLUBQpLT71_s2|)))))
(#%program
  ((|%%_wLAuMjMT71_s2| . 1)
   (|%%_wLeyOSLT71_s1| . 1)
   (string-downcase . 2)
   (string<? . 1))
  ()
  (string-downcase string<?)
  (#%define string-ci<?
    (#%lambda #t
      (|%%_wLeyOSLT71_s1| |%%_wLAuMjMT71_s2|)
      ()
      (string<?
        (string-downcase |%%_wLeyOSLT71_s1|)
        (string-downcase |%%_wLAuMjMT71_s2|)))))
(#%program
  ((|%%_wLgnIdNT71_s2| . 1)
   (|%%_wLWqKMMT71_s1| . 1)
   (string-downcase . 2)
   (string>? . 1))
  ()
  (string-downcase string>?)
  (#%define string-ci>?
    (#%lambda #t
      (|%%_wLWqKMMT71_s1| |%%_wLgnIdNT71_s2|)
      ()
      (string>?
        (string-downcase |%%_wLWqKMMT71_s1|)
        (string-downcase |%%_wLgnIdNT71_s2|)))))
(#%program
  ((|%%_wLYfE7OT71_s2| . 1)
   (|%%_wLCjGGNT71_s1| . 1)
   (string-downcase . 2)
   (string>=? . 1))
  ()
  (string-downcase string>=?)
  (#%define string-ci>=?
    (#%lambda #t
      (|%%_wLCjGGNT71_s1| |%%_wLYfE7OT71_s2|)
      ()
      (string>=?
        (string-downcase |%%_wLCjGGNT71_s1|)
        (string-downcase |%%_wLYfE7OT71_s2|)))))
(#%program
  ((|%%_wLE8A1PT71_s2| . 1)
   (|%%_wLicCAOT71_s1| . 1)
   (string-downcase . 2)
   (string<=? . 1))
  ()
  (string-downcase string<=?)
  (#%define string-ci<=?
    (#%lambda #t
      (|%%_wLicCAOT71_s1| |%%_wLE8A1PT71_s2|)
      ()
      (string<=?
        (string-downcase |%%_wLicCAOT71_s1|)
        (string-downcase |%%_wLE8A1PT71_s2|)))))
(#%program
  ((- . 1)
   (make-string . 1)
   (|%%_wL0WrRQT71_end| . 2)
   (|%%_wLGZtoQT71_start| . 2)
   (|%%_wLmSpiRT71_newstr| . 2)
   (|%%_wLk1wXPT71_str| . 1)
   (+ . 2)
   (|%%_wL-4yuPT71_fill-string| . 2)
   (|%%_wLIOnLRT71_sstr| . 2)
   (string-ref . 1)
   (|%%_wLoHjFST71_n| . 2)
   (|%%_wL2LlcST71_dstr| . 2)
   (string-set! . 1)
   (|%%_wL4AfzTT71_e| . 2)
   (|%%_wLKDh6TT71_s| . 3)
   (< . 1))
  ((|%%_wL-4yuPT71_fill-string| . 1))
  (make-string - string-ref string-set! + <)
  (#%define substring
    (#%letrec #t
      ((|%%_wL-4yuPT71_fill-string|
         (#%lambda #t
           (|%%_wLIOnLRT71_sstr|
             |%%_wL2LlcST71_dstr|
             |%%_wLoHjFST71_n|
             |%%_wLKDh6TT71_s|
             |%%_wL4AfzTT71_e|)
           (|%%_wL-4yuPT71_fill-string|)
           (#%if (< |%%_wLKDh6TT71_s| |%%_wL4AfzTT71_e|)
             (#%begin
               (string-set!
                 |%%_wL2LlcST71_dstr|
                 |%%_wLoHjFST71_n|
                 (string-ref
                   |%%_wLIOnLRT71_sstr|
                   |%%_wLKDh6TT71_s|))
               (|%%_wL-4yuPT71_fill-string|
                 |%%_wLIOnLRT71_sstr|
                 |%%_wL2LlcST71_dstr|
                 (+ |%%_wLoHjFST71_n| 1)
                 (+ |%%_wLKDh6TT71_s| 1)
                 |%%_wL4AfzTT71_e|))
             #!void))))
      ()
      (#%lambda #t
        (|%%_wLk1wXPT71_str|
          |%%_wLGZtoQT71_start|
          |%%_wL0WrRQT71_end|)
        (|%%_wL-4yuPT71_fill-string|)
        ((#%lambda #t
           (|%%_wLmSpiRT71_newstr|)
           (|%%_wL0WrRQT71_end|
             |%%_wLGZtoQT71_start|
             |%%_wLk1wXPT71_str|
             |%%_wL-4yuPT71_fill-string|)
           (#%begin
             (|%%_wL-4yuPT71_fill-string|
               |%%_wLk1wXPT71_str|
               |%%_wLmSpiRT71_newstr|
               0
               |%%_wLGZtoQT71_start|
               |%%_wL0WrRQT71_end|)
             |%%_wLmSpiRT71_newstr|))
         (make-string
           (- |%%_wL0WrRQT71_end| |%%_wLGZtoQT71_start|)))))))
(#%program
  ((- . 1)
   (cdr . 1)
   (list-ref . 1)
   (|%%_wLqwd0UT71_list| . 2)
   (car . 1)
   (|%%_wLMsbtUT71_n| . 2)
   (zero? . 1))
  ()
  (list-ref cdr - car zero?)
  (#%define list-ref
    (#%lambda #t
      (|%%_wLqwd0UT71_list| |%%_wLMsbtUT71_n|)
      ()
      (#%if (zero? |%%_wLMsbtUT71_n|)
        (car |%%_wLqwd0UT71_list|)
        (list-ref
          (cdr |%%_wLqwd0UT71_list|)
          (- |%%_wLMsbtUT71_n| 1))))))
(#%program
  ((|%%_wL6p9WUT71_args| . 1)
   (|%%_wLsl7nVT71_k| . 1)
   (apply . 1)
   (call-with-current-continuation . 1))
  ()
  (apply call-with-current-continuation)
  (#%define values
    (#%lambda #t
      |%%_wL6p9WUT71_args|
      ()
      (call-with-current-continuation
        (#%lambda #t
          (|%%_wLsl7nVT71_k|)
          (|%%_wL6p9WUT71_args|)
          (apply |%%_wLsl7nVT71_k| |%%_wL6p9WUT71_args|))))))
