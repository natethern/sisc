(#%program
  ((_make-native-parameter . 1))
  ()
  (_make-native-parameter)
  (#%define hedged-inlining
    (_make-native-parameter "hedgedInlining")))
(#%program
  ((_make-native-parameter . 1))
  ()
  (_make-native-parameter)
  (#%define inline-primitives
    (_make-native-parameter "inlinePrimitives")))
(#%program
  ((inline-primitives . 1))
  ()
  (inline-primitives)
  (#%define inline-usual-primitives
    (#%lambda #t
      ()
      ()
      (inline-primitives
        (#%quote
          (* +
             -
             /
             <
             <=
             =
             >
             >=
             abs
             acos
             angle
             asin
             assoc
             assq
             assv
             atan
             boolean?
             car
             cdr
             caar
             cadr
             cdar
             cddr
             ceiling
             char-alphabetic?
             char-ci<=?
             char-ci<?
             char-ci=?
             char-ci>=?
             char-ci>?
             char-lower-case?
             char-numeric?
             char-ready?
             char-upcase
             char-upper-case?
             char-whitespace?
             char<=?
             char<?
             char=?
             char>=?
             char>?
             char?
             complex?
             cos
             denominator
             eof-object?
             eq?
             equal?
             eqv?
             even?
             exact?
             exp
             expt
             floor
             gcd
             imag-part
             inexact?
             input-port?
             integer?
             lcm
             length
             list-ref
             list?
             log
             magnitude
             max
             member
             memq
             memv
             min
             modulo
             negative?
             not
             null?
             number?
             numerator
             odd?
             output-port?
             pair?
             positive?
             procedure?
             quotient
             rational?
             real-part
             real?
             remainder
             round
             sin
             sqrt
             string-ci<=?
             string-ci<?
             string-ci=?
             string-ci>=?
             string-ci>?
             string-length
             string<=?
             string<?
             string=?
             string>=?
             string>?
             string?
             symbol?
             tan
             truncate
             vector-length
             vector?
             zero?))))))
(#%program
  ((inline-usual-primitives . 1))
  ()
  (inline-usual-primitives)
  (inline-usual-primitives))
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
   (|%%_iiwhT1ySv_proc| . 2)
   (apply . 2)
   (cons . 1)
   (|%%_iiQoX7xSv_lists| . 4)
   (|%%_iialVAxSv_ls1| . 2)
   (null? . 1))
  ((|%%_iiQoX7xSv_lists| . 1))
  (cons map-car apply map-cdr for-each null?)
  (#%define for-each
    (#%lambda #t
      (|%%_iiwhT1ySv_proc|
        |%%_iialVAxSv_ls1|
        .
        |%%_iiQoX7xSv_lists|)
      ()
      (#%if (null? |%%_iialVAxSv_ls1|)
        #!void
        (#%begin
          (#%set! |%%_iiQoX7xSv_lists|
            (cons |%%_iialVAxSv_ls1| |%%_iiQoX7xSv_lists|))
          (apply |%%_iiwhT1ySv_proc|
                 (map-car |%%_iiQoX7xSv_lists|))
          (apply for-each
                 |%%_iiwhT1ySv_proc|
                 (map-cdr |%%_iiQoX7xSv_lists|)))))))
(#%program
  ((|%%_iiSdRuySv_x| . 1) (eq? . 1))
  ()
  (eq?)
  (#%define eof-object?
    (#%lambda #t
      (|%%_iiSdRuySv_x|)
      ()
      (eq? |%%_iiSdRuySv_x| #!eof))))
(#%program
  ((|%%_iicaPXySv_x| . 1))
  ()
  ()
  (#%define not
    (#%lambda #t
      (|%%_iicaPXySv_x|)
      ()
      (#%if |%%_iicaPXySv_x| #f #t))))
(#%program
  ((|%%_iiy6NozSv_port| . 1)
   (display . 1)
   (apply . 1))
  ()
  (display apply)
  (#%define newline
    (#%lambda #t
      |%%_iiy6NozSv_port|
      ()
      (apply display #\newline |%%_iiy6NozSv_port|))))
(#%program
  ((|%%_iie_IiASv_ls| . 1)
   (car . 1)
   (cons . 1)
   (cdr . 1)
   (|%%_iiU2LRzSv_iter| . 2)
   (|%%_iiWTEcBSv_acc| . 2)
   (|%%_iiAXGLASv_ls| . 3)
   (null? . 1))
  ((|%%_iiU2LRzSv_iter| . 1))
  (cdr car cons null?)
  (#%define reverse
    (#%letrec #t
      ((|%%_iiU2LRzSv_iter|
         (#%lambda #t
           (|%%_iiAXGLASv_ls| |%%_iiWTEcBSv_acc|)
           (|%%_iiU2LRzSv_iter|)
           (#%if (null? |%%_iiAXGLASv_ls|)
             |%%_iiWTEcBSv_acc|
             (|%%_iiU2LRzSv_iter|
               (cdr |%%_iiAXGLASv_ls|)
               (cons (car |%%_iiAXGLASv_ls|) |%%_iiWTEcBSv_acc|))))))
      ()
      (#%lambda #t
        (|%%_iie_IiASv_ls|)
        (|%%_iiU2LRzSv_iter|)
        (|%%_iiU2LRzSv_iter| |%%_iie_IiASv_ls| ())))))
(#%program
  ((|%%_iiCMA6CSv_s| . 1)
   (cdr . 1)
   (|%%_iiEButDSv_d| . 1)
   (|%%_iigQCFBSv_iter| . 2)
   (set-cdr! . 1)
   (|%%_iiiFw0DSv_r| . 2)
   (|%%_iiYIyzCSv_s| . 4)
   (null? . 1))
  ((|%%_iigQCFBSv_iter| . 1))
  (set-cdr! cdr null?)
  (#%define reverse!
    (#%letrec #t
      ((|%%_iigQCFBSv_iter|
         (#%lambda #t
           (|%%_iiYIyzCSv_s| |%%_iiiFw0DSv_r|)
           (|%%_iigQCFBSv_iter|)
           (#%if (null? |%%_iiYIyzCSv_s|)
             |%%_iiiFw0DSv_r|
             ((#%lambda #t
                (|%%_iiEButDSv_d|)
                (|%%_iiiFw0DSv_r|
                  |%%_iiYIyzCSv_s|
                  |%%_iigQCFBSv_iter|)
                (#%begin
                  (set-cdr! |%%_iiYIyzCSv_s| |%%_iiiFw0DSv_r|)
                  (|%%_iigQCFBSv_iter|
                    |%%_iiEButDSv_d|
                    |%%_iiYIyzCSv_s|)))
              (cdr |%%_iiYIyzCSv_s|))))))
      ()
      (#%lambda #t
        (|%%_iiCMA6CSv_s|)
        (|%%_iigQCFBSv_iter|)
        (|%%_iigQCFBSv_iter| |%%_iiCMA6CSv_s| ())))))
(#%program
  ((cdr . 1)
   (map-car . 1)
   (caar . 1)
   (cons . 1)
   (|%%_ii-xsWDSv_ls| . 3)
   (null? . 1))
  ()
  (cons caar cdr map-car null?)
  (#%define map-car
    (#%lambda #t
      (|%%_ii-xsWDSv_ls|)
      ()
      (#%if (null? |%%_ii-xsWDSv_ls|)
        ()
        (cons (caar |%%_ii-xsWDSv_ls|)
              (map-car (cdr |%%_ii-xsWDSv_ls|)))))))
(#%program
  ((cdr . 1)
   (map-cdr . 1)
   (cdar . 1)
   (cons . 1)
   (|%%_iikuqnESv_ls| . 3)
   (null? . 1))
  ()
  (cons cdar cdr map-cdr null?)
  (#%define map-cdr
    (#%lambda #t
      (|%%_iikuqnESv_ls|)
      ()
      (#%if (null? |%%_iikuqnESv_ls|)
        ()
        (cons (cdar |%%_iikuqnESv_ls|)
              (map-cdr (cdr |%%_iikuqnESv_ls|)))))))
(#%program
  ((|%%_iiIfibGSv_list1| . 2)
   (|%%_ii2cgEGSv_proc| . 2)
   (|%%_iimjkKFSv_lists| . 2)
   (map-car . 1)
   (apply . 1)
   (|%%_ii6S3mJSv_lists| . 2)
   (map-cdr . 1)
   (|%%_iiqZ7sISv_proc| . 2)
   (|%%_ii0nmhFSv_loop| . 2)
   (|%%_iisO1PJSv_c| . 2)
   (|%%_iiMV5VISv_list1| . 3)
   (car . 2)
   (cons . 2)
   (cdr . 2)
   (|%%_iio8e5HSv_proc| . 2)
   (|%%_iiGqoQESv_map1| . 2)
   (|%%_ii41a_HSv_acc| . 2)
   (reverse . 2)
   (|%%_iiK4cyHSv_list| . 3)
   (null? . 3))
  ((|%%_ii0nmhFSv_loop| . 1)
   (|%%_iiGqoQESv_map1| . 1))
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
      ((|%%_iiGqoQESv_map1|
         (#%lambda #t
           (|%%_iio8e5HSv_proc|
             |%%_iiK4cyHSv_list|
             |%%_ii41a_HSv_acc|)
           (|%%_iiGqoQESv_map1|)
           (#%if (null? |%%_iiK4cyHSv_list|)
             (reverse |%%_ii41a_HSv_acc|)
             (|%%_iiGqoQESv_map1|
               |%%_iio8e5HSv_proc|
               (cdr |%%_iiK4cyHSv_list|)
               (cons (|%%_iio8e5HSv_proc| (car |%%_iiK4cyHSv_list|))
                     |%%_ii41a_HSv_acc|)))))
       (|%%_ii0nmhFSv_loop|
         (#%lambda #t
           (|%%_iiqZ7sISv_proc|
             |%%_iiMV5VISv_list1|
             |%%_ii6S3mJSv_lists|
             |%%_iisO1PJSv_c|)
           (|%%_ii0nmhFSv_loop|)
           (#%if (null? |%%_iiMV5VISv_list1|)
             (reverse |%%_iisO1PJSv_c|)
             (|%%_ii0nmhFSv_loop|
               |%%_iiqZ7sISv_proc|
               (cdr |%%_iiMV5VISv_list1|)
               (map-cdr |%%_ii6S3mJSv_lists|)
               (cons (apply |%%_iiqZ7sISv_proc|
                            (car |%%_iiMV5VISv_list1|)
                            (map-car |%%_ii6S3mJSv_lists|))
                     |%%_iisO1PJSv_c|))))))
      ()
      (#%lambda #t
        (|%%_ii2cgEGSv_proc|
          |%%_iiIfibGSv_list1|
          .
          |%%_iimjkKFSv_lists|)
        (|%%_ii0nmhFSv_loop| |%%_iiGqoQESv_map1|)
        (#%if (null? |%%_iimjkKFSv_lists|)
          (|%%_iiGqoQESv_map1|
            |%%_ii2cgEGSv_proc|
            |%%_iiIfibGSv_list1|
            ())
          (|%%_ii0nmhFSv_loop|
            |%%_ii2cgEGSv_proc|
            |%%_iiIfibGSv_list1|
            |%%_iimjkKFSv_lists|
            ()))))))
(#%program
  ((|%%_iiuDX9LSv_x| . 1)
   (|%%_ii8HZIKSv_g| . 1)
   (|%%_iiOK_fKSv_f| . 1))
  ()
  ()
  (#%define compose2
    (#%lambda #t
      (|%%_iiOK_fKSv_f| |%%_ii8HZIKSv_g|)
      ()
      (#%lambda #t
        (|%%_iiuDX9LSv_x|)
        (|%%_ii8HZIKSv_g| |%%_iiOK_fKSv_f|)
        (|%%_iiOK_fKSv_f|
          (|%%_ii8HZIKSv_g| |%%_iiuDX9LSv_x|))))))
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
  ((|%%_iiiQuvRSv_list| . 1)
   (|%%_iiYTw2RSv_obj| . 1)
   (member . 1)
   (|%%_iiCXyBQSv_list| . 1)
   (|%%_iig_A8QSv_obj| . 1)
   (memv . 1)
   (|%%_iiW2DHPSv_list| . 1)
   (|%%_iiA6FePSv_obj| . 1)
   (memq . 1)
   (|%%_iieaHNOSv_alist| . 1)
   (|%%_iiUdJkOSv_obj| . 1)
   (equal? . 2)
   (assoc . 1)
   (|%%_iiyhLTNSv_alist| . 1)
   (|%%_iiclNqNSv_obj| . 1)
   (eqv? . 2)
   (assv . 1)
   (|%%_iiSoPZMSv_alist| . 1)
   (|%%_iiwsRwMSv_obj| . 1)
   (eq? . 2)
   (assq . 1)
   (|%%_iiawT3MSv_memn| . 4)
   (|%%_ii0ykMTSv_obj| . 2)
   (|%%_iiGBmjTSv_n| . 2)
   (|%%_iimuidUSv_list| . 4)
   (cdr . 2)
   (|%%_iiQzVCLSv_assn| . 4)
   (car . 2)
   (|%%_ii-IqpSSv_obj| . 2)
   (caar . 1)
   (|%%_iiEMsYRSv_n| . 2)
   (|%%_iikFoSSSv_alist| . 4)
   (null? . 2))
  ((member . 1)
   (memv . 1)
   (memq . 1)
   (assoc . 1)
   (assv . 1)
   (assq . 1)
   (|%%_iiawT3MSv_memn| . 1)
   (|%%_iiQzVCLSv_assn| . 1))
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
    ((|%%_iiQzVCLSv_assn|
       (#%lambda #t
         (|%%_iiEMsYRSv_n|
           |%%_ii-IqpSSv_obj|
           |%%_iikFoSSSv_alist|)
         (|%%_iiQzVCLSv_assn|)
         (#%if (null? |%%_iikFoSSSv_alist|)
           #f
           (#%if (|%%_iiEMsYRSv_n|
                   (caar |%%_iikFoSSSv_alist|)
                   |%%_ii-IqpSSv_obj|)
             (car |%%_iikFoSSSv_alist|)
             (|%%_iiQzVCLSv_assn|
               |%%_iiEMsYRSv_n|
               |%%_ii-IqpSSv_obj|
               (cdr |%%_iikFoSSSv_alist|))))))
     (|%%_iiawT3MSv_memn|
       (#%lambda #t
         (|%%_iiGBmjTSv_n|
           |%%_ii0ykMTSv_obj|
           |%%_iimuidUSv_list|)
         (|%%_iiawT3MSv_memn|)
         (#%if (null? |%%_iimuidUSv_list|)
           #f
           (#%if (|%%_iiGBmjTSv_n|
                   (car |%%_iimuidUSv_list|)
                   |%%_ii0ykMTSv_obj|)
             |%%_iimuidUSv_list|
             (|%%_iiawT3MSv_memn|
               |%%_iiGBmjTSv_n|
               |%%_ii0ykMTSv_obj|
               (cdr |%%_iimuidUSv_list|)))))))
    ()
    (#%begin
      (#%set! assq
        (#%lambda #t
          (|%%_iiwsRwMSv_obj| |%%_iiSoPZMSv_alist|)
          (|%%_iiQzVCLSv_assn|)
          (|%%_iiQzVCLSv_assn|
            eq?
            |%%_iiwsRwMSv_obj|
            |%%_iiSoPZMSv_alist|)))
      (#%set! assv
        (#%lambda #t
          (|%%_iiclNqNSv_obj| |%%_iiyhLTNSv_alist|)
          (|%%_iiQzVCLSv_assn|)
          (|%%_iiQzVCLSv_assn|
            eqv?
            |%%_iiclNqNSv_obj|
            |%%_iiyhLTNSv_alist|)))
      (#%set! assoc
        (#%lambda #t
          (|%%_iiUdJkOSv_obj| |%%_iieaHNOSv_alist|)
          (|%%_iiQzVCLSv_assn|)
          (|%%_iiQzVCLSv_assn|
            equal?
            |%%_iiUdJkOSv_obj|
            |%%_iieaHNOSv_alist|)))
      (#%set! memq
        (#%lambda #t
          (|%%_iiA6FePSv_obj| |%%_iiW2DHPSv_list|)
          (|%%_iiawT3MSv_memn|)
          (|%%_iiawT3MSv_memn|
            eq?
            |%%_iiA6FePSv_obj|
            |%%_iiW2DHPSv_list|)))
      (#%set! memv
        (#%lambda #t
          (|%%_iig_A8QSv_obj| |%%_iiCXyBQSv_list|)
          (|%%_iiawT3MSv_memn|)
          (|%%_iiawT3MSv_memn|
            eqv?
            |%%_iig_A8QSv_obj|
            |%%_iiCXyBQSv_list|)))
      (#%set! member
        (#%lambda #t
          (|%%_iiYTw2RSv_obj| |%%_iiiQuvRSv_list|)
          (|%%_iiawT3MSv_memn|)
          (|%%_iiawT3MSv_memn|
            equal?
            |%%_iiYTw2RSv_obj|
            |%%_iiiQuvRSv_list|))))))
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
   (|%%_ii2ne7VSv_ls2| . 2)
   (|%%_iiIqgGUSv_ls1| . 3)
   (null? . 1))
  ()
  (cons car cdr append2 null?)
  (#%define append2
    (#%lambda #t
      (|%%_iiIqgGUSv_ls1| |%%_ii2ne7VSv_ls2|)
      ()
      (#%if (null? |%%_iiIqgGUSv_ls1|)
        |%%_ii2ne7VSv_ls2|
        (cons (car |%%_iiIqgGUSv_ls1|)
              (append2
                (cdr |%%_iiIqgGUSv_ls1|)
                |%%_ii2ne7VSv_ls2|))))))
(#%program
  ((append2 . 1))
  ()
  (append2)
  (#%define append append2))
(#%program
  ((length . 1)
   (make-string . 1)
   (|%%_iiKfa1WSv_l| . 2)
   (+ . 1)
   (cdr . 1)
   (|%%_iiojcAVSv_l2s| . 2)
   (car . 1)
   (|%%_iiM44oXSv_n| . 2)
   (string-set! . 1)
   (|%%_iiq86XWSv_s| . 3)
   (|%%_ii4c8uWSv_l| . 3)
   (null? . 1))
  ((|%%_iiojcAVSv_l2s| . 1))
  (make-string length car string-set! + cdr null?)
  (#%define list->string
    (#%letrec #t
      ((|%%_iiojcAVSv_l2s|
         (#%lambda #t
           (|%%_ii4c8uWSv_l|
             |%%_iiq86XWSv_s|
             |%%_iiM44oXSv_n|)
           (|%%_iiojcAVSv_l2s|)
           (#%if (null? |%%_ii4c8uWSv_l|)
             |%%_iiq86XWSv_s|
             (#%begin
               (string-set!
                 |%%_iiq86XWSv_s|
                 |%%_iiM44oXSv_n|
                 (car |%%_ii4c8uWSv_l|))
               (|%%_iiojcAVSv_l2s|
                 (cdr |%%_ii4c8uWSv_l|)
                 |%%_iiq86XWSv_s|
                 (+ |%%_iiM44oXSv_n| 1)))))))
      ()
      (#%lambda #t
        (|%%_iiKfa1WSv_l|)
        (|%%_iiojcAVSv_l2s|)
        (|%%_iiojcAVSv_l2s|
          |%%_iiKfa1WSv_l|
          (make-string (length |%%_iiKfa1WSv_l|))
          0)))))
(#%program
  ((string-length . 1)
   (|%%_iisZ_hYSv_s| . 2)
   (- . 2)
   (string-ref . 1)
   (cons . 1)
   (|%%_iiOVZKYSv_s| . 2)
   (|%%_ii612RXSv_s2l| . 2)
   (|%%_ii8SXbZSv_h| . 2)
   (|%%_iiuOVEZSv_n| . 3)
   (< . 1))
  ((|%%_ii612RXSv_s2l| . 1))
  (string-length string-ref cons - <)
  (#%define string->list
    (#%letrec #t
      ((|%%_ii612RXSv_s2l|
         (#%lambda #t
           (|%%_iiOVZKYSv_s|
             |%%_ii8SXbZSv_h|
             |%%_iiuOVEZSv_n|)
           (|%%_ii612RXSv_s2l|)
           (#%if (< |%%_iiuOVEZSv_n| 0)
             |%%_ii8SXbZSv_h|
             (|%%_ii612RXSv_s2l|
               |%%_iiOVZKYSv_s|
               (cons (string-ref |%%_iiOVZKYSv_s| |%%_iiuOVEZSv_n|)
                     |%%_ii8SXbZSv_h|)
               (- |%%_iiuOVEZSv_n| 1))))))
      ()
      (#%lambda #t
        (|%%_iisZ_hYSv_s|)
        (|%%_ii612RXSv_s2l|)
        (|%%_ii612RXSv_s2l|
          |%%_iisZ_hYSv_s|
          ()
          (- (string-length |%%_iisZ_hYSv_s|) 1))))))
(#%program
  ((|%%_iiQKT5-Sv_elems| . 1) (list->vector . 1))
  ()
  (list->vector)
  (#%define vector
    (#%lambda #t
      |%%_iiQKT5-Sv_elems|
      ()
      (list->vector |%%_iiQKT5-Sv_elems|))))
(#%program
  ((|%%_iiaHRy-Sv_elems| . 1) (list->string . 1))
  ()
  (list->string)
  (#%define string
    (#%lambda #t
      |%%_iiaHRy-Sv_elems|
      ()
      (list->string |%%_iiaHRy-Sv_elems|))))
(#%program
  ((_make-parameter . 1))
  ()
  (_make-parameter)
  (#%define current-url (_make-parameter "file:.")))
(#%program
  ((car . 1)
   (string-length . 1)
   (string-append . 1)
   (|%%_iicwLV_Sv_l| . 1)
   (- . 1)
   (|%%_iiSzNs_Sv_v| . 4)
   (string-ref . 1)
   (eqv? . 1)
   (current-url . 3)
   (normalize-url . 2)
   (|%%_iiwDP_-Sv_rest| . 2)
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
      |%%_iiwDP_-Sv_rest|
      ()
      (#%if (null? |%%_iiwDP_-Sv_rest|)
        (normalize-url (current-url) ".")
        (current-url
          (normalize-url
            (current-url)
            ((#%lambda #t
               (|%%_iiSzNs_Sv_v|)
               ()
               ((#%lambda #t
                  (|%%_iicwLV_Sv_l|)
                  (|%%_iiSzNs_Sv_v|)
                  (#%if (eqv? (string-ref
                                |%%_iiSzNs_Sv_v|
                                (- |%%_iicwLV_Sv_l| 1))
                              #\/)
                    |%%_iiSzNs_Sv_v|
                    (string-append |%%_iiSzNs_Sv_v| "/")))
                (string-length |%%_iiSzNs_Sv_v|)))
             (car |%%_iiwDP_-Sv_rest|))))))))
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
   (|%%_iiWdBa2Tv_extension| . 1)
   (string-downcase . 1)
   (string->symbol . 1)
   (|%%_iiAhDJ1Tv__load| . 1)
   (cdr . 1)
   (|%%_iigazD2Tv_t| . 2)
   (file-handler . 1)
   (|%%_iielFg1Tv_thunk| . 1)
   (cons . 2)
   (|%%_iiysJm0Tv_*file-handlers*| . 4)
   (|%%_iiUoHP0Tv_extension| . 2)
   (assq . 2)
   (add-file-handler . 1))
  ((file-handler . 1)
   (|%%_iiysJm0Tv_*file-handlers*| . 1)
   (add-file-handler . 1))
  (cdr string->symbol
       string-downcase
       load
       file-handler
       cons
       assq
       add-file-handler)
  ((#%lambda #t
     (|%%_iiysJm0Tv_*file-handlers*|)
     ()
     (#%begin
       (#%set! add-file-handler
         (#%lambda #t
           (|%%_iiUoHP0Tv_extension| |%%_iielFg1Tv_thunk|)
           (|%%_iiysJm0Tv_*file-handlers*|)
           (#%if (assq |%%_iiUoHP0Tv_extension|
                       |%%_iiysJm0Tv_*file-handlers*|)
             #!void
             (#%set! |%%_iiysJm0Tv_*file-handlers*|
               (cons (cons |%%_iiUoHP0Tv_extension|
                           |%%_iielFg1Tv_thunk|)
                     |%%_iiysJm0Tv_*file-handlers*|)))))
       (#%set! file-handler
         ((#%lambda #t
            (|%%_iiAhDJ1Tv__load|)
            (|%%_iiysJm0Tv_*file-handlers*|)
            (#%lambda #t
              (|%%_iiWdBa2Tv_extension|)
              (|%%_iiAhDJ1Tv__load|
                |%%_iiysJm0Tv_*file-handlers*|)
              ((#%lambda #t
                 (|%%_iigazD2Tv_t|)
                 (|%%_iiAhDJ1Tv__load|)
                 (#%if |%%_iigazD2Tv_t|
                   (cdr |%%_iigazD2Tv_t|)
                   |%%_iiAhDJ1Tv__load|))
               (assq (string->symbol
                       (string-downcase |%%_iiWdBa2Tv_extension|))
                     |%%_iiysJm0Tv_*file-handlers*|))))
          load))))
   ()))
(#%program
  ((|%%_iiY2vx3Tv_rest| . 1)
   (|%%_iii_s-3Tv_file| . 1)
   (current-url . 1)
   (normalize-url . 1)
   (|%%_iiC6x43Tv_proc| . 1)
   (apply . 1))
  ()
  (apply current-url normalize-url)
  (#%define make-io-proc
    (#%lambda #t
      (|%%_iiC6x43Tv_proc|)
      ()
      (#%lambda #t
        (|%%_iii_s-3Tv_file| . |%%_iiY2vx3Tv_rest|)
        (|%%_iiC6x43Tv_proc|)
        (apply |%%_iiC6x43Tv_proc|
               (normalize-url (current-url) |%%_iii_s-3Tv_file|)
               |%%_iiY2vx3Tv_rest|)))))
(#%program
  ((|%%_ii2ycC7Tv_url| . 1)
   (string->list . 1)
   (reverse! . 1)
   (cons . 1)
   (cdr . 1)
   (|%%_iioua38Tv_loop| . 2)
   (|%%_ii4n6Z8Tv_acc| . 2)
   (list->string . 1)
   (car . 2)
   (equal? . 1)
   (|%%_iiKq8w8Tv_x| . 4)
   (null? . 1)
   (void . 1)
   (|%%_iiEXqr4Tv_file-extension| . 1)
   (|%%_iiIBe97Tv_fe| . 2)
   (file-handler . 1)
   (|%%_ii0Jif6Tv_e| . 1)
   (|%%_iiGMkO5Tv_m| . 1)
   (|%%_iimFgI6Tv_fk| . 1)
   (call-with-failure-continuation . 1)
   (with-failure-continuation . 1)
   (|%%_ii-ToU4Tv_file| . 1)
   (|%%_iikQml5Tv_previous-url| . 3)
   (normalize-url . 1)
   (current-url . 6)
   (load . 1)
   (open-output-file . 2)
   (open-source-input-file . 2)
   (make-io-proc . 3)
   (open-input-file . 2))
  ((|%%_iioua38Tv_loop| . 1)
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
     (|%%_iiEXqr4Tv_file-extension|)
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
           (|%%_ii-ToU4Tv_file|)
           (|%%_iiEXqr4Tv_file-extension|)
           (#%begin
             ((#%lambda #t
                (|%%_iikQml5Tv_previous-url|)
                (|%%_ii-ToU4Tv_file|
                  |%%_iiEXqr4Tv_file-extension|)
                (#%begin
                  (current-url
                    (normalize-url
                      |%%_iikQml5Tv_previous-url|
                      |%%_ii-ToU4Tv_file|))
                  (with-failure-continuation
                    (#%lambda #t
                      (|%%_iiGMkO5Tv_m| |%%_ii0Jif6Tv_e|)
                      (|%%_iikQml5Tv_previous-url|)
                      (#%begin
                        (current-url |%%_iikQml5Tv_previous-url|)
                        (call-with-failure-continuation
                          (#%lambda #t
                            (|%%_iimFgI6Tv_fk|)
                            (|%%_ii0Jif6Tv_e| |%%_iiGMkO5Tv_m|)
                            (|%%_iimFgI6Tv_fk|
                              |%%_iiGMkO5Tv_m|
                              |%%_ii0Jif6Tv_e|)))))
                    (#%lambda #t
                      ()
                      (|%%_iiEXqr4Tv_file-extension|)
                      ((#%lambda #t
                         (|%%_iiIBe97Tv_fe|)
                         ()
                         ((file-handler
                            (#%if |%%_iiIBe97Tv_fe| |%%_iiIBe97Tv_fe| "scm"))
                          (current-url)))
                       (|%%_iiEXqr4Tv_file-extension| (current-url)))))
                  (current-url |%%_iikQml5Tv_previous-url|)))
              (current-url))
             (void))))))
   (#%lambda #t
     (|%%_ii2ycC7Tv_url|)
     ()
     ((#%letrec #t
        ((|%%_iioua38Tv_loop|
           (#%lambda #t
             (|%%_iiKq8w8Tv_x| |%%_ii4n6Z8Tv_acc|)
             (|%%_iioua38Tv_loop|)
             (#%if (null? |%%_iiKq8w8Tv_x|)
               #f
               (#%if (equal? (car |%%_iiKq8w8Tv_x|) #\.)
                 (list->string |%%_ii4n6Z8Tv_acc|)
                 (|%%_iioua38Tv_loop|
                   (cdr |%%_iiKq8w8Tv_x|)
                   (cons (car |%%_iiKq8w8Tv_x|) |%%_ii4n6Z8Tv_acc|)))))))
        ()
        |%%_iioua38Tv_loop|)
      (reverse! (string->list |%%_ii2ycC7Tv_url|))
      ()))))
(#%program
  ((|%%_iiqj4q9Tv_str| . 1)
   (load-native-library . 1)
   (native-library-binding-names . 1)
   (|%%_ii6c0kaTv_binding-names| . 1)
   (|%%_iiMf2T9Tv_nl| . 2)
   (native-library-binding . 1)
   (|%%_iis8-MaTv_name| . 2)
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
      (|%%_iiqj4q9Tv_str|)
      ()
      ((#%lambda #t
         (|%%_iiMf2T9Tv_nl|)
         ()
         ((#%lambda #t
            (|%%_ii6c0kaTv_binding-names|)
            (|%%_iiMf2T9Tv_nl|)
            (for-each
              (#%lambda #t
                (|%%_iis8-MaTv_name|)
                (|%%_iiMf2T9Tv_nl|)
                (putprop
                  |%%_iis8-MaTv_name|
                  (native-library-binding
                    |%%_iiMf2T9Tv_nl|
                    |%%_iis8-MaTv_name|)))
              |%%_ii6c0kaTv_binding-names|))
          (native-library-binding-names |%%_iiMf2T9Tv_nl|)))
       (load-native-library |%%_iiqj4q9Tv_str|)))))
(#%program
  ((|%%_ii81WGbTv_lses| . 5)
   (cdr . 3)
   (car . 3)
   (append2 . 1)
   (|%%_iiO4YdbTv_real-append| . 3)
   (apply . 3)
   (|%%_iiQVRAcTv_ls1| . 3)
   (|%%_iiuZT7cTv_lses| . 4)
   (null? . 4))
  ((|%%_iiO4YdbTv_real-append| . 1))
  (apply cdr append2 car null?)
  (#%define append
    (#%letrec #t
      ((|%%_iiO4YdbTv_real-append|
         (#%lambda #t
           (|%%_iiQVRAcTv_ls1| . |%%_iiuZT7cTv_lses|)
           (|%%_iiO4YdbTv_real-append|)
           (#%if (null? |%%_iiuZT7cTv_lses|)
             |%%_iiQVRAcTv_ls1|
             (#%if (null? |%%_iiQVRAcTv_ls1|)
               (apply |%%_iiO4YdbTv_real-append|
                      |%%_iiuZT7cTv_lses|)
               (apply |%%_iiO4YdbTv_real-append|
                      (append2
                        |%%_iiQVRAcTv_ls1|
                        (car |%%_iiuZT7cTv_lses|))
                      (cdr |%%_iiuZT7cTv_lses|)))))))
      ()
      (#%lambda #t
        |%%_ii81WGbTv_lses|
        (|%%_iiO4YdbTv_real-append|)
        (#%if (null? |%%_ii81WGbTv_lses|)
          ()
          (#%if (null? (cdr |%%_ii81WGbTv_lses|))
            (car |%%_ii81WGbTv_lses|)
            (apply |%%_iiO4YdbTv_real-append|
                   (car |%%_ii81WGbTv_lses|)
                   (cdr |%%_ii81WGbTv_lses|))))))))
(#%program
  ((|%%_iiaSP1dTv_x| . 2)
   (null? . 2)
   (|%%_iicHJoeTv_lag| . 1)
   (cdr . 3)
   (|%%_iiwONudTv_lp| . 2)
   (|%%_iiewDLfTv_lag| . 2)
   (|%%_iiUzFifTv_x| . 2)
   (eq? . 1)
   (|%%_iiyDHReTv_x| . 3)
   (|%%_iiSKLXdTv_x| . 3)
   (pair? . 2))
  ((|%%_iiwONudTv_lp| . 1))
  (pair? cdr eq? null?)
  (#%define proper-list?
    (#%lambda #t
      (|%%_iiaSP1dTv_x|)
      ()
      ((#%letrec #t
         ((|%%_iiwONudTv_lp|
            (#%lambda #t
              (|%%_iiSKLXdTv_x| |%%_iicHJoeTv_lag|)
              (|%%_iiwONudTv_lp|)
              (#%if (pair? |%%_iiSKLXdTv_x|)
                ((#%lambda #t
                   (|%%_iiyDHReTv_x|)
                   (|%%_iicHJoeTv_lag| |%%_iiwONudTv_lp|)
                   (#%if (pair? |%%_iiyDHReTv_x|)
                     ((#%lambda #t
                        (|%%_iiUzFifTv_x| |%%_iiewDLfTv_lag|)
                        (|%%_iiwONudTv_lp|)
                        (#%if (eq? |%%_iiUzFifTv_x| |%%_iiewDLfTv_lag|)
                          #f
                          (|%%_iiwONudTv_lp|
                            |%%_iiUzFifTv_x|
                            |%%_iiewDLfTv_lag|)))
                      (cdr |%%_iiyDHReTv_x|)
                      (cdr |%%_iicHJoeTv_lag|))
                     (null? |%%_iiyDHReTv_x|)))
                 (cdr |%%_iiSKLXdTv_x|))
                (null? |%%_iiSKLXdTv_x|)))))
         ()
         |%%_iiwONudTv_lp|)
       |%%_iiaSP1dTv_x|
       |%%_iiaSP1dTv_x|))))
(#%program
  ((proper-list? . 1))
  ()
  (proper-list?)
  (#%define list? proper-list?))
(#%program
  ((|%%_iiAsBcgTv_general-expt| . 1)
   (denominator . 1)
   (numerator . 1)
   (|%%_iiWozFgTv_rational-expt| . 1)
   (integer? . 2)
   (rational? . 1)
   (|%%_iiChvzhTv_base| . 9)
   (|%%_iiYdt0iTv_exponent| . 8)
   (|%%_iiKB6_mTv_squaring| . 3)
   (odd? . 1)
   (quotient . 1)
   (|%%_iiIMcElTv_loop| . 2)
   (|%%_iioF8ymTv_result| . 3)
   (|%%_ii2Ja5mTv_rest| . 3)
   (zero? . 3)
   (ashl . 1)
   (= . 1)
   (exact? . 5)
   (abs . 1)
   (|%%_ii0UgKkTv_base| . 4)
   (|%%_iiglx6hTv_integer-expt| . 2)
   (|%%_iimQeblTv_exponent| . 4)
   (negative? . 1)
   (|%%_iik_kQjTv_base-denominator| . 1)
   (|%%_iiGXihkTv_exponent| . 2)
   (|%%_ii-2nnjTv_base-numerator| . 1)
   (expt . 2)
   (/ . 2)
   (|%%_iiiartiTv_base| . 1)
   (log . 1)
   (|%%_iiE6pWiTv_exponent| . 1)
   (* . 3)
   (exp . 1))
  ((|%%_iiIMcElTv_loop| . 1)
   (|%%_iiglx6hTv_integer-expt| . 1)
   (|%%_iiWozFgTv_rational-expt| . 1)
   (|%%_iiAsBcgTv_general-expt| . 1))
  (numerator
    denominator
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
      ((|%%_iiAsBcgTv_general-expt|
         (#%lambda #t
           (|%%_iiiartiTv_base| |%%_iiE6pWiTv_exponent|)
           ()
           (exp (* |%%_iiE6pWiTv_exponent|
                   (log |%%_iiiartiTv_base|)))))
       (|%%_iiWozFgTv_rational-expt|
         (#%lambda #t
           (|%%_ii-2nnjTv_base-numerator|
             |%%_iik_kQjTv_base-denominator|
             |%%_iiGXihkTv_exponent|)
           ()
           (/ (expt |%%_ii-2nnjTv_base-numerator|
                    |%%_iiGXihkTv_exponent|)
              (expt |%%_iik_kQjTv_base-denominator|
                    |%%_iiGXihkTv_exponent|))))
       (|%%_iiglx6hTv_integer-expt|
         (#%lambda #t
           (|%%_ii0UgKkTv_base| |%%_iimQeblTv_exponent|)
           (|%%_iiglx6hTv_integer-expt|)
           (#%if (negative? |%%_iimQeblTv_exponent|)
             (/ (|%%_iiglx6hTv_integer-expt|
                  |%%_ii0UgKkTv_base|
                  (abs |%%_iimQeblTv_exponent|)))
             (#%if (#%if (exact? |%%_ii0UgKkTv_base|)
                     (= |%%_ii0UgKkTv_base| 2)
                     #f)
               (ashl 1 |%%_iimQeblTv_exponent|)
               ((#%letrec #t
                  ((|%%_iiIMcElTv_loop|
                     (#%lambda #t
                       (|%%_ii2Ja5mTv_rest|
                         |%%_iioF8ymTv_result|
                         |%%_iiKB6_mTv_squaring|)
                       (|%%_iiIMcElTv_loop|)
                       (#%if (zero? |%%_ii2Ja5mTv_rest|)
                         |%%_iioF8ymTv_result|
                         (|%%_iiIMcElTv_loop|
                           (quotient |%%_ii2Ja5mTv_rest| 2)
                           (#%if (odd? |%%_ii2Ja5mTv_rest|)
                             (* |%%_iioF8ymTv_result| |%%_iiKB6_mTv_squaring|)
                             |%%_iioF8ymTv_result|)
                           (* |%%_iiKB6_mTv_squaring|
                              |%%_iiKB6_mTv_squaring|))))))
                  ()
                  |%%_iiIMcElTv_loop|)
                |%%_iimQeblTv_exponent|
                1
                |%%_ii0UgKkTv_base|))))))
      ()
      (#%lambda #t
        (|%%_iiChvzhTv_base| |%%_iiYdt0iTv_exponent|)
        (|%%_iiglx6hTv_integer-expt|
          |%%_iiWozFgTv_rational-expt|
          |%%_iiAsBcgTv_general-expt|)
        (#%if (zero? |%%_iiYdt0iTv_exponent|)
          (#%if (exact? |%%_iiYdt0iTv_exponent|) 1 1.0)
          (#%if (zero? |%%_iiChvzhTv_base|)
            (#%if (exact? |%%_iiYdt0iTv_exponent|)
              |%%_iiChvzhTv_base|
              0.0)
            (#%if (#%if (exact? |%%_iiChvzhTv_base|)
                    (#%if (rational? |%%_iiChvzhTv_base|)
                      (#%if (integer? |%%_iiChvzhTv_base|) #f #t)
                      #f)
                    #f)
              (|%%_iiWozFgTv_rational-expt|
                (numerator |%%_iiChvzhTv_base|)
                (denominator |%%_iiChvzhTv_base|)
                |%%_iiYdt0iTv_exponent|)
              (#%if (#%if (exact? |%%_iiYdt0iTv_exponent|)
                      (integer? |%%_iiYdt0iTv_exponent|)
                      #f)
                (|%%_iiglx6hTv_integer-expt|
                  |%%_iiChvzhTv_base|
                  |%%_iiYdt0iTv_exponent|)
                (|%%_iiAsBcgTv_general-expt|
                  |%%_iiChvzhTv_base|
                  |%%_iiYdt0iTv_exponent|)))))))))
(#%program
  ((- . 1)
   (|%%_ii6n-OoTv_tmp| . 2)
   (/ . 2)
   (modpow . 2)
   (|%%_iisjYfpTv_tmp| . 2)
   (* . 3)
   (even? . 1)
   (|%%_iiMq0moTv_n| . 6)
   (|%%_ii4y4snTv_x| . 4)
   (modulo . 4)
   (|%%_iiqu2VnTv_y| . 4)
   (= . 1))
  ()
  (even? modpow / * - modulo =)
  (#%define modpow
    (#%lambda #t
      (|%%_ii4y4snTv_x|
        |%%_iiqu2VnTv_y|
        |%%_iiMq0moTv_n|)
      ()
      (#%if (= |%%_iiqu2VnTv_y| 1)
        (modulo |%%_ii4y4snTv_x| |%%_iiMq0moTv_n|)
        (#%if (even? |%%_iiqu2VnTv_y|)
          ((#%lambda #t
             (|%%_iisjYfpTv_tmp|)
             (|%%_iiMq0moTv_n|)
             (modulo
               (* |%%_iisjYfpTv_tmp| |%%_iisjYfpTv_tmp|)
               |%%_iiMq0moTv_n|))
           (modpow
             |%%_ii4y4snTv_x|
             (/ |%%_iiqu2VnTv_y| 2)
             |%%_iiMq0moTv_n|))
          ((#%lambda #t
             (|%%_ii6n-OoTv_tmp|)
             (|%%_iiMq0moTv_n| |%%_ii4y4snTv_x|)
             (modulo
               (* |%%_ii4y4snTv_x|
                  (modulo
                    (* |%%_ii6n-OoTv_tmp| |%%_ii6n-OoTv_tmp|)
                    |%%_iiMq0moTv_n|))
               |%%_iiMq0moTv_n|))
           (modpow
             |%%_ii4y4snTv_x|
             (/ (- |%%_iiqu2VnTv_y| 1) 2)
             |%%_iiMq0moTv_n|)))))))
(#%program
  ((round . 1)
   (= . 1)
   (real? . 1)
   (|%%_iiOfWIpTv_n| . 4)
   (_integer? . 1))
  ()
  (real? round = _integer?)
  (#%define integer?
    (#%lambda #t
      (|%%_iiOfWIpTv_n|)
      ()
      (#%if (_integer? |%%_iiOfWIpTv_n|)
        #t
        (#%if (real? |%%_iiOfWIpTv_n|)
          (= (round |%%_iiOfWIpTv_n|) |%%_iiOfWIpTv_n|)
          #f)))))
(#%program
  ((complex? . 1)
   (|%%_ii8cU9qTv_oldcomp?| . 1)
   (|%%_iiu8SCqTv_n| . 2)
   (number? . 1))
  ()
  (complex? number?)
  (#%define real?
    ((#%lambda #t
       (|%%_ii8cU9qTv_oldcomp?|)
       ()
       (#%lambda #t
         (|%%_iiu8SCqTv_n|)
         (|%%_ii8cU9qTv_oldcomp?|)
         (#%if (number? |%%_iiu8SCqTv_n|)
           (#%if (|%%_ii8cU9qTv_oldcomp?| |%%_iiu8SCqTv_n|)
             #f
             #t)
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
  ((imag-part . 1)
   (real-part . 1)
   (|%%_iiwZLZrTv_b| . 2)
   (|%%_iia1OwrTv_a| . 2)
   (* . 2)
   (+ . 1)
   (sqrt . 1)
   (- . 1)
   (< . 1)
   (|%%_iiQ4Q3rTv_num| . 6)
   (real? . 1))
  ()
  (+ * sqrt real-part imag-part < - real?)
  (#%define abs
    (#%lambda #t
      (|%%_iiQ4Q3rTv_num|)
      ()
      (#%if (real? |%%_iiQ4Q3rTv_num|)
        (#%if (< |%%_iiQ4Q3rTv_num| 0)
          (- |%%_iiQ4Q3rTv_num|)
          |%%_iiQ4Q3rTv_num|)
        ((#%lambda #t
           (|%%_iia1OwrTv_a| |%%_iiwZLZrTv_b|)
           ()
           (sqrt (+ (* |%%_iia1OwrTv_a| |%%_iia1OwrTv_a|)
                    (* |%%_iiwZLZrTv_b| |%%_iiwZLZrTv_b|))))
         (real-part |%%_iiQ4Q3rTv_num|)
         (imag-part |%%_iiQ4Q3rTv_num|))))))
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
   (|%%_iieHBeuTv_x1| . 3)
   (|%%_iiUKDNtTv_args| . 2)
   (max . 1)
   (< . 1)
   (|%%_iiyOFktTv_x1| . 3)
   (|%%_iicSHTsTv_args| . 2)
   (min . 1)
   (inexact? . 3)
   (cdr . 2)
   (|%%_iiSVJqsTv__min_max| . 4)
   (car . 3)
   (|%%_iiADzHuTv_proc| . 3)
   (exact->inexact . 1)
   (|%%_iiWzx8vTv_mv| . 5)
   (exact? . 1)
   (|%%_iiCst2wTv_inexact| . 3)
   (|%%_iigwvBvTv_args| . 6)
   (null? . 3))
  ((max . 1)
   (min . 1)
   (|%%_iiSVJqsTv__min_max| . 1))
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
    ((|%%_iiSVJqsTv__min_max|
       (#%lambda #t
         (|%%_iiADzHuTv_proc|
           |%%_iiWzx8vTv_mv|
           |%%_iigwvBvTv_args|
           |%%_iiCst2wTv_inexact|)
         (|%%_iiSVJqsTv__min_max|)
         (#%if (null? |%%_iigwvBvTv_args|)
           (#%if (#%if |%%_iiCst2wTv_inexact|
                   (exact? |%%_iiWzx8vTv_mv|)
                   #f)
             (exact->inexact |%%_iiWzx8vTv_mv|)
             |%%_iiWzx8vTv_mv|)
           (#%if (|%%_iiADzHuTv_proc|
                   (car |%%_iigwvBvTv_args|)
                   |%%_iiWzx8vTv_mv|)
             (|%%_iiSVJqsTv__min_max|
               |%%_iiADzHuTv_proc|
               (car |%%_iigwvBvTv_args|)
               (cdr |%%_iigwvBvTv_args|)
               (#%if |%%_iiCst2wTv_inexact|
                 #t
                 (inexact? (car |%%_iigwvBvTv_args|))))
             (|%%_iiSVJqsTv__min_max|
               |%%_iiADzHuTv_proc|
               |%%_iiWzx8vTv_mv|
               (cdr |%%_iigwvBvTv_args|)
               |%%_iiCst2wTv_inexact|))))))
    ()
    (#%begin
      (#%set! min
        (#%lambda #t
          (|%%_iiyOFktTv_x1| . |%%_iicSHTsTv_args|)
          (|%%_iiSVJqsTv__min_max|)
          (#%if (null? |%%_iicSHTsTv_args|)
            |%%_iiyOFktTv_x1|
            (|%%_iiSVJqsTv__min_max|
              <
              |%%_iiyOFktTv_x1|
              |%%_iicSHTsTv_args|
              (inexact? |%%_iiyOFktTv_x1|)))))
      (#%set! max
        (#%lambda #t
          (|%%_iieHBeuTv_x1| . |%%_iiUKDNtTv_args|)
          (|%%_iiSVJqsTv__min_max|)
          (#%if (null? |%%_iiUKDNtTv_args|)
            |%%_iieHBeuTv_x1|
            (|%%_iiSVJqsTv__min_max|
              >
              |%%_iieHBeuTv_x1|
              |%%_iiUKDNtTv_args|
              (inexact? |%%_iieHBeuTv_x1|))))))))
(#%program
  ((|%%_iiYorvwTv_n| . 1) (< . 1))
  ()
  (<)
  (#%define negative?
    (#%lambda #t
      (|%%_iiYorvwTv_n|)
      ()
      (< |%%_iiYorvwTv_n| 0))))
(#%program
  ((|%%_iiilpYwTv_n| . 1) (> . 1))
  ()
  (>)
  (#%define positive?
    (#%lambda #t
      (|%%_iiilpYwTv_n|)
      ()
      (> |%%_iiilpYwTv_n| 0))))
(#%program
  ((|%%_iiEhnpxTv_n| . 1) (modulo . 1) (= . 1))
  ()
  (modulo =)
  (#%define even?
    (#%lambda #t
      (|%%_iiEhnpxTv_n|)
      ()
      (= 0 (modulo |%%_iiEhnpxTv_n| 2)))))
(#%program
  ((|%%_ii-dlSxTv_n| . 1) (even? . 1))
  ()
  (even?)
  (#%define odd?
    (#%lambda #t
      (|%%_ii-dlSxTv_n|)
      ()
      (#%if (even? |%%_ii-dlSxTv_n|) #f #t))))
(#%program
  ((|%%_iikajjyTv_n| . 1) (= . 1))
  ()
  (=)
  (#%define zero?
    (#%lambda #t
      (|%%_iikajjyTv_n|)
      ()
      (= |%%_iikajjyTv_n| 0))))
(#%program
  ((|%%_iiG6hMyTv_n| . 1) (+ . 1))
  ()
  (+)
  (#%define add1
    (#%lambda #t
      (|%%_iiG6hMyTv_n|)
      ()
      (+ |%%_iiG6hMyTv_n| 1))))
(#%program
  ((|%%_ii03fdzTv_n| . 1) (- . 1))
  ()
  (-)
  (#%define sub1
    (#%lambda #t
      (|%%_ii03fdzTv_n|)
      ()
      (- |%%_ii03fdzTv_n| 1))))
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
  ((|%%_iiQfOyFTv_y| . 1)
   (|%%_iiujQ5FTv_x| . 1)
   (|%%_iisuWKDTv_args| . 1)
   (|%%_iiOqUbETv_loop| . 2)
   (cadr . 1)
   (car . 1)
   (|%%_iiqF0oCTv_comparator| . 1)
   (|%%_iiMB-QCTv_chainer| . 1)
   (cdr . 2)
   (|%%_ii6yYhDTv_endstate| . 2)
   (|%%_ii8nSEETv_x| . 5)
   (null? . 2)
   (|%%_ii4J2XBTv_b| . 2)
   (|%%_iiKM4uBTv_a| . 2)
   (> . 1)
   (>= . 1)
   (|%%_iiIXa7ATv__and2| . 2)
   (= . 2)
   (|%%_iioQ61BTv_b| . 2)
   (|%%_ii2U8AATv_a| . 2)
   (< . 1)
   (|%%_iim_cGzTv__comp_help| . 2)
   (<= . 1))
  ((|%%_iiOqUbETv_loop| . 1) (>= . 1) (<= . 1))
  (null? cadr car cdr <= = < >= >)
  ((#%lambda #t
     (|%%_iim_cGzTv__comp_help| |%%_iiIXa7ATv__and2|)
     ()
     (#%begin
       (#%set! <=
         (|%%_iim_cGzTv__comp_help|
           (#%lambda #t
             (|%%_ii2U8AATv_a| |%%_iioQ61BTv_b|)
             ()
             (#%if (< |%%_ii2U8AATv_a| |%%_iioQ61BTv_b|)
               #t
               (= |%%_ii2U8AATv_a| |%%_iioQ61BTv_b|)))
           |%%_iiIXa7ATv__and2|
           #t))
       (#%set! >=
         (|%%_iim_cGzTv__comp_help|
           (#%lambda #t
             (|%%_iiKM4uBTv_a| |%%_ii4J2XBTv_b|)
             ()
             (#%if (> |%%_iiKM4uBTv_a| |%%_ii4J2XBTv_b|)
               #t
               (= |%%_iiKM4uBTv_a| |%%_ii4J2XBTv_b|)))
           |%%_iiIXa7ATv__and2|
           #t))))
   (#%lambda #t
     (|%%_iiqF0oCTv_comparator|
       |%%_iiMB-QCTv_chainer|
       |%%_ii6yYhDTv_endstate|)
     ()
     (#%lambda #t
       |%%_iisuWKDTv_args|
       (|%%_ii6yYhDTv_endstate|
         |%%_iiMB-QCTv_chainer|
         |%%_iiqF0oCTv_comparator|)
       ((#%letrec #t
          ((|%%_iiOqUbETv_loop|
             (#%lambda #t
               (|%%_ii8nSEETv_x|)
               (|%%_iiOqUbETv_loop|
                 |%%_ii6yYhDTv_endstate|
                 |%%_iiMB-QCTv_chainer|
                 |%%_iiqF0oCTv_comparator|)
               (#%if (null? |%%_ii8nSEETv_x|)
                 |%%_ii6yYhDTv_endstate|
                 (#%if (null? (cdr |%%_ii8nSEETv_x|))
                   |%%_ii6yYhDTv_endstate|
                   (|%%_iiMB-QCTv_chainer|
                     (|%%_iiqF0oCTv_comparator|
                       (car |%%_ii8nSEETv_x|)
                       (cadr |%%_ii8nSEETv_x|))
                     (|%%_iiOqUbETv_loop| (cdr |%%_ii8nSEETv_x|))))))))
          (|%%_ii6yYhDTv_endstate|
            |%%_iiMB-QCTv_chainer|
            |%%_iiqF0oCTv_comparator|)
          |%%_iiOqUbETv_loop|)
        |%%_iisuWKDTv_args|)))
   (#%lambda #t
     (|%%_iiujQ5FTv_x| |%%_iiQfOyFTv_y|)
     ()
     (#%if |%%_iiujQ5FTv_x| |%%_iiQfOyFTv_y| #f))))
(#%program
  ((|%%_iiS4IVGTv_chainer| . 1)
   (apply . 1)
   (|%%_iiw8KsGTv_comparator| . 1)
   (cadr . 2)
   (car . 2)
   (= . 1)
   (cdr . 2)
   (|%%_iic1GmHTv_args| . 7)
   (null? . 2)
   (< . 1)
   (<= . 2)
   (> . 1)
   (|%%_iiacM_FTv__?=| . 2)
   (>= . 2))
  ((<= . 1) (>= . 1))
  (< <= <= > >= >= null? = car cadr apply cdr)
  ((#%lambda #t
     (|%%_iiacM_FTv__?=|)
     ()
     (#%begin
       (#%set! >= (|%%_iiacM_FTv__?=| > >=))
       (#%set! <= (|%%_iiacM_FTv__?=| < <=))))
   (#%lambda #t
     (|%%_iiw8KsGTv_comparator|
       |%%_iiS4IVGTv_chainer|)
     ()
     (#%lambda #t
       |%%_iic1GmHTv_args|
       (|%%_iiS4IVGTv_chainer|
         |%%_iiw8KsGTv_comparator|)
       (#%if (null? |%%_iic1GmHTv_args|)
         #t
         (#%if (null? (cdr |%%_iic1GmHTv_args|))
           #t
           (#%if (#%if (= (car |%%_iic1GmHTv_args|)
                          (cadr |%%_iic1GmHTv_args|))
                   #t
                   (|%%_iiw8KsGTv_comparator|
                     (car |%%_iic1GmHTv_args|)
                     (cadr |%%_iic1GmHTv_args|)))
             (apply |%%_iiS4IVGTv_chainer|
                    (cdr |%%_iic1GmHTv_args|))
             #f)))))))
(#%program
  ((cadr . 1)
   (_gcd . 1)
   (car . 2)
   (cdr . 1)
   (|%%_iiUVBgITv_args| . 5)
   (null? . 2))
  ()
  (cdr car cadr _gcd null?)
  (#%define gcd
    (#%lambda #t
      |%%_iiUVBgITv_args|
      ()
      (#%if (null? |%%_iiUVBgITv_args|)
        0
        (#%if (null? (cdr |%%_iiUVBgITv_args|))
          (car |%%_iiUVBgITv_args|)
          (_gcd (car |%%_iiUVBgITv_args|)
                (cadr |%%_iiUVBgITv_args|)))))))
(#%program
  ((cadr . 1)
   (_lcm . 1)
   (car . 2)
   (cdr . 1)
   (|%%_iieSzJITv_args| . 5)
   (null? . 2))
  ()
  (cdr car cadr _lcm null?)
  (#%define lcm
    (#%lambda #t
      |%%_iieSzJITv_args|
      ()
      (#%if (null? |%%_iieSzJITv_args|)
        1
        (#%if (null? (cdr |%%_iieSzJITv_args|))
          (car |%%_iieSzJITv_args|)
          (_lcm (car |%%_iieSzJITv_args|)
                (cadr |%%_iieSzJITv_args|)))))))
(#%program
  ((|%%_iiAOxaJTv_x| . 1)
   (remainder . 1)
   (+ . 1)
   (|%%_iigHt4KTv_r| . 3)
   (positive? . 1)
   (|%%_iiWKvDJTv_y| . 3)
   (negative? . 2))
  ()
  (remainder positive? negative? +)
  (#%define modulo
    (#%lambda #t
      (|%%_iiAOxaJTv_x| |%%_iiWKvDJTv_y|)
      ()
      ((#%lambda #t
         (|%%_iigHt4KTv_r|)
         (|%%_iiWKvDJTv_y|)
         (#%if ((#%if (negative? |%%_iiWKvDJTv_y|)
                  positive?
                  negative?)
                |%%_iigHt4KTv_r|)
           (+ |%%_iigHt4KTv_r| |%%_iiWKvDJTv_y|)
           |%%_iigHt4KTv_r|))
       (remainder |%%_iiAOxaJTv_x| |%%_iiWKvDJTv_y|)))))
(#%program
  ((|%%_iiYzp-KTv_args| . 3)
   (cdr . 2)
   (car . 2)
   (_string-append . 1)
   (|%%_iiCDrxKTv_string-append-helper| . 2)
   (|%%_iiiwnrLTv_acc| . 2)
   (|%%_iiEslULTv_args| . 3)
   (null? . 2))
  ((|%%_iiCDrxKTv_string-append-helper| . 1))
  (car _string-append cdr null?)
  (#%define string-append
    (#%letrec #t
      ((|%%_iiCDrxKTv_string-append-helper|
         (#%lambda #t
           (|%%_iiiwnrLTv_acc| |%%_iiEslULTv_args|)
           (|%%_iiCDrxKTv_string-append-helper|)
           (#%if (null? |%%_iiEslULTv_args|)
             |%%_iiiwnrLTv_acc|
             (|%%_iiCDrxKTv_string-append-helper|
               (_string-append
                 |%%_iiiwnrLTv_acc|
                 (car |%%_iiEslULTv_args|))
               (cdr |%%_iiEslULTv_args|))))))
      ()
      (#%lambda #t
        |%%_iiYzp-KTv_args|
        (|%%_iiCDrxKTv_string-append-helper|)
        (#%if (null? |%%_iiYzp-KTv_args|)
          ""
          (|%%_iiCDrxKTv_string-append-helper|
            (car |%%_iiYzp-KTv_args|)
            (cdr |%%_iiYzp-KTv_args|)))))))
(#%program
  ((- . 1)
   (char->integer . 4)
   (|%%_ii0edINTv_c| . 2)
   (|%%_iiGhffNTv_lc-offset| . 1)
   (+ . 1)
   (integer->char . 1)
   (|%%_iiklhOMTv_z| . 1)
   (<= . 1)
   (|%%_ii-ojlMTv_a| . 2)
   (|%%_iimab9OTv_cv| . 3)
   (>= . 1))
  ()
  (integer->char + >= <= char->integer -)
  (#%define char-downcase
    ((#%lambda #t
       (|%%_ii-ojlMTv_a|)
       ()
       ((#%lambda #t
          (|%%_iiklhOMTv_z|)
          (|%%_ii-ojlMTv_a|)
          ((#%lambda #t
             (|%%_iiGhffNTv_lc-offset|)
             (|%%_iiklhOMTv_z| |%%_ii-ojlMTv_a|)
             (#%lambda #t
               (|%%_ii0edINTv_c|)
               (|%%_iiGhffNTv_lc-offset|
                 |%%_iiklhOMTv_z|
                 |%%_ii-ojlMTv_a|)
               ((#%lambda #t
                  (|%%_iimab9OTv_cv|)
                  (|%%_ii0edINTv_c|
                    |%%_iiGhffNTv_lc-offset|
                    |%%_iiklhOMTv_z|
                    |%%_ii-ojlMTv_a|)
                  (#%if (#%if (>= |%%_iimab9OTv_cv| |%%_ii-ojlMTv_a|)
                          (<= |%%_iimab9OTv_cv| |%%_iiklhOMTv_z|)
                          #f)
                    (integer->char
                      (+ |%%_iimab9OTv_cv| |%%_iiGhffNTv_lc-offset|))
                    |%%_ii0edINTv_c|))
                (char->integer |%%_ii0edINTv_c|))))
           (- (char->integer #\a) |%%_ii-ojlMTv_a|)))
        (char->integer #\Z)))
     (char->integer #\A))))
(#%program
  ((char->integer . 4)
   (|%%_iiKX2ZPTv_c| . 2)
   (|%%_iio_4wPTv_uc-offset| . 1)
   (- . 2)
   (integer->char . 1)
   (|%%_ii2373PTv_z| . 1)
   (<= . 1)
   (|%%_iiI69COTv_a| . 2)
   (|%%_ii4U0qQTv_cv| . 3)
   (>= . 1))
  ()
  (integer->char - >= <= char->integer)
  (#%define char-upcase
    ((#%lambda #t
       (|%%_iiI69COTv_a|)
       ()
       ((#%lambda #t
          (|%%_ii2373PTv_z|)
          (|%%_iiI69COTv_a|)
          ((#%lambda #t
             (|%%_iio_4wPTv_uc-offset|)
             (|%%_ii2373PTv_z| |%%_iiI69COTv_a|)
             (#%lambda #t
               (|%%_iiKX2ZPTv_c|)
               (|%%_iio_4wPTv_uc-offset|
                 |%%_ii2373PTv_z|
                 |%%_iiI69COTv_a|)
               ((#%lambda #t
                  (|%%_ii4U0qQTv_cv|)
                  (|%%_iiKX2ZPTv_c|
                    |%%_iio_4wPTv_uc-offset|
                    |%%_ii2373PTv_z|
                    |%%_iiI69COTv_a|)
                  (#%if (#%if (>= |%%_ii4U0qQTv_cv| |%%_iiI69COTv_a|)
                          (<= |%%_ii4U0qQTv_cv| |%%_ii2373PTv_z|)
                          #f)
                    (integer->char
                      (- |%%_ii4U0qQTv_cv| |%%_iio_4wPTv_uc-offset|))
                    |%%_iiKX2ZPTv_c|))
                (char->integer |%%_iiKX2ZPTv_c|))))
           (- |%%_iiI69COTv_a| (char->integer #\A))))
        (char->integer #\z)))
     (char->integer #\a))))
(#%program
  ((|%%_iiqQ-SQTv_args| . 1)
   (map . 1)
   (|%%_iiMMYjRTv_c2| . 1)
   (|%%_ii6JWMRTv_c1| . 1)
   (char->integer . 3)
   (> . 1)
   (apply . 1))
  ()
  (map char->integer > apply)
  (#%define char>?
    (#%lambda #t
      (|%%_ii6JWMRTv_c1|
        |%%_iiMMYjRTv_c2|
        .
        |%%_iiqQ-SQTv_args|)
      ()
      (apply >
             (char->integer |%%_ii6JWMRTv_c1|)
             (char->integer |%%_iiMMYjRTv_c2|)
             (map char->integer |%%_iiqQ-SQTv_args|)))))
(#%program
  ((|%%_iisFUdSTv_args| . 1)
   (map . 1)
   (|%%_iiOBSGSTv_c2| . 1)
   (|%%_ii8yQ7TTv_c1| . 1)
   (char->integer . 3)
   (< . 1)
   (apply . 1))
  ()
  (map char->integer < apply)
  (#%define char<?
    (#%lambda #t
      (|%%_ii8yQ7TTv_c1|
        |%%_iiOBSGSTv_c2|
        .
        |%%_iisFUdSTv_args|)
      ()
      (apply <
             (char->integer |%%_ii8yQ7TTv_c1|)
             (char->integer |%%_iiOBSGSTv_c2|)
             (map char->integer |%%_iisFUdSTv_args|)))))
(#%program
  ((eqv? . 1))
  ()
  (eqv?)
  (#%define char=? eqv?))
(#%program
  ((char=? . 1)
   (|%%_iiQqM1UTv_c2| . 2)
   (|%%_iiuuOATTv_c1| . 2)
   (char>? . 1))
  ()
  (char=? char>?)
  (#%define char>=?
    (#%lambda #t
      (|%%_iiuuOATTv_c1| |%%_iiQqM1UTv_c2|)
      ()
      (#%if (char>? |%%_iiuuOATTv_c1| |%%_iiQqM1UTv_c2|)
        #t
        (char=? |%%_iiuuOATTv_c1| |%%_iiQqM1UTv_c2|)))))
(#%program
  ((char=? . 1)
   (|%%_iiwjIXUTv_c2| . 2)
   (|%%_iianKuUTv_c1| . 2)
   (char<? . 1))
  ()
  (char=? char<?)
  (#%define char<=?
    (#%lambda #t
      (|%%_iianKuUTv_c1| |%%_iiwjIXUTv_c2|)
      ()
      (#%if (char<? |%%_iianKuUTv_c1| |%%_iiwjIXUTv_c2|)
        #t
        (char=? |%%_iianKuUTv_c1| |%%_iiwjIXUTv_c2|)))))
(#%program
  ((|%%_iiSfGoVTv_args| . 1)
   (map . 1)
   (|%%_iiccERVTv_c2| . 1)
   (|%%_iiy8CiWTv_c1| . 1)
   (char-downcase . 3)
   (char>? . 1)
   (apply . 1))
  ()
  (map char-downcase char>? apply)
  (#%define char-ci>?
    (#%lambda #t
      (|%%_iiy8CiWTv_c1|
        |%%_iiccERVTv_c2|
        .
        |%%_iiSfGoVTv_args|)
      ()
      (apply char>?
             (char-downcase |%%_iiy8CiWTv_c1|)
             (char-downcase |%%_iiccERVTv_c2|)
             (map char-downcase |%%_iiSfGoVTv_args|)))))
(#%program
  ((|%%_iiU4ALWTv_args| . 1)
   (map . 1)
   (|%%_iie1ycXTv_c2| . 1)
   (|%%_iiAZvFXTv_c1| . 1)
   (char-downcase . 3)
   (char<? . 1)
   (apply . 1))
  ()
  (map char-downcase char<? apply)
  (#%define char-ci<?
    (#%lambda #t
      (|%%_iiAZvFXTv_c1|
        |%%_iie1ycXTv_c2|
        .
        |%%_iiU4ALWTv_args|)
      ()
      (apply char<?
             (char-downcase |%%_iiAZvFXTv_c1|)
             (char-downcase |%%_iie1ycXTv_c2|)
             (map char-downcase |%%_iiU4ALWTv_args|)))))
(#%program
  ((|%%_iiWVt6YTv_args| . 1)
   (map . 1)
   (|%%_iigSrzYTv_c2| . 1)
   (|%%_iiCOp0ZTv_c1| . 1)
   (char-downcase . 3)
   (char=? . 1)
   (apply . 1))
  ()
  (map char-downcase char=? apply)
  (#%define char-ci=?
    (#%lambda #t
      (|%%_iiCOp0ZTv_c1|
        |%%_iigSrzYTv_c2|
        .
        |%%_iiWVt6YTv_args|)
      ()
      (apply char=?
             (char-downcase |%%_iiCOp0ZTv_c1|)
             (char-downcase |%%_iigSrzYTv_c2|)
             (map char-downcase |%%_iiWVt6YTv_args|)))))
(#%program
  ((char-ci=? . 1)
   (|%%_iiiHlWZTv_c2| . 2)
   (|%%_iiYKntZTv_c1| . 2)
   (char-ci>? . 1))
  ()
  (char-ci=? char-ci>?)
  (#%define char-ci>=?
    (#%lambda #t
      (|%%_iiYKntZTv_c1| |%%_iiiHlWZTv_c2|)
      ()
      (#%if (char-ci>? |%%_iiYKntZTv_c1| |%%_iiiHlWZTv_c2|)
        #t
        (char-ci=? |%%_iiYKntZTv_c1| |%%_iiiHlWZTv_c2|)))))
(#%program
  ((char-ci=? . 1)
   (|%%_ii-zhQ-Tv_c2| . 2)
   (|%%_iiEDjn-Tv_c1| . 2)
   (char-ci<? . 1))
  ()
  (char-ci=? char-ci<?)
  (#%define char-ci<=?
    (#%lambda #t
      (|%%_iiEDjn-Tv_c1| |%%_ii-zhQ-Tv_c2|)
      ()
      (#%if (char-ci<? |%%_iiEDjn-Tv_c1| |%%_ii-zhQ-Tv_c2|)
        #t
        (char-ci=? |%%_iiEDjn-Tv_c1| |%%_ii-zhQ-Tv_c2|)))))
(#%program
  ((|%%_iikwfh_Tv_c| . 2) (char<? . 2))
  ()
  (char<?)
  (#%define char-alphabetic?
    (#%lambda #t
      (|%%_iikwfh_Tv_c|)
      ()
      (#%if (char<? #\@ |%%_iikwfh_Tv_c| #\[)
        #t
        (char<? #\` |%%_iikwfh_Tv_c| #\{)))))
(#%program
  ((|%%_iiGsdK_Tv_c| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-numeric?
    (#%lambda #t
      (|%%_iiGsdK_Tv_c|)
      ()
      (char<? #\/ |%%_iiGsdK_Tv_c| #\:))))
(#%program
  ((|%%_ii0pbb0Uv_c| . 4) (char=? . 4))
  ()
  (char=?)
  (#%define char-whitespace?
    (#%lambda #t
      (|%%_ii0pbb0Uv_c|)
      ()
      (#%if (char=? |%%_ii0pbb0Uv_c| #\space)
        #t
        (#%if (char=? |%%_ii0pbb0Uv_c| #\tab)
          #t
          (#%if (char=? |%%_ii0pbb0Uv_c| #\newline)
            #t
            (char=? |%%_ii0pbb0Uv_c| #\return)))))))
(#%program
  ((|%%_iiml9E0Uv_c| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-upper-case?
    (#%lambda #t
      (|%%_iiml9E0Uv_c|)
      ()
      (char<? #\@ |%%_iiml9E0Uv_c| #\[))))
(#%program
  ((|%%_iiIh751Uv_c| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-lower-case?
    (#%lambda #t
      (|%%_iiIh751Uv_c|)
      ()
      (char<? #\` |%%_iiIh751Uv_c| #\{))))
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
   (|%%_iiq_Yl3Uv_newstr| . 1)
   (|%%_ii43_U2Uv_str| . 3)
   (string-upcase . 1)
   (make-string . 2)
   (string-length . 4)
   (char-downcase . 1)
   (|%%_iiK61s2Uv_newstr| . 1)
   (|%%_iioa3_1Uv_str| . 3)
   (string-downcase . 1)
   (+ . 1)
   (|%%_ii2e5y1Uv_string-map| . 3)
   (|%%_iiMXWO3Uv_strsrc| . 2)
   (string-ref . 1)
   (|%%_iisQSI4Uv_proc| . 2)
   (|%%_ii6UUf4Uv_strdst| . 3)
   (string-set! . 1)
   (|%%_ii8JOC5Uv_l| . 2)
   (|%%_iiOMQ95Uv_n| . 4)
   (< . 1))
  ((string-upcase . 1)
   (string-downcase . 1)
   (|%%_ii2e5y1Uv_string-map| . 1))
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
    ((|%%_ii2e5y1Uv_string-map|
       (#%lambda #t
         (|%%_iiMXWO3Uv_strsrc|
           |%%_ii6UUf4Uv_strdst|
           |%%_iisQSI4Uv_proc|
           |%%_iiOMQ95Uv_n|
           |%%_ii8JOC5Uv_l|)
         (|%%_ii2e5y1Uv_string-map|)
         (#%if (< |%%_iiOMQ95Uv_n| |%%_ii8JOC5Uv_l|)
           (#%begin
             (string-set!
               |%%_ii6UUf4Uv_strdst|
               |%%_iiOMQ95Uv_n|
               (|%%_iisQSI4Uv_proc|
                 (string-ref
                   |%%_iiMXWO3Uv_strsrc|
                   |%%_iiOMQ95Uv_n|)))
             (|%%_ii2e5y1Uv_string-map|
               |%%_iiMXWO3Uv_strsrc|
               |%%_ii6UUf4Uv_strdst|
               |%%_iisQSI4Uv_proc|
               (+ |%%_iiOMQ95Uv_n| 1)
               |%%_ii8JOC5Uv_l|))
           |%%_ii6UUf4Uv_strdst|))))
    ()
    (#%begin
      (#%set! string-downcase
        (#%lambda #t
          (|%%_iioa3_1Uv_str|)
          (|%%_ii2e5y1Uv_string-map|)
          ((#%lambda #t
             (|%%_iiK61s2Uv_newstr|)
             (|%%_iioa3_1Uv_str| |%%_ii2e5y1Uv_string-map|)
             (|%%_ii2e5y1Uv_string-map|
               |%%_iioa3_1Uv_str|
               |%%_iiK61s2Uv_newstr|
               char-downcase
               0
               (string-length |%%_iioa3_1Uv_str|)))
           (make-string (string-length |%%_iioa3_1Uv_str|)))))
      (#%set! string-upcase
        (#%lambda #t
          (|%%_ii43_U2Uv_str|)
          (|%%_ii2e5y1Uv_string-map|)
          ((#%lambda #t
             (|%%_iiq_Yl3Uv_newstr|)
             (|%%_ii43_U2Uv_str| |%%_ii2e5y1Uv_string-map|)
             (|%%_ii2e5y1Uv_string-map|
               |%%_ii43_U2Uv_str|
               |%%_iiq_Yl3Uv_newstr|
               char-upcase
               0
               (string-length |%%_ii43_U2Uv_str|)))
           (make-string (string-length |%%_ii43_U2Uv_str|))))))))
(#%program
  ((equal? . 1))
  ()
  (equal?)
  (#%define string=? equal?))
(#%program
  ((|%%_iiayIZ6Uv_s2| . 1)
   (|%%_iiQBKw6Uv_s1| . 1)
   (string->list . 2)
   (car . 2)
   (cdr . 2)
   (|%%_iiuFM36Uv_s<?| . 2)
   (char>? . 1)
   (|%%_iiyjAN8Uv_c2| . 2)
   (|%%_iicnCk8Uv_c1| . 2)
   (char<? . 1)
   (|%%_iiSqET7Uv_s2| . 4)
   (|%%_iiwuGq7Uv_s1| . 3)
   (null? . 3))
  ((|%%_iiuFM36Uv_s<?| . 1))
  (string->list car char<? cdr char>? null?)
  (#%define string<?
    (#%letrec #t
      ((|%%_iiuFM36Uv_s<?|
         (#%lambda #t
           (|%%_iiwuGq7Uv_s1| |%%_iiSqET7Uv_s2|)
           (|%%_iiuFM36Uv_s<?|)
           (#%if (null? |%%_iiwuGq7Uv_s1|)
             (#%if (null? |%%_iiSqET7Uv_s2|) #f #t)
             (#%if (null? |%%_iiSqET7Uv_s2|)
               #f
               ((#%lambda #t
                  (|%%_iicnCk8Uv_c1| |%%_iiyjAN8Uv_c2|)
                  (|%%_iiSqET7Uv_s2|
                    |%%_iiwuGq7Uv_s1|
                    |%%_iiuFM36Uv_s<?|)
                  (#%if (char<? |%%_iicnCk8Uv_c1| |%%_iiyjAN8Uv_c2|)
                    #t
                    (#%if (char>? |%%_iicnCk8Uv_c1| |%%_iiyjAN8Uv_c2|)
                      #f
                      (|%%_iiuFM36Uv_s<?|
                        (cdr |%%_iiwuGq7Uv_s1|)
                        (cdr |%%_iiSqET7Uv_s2|)))))
                (car |%%_iiwuGq7Uv_s1|)
                (car |%%_iiSqET7Uv_s2|)))))))
      ()
      (#%lambda #t
        (|%%_iiQBKw6Uv_s1| |%%_iiayIZ6Uv_s2|)
        (|%%_iiuFM36Uv_s<?|)
        (|%%_iiuFM36Uv_s<?|
          (string->list |%%_iiQBKw6Uv_s1|)
          (string->list |%%_iiayIZ6Uv_s2|))))))
(#%program
  ((|%%_iiA8u8aUv_s2| . 1)
   (|%%_iiecwH9Uv_s1| . 1)
   (string->list . 2)
   (car . 2)
   (cdr . 2)
   (|%%_iiUfye9Uv_s>?| . 2)
   (char<? . 1)
   (|%%_iiYVlYbUv_c2| . 2)
   (|%%_iiCZnvbUv_c1| . 2)
   (char>? . 1)
   (|%%_iiW4sBaUv_s1| . 4)
   (|%%_iig1q2bUv_s2| . 3)
   (null? . 3))
  ((|%%_iiUfye9Uv_s>?| . 1))
  (string->list car char>? cdr char<? null?)
  (#%define string>?
    (#%letrec #t
      ((|%%_iiUfye9Uv_s>?|
         (#%lambda #t
           (|%%_iiW4sBaUv_s1| |%%_iig1q2bUv_s2|)
           (|%%_iiUfye9Uv_s>?|)
           (#%if (null? |%%_iig1q2bUv_s2|)
             (#%if (null? |%%_iiW4sBaUv_s1|) #f #t)
             (#%if (null? |%%_iiW4sBaUv_s1|)
               #f
               ((#%lambda #t
                  (|%%_iiCZnvbUv_c1| |%%_iiYVlYbUv_c2|)
                  (|%%_iig1q2bUv_s2|
                    |%%_iiW4sBaUv_s1|
                    |%%_iiUfye9Uv_s>?|)
                  (#%if (char>? |%%_iiCZnvbUv_c1| |%%_iiYVlYbUv_c2|)
                    #t
                    (#%if (char<? |%%_iiCZnvbUv_c1| |%%_iiYVlYbUv_c2|)
                      #f
                      (|%%_iiUfye9Uv_s>?|
                        (cdr |%%_iiW4sBaUv_s1|)
                        (cdr |%%_iig1q2bUv_s2|)))))
                (car |%%_iiW4sBaUv_s1|)
                (car |%%_iig1q2bUv_s2|)))))))
      ()
      (#%lambda #t
        (|%%_iiecwH9Uv_s1| |%%_iiA8u8aUv_s2|)
        (|%%_iiUfye9Uv_s>?|)
        (|%%_iiUfye9Uv_s>?|
          (string->list |%%_iiecwH9Uv_s1|)
          (string->list |%%_iiA8u8aUv_s2|))))))
(#%program
  ((string=? . 1)
   (|%%_iiEOhScUv_s2| . 2)
   (|%%_iiiSjpcUv_s1| . 2)
   (string<? . 1))
  ()
  (string=? string<?)
  (#%define string<=?
    (#%lambda #t
      (|%%_iiiSjpcUv_s1| |%%_iiEOhScUv_s2|)
      ()
      (#%if (string<? |%%_iiiSjpcUv_s1| |%%_iiEOhScUv_s2|)
        #t
        (string=? |%%_iiiSjpcUv_s1| |%%_iiEOhScUv_s2|)))))
(#%program
  ((string=? . 1)
   (|%%_iikHdMdUv_s2| . 2)
   (|%%_ii-KfjdUv_s1| . 2)
   (string>? . 1))
  ()
  (string=? string>?)
  (#%define string>=?
    (#%lambda #t
      (|%%_ii-KfjdUv_s1| |%%_iikHdMdUv_s2|)
      ()
      (#%if (string>? |%%_ii-KfjdUv_s1| |%%_iikHdMdUv_s2|)
        #t
        (string=? |%%_ii-KfjdUv_s1| |%%_iikHdMdUv_s2|)))))
(#%program
  ((|%%_ii0A9GeUv_s2| . 1)
   (|%%_iiGDbdeUv_s1| . 1)
   (string-downcase . 2)
   (string=? . 1))
  ()
  (string-downcase string=?)
  (#%define string-ci=?
    (#%lambda #t
      (|%%_iiGDbdeUv_s1| |%%_ii0A9GeUv_s2|)
      ()
      (string=?
        (string-downcase |%%_iiGDbdeUv_s1|)
        (string-downcase |%%_ii0A9GeUv_s2|)))))
(#%program
  ((|%%_iiIs5AfUv_s2| . 1)
   (|%%_iimw77fUv_s1| . 1)
   (string-downcase . 2)
   (string<? . 1))
  ()
  (string-downcase string<?)
  (#%define string-ci<?
    (#%lambda #t
      (|%%_iimw77fUv_s1| |%%_iiIs5AfUv_s2|)
      ()
      (string<?
        (string-downcase |%%_iimw77fUv_s1|)
        (string-downcase |%%_iiIs5AfUv_s2|)))))
(#%program
  ((|%%_iiol1ugUv_s2| . 1)
   (|%%_ii2p31gUv_s1| . 1)
   (string-downcase . 2)
   (string>? . 1))
  ()
  (string-downcase string>?)
  (#%define string-ci>?
    (#%lambda #t
      (|%%_ii2p31gUv_s1| |%%_iiol1ugUv_s2|)
      ()
      (string>?
        (string-downcase |%%_ii2p31gUv_s1|)
        (string-downcase |%%_iiol1ugUv_s2|)))))
(#%program
  ((|%%_ii4eZnhUv_s2| . 1)
   (|%%_iiKh_WgUv_s1| . 1)
   (string-downcase . 2)
   (string>=? . 1))
  ()
  (string-downcase string>=?)
  (#%define string-ci>=?
    (#%lambda #t
      (|%%_iiKh_WgUv_s1| |%%_ii4eZnhUv_s2|)
      ()
      (string>=?
        (string-downcase |%%_iiKh_WgUv_s1|)
        (string-downcase |%%_ii4eZnhUv_s2|)))))
(#%program
  ((|%%_iiM6VhiUv_s2| . 1)
   (|%%_iiqaXQhUv_s1| . 1)
   (string-downcase . 2)
   (string<=? . 1))
  ()
  (string-downcase string<=?)
  (#%define string-ci<=?
    (#%lambda #t
      (|%%_iiqaXQhUv_s1| |%%_iiM6VhiUv_s2|)
      ()
      (string<=?
        (string-downcase |%%_iiqaXQhUv_s1|)
        (string-downcase |%%_iiM6VhiUv_s2|)))))
(#%program
  ((- . 1)
   (make-string . 1)
   (|%%_ii8UM5kUv_end| . 2)
   (|%%_iiOXOEjUv_start| . 2)
   (|%%_iiuQKykUv_newstr| . 2)
   (|%%_iis_QbjUv_str| . 1)
   (+ . 2)
   (|%%_ii63TKiUv_fill-string| . 2)
   (|%%_iiQMI_kUv_sstr| . 2)
   (string-ref . 1)
   (|%%_iiwFEVlUv_n| . 2)
   (|%%_iiaJGslUv_dstr| . 2)
   (string-set! . 1)
   (|%%_iicyAPmUv_e| . 2)
   (|%%_iiSBCmmUv_s| . 3)
   (< . 1))
  ((|%%_ii63TKiUv_fill-string| . 1))
  (make-string - string-ref string-set! + <)
  (#%define substring
    (#%letrec #t
      ((|%%_ii63TKiUv_fill-string|
         (#%lambda #t
           (|%%_iiQMI_kUv_sstr|
             |%%_iiaJGslUv_dstr|
             |%%_iiwFEVlUv_n|
             |%%_iiSBCmmUv_s|
             |%%_iicyAPmUv_e|)
           (|%%_ii63TKiUv_fill-string|)
           (#%if (< |%%_iiSBCmmUv_s| |%%_iicyAPmUv_e|)
             (#%begin
               (string-set!
                 |%%_iiaJGslUv_dstr|
                 |%%_iiwFEVlUv_n|
                 (string-ref |%%_iiQMI_kUv_sstr| |%%_iiSBCmmUv_s|))
               (|%%_ii63TKiUv_fill-string|
                 |%%_iiQMI_kUv_sstr|
                 |%%_iiaJGslUv_dstr|
                 (+ |%%_iiwFEVlUv_n| 1)
                 (+ |%%_iiSBCmmUv_s| 1)
                 |%%_iicyAPmUv_e|))
             #!void))))
      ()
      (#%lambda #t
        (|%%_iis_QbjUv_str|
          |%%_iiOXOEjUv_start|
          |%%_ii8UM5kUv_end|)
        (|%%_ii63TKiUv_fill-string|)
        ((#%lambda #t
           (|%%_iiuQKykUv_newstr|)
           (|%%_ii8UM5kUv_end|
             |%%_iiOXOEjUv_start|
             |%%_iis_QbjUv_str|
             |%%_ii63TKiUv_fill-string|)
           (#%begin
             (|%%_ii63TKiUv_fill-string|
               |%%_iis_QbjUv_str|
               |%%_iiuQKykUv_newstr|
               0
               |%%_iiOXOEjUv_start|
               |%%_ii8UM5kUv_end|)
             |%%_iiuQKykUv_newstr|))
         (make-string
           (- |%%_ii8UM5kUv_end| |%%_iiOXOEjUv_start|)))))))
(#%program
  ((- . 1)
   (cdr . 1)
   (list-ref . 1)
   (|%%_iiyuygnUv_list| . 2)
   (car . 1)
   (|%%_iiUqwJnUv_n| . 2)
   (zero? . 1))
  ()
  (list-ref cdr - car zero?)
  (#%define list-ref
    (#%lambda #t
      (|%%_iiyuygnUv_list| |%%_iiUqwJnUv_n|)
      ()
      (#%if (zero? |%%_iiUqwJnUv_n|)
        (car |%%_iiyuygnUv_list|)
        (list-ref
          (cdr |%%_iiyuygnUv_list|)
          (- |%%_iiUqwJnUv_n| 1))))))
(#%program
  ((|%%_iienuaoUv_args| . 1)
   (|%%_iiAjsDoUv_k| . 1)
   (apply . 1)
   (call-with-current-continuation . 1))
  ()
  (apply call-with-current-continuation)
  (#%define values
    (#%lambda #t
      |%%_iienuaoUv_args|
      ()
      (call-with-current-continuation
        (#%lambda #t
          (|%%_iiAjsDoUv_k|)
          (|%%_iienuaoUv_args|)
          (apply |%%_iiAjsDoUv_k| |%%_iienuaoUv_args|))))))
