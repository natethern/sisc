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
   (|proc_1Q9tA8nNN| . 2)
   (apply . 2)
   (cons . 1)
   (|lists_1QtAEemNN| . 4)
   (|ls1_1QPwCHmNN| . 2)
   (null? . 1))
  ((|lists_1QtAEemNN| . 1))
  (cons map-car apply map-cdr for-each null?)
  (#%define for-each
    (#%lambda #t
      (|proc_1Q9tA8nNN|
        |ls1_1QPwCHmNN|
        .
        |lists_1QtAEemNN|)
      ()
      (#%if (null? |ls1_1QPwCHmNN|)
        #!void
        (#%begin
          (#%set! |lists_1QtAEemNN|
            (cons |ls1_1QPwCHmNN| |lists_1QtAEemNN|))
          (apply |proc_1Q9tA8nNN|
                 (map-car |lists_1QtAEemNN|))
          (apply for-each
                 |proc_1Q9tA8nNN|
                 (map-cdr |lists_1QtAEemNN|)))))))
(#%program
  ((|x_1QvpyBnNN| . 1) (eq? . 1))
  ()
  (eq?)
  (#%define eof-object?
    (#%lambda #t
      (|x_1QvpyBnNN|)
      ()
      (eq? |x_1QvpyBnNN| #!eof))))
(#%program
  ((|x_1QRlw2oNN| . 1))
  ()
  ()
  (#%define not
    (#%lambda #t
      (|x_1QRlw2oNN|)
      ()
      (#%if |x_1QRlw2oNN| #f #t))))
(#%program
  ((|port_1QbiuvoNN| . 1)
   (display . 1)
   (apply . 1))
  ()
  (display apply)
  (#%define newline
    (#%lambda #t
      |port_1QbiuvoNN|
      ()
      (apply display #\newline |port_1QbiuvoNN|))))
(#%program
  ((|ls_1QTaqppNN| . 1)
   (car . 1)
   (cons . 1)
   (cdr . 1)
   (|iter_1QxesYoNN| . 2)
   (|acc_1Qz3mjqNN| . 2)
   (|ls_1Qd7oSpNN| . 3)
   (null? . 1))
  ((|iter_1QxesYoNN| . 1))
  (cdr car cons null?)
  (#%define reverse
    (#%letrec #t
      ((|iter_1QxesYoNN|
         (#%lambda #t
           (|ls_1Qd7oSpNN| |acc_1Qz3mjqNN|)
           (|iter_1QxesYoNN|)
           (#%if (null? |ls_1Qd7oSpNN|)
             |acc_1Qz3mjqNN|
             (|iter_1QxesYoNN|
               (cdr |ls_1Qd7oSpNN|)
               (cons (car |ls_1Qd7oSpNN|) |acc_1Qz3mjqNN|))))))
      ()
      (#%lambda #t
        (|ls_1QTaqppNN|)
        (|iter_1QxesYoNN|)
        (|iter_1QxesYoNN| |ls_1QTaqppNN| ())))))
(#%program
  ((|s_1QfYhdrNN| . 1)
   (cdr . 1)
   (|d_1QhNbAsNN| . 1)
   (|iter_1QV_jMqNN| . 2)
   (set-cdr! . 1)
   (|r_1QXQd7sNN| . 2)
   (|s_1QBUfGrNN| . 4)
   (null? . 1))
  ((|iter_1QV_jMqNN| . 1))
  (set-cdr! cdr null?)
  (#%define reverse!
    (#%letrec #t
      ((|iter_1QV_jMqNN|
         (#%lambda #t
           (|s_1QBUfGrNN| |r_1QXQd7sNN|)
           (|iter_1QV_jMqNN|)
           (#%if (null? |s_1QBUfGrNN|)
             |r_1QXQd7sNN|
             ((#%lambda #t
                (|d_1QhNbAsNN|)
                (|r_1QXQd7sNN| |s_1QBUfGrNN| |iter_1QV_jMqNN|)
                (#%begin
                  (set-cdr! |s_1QBUfGrNN| |r_1QXQd7sNN|)
                  (|iter_1QV_jMqNN| |d_1QhNbAsNN| |s_1QBUfGrNN|)))
              (cdr |s_1QBUfGrNN|))))))
      ()
      (#%lambda #t
        (|s_1QfYhdrNN|)
        (|iter_1QV_jMqNN|)
        (|iter_1QV_jMqNN| |s_1QfYhdrNN| ())))))
(#%program
  ((cdr . 1)
   (map-car . 1)
   (caar . 1)
   (cons . 1)
   (|ls_1QDJ91tNN| . 3)
   (null? . 1))
  ()
  (cons caar cdr map-car null?)
  (#%define map-car
    (#%lambda #t
      (|ls_1QDJ91tNN|)
      ()
      (#%if (null? |ls_1QDJ91tNN|)
        ()
        (cons (caar |ls_1QDJ91tNN|)
              (map-car (cdr |ls_1QDJ91tNN|)))))))
(#%program
  ((cdr . 1)
   (map-cdr . 1)
   (cdar . 1)
   (cons . 1)
   (|ls_1QZF7utNN| . 3)
   (null? . 1))
  ()
  (cons cdar cdr map-cdr null?)
  (#%define map-cdr
    (#%lambda #t
      (|ls_1QZF7utNN|)
      ()
      (#%if (null? |ls_1QZF7utNN|)
        ()
        (cons (cdar |ls_1QZF7utNN|)
              (map-cdr (cdr |ls_1QZF7utNN|)))))))
(#%program
  ((|list1_1Qlr_hvNN| . 2)
   (|proc_1QHnZKvNN| . 2)
   (|lists_1Q_u1RuNN| . 2)
   (map-car . 1)
   (apply . 1)
   (|lists_1QL1NsyNN| . 2)
   (map-cdr . 1)
   (|proc_1Q39RyxNN| . 2)
   (|loop_1QFy3ouNN| . 2)
   (|c_1Q5-KVyNN| . 2)
   (|list1_1Qp5P_xNN| . 3)
   (car . 2)
   (cons . 2)
   (cdr . 2)
   (|proc_1Q1kXbwNN| . 2)
   (|map1_1QjC5XtNN| . 2)
   (|acc_1QJcT5xNN| . 2)
   (reverse . 2)
   (|list_1QngVEwNN| . 3)
   (null? . 3))
  ((|loop_1QFy3ouNN| . 1) (|map1_1QjC5XtNN| . 1))
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
      ((|map1_1QjC5XtNN|
         (#%lambda #t
           (|proc_1Q1kXbwNN|
             |list_1QngVEwNN|
             |acc_1QJcT5xNN|)
           (|map1_1QjC5XtNN|)
           (#%if (null? |list_1QngVEwNN|)
             (reverse |acc_1QJcT5xNN|)
             (|map1_1QjC5XtNN|
               |proc_1Q1kXbwNN|
               (cdr |list_1QngVEwNN|)
               (cons (|proc_1Q1kXbwNN| (car |list_1QngVEwNN|))
                     |acc_1QJcT5xNN|)))))
       (|loop_1QFy3ouNN|
         (#%lambda #t
           (|proc_1Q39RyxNN|
             |list1_1Qp5P_xNN|
             |lists_1QL1NsyNN|
             |c_1Q5-KVyNN|)
           (|loop_1QFy3ouNN|)
           (#%if (null? |list1_1Qp5P_xNN|)
             (reverse |c_1Q5-KVyNN|)
             (|loop_1QFy3ouNN|
               |proc_1Q39RyxNN|
               (cdr |list1_1Qp5P_xNN|)
               (map-cdr |lists_1QL1NsyNN|)
               (cons (apply |proc_1Q39RyxNN|
                            (car |list1_1Qp5P_xNN|)
                            (map-car |lists_1QL1NsyNN|))
                     |c_1Q5-KVyNN|))))))
      ()
      (#%lambda #t
        (|proc_1QHnZKvNN|
          |list1_1Qlr_hvNN|
          .
          |lists_1Q_u1RuNN|)
        (|loop_1QFy3ouNN| |map1_1QjC5XtNN|)
        (#%if (null? |lists_1Q_u1RuNN|)
          (|map1_1QjC5XtNN|
            |proc_1QHnZKvNN|
            |list1_1Qlr_hvNN|
            ())
          (|loop_1QFy3ouNN|
            |proc_1QHnZKvNN|
            |list1_1Qlr_hvNN|
            |lists_1Q_u1RuNN|
            ()))))))
(#%program
  ((|x_1Q7PEgANN| . 1)
   (|g_1QNSGPzNN| . 1)
   (|f_1QrWImzNN| . 1))
  ()
  ()
  (#%define compose2
    (#%lambda #t
      (|f_1QrWImzNN| |g_1QNSGPzNN|)
      ()
      (#%lambda #t
        (|x_1Q7PEgANN|)
        (|g_1QNSGPzNN| |f_1QrWImzNN|)
        (|f_1QrWImzNN| (|g_1QNSGPzNN| |x_1Q7PEgANN|))))))
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
  ((|list_1QX_bCGNN| . 1)
   (|obj_1QB3e9GNN| . 1)
   (member . 1)
   (|list_1Qf7gIFNN| . 1)
   (|obj_1QVaifFNN| . 1)
   (memv . 1)
   (|list_1QzekOENN| . 1)
   (|obj_1QdimlENN| . 1)
   (memq . 1)
   (|alist_1QTloUDNN| . 1)
   (|obj_1QxpqrDNN| . 1)
   (equal? . 2)
   (assoc . 1)
   (|alist_1Qbts-CNN| . 1)
   (|obj_1QRwuxCNN| . 1)
   (eqv? . 2)
   (assv . 1)
   (|alist_1QvAw4CNN| . 1)
   (|obj_1Q9EyDBNN| . 1)
   (eq? . 2)
   (assq . 1)
   (|memn_1QPHAaBNN| . 4)
   (|obj_1QFJ1TINN| . 2)
   (|n_1QjN3qINN| . 2)
   (|list_1Q_F_jJNN| . 4)
   (cdr . 2)
   (|assn_1QtLCJANN| . 4)
   (car . 2)
   (|obj_1QDU7wHNN| . 2)
   (caar . 1)
   (|n_1QhY93HNN| . 2)
   (|alist_1QZQ5ZHNN| . 4)
   (null? . 2))
  ((member . 1)
   (memv . 1)
   (memq . 1)
   (assoc . 1)
   (assv . 1)
   (assq . 1)
   (|memn_1QPHAaBNN| . 1)
   (|assn_1QtLCJANN| . 1))
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
    ((|assn_1QtLCJANN|
       (#%lambda #t
         (|n_1QhY93HNN| |obj_1QDU7wHNN| |alist_1QZQ5ZHNN|)
         (|assn_1QtLCJANN|)
         (#%if (null? |alist_1QZQ5ZHNN|)
           #f
           (#%if (|n_1QhY93HNN|
                   (caar |alist_1QZQ5ZHNN|)
                   |obj_1QDU7wHNN|)
             (car |alist_1QZQ5ZHNN|)
             (|assn_1QtLCJANN|
               |n_1QhY93HNN|
               |obj_1QDU7wHNN|
               (cdr |alist_1QZQ5ZHNN|))))))
     (|memn_1QPHAaBNN|
       (#%lambda #t
         (|n_1QjN3qINN| |obj_1QFJ1TINN| |list_1Q_F_jJNN|)
         (|memn_1QPHAaBNN|)
         (#%if (null? |list_1Q_F_jJNN|)
           #f
           (#%if (|n_1QjN3qINN|
                   (car |list_1Q_F_jJNN|)
                   |obj_1QFJ1TINN|)
             |list_1Q_F_jJNN|
             (|memn_1QPHAaBNN|
               |n_1QjN3qINN|
               |obj_1QFJ1TINN|
               (cdr |list_1Q_F_jJNN|)))))))
    ()
    (#%begin
      (#%set! assq
        (#%lambda #t
          (|obj_1Q9EyDBNN| |alist_1QvAw4CNN|)
          (|assn_1QtLCJANN|)
          (|assn_1QtLCJANN|
            eq?
            |obj_1Q9EyDBNN|
            |alist_1QvAw4CNN|)))
      (#%set! assv
        (#%lambda #t
          (|obj_1QRwuxCNN| |alist_1Qbts-CNN|)
          (|assn_1QtLCJANN|)
          (|assn_1QtLCJANN|
            eqv?
            |obj_1QRwuxCNN|
            |alist_1Qbts-CNN|)))
      (#%set! assoc
        (#%lambda #t
          (|obj_1QxpqrDNN| |alist_1QTloUDNN|)
          (|assn_1QtLCJANN|)
          (|assn_1QtLCJANN|
            equal?
            |obj_1QxpqrDNN|
            |alist_1QTloUDNN|)))
      (#%set! memq
        (#%lambda #t
          (|obj_1QdimlENN| |list_1QzekOENN|)
          (|memn_1QPHAaBNN|)
          (|memn_1QPHAaBNN|
            eq?
            |obj_1QdimlENN|
            |list_1QzekOENN|)))
      (#%set! memv
        (#%lambda #t
          (|obj_1QVaifFNN| |list_1Qf7gIFNN|)
          (|memn_1QPHAaBNN|)
          (|memn_1QPHAaBNN|
            eqv?
            |obj_1QVaifFNN|
            |list_1Qf7gIFNN|)))
      (#%set! member
        (#%lambda #t
          (|obj_1QB3e9GNN| |list_1QX_bCGNN|)
          (|memn_1QPHAaBNN|)
          (|memn_1QPHAaBNN|
            equal?
            |obj_1QB3e9GNN|
            |list_1QX_bCGNN|))))))
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
   (|ls2_1QHyXdKNN| . 2)
   (|ls1_1QlCZMJNN| . 3)
   (null? . 1))
  ()
  (cons car cdr append2 null?)
  (#%define append2
    (#%lambda #t
      (|ls1_1QlCZMJNN| |ls2_1QHyXdKNN|)
      ()
      (#%if (null? |ls1_1QlCZMJNN|)
        |ls2_1QHyXdKNN|
        (cons (car |ls1_1QlCZMJNN|)
              (append2 (cdr |ls1_1QlCZMJNN|) |ls2_1QHyXdKNN|))))))
(#%program
  ((append2 . 1))
  ()
  (append2)
  (#%define append append2))
(#%program
  ((length . 1)
   (make-string . 1)
   (|l_1QnrT7LNN| . 2)
   (+ . 1)
   (cdr . 1)
   (|l2s_1Q1vVGKNN| . 2)
   (car . 1)
   (|n_1QpgNuMNN| . 2)
   (string-set! . 1)
   (|s_1Q3kP1MNN| . 3)
   (|l_1QJnRALNN| . 3)
   (null? . 1))
  ((|l2s_1Q1vVGKNN| . 1))
  (make-string length car string-set! + cdr null?)
  (#%define list->string
    (#%letrec #t
      ((|l2s_1Q1vVGKNN|
         (#%lambda #t
           (|l_1QJnRALNN| |s_1Q3kP1MNN| |n_1QpgNuMNN|)
           (|l2s_1Q1vVGKNN|)
           (#%if (null? |l_1QJnRALNN|)
             |s_1Q3kP1MNN|
             (#%begin
               (string-set!
                 |s_1Q3kP1MNN|
                 |n_1QpgNuMNN|
                 (car |l_1QJnRALNN|))
               (|l2s_1Q1vVGKNN|
                 (cdr |l_1QJnRALNN|)
                 |s_1Q3kP1MNN|
                 (+ |n_1QpgNuMNN| 1)))))))
      ()
      (#%lambda #t
        (|l_1QnrT7LNN|)
        (|l2s_1Q1vVGKNN|)
        (|l2s_1Q1vVGKNN|
          |l_1QnrT7LNN|
          (make-string (length |l_1QnrT7LNN|))
          0)))))
(#%program
  ((string-length . 1)
   (|s_1Q59JoNNN| . 2)
   (- . 2)
   (string-ref . 1)
   (cons . 1)
   (|s_1Qr5HRNNN| . 2)
   (|s2l_1QLcLXMNN| . 2)
   (|h_1QN1FiONN| . 2)
   (|n_1Q7-CLONN| . 3)
   (< . 1))
  ((|s2l_1QLcLXMNN| . 1))
  (string-length string-ref cons - <)
  (#%define string->list
    (#%letrec #t
      ((|s2l_1QLcLXMNN|
         (#%lambda #t
           (|s_1Qr5HRNNN| |h_1QN1FiONN| |n_1Q7-CLONN|)
           (|s2l_1QLcLXMNN|)
           (#%if (< |n_1Q7-CLONN| 0)
             |h_1QN1FiONN|
             (|s2l_1QLcLXMNN|
               |s_1Qr5HRNNN|
               (cons (string-ref |s_1Qr5HRNNN| |n_1Q7-CLONN|)
                     |h_1QN1FiONN|)
               (- |n_1Q7-CLONN| 1))))))
      ()
      (#%lambda #t
        (|s_1Q59JoNNN|)
        (|s2l_1QLcLXMNN|)
        (|s2l_1QLcLXMNN|
          |s_1Q59JoNNN|
          ()
          (- (string-length |s_1Q59JoNNN|) 1))))))
(#%program
  ((error . 1)
   (length . 1)
   (make-vector . 1)
   (|l_1QPSyFPNN| . 4)
   (proper-list? . 1)
   (+ . 1)
   (cdr . 1)
   (|l2v_1QtWAcPNN| . 2)
   (car . 1)
   (|n_1QRHs0RNN| . 2)
   (vector-set! . 1)
   (|v_1QvLuzQNN| . 3)
   (|l_1Q9Pw6QNN| . 3)
   (null? . 1))
  ((|l2v_1QtWAcPNN| . 1))
  (error length
         make-vector
         proper-list?
         car
         vector-set!
         +
         cdr
         null?)
  (#%define list->vector
    (#%letrec #t
      ((|l2v_1QtWAcPNN|
         (#%lambda #t
           (|l_1Q9Pw6QNN| |v_1QvLuzQNN| |n_1QRHs0RNN|)
           (|l2v_1QtWAcPNN|)
           (#%if (null? |l_1Q9Pw6QNN|)
             |v_1QvLuzQNN|
             (#%begin
               (vector-set!
                 |v_1QvLuzQNN|
                 |n_1QRHs0RNN|
                 (car |l_1Q9Pw6QNN|))
               (|l2v_1QtWAcPNN|
                 (cdr |l_1Q9Pw6QNN|)
                 |v_1QvLuzQNN|
                 (+ |n_1QRHs0RNN| 1)))))))
      ()
      (#%lambda #t
        (|l_1QPSyFPNN|)
        (|l2v_1QtWAcPNN|)
        (#%if (proper-list? |l_1QPSyFPNN|)
          (|l2v_1QtWAcPNN|
            |l_1QPSyFPNN|
            (make-vector (length |l_1QPSyFPNN|))
            0)
          (error (#%quote list->vector)
                 "can only convert a proper list."
                 |l_1QPSyFPNN|))))))
(#%program
  ((|elems_1QbEqtRNN| . 1) (list->vector . 1))
  ()
  (list->vector)
  (#%define vector
    (#%lambda #t
      |elems_1QbEqtRNN|
      ()
      (list->vector |elems_1QbEqtRNN|))))
(#%program
  ((|elems_1QxAoWRNN| . 1) (list->string . 1))
  ()
  (list->string)
  (#%define string
    (#%lambda #t
      |elems_1QxAoWRNN|
      ()
      (list->string |elems_1QxAoWRNN|))))
(#%program
  ((_make-parameter . 1))
  ()
  (_make-parameter)
  (#%define current-url (_make-parameter "file:.")))
(#%program
  ((car . 1)
   (string-length . 1)
   (string-append . 1)
   (|l_1QzpihTNN| . 1)
   (- . 1)
   (|v_1QdtkQSNN| . 4)
   (string-ref . 1)
   (eqv? . 1)
   (current-url . 3)
   (normalize-url . 2)
   (|rest_1QTwmnSNN| . 2)
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
      |rest_1QTwmnSNN|
      ()
      (#%if (null? |rest_1QTwmnSNN|)
        (normalize-url (current-url) ".")
        (current-url
          (normalize-url
            (current-url)
            ((#%lambda #t
               (|v_1QdtkQSNN|)
               ()
               ((#%lambda #t
                  (|l_1QzpihTNN|)
                  (|v_1QdtkQSNN|)
                  (#%if (eqv? (string-ref |v_1QdtkQSNN| (- |l_1QzpihTNN| 1))
                              #\/)
                    |v_1QdtkQSNN|
                    (string-append |v_1QdtkQSNN| "/")))
                (string-length |v_1QdtkQSNN|)))
             (car |rest_1QTwmnSNN|))))))))
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
   (|extension_1Qh78yVNN| . 1)
   (string-downcase . 1)
   (string->symbol . 1)
   (|_load_1QXaa5VNN| . 1)
   (cdr . 1)
   (|t_1QD36_VNN| . 2)
   (file-handler . 1)
   (|thunk_1QBecEUNN| . 1)
   (cons . 2)
   (|*file-handlers*_1QVlgKTNN| . 4)
   (|extension_1QfiebUNN| . 2)
   (assq . 2)
   (not . 1)
   (add-file-handler . 1))
  ((file-handler . 1)
   (|*file-handlers*_1QVlgKTNN| . 1)
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
     (|*file-handlers*_1QVlgKTNN|)
     ()
     (#%begin
       (#%set! add-file-handler
         (#%lambda #t
           (|extension_1QfiebUNN| |thunk_1QBecEUNN|)
           (|*file-handlers*_1QVlgKTNN|)
           (#%if (not (assq |extension_1QfiebUNN|
                            |*file-handlers*_1QVlgKTNN|))
             (#%set! |*file-handlers*_1QVlgKTNN|
               (cons (cons |extension_1QfiebUNN| |thunk_1QBecEUNN|)
                     |*file-handlers*_1QVlgKTNN|))
             #!void)))
       (#%set! file-handler
         ((#%lambda #t
            (|_load_1QXaa5VNN|)
            (|*file-handlers*_1QVlgKTNN|)
            (#%lambda #t
              (|extension_1Qh78yVNN|)
              (|_load_1QXaa5VNN| |*file-handlers*_1QVlgKTNN|)
              ((#%lambda #t
                 (|t_1QD36_VNN|)
                 (|_load_1QXaa5VNN|)
                 (#%if |t_1QD36_VNN|
                   (cdr |t_1QD36_VNN|)
                   |_load_1QXaa5VNN|))
               (assq (string->symbol
                       (string-downcase |extension_1Qh78yVNN|))
                     |*file-handlers*_1QVlgKTNN|))))
          load))))
   ()))
(#%program
  ((|rest_1QjY1VWNN| . 1)
   (|file_1QFU_lXNN| . 1)
   (current-url . 1)
   (normalize-url . 1)
   (|proc_1QZ_3sWNN| . 1)
   (apply . 1))
  ()
  (apply current-url normalize-url)
  (#%define make-io-proc
    (#%lambda #t
      (|proc_1QZ_3sWNN|)
      ()
      (#%lambda #t
        (|file_1QFU_lXNN| . |rest_1QjY1VWNN|)
        (|proc_1QZ_3sWNN|)
        (apply |proc_1QZ_3sWNN|
               (normalize-url (current-url) |file_1QFU_lXNN|)
               |rest_1QjY1VWNN|)))))
(#%program
  ((|url_1QprLZ-NN| . 1)
   (string->list . 1)
   (reverse! . 1)
   (cons . 1)
   (cdr . 1)
   (|loop_1QLnJq_NN| . 2)
   (|acc_1QrgFk0ON| . 2)
   (list->string . 1)
   (car . 2)
   (equal? . 1)
   (|x_1Q5kHT_NN| . 4)
   (null? . 1)
   (void . 1)
   (|file-extension_1Q_QZOXNN| . 1)
   (|fe_1Q3vNw-NN| . 2)
   (file-handler . 1)
   (|e_1QnCRCZNN| . 1)
   (|m_1Q1GT9ZNN| . 1)
   (|fk_1QJyP3-NN| . 1)
   (call-with-failure-continuation . 1)
   (with-failure-continuation . 1)
   (|file_1QlNXfYNN| . 1)
   (|previous-url_1QHJVIYNN| . 3)
   (normalize-url . 1)
   (current-url . 6)
   (load . 1)
   (open-output-file . 2)
   (open-source-input-file . 2)
   (make-io-proc . 3)
   (open-input-file . 2))
  ((|loop_1QLnJq_NN| . 1)
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
     (|file-extension_1Q_QZOXNN|)
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
           (|file_1QlNXfYNN|)
           (|file-extension_1Q_QZOXNN|)
           (#%begin
             ((#%lambda #t
                (|previous-url_1QHJVIYNN|)
                (|file_1QlNXfYNN| |file-extension_1Q_QZOXNN|)
                (#%begin
                  (current-url
                    (normalize-url
                      |previous-url_1QHJVIYNN|
                      |file_1QlNXfYNN|))
                  (with-failure-continuation
                    (#%lambda #t
                      (|m_1Q1GT9ZNN| |e_1QnCRCZNN|)
                      (|previous-url_1QHJVIYNN|)
                      (#%begin
                        (current-url |previous-url_1QHJVIYNN|)
                        (call-with-failure-continuation
                          (#%lambda #t
                            (|fk_1QJyP3-NN|)
                            (|e_1QnCRCZNN| |m_1Q1GT9ZNN|)
                            (|fk_1QJyP3-NN| |m_1Q1GT9ZNN| |e_1QnCRCZNN|)))))
                    (#%lambda #t
                      ()
                      (|file-extension_1Q_QZOXNN|)
                      ((#%lambda #t
                         (|fe_1Q3vNw-NN|)
                         ()
                         ((file-handler
                            (#%if |fe_1Q3vNw-NN| |fe_1Q3vNw-NN| "scm"))
                          (current-url)))
                       (|file-extension_1Q_QZOXNN| (current-url)))))
                  (current-url |previous-url_1QHJVIYNN|)))
              (current-url))
             (void))))))
   (#%lambda #t
     (|url_1QprLZ-NN|)
     ()
     ((#%letrec #t
        ((|loop_1QLnJq_NN|
           (#%lambda #t
             (|x_1Q5kHT_NN| |acc_1QrgFk0ON|)
             (|loop_1QLnJq_NN|)
             (#%if (null? |x_1Q5kHT_NN|)
               #f
               (#%if (equal? (car |x_1Q5kHT_NN|) #\.)
                 (list->string |acc_1QrgFk0ON|)
                 (|loop_1QLnJq_NN|
                   (cdr |x_1Q5kHT_NN|)
                   (cons (car |x_1Q5kHT_NN|) |acc_1QrgFk0ON|)))))))
        ()
        |loop_1QLnJq_NN|)
      (reverse! (string->list |url_1QprLZ-NN|))
      ()))))
(#%program
  ((|str_1QNcDN0ON| . 1)
   (load-native-library . 1)
   (native-library-binding-names . 1)
   (|binding-names_1Qt5zH1ON| . 1)
   (|nl_1Q79Be1ON| . 2)
   (native-library-binding . 1)
   (|name_1QP1x82ON| . 2)
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
      (|str_1QNcDN0ON|)
      ()
      ((#%lambda #t
         (|nl_1Q79Be1ON|)
         ()
         ((#%lambda #t
            (|binding-names_1Qt5zH1ON|)
            (|nl_1Q79Be1ON|)
            (for-each
              (#%lambda #t
                (|name_1QP1x82ON|)
                (|nl_1Q79Be1ON|)
                (putprop
                  |name_1QP1x82ON|
                  (native-library-binding
                    |nl_1Q79Be1ON|
                    |name_1QP1x82ON|)))
              |binding-names_1Qt5zH1ON|))
          (native-library-binding-names |nl_1Q79Be1ON|)))
       (load-native-library |str_1QNcDN0ON|)))))
(#%program
  ((|lses_1QvWs23ON| . 5)
   (cdr . 3)
   (car . 3)
   (append2 . 1)
   (|real-append_1Q9-uB2ON| . 3)
   (apply . 3)
   (|ls1_1QbPoY3ON| . 3)
   (|lses_1QRSqv3ON| . 4)
   (null? . 4))
  ((|real-append_1Q9-uB2ON| . 1))
  (apply cdr append2 car null?)
  (#%define append
    (#%letrec #t
      ((|real-append_1Q9-uB2ON|
         (#%lambda #t
           (|ls1_1QbPoY3ON| . |lses_1QRSqv3ON|)
           (|real-append_1Q9-uB2ON|)
           (#%if (null? |lses_1QRSqv3ON|)
             |ls1_1QbPoY3ON|
             (#%if (null? |ls1_1QbPoY3ON|)
               (apply |real-append_1Q9-uB2ON| |lses_1QRSqv3ON|)
               (apply |real-append_1Q9-uB2ON|
                      (append2 |ls1_1QbPoY3ON| (car |lses_1QRSqv3ON|))
                      (cdr |lses_1QRSqv3ON|)))))))
      ()
      (#%lambda #t
        |lses_1QvWs23ON|
        (|real-append_1Q9-uB2ON|)
        (#%if (null? |lses_1QvWs23ON|)
          ()
          (#%if (null? (cdr |lses_1QvWs23ON|))
            (car |lses_1QvWs23ON|)
            (apply |real-append_1Q9-uB2ON|
                   (car |lses_1QvWs23ON|)
                   (cdr |lses_1QvWs23ON|))))))))
(#%program
  ((|x_1QxLmp4ON| . 2)
   (null? . 2)
   (|lag_1QzAgM5ON| . 1)
   (cdr . 3)
   (|lp_1QTHkS4ON| . 2)
   (|lag_1QBpa77ON| . 2)
   (|x_1QftcG6ON| . 2)
   (eq? . 1)
   (not . 1)
   (|x_1QVwed6ON| . 3)
   (|x_1QdEij5ON| . 3)
   (pair? . 2))
  ((|lp_1QTHkS4ON| . 1))
  (pair? cdr eq? not null?)
  (#%define proper-list?
    (#%lambda #t
      (|x_1QxLmp4ON|)
      ()
      ((#%letrec #t
         ((|lp_1QTHkS4ON|
            (#%lambda #t
              (|x_1QdEij5ON| |lag_1QzAgM5ON|)
              (|lp_1QTHkS4ON|)
              (#%if (pair? |x_1QdEij5ON|)
                ((#%lambda #t
                   (|x_1QVwed6ON|)
                   (|lag_1QzAgM5ON| |lp_1QTHkS4ON|)
                   (#%if (pair? |x_1QVwed6ON|)
                     ((#%lambda #t
                        (|x_1QftcG6ON| |lag_1QBpa77ON|)
                        (|lp_1QTHkS4ON|)
                        (#%if (not (eq? |x_1QftcG6ON| |lag_1QBpa77ON|))
                          (|lp_1QTHkS4ON| |x_1QftcG6ON| |lag_1QBpa77ON|)
                          #f))
                      (cdr |x_1QVwed6ON|)
                      (cdr |lag_1QzAgM5ON|))
                     (null? |x_1QVwed6ON|)))
                 (cdr |x_1QdEij5ON|))
                (null? |x_1QdEij5ON|)))))
         ()
         |lp_1QTHkS4ON|)
       |x_1QxLmp4ON|
       |x_1QxLmp4ON|))))
(#%program
  ((proper-list? . 1))
  ()
  (proper-list?)
  (#%define list? proper-list?))
(#%program
  ((|general-expt_1QXl8A7ON| . 1)
   (denominator . 1)
   (numerator . 1)
   (|rational-expt_1Qhi618ON| . 1)
   (integer? . 2)
   (not . 1)
   (rational? . 1)
   (|base_1QZa2X8ON| . 9)
   (|exponent_1Qj70o9ON| . 8)
   (|squaring_1Q5vFmeON| . 3)
   (odd? . 1)
   (quotient . 1)
   (|loop_1Q3GL_cON| . 2)
   (|result_1QLyHVdON| . 3)
   (|rest_1QpCJsdON| . 3)
   (zero? . 3)
   (ashl . 1)
   (= . 1)
   (exact? . 5)
   (abs . 1)
   (|base_1QnNP5cON| . 4)
   (|integer-expt_1QDe4u8ON| . 2)
   (|exponent_1QJJNycON| . 4)
   (negative? . 1)
   (|base-denominator_1QHUTbbON| . 1)
   (|exponent_1Q1RREbON| . 2)
   (|base-numerator_1QlYVKaON| . 1)
   (expt . 2)
   (/ . 2)
   (|base_1QF3-Q9ON| . 1)
   (log . 1)
   (|exponent_1Q__XhaON| . 1)
   (* . 3)
   (exp . 1))
  ((|loop_1Q3GL_cON| . 1)
   (|integer-expt_1QDe4u8ON| . 1)
   (|rational-expt_1Qhi618ON| . 1)
   (|general-expt_1QXl8A7ON| . 1))
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
      ((|general-expt_1QXl8A7ON|
         (#%lambda #t
           (|base_1QF3-Q9ON| |exponent_1Q__XhaON|)
           ()
           (exp (* |exponent_1Q__XhaON| (log |base_1QF3-Q9ON|)))))
       (|rational-expt_1Qhi618ON|
         (#%lambda #t
           (|base-numerator_1QlYVKaON|
             |base-denominator_1QHUTbbON|
             |exponent_1Q1RREbON|)
           ()
           (/ (expt |base-numerator_1QlYVKaON|
                    |exponent_1Q1RREbON|)
              (expt |base-denominator_1QHUTbbON|
                    |exponent_1Q1RREbON|))))
       (|integer-expt_1QDe4u8ON|
         (#%lambda #t
           (|base_1QnNP5cON| |exponent_1QJJNycON|)
           (|integer-expt_1QDe4u8ON|)
           (#%if (negative? |exponent_1QJJNycON|)
             (/ (|integer-expt_1QDe4u8ON|
                  |base_1QnNP5cON|
                  (abs |exponent_1QJJNycON|)))
             (#%if (#%if (exact? |base_1QnNP5cON|)
                     (= |base_1QnNP5cON| 2)
                     #f)
               (ashl 1 |exponent_1QJJNycON|)
               ((#%letrec #t
                  ((|loop_1Q3GL_cON|
                     (#%lambda #t
                       (|rest_1QpCJsdON|
                         |result_1QLyHVdON|
                         |squaring_1Q5vFmeON|)
                       (|loop_1Q3GL_cON|)
                       (#%if (zero? |rest_1QpCJsdON|)
                         |result_1QLyHVdON|
                         (|loop_1Q3GL_cON|
                           (quotient |rest_1QpCJsdON| 2)
                           (#%if (odd? |rest_1QpCJsdON|)
                             (* |result_1QLyHVdON| |squaring_1Q5vFmeON|)
                             |result_1QLyHVdON|)
                           (* |squaring_1Q5vFmeON| |squaring_1Q5vFmeON|))))))
                  ()
                  |loop_1Q3GL_cON|)
                |exponent_1QJJNycON|
                1
                |base_1QnNP5cON|))))))
      ()
      (#%lambda #t
        (|base_1QZa2X8ON| |exponent_1Qj70o9ON|)
        (|integer-expt_1QDe4u8ON|
          |rational-expt_1Qhi618ON|
          |general-expt_1QXl8A7ON|)
        (#%if (zero? |exponent_1Qj70o9ON|)
          (#%if (exact? |exponent_1Qj70o9ON|) 1 1.0)
          (#%if (zero? |base_1QZa2X8ON|)
            (#%if (exact? |exponent_1Qj70o9ON|)
              |base_1QZa2X8ON|
              0.0)
            (#%if (#%if (exact? |base_1QZa2X8ON|)
                    (#%if (rational? |base_1QZa2X8ON|)
                      (not (integer? |base_1QZa2X8ON|))
                      #f)
                    #f)
              (|rational-expt_1Qhi618ON|
                (numerator |base_1QZa2X8ON|)
                (denominator |base_1QZa2X8ON|)
                |exponent_1Qj70o9ON|)
              (#%if (#%if (exact? |exponent_1Qj70o9ON|)
                      (integer? |exponent_1Qj70o9ON|)
                      #f)
                (|integer-expt_1QDe4u8ON|
                  |base_1QZa2X8ON|
                  |exponent_1Qj70o9ON|)
                (|general-expt_1QXl8A7ON|
                  |base_1QZa2X8ON|
                  |exponent_1Qj70o9ON|)))))))))
(#%program
  ((- . 1)
   (|tmp_1QtgxagON| . 2)
   (/ . 2)
   (modpow . 2)
   (|tmp_1QPcvDgON| . 2)
   (* . 3)
   (even? . 1)
   (|n_1Q7kzJfON| . 6)
   (|x_1QrrDPeON| . 4)
   (modulo . 4)
   (|y_1QNnBgfON| . 4)
   (= . 1))
  ()
  (even? modpow / * - modulo =)
  (#%define modpow
    (#%lambda #t
      (|x_1QrrDPeON| |y_1QNnBgfON| |n_1Q7kzJfON|)
      ()
      (#%if (= |y_1QNnBgfON| 1)
        (modulo |x_1QrrDPeON| |n_1Q7kzJfON|)
        (#%if (even? |y_1QNnBgfON|)
          ((#%lambda #t
             (|tmp_1QPcvDgON|)
             (|n_1Q7kzJfON|)
             (modulo
               (* |tmp_1QPcvDgON| |tmp_1QPcvDgON|)
               |n_1Q7kzJfON|))
           (modpow
             |x_1QrrDPeON|
             (/ |y_1QNnBgfON| 2)
             |n_1Q7kzJfON|))
          ((#%lambda #t
             (|tmp_1QtgxagON|)
             (|n_1Q7kzJfON| |x_1QrrDPeON|)
             (modulo
               (* |x_1QrrDPeON|
                  (modulo
                    (* |tmp_1QtgxagON| |tmp_1QtgxagON|)
                    |n_1Q7kzJfON|))
               |n_1Q7kzJfON|))
           (modpow
             |x_1QrrDPeON|
             (/ (- |y_1QNnBgfON| 1) 2)
             |n_1Q7kzJfON|)))))))
(#%program
  ((integer? . 1)
   (round . 1)
   (= . 1)
   (real? . 1)
   (|n_1Qv5rxhON| . 4)
   (|oldint?_1Q99t4hON| . 1))
  ()
  (integer? = round real?)
  (#%define integer?
    ((#%lambda #t
       (|oldint?_1Q99t4hON|)
       ()
       (#%lambda #t
         (|n_1Qv5rxhON|)
         (|oldint?_1Q99t4hON|)
         (#%if (|oldint?_1Q99t4hON| |n_1Qv5rxhON|)
           #t
           (#%if (real? |n_1Qv5rxhON|)
             (= (round |n_1Qv5rxhON|) |n_1Qv5rxhON|)
             #f))))
     integer?)))
(#%program
  ((complex? . 1)
   (|oldcomp?_1QR1p-hON| . 1)
   (not . 1)
   (|n_1Qb-mriON| . 2)
   (number? . 1))
  ()
  (complex? number? not)
  (#%define real?
    ((#%lambda #t
       (|oldcomp?_1QR1p-hON|)
       ()
       (#%lambda #t
         (|n_1Qb-mriON|)
         (|oldcomp?_1QR1p-hON|)
         (#%if (number? |n_1Qb-mriON|)
           (not (|oldcomp?_1QR1p-hON| |n_1Qb-mriON|))
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
   (|b_1QdPgOjON| . 2)
   (|a_1QTSiljON| . 2)
   (* . 2)
   (+ . 1)
   (sqrt . 1)
   (|num_1QxWkUiON| . 6)
   (real? . 1)
   (not . 1))
  ()
  (< - + * sqrt real-part imag-part not real?)
  (#%define abs
    (#%lambda #t
      (|num_1QxWkUiON|)
      ()
      (#%if (not (real? |num_1QxWkUiON|))
        ((#%lambda #t
           (|a_1QTSiljON| |b_1QdPgOjON|)
           ()
           (sqrt (+ (* |a_1QTSiljON| |a_1QTSiljON|)
                    (* |b_1QdPgOjON| |b_1QdPgOjON|))))
         (real-part |num_1QxWkUiON|)
         (imag-part |num_1QxWkUiON|))
        (#%if (< |num_1QxWkUiON| 0)
          (- |num_1QxWkUiON|)
          |num_1QxWkUiON|)))))
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
   (|x1_1QXw63mON| . 3)
   (|args_1QBA8ClON| . 2)
   (max . 1)
   (< . 1)
   (|x1_1QfEa9lON| . 3)
   (|args_1QVHcIkON| . 2)
   (min . 1)
   (inexact? . 3)
   (cdr . 2)
   (|_min_max_1QzLefkON| . 4)
   (car . 3)
   (|proc_1Qht4wmON| . 3)
   (exact->inexact . 1)
   (|mv_1QDp2ZmON| . 5)
   (exact? . 1)
   (|inexact_1Qji-SnON| . 3)
   (|args_1QZl0qnON| . 6)
   (null? . 3))
  ((max . 1) (min . 1) (|_min_max_1QzLefkON| . 1))
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
    ((|_min_max_1QzLefkON|
       (#%lambda #t
         (|proc_1Qht4wmON|
           |mv_1QDp2ZmON|
           |args_1QZl0qnON|
           |inexact_1Qji-SnON|)
         (|_min_max_1QzLefkON|)
         (#%if (null? |args_1QZl0qnON|)
           (#%if (#%if |inexact_1Qji-SnON|
                   (exact? |mv_1QDp2ZmON|)
                   #f)
             (exact->inexact |mv_1QDp2ZmON|)
             |mv_1QDp2ZmON|)
           (#%if (|proc_1Qht4wmON|
                   (car |args_1QZl0qnON|)
                   |mv_1QDp2ZmON|)
             (|_min_max_1QzLefkON|
               |proc_1Qht4wmON|
               (car |args_1QZl0qnON|)
               (cdr |args_1QZl0qnON|)
               (#%if |inexact_1Qji-SnON|
                 #t
                 (inexact? (car |args_1QZl0qnON|))))
             (|_min_max_1QzLefkON|
               |proc_1Qht4wmON|
               |mv_1QDp2ZmON|
               (cdr |args_1QZl0qnON|)
               |inexact_1Qji-SnON|))))))
    ()
    (#%begin
      (#%set! min
        (#%lambda #t
          (|x1_1QfEa9lON| . |args_1QVHcIkON|)
          (|_min_max_1QzLefkON|)
          (#%if (null? |args_1QVHcIkON|)
            |x1_1QfEa9lON|
            (|_min_max_1QzLefkON|
              <
              |x1_1QfEa9lON|
              |args_1QVHcIkON|
              (inexact? |x1_1QfEa9lON|)))))
      (#%set! max
        (#%lambda #t
          (|x1_1QXw63mON| . |args_1QBA8ClON|)
          (|_min_max_1QzLefkON|)
          (#%if (null? |args_1QBA8ClON|)
            |x1_1QXw63mON|
            (|_min_max_1QzLefkON|
              >
              |x1_1QXw63mON|
              |args_1QBA8ClON|
              (inexact? |x1_1QXw63mON|))))))))
(#%program
  ((|n_1QFeYjoON| . 1) (< . 1))
  ()
  (<)
  (#%define negative?
    (#%lambda #t
      (|n_1QFeYjoON|)
      ()
      (< |n_1QFeYjoON| 0))))
(#%program
  ((|n_1Q_aWMoON| . 1) (> . 1))
  ()
  (>)
  (#%define positive?
    (#%lambda #t
      (|n_1Q_aWMoON|)
      ()
      (> |n_1Q_aWMoON| 0))))
(#%program
  ((|n_1Ql7UdpON| . 1) (modulo . 1) (= . 1))
  ()
  (modulo =)
  (#%define even?
    (#%lambda #t
      (|n_1Ql7UdpON|)
      ()
      (= 0 (modulo |n_1Ql7UdpON| 2)))))
(#%program
  ((|n_1QH3SGpON| . 1) (even? . 1) (not . 1))
  ()
  (even? not)
  (#%define odd?
    (#%lambda #t
      (|n_1QH3SGpON|)
      ()
      (not (even? |n_1QH3SGpON|)))))
(#%program
  ((|n_1Q10Q7qON| . 1) (= . 1))
  ()
  (=)
  (#%define zero?
    (#%lambda #t
      (|n_1Q10Q7qON|)
      ()
      (= |n_1Q10Q7qON| 0))))
(#%program
  ((|n_1QnYNAqON| . 1) (+ . 1))
  ()
  (+)
  (#%define add1
    (#%lambda #t
      (|n_1QnYNAqON|)
      ()
      (+ |n_1QnYNAqON| 1))))
(#%program
  ((|n_1QJUL1rON| . 1) (- . 1))
  ()
  (-)
  (#%define sub1
    (#%lambda #t
      (|n_1QJUL1rON|)
      ()
      (- |n_1QJUL1rON| 1))))
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
  ((|y_1Qx5jnxON| . 1)
   (|x_1Qb9lWwON| . 1)
   (|args_1Q9krzvON| . 1)
   (|loop_1Qvgp0wON| . 2)
   (cadr . 1)
   (car . 1)
   (|comparator_1Q7vxcuON| . 1)
   (|chainer_1QtrvFuON| . 1)
   (cdr . 2)
   (|endstate_1QPnt6vON| . 2)
   (|x_1QRcntwON| . 5)
   (null? . 2)
   (|b_1QNyzLtON| . 2)
   (|a_1QrCBitON| . 2)
   (> . 1)
   (>= . 1)
   (|_and2_1QpNHXrON| . 2)
   (= . 2)
   (|b_1Q5GDRsON| . 2)
   (|a_1QLJFosON| . 2)
   (< . 1)
   (|_comp_help_1Q3RJurON| . 2)
   (<= . 1))
  ((|loop_1Qvgp0wON| . 1) (>= . 1) (<= . 1))
  (null? cadr car cdr <= = < >= >)
  ((#%lambda #t
     (|_comp_help_1Q3RJurON| |_and2_1QpNHXrON|)
     ()
     (#%begin
       (#%set! <=
         (|_comp_help_1Q3RJurON|
           (#%lambda #t
             (|a_1QLJFosON| |b_1Q5GDRsON|)
             ()
             (#%if (< |a_1QLJFosON| |b_1Q5GDRsON|)
               #t
               (= |a_1QLJFosON| |b_1Q5GDRsON|)))
           |_and2_1QpNHXrON|
           #t))
       (#%set! >=
         (|_comp_help_1Q3RJurON|
           (#%lambda #t
             (|a_1QrCBitON| |b_1QNyzLtON|)
             ()
             (#%if (> |a_1QrCBitON| |b_1QNyzLtON|)
               #t
               (= |a_1QrCBitON| |b_1QNyzLtON|)))
           |_and2_1QpNHXrON|
           #t))))
   (#%lambda #t
     (|comparator_1Q7vxcuON|
       |chainer_1QtrvFuON|
       |endstate_1QPnt6vON|)
     ()
     (#%lambda #t
       |args_1Q9krzvON|
       (|endstate_1QPnt6vON|
         |chainer_1QtrvFuON|
         |comparator_1Q7vxcuON|)
       ((#%letrec #t
          ((|loop_1Qvgp0wON|
             (#%lambda #t
               (|x_1QRcntwON|)
               (|loop_1Qvgp0wON|
                 |endstate_1QPnt6vON|
                 |chainer_1QtrvFuON|
                 |comparator_1Q7vxcuON|)
               (#%if (null? |x_1QRcntwON|)
                 |endstate_1QPnt6vON|
                 (#%if (null? (cdr |x_1QRcntwON|))
                   |endstate_1QPnt6vON|
                   (|chainer_1QtrvFuON|
                     (|comparator_1Q7vxcuON|
                       (car |x_1QRcntwON|)
                       (cadr |x_1QRcntwON|))
                     (|loop_1Qvgp0wON| (cdr |x_1QRcntwON|))))))))
          (|endstate_1QPnt6vON|
            |chainer_1QtrvFuON|
            |comparator_1Q7vxcuON|)
          |loop_1Qvgp0wON|)
        |args_1Q9krzvON|)))
   (#%lambda #t
     (|x_1Qb9lWwON| |y_1Qx5jnxON|)
     ()
     (#%if |x_1Qb9lWwON| |y_1Qx5jnxON| #f))))
(#%program
  ((|chainer_1QzWcKyON| . 1)
   (apply . 1)
   (|comparator_1Qd-ehyON| . 1)
   (cadr . 2)
   (car . 2)
   (= . 1)
   (cdr . 2)
   (|args_1QVSabzON| . 7)
   (null? . 2)
   (< . 1)
   (<= . 2)
   (> . 1)
   (|_?=_1QT1hQxON| . 2)
   (>= . 2))
  ((<= . 1) (>= . 1))
  (< <= <= > >= >= null? = car cadr apply cdr)
  ((#%lambda #t
     (|_?=_1QT1hQxON|)
     ()
     (#%begin
       (#%set! >= (|_?=_1QT1hQxON| > >=))
       (#%set! <= (|_?=_1QT1hQxON| < <=))))
   (#%lambda #t
     (|comparator_1Qd-ehyON| |chainer_1QzWcKyON|)
     ()
     (#%lambda #t
       |args_1QVSabzON|
       (|chainer_1QzWcKyON| |comparator_1Qd-ehyON|)
       (#%if (null? |args_1QVSabzON|)
         #t
         (#%if (null? (cdr |args_1QVSabzON|))
           #t
           (#%if (#%if (= (car |args_1QVSabzON|)
                          (cadr |args_1QVSabzON|))
                   #t
                   (|comparator_1Qd-ehyON|
                     (car |args_1QVSabzON|)
                     (cadr |args_1QVSabzON|)))
             (apply |chainer_1QzWcKyON|
                    (cdr |args_1QVSabzON|))
             #f)))))))
(#%program
  ((cadr . 1)
   (_gcd . 1)
   (car . 2)
   (cdr . 1)
   (|args_1QBL65AON| . 5)
   (null? . 2))
  ()
  (cdr car cadr _gcd null?)
  (#%define gcd
    (#%lambda #t
      |args_1QBL65AON|
      ()
      (#%if (null? |args_1QBL65AON|)
        0
        (#%if (null? (cdr |args_1QBL65AON|))
          (car |args_1QBL65AON|)
          (_gcd (car |args_1QBL65AON|)
                (cadr |args_1QBL65AON|)))))))
(#%program
  ((cadr . 1)
   (_lcm . 1)
   (car . 2)
   (cdr . 1)
   (|args_1QXH4yAON| . 5)
   (null? . 2))
  ()
  (cdr car cadr _lcm null?)
  (#%define lcm
    (#%lambda #t
      |args_1QXH4yAON|
      ()
      (#%if (null? |args_1QXH4yAON|)
        1
        (#%if (null? (cdr |args_1QXH4yAON|))
          (car |args_1QXH4yAON|)
          (_lcm (car |args_1QXH4yAON|)
                (cadr |args_1QXH4yAON|)))))))
(#%program
  ((|x_1QhE2_AON| . 1)
   (remainder . 1)
   (+ . 1)
   (|r_1QZw-UBON| . 3)
   (positive? . 1)
   (|y_1QDA0sBON| . 3)
   (negative? . 2))
  ()
  (remainder positive? negative? +)
  (#%define modulo
    (#%lambda #t
      (|x_1QhE2_AON| |y_1QDA0sBON|)
      ()
      ((#%lambda #t
         (|r_1QZw-UBON|)
         (|y_1QDA0sBON|)
         (#%if ((#%if (negative? |y_1QDA0sBON|)
                  positive?
                  negative?)
                |r_1QZw-UBON|)
           (+ |r_1QZw-UBON| |y_1QDA0sBON|)
           |r_1QZw-UBON|))
       (remainder |x_1QhE2_AON| |y_1QDA0sBON|)))))
(#%program
  ((|args_1QFpWOCON| . 3)
   (cdr . 2)
   (car . 2)
   (_string-append . 1)
   (|string-append-helper_1QjtYlCON| . 2)
   (|acc_1Q_lUfDON| . 2)
   (|args_1QliSIDON| . 3)
   (null? . 2))
  ((|string-append-helper_1QjtYlCON| . 1))
  (car _string-append cdr null?)
  (#%define string-append
    (#%letrec #t
      ((|string-append-helper_1QjtYlCON|
         (#%lambda #t
           (|acc_1Q_lUfDON| |args_1QliSIDON|)
           (|string-append-helper_1QjtYlCON|)
           (#%if (null? |args_1QliSIDON|)
             |acc_1Q_lUfDON|
             (|string-append-helper_1QjtYlCON|
               (_string-append
                 |acc_1Q_lUfDON|
                 (car |args_1QliSIDON|))
               (cdr |args_1QliSIDON|))))))
      ()
      (#%lambda #t
        |args_1QFpWOCON|
        (|string-append-helper_1QjtYlCON|)
        (#%if (null? |args_1QFpWOCON|)
          ""
          (|string-append-helper_1QjtYlCON|
            (car |args_1QFpWOCON|)
            (cdr |args_1QFpWOCON|)))))))
(#%program
  ((- . 1)
   (char->integer . 4)
   (|c_1QJ3KwFON| . 2)
   (|lc-offset_1Qn7M3FON| . 1)
   (+ . 1)
   (integer->char . 1)
   (|z_1Q1bOCEON| . 1)
   (<= . 1)
   (|a_1QHeQ9EON| . 2)
   (|cv_1Q30IZFON| . 3)
   (>= . 1))
  ()
  (integer->char + >= <= char->integer -)
  (#%define char-downcase
    ((#%lambda #t
       (|a_1QHeQ9EON|)
       ()
       ((#%lambda #t
          (|z_1Q1bOCEON|)
          (|a_1QHeQ9EON|)
          ((#%lambda #t
             (|lc-offset_1Qn7M3FON|)
             (|z_1Q1bOCEON| |a_1QHeQ9EON|)
             (#%lambda #t
               (|c_1QJ3KwFON|)
               (|lc-offset_1Qn7M3FON|
                 |z_1Q1bOCEON|
                 |a_1QHeQ9EON|)
               ((#%lambda #t
                  (|cv_1Q30IZFON|)
                  (|c_1QJ3KwFON|
                    |lc-offset_1Qn7M3FON|
                    |z_1Q1bOCEON|
                    |a_1QHeQ9EON|)
                  (#%if (#%if (>= |cv_1Q30IZFON| |a_1QHeQ9EON|)
                          (<= |cv_1Q30IZFON| |z_1Q1bOCEON|)
                          #f)
                    (integer->char
                      (+ |cv_1Q30IZFON| |lc-offset_1Qn7M3FON|))
                    |c_1QJ3KwFON|))
                (char->integer |c_1QJ3KwFON|))))
           (- (char->integer #\a) |a_1QHeQ9EON|)))
        (char->integer #\Z)))
     (char->integer #\A))))
(#%program
  ((char->integer . 4)
   (|c_1QrNzNHON| . 2)
   (|uc-offset_1Q5RBkHON| . 1)
   (- . 2)
   (integer->char . 1)
   (|z_1QLUDTGON| . 1)
   (<= . 1)
   (|a_1QpYFqGON| . 2)
   (|cv_1QNJxeION| . 3)
   (>= . 1))
  ()
  (integer->char - >= <= char->integer)
  (#%define char-upcase
    ((#%lambda #t
       (|a_1QpYFqGON|)
       ()
       ((#%lambda #t
          (|z_1QLUDTGON|)
          (|a_1QpYFqGON|)
          ((#%lambda #t
             (|uc-offset_1Q5RBkHON|)
             (|z_1QLUDTGON| |a_1QpYFqGON|)
             (#%lambda #t
               (|c_1QrNzNHON|)
               (|uc-offset_1Q5RBkHON|
                 |z_1QLUDTGON|
                 |a_1QpYFqGON|)
               ((#%lambda #t
                  (|cv_1QNJxeION|)
                  (|c_1QrNzNHON|
                    |uc-offset_1Q5RBkHON|
                    |z_1QLUDTGON|
                    |a_1QpYFqGON|)
                  (#%if (#%if (>= |cv_1QNJxeION| |a_1QpYFqGON|)
                          (<= |cv_1QNJxeION| |z_1QLUDTGON|)
                          #f)
                    (integer->char
                      (- |cv_1QNJxeION| |uc-offset_1Q5RBkHON|))
                    |c_1QrNzNHON|))
                (char->integer |c_1QrNzNHON|))))
           (- |a_1QpYFqGON| (char->integer #\A))))
        (char->integer #\z)))
     (char->integer #\a))))
(#%program
  ((|args_1Q7GvHION| . 1)
   (map . 1)
   (|c2_1QtCt8JON| . 1)
   (|c1_1QPyrBJON| . 1)
   (char->integer . 3)
   (> . 1)
   (apply . 1))
  ()
  (map char->integer > apply)
  (#%define char>?
    (#%lambda #t
      (|c1_1QPyrBJON|
        |c2_1QtCt8JON|
        .
        |args_1Q7GvHION|)
      ()
      (apply >
             (char->integer |c1_1QPyrBJON|)
             (char->integer |c2_1QtCt8JON|)
             (map char->integer |args_1Q7GvHION|)))))
(#%program
  ((|args_1Q9vp2KON| . 1)
   (map . 1)
   (|c2_1QvrnvKON| . 1)
   (|c1_1QRnlYKON| . 1)
   (char->integer . 3)
   (< . 1)
   (apply . 1))
  ()
  (map char->integer < apply)
  (#%define char<?
    (#%lambda #t
      (|c1_1QRnlYKON|
        |c2_1QvrnvKON|
        .
        |args_1Q9vp2KON|)
      ()
      (apply <
             (char->integer |c1_1QRnlYKON|)
             (char->integer |c2_1QvrnvKON|)
             (map char->integer |args_1Q9vp2KON|)))))
(#%program
  ((eqv? . 1))
  ()
  (eqv?)
  (#%define char=? eqv?))
(#%program
  ((char=? . 1)
   (|c2_1QxghSLON| . 2)
   (|c1_1QbkjpLON| . 2)
   (char>? . 1))
  ()
  (char=? char>?)
  (#%define char>=?
    (#%lambda #t
      (|c1_1QbkjpLON| |c2_1QxghSLON|)
      ()
      (#%if (char>? |c1_1QbkjpLON| |c2_1QxghSLON|)
        #t
        (char=? |c1_1QbkjpLON| |c2_1QxghSLON|)))))
(#%program
  ((char=? . 1)
   (|c2_1Qd9dMMON| . 2)
   (|c1_1QTcfjMON| . 2)
   (char<? . 1))
  ()
  (char=? char<?)
  (#%define char<=?
    (#%lambda #t
      (|c1_1QTcfjMON| |c2_1Qd9dMMON|)
      ()
      (#%if (char<? |c1_1QTcfjMON| |c2_1Qd9dMMON|)
        #t
        (char=? |c1_1QTcfjMON| |c2_1Qd9dMMON|)))))
(#%program
  ((|args_1Qz5bdNON| . 1)
   (map . 1)
   (|c2_1QV19GNON| . 1)
   (|c1_1Qf-67OON| . 1)
   (char-downcase . 3)
   (char>? . 1)
   (apply . 1))
  ()
  (map char-downcase char>? apply)
  (#%define char-ci>?
    (#%lambda #t
      (|c1_1Qf-67OON|
        |c2_1QV19GNON|
        .
        |args_1Qz5bdNON|)
      ()
      (apply char>?
             (char-downcase |c1_1Qf-67OON|)
             (char-downcase |c2_1QV19GNON|)
             (map char-downcase |args_1Qz5bdNON|)))))
(#%program
  ((|args_1QBW4AOON| . 1)
   (map . 1)
   (|c2_1QXS21PON| . 1)
   (|c1_1QhP0uPON| . 1)
   (char-downcase . 3)
   (char<? . 1)
   (apply . 1))
  ()
  (map char-downcase char<? apply)
  (#%define char-ci<?
    (#%lambda #t
      (|c1_1QhP0uPON|
        |c2_1QXS21PON|
        .
        |args_1QBW4AOON|)
      ()
      (apply char<?
             (char-downcase |c1_1QhP0uPON|)
             (char-downcase |c2_1QXS21PON|)
             (map char-downcase |args_1QBW4AOON|)))))
(#%program
  ((|args_1QDL-WPON| . 1)
   (map . 1)
   (|c2_1QZHYnQON| . 1)
   (|c1_1QjEWQQON| . 1)
   (char-downcase . 3)
   (char=? . 1)
   (apply . 1))
  ()
  (map char-downcase char=? apply)
  (#%define char-ci=?
    (#%lambda #t
      (|c1_1QjEWQQON|
        |c2_1QZHYnQON|
        .
        |args_1QDL-WPON|)
      ()
      (apply char=?
             (char-downcase |c1_1QjEWQQON|)
             (char-downcase |c2_1QZHYnQON|)
             (map char-downcase |args_1QDL-WPON|)))))
(#%program
  ((char-ci=? . 1)
   (|c2_1Q_wSKRON| . 2)
   (|c1_1QFAUhRON| . 2)
   (char-ci>? . 1))
  ()
  (char-ci=? char-ci>?)
  (#%define char-ci>=?
    (#%lambda #t
      (|c1_1QFAUhRON| |c2_1Q_wSKRON|)
      ()
      (#%if (char-ci>? |c1_1QFAUhRON| |c2_1Q_wSKRON|)
        #t
        (char-ci=? |c1_1QFAUhRON| |c2_1Q_wSKRON|)))))
(#%program
  ((char-ci=? . 1)
   (|c2_1QHpOESON| . 2)
   (|c1_1QltQbSON| . 2)
   (char-ci<? . 1))
  ()
  (char-ci=? char-ci<?)
  (#%define char-ci<=?
    (#%lambda #t
      (|c1_1QltQbSON| |c2_1QHpOESON|)
      ()
      (#%if (char-ci<? |c1_1QltQbSON| |c2_1QHpOESON|)
        #t
        (char-ci=? |c1_1QltQbSON| |c2_1QHpOESON|)))))
(#%program
  ((|c_1Q1mM5TON| . 2) (char<? . 2))
  ()
  (char<?)
  (#%define char-alphabetic?
    (#%lambda #t
      (|c_1Q1mM5TON|)
      ()
      (#%if (char<? #\@ |c_1Q1mM5TON| #\[)
        #t
        (char<? #\` |c_1Q1mM5TON| #\{)))))
(#%program
  ((|c_1QniKyTON| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-numeric?
    (#%lambda #t
      (|c_1QniKyTON|)
      ()
      (char<? #\/ |c_1QniKyTON| #\:))))
(#%program
  ((|c_1QJeI_TON| . 4) (char=? . 4))
  ()
  (char=?)
  (#%define char-whitespace?
    (#%lambda #t
      (|c_1QJeI_TON|)
      ()
      (#%if (char=? |c_1QJeI_TON| #\space)
        #t
        (#%if (char=? |c_1QJeI_TON| #\tab)
          #t
          (#%if (char=? |c_1QJeI_TON| #\newline)
            #t
            (char=? |c_1QJeI_TON| #\return)))))))
(#%program
  ((|c_1Q3bGsUON| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-upper-case?
    (#%lambda #t
      (|c_1Q3bGsUON|)
      ()
      (char<? #\@ |c_1Q3bGsUON| #\[))))
(#%program
  ((|c_1Qp7EVUON| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-lower-case?
    (#%lambda #t
      (|c_1Qp7EVUON|)
      ()
      (char<? #\` |c_1Qp7EVUON| #\{))))
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
   (|newstr_1Q7RtaXON| . 1)
   (|str_1QNUvJWON| . 3)
   (string-upcase . 1)
   (make-string . 2)
   (string-length . 4)
   (char-downcase . 1)
   (|newstr_1QrYxgWON| . 1)
   (|str_1Q50APVON| . 3)
   (string-downcase . 1)
   (+ . 1)
   (|string-map_1QL3CmVON| . 3)
   (|strsrc_1QtNrDXON| . 2)
   (string-ref . 1)
   (|proc_1Q9GnxYON| . 2)
   (|strdst_1QPJp4YON| . 3)
   (string-set! . 1)
   (|l_1QRyjrZON| . 2)
   (|n_1QvCl-YON| . 4)
   (< . 1))
  ((string-upcase . 1)
   (string-downcase . 1)
   (|string-map_1QL3CmVON| . 1))
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
    ((|string-map_1QL3CmVON|
       (#%lambda #t
         (|strsrc_1QtNrDXON|
           |strdst_1QPJp4YON|
           |proc_1Q9GnxYON|
           |n_1QvCl-YON|
           |l_1QRyjrZON|)
         (|string-map_1QL3CmVON|)
         (#%if (< |n_1QvCl-YON| |l_1QRyjrZON|)
           (#%begin
             (string-set!
               |strdst_1QPJp4YON|
               |n_1QvCl-YON|
               (|proc_1Q9GnxYON|
                 (string-ref |strsrc_1QtNrDXON| |n_1QvCl-YON|)))
             (|string-map_1QL3CmVON|
               |strsrc_1QtNrDXON|
               |strdst_1QPJp4YON|
               |proc_1Q9GnxYON|
               (+ |n_1QvCl-YON| 1)
               |l_1QRyjrZON|))
           |strdst_1QPJp4YON|))))
    ()
    (#%begin
      (#%set! string-downcase
        (#%lambda #t
          (|str_1Q50APVON|)
          (|string-map_1QL3CmVON|)
          ((#%lambda #t
             (|newstr_1QrYxgWON|)
             (|str_1Q50APVON| |string-map_1QL3CmVON|)
             (|string-map_1QL3CmVON|
               |str_1Q50APVON|
               |newstr_1QrYxgWON|
               char-downcase
               0
               (string-length |str_1Q50APVON|)))
           (make-string (string-length |str_1Q50APVON|)))))
      (#%set! string-upcase
        (#%lambda #t
          (|str_1QNUvJWON|)
          (|string-map_1QL3CmVON|)
          ((#%lambda #t
             (|newstr_1Q7RtaXON|)
             (|str_1QNUvJWON| |string-map_1QL3CmVON|)
             (|string-map_1QL3CmVON|
               |str_1QNUvJWON|
               |newstr_1Q7RtaXON|
               char-upcase
               0
               (string-length |str_1QNUvJWON|)))
           (make-string (string-length |str_1QNUvJWON|))))))))
(#%program
  ((equal? . 1))
  ()
  (equal?)
  (#%define string=? equal?))
(#%program
  ((|s2_1QTndO-ON| . 1)
   (|s1_1Qxrfl-ON| . 1)
   (string->list . 2)
   (car . 2)
   (cdr . 2)
   (|s<?_1QbvhUZON| . 2)
   (char>? . 1)
   (|c2_1Qf95C0PN| . 2)
   (|c1_1QVc790PN| . 2)
   (char<? . 1)
   (|s2_1Qzg9I_ON| . 4)
   (not . 1)
   (|s1_1Qdkbf_ON| . 3)
   (null? . 3))
  ((|s<?_1QbvhUZON| . 1))
  (string->list car char<? cdr char>? not null?)
  (#%define string<?
    (#%letrec #t
      ((|s<?_1QbvhUZON|
         (#%lambda #t
           (|s1_1Qdkbf_ON| |s2_1Qzg9I_ON|)
           (|s<?_1QbvhUZON|)
           (#%if (null? |s1_1Qdkbf_ON|)
             (not (null? |s2_1Qzg9I_ON|))
             (#%if (null? |s2_1Qzg9I_ON|)
               #f
               ((#%lambda #t
                  (|c1_1QVc790PN| |c2_1Qf95C0PN|)
                  (|s2_1Qzg9I_ON| |s1_1Qdkbf_ON| |s<?_1QbvhUZON|)
                  (#%if (char<? |c1_1QVc790PN| |c2_1Qf95C0PN|)
                    #t
                    (#%if (char>? |c1_1QVc790PN| |c2_1Qf95C0PN|)
                      #f
                      (|s<?_1QbvhUZON|
                        (cdr |s1_1Qdkbf_ON|)
                        (cdr |s2_1Qzg9I_ON|)))))
                (car |s1_1Qdkbf_ON|)
                (car |s2_1Qzg9I_ON|)))))))
      ()
      (#%lambda #t
        (|s1_1Qxrfl-ON| |s2_1QTndO-ON|)
        (|s<?_1QbvhUZON|)
        (|s<?_1QbvhUZON|
          (string->list |s1_1Qxrfl-ON|)
          (string->list |s2_1QTndO-ON|))))))
(#%program
  ((|s2_1Qh--Y1PN| . 1)
   (|s1_1QX11w1PN| . 1)
   (string->list . 2)
   (car . 2)
   (cdr . 2)
   (|s>?_1QB5331PN| . 2)
   (char<? . 1)
   (|c2_1QFLSM3PN| . 2)
   (|c1_1QjPUj3PN| . 2)
   (char>? . 1)
   (|s1_1QDWYp2PN| . 4)
   (not . 1)
   (|s2_1QZSWS2PN| . 3)
   (null? . 3))
  ((|s>?_1QB5331PN| . 1))
  (string->list car char>? cdr char<? not null?)
  (#%define string>?
    (#%letrec #t
      ((|s>?_1QB5331PN|
         (#%lambda #t
           (|s1_1QDWYp2PN| |s2_1QZSWS2PN|)
           (|s>?_1QB5331PN|)
           (#%if (null? |s2_1QZSWS2PN|)
             (not (null? |s1_1QDWYp2PN|))
             (#%if (null? |s1_1QDWYp2PN|)
               #f
               ((#%lambda #t
                  (|c1_1QjPUj3PN| |c2_1QFLSM3PN|)
                  (|s2_1QZSWS2PN| |s1_1QDWYp2PN| |s>?_1QB5331PN|)
                  (#%if (char>? |c1_1QjPUj3PN| |c2_1QFLSM3PN|)
                    #t
                    (#%if (char<? |c1_1QjPUj3PN| |c2_1QFLSM3PN|)
                      #f
                      (|s>?_1QB5331PN|
                        (cdr |s1_1QDWYp2PN|)
                        (cdr |s2_1QZSWS2PN|)))))
                (car |s1_1QDWYp2PN|)
                (car |s2_1QZSWS2PN|)))))))
      ()
      (#%lambda #t
        (|s1_1QX11w1PN| |s2_1Qh--Y1PN|)
        (|s>?_1QB5331PN|)
        (|s>?_1QB5331PN|
          (string->list |s1_1QX11w1PN|)
          (string->list |s2_1Qh--Y1PN|))))))
(#%program
  ((string=? . 1)
   (|s2_1QlEOG4PN| . 2)
   (|s1_1Q_HQd4PN| . 2)
   (string<? . 1))
  ()
  (string=? string<?)
  (#%define string<=?
    (#%lambda #t
      (|s1_1Q_HQd4PN| |s2_1QlEOG4PN|)
      ()
      (#%if (string<? |s1_1Q_HQd4PN| |s2_1QlEOG4PN|)
        #t
        (string=? |s1_1Q_HQd4PN| |s2_1QlEOG4PN|)))))
(#%program
  ((string=? . 1)
   (|s2_1Q1xKA5PN| . 2)
   (|s1_1QHAM75PN| . 2)
   (string>? . 1))
  ()
  (string=? string>?)
  (#%define string>=?
    (#%lambda #t
      (|s1_1QHAM75PN| |s2_1Q1xKA5PN|)
      ()
      (#%if (string>? |s1_1QHAM75PN| |s2_1Q1xKA5PN|)
        #t
        (string=? |s1_1QHAM75PN| |s2_1Q1xKA5PN|)))))
(#%program
  ((|s2_1QJpGu6PN| . 1)
   (|s1_1QntI16PN| . 1)
   (string-downcase . 2)
   (string=? . 1))
  ()
  (string-downcase string=?)
  (#%define string-ci=?
    (#%lambda #t
      (|s1_1QntI16PN| |s2_1QJpGu6PN|)
      ()
      (string=?
        (string-downcase |s1_1QntI16PN|)
        (string-downcase |s2_1QJpGu6PN|)))))
(#%program
  ((|s2_1QpiCo7PN| . 1)
   (|s1_1Q3mEX6PN| . 1)
   (string-downcase . 2)
   (string<? . 1))
  ()
  (string-downcase string<?)
  (#%define string-ci<?
    (#%lambda #t
      (|s1_1Q3mEX6PN| |s2_1QpiCo7PN|)
      ()
      (string<?
        (string-downcase |s1_1Q3mEX6PN|)
        (string-downcase |s2_1QpiCo7PN|)))))
(#%program
  ((|s2_1Q5byi8PN| . 1)
   (|s1_1QLeAR7PN| . 1)
   (string-downcase . 2)
   (string>? . 1))
  ()
  (string-downcase string>?)
  (#%define string-ci>?
    (#%lambda #t
      (|s1_1QLeAR7PN| |s2_1Q5byi8PN|)
      ()
      (string>?
        (string-downcase |s1_1QLeAR7PN|)
        (string-downcase |s2_1Q5byi8PN|)))))
(#%program
  ((|s2_1QN3uc9PN| . 1)
   (|s1_1Qr7wL8PN| . 1)
   (string-downcase . 2)
   (string>=? . 1))
  ()
  (string-downcase string>=?)
  (#%define string-ci>=?
    (#%lambda #t
      (|s1_1Qr7wL8PN| |s2_1QN3uc9PN|)
      ()
      (string>=?
        (string-downcase |s1_1Qr7wL8PN|)
        (string-downcase |s2_1QN3uc9PN|)))))
(#%program
  ((|s2_1QtYp6aPN| . 1)
   (|s1_1Q70sF9PN| . 1)
   (string-downcase . 2)
   (string<=? . 1))
  ()
  (string-downcase string<=?)
  (#%define string-ci<=?
    (#%lambda #t
      (|s1_1Q70sF9PN| |s2_1QtYp6aPN|)
      ()
      (string<=?
        (string-downcase |s1_1Q70sF9PN|)
        (string-downcase |s2_1QtYp6aPN|)))))
(#%program
  ((- . 1)
   (make-string . 1)
   (|end_1QRJhWbPN| . 2)
   (|start_1QvNjtbPN| . 2)
   (|newstr_1QbGfncPN| . 2)
   (|str_1Q9Rl0bPN| . 1)
   (+ . 2)
   (|fill-string_1QPUnzaPN| . 2)
   (|sstr_1QxCdQcPN| . 2)
   (string-ref . 1)
   (|n_1Qdv9KdPN| . 2)
   (|dstr_1QTybhdPN| . 2)
   (string-set! . 1)
   (|e_1QVn5EePN| . 2)
   (|s_1Qzr7bePN| . 3)
   (< . 1))
  ((|fill-string_1QPUnzaPN| . 1))
  (make-string - string-ref string-set! + <)
  (#%define substring
    (#%letrec #t
      ((|fill-string_1QPUnzaPN|
         (#%lambda #t
           (|sstr_1QxCdQcPN|
             |dstr_1QTybhdPN|
             |n_1Qdv9KdPN|
             |s_1Qzr7bePN|
             |e_1QVn5EePN|)
           (|fill-string_1QPUnzaPN|)
           (#%if (< |s_1Qzr7bePN| |e_1QVn5EePN|)
             (#%begin
               (string-set!
                 |dstr_1QTybhdPN|
                 |n_1Qdv9KdPN|
                 (string-ref |sstr_1QxCdQcPN| |s_1Qzr7bePN|))
               (|fill-string_1QPUnzaPN|
                 |sstr_1QxCdQcPN|
                 |dstr_1QTybhdPN|
                 (+ |n_1Qdv9KdPN| 1)
                 (+ |s_1Qzr7bePN| 1)
                 |e_1QVn5EePN|))
             #!void))))
      ()
      (#%lambda #t
        (|str_1Q9Rl0bPN|
          |start_1QvNjtbPN|
          |end_1QRJhWbPN|)
        (|fill-string_1QPUnzaPN|)
        ((#%lambda #t
           (|newstr_1QbGfncPN|)
           (|end_1QRJhWbPN|
             |start_1QvNjtbPN|
             |str_1Q9Rl0bPN|
             |fill-string_1QPUnzaPN|)
           (#%begin
             (|fill-string_1QPUnzaPN|
               |str_1Q9Rl0bPN|
               |newstr_1QbGfncPN|
               0
               |start_1QvNjtbPN|
               |end_1QRJhWbPN|)
             |newstr_1QbGfncPN|))
         (make-string
           (- |end_1QRJhWbPN| |start_1QvNjtbPN|)))))))
(#%program
  ((- . 1)
   (cdr . 1)
   (list-ref . 1)
   (|list_1Qfk35fPN| . 2)
   (car . 1)
   (|n_1QBg1yfPN| . 2)
   (zero? . 1))
  ()
  (list-ref cdr - car zero?)
  (#%define list-ref
    (#%lambda #t
      (|list_1Qfk35fPN| |n_1QBg1yfPN|)
      ()
      (#%if (zero? |n_1QBg1yfPN|)
        (car |list_1Qfk35fPN|)
        (list-ref
          (cdr |list_1Qfk35fPN|)
          (- |n_1QBg1yfPN| 1))))))
(#%program
  ((|args_1QXc_-fPN| . 1)
   (|k_1Qh9ZrgPN| . 1)
   (apply . 1)
   (call-with-current-continuation . 1))
  ()
  (apply call-with-current-continuation)
  (#%define values
    (#%lambda #t
      |args_1QXc_-fPN|
      ()
      (call-with-current-continuation
        (#%lambda #t
          (|k_1Qh9ZrgPN|)
          (|args_1QXc_-fPN|)
          (apply |k_1Qh9ZrgPN| |args_1QXc_-fPN|))))))
