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
(#%program () () () #!void)
(#%program
  ((map-cdr . 1)
   (for-each . 1)
   (map-car . 1)
   (|proc_r28WAXU1_| . 2)
   (apply . 2)
   (cons . 1)
   (|lists_r2s1F1U1_| . 4)
   (|ls1_r2OZCuU1_| . 2)
   (null? . 1))
  ((|lists_r2s1F1U1_| . 1))
  (cons map-car apply map-cdr for-each null?)
  (#%define for-each
    (#%lambda #t
      (|proc_r28WAXU1_|
        |ls1_r2OZCuU1_|
        .
        |lists_r2s1F1U1_|)
      ()
      (#%if (null? |ls1_r2OZCuU1_|)
        #!void
        (#%begin
          (#%set! |lists_r2s1F1U1_|
            (cons |ls1_r2OZCuU1_| |lists_r2s1F1U1_|))
          (apply |proc_r28WAXU1_|
                 (map-car |lists_r2s1F1U1_|))
          (apply for-each
                 |proc_r28WAXU1_|
                 (map-cdr |lists_r2s1F1U1_|)))))))
(#%program
  ((|x_r2uSyoV1_| . 1) (eq? . 1))
  ()
  (eq?)
  (#%define eof-object?
    (#%lambda #t
      (|x_r2uSyoV1_|)
      ()
      (eq? |x_r2uSyoV1_| #!eof))))
(#%program
  ((|x_r2QOwRV1_| . 1))
  ()
  ()
  (#%define not
    (#%lambda #t
      (|x_r2QOwRV1_|)
      ()
      (#%if |x_r2QOwRV1_| #f #t))))
(#%program
  ((|port_r2aLuiW1_| . 1)
   (|display| . 1)
   (apply . 1))
  ()
  (|display| apply)
  (#%define newline
    (#%lambda #t
      |port_r2aLuiW1_|
      ()
      (apply |display|
             #\newline
             |port_r2aLuiW1_|))))
(#%program
  ((|ls_r2SDqcX1_| . 1)
   (car . 1)
   (cons . 1)
   (cdr . 1)
   (|iter_r2wHsLW1_| . 2)
   (|acc_r2ywm6Y1_| . 2)
   (|ls_r2cAoFX1_| . 3)
   (null? . 1))
  ((|iter_r2wHsLW1_| . 1))
  (cdr car cons null?)
  (#%define reverse
    (#%letrec #t
      ((|iter_r2wHsLW1_|
         (#%lambda #t
           (|ls_r2cAoFX1_| |acc_r2ywm6Y1_|)
           (|iter_r2wHsLW1_|)
           (#%if (null? |ls_r2cAoFX1_|)
             |acc_r2ywm6Y1_|
             (|iter_r2wHsLW1_|
               (cdr |ls_r2cAoFX1_|)
               (cons (car |ls_r2cAoFX1_|) |acc_r2ywm6Y1_|))))))
      ()
      (#%lambda #t
        (|ls_r2SDqcX1_|)
        (|iter_r2wHsLW1_|)
        (|iter_r2wHsLW1_| |ls_r2SDqcX1_| ())))))
(#%program
  ((|s_r2epi0Z1_| . 1)
   (cdr . 1)
   (d_r2gecn-1_ . 1)
   (|iter_r2UskzY1_| . 2)
   (set-cdr! . 1)
   (|r_r2WheWZ1_| . 2)
   (|s_r2AlgtZ1_| . 4)
   (null? . 1))
  ((|iter_r2UskzY1_| . 1))
  (set-cdr! cdr null?)
  (#%define reverse!
    (#%letrec #t
      ((|iter_r2UskzY1_|
         (#%lambda #t
           (|s_r2AlgtZ1_| |r_r2WheWZ1_|)
           (|iter_r2UskzY1_|)
           (#%if (null? |s_r2AlgtZ1_|)
             |r_r2WheWZ1_|
             ((#%lambda #t
                (d_r2gecn-1_)
                (|r_r2WheWZ1_| |s_r2AlgtZ1_| |iter_r2UskzY1_|)
                (#%begin
                  (set-cdr! |s_r2AlgtZ1_| |r_r2WheWZ1_|)
                  (|iter_r2UskzY1_| d_r2gecn-1_ |s_r2AlgtZ1_|)))
              (cdr |s_r2AlgtZ1_|))))))
      ()
      (#%lambda #t
        (|s_r2epi0Z1_|)
        (|iter_r2UskzY1_|)
        (|iter_r2UskzY1_| |s_r2epi0Z1_| ())))))
(#%program
  ((cdr . 1)
   (map-car . 1)
   (caar . 1)
   (cons . 1)
   (|ls_r2CaaQ-1_| . 3)
   (null? . 1))
  ()
  (cons caar cdr map-car null?)
  (#%define map-car
    (#%lambda #t
      (|ls_r2CaaQ-1_|)
      ()
      (#%if (null? |ls_r2CaaQ-1_|)
        ()
        (cons (caar |ls_r2CaaQ-1_|)
              (map-car (cdr |ls_r2CaaQ-1_|)))))))
(#%program
  ((cdr . 1)
   (map-cdr . 1)
   (cdar . 1)
   (cons . 1)
   (|ls_r2Y68h_1_| . 3)
   (null? . 1))
  ()
  (cons cdar cdr map-cdr null?)
  (#%define map-cdr
    (#%lambda #t
      (|ls_r2Y68h_1_|)
      ()
      (#%if (null? |ls_r2Y68h_1_|)
        ()
        (cons (cdar |ls_r2Y68h_1_|)
              (map-cdr (cdr |ls_r2Y68h_1_|)))))))
(#%program
  ((|list1_r2kU_412_| . 2)
   (|proc_r2GQZx12_| . 2)
   (|lists_r2-X1E02_| . 2)
   (map-car . 1)
   (apply . 1)
   (|lists_r2KuNf42_| . 2)
   (map-cdr . 1)
   (|proc_r22CRl32_| . 2)
   (|loop_r2E_3b02_| . 2)
   (|c_r24rLI42_| . 2)
   (|list1_r2oyPO32_| . 3)
   (car . 2)
   (cons . 2)
   (cdr . 2)
   (|proc_r20NX-12_| . 2)
   (|map1_r2i36K_1_| . 2)
   (|acc_r2IFTU22_| . 2)
   (reverse . 2)
   (|list_r2mJVr22_| . 3)
   (null? . 3))
  ((|loop_r2E_3b02_| . 1) (|map1_r2i36K_1_| . 1))
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
      ((|map1_r2i36K_1_|
         (#%lambda #t
           (|proc_r20NX-12_|
             |list_r2mJVr22_|
             |acc_r2IFTU22_|)
           (|map1_r2i36K_1_|)
           (#%if (null? |list_r2mJVr22_|)
             (reverse |acc_r2IFTU22_|)
             (|map1_r2i36K_1_|
               |proc_r20NX-12_|
               (cdr |list_r2mJVr22_|)
               (cons (|proc_r20NX-12_| (car |list_r2mJVr22_|))
                     |acc_r2IFTU22_|)))))
       (|loop_r2E_3b02_|
         (#%lambda #t
           (|proc_r22CRl32_|
             |list1_r2oyPO32_|
             |lists_r2KuNf42_|
             |c_r24rLI42_|)
           (|loop_r2E_3b02_|)
           (#%if (null? |list1_r2oyPO32_|)
             (reverse |c_r24rLI42_|)
             (|loop_r2E_3b02_|
               |proc_r22CRl32_|
               (cdr |list1_r2oyPO32_|)
               (map-cdr |lists_r2KuNf42_|)
               (cons (apply |proc_r22CRl32_|
                            (car |list1_r2oyPO32_|)
                            (map-car |lists_r2KuNf42_|))
                     |c_r24rLI42_|))))))
      ()
      (#%lambda #t
        (|proc_r2GQZx12_|
          |list1_r2kU_412_|
          .
          |lists_r2-X1E02_|)
        (|loop_r2E_3b02_| |map1_r2i36K_1_|)
        (#%if (null? |lists_r2-X1E02_|)
          (|map1_r2i36K_1_|
            |proc_r2GQZx12_|
            |list1_r2kU_412_|
            ())
          (|loop_r2E_3b02_|
            |proc_r2GQZx12_|
            |list1_r2kU_412_|
            |lists_r2-X1E02_|
            ()))))))
(#%program
  ((|x_r26gF362_| . 1)
   (|g_r2MjHC52_| . 1)
   (|f_r2qnJ952_| . 1))
  ()
  ()
  (#%define compose2
    (#%lambda #t
      (|f_r2qnJ952_| |g_r2MjHC52_|)
      ()
      (#%lambda #t
        (|x_r26gF362_|)
        (|g_r2MjHC52_| |f_r2qnJ952_|)
        (|f_r2qnJ952_| (|g_r2MjHC52_| |x_r26gF362_|))))))
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
  ((|list_r2Wscpc2_| . 1)
   (|obj_r2AweYb2_| . 1)
   (member . 1)
   (|list_r2eAgvb2_| . 1)
   (|obj_r2UDi2b2_| . 1)
   (memv . 1)
   (|list_r2yHkBa2_| . 1)
   (|obj_r2cLm8a2_| . 1)
   (memq . 1)
   (|alist_r2SOoH92_| . 1)
   (|obj_r2wSqe92_| . 1)
   (equal? . 2)
   (assoc . 1)
   (|alist_r2aWsN82_| . 1)
   (|obj_r2QZuk82_| . 1)
   (eqv? . 2)
   (assv . 1)
   (|alist_r2u1xT72_| . 1)
   (obj_r285zq72_ . 1)
   (eq? . 2)
   (assq . 1)
   (|memn_r2O8BZ62_| . 4)
   (|obj_r2Ea2Ge2_| . 2)
   (n_r2ie4de2_ . 2)
   (list_r2-607f2_ . 4)
   (cdr . 2)
   (|assn_r2scDw62_| . 4)
   (car . 2)
   (|obj_r2Cl8jd2_| . 2)
   (caar . 1)
   (|n_r2gpaSc2_| . 2)
   (|alist_r2Yh6Md2_| . 4)
   (null? . 2))
  ((member . 1)
   (memv . 1)
   (memq . 1)
   (assoc . 1)
   (assv . 1)
   (assq . 1)
   (|memn_r2O8BZ62_| . 1)
   (|assn_r2scDw62_| . 1))
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
    ((|assn_r2scDw62_|
       (#%lambda #t
         (|n_r2gpaSc2_| |obj_r2Cl8jd2_| |alist_r2Yh6Md2_|)
         (|assn_r2scDw62_|)
         (#%if (null? |alist_r2Yh6Md2_|)
           #f
           (#%if (|n_r2gpaSc2_|
                   (caar |alist_r2Yh6Md2_|)
                   |obj_r2Cl8jd2_|)
             (car |alist_r2Yh6Md2_|)
             (|assn_r2scDw62_|
               |n_r2gpaSc2_|
               |obj_r2Cl8jd2_|
               (cdr |alist_r2Yh6Md2_|))))))
     (|memn_r2O8BZ62_|
       (#%lambda #t
         (n_r2ie4de2_ |obj_r2Ea2Ge2_| list_r2-607f2_)
         (|memn_r2O8BZ62_|)
         (#%if (null? list_r2-607f2_)
           #f
           (#%if (n_r2ie4de2_
                   (car list_r2-607f2_)
                   |obj_r2Ea2Ge2_|)
             list_r2-607f2_
             (|memn_r2O8BZ62_|
               n_r2ie4de2_
               |obj_r2Ea2Ge2_|
               (cdr list_r2-607f2_)))))))
    ()
    (#%begin
      (#%set! assq
        (#%lambda #t
          (obj_r285zq72_ |alist_r2u1xT72_|)
          (|assn_r2scDw62_|)
          (|assn_r2scDw62_|
            eq?
            obj_r285zq72_
            |alist_r2u1xT72_|)))
      (#%set! assv
        (#%lambda #t
          (|obj_r2QZuk82_| |alist_r2aWsN82_|)
          (|assn_r2scDw62_|)
          (|assn_r2scDw62_|
            eqv?
            |obj_r2QZuk82_|
            |alist_r2aWsN82_|)))
      (#%set! assoc
        (#%lambda #t
          (|obj_r2wSqe92_| |alist_r2SOoH92_|)
          (|assn_r2scDw62_|)
          (|assn_r2scDw62_|
            equal?
            |obj_r2wSqe92_|
            |alist_r2SOoH92_|)))
      (#%set! memq
        (#%lambda #t
          (|obj_r2cLm8a2_| |list_r2yHkBa2_|)
          (|memn_r2O8BZ62_|)
          (|memn_r2O8BZ62_|
            eq?
            |obj_r2cLm8a2_|
            |list_r2yHkBa2_|)))
      (#%set! memv
        (#%lambda #t
          (|obj_r2UDi2b2_| |list_r2eAgvb2_|)
          (|memn_r2O8BZ62_|)
          (|memn_r2O8BZ62_|
            eqv?
            |obj_r2UDi2b2_|
            |list_r2eAgvb2_|)))
      (#%set! member
        (#%lambda #t
          (|obj_r2AweYb2_| |list_r2Wscpc2_|)
          (|memn_r2O8BZ62_|)
          (|memn_r2O8BZ62_|
            equal?
            |obj_r2AweYb2_|
            |list_r2Wscpc2_|))))))
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
   (|ls2_r2G_X0g2_| . 2)
   (ls1_r2k3-zf2_ . 3)
   (null? . 1))
  ()
  (cons car cdr append2 null?)
  (#%define append2
    (#%lambda #t
      (ls1_r2k3-zf2_ |ls2_r2G_X0g2_|)
      ()
      (#%if (null? ls1_r2k3-zf2_)
        |ls2_r2G_X0g2_|
        (cons (car ls1_r2k3-zf2_)
              (append2 (cdr ls1_r2k3-zf2_) |ls2_r2G_X0g2_|))))))
(#%program
  ((append2 . 1))
  ()
  (append2)
  (#%define append append2))
(#%program
  ((length . 1)
   (make-string . 1)
   (|l_r2mUTWg2_| . 2)
   (+ . 1)
   (cdr . 1)
   (|l2s_r20YVtg2_| . 2)
   (car . 1)
   (|n_r2oJNhi2_| . 2)
   (string-set! . 1)
   (|s_r22NPQh2_| . 3)
   (|l_r2IQRnh2_| . 3)
   (null? . 1))
  ((|l2s_r20YVtg2_| . 1))
  (make-string length car string-set! + cdr null?)
  (#%define list->string
    (#%letrec #t
      ((|l2s_r20YVtg2_|
         (#%lambda #t
           (|l_r2IQRnh2_| |s_r22NPQh2_| |n_r2oJNhi2_|)
           (|l2s_r20YVtg2_|)
           (#%if (null? |l_r2IQRnh2_|)
             |s_r22NPQh2_|
             (#%begin
               (string-set!
                 |s_r22NPQh2_|
                 |n_r2oJNhi2_|
                 (car |l_r2IQRnh2_|))
               (|l2s_r20YVtg2_|
                 (cdr |l_r2IQRnh2_|)
                 |s_r22NPQh2_|
                 (+ |n_r2oJNhi2_| 1)))))))
      ()
      (#%lambda #t
        (|l_r2mUTWg2_|)
        (|l2s_r20YVtg2_|)
        (|l2s_r20YVtg2_|
          |l_r2mUTWg2_|
          (make-string (length |l_r2mUTWg2_|))
          0)))))
(#%program
  ((string-length . 1)
   (|s_r24CJbj2_| . 2)
   (- . 2)
   (string-ref . 1)
   (cons . 1)
   (|s_r2qyHEj2_| . 2)
   (|s2l_r2KFLKi2_| . 2)
   (|h_r2MuF5k2_| . 2)
   (|n_r26rDyk2_| . 3)
   (< . 1))
  ((|s2l_r2KFLKi2_| . 1))
  (string-length string-ref cons - <)
  (#%define string->list
    (#%letrec #t
      ((|s2l_r2KFLKi2_|
         (#%lambda #t
           (|s_r2qyHEj2_| |h_r2MuF5k2_| |n_r26rDyk2_|)
           (|s2l_r2KFLKi2_|)
           (#%if (< |n_r26rDyk2_| 0)
             |h_r2MuF5k2_|
             (|s2l_r2KFLKi2_|
               |s_r2qyHEj2_|
               (cons (string-ref |s_r2qyHEj2_| |n_r26rDyk2_|)
                     |h_r2MuF5k2_|)
               (- |n_r26rDyk2_| 1))))))
      ()
      (#%lambda #t
        (|s_r24CJbj2_|)
        (|s2l_r2KFLKi2_|)
        (|s2l_r2KFLKi2_|
          |s_r24CJbj2_|
          ()
          (- (string-length |s_r24CJbj2_|) 1))))))
(#%program
  ((|elems_r2snB_k2_| . 1) (list->vector . 1))
  ()
  (list->vector)
  (#%define vector
    (#%lambda #t
      |elems_r2snB_k2_|
      ()
      (list->vector |elems_r2snB_k2_|))))
(#%program
  ((|elems_r2Ojzsl2_| . 1) (list->string . 1))
  ()
  (list->string)
  (#%define string
    (#%lambda #t
      |elems_r2Ojzsl2_|
      ()
      (list->string |elems_r2Ojzsl2_|))))
(#%program
  ((_make-parameter . 1))
  ()
  (_make-parameter)
  (#%define current-url (_make-parameter "file:.")))
(#%program
  ((car . 1)
   (string-length . 1)
   (string-append . 1)
   (|l_r2Q8tPm2_| . 1)
   (- . 1)
   (v_r2ucvmm2_ . 4)
   (string-ref . 1)
   (eqv? . 1)
   (current-url . 3)
   (normalize-url . 2)
   (|rest_r28gxVl2_| . 2)
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
      |rest_r28gxVl2_|
      ()
      (#%if (null? |rest_r28gxVl2_|)
        (normalize-url (current-url) ".")
        (current-url
          (normalize-url
            (current-url)
            ((#%lambda #t
               (v_r2ucvmm2_)
               ()
               ((#%lambda #t
                  (|l_r2Q8tPm2_|)
                  (v_r2ucvmm2_)
                  (#%if (eqv? (string-ref v_r2ucvmm2_ (- |l_r2Q8tPm2_| 1))
                              #\/)
                    v_r2ucvmm2_
                    (string-append v_r2ucvmm2_ "/")))
                (string-length v_r2ucvmm2_)))
             (car |rest_r28gxVl2_|))))))))
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
   (|extension_r2ySi4p2_| . 1)
   (string-downcase . 1)
   (string->symbol . 1)
   (|_load_r2cWkDo2_| . 1)
   (cdr . 1)
   (|t_r2UOgxp2_| . 2)
   (file-handler . 1)
   (|thunk_r2SZmao2_| . 1)
   (cons . 2)
   (*file-handlers*_r2a5rgn2_ . 4)
   (|extension_r2w1pJn2_| . 2)
   (assq . 2)
   (not . 1)
   (add-file-handler . 1))
  ((file-handler . 1)
   (*file-handlers*_r2a5rgn2_ . 1)
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
     (*file-handlers*_r2a5rgn2_)
     ()
     (#%begin
       (#%set! add-file-handler
         (#%lambda #t
           (|extension_r2w1pJn2_| |thunk_r2SZmao2_|)
           (*file-handlers*_r2a5rgn2_)
           (#%if (not (assq |extension_r2w1pJn2_|
                            *file-handlers*_r2a5rgn2_))
             (#%set! *file-handlers*_r2a5rgn2_
               (cons (cons |extension_r2w1pJn2_| |thunk_r2SZmao2_|)
                     *file-handlers*_r2a5rgn2_))
             #!void)))
       (#%set! file-handler
         ((#%lambda #t
            (|_load_r2cWkDo2_|)
            (*file-handlers*_r2a5rgn2_)
            (#%lambda #t
              (|extension_r2ySi4p2_|)
              (|_load_r2cWkDo2_| *file-handlers*_r2a5rgn2_)
              ((#%lambda #t
                 (|t_r2UOgxp2_|)
                 (|_load_r2cWkDo2_|)
                 (#%if |t_r2UOgxp2_|
                   (cdr |t_r2UOgxp2_|)
                   |_load_r2cWkDo2_|))
               (assq (string->symbol
                       (string-downcase |extension_r2ySi4p2_|))
                     *file-handlers*_r2a5rgn2_))))
          load))))
   ()))
(#%program
  ((|rest_r2AHcrq2_| . 1)
   (|file_r2WDaUq2_| . 1)
   (current-url . 1)
   (normalize-url . 1)
   (|proc_r2eLe-p2_| . 1)
   (apply . 1))
  ()
  (apply current-url normalize-url)
  (#%define make-io-proc
    (#%lambda #t
      (|proc_r2eLe-p2_|)
      ()
      (#%lambda #t
        (|file_r2WDaUq2_| . |rest_r2AHcrq2_|)
        (|proc_r2eLe-p2_|)
        (apply |proc_r2eLe-p2_|
               (normalize-url (current-url) |file_r2WDaUq2_|)
               |rest_r2AHcrq2_|)))))
(#%program
  ((|url_r2GaWvu2_| . 1)
   (string->list . 1)
   (reverse! . 1)
   (cons . 1)
   (cdr . 1)
   (|loop_r207UYu2_| . 2)
   (|acc_r2I_PSv2_| . 2)
   (list->string . 1)
   (car . 2)
   (equal? . 1)
   (|x_r2m3Spv2_| . 4)
   (null? . 1)
   (void . 1)
   (|file-extension_r2gA8lr2_| . 1)
   (|fe_r2keY2u2_| . 2)
   (file-handler . 1)
   (|e_r2El09t2_| . 1)
   (|m_r2ip2Is2_| . 1)
   (|fk_r2-h-Bt2_| . 1)
   (call-with-failure-continuation . 1)
   (with-failure-continuation . 1)
   (|file_r2Cw6Or2_| . 1)
   (|previous-url_r2Ys4fs2_| . 3)
   (normalize-url . 1)
   (current-url . 6)
   (load . 1)
   (|open-output-file| . 2)
   (open-source-input-file . 2)
   (make-io-proc . 3)
   (|open-input-file| . 2))
  ((|loop_r207UYu2_| . 1)
   (load . 1)
   (|open-output-file| . 1)
   (open-source-input-file . 1)
   (|open-input-file| . 1))
  (|open-input-file|
    |open-input-file|
    make-io-proc
    open-source-input-file
    open-source-input-file
    |open-output-file|
    |open-output-file|
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
     (|file-extension_r2gA8lr2_|)
     ()
     (#%begin
       (#%set! |open-input-file|
         (make-io-proc |open-input-file|))
       (#%set! open-source-input-file
         (make-io-proc open-source-input-file))
       (#%set! |open-output-file|
         (make-io-proc |open-output-file|))
       (#%set! load
         (#%lambda #t
           (|file_r2Cw6Or2_|)
           (|file-extension_r2gA8lr2_|)
           (#%begin
             ((#%lambda #t
                (|previous-url_r2Ys4fs2_|)
                (|file_r2Cw6Or2_| |file-extension_r2gA8lr2_|)
                (#%begin
                  (current-url
                    (normalize-url
                      |previous-url_r2Ys4fs2_|
                      |file_r2Cw6Or2_|))
                  (with-failure-continuation
                    (#%lambda #t
                      (|m_r2ip2Is2_| |e_r2El09t2_|)
                      (|previous-url_r2Ys4fs2_|)
                      (#%begin
                        (current-url |previous-url_r2Ys4fs2_|)
                        (call-with-failure-continuation
                          (#%lambda #t
                            (|fk_r2-h-Bt2_|)
                            (|e_r2El09t2_| |m_r2ip2Is2_|)
                            (|fk_r2-h-Bt2_| |m_r2ip2Is2_| |e_r2El09t2_|)))))
                    (#%lambda #t
                      ()
                      (|file-extension_r2gA8lr2_|)
                      ((#%lambda #t
                         (|fe_r2keY2u2_|)
                         ()
                         ((file-handler
                            (#%if |fe_r2keY2u2_| |fe_r2keY2u2_| "scm"))
                          (current-url)))
                       (|file-extension_r2gA8lr2_| (current-url)))))
                  (current-url |previous-url_r2Ys4fs2_|)))
              (current-url))
             (void))))))
   (#%lambda #t
     (|url_r2GaWvu2_|)
     ()
     ((#%letrec #t
        ((|loop_r207UYu2_|
           (#%lambda #t
             (|x_r2m3Spv2_| |acc_r2I_PSv2_|)
             (|loop_r207UYu2_|)
             (#%if (null? |x_r2m3Spv2_|)
               #f
               (#%if (equal? (car |x_r2m3Spv2_|) #\.)
                 (list->string |acc_r2I_PSv2_|)
                 (|loop_r207UYu2_|
                   (cdr |x_r2m3Spv2_|)
                   (cons (car |x_r2m3Spv2_|) |acc_r2I_PSv2_|)))))))
        ()
        |loop_r207UYu2_|)
      (reverse! (string->list |url_r2GaWvu2_|))
      ()))))
(#%program
  ((|str_r22YNjw2_| . 1)
   (load-native-library . 1)
   (native-library-binding-names . 1)
   (|binding-names_r2KQJdx2_| . 1)
   (|nl_r2oULMw2_| . 2)
   (native-library-binding . 1)
   (|name_r24NHGx2_| . 2)
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
      (|str_r22YNjw2_|)
      ()
      ((#%lambda #t
         (|nl_r2oULMw2_|)
         ()
         ((#%lambda #t
            (|binding-names_r2KQJdx2_|)
            (|nl_r2oULMw2_|)
            (for-each
              (#%lambda #t
                (|name_r24NHGx2_|)
                (|nl_r2oULMw2_|)
                (putprop
                  |name_r24NHGx2_|
                  (native-library-binding
                    |nl_r2oULMw2_|
                    |name_r24NHGx2_|)))
              |binding-names_r2KQJdx2_|))
          (native-library-binding-names |nl_r2oULMw2_|)))
       (load-native-library |str_r22YNjw2_|)))))
(#%program
  ((|lses_r2MFDAy2_| . 5)
   (cdr . 3)
   (car . 3)
   (append2 . 1)
   (|real-append_r2qJF7y2_| . 3)
   (apply . 3)
   (ls1_r2syzuz2_ . 3)
   (|lses_r26CB1z2_| . 4)
   (null? . 4))
  ((|real-append_r2qJF7y2_| . 1))
  (apply cdr append2 car null?)
  (#%define append
    (#%letrec #t
      ((|real-append_r2qJF7y2_|
         (#%lambda #t
           (ls1_r2syzuz2_ . |lses_r26CB1z2_|)
           (|real-append_r2qJF7y2_|)
           (#%if (null? |lses_r26CB1z2_|)
             ls1_r2syzuz2_
             (#%if (null? ls1_r2syzuz2_)
               (apply |real-append_r2qJF7y2_| |lses_r26CB1z2_|)
               (apply |real-append_r2qJF7y2_|
                      (append2 ls1_r2syzuz2_ (car |lses_r26CB1z2_|))
                      (cdr |lses_r26CB1z2_|)))))))
      ()
      (#%lambda #t
        |lses_r2MFDAy2_|
        (|real-append_r2qJF7y2_|)
        (#%if (null? |lses_r2MFDAy2_|)
          ()
          (#%if (null? (cdr |lses_r2MFDAy2_|))
            (car |lses_r2MFDAy2_|)
            (apply |real-append_r2qJF7y2_|
                   (car |lses_r2MFDAy2_|)
                   (cdr |lses_r2MFDAy2_|))))))))
(#%program
  ((|x_r2OuxXz2_| . 2)
   (null? . 2)
   (|lag_r2QjriB2_| . 1)
   (cdr . 3)
   (|lp_r28rvoA2_| . 2)
   (|lag_r2S8lFC2_| . 2)
   (|x_r2wcncC2_| . 2)
   (eq? . 1)
   (not . 1)
   (|x_r2agpLB2_| . 3)
   (|x_r2untRA2_| . 3)
   (pair? . 2))
  ((|lp_r28rvoA2_| . 1))
  (pair? cdr eq? not null?)
  (#%define proper-list?
    (#%lambda #t
      (|x_r2OuxXz2_|)
      ()
      ((#%letrec #t
         ((|lp_r28rvoA2_|
            (#%lambda #t
              (|x_r2untRA2_| |lag_r2QjriB2_|)
              (|lp_r28rvoA2_|)
              (#%if (pair? |x_r2untRA2_|)
                ((#%lambda #t
                   (|x_r2agpLB2_|)
                   (|lag_r2QjriB2_| |lp_r28rvoA2_|)
                   (#%if (pair? |x_r2agpLB2_|)
                     ((#%lambda #t
                        (|x_r2wcncC2_| |lag_r2S8lFC2_|)
                        (|lp_r28rvoA2_|)
                        (#%if (not (eq? |x_r2wcncC2_| |lag_r2S8lFC2_|))
                          (|lp_r28rvoA2_| |x_r2wcncC2_| |lag_r2S8lFC2_|)
                          #f))
                      (cdr |x_r2agpLB2_|)
                      (cdr |lag_r2QjriB2_|))
                     (null? |x_r2agpLB2_|)))
                 (cdr |x_r2untRA2_|))
                (null? |x_r2untRA2_|)))))
         ()
         |lp_r28rvoA2_|)
       |x_r2OuxXz2_|
       |x_r2OuxXz2_|))))
(#%program
  ((proper-list? . 1))
  ()
  (proper-list?)
  (#%define list? proper-list?))
(#%program
  ((|general-expt_r2c5j6D2_| . 1)
   (denominator . 1)
   (numerator . 1)
   (|rational-expt_r2y1hzD2_| . 1)
   (integer? . 2)
   (not . 1)
   (rational? . 1)
   (|base_r2eWctE2_| . 9)
   (|exponent_r2ASaWE2_| . 8)
   (|squaring_r2meQUJ2_| . 3)
   (odd? . 1)
   (quotient . 1)
   (|loop_r2kpWxI2_| . 2)
   (|result_r20iSrJ2_| . 3)
   (|rest_r2GlU-I2_| . 3)
   (zero? . 3)
   (ashl . 1)
   (= . 1)
   (exact? . 5)
   (abs . 1)
   (|base_r2Ew-DH2_| . 4)
   (|integer-expt_r2UZe0E2_| . 2)
   (|exponent_r2-sY4I2_| . 4)
   (negative? . 1)
   (|base-denominator_r2YD2KG2_| . 1)
   (|exponent_r2iA0bH2_| . 2)
   (|base-numerator_r2CH4hG2_| . 1)
   (expt . 2)
   (/ . 2)
   (|base_r2WO8nF2_| . 1)
   (log . 1)
   (|exponent_r2gL6QF2_| . 1)
   (* . 3)
   (exp . 1))
  ((|loop_r2kpWxI2_| . 1)
   (|integer-expt_r2UZe0E2_| . 1)
   (|rational-expt_r2y1hzD2_| . 1)
   (|general-expt_r2c5j6D2_| . 1))
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
      ((|general-expt_r2c5j6D2_|
         (#%lambda #t
           (|base_r2WO8nF2_| |exponent_r2gL6QF2_|)
           ()
           (exp (* |exponent_r2gL6QF2_| (log |base_r2WO8nF2_|)))))
       (|rational-expt_r2y1hzD2_|
         (#%lambda #t
           (|base-numerator_r2CH4hG2_|
             |base-denominator_r2YD2KG2_|
             |exponent_r2iA0bH2_|)
           ()
           (/ (expt |base-numerator_r2CH4hG2_|
                    |exponent_r2iA0bH2_|)
              (expt |base-denominator_r2YD2KG2_|
                    |exponent_r2iA0bH2_|))))
       (|integer-expt_r2UZe0E2_|
         (#%lambda #t
           (|base_r2Ew-DH2_| |exponent_r2-sY4I2_|)
           (|integer-expt_r2UZe0E2_|)
           (#%if (negative? |exponent_r2-sY4I2_|)
             (/ (|integer-expt_r2UZe0E2_|
                  |base_r2Ew-DH2_|
                  (abs |exponent_r2-sY4I2_|)))
             (#%if (#%if (exact? |base_r2Ew-DH2_|)
                     (= |base_r2Ew-DH2_| 2)
                     #f)
               (ashl 1 |exponent_r2-sY4I2_|)
               ((#%letrec #t
                  ((|loop_r2kpWxI2_|
                     (#%lambda #t
                       (|rest_r2GlU-I2_|
                         |result_r20iSrJ2_|
                         |squaring_r2meQUJ2_|)
                       (|loop_r2kpWxI2_|)
                       (#%if (zero? |rest_r2GlU-I2_|)
                         |result_r20iSrJ2_|
                         (|loop_r2kpWxI2_|
                           (quotient |rest_r2GlU-I2_| 2)
                           (#%if (odd? |rest_r2GlU-I2_|)
                             (* |result_r20iSrJ2_| |squaring_r2meQUJ2_|)
                             |result_r20iSrJ2_|)
                           (* |squaring_r2meQUJ2_| |squaring_r2meQUJ2_|))))))
                  ()
                  |loop_r2kpWxI2_|)
                |exponent_r2-sY4I2_|
                1
                |base_r2Ew-DH2_|))))))
      ()
      (#%lambda #t
        (|base_r2eWctE2_| |exponent_r2ASaWE2_|)
        (|integer-expt_r2UZe0E2_|
          |rational-expt_r2y1hzD2_|
          |general-expt_r2c5j6D2_|)
        (#%if (zero? |exponent_r2ASaWE2_|)
          (#%if (exact? |exponent_r2ASaWE2_|) 1 1.0)
          (#%if (zero? |base_r2eWctE2_|)
            (#%if (exact? |exponent_r2ASaWE2_|)
              |base_r2eWctE2_|
              0.0)
            (#%if (#%if (exact? |base_r2eWctE2_|)
                    (#%if (rational? |base_r2eWctE2_|)
                      (not (integer? |base_r2eWctE2_|))
                      #f)
                    #f)
              (|rational-expt_r2y1hzD2_|
                (numerator |base_r2eWctE2_|)
                (denominator |base_r2eWctE2_|)
                |exponent_r2ASaWE2_|)
              (#%if (#%if (exact? |exponent_r2ASaWE2_|)
                      (integer? |exponent_r2ASaWE2_|)
                      #f)
                (|integer-expt_r2UZe0E2_|
                  |base_r2eWctE2_|
                  |exponent_r2ASaWE2_|)
                (|general-expt_r2c5j6D2_|
                  |base_r2eWctE2_|
                  |exponent_r2ASaWE2_|)))))))))
(#%program
  ((- . 1)
   (|tmp_r2K_HIL2_| . 2)
   (/ . 2)
   (modpow . 2)
   (|tmp_r24YF9M2_| . 2)
   (* . 3)
   (even? . 1)
   (|n_r2o3KfL2_| . 6)
   (|x_r2IaOlK2_| . 4)
   (modulo . 4)
   (|y_r227MOK2_| . 4)
   (= . 1))
  ()
  (even? modpow / * - modulo =)
  (#%define modpow
    (#%lambda #t
      (|x_r2IaOlK2_| |y_r227MOK2_| |n_r2o3KfL2_|)
      ()
      (#%if (= |y_r227MOK2_| 1)
        (modulo |x_r2IaOlK2_| |n_r2o3KfL2_|)
        (#%if (even? |y_r227MOK2_|)
          ((#%lambda #t
             (|tmp_r24YF9M2_|)
             (|n_r2o3KfL2_|)
             (modulo
               (* |tmp_r24YF9M2_| |tmp_r24YF9M2_|)
               |n_r2o3KfL2_|))
           (modpow
             |x_r2IaOlK2_|
             (/ |y_r227MOK2_| 2)
             |n_r2o3KfL2_|))
          ((#%lambda #t
             (|tmp_r2K_HIL2_|)
             (|n_r2o3KfL2_| |x_r2IaOlK2_|)
             (modulo
               (* |x_r2IaOlK2_|
                  (modulo
                    (* |tmp_r2K_HIL2_| |tmp_r2K_HIL2_|)
                    |n_r2o3KfL2_|))
               |n_r2o3KfL2_|))
           (modpow
             |x_r2IaOlK2_|
             (/ (- |y_r227MOK2_| 1) 2)
             |n_r2o3KfL2_|)))))))
(#%program
  ((round . 1)
   (= . 1)
   (real? . 1)
   (|n_r2qUDCM2_| . 4)
   (_integer? . 1))
  ()
  (real? round = _integer?)
  (#%define integer?
    (#%lambda #t
      (|n_r2qUDCM2_|)
      ()
      (#%if (_integer? |n_r2qUDCM2_|)
        #t
        (#%if (real? |n_r2qUDCM2_|)
          (= (round |n_r2qUDCM2_|) |n_r2qUDCM2_|)
          #f)))))
(#%program
  ((complex? . 1)
   (|oldcomp?_r2MQB3N2_| . 1)
   (not . 1)
   (|n_r26NzwN2_| . 2)
   (number? . 1))
  ()
  (complex? number? not)
  (#%define real?
    ((#%lambda #t
       (|oldcomp?_r2MQB3N2_|)
       ()
       (#%lambda #t
         (|n_r26NzwN2_|)
         (|oldcomp?_r2MQB3N2_|)
         (#%if (number? |n_r26NzwN2_|)
           (not (|oldcomp?_r2MQB3N2_| |n_r26NzwN2_|))
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
   (|b_r28CtTO2_| . 2)
   (|a_r2OFvqO2_| . 2)
   (* . 2)
   (+ . 1)
   (sqrt . 1)
   (|num_r2sJxZN2_| . 6)
   (real? . 1)
   (not . 1))
  ()
  (< - + * sqrt real-part imag-part not real?)
  (#%define abs
    (#%lambda #t
      (|num_r2sJxZN2_|)
      ()
      (#%if (not (real? |num_r2sJxZN2_|))
        ((#%lambda #t
           (|a_r2OFvqO2_| |b_r28CtTO2_|)
           ()
           (sqrt (+ (* |a_r2OFvqO2_| |a_r2OFvqO2_|)
                    (* |b_r28CtTO2_| |b_r28CtTO2_|))))
         (real-part |num_r2sJxZN2_|)
         (imag-part |num_r2sJxZN2_|))
        (#%if (< |num_r2sJxZN2_| 0)
          (- |num_r2sJxZN2_|)
          |num_r2sJxZN2_|)))))
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
   (|x1_r2Sjj8R2_| . 3)
   (|args_r2wnlHQ2_| . 2)
   (max . 1)
   (< . 1)
   (|x1_r2arneQ2_| . 3)
   (|args_r2QupNP2_| . 2)
   (min . 1)
   (inexact? . 3)
   (cdr . 2)
   (|_min_max_r2uyrkP2_| . 4)
   (car . 3)
   (|proc_r2cghBR2_| . 3)
   (exact->inexact . 1)
   (|mv_r2ycf2S2_| . 5)
   (exact? . 1)
   (|inexact_r2e5bYS2_| . 3)
   (|args_r2U8dvS2_| . 6)
   (null? . 3))
  ((max . 1) (min . 1) (|_min_max_r2uyrkP2_| . 1))
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
    ((|_min_max_r2uyrkP2_|
       (#%lambda #t
         (|proc_r2cghBR2_|
           |mv_r2ycf2S2_|
           |args_r2U8dvS2_|
           |inexact_r2e5bYS2_|)
         (|_min_max_r2uyrkP2_|)
         (#%if (null? |args_r2U8dvS2_|)
           (#%if (#%if |inexact_r2e5bYS2_|
                   (exact? |mv_r2ycf2S2_|)
                   #f)
             (exact->inexact |mv_r2ycf2S2_|)
             |mv_r2ycf2S2_|)
           (#%if (|proc_r2cghBR2_|
                   (car |args_r2U8dvS2_|)
                   |mv_r2ycf2S2_|)
             (|_min_max_r2uyrkP2_|
               |proc_r2cghBR2_|
               (car |args_r2U8dvS2_|)
               (cdr |args_r2U8dvS2_|)
               (#%if |inexact_r2e5bYS2_|
                 #t
                 (inexact? (car |args_r2U8dvS2_|))))
             (|_min_max_r2uyrkP2_|
               |proc_r2cghBR2_|
               |mv_r2ycf2S2_|
               (cdr |args_r2U8dvS2_|)
               |inexact_r2e5bYS2_|))))))
    ()
    (#%begin
      (#%set! min
        (#%lambda #t
          (|x1_r2arneQ2_| . |args_r2QupNP2_|)
          (|_min_max_r2uyrkP2_|)
          (#%if (null? |args_r2QupNP2_|)
            |x1_r2arneQ2_|
            (|_min_max_r2uyrkP2_|
              <
              |x1_r2arneQ2_|
              |args_r2QupNP2_|
              (inexact? |x1_r2arneQ2_|)))))
      (#%set! max
        (#%lambda #t
          (|x1_r2Sjj8R2_| . |args_r2wnlHQ2_|)
          (|_min_max_r2uyrkP2_|)
          (#%if (null? |args_r2wnlHQ2_|)
            |x1_r2Sjj8R2_|
            (|_min_max_r2uyrkP2_|
              >
              |x1_r2Sjj8R2_|
              |args_r2wnlHQ2_|
              (inexact? |x1_r2Sjj8R2_|))))))))
(#%program
  ((|n_r2A19pT2_| . 1) (< . 1))
  ()
  (<)
  (#%define negative?
    (#%lambda #t
      (|n_r2A19pT2_|)
      ()
      (< |n_r2A19pT2_| 0))))
(#%program
  ((|n_r2WZ6ST2_| . 1) (> . 1))
  ()
  (>)
  (#%define positive?
    (#%lambda #t
      (|n_r2WZ6ST2_|)
      ()
      (> |n_r2WZ6ST2_| 0))))
(#%program
  ((|n_r2gW4jU2_| . 1) (modulo . 1) (= . 1))
  ()
  (modulo =)
  (#%define even?
    (#%lambda #t
      (|n_r2gW4jU2_|)
      ()
      (= 0 (modulo |n_r2gW4jU2_| 2)))))
(#%program
  ((|n_r2CS2MU2_| . 1) (even? . 1) (not . 1))
  ()
  (even? not)
  (#%define odd?
    (#%lambda #t
      (|n_r2CS2MU2_|)
      ()
      (not (even? |n_r2CS2MU2_|)))))
(#%program
  ((|n_r2YO0dV2_| . 1) (= . 1))
  ()
  (=)
  (#%define zero?
    (#%lambda #t
      (|n_r2YO0dV2_|)
      ()
      (= |n_r2YO0dV2_| 0))))
(#%program
  ((|n_r2iL-FV2_| . 1) (+ . 1))
  ()
  (+)
  (#%define add1
    (#%lambda #t
      (|n_r2iL-FV2_|)
      ()
      (+ |n_r2iL-FV2_| 1))))
(#%program
  ((|n_r2EHY6W2_| . 1) (- . 1))
  ()
  (-)
  (#%define sub1
    (#%lambda #t
      (|n_r2EHY6W2_|)
      ()
      (- |n_r2EHY6W2_| 1))))
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
  ((|y_r2sUvs03_| . 1)
   (|x_r26Yx__2_| . 1)
   (|args_r247EE-2_| . 1)
   (|loop_r2q3C5_2_| . 2)
   (cadr . 1)
   (car . 1)
   (|comparator_r22iKhZ2_| . 1)
   (|chainer_r2oeIKZ2_| . 1)
   (cdr . 2)
   (|endstate_r2KaGb-2_| . 2)
   (|x_r2M_zy_2_| . 5)
   (null? . 2)
   (|b_r2IlMQY2_| . 2)
   (|a_r2mpOnY2_| . 2)
   (> . 1)
   (>= . 1)
   (|_and2_r2kAU0X2_| . 2)
   (= . 2)
   (|b_r20tQWX2_| . 2)
   (|a_r2GwStX2_| . 2)
   (< . 1)
   (|_comp_help_r2-DWzW2_| . 2)
   (<= . 1))
  ((|loop_r2q3C5_2_| . 1) (>= . 1) (<= . 1))
  (null? cadr car cdr <= = < >= >)
  ((#%lambda #t
     (|_comp_help_r2-DWzW2_| |_and2_r2kAU0X2_|)
     ()
     (#%begin
       (#%set! <=
         (|_comp_help_r2-DWzW2_|
           (#%lambda #t
             (|a_r2GwStX2_| |b_r20tQWX2_|)
             ()
             (#%if (< |a_r2GwStX2_| |b_r20tQWX2_|)
               #t
               (= |a_r2GwStX2_| |b_r20tQWX2_|)))
           |_and2_r2kAU0X2_|
           #t))
       (#%set! >=
         (|_comp_help_r2-DWzW2_|
           (#%lambda #t
             (|a_r2mpOnY2_| |b_r2IlMQY2_|)
             ()
             (#%if (> |a_r2mpOnY2_| |b_r2IlMQY2_|)
               #t
               (= |a_r2mpOnY2_| |b_r2IlMQY2_|)))
           |_and2_r2kAU0X2_|
           #t))))
   (#%lambda #t
     (|comparator_r22iKhZ2_|
       |chainer_r2oeIKZ2_|
       |endstate_r2KaGb-2_|)
     ()
     (#%lambda #t
       |args_r247EE-2_|
       (|endstate_r2KaGb-2_|
         |chainer_r2oeIKZ2_|
         |comparator_r22iKhZ2_|)
       ((#%letrec #t
          ((|loop_r2q3C5_2_|
             (#%lambda #t
               (|x_r2M_zy_2_|)
               (|loop_r2q3C5_2_|
                 |endstate_r2KaGb-2_|
                 |chainer_r2oeIKZ2_|
                 |comparator_r22iKhZ2_|)
               (#%if (null? |x_r2M_zy_2_|)
                 |endstate_r2KaGb-2_|
                 (#%if (null? (cdr |x_r2M_zy_2_|))
                   |endstate_r2KaGb-2_|
                   (|chainer_r2oeIKZ2_|
                     (|comparator_r22iKhZ2_|
                       (car |x_r2M_zy_2_|)
                       (cadr |x_r2M_zy_2_|))
                     (|loop_r2q3C5_2_| (cdr |x_r2M_zy_2_|))))))))
          (|endstate_r2KaGb-2_|
            |chainer_r2oeIKZ2_|
            |comparator_r22iKhZ2_|)
          |loop_r2q3C5_2_|)
        |args_r247EE-2_|)))
   (#%lambda #t
     (|x_r26Yx__2_| |y_r2sUvs03_|)
     ()
     (#%if |x_r26Yx__2_| |y_r2sUvs03_| #f))))
(#%program
  ((|chainer_r2uJpP13_| . 1)
   (apply . 1)
   (|comparator_r28Nrm13_| . 1)
   (cadr . 2)
   (car . 2)
   (= . 1)
   (cdr . 2)
   (|args_r2QFng23_| . 7)
   (null? . 2)
   (< . 1)
   (<= . 2)
   (> . 1)
   (|_?=_r2OQtV03_| . 2)
   (>= . 2))
  ((<= . 1) (>= . 1))
  (< <= <= > >= >= null? = car cadr apply cdr)
  ((#%lambda #t
     (|_?=_r2OQtV03_|)
     ()
     (#%begin
       (#%set! >= (|_?=_r2OQtV03_| > >=))
       (#%set! <= (|_?=_r2OQtV03_| < <=))))
   (#%lambda #t
     (|comparator_r28Nrm13_| |chainer_r2uJpP13_|)
     ()
     (#%lambda #t
       |args_r2QFng23_|
       (|chainer_r2uJpP13_| |comparator_r28Nrm13_|)
       (#%if (null? |args_r2QFng23_|)
         #t
         (#%if (null? (cdr |args_r2QFng23_|))
           #t
           (#%if (#%if (= (car |args_r2QFng23_|)
                          (cadr |args_r2QFng23_|))
                   #t
                   (|comparator_r28Nrm13_|
                     (car |args_r2QFng23_|)
                     (cadr |args_r2QFng23_|)))
             (apply |chainer_r2uJpP13_|
                    (cdr |args_r2QFng23_|))
             #f)))))))
(#%program
  ((cadr . 1)
   (_gcd . 1)
   (car . 2)
   (cdr . 1)
   (args_r2wyja33_ . 5)
   (null? . 2))
  ()
  (cdr car cadr _gcd null?)
  (#%define gcd
    (#%lambda #t
      args_r2wyja33_
      ()
      (#%if (null? args_r2wyja33_)
        0
        (#%if (null? (cdr args_r2wyja33_))
          (car args_r2wyja33_)
          (_gcd (car args_r2wyja33_) (cadr args_r2wyja33_)))))))
(#%program
  ((cadr . 1)
   (_lcm . 1)
   (car . 2)
   (cdr . 1)
   (|args_r2SuhD33_| . 5)
   (null? . 2))
  ()
  (cdr car cadr _lcm null?)
  (#%define lcm
    (#%lambda #t
      |args_r2SuhD33_|
      ()
      (#%if (null? |args_r2SuhD33_|)
        1
        (#%if (null? (cdr |args_r2SuhD33_|))
          (car |args_r2SuhD33_|)
          (_lcm (car |args_r2SuhD33_|)
                (cadr |args_r2SuhD33_|)))))))
(#%program
  ((x_r2crf443_ . 1)
   (remainder . 1)
   (+ . 1)
   (|r_r2Ujb-43_| . 3)
   (positive? . 1)
   (y_r2yndx43_ . 3)
   (negative? . 2))
  ()
  (remainder positive? negative? +)
  (#%define modulo
    (#%lambda #t
      (x_r2crf443_ y_r2yndx43_)
      ()
      ((#%lambda #t
         (|r_r2Ujb-43_|)
         (y_r2yndx43_)
         (#%if ((#%if (negative? y_r2yndx43_)
                  positive?
                  negative?)
                |r_r2Ujb-43_|)
           (+ |r_r2Ujb-43_| y_r2yndx43_)
           |r_r2Ujb-43_|))
       (remainder x_r2crf443_ y_r2yndx43_)))))
(#%program
  ((|args_r2Ac7U53_| . 3)
   (cdr . 2)
   (car . 2)
   (_string-append . 1)
   (string-append-helper_r2eg9r53_ . 2)
   (|acc_r2W85l63_| . 2)
   (|args_r2g53O63_| . 3)
   (null? . 2))
  ((string-append-helper_r2eg9r53_ . 1))
  (car _string-append cdr null?)
  (#%define string-append
    (#%letrec #t
      ((string-append-helper_r2eg9r53_
         (#%lambda #t
           (|acc_r2W85l63_| |args_r2g53O63_|)
           (string-append-helper_r2eg9r53_)
           (#%if (null? |args_r2g53O63_|)
             |acc_r2W85l63_|
             (string-append-helper_r2eg9r53_
               (_string-append
                 |acc_r2W85l63_|
                 (car |args_r2g53O63_|))
               (cdr |args_r2g53O63_|))))))
      ()
      (#%lambda #t
        |args_r2Ac7U53_|
        (string-append-helper_r2eg9r53_)
        (#%if (null? |args_r2Ac7U53_|)
          ""
          (string-append-helper_r2eg9r53_
            (car |args_r2Ac7U53_|)
            (cdr |args_r2Ac7U53_|)))))))
(#%program
  ((- . 1)
   (char->integer . 4)
   (|c_r2ESWB83_| . 2)
   (|lc-offset_r2iWY883_| . 1)
   (+ . 1)
   (integer->char . 1)
   (|z_r2YZ-H73_| . 1)
   (<= . 1)
   (|a_r2C11f73_| . 2)
   (|cv_r2-OU293_| . 3)
   (>= . 1))
  ()
  (integer->char + >= <= char->integer -)
  (#%define char-downcase
    ((#%lambda #t
       (|a_r2C11f73_|)
       ()
       ((#%lambda #t
          (|z_r2YZ-H73_|)
          (|a_r2C11f73_|)
          ((#%lambda #t
             (|lc-offset_r2iWY883_|)
             (|z_r2YZ-H73_| |a_r2C11f73_|)
             (#%lambda #t
               (|c_r2ESWB83_|)
               (|lc-offset_r2iWY883_|
                 |z_r2YZ-H73_|
                 |a_r2C11f73_|)
               ((#%lambda #t
                  (|cv_r2-OU293_|)
                  (|c_r2ESWB83_|
                    |lc-offset_r2iWY883_|
                    |z_r2YZ-H73_|
                    |a_r2C11f73_|)
                  (#%if (#%if (>= |cv_r2-OU293_| |a_r2C11f73_|)
                          (<= |cv_r2-OU293_| |z_r2YZ-H73_|)
                          #f)
                    (integer->char
                      (+ |cv_r2-OU293_| |lc-offset_r2iWY883_|))
                    |c_r2ESWB83_|))
                (char->integer |c_r2ESWB83_|))))
           (- (char->integer #\a) |a_r2C11f73_|)))
        (char->integer #\Z)))
     (char->integer #\A))))
(#%program
  ((char->integer . 4)
   (|c_r2mAMSa3_| . 2)
   (|uc-offset_r20EOpa3_| . 1)
   (- . 2)
   (integer->char . 1)
   (|z_r2GHQY93_| . 1)
   (<= . 1)
   (|a_r2kLSv93_| . 2)
   (|cv_r2IwKjb3_| . 3)
   (>= . 1))
  ()
  (integer->char - >= <= char->integer)
  (#%define char-upcase
    ((#%lambda #t
       (|a_r2kLSv93_|)
       ()
       ((#%lambda #t
          (|z_r2GHQY93_|)
          (|a_r2kLSv93_|)
          ((#%lambda #t
             (|uc-offset_r20EOpa3_|)
             (|z_r2GHQY93_| |a_r2kLSv93_|)
             (#%lambda #t
               (|c_r2mAMSa3_|)
               (|uc-offset_r20EOpa3_|
                 |z_r2GHQY93_|
                 |a_r2kLSv93_|)
               ((#%lambda #t
                  (|cv_r2IwKjb3_|)
                  (|c_r2mAMSa3_|
                    |uc-offset_r20EOpa3_|
                    |z_r2GHQY93_|
                    |a_r2kLSv93_|)
                  (#%if (#%if (>= |cv_r2IwKjb3_| |a_r2kLSv93_|)
                          (<= |cv_r2IwKjb3_| |z_r2GHQY93_|)
                          #f)
                    (integer->char
                      (- |cv_r2IwKjb3_| |uc-offset_r20EOpa3_|))
                    |c_r2mAMSa3_|))
                (char->integer |c_r2mAMSa3_|))))
           (- |a_r2kLSv93_| (char->integer #\A))))
        (char->integer #\z)))
     (char->integer #\a))))
(#%program
  ((|args_r22tIMb3_| . 1)
   (map . 1)
   (|c2_r2opGdc3_| . 1)
   (|c1_r2KlEGc3_| . 1)
   (char->integer . 3)
   (> . 1)
   (apply . 1))
  ()
  (map char->integer > apply)
  (#%define char>?
    (#%lambda #t
      (|c1_r2KlEGc3_|
        |c2_r2opGdc3_|
        .
        |args_r22tIMb3_|)
      ()
      (apply >
             (char->integer |c1_r2KlEGc3_|)
             (char->integer |c2_r2opGdc3_|)
             (map char->integer |args_r22tIMb3_|)))))
(#%program
  ((|args_r24iC7d3_| . 1)
   (map . 1)
   (|c2_r2qeAAd3_| . 1)
   (|c1_r2May1e3_| . 1)
   (char->integer . 3)
   (< . 1)
   (apply . 1))
  ()
  (map char->integer < apply)
  (#%define char<?
    (#%lambda #t
      (|c1_r2May1e3_|
        |c2_r2qeAAd3_|
        .
        |args_r24iC7d3_|)
      ()
      (apply <
             (char->integer |c1_r2May1e3_|)
             (char->integer |c2_r2qeAAd3_|)
             (map char->integer |args_r24iC7d3_|)))))
(#%program
  ((eqv? . 1))
  ()
  (eqv?)
  (#%define char=? eqv?))
(#%program
  ((char=? . 1)
   (|c2_r2s3uXe3_| . 2)
   (c1_r267wue3_ . 2)
   (char>? . 1))
  ()
  (char=? char>?)
  (#%define char>=?
    (#%lambda #t
      (c1_r267wue3_ |c2_r2s3uXe3_|)
      ()
      (#%if (char>? c1_r267wue3_ |c2_r2s3uXe3_|)
        #t
        (char=? c1_r267wue3_ |c2_r2s3uXe3_|)))))
(#%program
  ((char=? . 1)
   (|c2_r28YpRf3_| . 2)
   (|c1_r2O_rof3_| . 2)
   (char<? . 1))
  ()
  (char=? char<?)
  (#%define char<=?
    (#%lambda #t
      (|c1_r2O_rof3_| |c2_r28YpRf3_|)
      ()
      (#%if (char<? |c1_r2O_rof3_| |c2_r28YpRf3_|)
        #t
        (char=? |c1_r2O_rof3_| |c2_r28YpRf3_|)))))
(#%program
  ((|args_r2uUnig3_| . 1)
   (map . 1)
   (|c2_r2QQlLg3_| . 1)
   (|c1_r2aNjch3_| . 1)
   (char-downcase . 3)
   (char>? . 1)
   (apply . 1))
  ()
  (map char-downcase char>? apply)
  (#%define char-ci>?
    (#%lambda #t
      (|c1_r2aNjch3_|
        |c2_r2QQlLg3_|
        .
        |args_r2uUnig3_|)
      ()
      (apply char>?
             (char-downcase |c1_r2aNjch3_|)
             (char-downcase |c2_r2QQlLg3_|)
             (map char-downcase |args_r2uUnig3_|)))))
(#%program
  ((|args_r2wJhFh3_| . 1)
   (map . 1)
   (|c2_r2SFf6i3_| . 1)
   (|c1_r2cCdzi3_| . 1)
   (char-downcase . 3)
   (char<? . 1)
   (apply . 1))
  ()
  (map char-downcase char<? apply)
  (#%define char-ci<?
    (#%lambda #t
      (|c1_r2cCdzi3_|
        |c2_r2SFf6i3_|
        .
        |args_r2wJhFh3_|)
      ()
      (apply char<?
             (char-downcase |c1_r2cCdzi3_|)
             (char-downcase |c2_r2SFf6i3_|)
             (map char-downcase |args_r2wJhFh3_|)))))
(#%program
  ((args_r2yyb0j3_ . 1)
   (map . 1)
   (|c2_r2Uu9tj3_| . 1)
   (|c1_r2er7Wj3_| . 1)
   (char-downcase . 3)
   (char=? . 1)
   (apply . 1))
  ()
  (map char-downcase char=? apply)
  (#%define char-ci=?
    (#%lambda #t
      (|c1_r2er7Wj3_| |c2_r2Uu9tj3_| . args_r2yyb0j3_)
      ()
      (apply char=?
             (char-downcase |c1_r2er7Wj3_|)
             (char-downcase |c2_r2Uu9tj3_|)
             (map char-downcase args_r2yyb0j3_)))))
(#%program
  ((char-ci=? . 1)
   (|c2_r2Wj3Qk3_| . 2)
   (|c1_r2An5nk3_| . 2)
   (char-ci>? . 1))
  ()
  (char-ci=? char-ci>?)
  (#%define char-ci>=?
    (#%lambda #t
      (|c1_r2An5nk3_| |c2_r2Wj3Qk3_|)
      ()
      (#%if (char-ci>? |c1_r2An5nk3_| |c2_r2Wj3Qk3_|)
        #t
        (char-ci=? |c1_r2An5nk3_| |c2_r2Wj3Qk3_|)))))
(#%program
  ((char-ci=? . 1)
   (|c2_r2Cc_Jl3_| . 2)
   (c1_r2gg1hl3_ . 2)
   (char-ci<? . 1))
  ()
  (char-ci=? char-ci<?)
  (#%define char-ci<=?
    (#%lambda #t
      (c1_r2gg1hl3_ |c2_r2Cc_Jl3_|)
      ()
      (#%if (char-ci<? c1_r2gg1hl3_ |c2_r2Cc_Jl3_|)
        #t
        (char-ci=? c1_r2gg1hl3_ |c2_r2Cc_Jl3_|)))))
(#%program
  ((|c_r2Y8Zam3_| . 2) (char<? . 2))
  ()
  (char<?)
  (#%define char-alphabetic?
    (#%lambda #t
      (|c_r2Y8Zam3_|)
      ()
      (#%if (char<? #\@ |c_r2Y8Zam3_| #\[)
        #t
        (char<? #\` |c_r2Y8Zam3_| #\{)))))
(#%program
  ((|c_r2i5XDm3_| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-numeric?
    (#%lambda #t
      (|c_r2i5XDm3_|)
      ()
      (char<? #\/ |c_r2i5XDm3_| #\:))))
(#%program
  ((|c_r2E1V4n3_| . 4) (char=? . 4))
  ()
  (char=?)
  (#%define char-whitespace?
    (#%lambda #t
      (|c_r2E1V4n3_|)
      ()
      (#%if (char=? |c_r2E1V4n3_| #\space)
        #t
        (#%if (char=? |c_r2E1V4n3_| #\tab)
          #t
          (#%if (char=? |c_r2E1V4n3_| #\newline)
            #t
            (char=? |c_r2E1V4n3_| #\return)))))))
(#%program
  ((|c_r2-ZSxn3_| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-upper-case?
    (#%lambda #t
      (|c_r2-ZSxn3_|)
      ()
      (char<? #\@ |c_r2-ZSxn3_| #\[))))
(#%program
  ((|c_r2kWQ-n3_| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-lower-case?
    (#%lambda #t
      (|c_r2kWQ-n3_|)
      ()
      (char<? #\` |c_r2kWQ-n3_| #\{))))
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
   (|newstr_r22EGfq3_| . 1)
   (|str_r2IHIOp3_| . 3)
   (string-upcase . 1)
   (make-string . 2)
   (string-length . 4)
   (char-downcase . 1)
   (|newstr_r2mLKlp3_| . 1)
   (|str_r20PMUo3_| . 3)
   (string-downcase . 1)
   (+ . 1)
   (|string-map_r2GSOro3_| . 3)
   (|strsrc_r2oAEIq3_| . 2)
   (string-ref . 1)
   (|proc_r24tACr3_| . 2)
   (|strdst_r2KwC9r3_| . 3)
   (string-set! . 1)
   (|l_r2Mlwws3_| . 2)
   (n_r2qpy3s3_ . 4)
   (< . 1))
  ((string-upcase . 1)
   (string-downcase . 1)
   (|string-map_r2GSOro3_| . 1))
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
    ((|string-map_r2GSOro3_|
       (#%lambda #t
         (|strsrc_r2oAEIq3_|
           |strdst_r2KwC9r3_|
           |proc_r24tACr3_|
           n_r2qpy3s3_
           |l_r2Mlwws3_|)
         (|string-map_r2GSOro3_|)
         (#%if (< n_r2qpy3s3_ |l_r2Mlwws3_|)
           (#%begin
             (string-set!
               |strdst_r2KwC9r3_|
               n_r2qpy3s3_
               (|proc_r24tACr3_|
                 (string-ref |strsrc_r2oAEIq3_| n_r2qpy3s3_)))
             (|string-map_r2GSOro3_|
               |strsrc_r2oAEIq3_|
               |strdst_r2KwC9r3_|
               |proc_r24tACr3_|
               (+ n_r2qpy3s3_ 1)
               |l_r2Mlwws3_|))
           |strdst_r2KwC9r3_|))))
    ()
    (#%begin
      (#%set! string-downcase
        (#%lambda #t
          (|str_r20PMUo3_|)
          (|string-map_r2GSOro3_|)
          ((#%lambda #t
             (|newstr_r2mLKlp3_|)
             (|str_r20PMUo3_| |string-map_r2GSOro3_|)
             (|string-map_r2GSOro3_|
               |str_r20PMUo3_|
               |newstr_r2mLKlp3_|
               char-downcase
               0
               (string-length |str_r20PMUo3_|)))
           (make-string (string-length |str_r20PMUo3_|)))))
      (#%set! string-upcase
        (#%lambda #t
          (|str_r2IHIOp3_|)
          (|string-map_r2GSOro3_|)
          ((#%lambda #t
             (|newstr_r22EGfq3_|)
             (|str_r2IHIOp3_| |string-map_r2GSOro3_|)
             (|string-map_r2GSOro3_|
               |str_r2IHIOp3_|
               |newstr_r22EGfq3_|
               char-upcase
               0
               (string-length |str_r2IHIOp3_|)))
           (make-string (string-length |str_r2IHIOp3_|))))))))
(#%program
  ((equal? . 1))
  ()
  (equal?)
  (#%define string=? equal?))
(#%program
  ((|s2_r2OaqTt3_| . 1)
   (s1_r2sesqt3_ . 1)
   (string->list . 2)
   (car . 2)
   (cdr . 2)
   (|s<?_r26iuZs3_| . 2)
   (char>? . 1)
   (|c2_r2aYhHv3_| . 2)
   (|c1_r2Q_jev3_| . 2)
   (char<? . 1)
   (|s2_r2u3mNu3_| . 4)
   (not . 1)
   (s1_r287oku3_ . 3)
   (null? . 3))
  ((|s<?_r26iuZs3_| . 1))
  (string->list car char<? cdr char>? not null?)
  (#%define string<?
    (#%letrec #t
      ((|s<?_r26iuZs3_|
         (#%lambda #t
           (s1_r287oku3_ |s2_r2u3mNu3_|)
           (|s<?_r26iuZs3_|)
           (#%if (null? s1_r287oku3_)
             (not (null? |s2_r2u3mNu3_|))
             (#%if (null? |s2_r2u3mNu3_|)
               #f
               ((#%lambda #t
                  (|c1_r2Q_jev3_| |c2_r2aYhHv3_|)
                  (|s2_r2u3mNu3_| s1_r287oku3_ |s<?_r26iuZs3_|)
                  (#%if (char<? |c1_r2Q_jev3_| |c2_r2aYhHv3_|)
                    #t
                    (#%if (char>? |c1_r2Q_jev3_| |c2_r2aYhHv3_|)
                      #f
                      (|s<?_r26iuZs3_|
                        (cdr s1_r287oku3_)
                        (cdr |s2_r2u3mNu3_|)))))
                (car s1_r287oku3_)
                (car |s2_r2u3mNu3_|)))))))
      ()
      (#%lambda #t
        (s1_r2sesqt3_ |s2_r2OaqTt3_|)
        (|s<?_r26iuZs3_|)
        (|s<?_r26iuZs3_|
          (string->list s1_r2sesqt3_)
          (string->list |s2_r2OaqTt3_|))))))
(#%program
  ((|s2_r2cNb2x3_| . 1)
   (|s1_r2SQdBw3_| . 1)
   (string->list . 2)
   (car . 2)
   (cdr . 2)
   (|s>?_r2wUf8w3_| . 2)
   (char<? . 1)
   (|c2_r2Ay3Sy3_| . 2)
   (|c1_r2eC5py3_| . 2)
   (char>? . 1)
   (|s1_r2yJ9vx3_| . 4)
   (not . 1)
   (|s2_r2UF7Yx3_| . 3)
   (null? . 3))
  ((|s>?_r2wUf8w3_| . 1))
  (string->list car char>? cdr char<? not null?)
  (#%define string>?
    (#%letrec #t
      ((|s>?_r2wUf8w3_|
         (#%lambda #t
           (|s1_r2yJ9vx3_| |s2_r2UF7Yx3_|)
           (|s>?_r2wUf8w3_|)
           (#%if (null? |s2_r2UF7Yx3_|)
             (not (null? |s1_r2yJ9vx3_|))
             (#%if (null? |s1_r2yJ9vx3_|)
               #f
               ((#%lambda #t
                  (|c1_r2eC5py3_| |c2_r2Ay3Sy3_|)
                  (|s2_r2UF7Yx3_| |s1_r2yJ9vx3_| |s>?_r2wUf8w3_|)
                  (#%if (char>? |c1_r2eC5py3_| |c2_r2Ay3Sy3_|)
                    #t
                    (#%if (char<? |c1_r2eC5py3_| |c2_r2Ay3Sy3_|)
                      #f
                      (|s>?_r2wUf8w3_|
                        (cdr |s1_r2yJ9vx3_|)
                        (cdr |s2_r2UF7Yx3_|)))))
                (car |s1_r2yJ9vx3_|)
                (car |s2_r2UF7Yx3_|)))))))
      ()
      (#%lambda #t
        (|s1_r2SQdBw3_| |s2_r2cNb2x3_|)
        (|s>?_r2wUf8w3_|)
        (|s>?_r2wUf8w3_|
          (string->list |s1_r2SQdBw3_|)
          (string->list |s2_r2cNb2x3_|))))))
(#%program
  ((string=? . 1)
   (|s2_r2gr_Lz3_| . 2)
   (|s1_r2Wu1jz3_| . 2)
   (string<? . 1))
  ()
  (string=? string<?)
  (#%define string<=?
    (#%lambda #t
      (|s1_r2Wu1jz3_| |s2_r2gr_Lz3_|)
      ()
      (#%if (string<? |s1_r2Wu1jz3_| |s2_r2gr_Lz3_|)
        #t
        (string=? |s1_r2Wu1jz3_| |s2_r2gr_Lz3_|)))))
(#%program
  ((string=? . 1)
   (|s2_r2YjXFA3_| . 2)
   (|s1_r2CnZcA3_| . 2)
   (string>? . 1))
  ()
  (string=? string>?)
  (#%define string>=?
    (#%lambda #t
      (|s1_r2CnZcA3_| |s2_r2YjXFA3_|)
      ()
      (#%if (string>? |s1_r2CnZcA3_| |s2_r2YjXFA3_|)
        #t
        (string=? |s1_r2CnZcA3_| |s2_r2YjXFA3_|)))))
(#%program
  ((|s2_r2EcTzB3_| . 1)
   (|s1_r2igV6B3_| . 1)
   (string-downcase . 2)
   (string=? . 1))
  ()
  (string-downcase string=?)
  (#%define string-ci=?
    (#%lambda #t
      (|s1_r2igV6B3_| |s2_r2EcTzB3_|)
      ()
      (string=?
        (string-downcase |s1_r2igV6B3_|)
        (string-downcase |s2_r2EcTzB3_|)))))
(#%program
  ((|s2_r2k5PtC3_| . 1)
   (|s1_r2-8R0C3_| . 1)
   (string-downcase . 2)
   (string<? . 1))
  ()
  (string-downcase string<?)
  (#%define string-ci<?
    (#%lambda #t
      (|s1_r2-8R0C3_| |s2_r2k5PtC3_|)
      ()
      (string<?
        (string-downcase |s1_r2-8R0C3_|)
        (string-downcase |s2_r2k5PtC3_|)))))
(#%program
  ((|s2_r20-KnD3_| . 1)
   (|s1_r2G1NWC3_| . 1)
   (string-downcase . 2)
   (string>? . 1))
  ()
  (string-downcase string>?)
  (#%define string-ci>?
    (#%lambda #t
      (|s1_r2G1NWC3_| |s2_r20-KnD3_|)
      ()
      (string>?
        (string-downcase |s1_r2G1NWC3_|)
        (string-downcase |s2_r20-KnD3_|)))))
(#%program
  ((|s2_r2ISGhE3_| . 1)
   (|s1_r2mWIQD3_| . 1)
   (string-downcase . 2)
   (string>=? . 1))
  ()
  (string-downcase string>=?)
  (#%define string-ci>=?
    (#%lambda #t
      (|s1_r2mWIQD3_| |s2_r2ISGhE3_|)
      ()
      (string>=?
        (string-downcase |s1_r2mWIQD3_|)
        (string-downcase |s2_r2ISGhE3_|)))))
(#%program
  ((|s2_r2oLCbF3_| . 1)
   (|s1_r22PEKE3_| . 1)
   (string-downcase . 2)
   (string<=? . 1))
  ()
  (string-downcase string<=?)
  (#%define string-ci<=?
    (#%lambda #t
      (|s1_r22PEKE3_| |s2_r2oLCbF3_|)
      ()
      (string<=?
        (string-downcase |s1_r22PEKE3_|)
        (string-downcase |s2_r2oLCbF3_|)))))
(#%program
  ((- . 1)
   (make-string . 1)
   (|end_r2Mwu_G3_| . 2)
   (|start_r2qAwyG3_| . 2)
   (|newstr_r26tssH3_| . 2)
   (|str_r24Ey5G3_| . 1)
   (+ . 2)
   (|fill-string_r2KHAEF3_| . 2)
   (|sstr_r2spqVH3_| . 2)
   (string-ref . 1)
   (|n_r28imPI3_| . 2)
   (|dstr_r2OlomI3_| . 2)
   (string-set! . 1)
   (|e_r2QaiJJ3_| . 2)
   (|s_r2uekgJ3_| . 3)
   (< . 1))
  ((|fill-string_r2KHAEF3_| . 1))
  (make-string - string-ref string-set! + <)
  (#%define substring
    (#%letrec #t
      ((|fill-string_r2KHAEF3_|
         (#%lambda #t
           (|sstr_r2spqVH3_|
             |dstr_r2OlomI3_|
             |n_r28imPI3_|
             |s_r2uekgJ3_|
             |e_r2QaiJJ3_|)
           (|fill-string_r2KHAEF3_|)
           (#%if (< |s_r2uekgJ3_| |e_r2QaiJJ3_|)
             (#%begin
               (string-set!
                 |dstr_r2OlomI3_|
                 |n_r28imPI3_|
                 (string-ref |sstr_r2spqVH3_| |s_r2uekgJ3_|))
               (|fill-string_r2KHAEF3_|
                 |sstr_r2spqVH3_|
                 |dstr_r2OlomI3_|
                 (+ |n_r28imPI3_| 1)
                 (+ |s_r2uekgJ3_| 1)
                 |e_r2QaiJJ3_|))
             #!void))))
      ()
      (#%lambda #t
        (|str_r24Ey5G3_|
          |start_r2qAwyG3_|
          |end_r2Mwu_G3_|)
        (|fill-string_r2KHAEF3_|)
        ((#%lambda #t
           (|newstr_r26tssH3_|)
           (|end_r2Mwu_G3_|
             |start_r2qAwyG3_|
             |str_r24Ey5G3_|
             |fill-string_r2KHAEF3_|)
           (#%begin
             (|fill-string_r2KHAEF3_|
               |str_r24Ey5G3_|
               |newstr_r26tssH3_|
               0
               |start_r2qAwyG3_|
               |end_r2Mwu_G3_|)
             |newstr_r26tssH3_|))
         (make-string
           (- |end_r2Mwu_G3_| |start_r2qAwyG3_|)))))))
(#%program
  ((- . 1)
   (cdr . 1)
   (list-ref . 1)
   (|list_r2a7gaK3_| . 2)
   (car . 1)
   (|n_r2w3eDK3_| . 2)
   (zero? . 1))
  ()
  (list-ref cdr - car zero?)
  (#%define list-ref
    (#%lambda #t
      (|list_r2a7gaK3_| |n_r2w3eDK3_|)
      ()
      (#%if (zero? |n_r2w3eDK3_|)
        (car |list_r2a7gaK3_|)
        (list-ref
          (cdr |list_r2a7gaK3_|)
          (- |n_r2w3eDK3_| 1))))))
(#%program
  ((|args_r2S_b4L3_| . 1)
   (|k_r2cY9xL3_| . 1)
   (apply . 1)
   (call-with-current-continuation . 1))
  ()
  (apply call-with-current-continuation)
  (#%define values
    (#%lambda #t
      |args_r2S_b4L3_|
      ()
      (call-with-current-continuation
        (#%lambda #t
          (|k_r2cY9xL3_|)
          (|args_r2S_b4L3_|)
          (apply |k_r2cY9xL3_| |args_r2S_b4L3_|))))))
