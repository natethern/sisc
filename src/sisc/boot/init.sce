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
   (|proc_Wi4o949IQ| . 2)
   (apply . 2)
   (cons . 1)
   (|lists_Wiovda8IQ| . 4)
   (|ls1_WiKrbD8IQ| . 2)
   (null? . 1))
  ((|lists_Wiovda8IQ| . 1))
  (cons map-car apply map-cdr for-each null?)
  (#%define for-each
    (#%lambda #t
      (|proc_Wi4o949IQ|
        |ls1_WiKrbD8IQ|
        .
        |lists_Wiovda8IQ|)
      ()
      (#%if (null? |ls1_WiKrbD8IQ|)
        #!void
        (#%begin
          (#%set! |lists_Wiovda8IQ|
            (cons |ls1_WiKrbD8IQ| |lists_Wiovda8IQ|))
          (apply |proc_Wi4o949IQ|
                 (map-car |lists_Wiovda8IQ|))
          (apply for-each
                 |proc_Wi4o949IQ|
                 (map-cdr |lists_Wiovda8IQ|)))))))
(#%program
  ((|x_Wiqk7x9IQ| . 1) (eq? . 1))
  ()
  (eq?)
  (#%define eof-object?
    (#%lambda #t
      (|x_Wiqk7x9IQ|)
      ()
      (eq? |x_Wiqk7x9IQ| #!eof))))
(#%program
  ((|x_WiMg5-9IQ| . 1))
  ()
  ()
  (#%define not
    (#%lambda #t
      (|x_WiMg5-9IQ|)
      ()
      (#%if |x_WiMg5-9IQ| #f #t))))
(#%program
  ((|port_Wi6d3raIQ| . 1)
   (display . 1)
   (apply . 1))
  ()
  (display apply)
  (#%define newline
    (#%lambda #t
      |port_Wi6d3raIQ|
      ()
      (apply display #\newline |port_Wi6d3raIQ|))))
(#%program
  ((|ls_WiO5_kbIQ| . 1)
   (car . 1)
   (cons . 1)
   (cdr . 1)
   (|iter_Wis91UaIQ| . 2)
   (|acc_Wiu-WecIQ| . 2)
   (|ls_Wi82ZNbIQ| . 3)
   (null? . 1))
  ((|iter_Wis91UaIQ| . 1))
  (cdr car cons null?)
  (#%define reverse
    (#%letrec #t
      ((|iter_Wis91UaIQ|
         (#%lambda #t
           (|ls_Wi82ZNbIQ| |acc_Wiu-WecIQ|)
           (|iter_Wis91UaIQ|)
           (#%if (null? |ls_Wi82ZNbIQ|)
             |acc_Wiu-WecIQ|
             (|iter_Wis91UaIQ|
               (cdr |ls_Wi82ZNbIQ|)
               (cons (car |ls_Wi82ZNbIQ|) |acc_Wiu-WecIQ|))))))
      ()
      (#%lambda #t
        (|ls_WiO5_kbIQ|)
        (|iter_Wis91UaIQ|)
        (|iter_Wis91UaIQ| |ls_WiO5_kbIQ| ())))))
(#%program
  ((|s_WiaTS8dIQ| . 1)
   (cdr . 1)
   (|d_WicIMveIQ| . 1)
   (|iter_WiQWUHcIQ| . 2)
   (set-cdr! . 1)
   (|r_WiSLO2eIQ| . 2)
   (|s_WiwPQBdIQ| . 4)
   (null? . 1))
  ((|iter_WiQWUHcIQ| . 1))
  (set-cdr! cdr null?)
  (#%define reverse!
    (#%letrec #t
      ((|iter_WiQWUHcIQ|
         (#%lambda #t
           (|s_WiwPQBdIQ| |r_WiSLO2eIQ|)
           (|iter_WiQWUHcIQ|)
           (#%if (null? |s_WiwPQBdIQ|)
             |r_WiSLO2eIQ|
             ((#%lambda #t
                (|d_WicIMveIQ|)
                (|r_WiSLO2eIQ| |s_WiwPQBdIQ| |iter_WiQWUHcIQ|)
                (#%begin
                  (set-cdr! |s_WiwPQBdIQ| |r_WiSLO2eIQ|)
                  (|iter_WiQWUHcIQ| |d_WicIMveIQ| |s_WiwPQBdIQ|)))
              (cdr |s_WiwPQBdIQ|))))))
      ()
      (#%lambda #t
        (|s_WiaTS8dIQ|)
        (|iter_WiQWUHcIQ|)
        (|iter_WiQWUHcIQ| |s_WiaTS8dIQ| ())))))
(#%program
  ((cdr . 1)
   (map-car . 1)
   (caar . 1)
   (cons . 1)
   (|ls_WiyEKYeIQ| . 3)
   (null? . 1))
  ()
  (cons caar cdr map-car null?)
  (#%define map-car
    (#%lambda #t
      (|ls_WiyEKYeIQ|)
      ()
      (#%if (null? |ls_WiyEKYeIQ|)
        ()
        (cons (caar |ls_WiyEKYeIQ|)
              (map-car (cdr |ls_WiyEKYeIQ|)))))))
(#%program
  ((cdr . 1)
   (map-cdr . 1)
   (cdar . 1)
   (cons . 1)
   (|ls_WiUAIpfIQ| . 3)
   (null? . 1))
  ()
  (cons cdar cdr map-cdr null?)
  (#%define map-cdr
    (#%lambda #t
      (|ls_WiUAIpfIQ|)
      ()
      (#%if (null? |ls_WiUAIpfIQ|)
        ()
        (cons (cdar |ls_WiUAIpfIQ|)
              (map-cdr (cdr |ls_WiUAIpfIQ|)))))))
(#%program
  ((|list1_WigmAdhIQ| . 2)
   (|proc_WiCiyGhIQ| . 2)
   (|lists_WiWpCMgIQ| . 2)
   (map-car . 1)
   (apply . 1)
   (|lists_WiGYlokIQ| . 2)
   (map-cdr . 1)
   (|proc_Wi-3qujIQ| . 2)
   (|loop_WiAtEjgIQ| . 2)
   (|c_Wi0VjRkIQ| . 2)
   (|list1_Wik0oXjIQ| . 3)
   (car . 2)
   (cons . 2)
   (cdr . 2)
   (|proc_WiYew7iIQ| . 2)
   (|map1_WiexGSfIQ| . 2)
   (|acc_WiE7s1jIQ| . 2)
   (reverse . 2)
   (|list_WiibuAiIQ| . 3)
   (null? . 3))
  ((|loop_WiAtEjgIQ| . 1) (|map1_WiexGSfIQ| . 1))
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
      ((|map1_WiexGSfIQ|
         (#%lambda #t
           (|proc_WiYew7iIQ|
             |list_WiibuAiIQ|
             |acc_WiE7s1jIQ|)
           (|map1_WiexGSfIQ|)
           (#%if (null? |list_WiibuAiIQ|)
             (reverse |acc_WiE7s1jIQ|)
             (|map1_WiexGSfIQ|
               |proc_WiYew7iIQ|
               (cdr |list_WiibuAiIQ|)
               (cons (|proc_WiYew7iIQ| (car |list_WiibuAiIQ|))
                     |acc_WiE7s1jIQ|)))))
       (|loop_WiAtEjgIQ|
         (#%lambda #t
           (|proc_Wi-3qujIQ|
             |list1_Wik0oXjIQ|
             |lists_WiGYlokIQ|
             |c_Wi0VjRkIQ|)
           (|loop_WiAtEjgIQ|)
           (#%if (null? |list1_Wik0oXjIQ|)
             (reverse |c_Wi0VjRkIQ|)
             (|loop_WiAtEjgIQ|
               |proc_Wi-3qujIQ|
               (cdr |list1_Wik0oXjIQ|)
               (map-cdr |lists_WiGYlokIQ|)
               (cons (apply |proc_Wi-3qujIQ|
                            (car |list1_Wik0oXjIQ|)
                            (map-car |lists_WiGYlokIQ|))
                     |c_Wi0VjRkIQ|))))))
      ()
      (#%lambda #t
        (|proc_WiCiyGhIQ|
          |list1_WigmAdhIQ|
          .
          |lists_WiWpCMgIQ|)
        (|loop_WiAtEjgIQ| |map1_WiexGSfIQ|)
        (#%if (null? |lists_WiWpCMgIQ|)
          (|map1_WiexGSfIQ|
            |proc_WiCiyGhIQ|
            |list1_WigmAdhIQ|
            ())
          (|loop_WiAtEjgIQ|
            |proc_WiCiyGhIQ|
            |list1_WigmAdhIQ|
            |lists_WiWpCMgIQ|
            ()))))))
(#%program
  ((|x_Wi2KdcmIQ| . 1)
   (|g_WiINfLlIQ| . 1)
   (|f_WimRhilIQ| . 1))
  ()
  ()
  (#%define compose2
    (#%lambda #t
      (|f_WimRhilIQ| |g_WiINfLlIQ|)
      ()
      (#%lambda #t
        (|x_Wi2KdcmIQ|)
        (|g_WiINfLlIQ| |f_WimRhilIQ|)
        (|f_WimRhilIQ| (|g_WiINfLlIQ| |x_Wi2KdcmIQ|))))))
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
  ((|list_WiSWMxsIQ| . 1)
   (|obj_Wiw-O4sIQ| . 1)
   (member . 1)
   (|list_Wia2RDrIQ| . 1)
   (|obj_WiQ5TarIQ| . 1)
   (memv . 1)
   (|list_Wiu9VJqIQ| . 1)
   (|obj_Wi8dXgqIQ| . 1)
   (memq . 1)
   (|alist_WiOgZPpIQ| . 1)
   (|obj_Wisk_mpIQ| . 1)
   (equal? . 2)
   (assoc . 1)
   (|alist_Wi6o1WoIQ| . 1)
   (|obj_WiMr3toIQ| . 1)
   (eqv? . 2)
   (assv . 1)
   (|alist_Wiqv50oIQ| . 1)
   (|obj_Wi4z7znIQ| . 1)
   (eq? . 2)
   (assq . 1)
   (|memn_WiKC96nIQ| . 4)
   (|obj_WiAECOuIQ| . 2)
   (|n_WieIEluIQ| . 2)
   (|list_WiWAAfvIQ| . 4)
   (cdr . 2)
   (|assn_WioGbFmIQ| . 4)
   (car . 2)
   (|obj_WiyPIrtIQ| . 2)
   (caar . 1)
   (|n_WicTK-sIQ| . 2)
   (|alist_WiULGUtIQ| . 4)
   (null? . 2))
  ((member . 1)
   (memv . 1)
   (memq . 1)
   (assoc . 1)
   (assv . 1)
   (assq . 1)
   (|memn_WiKC96nIQ| . 1)
   (|assn_WioGbFmIQ| . 1))
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
    ((|assn_WioGbFmIQ|
       (#%lambda #t
         (|n_WicTK-sIQ| |obj_WiyPIrtIQ| |alist_WiULGUtIQ|)
         (|assn_WioGbFmIQ|)
         (#%if (null? |alist_WiULGUtIQ|)
           #f
           (#%if (|n_WicTK-sIQ|
                   (caar |alist_WiULGUtIQ|)
                   |obj_WiyPIrtIQ|)
             (car |alist_WiULGUtIQ|)
             (|assn_WioGbFmIQ|
               |n_WicTK-sIQ|
               |obj_WiyPIrtIQ|
               (cdr |alist_WiULGUtIQ|))))))
     (|memn_WiKC96nIQ|
       (#%lambda #t
         (|n_WieIEluIQ| |obj_WiAECOuIQ| |list_WiWAAfvIQ|)
         (|memn_WiKC96nIQ|)
         (#%if (null? |list_WiWAAfvIQ|)
           #f
           (#%if (|n_WieIEluIQ|
                   (car |list_WiWAAfvIQ|)
                   |obj_WiAECOuIQ|)
             |list_WiWAAfvIQ|
             (|memn_WiKC96nIQ|
               |n_WieIEluIQ|
               |obj_WiAECOuIQ|
               (cdr |list_WiWAAfvIQ|)))))))
    ()
    (#%begin
      (#%set! assq
        (#%lambda #t
          (|obj_Wi4z7znIQ| |alist_Wiqv50oIQ|)
          (|assn_WioGbFmIQ|)
          (|assn_WioGbFmIQ|
            eq?
            |obj_Wi4z7znIQ|
            |alist_Wiqv50oIQ|)))
      (#%set! assv
        (#%lambda #t
          (|obj_WiMr3toIQ| |alist_Wi6o1WoIQ|)
          (|assn_WioGbFmIQ|)
          (|assn_WioGbFmIQ|
            eqv?
            |obj_WiMr3toIQ|
            |alist_Wi6o1WoIQ|)))
      (#%set! assoc
        (#%lambda #t
          (|obj_Wisk_mpIQ| |alist_WiOgZPpIQ|)
          (|assn_WioGbFmIQ|)
          (|assn_WioGbFmIQ|
            equal?
            |obj_Wisk_mpIQ|
            |alist_WiOgZPpIQ|)))
      (#%set! memq
        (#%lambda #t
          (|obj_Wi8dXgqIQ| |list_Wiu9VJqIQ|)
          (|memn_WiKC96nIQ|)
          (|memn_WiKC96nIQ|
            eq?
            |obj_Wi8dXgqIQ|
            |list_Wiu9VJqIQ|)))
      (#%set! memv
        (#%lambda #t
          (|obj_WiQ5TarIQ| |list_Wia2RDrIQ|)
          (|memn_WiKC96nIQ|)
          (|memn_WiKC96nIQ|
            eqv?
            |obj_WiQ5TarIQ|
            |list_Wia2RDrIQ|)))
      (#%set! member
        (#%lambda #t
          (|obj_Wiw-O4sIQ| |list_WiSWMxsIQ|)
          (|memn_WiKC96nIQ|)
          (|memn_WiKC96nIQ|
            equal?
            |obj_Wiw-O4sIQ|
            |list_WiSWMxsIQ|))))))
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
   (|ls2_WiCtw9wIQ| . 2)
   (|ls1_WigxyIvIQ| . 3)
   (null? . 1))
  ()
  (cons car cdr append2 null?)
  (#%define append2
    (#%lambda #t
      (|ls1_WigxyIvIQ| |ls2_WiCtw9wIQ|)
      ()
      (#%if (null? |ls1_WigxyIvIQ|)
        |ls2_WiCtw9wIQ|
        (cons (car |ls1_WigxyIvIQ|)
              (append2 (cdr |ls1_WigxyIvIQ|) |ls2_WiCtw9wIQ|))))))
(#%program
  ((append2 . 1))
  ()
  (append2)
  (#%define append append2))
(#%program
  ((length . 1)
   (make-string . 1)
   (|l_Wiims3xIQ| . 2)
   (+ . 1)
   (cdr . 1)
   (|l2s_WiYpuCwIQ| . 2)
   (car . 1)
   (|n_WikbmqyIQ| . 2)
   (string-set! . 1)
   (|s_Wi-eoZxIQ| . 3)
   (|l_WiEiqwxIQ| . 3)
   (null? . 1))
  ((|l2s_WiYpuCwIQ| . 1))
  (make-string length car string-set! + cdr null?)
  (#%define list->string
    (#%letrec #t
      ((|l2s_WiYpuCwIQ|
         (#%lambda #t
           (|l_WiEiqwxIQ| |s_Wi-eoZxIQ| |n_WikbmqyIQ|)
           (|l2s_WiYpuCwIQ|)
           (#%if (null? |l_WiEiqwxIQ|)
             |s_Wi-eoZxIQ|
             (#%begin
               (string-set!
                 |s_Wi-eoZxIQ|
                 |n_WikbmqyIQ|
                 (car |l_WiEiqwxIQ|))
               (|l2s_WiYpuCwIQ|
                 (cdr |l_WiEiqwxIQ|)
                 |s_Wi-eoZxIQ|
                 (+ |n_WikbmqyIQ| 1)))))))
      ()
      (#%lambda #t
        (|l_Wiims3xIQ|)
        (|l2s_WiYpuCwIQ|)
        (|l2s_WiYpuCwIQ|
          |l_Wiims3xIQ|
          (make-string (length |l_Wiims3xIQ|))
          0)))))
(#%program
  ((string-length . 1)
   (|s_Wi04ikzIQ| . 2)
   (- . 2)
   (string-ref . 1)
   (cons . 1)
   (|s_Wim0gNzIQ| . 2)
   (|s2l_WiG7kTyIQ| . 2)
   (|h_WiIYdeAIQ| . 2)
   (|n_Wi2VbHAIQ| . 3)
   (< . 1))
  ((|s2l_WiG7kTyIQ| . 1))
  (string-length string-ref cons - <)
  (#%define string->list
    (#%letrec #t
      ((|s2l_WiG7kTyIQ|
         (#%lambda #t
           (|s_Wim0gNzIQ| |h_WiIYdeAIQ| |n_Wi2VbHAIQ|)
           (|s2l_WiG7kTyIQ|)
           (#%if (< |n_Wi2VbHAIQ| 0)
             |h_WiIYdeAIQ|
             (|s2l_WiG7kTyIQ|
               |s_Wim0gNzIQ|
               (cons (string-ref |s_Wim0gNzIQ| |n_Wi2VbHAIQ|)
                     |h_WiIYdeAIQ|)
               (- |n_Wi2VbHAIQ| 1))))))
      ()
      (#%lambda #t
        (|s_Wi04ikzIQ|)
        (|s2l_WiG7kTyIQ|)
        (|s2l_WiG7kTyIQ|
          |s_Wi04ikzIQ|
          ()
          (- (string-length |s_Wi04ikzIQ|) 1))))))
(#%program
  ((|elems_WioR98BIQ| . 1) (list->vector . 1))
  ()
  (list->vector)
  (#%define vector
    (#%lambda #t
      |elems_WioR98BIQ|
      ()
      (list->vector |elems_WioR98BIQ|))))
(#%program
  ((|elems_WiKN7BBIQ| . 1) (list->string . 1))
  ()
  (list->string)
  (#%define string
    (#%lambda #t
      |elems_WiKN7BBIQ|
      ()
      (list->string |elems_WiKN7BBIQ|))))
(#%program
  ((_make-parameter . 1))
  ()
  (_make-parameter)
  (#%define current-url (_make-parameter "file:.")))
(#%program
  ((car . 1)
   (string-length . 1)
   (string-append . 1)
   (|l_WiMC1YCIQ| . 1)
   (- . 1)
   (|v_WiqG3vCIQ| . 4)
   (string-ref . 1)
   (eqv? . 1)
   (current-url . 3)
   (normalize-url . 2)
   (|rest_Wi4K52CIQ| . 2)
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
      |rest_Wi4K52CIQ|
      ()
      (#%if (null? |rest_Wi4K52CIQ|)
        (normalize-url (current-url) ".")
        (current-url
          (normalize-url
            (current-url)
            ((#%lambda #t
               (|v_WiqG3vCIQ|)
               ()
               ((#%lambda #t
                  (|l_WiMC1YCIQ|)
                  (|v_WiqG3vCIQ|)
                  (#%if (eqv? (string-ref |v_WiqG3vCIQ| (- |l_WiMC1YCIQ| 1))
                              #\/)
                    |v_WiqG3vCIQ|
                    (string-append |v_WiqG3vCIQ| "/")))
                (string-length |v_WiqG3vCIQ|)))
             (car |rest_Wi4K52CIQ|))))))))
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
   (|extension_WiukTcFIQ| . 1)
   (string-downcase . 1)
   (string->symbol . 1)
   (|_load_Wi8oVLEIQ| . 1)
   (cdr . 1)
   (|t_WiQgRFFIQ| . 2)
   (file-handler . 1)
   (|thunk_WiOrXiEIQ| . 1)
   (cons . 2)
   (|*file-handlers*_Wi6z_oDIQ| . 4)
   (|extension_WisvZRDIQ| . 2)
   (assq . 2)
   (add-file-handler . 1))
  ((file-handler . 1)
   (|*file-handlers*_Wi6z_oDIQ| . 1)
   (add-file-handler . 1))
  (cdr string->symbol
       string-downcase
       load
       file-handler
       cons
       assq
       add-file-handler)
  ((#%lambda #t
     (|*file-handlers*_Wi6z_oDIQ|)
     ()
     (#%begin
       (#%set! add-file-handler
         (#%lambda #t
           (|extension_WisvZRDIQ| |thunk_WiOrXiEIQ|)
           (|*file-handlers*_Wi6z_oDIQ|)
           (#%if (assq |extension_WisvZRDIQ|
                       |*file-handlers*_Wi6z_oDIQ|)
             #!void
             (#%set! |*file-handlers*_Wi6z_oDIQ|
               (cons (cons |extension_WisvZRDIQ| |thunk_WiOrXiEIQ|)
                     |*file-handlers*_Wi6z_oDIQ|)))))
       (#%set! file-handler
         ((#%lambda #t
            (|_load_Wi8oVLEIQ|)
            (|*file-handlers*_Wi6z_oDIQ|)
            (#%lambda #t
              (|extension_WiukTcFIQ|)
              (|_load_Wi8oVLEIQ| |*file-handlers*_Wi6z_oDIQ|)
              ((#%lambda #t
                 (|t_WiQgRFFIQ|)
                 (|_load_Wi8oVLEIQ|)
                 (#%if |t_WiQgRFFIQ|
                   (cdr |t_WiQgRFFIQ|)
                   |_load_Wi8oVLEIQ|))
               (assq (string->symbol
                       (string-downcase |extension_WiukTcFIQ|))
                     |*file-handlers*_Wi6z_oDIQ|))))
          load))))
   ()))
(#%program
  ((|rest_Wiw9NzGIQ| . 1)
   (|file_WiS5L0HIQ| . 1)
   (current-url . 1)
   (normalize-url . 1)
   (|proc_WiadP6GIQ| . 1)
   (apply . 1))
  ()
  (apply current-url normalize-url)
  (#%define make-io-proc
    (#%lambda #t
      (|proc_WiadP6GIQ|)
      ()
      (#%lambda #t
        (|file_WiS5L0HIQ| . |rest_Wiw9NzGIQ|)
        (|proc_WiadP6GIQ|)
        (apply |proc_WiadP6GIQ|
               (normalize-url (current-url) |file_WiS5L0HIQ|)
               |rest_Wiw9NzGIQ|)))))
(#%program
  ((|url_WiCEuEKIQ| . 1)
   (string->list . 1)
   (reverse! . 1)
   (cons . 1)
   (cdr . 1)
   (|loop_WiYAs5LIQ| . 2)
   (|acc_WiEto_LIQ| . 2)
   (list->string . 1)
   (car . 2)
   (equal? . 1)
   (|x_WiixqyLIQ| . 4)
   (null? . 1)
   (void . 1)
   (|file-extension_Wic2JtHIQ| . 1)
   (|fe_WigIwbKIQ| . 2)
   (file-handler . 1)
   (|e_WiAPAhJIQ| . 1)
   (|m_WieTCQIIQ| . 1)
   (|fk_WiWLyKJIQ| . 1)
   (call-with-failure-continuation . 1)
   (with-failure-continuation . 1)
   (|file_Wiy-GWHIQ| . 1)
   (|previous-url_WiUWEnIIQ| . 3)
   (normalize-url . 1)
   (current-url . 6)
   (load . 1)
   (open-output-file . 2)
   (open-source-input-file . 2)
   (make-io-proc . 3)
   (open-input-file . 2))
  ((|loop_WiYAs5LIQ| . 1)
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
     (|file-extension_Wic2JtHIQ|)
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
           (|file_Wiy-GWHIQ|)
           (|file-extension_Wic2JtHIQ|)
           (#%begin
             ((#%lambda #t
                (|previous-url_WiUWEnIIQ|)
                (|file_Wiy-GWHIQ| |file-extension_Wic2JtHIQ|)
                (#%begin
                  (current-url
                    (normalize-url
                      |previous-url_WiUWEnIIQ|
                      |file_Wiy-GWHIQ|))
                  (with-failure-continuation
                    (#%lambda #t
                      (|m_WieTCQIIQ| |e_WiAPAhJIQ|)
                      (|previous-url_WiUWEnIIQ|)
                      (#%begin
                        (current-url |previous-url_WiUWEnIIQ|)
                        (call-with-failure-continuation
                          (#%lambda #t
                            (|fk_WiWLyKJIQ|)
                            (|e_WiAPAhJIQ| |m_WieTCQIIQ|)
                            (|fk_WiWLyKJIQ| |m_WieTCQIIQ| |e_WiAPAhJIQ|)))))
                    (#%lambda #t
                      ()
                      (|file-extension_Wic2JtHIQ|)
                      ((#%lambda #t
                         (|fe_WigIwbKIQ|)
                         ()
                         ((file-handler
                            (#%if |fe_WigIwbKIQ| |fe_WigIwbKIQ| "scm"))
                          (current-url)))
                       (|file-extension_Wic2JtHIQ| (current-url)))))
                  (current-url |previous-url_WiUWEnIIQ|)))
              (current-url))
             (void))))))
   (#%lambda #t
     (|url_WiCEuEKIQ|)
     ()
     ((#%letrec #t
        ((|loop_WiYAs5LIQ|
           (#%lambda #t
             (|x_WiixqyLIQ| |acc_WiEto_LIQ|)
             (|loop_WiYAs5LIQ|)
             (#%if (null? |x_WiixqyLIQ|)
               #f
               (#%if (equal? (car |x_WiixqyLIQ|) #\.)
                 (list->string |acc_WiEto_LIQ|)
                 (|loop_WiYAs5LIQ|
                   (cdr |x_WiixqyLIQ|)
                   (cons (car |x_WiixqyLIQ|) |acc_WiEto_LIQ|)))))))
        ()
        |loop_WiYAs5LIQ|)
      (reverse! (string->list |url_WiCEuEKIQ|))
      ()))))
(#%program
  ((|str_Wi-pmsMIQ| . 1)
   (load-native-library . 1)
   (native-library-binding-names . 1)
   (|binding-names_WiGiimNIQ| . 1)
   (|nl_WikmkVMIQ| . 2)
   (native-library-binding . 1)
   (|name_Wi0fgPNIQ| . 2)
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
      (|str_Wi-pmsMIQ|)
      ()
      ((#%lambda #t
         (|nl_WikmkVMIQ|)
         ()
         ((#%lambda #t
            (|binding-names_WiGiimNIQ|)
            (|nl_WikmkVMIQ|)
            (for-each
              (#%lambda #t
                (|name_Wi0fgPNIQ|)
                (|nl_WikmkVMIQ|)
                (putprop
                  |name_Wi0fgPNIQ|
                  (native-library-binding
                    |nl_WikmkVMIQ|
                    |name_Wi0fgPNIQ|)))
              |binding-names_WiGiimNIQ|))
          (native-library-binding-names |nl_WikmkVMIQ|)))
       (load-native-library |str_Wi-pmsMIQ|)))))
(#%program
  ((|lses_WiI7cJOIQ| . 5)
   (cdr . 3)
   (car . 3)
   (append2 . 1)
   (|real-append_WimbegOIQ| . 3)
   (apply . 3)
   (|ls1_Wio08DPIQ| . 3)
   (|lses_Wi24aaPIQ| . 4)
   (null? . 4))
  ((|real-append_WimbegOIQ| . 1))
  (apply cdr append2 car null?)
  (#%define append
    (#%letrec #t
      ((|real-append_WimbegOIQ|
         (#%lambda #t
           (|ls1_Wio08DPIQ| . |lses_Wi24aaPIQ|)
           (|real-append_WimbegOIQ|)
           (#%if (null? |lses_Wi24aaPIQ|)
             |ls1_Wio08DPIQ|
             (#%if (null? |ls1_Wio08DPIQ|)
               (apply |real-append_WimbegOIQ| |lses_Wi24aaPIQ|)
               (apply |real-append_WimbegOIQ|
                      (append2 |ls1_Wio08DPIQ| (car |lses_Wi24aaPIQ|))
                      (cdr |lses_Wi24aaPIQ|)))))))
      ()
      (#%lambda #t
        |lses_WiI7cJOIQ|
        (|real-append_WimbegOIQ|)
        (#%if (null? |lses_WiI7cJOIQ|)
          ()
          (#%if (null? (cdr |lses_WiI7cJOIQ|))
            (car |lses_WiI7cJOIQ|)
            (apply |real-append_WimbegOIQ|
                   (car |lses_WiI7cJOIQ|)
                   (cdr |lses_WiI7cJOIQ|))))))))
(#%program
  ((|x_WiKY54QIQ| . 2)
   (null? . 2)
   (|lag_WiMN_qRIQ| . 1)
   (cdr . 3)
   (|lp_Wi4V3xQIQ| . 2)
   (|lag_WiOCVNSIQ| . 2)
   (|x_WisGXkSIQ| . 2)
   (eq? . 1)
   (|x_Wi6KZTRIQ| . 3)
   (|x_WiqR1-QIQ| . 3)
   (pair? . 2))
  ((|lp_Wi4V3xQIQ| . 1))
  (pair? cdr eq? null?)
  (#%define proper-list?
    (#%lambda #t
      (|x_WiKY54QIQ|)
      ()
      ((#%letrec #t
         ((|lp_Wi4V3xQIQ|
            (#%lambda #t
              (|x_WiqR1-QIQ| |lag_WiMN_qRIQ|)
              (|lp_Wi4V3xQIQ|)
              (#%if (pair? |x_WiqR1-QIQ|)
                ((#%lambda #t
                   (|x_Wi6KZTRIQ|)
                   (|lag_WiMN_qRIQ| |lp_Wi4V3xQIQ|)
                   (#%if (pair? |x_Wi6KZTRIQ|)
                     ((#%lambda #t
                        (|x_WisGXkSIQ| |lag_WiOCVNSIQ|)
                        (|lp_Wi4V3xQIQ|)
                        (#%if (eq? |x_WisGXkSIQ| |lag_WiOCVNSIQ|)
                          #f
                          (|lp_Wi4V3xQIQ| |x_WisGXkSIQ| |lag_WiOCVNSIQ|)))
                      (cdr |x_Wi6KZTRIQ|)
                      (cdr |lag_WiMN_qRIQ|))
                     (null? |x_Wi6KZTRIQ|)))
                 (cdr |x_WiqR1-QIQ|))
                (null? |x_WiqR1-QIQ|)))))
         ()
         |lp_Wi4V3xQIQ|)
       |x_WiKY54QIQ|
       |x_WiKY54QIQ|))))
(#%program
  ((proper-list? . 1))
  ()
  (proper-list?)
  (#%define list? proper-list?))
(#%program
  ((|general-expt_Wi8zTeTIQ| . 1)
   (denominator . 1)
   (numerator . 1)
   (|rational-expt_WiuvRHTIQ| . 1)
   (integer? . 2)
   (rational? . 1)
   (|base_WiaoNBUIQ| . 9)
   (|exponent_WiwkL2VIQ| . 8)
   (|squaring_WiiIo1-IQ| . 3)
   (odd? . 1)
   (quotient . 1)
   (|loop_WigTuGYIQ| . 2)
   (|result_WiYLqAZIQ| . 3)
   (|rest_WiCPs7ZIQ| . 3)
   (zero? . 3)
   (ashl . 1)
   (= . 1)
   (exact? . 5)
   (abs . 1)
   (|base_WiA-yMXIQ| . 4)
   (|integer-expt_WiQrP8UIQ| . 2)
   (|exponent_WiWWwdYIQ| . 4)
   (negative? . 1)
   (|base-denominator_WiU5DSWIQ| . 1)
   (|exponent_Wie2BjXIQ| . 2)
   (|base-numerator_Wiy9FpWIQ| . 1)
   (expt . 2)
   (/ . 2)
   (|base_WiSgJvVIQ| . 1)
   (log . 1)
   (|exponent_WicdHYVIQ| . 1)
   (* . 3)
   (exp . 1))
  ((|loop_WigTuGYIQ| . 1)
   (|integer-expt_WiQrP8UIQ| . 1)
   (|rational-expt_WiuvRHTIQ| . 1)
   (|general-expt_Wi8zTeTIQ| . 1))
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
      ((|general-expt_Wi8zTeTIQ|
         (#%lambda #t
           (|base_WiSgJvVIQ| |exponent_WicdHYVIQ|)
           ()
           (exp (* |exponent_WicdHYVIQ| (log |base_WiSgJvVIQ|)))))
       (|rational-expt_WiuvRHTIQ|
         (#%lambda #t
           (|base-numerator_Wiy9FpWIQ|
             |base-denominator_WiU5DSWIQ|
             |exponent_Wie2BjXIQ|)
           ()
           (/ (expt |base-numerator_Wiy9FpWIQ|
                    |exponent_Wie2BjXIQ|)
              (expt |base-denominator_WiU5DSWIQ|
                    |exponent_Wie2BjXIQ|))))
       (|integer-expt_WiQrP8UIQ|
         (#%lambda #t
           (|base_WiA-yMXIQ| |exponent_WiWWwdYIQ|)
           (|integer-expt_WiQrP8UIQ|)
           (#%if (negative? |exponent_WiWWwdYIQ|)
             (/ (|integer-expt_WiQrP8UIQ|
                  |base_WiA-yMXIQ|
                  (abs |exponent_WiWWwdYIQ|)))
             (#%if (#%if (exact? |base_WiA-yMXIQ|)
                     (= |base_WiA-yMXIQ| 2)
                     #f)
               (ashl 1 |exponent_WiWWwdYIQ|)
               ((#%letrec #t
                  ((|loop_WigTuGYIQ|
                     (#%lambda #t
                       (|rest_WiCPs7ZIQ|
                         |result_WiYLqAZIQ|
                         |squaring_WiiIo1-IQ|)
                       (|loop_WigTuGYIQ|)
                       (#%if (zero? |rest_WiCPs7ZIQ|)
                         |result_WiYLqAZIQ|
                         (|loop_WigTuGYIQ|
                           (quotient |rest_WiCPs7ZIQ| 2)
                           (#%if (odd? |rest_WiCPs7ZIQ|)
                             (* |result_WiYLqAZIQ| |squaring_WiiIo1-IQ|)
                             |result_WiYLqAZIQ|)
                           (* |squaring_WiiIo1-IQ| |squaring_WiiIo1-IQ|))))))
                  ()
                  |loop_WigTuGYIQ|)
                |exponent_WiWWwdYIQ|
                1
                |base_WiA-yMXIQ|))))))
      ()
      (#%lambda #t
        (|base_WiaoNBUIQ| |exponent_WiwkL2VIQ|)
        (|integer-expt_WiQrP8UIQ|
          |rational-expt_WiuvRHTIQ|
          |general-expt_Wi8zTeTIQ|)
        (#%if (zero? |exponent_WiwkL2VIQ|)
          (#%if (exact? |exponent_WiwkL2VIQ|) 1 1.0)
          (#%if (zero? |base_WiaoNBUIQ|)
            (#%if (exact? |exponent_WiwkL2VIQ|)
              |base_WiaoNBUIQ|
              0.0)
            (#%if (#%if (exact? |base_WiaoNBUIQ|)
                    (#%if (rational? |base_WiaoNBUIQ|)
                      (#%if (integer? |base_WiaoNBUIQ|) #f #t)
                      #f)
                    #f)
              (|rational-expt_WiuvRHTIQ|
                (numerator |base_WiaoNBUIQ|)
                (denominator |base_WiaoNBUIQ|)
                |exponent_WiwkL2VIQ|)
              (#%if (#%if (exact? |exponent_WiwkL2VIQ|)
                      (integer? |exponent_WiwkL2VIQ|)
                      #f)
                (|integer-expt_WiQrP8UIQ|
                  |base_WiaoNBUIQ|
                  |exponent_WiwkL2VIQ|)
                (|general-expt_Wi8zTeTIQ|
                  |base_WiaoNBUIQ|
                  |exponent_WiwkL2VIQ|)))))))))
(#%program
  ((- . 1)
   (|tmp_WiGtgR_IQ| . 2)
   (/ . 2)
   (modpow . 2)
   (|tmp_Wi0qei0JQ| . 2)
   (* . 3)
   (even? . 1)
   (|n_Wikxio_IQ| . 6)
   (|x_WiEEmu-IQ| . 4)
   (modulo . 4)
   (|y_Wi-AkX-IQ| . 4)
   (= . 1))
  ()
  (even? modpow / * - modulo =)
  (#%define modpow
    (#%lambda #t
      (|x_WiEEmu-IQ| |y_Wi-AkX-IQ| |n_Wikxio_IQ|)
      ()
      (#%if (= |y_Wi-AkX-IQ| 1)
        (modulo |x_WiEEmu-IQ| |n_Wikxio_IQ|)
        (#%if (even? |y_Wi-AkX-IQ|)
          ((#%lambda #t
             (|tmp_Wi0qei0JQ|)
             (|n_Wikxio_IQ|)
             (modulo
               (* |tmp_Wi0qei0JQ| |tmp_Wi0qei0JQ|)
               |n_Wikxio_IQ|))
           (modpow
             |x_WiEEmu-IQ|
             (/ |y_Wi-AkX-IQ| 2)
             |n_Wikxio_IQ|))
          ((#%lambda #t
             (|tmp_WiGtgR_IQ|)
             (|n_Wikxio_IQ| |x_WiEEmu-IQ|)
             (modulo
               (* |x_WiEEmu-IQ|
                  (modulo
                    (* |tmp_WiGtgR_IQ| |tmp_WiGtgR_IQ|)
                    |n_Wikxio_IQ|))
               |n_Wikxio_IQ|))
           (modpow
             |x_WiEEmu-IQ|
             (/ (- |y_Wi-AkX-IQ| 1) 2)
             |n_Wikxio_IQ|)))))))
(#%program
  ((round . 1)
   (= . 1)
   (real? . 1)
   (|n_WimmcL0JQ| . 4)
   (_integer? . 1))
  ()
  (real? round = _integer?)
  (#%define integer?
    (#%lambda #t
      (|n_WimmcL0JQ|)
      ()
      (#%if (_integer? |n_WimmcL0JQ|)
        #t
        (#%if (real? |n_WimmcL0JQ|)
          (= (round |n_WimmcL0JQ|) |n_WimmcL0JQ|)
          #f)))))
(#%program
  ((complex? . 1)
   (|oldcomp?_WiIiac1JQ| . 1)
   (|n_Wi2f8F1JQ| . 2)
   (number? . 1))
  ()
  (complex? number?)
  (#%define real?
    ((#%lambda #t
       (|oldcomp?_WiIiac1JQ|)
       ()
       (#%lambda #t
         (|n_Wi2f8F1JQ|)
         (|oldcomp?_WiIiac1JQ|)
         (#%if (number? |n_Wi2f8F1JQ|)
           (#%if (|oldcomp?_WiIiac1JQ| |n_Wi2f8F1JQ|) #f #t)
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
   (|b_Wi44203JQ| . 2)
   (|a_WiK74z2JQ| . 2)
   (* . 2)
   (+ . 1)
   (sqrt . 1)
   (- . 1)
   (< . 1)
   (|num_Wiob662JQ| . 6)
   (real? . 1))
  ()
  (+ * sqrt real-part imag-part < - real?)
  (#%define abs
    (#%lambda #t
      (|num_Wiob662JQ|)
      ()
      (#%if (real? |num_Wiob662JQ|)
        (#%if (< |num_Wiob662JQ| 0)
          (- |num_Wiob662JQ|)
          |num_Wiob662JQ|)
        ((#%lambda #t
           (|a_WiK74z2JQ| |b_Wi44203JQ|)
           ()
           (sqrt (+ (* |a_WiK74z2JQ| |a_WiK74z2JQ|)
                    (* |b_Wi44203JQ| |b_Wi44203JQ|))))
         (real-part |num_Wiob662JQ|)
         (imag-part |num_Wiob662JQ|))))))
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
   (|x1_WiONTg5JQ| . 3)
   (|args_WisRVP4JQ| . 2)
   (max . 1)
   (< . 1)
   (|x1_Wi6VXm4JQ| . 3)
   (|args_WiMYZV3JQ| . 2)
   (min . 1)
   (inexact? . 3)
   (cdr . 2)
   (|_min_max_Wiq00t3JQ| . 4)
   (car . 3)
   (|proc_Wi8KRJ5JQ| . 3)
   (exact->inexact . 1)
   (|mv_WiuGPa6JQ| . 5)
   (exact? . 1)
   (|inexact_WiazL47JQ| . 3)
   (|args_WiQCND6JQ| . 6)
   (null? . 3))
  ((max . 1) (min . 1) (|_min_max_Wiq00t3JQ| . 1))
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
    ((|_min_max_Wiq00t3JQ|
       (#%lambda #t
         (|proc_Wi8KRJ5JQ|
           |mv_WiuGPa6JQ|
           |args_WiQCND6JQ|
           |inexact_WiazL47JQ|)
         (|_min_max_Wiq00t3JQ|)
         (#%if (null? |args_WiQCND6JQ|)
           (#%if (#%if |inexact_WiazL47JQ|
                   (exact? |mv_WiuGPa6JQ|)
                   #f)
             (exact->inexact |mv_WiuGPa6JQ|)
             |mv_WiuGPa6JQ|)
           (#%if (|proc_Wi8KRJ5JQ|
                   (car |args_WiQCND6JQ|)
                   |mv_WiuGPa6JQ|)
             (|_min_max_Wiq00t3JQ|
               |proc_Wi8KRJ5JQ|
               (car |args_WiQCND6JQ|)
               (cdr |args_WiQCND6JQ|)
               (#%if |inexact_WiazL47JQ|
                 #t
                 (inexact? (car |args_WiQCND6JQ|))))
             (|_min_max_Wiq00t3JQ|
               |proc_Wi8KRJ5JQ|
               |mv_WiuGPa6JQ|
               (cdr |args_WiQCND6JQ|)
               |inexact_WiazL47JQ|))))))
    ()
    (#%begin
      (#%set! min
        (#%lambda #t
          (|x1_Wi6VXm4JQ| . |args_WiMYZV3JQ|)
          (|_min_max_Wiq00t3JQ|)
          (#%if (null? |args_WiMYZV3JQ|)
            |x1_Wi6VXm4JQ|
            (|_min_max_Wiq00t3JQ|
              <
              |x1_Wi6VXm4JQ|
              |args_WiMYZV3JQ|
              (inexact? |x1_Wi6VXm4JQ|)))))
      (#%set! max
        (#%lambda #t
          (|x1_WiONTg5JQ| . |args_WisRVP4JQ|)
          (|_min_max_Wiq00t3JQ|)
          (#%if (null? |args_WisRVP4JQ|)
            |x1_WiONTg5JQ|
            (|_min_max_Wiq00t3JQ|
              >
              |x1_WiONTg5JQ|
              |args_WisRVP4JQ|
              (inexact? |x1_WiONTg5JQ|))))))))
(#%program
  ((|n_WiwvJx7JQ| . 1) (< . 1))
  ()
  (<)
  (#%define negative?
    (#%lambda #t
      (|n_WiwvJx7JQ|)
      ()
      (< |n_WiwvJx7JQ| 0))))
(#%program
  ((|n_WiSrH-7JQ| . 1) (> . 1))
  ()
  (>)
  (#%define positive?
    (#%lambda #t
      (|n_WiSrH-7JQ|)
      ()
      (> |n_WiSrH-7JQ| 0))))
(#%program
  ((|n_WicoFr8JQ| . 1) (modulo . 1) (= . 1))
  ()
  (modulo =)
  (#%define even?
    (#%lambda #t
      (|n_WicoFr8JQ|)
      ()
      (= 0 (modulo |n_WicoFr8JQ| 2)))))
(#%program
  ((|n_WiykDU8JQ| . 1) (even? . 1))
  ()
  (even?)
  (#%define odd?
    (#%lambda #t
      (|n_WiykDU8JQ|)
      ()
      (#%if (even? |n_WiykDU8JQ|) #f #t))))
(#%program
  ((|n_WiUgBl9JQ| . 1) (= . 1))
  ()
  (=)
  (#%define zero?
    (#%lambda #t
      (|n_WiUgBl9JQ|)
      ()
      (= |n_WiUgBl9JQ| 0))))
(#%program
  ((|n_WiedzO9JQ| . 1) (+ . 1))
  ()
  (+)
  (#%define add1
    (#%lambda #t
      (|n_WiedzO9JQ|)
      ()
      (+ |n_WiedzO9JQ| 1))))
(#%program
  ((|n_WiA9xfaJQ| . 1) (- . 1))
  ()
  (-)
  (#%define sub1
    (#%lambda #t
      (|n_WiA9xfaJQ|)
      ()
      (- |n_WiA9xfaJQ| 1))))
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
  ((|y_Wiom4BgJQ| . 1)
   (|x_Wi2q68gJQ| . 1)
   (|args_Wi0BcNeJQ| . 1)
   (|loop_WimxaefJQ| . 2)
   (cadr . 1)
   (car . 1)
   (|comparator_Wi-LiqdJQ| . 1)
   (|chainer_WikIgTdJQ| . 1)
   (cdr . 2)
   (|endstate_WiGEekeJQ| . 2)
   (|x_WiIt8HfJQ| . 5)
   (null? . 2)
   (|b_WiEPkZcJQ| . 2)
   (|a_WiiTmwcJQ| . 2)
   (> . 1)
   (>= . 1)
   (|_and2_Wig2t9bJQ| . 2)
   (= . 2)
   (|b_WiYWo3cJQ| . 2)
   (|a_WiC-qCbJQ| . 2)
   (< . 1)
   (|_comp_help_WiW5vIaJQ| . 2)
   (<= . 1))
  ((|loop_WimxaefJQ| . 1) (>= . 1) (<= . 1))
  (null? cadr car cdr <= = < >= >)
  ((#%lambda #t
     (|_comp_help_WiW5vIaJQ| |_and2_Wig2t9bJQ|)
     ()
     (#%begin
       (#%set! <=
         (|_comp_help_WiW5vIaJQ|
           (#%lambda #t
             (|a_WiC-qCbJQ| |b_WiYWo3cJQ|)
             ()
             (#%if (< |a_WiC-qCbJQ| |b_WiYWo3cJQ|)
               #t
               (= |a_WiC-qCbJQ| |b_WiYWo3cJQ|)))
           |_and2_Wig2t9bJQ|
           #t))
       (#%set! >=
         (|_comp_help_WiW5vIaJQ|
           (#%lambda #t
             (|a_WiiTmwcJQ| |b_WiEPkZcJQ|)
             ()
             (#%if (> |a_WiiTmwcJQ| |b_WiEPkZcJQ|)
               #t
               (= |a_WiiTmwcJQ| |b_WiEPkZcJQ|)))
           |_and2_Wig2t9bJQ|
           #t))))
   (#%lambda #t
     (|comparator_Wi-LiqdJQ|
       |chainer_WikIgTdJQ|
       |endstate_WiGEekeJQ|)
     ()
     (#%lambda #t
       |args_Wi0BcNeJQ|
       (|endstate_WiGEekeJQ|
         |chainer_WikIgTdJQ|
         |comparator_Wi-LiqdJQ|)
       ((#%letrec #t
          ((|loop_WimxaefJQ|
             (#%lambda #t
               (|x_WiIt8HfJQ|)
               (|loop_WimxaefJQ|
                 |endstate_WiGEekeJQ|
                 |chainer_WikIgTdJQ|
                 |comparator_Wi-LiqdJQ|)
               (#%if (null? |x_WiIt8HfJQ|)
                 |endstate_WiGEekeJQ|
                 (#%if (null? (cdr |x_WiIt8HfJQ|))
                   |endstate_WiGEekeJQ|
                   (|chainer_WikIgTdJQ|
                     (|comparator_Wi-LiqdJQ|
                       (car |x_WiIt8HfJQ|)
                       (cadr |x_WiIt8HfJQ|))
                     (|loop_WimxaefJQ| (cdr |x_WiIt8HfJQ|))))))))
          (|endstate_WiGEekeJQ|
            |chainer_WikIgTdJQ|
            |comparator_Wi-LiqdJQ|)
          |loop_WimxaefJQ|)
        |args_Wi0BcNeJQ|)))
   (#%lambda #t
     (|x_Wi2q68gJQ| |y_Wiom4BgJQ|)
     ()
     (#%if |x_Wi2q68gJQ| |y_Wiom4BgJQ| #f))))
(#%program
  ((|chainer_Wiqb-XhJQ| . 1)
   (apply . 1)
   (|comparator_Wi4f0vhJQ| . 1)
   (cadr . 2)
   (car . 2)
   (= . 1)
   (cdr . 2)
   (|args_WiM7YoiJQ| . 7)
   (null? . 2)
   (< . 1)
   (<= . 2)
   (> . 1)
   (|_?=_WiKi22hJQ| . 2)
   (>= . 2))
  ((<= . 1) (>= . 1))
  (< <= <= > >= >= null? = car cadr apply cdr)
  ((#%lambda #t
     (|_?=_WiKi22hJQ|)
     ()
     (#%begin
       (#%set! >= (|_?=_WiKi22hJQ| > >=))
       (#%set! <= (|_?=_WiKi22hJQ| < <=))))
   (#%lambda #t
     (|comparator_Wi4f0vhJQ| |chainer_Wiqb-XhJQ|)
     ()
     (#%lambda #t
       |args_WiM7YoiJQ|
       (|chainer_Wiqb-XhJQ| |comparator_Wi4f0vhJQ|)
       (#%if (null? |args_WiM7YoiJQ|)
         #t
         (#%if (null? (cdr |args_WiM7YoiJQ|))
           #t
           (#%if (#%if (= (car |args_WiM7YoiJQ|)
                          (cadr |args_WiM7YoiJQ|))
                   #t
                   (|comparator_Wi4f0vhJQ|
                     (car |args_WiM7YoiJQ|)
                     (cadr |args_WiM7YoiJQ|)))
             (apply |chainer_Wiqb-XhJQ|
                    (cdr |args_WiM7YoiJQ|))
             #f)))))))
(#%program
  ((cadr . 1)
   (_gcd . 1)
   (car . 2)
   (cdr . 1)
   (|args_Wis0UijJQ| . 5)
   (null? . 2))
  ()
  (cdr car cadr _gcd null?)
  (#%define gcd
    (#%lambda #t
      |args_Wis0UijJQ|
      ()
      (#%if (null? |args_Wis0UijJQ|)
        0
        (#%if (null? (cdr |args_Wis0UijJQ|))
          (car |args_Wis0UijJQ|)
          (_gcd (car |args_Wis0UijJQ|)
                (cadr |args_Wis0UijJQ|)))))))
(#%program
  ((cadr . 1)
   (_lcm . 1)
   (car . 2)
   (cdr . 1)
   (|args_WiOYRLjJQ| . 5)
   (null? . 2))
  ()
  (cdr car cadr _lcm null?)
  (#%define lcm
    (#%lambda #t
      |args_WiOYRLjJQ|
      ()
      (#%if (null? |args_WiOYRLjJQ|)
        1
        (#%if (null? (cdr |args_WiOYRLjJQ|))
          (car |args_WiOYRLjJQ|)
          (_lcm (car |args_WiOYRLjJQ|)
                (cadr |args_WiOYRLjJQ|)))))))
(#%program
  ((|x_Wi8VPckJQ| . 1)
   (remainder . 1)
   (+ . 1)
   (|r_WiQNL6lJQ| . 3)
   (positive? . 1)
   (|y_WiuRNFkJQ| . 3)
   (negative? . 2))
  ()
  (remainder positive? negative? +)
  (#%define modulo
    (#%lambda #t
      (|x_Wi8VPckJQ| |y_WiuRNFkJQ|)
      ()
      ((#%lambda #t
         (|r_WiQNL6lJQ|)
         (|y_WiuRNFkJQ|)
         (#%if ((#%if (negative? |y_WiuRNFkJQ|)
                  positive?
                  negative?)
                |r_WiQNL6lJQ|)
           (+ |r_WiQNL6lJQ| |y_WiuRNFkJQ|)
           |r_WiQNL6lJQ|))
       (remainder |x_Wi8VPckJQ| |y_WiuRNFkJQ|)))))
(#%program
  ((|args_WiwGH0mJQ| . 3)
   (cdr . 2)
   (car . 2)
   (_string-append . 1)
   (|string-append-helper_WiaKJzlJQ| . 2)
   (|acc_WiSCFtmJQ| . 2)
   (|args_WiczDWmJQ| . 3)
   (null? . 2))
  ((|string-append-helper_WiaKJzlJQ| . 1))
  (car _string-append cdr null?)
  (#%define string-append
    (#%letrec #t
      ((|string-append-helper_WiaKJzlJQ|
         (#%lambda #t
           (|acc_WiSCFtmJQ| |args_WiczDWmJQ|)
           (|string-append-helper_WiaKJzlJQ|)
           (#%if (null? |args_WiczDWmJQ|)
             |acc_WiSCFtmJQ|
             (|string-append-helper_WiaKJzlJQ|
               (_string-append
                 |acc_WiSCFtmJQ|
                 (car |args_WiczDWmJQ|))
               (cdr |args_WiczDWmJQ|))))))
      ()
      (#%lambda #t
        |args_WiwGH0mJQ|
        (|string-append-helper_WiaKJzlJQ|)
        (#%if (null? |args_WiwGH0mJQ|)
          ""
          (|string-append-helper_WiaKJzlJQ|
            (car |args_WiwGH0mJQ|)
            (cdr |args_WiwGH0mJQ|)))))))
(#%program
  ((- . 1)
   (char->integer . 4)
   (|c_WiAkvKoJQ| . 2)
   (|lc-offset_WieoxhoJQ| . 1)
   (+ . 1)
   (integer->char . 1)
   (|z_WiUrzQnJQ| . 1)
   (<= . 1)
   (|a_WiyvBnnJQ| . 2)
   (|cv_WiWgtbpJQ| . 3)
   (>= . 1))
  ()
  (integer->char + >= <= char->integer -)
  (#%define char-downcase
    ((#%lambda #t
       (|a_WiyvBnnJQ|)
       ()
       ((#%lambda #t
          (|z_WiUrzQnJQ|)
          (|a_WiyvBnnJQ|)
          ((#%lambda #t
             (|lc-offset_WieoxhoJQ|)
             (|z_WiUrzQnJQ| |a_WiyvBnnJQ|)
             (#%lambda #t
               (|c_WiAkvKoJQ|)
               (|lc-offset_WieoxhoJQ|
                 |z_WiUrzQnJQ|
                 |a_WiyvBnnJQ|)
               ((#%lambda #t
                  (|cv_WiWgtbpJQ|)
                  (|c_WiAkvKoJQ|
                    |lc-offset_WieoxhoJQ|
                    |z_WiUrzQnJQ|
                    |a_WiyvBnnJQ|)
                  (#%if (#%if (>= |cv_WiWgtbpJQ| |a_WiyvBnnJQ|)
                          (<= |cv_WiWgtbpJQ| |z_WiUrzQnJQ|)
                          #f)
                    (integer->char
                      (+ |cv_WiWgtbpJQ| |lc-offset_WieoxhoJQ|))
                    |c_WiAkvKoJQ|))
                (char->integer |c_WiAkvKoJQ|))))
           (- (char->integer #\a) |a_WiyvBnnJQ|)))
        (char->integer #\Z)))
     (char->integer #\A))))
(#%program
  ((char->integer . 4)
   (|c_Wii2l_qJQ| . 2)
   (|uc-offset_WiY5nyqJQ| . 1)
   (- . 2)
   (integer->char . 1)
   (|z_WiC9p5qJQ| . 1)
   (<= . 1)
   (|a_WigdrEpJQ| . 2)
   (|cv_WiE-isrJQ| . 3)
   (>= . 1))
  ()
  (integer->char - >= <= char->integer)
  (#%define char-upcase
    ((#%lambda #t
       (|a_WigdrEpJQ|)
       ()
       ((#%lambda #t
          (|z_WiC9p5qJQ|)
          (|a_WigdrEpJQ|)
          ((#%lambda #t
             (|uc-offset_WiY5nyqJQ|)
             (|z_WiC9p5qJQ| |a_WigdrEpJQ|)
             (#%lambda #t
               (|c_Wii2l_qJQ|)
               (|uc-offset_WiY5nyqJQ|
                 |z_WiC9p5qJQ|
                 |a_WigdrEpJQ|)
               ((#%lambda #t
                  (|cv_WiE-isrJQ|)
                  (|c_Wii2l_qJQ|
                    |uc-offset_WiY5nyqJQ|
                    |z_WiC9p5qJQ|
                    |a_WigdrEpJQ|)
                  (#%if (#%if (>= |cv_WiE-isrJQ| |a_WigdrEpJQ|)
                          (<= |cv_WiE-isrJQ| |z_WiC9p5qJQ|)
                          #f)
                    (integer->char
                      (- |cv_WiE-isrJQ| |uc-offset_WiY5nyqJQ|))
                    |c_Wii2l_qJQ|))
                (char->integer |c_Wii2l_qJQ|))))
           (- |a_WigdrEpJQ| (char->integer #\A))))
        (char->integer #\z)))
     (char->integer #\a))))
(#%program
  ((|args_Wi-WgVrJQ| . 1)
   (map . 1)
   (|c2_WikTemsJQ| . 1)
   (|c1_WiGPcPsJQ| . 1)
   (char->integer . 3)
   (> . 1)
   (apply . 1))
  ()
  (map char->integer > apply)
  (#%define char>?
    (#%lambda #t
      (|c1_WiGPcPsJQ|
        |c2_WikTemsJQ|
        .
        |args_Wi-WgVrJQ|)
      ()
      (apply >
             (char->integer |c1_WiGPcPsJQ|)
             (char->integer |c2_WikTemsJQ|)
             (map char->integer |args_Wi-WgVrJQ|)))))
(#%program
  ((|args_Wi0MagtJQ| . 1)
   (map . 1)
   (|c2_WimI8JtJQ| . 1)
   (|c1_WiIE6auJQ| . 1)
   (char->integer . 3)
   (< . 1)
   (apply . 1))
  ()
  (map char->integer < apply)
  (#%define char<?
    (#%lambda #t
      (|c1_WiIE6auJQ|
        |c2_WimI8JtJQ|
        .
        |args_Wi0MagtJQ|)
      ()
      (apply <
             (char->integer |c1_WiIE6auJQ|)
             (char->integer |c2_WimI8JtJQ|)
             (map char->integer |args_Wi0MagtJQ|)))))
(#%program
  ((eqv? . 1))
  ()
  (eqv?)
  (#%define char=? eqv?))
(#%program
  ((char=? . 1)
   (|c2_Wiox24vJQ| . 2)
   (|c1_Wi2B4DuJQ| . 2)
   (char>? . 1))
  ()
  (char=? char>?)
  (#%define char>=?
    (#%lambda #t
      (|c1_Wi2B4DuJQ| |c2_Wiox24vJQ|)
      ()
      (#%if (char>? |c1_Wi2B4DuJQ| |c2_Wiox24vJQ|)
        #t
        (char=? |c1_Wi2B4DuJQ| |c2_Wiox24vJQ|)))))
(#%program
  ((char=? . 1)
   (|c2_Wi4q-ZvJQ| . 2)
   (|c1_WiKt0xvJQ| . 2)
   (char<? . 1))
  ()
  (char=? char<?)
  (#%define char<=?
    (#%lambda #t
      (|c1_WiKt0xvJQ| |c2_Wi4q-ZvJQ|)
      ()
      (#%if (char<? |c1_WiKt0xvJQ| |c2_Wi4q-ZvJQ|)
        #t
        (char=? |c1_WiKt0xvJQ| |c2_Wi4q-ZvJQ|)))))
(#%program
  ((|args_WiqmYqwJQ| . 1)
   (map . 1)
   (|c2_WiMiWTwJQ| . 1)
   (|c1_Wi6fUkxJQ| . 1)
   (char-downcase . 3)
   (char>? . 1)
   (apply . 1))
  ()
  (map char-downcase char>? apply)
  (#%define char-ci>?
    (#%lambda #t
      (|c1_Wi6fUkxJQ|
        |c2_WiMiWTwJQ|
        .
        |args_WiqmYqwJQ|)
      ()
      (apply char>?
             (char-downcase |c1_Wi6fUkxJQ|)
             (char-downcase |c2_WiMiWTwJQ|)
             (map char-downcase |args_WiqmYqwJQ|)))))
(#%program
  ((|args_WisbSNxJQ| . 1)
   (map . 1)
   (|c2_WiO7QeyJQ| . 1)
   (|c1_Wi84OHyJQ| . 1)
   (char-downcase . 3)
   (char<? . 1)
   (apply . 1))
  ()
  (map char-downcase char<? apply)
  (#%define char-ci<?
    (#%lambda #t
      (|c1_Wi84OHyJQ|
        |c2_WiO7QeyJQ|
        .
        |args_WisbSNxJQ|)
      ()
      (apply char<?
             (char-downcase |c1_Wi84OHyJQ|)
             (char-downcase |c2_WiO7QeyJQ|)
             (map char-downcase |args_WisbSNxJQ|)))))
(#%program
  ((|args_Wiu0M8zJQ| . 1)
   (map . 1)
   (|c2_WiQYJBzJQ| . 1)
   (|c1_WiaVH2AJQ| . 1)
   (char-downcase . 3)
   (char=? . 1)
   (apply . 1))
  ()
  (map char-downcase char=? apply)
  (#%define char-ci=?
    (#%lambda #t
      (|c1_WiaVH2AJQ|
        |c2_WiQYJBzJQ|
        .
        |args_Wiu0M8zJQ|)
      ()
      (apply char=?
             (char-downcase |c1_WiaVH2AJQ|)
             (char-downcase |c2_WiQYJBzJQ|)
             (map char-downcase |args_Wiu0M8zJQ|)))))
(#%program
  ((char-ci=? . 1)
   (|c2_WiSNDYAJQ| . 2)
   (|c1_WiwRFvAJQ| . 2)
   (char-ci>? . 1))
  ()
  (char-ci=? char-ci>?)
  (#%define char-ci>=?
    (#%lambda #t
      (|c1_WiwRFvAJQ| |c2_WiSNDYAJQ|)
      ()
      (#%if (char-ci>? |c1_WiwRFvAJQ| |c2_WiSNDYAJQ|)
        #t
        (char-ci=? |c1_WiwRFvAJQ| |c2_WiSNDYAJQ|)))))
(#%program
  ((char-ci=? . 1)
   (|c2_WiyGzSBJQ| . 2)
   (|c1_WicKBpBJQ| . 2)
   (char-ci<? . 1))
  ()
  (char-ci=? char-ci<?)
  (#%define char-ci<=?
    (#%lambda #t
      (|c1_WicKBpBJQ| |c2_WiyGzSBJQ|)
      ()
      (#%if (char-ci<? |c1_WicKBpBJQ| |c2_WiyGzSBJQ|)
        #t
        (char-ci=? |c1_WicKBpBJQ| |c2_WiyGzSBJQ|)))))
(#%program
  ((|c_WiUCxjCJQ| . 2) (char<? . 2))
  ()
  (char<?)
  (#%define char-alphabetic?
    (#%lambda #t
      (|c_WiUCxjCJQ|)
      ()
      (#%if (char<? #\@ |c_WiUCxjCJQ| #\[)
        #t
        (char<? #\` |c_WiUCxjCJQ| #\{)))))
(#%program
  ((|c_WiezvMCJQ| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-numeric?
    (#%lambda #t
      (|c_WiezvMCJQ|)
      ()
      (char<? #\/ |c_WiezvMCJQ| #\:))))
(#%program
  ((|c_WiAvtdDJQ| . 4) (char=? . 4))
  ()
  (char=?)
  (#%define char-whitespace?
    (#%lambda #t
      (|c_WiAvtdDJQ|)
      ()
      (#%if (char=? |c_WiAvtdDJQ| #\space)
        #t
        (#%if (char=? |c_WiAvtdDJQ| #\tab)
          #t
          (#%if (char=? |c_WiAvtdDJQ| #\newline)
            #t
            (char=? |c_WiAvtdDJQ| #\return)))))))
(#%program
  ((|c_WiWrrGDJQ| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-upper-case?
    (#%lambda #t
      (|c_WiWrrGDJQ|)
      ()
      (char<? #\@ |c_WiWrrGDJQ| #\[))))
(#%program
  ((|c_Wigop7EJQ| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-lower-case?
    (#%lambda #t
      (|c_Wigop7EJQ|)
      ()
      (char<? #\` |c_Wigop7EJQ| #\{))))
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
   (|newstr_Wi-5foGJQ| . 1)
   (|str_WiE9hXFJQ| . 3)
   (string-upcase . 1)
   (make-string . 2)
   (string-length . 4)
   (char-downcase . 1)
   (|newstr_WiidjuFJQ| . 1)
   (|str_WiYgl1FJQ| . 3)
   (string-downcase . 1)
   (+ . 1)
   (|string-map_WiCknAEJQ| . 3)
   (|strsrc_Wik2dRGJQ| . 2)
   (string-ref . 1)
   (|proc_Wi0X8LHJQ| . 2)
   (|strdst_WiG-aiHJQ| . 3)
   (string-set! . 1)
   (|l_WiIP4FIJQ| . 2)
   (|n_WimT6cIJQ| . 4)
   (< . 1))
  ((string-upcase . 1)
   (string-downcase . 1)
   (|string-map_WiCknAEJQ| . 1))
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
    ((|string-map_WiCknAEJQ|
       (#%lambda #t
         (|strsrc_Wik2dRGJQ|
           |strdst_WiG-aiHJQ|
           |proc_Wi0X8LHJQ|
           |n_WimT6cIJQ|
           |l_WiIP4FIJQ|)
         (|string-map_WiCknAEJQ|)
         (#%if (< |n_WimT6cIJQ| |l_WiIP4FIJQ|)
           (#%begin
             (string-set!
               |strdst_WiG-aiHJQ|
               |n_WimT6cIJQ|
               (|proc_Wi0X8LHJQ|
                 (string-ref |strsrc_Wik2dRGJQ| |n_WimT6cIJQ|)))
             (|string-map_WiCknAEJQ|
               |strsrc_Wik2dRGJQ|
               |strdst_WiG-aiHJQ|
               |proc_Wi0X8LHJQ|
               (+ |n_WimT6cIJQ| 1)
               |l_WiIP4FIJQ|))
           |strdst_WiG-aiHJQ|))))
    ()
    (#%begin
      (#%set! string-downcase
        (#%lambda #t
          (|str_WiYgl1FJQ|)
          (|string-map_WiCknAEJQ|)
          ((#%lambda #t
             (|newstr_WiidjuFJQ|)
             (|str_WiYgl1FJQ| |string-map_WiCknAEJQ|)
             (|string-map_WiCknAEJQ|
               |str_WiYgl1FJQ|
               |newstr_WiidjuFJQ|
               char-downcase
               0
               (string-length |str_WiYgl1FJQ|)))
           (make-string (string-length |str_WiYgl1FJQ|)))))
      (#%set! string-upcase
        (#%lambda #t
          (|str_WiE9hXFJQ|)
          (|string-map_WiCknAEJQ|)
          ((#%lambda #t
             (|newstr_Wi-5foGJQ|)
             (|str_WiE9hXFJQ| |string-map_WiCknAEJQ|)
             (|string-map_WiCknAEJQ|
               |str_WiE9hXFJQ|
               |newstr_Wi-5foGJQ|
               char-upcase
               0
               (string-length |str_WiE9hXFJQ|)))
           (make-string (string-length |str_WiE9hXFJQ|))))))))
(#%program
  ((equal? . 1))
  ()
  (equal?)
  (#%define string=? equal?))
(#%program
  ((|s2_WiKE-_JJQ| . 1)
   (|s1_WioI0zJJQ| . 1)
   (string->list . 2)
   (car . 2)
   (cdr . 2)
   (|s<?_Wi2M26JJQ| . 2)
   (char>? . 1)
   (|c2_Wi6qSPLJQ| . 2)
   (|c1_WiMtUmLJQ| . 2)
   (char<? . 1)
   (|s2_WiqxWVKJQ| . 4)
   (|s1_Wi4BYsKJQ| . 3)
   (null? . 3))
  ((|s<?_Wi2M26JJQ| . 1))
  (string->list car char<? cdr char>? null?)
  (#%define string<?
    (#%letrec #t
      ((|s<?_Wi2M26JJQ|
         (#%lambda #t
           (|s1_Wi4BYsKJQ| |s2_WiqxWVKJQ|)
           (|s<?_Wi2M26JJQ|)
           (#%if (null? |s1_Wi4BYsKJQ|)
             (#%if (null? |s2_WiqxWVKJQ|) #f #t)
             (#%if (null? |s2_WiqxWVKJQ|)
               #f
               ((#%lambda #t
                  (|c1_WiMtUmLJQ| |c2_Wi6qSPLJQ|)
                  (|s2_WiqxWVKJQ| |s1_Wi4BYsKJQ| |s<?_Wi2M26JJQ|)
                  (#%if (char<? |c1_WiMtUmLJQ| |c2_Wi6qSPLJQ|)
                    #t
                    (#%if (char>? |c1_WiMtUmLJQ| |c2_Wi6qSPLJQ|)
                      #f
                      (|s<?_Wi2M26JJQ|
                        (cdr |s1_Wi4BYsKJQ|)
                        (cdr |s2_WiqxWVKJQ|)))))
                (car |s1_Wi4BYsKJQ|)
                (car |s2_WiqxWVKJQ|)))))))
      ()
      (#%lambda #t
        (|s1_WioI0zJJQ| |s2_WiKE-_JJQ|)
        (|s<?_Wi2M26JJQ|)
        (|s<?_Wi2M26JJQ|
          (string->list |s1_WioI0zJJQ|)
          (string->list |s2_WiKE-_JJQ|))))))
(#%program
  ((|s2_Wi8fMaNJQ| . 1)
   (|s1_WiOiOJMJQ| . 1)
   (string->list . 2)
   (car . 2)
   (cdr . 2)
   (|s>?_WismQgMJQ| . 2)
   (char<? . 1)
   (|c2_Wiw0E-OJQ| . 2)
   (|c1_Wia4GxOJQ| . 2)
   (char>? . 1)
   (|s1_WiubKDNJQ| . 4)
   (|s2_WiQ7I4OJQ| . 3)
   (null? . 3))
  ((|s>?_WismQgMJQ| . 1))
  (string->list car char>? cdr char<? null?)
  (#%define string>?
    (#%letrec #t
      ((|s>?_WismQgMJQ|
         (#%lambda #t
           (|s1_WiubKDNJQ| |s2_WiQ7I4OJQ|)
           (|s>?_WismQgMJQ|)
           (#%if (null? |s2_WiQ7I4OJQ|)
             (#%if (null? |s1_WiubKDNJQ|) #f #t)
             (#%if (null? |s1_WiubKDNJQ|)
               #f
               ((#%lambda #t
                  (|c1_Wia4GxOJQ| |c2_Wiw0E-OJQ|)
                  (|s2_WiQ7I4OJQ| |s1_WiubKDNJQ| |s>?_WismQgMJQ|)
                  (#%if (char>? |c1_Wia4GxOJQ| |c2_Wiw0E-OJQ|)
                    #t
                    (#%if (char<? |c1_Wia4GxOJQ| |c2_Wiw0E-OJQ|)
                      #f
                      (|s>?_WismQgMJQ|
                        (cdr |s1_WiubKDNJQ|)
                        (cdr |s2_WiQ7I4OJQ|)))))
                (car |s1_WiubKDNJQ|)
                (car |s2_WiQ7I4OJQ|)))))))
      ()
      (#%lambda #t
        (|s1_WiOiOJMJQ| |s2_Wi8fMaNJQ|)
        (|s>?_WismQgMJQ|)
        (|s>?_WismQgMJQ|
          (string->list |s1_WiOiOJMJQ|)
          (string->list |s2_Wi8fMaNJQ|))))))
(#%program
  ((string=? . 1)
   (|s2_WicVzUPJQ| . 2)
   (|s1_WiSYBrPJQ| . 2)
   (string<? . 1))
  ()
  (string=? string<?)
  (#%define string<=?
    (#%lambda #t
      (|s1_WiSYBrPJQ| |s2_WicVzUPJQ|)
      ()
      (#%if (string<? |s1_WiSYBrPJQ| |s2_WicVzUPJQ|)
        #t
        (string=? |s1_WiSYBrPJQ| |s2_WicVzUPJQ|)))))
(#%program
  ((string=? . 1)
   (|s2_WiUNvOQJQ| . 2)
   (|s1_WiyRxlQJQ| . 2)
   (string>? . 1))
  ()
  (string=? string>?)
  (#%define string>=?
    (#%lambda #t
      (|s1_WiyRxlQJQ| |s2_WiUNvOQJQ|)
      ()
      (#%if (string>? |s1_WiyRxlQJQ| |s2_WiUNvOQJQ|)
        #t
        (string=? |s1_WiyRxlQJQ| |s2_WiUNvOQJQ|)))))
(#%program
  ((|s2_WiAGrIRJQ| . 1)
   (|s1_WieKtfRJQ| . 1)
   (string-downcase . 2)
   (string=? . 1))
  ()
  (string-downcase string=?)
  (#%define string-ci=?
    (#%lambda #t
      (|s1_WieKtfRJQ| |s2_WiAGrIRJQ|)
      ()
      (string=?
        (string-downcase |s1_WieKtfRJQ|)
        (string-downcase |s2_WiAGrIRJQ|)))))
(#%program
  ((|s2_WigznCSJQ| . 1)
   (|s1_WiWCp9SJQ| . 1)
   (string-downcase . 2)
   (string<? . 1))
  ()
  (string-downcase string<?)
  (#%define string-ci<?
    (#%lambda #t
      (|s1_WiWCp9SJQ| |s2_WigznCSJQ|)
      ()
      (string<?
        (string-downcase |s1_WiWCp9SJQ|)
        (string-downcase |s2_WigznCSJQ|)))))
(#%program
  ((|s2_WiYrjwTJQ| . 1)
   (|s1_WiCvl3TJQ| . 1)
   (string-downcase . 2)
   (string>? . 1))
  ()
  (string-downcase string>?)
  (#%define string-ci>?
    (#%lambda #t
      (|s1_WiCvl3TJQ| |s2_WiYrjwTJQ|)
      ()
      (string>?
        (string-downcase |s1_WiCvl3TJQ|)
        (string-downcase |s2_WiYrjwTJQ|)))))
(#%program
  ((|s2_WiEkfqUJQ| . 1)
   (|s1_WiiohZTJQ| . 1)
   (string-downcase . 2)
   (string>=? . 1))
  ()
  (string-downcase string>=?)
  (#%define string-ci>=?
    (#%lambda #t
      (|s1_WiiohZTJQ| |s2_WiEkfqUJQ|)
      ()
      (string>=?
        (string-downcase |s1_WiiohZTJQ|)
        (string-downcase |s2_WiEkfqUJQ|)))))
(#%program
  ((|s2_WikdbkVJQ| . 1)
   (|s1_Wi-gdTUJQ| . 1)
   (string-downcase . 2)
   (string<=? . 1))
  ()
  (string-downcase string<=?)
  (#%define string-ci<=?
    (#%lambda #t
      (|s1_Wi-gdTUJQ| |s2_WikdbkVJQ|)
      ()
      (string<=?
        (string-downcase |s1_Wi-gdTUJQ|)
        (string-downcase |s2_WikdbkVJQ|)))))
(#%program
  ((- . 1)
   (make-string . 1)
   (|end_WiI-28XJQ| . 2)
   (|start_Wim25HWJQ| . 2)
   (|newstr_Wi2X0BXJQ| . 2)
   (|str_Wi067eWJQ| . 1)
   (+ . 2)
   (|fill-string_WiG99NVJQ| . 2)
   (|sstr_WioT-1YJQ| . 2)
   (string-ref . 1)
   (|n_Wi4MWXYJQ| . 2)
   (|dstr_WiKPYuYJQ| . 2)
   (string-set! . 1)
   (|e_WiMESRZJQ| . 2)
   (|s_WiqIUoZJQ| . 3)
   (< . 1))
  ((|fill-string_WiG99NVJQ| . 1))
  (make-string - string-ref string-set! + <)
  (#%define substring
    (#%letrec #t
      ((|fill-string_WiG99NVJQ|
         (#%lambda #t
           (|sstr_WioT-1YJQ|
             |dstr_WiKPYuYJQ|
             |n_Wi4MWXYJQ|
             |s_WiqIUoZJQ|
             |e_WiMESRZJQ|)
           (|fill-string_WiG99NVJQ|)
           (#%if (< |s_WiqIUoZJQ| |e_WiMESRZJQ|)
             (#%begin
               (string-set!
                 |dstr_WiKPYuYJQ|
                 |n_Wi4MWXYJQ|
                 (string-ref |sstr_WioT-1YJQ| |s_WiqIUoZJQ|))
               (|fill-string_WiG99NVJQ|
                 |sstr_WioT-1YJQ|
                 |dstr_WiKPYuYJQ|
                 (+ |n_Wi4MWXYJQ| 1)
                 (+ |s_WiqIUoZJQ| 1)
                 |e_WiMESRZJQ|))
             #!void))))
      ()
      (#%lambda #t
        (|str_Wi067eWJQ|
          |start_Wim25HWJQ|
          |end_WiI-28XJQ|)
        (|fill-string_WiG99NVJQ|)
        ((#%lambda #t
           (|newstr_Wi2X0BXJQ|)
           (|end_WiI-28XJQ|
             |start_Wim25HWJQ|
             |str_Wi067eWJQ|
             |fill-string_WiG99NVJQ|)
           (#%begin
             (|fill-string_WiG99NVJQ|
               |str_Wi067eWJQ|
               |newstr_Wi2X0BXJQ|
               0
               |start_Wim25HWJQ|
               |end_WiI-28XJQ|)
             |newstr_Wi2X0BXJQ|))
         (make-string
           (- |end_WiI-28XJQ| |start_Wim25HWJQ|)))))))
(#%program
  ((- . 1)
   (cdr . 1)
   (list-ref . 1)
   (|list_Wi6BQi-JQ| . 2)
   (car . 1)
   (|n_WisxOL-JQ| . 2)
   (zero? . 1))
  ()
  (list-ref cdr - car zero?)
  (#%define list-ref
    (#%lambda #t
      (|list_Wi6BQi-JQ| |n_WisxOL-JQ|)
      ()
      (#%if (zero? |n_WisxOL-JQ|)
        (car |list_Wi6BQi-JQ|)
        (list-ref
          (cdr |list_Wi6BQi-JQ|)
          (- |n_WisxOL-JQ| 1))))))
(#%program
  ((|args_WiOtMc_JQ| . 1)
   (|k_Wi8qKF_JQ| . 1)
   (apply . 1)
   (call-with-current-continuation . 1))
  ()
  (apply call-with-current-continuation)
  (#%define values
    (#%lambda #t
      |args_WiOtMc_JQ|
      ()
      (call-with-current-continuation
        (#%lambda #t
          (|k_Wi8qKF_JQ|)
          (|args_WiOtMc_JQ|)
          (apply |k_Wi8qKF_JQ| |args_WiOtMc_JQ|))))))
