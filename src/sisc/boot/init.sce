(#%program
  ((_make-native-parameter . 1))
  ()
  ()
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
  ()
  (inline-usual-primitives))
(#%program () () () #!void)
(#%program
  ((map-cdr . 1)
   (for-each . 1)
   (map-car . 1)
   (|proc_vescKOLUj| . 2)
   (apply . 2)
   (cons . 1)
   (|lists_veMjOUKUj| . 4)
   (|ls1_ve6gMlLUj| . 2)
   (null? . 1))
  ((|lists_veMjOUKUj| . 1))
  (cons map-car apply map-cdr for-each null?)
  (#%define for-each
    (#%lambda #t
      (|proc_vescKOLUj|
        |ls1_ve6gMlLUj|
        .
        |lists_veMjOUKUj|)
      ()
      (#%if (null? |ls1_ve6gMlLUj|)
        #!void
        (#%begin
          (#%set! |lists_veMjOUKUj|
            (cons |ls1_ve6gMlLUj| |lists_veMjOUKUj|))
          (apply |proc_vescKOLUj|
                 (map-car |lists_veMjOUKUj|))
          (apply for-each
                 |proc_vescKOLUj|
                 (map-cdr |lists_veMjOUKUj|)))))))
(#%program
  ((|x_veO8IfMUj| . 1) (eq? . 1))
  ()
  (eq?)
  (#%define eof-object?
    (#%lambda #t
      (|x_veO8IfMUj|)
      ()
      (eq? |x_veO8IfMUj| #!eof))))
(#%program
  ((|x_ve85GIMUj| . 1))
  ()
  ()
  (#%define not
    (#%lambda #t
      (|x_ve85GIMUj|)
      ()
      (#%if |x_ve85GIMUj| #f #t))))
(#%program
  ((|port_veu1E9NUj| . 1)
   (display . 1)
   (apply . 1))
  ()
  (display apply)
  (#%define newline
    (#%lambda #t
      |port_veu1E9NUj|
      ()
      (apply display #\newline |port_veu1E9NUj|))))
(#%program
  ((|ls_veaWz3OUj| . 1)
   (car . 1)
   (cons . 1)
   (cdr . 1)
   (|iter_veQZBCNUj| . 2)
   (|acc_veSOvZOUj| . 2)
   (|ls_vewSxwOUj| . 3)
   (null? . 1))
  ((|iter_veQZBCNUj| . 1))
  (cdr car cons null?)
  (#%define reverse
    (#%letrec #t
      ((|iter_veQZBCNUj|
         (#%lambda #t
           (|ls_vewSxwOUj| |acc_veSOvZOUj|)
           (|iter_veQZBCNUj|)
           (#%if (null? |ls_vewSxwOUj|)
             |acc_veSOvZOUj|
             (|iter_veQZBCNUj|
               (cdr |ls_vewSxwOUj|)
               (cons (car |ls_vewSxwOUj|) |acc_veSOvZOUj|))))))
      ()
      (#%lambda #t
        (|ls_veaWz3OUj|)
        (|iter_veQZBCNUj|)
        (|iter_veQZBCNUj| |ls_veaWz3OUj| ())))))
(#%program
  ((|s_veyHrTPUj| . 1)
   (cdr . 1)
   (|d_veAwleRUj| . 1)
   (|iter_vecLtqPUj| . 2)
   (set-cdr! . 1)
   (|r_veeAnNQUj| . 2)
   (|s_veUDpkQUj| . 4)
   (null? . 1))
  ((|iter_vecLtqPUj| . 1))
  (set-cdr! cdr null?)
  (#%define reverse!
    (#%letrec #t
      ((|iter_vecLtqPUj|
         (#%lambda #t
           (|s_veUDpkQUj| |r_veeAnNQUj|)
           (|iter_vecLtqPUj|)
           (#%if (null? |s_veUDpkQUj|)
             |r_veeAnNQUj|
             ((#%lambda #t
                (|d_veAwleRUj|)
                (|r_veeAnNQUj| |s_veUDpkQUj| |iter_vecLtqPUj|)
                (#%begin
                  (set-cdr! |s_veUDpkQUj| |r_veeAnNQUj|)
                  (|iter_vecLtqPUj| |d_veAwleRUj| |s_veUDpkQUj|)))
              (cdr |s_veUDpkQUj|))))))
      ()
      (#%lambda #t
        (|s_veyHrTPUj|)
        (|iter_vecLtqPUj|)
        (|iter_vecLtqPUj| |s_veyHrTPUj| ())))))
(#%program
  ((cdr . 1)
   (map-car . 1)
   (caar . 1)
   (cons . 1)
   (|ls_veWsjHRUj| . 3)
   (null? . 1))
  ()
  (cons caar cdr map-car null?)
  (#%define map-car
    (#%lambda #t
      (|ls_veWsjHRUj|)
      ()
      (#%if (null? |ls_veWsjHRUj|)
        ()
        (cons (caar |ls_veWsjHRUj|)
              (map-car (cdr |ls_veWsjHRUj|)))))))
(#%program
  ((cdr . 1)
   (map-cdr . 1)
   (cdar . 1)
   (cons . 1)
   (|ls_vegph8SUj| . 3)
   (null? . 1))
  ()
  (cons cdar cdr map-cdr null?)
  (#%define map-cdr
    (#%lambda #t
      (|ls_vegph8SUj|)
      ()
      (#%if (null? |ls_vegph8SUj|)
        ()
        (cons (cdar |ls_vegph8SUj|)
              (map-cdr (cdr |ls_vegph8SUj|)))))))
(#%program
  ((|list1_veEa9YTUj| . 2)
   (|proc_ve-67pUUj| . 2)
   (|lists_veiebvTUj| . 2)
   (map-car . 1)
   (apply . 1)
   (|lists_ve2NW6XUj| . 2)
   (map-cdr . 1)
   (|proc_vemU-cWUj| . 2)
   (|loop_veYhd2TUj| . 2)
   (|c_veoJUzXUj| . 2)
   (|list1_veIQYFWUj| . 3)
   (car . 2)
   (cons . 2)
   (cdr . 2)
   (|proc_vek35SUUj| . 2)
   (|map1_veClfBSUj| . 2)
   (|acc_ve0Y0MVUj| . 2)
   (reverse . 2)
   (|list_veG_2jVUj| . 3)
   (null? . 3))
  ((|loop_veYhd2TUj| . 1) (|map1_veClfBSUj| . 1))
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
      ((|map1_veClfBSUj|
         (#%lambda #t
           (|proc_vek35SUUj|
             |list_veG_2jVUj|
             |acc_ve0Y0MVUj|)
           (|map1_veClfBSUj|)
           (#%if (null? |list_veG_2jVUj|)
             (reverse |acc_ve0Y0MVUj|)
             (|map1_veClfBSUj|
               |proc_vek35SUUj|
               (cdr |list_veG_2jVUj|)
               (cons (|proc_vek35SUUj| (car |list_veG_2jVUj|))
                     |acc_ve0Y0MVUj|)))))
       (|loop_veYhd2TUj|
         (#%lambda #t
           (|proc_vemU-cWUj|
             |list1_veIQYFWUj|
             |lists_ve2NW6XUj|
             |c_veoJUzXUj|)
           (|loop_veYhd2TUj|)
           (#%if (null? |list1_veIQYFWUj|)
             (reverse |c_veoJUzXUj|)
             (|loop_veYhd2TUj|
               |proc_vemU-cWUj|
               (cdr |list1_veIQYFWUj|)
               (map-cdr |lists_ve2NW6XUj|)
               (cons (apply |proc_vemU-cWUj|
                            (car |list1_veIQYFWUj|)
                            (map-car |lists_ve2NW6XUj|))
                     |c_veoJUzXUj|))))))
      ()
      (#%lambda #t
        (|proc_ve-67pUUj|
          |list1_veEa9YTUj|
          .
          |lists_veiebvTUj|)
        (|loop_veYhd2TUj| |map1_veClfBSUj|)
        (#%if (null? |lists_veiebvTUj|)
          (|map1_veClfBSUj|
            |proc_ve-67pUUj|
            |list1_veEa9YTUj|
            ())
          (|loop_veYhd2TUj|
            |proc_ve-67pUUj|
            |list1_veEa9YTUj|
            |lists_veiebvTUj|
            ()))))))
(#%program
  ((|x_veqyOWYUj| . 1)
   (|g_ve4CQtYUj| . 1)
   (|f_veKFS0YUj| . 1))
  ()
  ()
  (#%define compose2
    (#%lambda #t
      (|f_veKFS0YUj| |g_ve4CQtYUj|)
      ()
      (#%lambda #t
        (|x_veqyOWYUj|)
        (|g_ve4CQtYUj| |f_veKFS0YUj|)
        (|f_veKFS0YUj| (|g_ve4CQtYUj| |x_veqyOWYUj|))))))
(#%program
  ((void . 1))
  ()
  ()
  (#%define assq (void)))
(#%program
  ((void . 1))
  ()
  ()
  (#%define assv (void)))
(#%program
  ((void . 1))
  ()
  ()
  (#%define assoc (void)))
(#%program
  ((void . 1))
  ()
  ()
  (#%define memq (void)))
(#%program
  ((void . 1))
  ()
  ()
  (#%define memv (void)))
(#%program
  ((void . 1))
  ()
  ()
  (#%define member (void)))
(#%program
  ((|list_veeLlg3Vj| . 1)
   (|obj_veUOnP2Vj| . 1)
   (member . 1)
   (|list_veySpm2Vj| . 1)
   (|obj_vecWrV1Vj| . 1)
   (memv . 1)
   (|list_veSZts1Vj| . 1)
   (|obj_vew1w_0Vj| . 1)
   (memq . 1)
   (|alist_vea5yy0Vj| . 1)
   (|obj_veQ8A50Vj| . 1)
   (equal? . 2)
   (assoc . 1)
   (|alist_veucCE_Uj| . 1)
   (|obj_ve8gEb_Uj| . 1)
   (eqv? . 2)
   (assv . 1)
   (|alist_veOjGK-Uj| . 1)
   (|obj_vesnIh-Uj| . 1)
   (eq? . 2)
   (assq . 1)
   (|memn_ve6rKQZUj| . 4)
   (|obj_veYsbx5Vj| . 2)
   (|n_veCwd45Vj| . 2)
   (|list_veip9-5Vj| . 4)
   (cdr . 2)
   (|assn_veMuMnZUj| . 4)
   (car . 2)
   (|obj_veWDha4Vj| . 2)
   (caar . 1)
   (|n_veAHjJ3Vj| . 2)
   (|alist_vegAfD4Vj| . 4)
   (null? . 2))
  ((member . 1)
   (memv . 1)
   (memq . 1)
   (assoc . 1)
   (assv . 1)
   (assq . 1)
   (|memn_ve6rKQZUj| . 1)
   (|assn_veMuMnZUj| . 1))
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
    ((|assn_veMuMnZUj|
       (#%lambda #t
         (|n_veAHjJ3Vj| |obj_veWDha4Vj| |alist_vegAfD4Vj|)
         (|assn_veMuMnZUj|)
         (#%if (null? |alist_vegAfD4Vj|)
           #f
           (#%if (|n_veAHjJ3Vj|
                   (caar |alist_vegAfD4Vj|)
                   |obj_veWDha4Vj|)
             (car |alist_vegAfD4Vj|)
             (|assn_veMuMnZUj|
               |n_veAHjJ3Vj|
               |obj_veWDha4Vj|
               (cdr |alist_vegAfD4Vj|))))))
     (|memn_ve6rKQZUj|
       (#%lambda #t
         (|n_veCwd45Vj| |obj_veYsbx5Vj| |list_veip9-5Vj|)
         (|memn_ve6rKQZUj|)
         (#%if (null? |list_veip9-5Vj|)
           #f
           (#%if (|n_veCwd45Vj|
                   (car |list_veip9-5Vj|)
                   |obj_veYsbx5Vj|)
             |list_veip9-5Vj|
             (|memn_ve6rKQZUj|
               |n_veCwd45Vj|
               |obj_veYsbx5Vj|
               (cdr |list_veip9-5Vj|)))))))
    ()
    (#%begin
      (#%set! assq
        (#%lambda #t
          (|obj_vesnIh-Uj| |alist_veOjGK-Uj|)
          (|assn_veMuMnZUj|)
          (|assn_veMuMnZUj|
            eq?
            |obj_vesnIh-Uj|
            |alist_veOjGK-Uj|)))
      (#%set! assv
        (#%lambda #t
          (|obj_ve8gEb_Uj| |alist_veucCE_Uj|)
          (|assn_veMuMnZUj|)
          (|assn_veMuMnZUj|
            eqv?
            |obj_ve8gEb_Uj|
            |alist_veucCE_Uj|)))
      (#%set! assoc
        (#%lambda #t
          (|obj_veQ8A50Vj| |alist_vea5yy0Vj|)
          (|assn_veMuMnZUj|)
          (|assn_veMuMnZUj|
            equal?
            |obj_veQ8A50Vj|
            |alist_vea5yy0Vj|)))
      (#%set! memq
        (#%lambda #t
          (|obj_vew1w_0Vj| |list_veSZts1Vj|)
          (|memn_ve6rKQZUj|)
          (|memn_ve6rKQZUj|
            eq?
            |obj_vew1w_0Vj|
            |list_veSZts1Vj|)))
      (#%set! memv
        (#%lambda #t
          (|obj_vecWrV1Vj| |list_veySpm2Vj|)
          (|memn_ve6rKQZUj|)
          (|memn_ve6rKQZUj|
            eqv?
            |obj_vecWrV1Vj|
            |list_veySpm2Vj|)))
      (#%set! member
        (#%lambda #t
          (|obj_veUOnP2Vj| |list_veeLlg3Vj|)
          (|memn_ve6rKQZUj|)
          (|memn_ve6rKQZUj|
            equal?
            |obj_veUOnP2Vj|
            |list_veeLlg3Vj|))))))
(#%program
  ((cdr . 1) (car . 1) (compose2 . 1))
  ()
  ()
  (#%define cadr (compose2 car cdr)))
(#%program
  ((car . 1) (cdr . 1) (compose2 . 1))
  ()
  ()
  (#%define cdar (compose2 cdr car)))
(#%program
  ((cdr . 2) (compose2 . 1))
  ()
  ()
  (#%define cddr (compose2 cdr cdr)))
(#%program
  ((car . 2) (compose2 . 1))
  ()
  ()
  (#%define caar (compose2 car car)))
(#%program
  ((caar . 1) (car . 1) (compose2 . 1))
  ()
  ()
  (#%define caaar (compose2 car caar)))
(#%program
  ((cadr . 1) (car . 1) (compose2 . 1))
  ()
  ()
  (#%define caadr (compose2 car cadr)))
(#%program
  ((cdar . 1) (car . 1) (compose2 . 1))
  ()
  ()
  (#%define cadar (compose2 car cdar)))
(#%program
  ((cddr . 1) (car . 1) (compose2 . 1))
  ()
  ()
  (#%define caddr (compose2 car cddr)))
(#%program
  ((caar . 1) (cdr . 1) (compose2 . 1))
  ()
  ()
  (#%define cdaar (compose2 cdr caar)))
(#%program
  ((cadr . 1) (cdr . 1) (compose2 . 1))
  ()
  ()
  (#%define cdadr (compose2 cdr cadr)))
(#%program
  ((cdar . 1) (cdr . 1) (compose2 . 1))
  ()
  ()
  (#%define cddar (compose2 cdr cdar)))
(#%program
  ((cddr . 1) (cdr . 1) (compose2 . 1))
  ()
  ()
  (#%define cdddr (compose2 cdr cddr)))
(#%program
  ((caaar . 1) (car . 1) (compose2 . 1))
  ()
  ()
  (#%define caaaar (compose2 car caaar)))
(#%program
  ((caadr . 1) (car . 1) (compose2 . 1))
  ()
  ()
  (#%define caaadr (compose2 car caadr)))
(#%program
  ((cadar . 1) (car . 1) (compose2 . 1))
  ()
  ()
  (#%define caadar (compose2 car cadar)))
(#%program
  ((caddr . 1) (car . 1) (compose2 . 1))
  ()
  ()
  (#%define caaddr (compose2 car caddr)))
(#%program
  ((cdaar . 1) (car . 1) (compose2 . 1))
  ()
  ()
  (#%define cadaar (compose2 car cdaar)))
(#%program
  ((cdadr . 1) (car . 1) (compose2 . 1))
  ()
  ()
  (#%define cadadr (compose2 car cdadr)))
(#%program
  ((cddar . 1) (car . 1) (compose2 . 1))
  ()
  ()
  (#%define caddar (compose2 car cddar)))
(#%program
  ((cdddr . 1) (car . 1) (compose2 . 1))
  ()
  ()
  (#%define cadddr (compose2 car cdddr)))
(#%program
  ((caaar . 1) (cdr . 1) (compose2 . 1))
  ()
  ()
  (#%define cdaaar (compose2 cdr caaar)))
(#%program
  ((caadr . 1) (cdr . 1) (compose2 . 1))
  ()
  ()
  (#%define cdaadr (compose2 cdr caadr)))
(#%program
  ((cadar . 1) (cdr . 1) (compose2 . 1))
  ()
  ()
  (#%define cdadar (compose2 cdr cadar)))
(#%program
  ((caddr . 1) (cdr . 1) (compose2 . 1))
  ()
  ()
  (#%define cdaddr (compose2 cdr caddr)))
(#%program
  ((cdaar . 1) (cdr . 1) (compose2 . 1))
  ()
  ()
  (#%define cddaar (compose2 cdr cdaar)))
(#%program
  ((cdadr . 1) (cdr . 1) (compose2 . 1))
  ()
  ()
  (#%define cddadr (compose2 cdr cdadr)))
(#%program
  ((cddar . 1) (cdr . 1) (compose2 . 1))
  ()
  ()
  (#%define cdddar (compose2 cdr cddar)))
(#%program
  ((cdddr . 1) (cdr . 1) (compose2 . 1))
  ()
  ()
  (#%define cddddr (compose2 cdr cdddr)))
(#%program
  ((cdr . 1)
   (append2 . 1)
   (car . 1)
   (cons . 1)
   (|ls2_ve-h5U6Vj| . 2)
   (|ls1_veEl7r6Vj| . 3)
   (null? . 1))
  ()
  (cons car cdr append2 null?)
  (#%define append2
    (#%lambda #t
      (|ls1_veEl7r6Vj| |ls2_ve-h5U6Vj|)
      ()
      (#%if (null? |ls1_veEl7r6Vj|)
        |ls2_ve-h5U6Vj|
        (cons (car |ls1_veEl7r6Vj|)
              (append2 (cdr |ls1_veEl7r6Vj|) |ls2_ve-h5U6Vj|))))))
(#%program
  ((append2 . 1))
  ()
  ()
  (#%define append append2))
(#%program
  ((length . 1)
   (make-string . 1)
   (|l_veGa1O7Vj| . 2)
   (+ . 1)
   (cdr . 1)
   (|l2s_veke3l7Vj| . 2)
   (car . 1)
   (|n_veI_W89Vj| . 2)
   (string-set! . 1)
   (|s_vem3ZH8Vj| . 3)
   (|l_ve07_e8Vj| . 3)
   (null? . 1))
  ((|l2s_veke3l7Vj| . 1))
  (make-string length car string-set! + cdr null?)
  (#%define list->string
    (#%letrec #t
      ((|l2s_veke3l7Vj|
         (#%lambda #t
           (|l_ve07_e8Vj| |s_vem3ZH8Vj| |n_veI_W89Vj|)
           (|l2s_veke3l7Vj|)
           (#%if (null? |l_ve07_e8Vj|)
             |s_vem3ZH8Vj|
             (#%begin
               (string-set!
                 |s_vem3ZH8Vj|
                 |n_veI_W89Vj|
                 (car |l_ve07_e8Vj|))
               (|l2s_veke3l7Vj|
                 (cdr |l_ve07_e8Vj|)
                 |s_vem3ZH8Vj|
                 (+ |n_veI_W89Vj| 1)))))))
      ()
      (#%lambda #t
        (|l_veGa1O7Vj|)
        (|l2s_veke3l7Vj|)
        (|l2s_veke3l7Vj|
          |l_veGa1O7Vj|
          (make-string (length |l_veGa1O7Vj|))
          0)))))
(#%program
  ((string-length . 1)
   (|s_veoUS2aVj| . 2)
   (- . 2)
   (string-ref . 1)
   (cons . 1)
   (|s_veKQQvaVj| . 2)
   (|s2l_ve2YUB9Vj| . 2)
   (|h_ve4NOYaVj| . 2)
   (|n_veqJMpbVj| . 3)
   (< . 1))
  ((|s2l_ve2YUB9Vj| . 1))
  (string-length string-ref cons - <)
  (#%define string->list
    (#%letrec #t
      ((|s2l_ve2YUB9Vj|
         (#%lambda #t
           (|s_veKQQvaVj| |h_ve4NOYaVj| |n_veqJMpbVj|)
           (|s2l_ve2YUB9Vj|)
           (#%if (< |n_veqJMpbVj| 0)
             |h_ve4NOYaVj|
             (|s2l_ve2YUB9Vj|
               |s_veKQQvaVj|
               (cons (string-ref |s_veKQQvaVj| |n_veqJMpbVj|)
                     |h_ve4NOYaVj|)
               (- |n_veqJMpbVj| 1))))))
      ()
      (#%lambda #t
        (|s_veoUS2aVj|)
        (|s2l_ve2YUB9Vj|)
        (|s2l_ve2YUB9Vj|
          |s_veoUS2aVj|
          ()
          (- (string-length |s_veoUS2aVj|) 1))))))
(#%program
  ((error . 1)
   (length . 1)
   (make-vector . 1)
   (|l_ve6CIjcVj| . 4)
   (proper-list? . 1)
   (+ . 1)
   (cdr . 1)
   (|l2v_veMFKSbVj| . 2)
   (car . 1)
   (|n_ve8rCGdVj| . 2)
   (vector-set! . 1)
   (|v_veOuEddVj| . 3)
   (|l_vesyGMcVj| . 3)
   (null? . 1))
  ((|l2v_veMFKSbVj| . 1))
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
      ((|l2v_veMFKSbVj|
         (#%lambda #t
           (|l_vesyGMcVj| |v_veOuEddVj| |n_ve8rCGdVj|)
           (|l2v_veMFKSbVj|)
           (#%if (null? |l_vesyGMcVj|)
             |v_veOuEddVj|
             (#%begin
               (vector-set!
                 |v_veOuEddVj|
                 |n_ve8rCGdVj|
                 (car |l_vesyGMcVj|))
               (|l2v_veMFKSbVj|
                 (cdr |l_vesyGMcVj|)
                 |v_veOuEddVj|
                 (+ |n_ve8rCGdVj| 1)))))))
      ()
      (#%lambda #t
        (|l_ve6CIjcVj|)
        (|l2v_veMFKSbVj|)
        (#%if (proper-list? |l_ve6CIjcVj|)
          (|l2v_veMFKSbVj|
            |l_ve6CIjcVj|
            (make-vector (length |l_ve6CIjcVj|))
            0)
          (error (#%quote list->vector)
                 "can only convert a proper list."
                 |l_ve6CIjcVj|))))))
(#%program
  ((|elems_veunA7eVj| . 1) (list->vector . 1))
  ()
  (list->vector)
  (#%define vector
    (#%lambda #t
      |elems_veunA7eVj|
      ()
      (list->vector |elems_veunA7eVj|))))
(#%program
  ((|elems_veQjyAeVj| . 1) (list->string . 1))
  ()
  (list->string)
  (#%define string
    (#%lambda #t
      |elems_veQjyAeVj|
      ()
      (list->string |elems_veQjyAeVj|))))
(#%program
  ((_make-parameter . 1))
  ()
  ()
  (#%define current-url (_make-parameter "file:.")))
(#%program
  ((car . 1)
   (string-length . 1)
   (string-append . 1)
   (|l_veS8sXfVj| . 1)
   (- . 1)
   (|v_vewcuufVj| . 4)
   (string-ref . 1)
   (eqv? . 1)
   (current-url . 3)
   (normalize-url . 2)
   (|rest_veagw1fVj| . 2)
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
      |rest_veagw1fVj|
      ()
      (#%if (null? |rest_veagw1fVj|)
        (normalize-url (current-url) ".")
        (current-url
          (normalize-url
            (current-url)
            ((#%lambda #t
               (|v_vewcuufVj|)
               ()
               ((#%lambda #t
                  (|l_veS8sXfVj|)
                  (|v_vewcuufVj|)
                  (#%if (eqv? (string-ref |v_vewcuufVj| (- |l_veS8sXfVj| 1))
                              #\/)
                    |v_vewcuufVj|
                    (string-append |v_vewcuufVj| "/")))
                (string-length |v_vewcuufVj|)))
             (car |rest_veagw1fVj|))))))))
(#%program
  ((void . 1))
  ()
  ()
  (#%define file-handler (void)))
(#%program
  ((void . 1))
  ()
  ()
  (#%define add-file-handler (void)))
(#%program
  ((load . 1)
   (|extension_veAShciVj| . 1)
   (string-downcase . 1)
   (string->symbol . 1)
   (|_load_veeWjLhVj| . 1)
   (cdr . 1)
   (|t_veWOfFiVj| . 2)
   (file-handler . 1)
   (|thunk_veUZlihVj| . 1)
   (cons . 2)
   (|*file-handlers*_vec5qogVj| . 4)
   (|extension_vey1oRgVj| . 2)
   (assq . 2)
   (not . 1)
   (add-file-handler . 1))
  ((file-handler . 1)
   (|*file-handlers*_vec5qogVj| . 1)
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
     (|*file-handlers*_vec5qogVj|)
     ()
     (#%begin
       (#%set! add-file-handler
         (#%lambda #t
           (|extension_vey1oRgVj| |thunk_veUZlihVj|)
           (|*file-handlers*_vec5qogVj|)
           (#%if (not (assq |extension_vey1oRgVj|
                            |*file-handlers*_vec5qogVj|))
             (#%set! |*file-handlers*_vec5qogVj|
               (cons (cons |extension_vey1oRgVj| |thunk_veUZlihVj|)
                     |*file-handlers*_vec5qogVj|))
             #!void)))
       (#%set! file-handler
         ((#%lambda #t
            (|_load_veeWjLhVj|)
            (|*file-handlers*_vec5qogVj|)
            (#%lambda #t
              (|extension_veAShciVj|)
              (|_load_veeWjLhVj| |*file-handlers*_vec5qogVj|)
              ((#%lambda #t
                 (|t_veWOfFiVj|)
                 (|_load_veeWjLhVj|)
                 (#%if |t_veWOfFiVj|
                   (cdr |t_veWOfFiVj|)
                   |_load_veeWjLhVj|))
               (assq (string->symbol
                       (string-downcase |extension_veAShciVj|))
                     |*file-handlers*_vec5qogVj|))))
          load))))
   ()))
(#%program
  ((|rest_veCHbzjVj| . 1)
   (|file_veYD90kVj| . 1)
   (current-url . 1)
   (normalize-url . 1)
   (|proc_vegLd6jVj| . 1)
   (apply . 1))
  ()
  (apply current-url normalize-url)
  (#%define make-io-proc
    (#%lambda #t
      (|proc_vegLd6jVj|)
      ()
      (#%lambda #t
        (|file_veYD90kVj| . |rest_veCHbzjVj|)
        (|proc_vegLd6jVj|)
        (apply |proc_vegLd6jVj|
               (normalize-url (current-url) |file_veYD90kVj|)
               |rest_veCHbzjVj|)))))
(#%program
  ((|url_veIaVDnVj| . 1)
   (string->list . 1)
   (reverse! . 1)
   (cons . 1)
   (cdr . 1)
   (|loop_ve27T4oVj| . 2)
   (|acc_veK_O-oVj| . 2)
   (list->string . 1)
   (car . 2)
   (equal? . 1)
   (|x_veo3RxoVj| . 4)
   (null? . 1)
   (void . 1)
   (|file-extension_veiA7tkVj| . 1)
   (|fe_vemeXanVj| . 2)
   (file-handler . 1)
   (|e_veGl_gmVj| . 1)
   (|m_vekp1QlVj| . 1)
   (|fk_ve0iZJmVj| . 1)
   (call-with-failure-continuation . 1)
   (with-failure-continuation . 1)
   (|file_veEw5WkVj| . 1)
   (|previous-url_ve-s3nlVj| . 3)
   (normalize-url . 1)
   (current-url . 6)
   (load . 1)
   (open-output-file . 2)
   (open-source-input-file . 2)
   (make-io-proc . 3)
   (open-input-file . 2))
  ((|loop_ve27T4oVj| . 1)
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
     (|file-extension_veiA7tkVj|)
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
           (|file_veEw5WkVj|)
           (|file-extension_veiA7tkVj|)
           (#%begin
             ((#%lambda #t
                (|previous-url_ve-s3nlVj|)
                (|file_veEw5WkVj| |file-extension_veiA7tkVj|)
                (#%begin
                  (current-url
                    (normalize-url
                      |previous-url_ve-s3nlVj|
                      |file_veEw5WkVj|))
                  (with-failure-continuation
                    (#%lambda #t
                      (|m_vekp1QlVj| |e_veGl_gmVj|)
                      (|previous-url_ve-s3nlVj|)
                      (#%begin
                        (current-url |previous-url_ve-s3nlVj|)
                        (call-with-failure-continuation
                          (#%lambda #t
                            (|fk_ve0iZJmVj|)
                            (|e_veGl_gmVj| |m_vekp1QlVj|)
                            (|fk_ve0iZJmVj| |m_vekp1QlVj| |e_veGl_gmVj|)))))
                    (#%lambda #t
                      ()
                      (|file-extension_veiA7tkVj|)
                      ((#%lambda #t
                         (|fe_vemeXanVj|)
                         ()
                         ((file-handler
                            (#%if |fe_vemeXanVj| |fe_vemeXanVj| "scm"))
                          (current-url)))
                       (|file-extension_veiA7tkVj| (current-url)))))
                  (current-url |previous-url_ve-s3nlVj|)))
              (current-url))
             (void))))))
   (#%lambda #t
     (|url_veIaVDnVj|)
     ()
     ((#%letrec #t
        ((|loop_ve27T4oVj|
           (#%lambda #t
             (|x_veo3RxoVj| |acc_veK_O-oVj|)
             (|loop_ve27T4oVj|)
             (#%if (null? |x_veo3RxoVj|)
               #f
               (#%if (equal? (car |x_veo3RxoVj|) #\.)
                 (list->string |acc_veK_O-oVj|)
                 (|loop_ve27T4oVj|
                   (cdr |x_veo3RxoVj|)
                   (cons (car |x_veo3RxoVj|) |acc_veK_O-oVj|)))))))
        ()
        |loop_ve27T4oVj|)
      (reverse! (string->list |url_veIaVDnVj|))
      ()))))
(#%program
  ((|str_ve4YMrpVj| . 1)
   (load-native-library . 1)
   (native-library-binding-names . 1)
   (|binding-names_veMQIlqVj| . 1)
   (|nl_veqUKUpVj| . 2)
   (native-library-binding . 1)
   (|name_ve6NGOqVj| . 2)
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
      (|str_ve4YMrpVj|)
      ()
      ((#%lambda #t
         (|nl_veqUKUpVj|)
         ()
         ((#%lambda #t
            (|binding-names_veMQIlqVj|)
            (|nl_veqUKUpVj|)
            (for-each
              (#%lambda #t
                (|name_ve6NGOqVj|)
                (|nl_veqUKUpVj|)
                (putprop
                  |name_ve6NGOqVj|
                  (native-library-binding
                    |nl_veqUKUpVj|
                    |name_ve6NGOqVj|)))
              |binding-names_veMQIlqVj|))
          (native-library-binding-names |nl_veqUKUpVj|)))
       (load-native-library |str_ve4YMrpVj|)))))
(#%program
  ((|lses_veOFCIrVj| . 5)
   (cdr . 3)
   (car . 3)
   (append2 . 1)
   (|real-append_vesJEfrVj| . 3)
   (apply . 3)
   (|ls1_veuyyCsVj| . 3)
   (|lses_ve8CA9sVj| . 4)
   (null? . 4))
  ((|real-append_vesJEfrVj| . 1))
  (apply cdr append2 car null?)
  (#%define append
    (#%letrec #t
      ((|real-append_vesJEfrVj|
         (#%lambda #t
           (|ls1_veuyyCsVj| . |lses_ve8CA9sVj|)
           (|real-append_vesJEfrVj|)
           (#%if (null? |lses_ve8CA9sVj|)
             |ls1_veuyyCsVj|
             (#%if (null? |ls1_veuyyCsVj|)
               (apply |real-append_vesJEfrVj| |lses_ve8CA9sVj|)
               (apply |real-append_vesJEfrVj|
                      (append2 |ls1_veuyyCsVj| (car |lses_ve8CA9sVj|))
                      (cdr |lses_ve8CA9sVj|)))))))
      ()
      (#%lambda #t
        |lses_veOFCIrVj|
        (|real-append_vesJEfrVj|)
        (#%if (null? |lses_veOFCIrVj|)
          ()
          (#%if (null? (cdr |lses_veOFCIrVj|))
            (car |lses_veOFCIrVj|)
            (apply |real-append_vesJEfrVj|
                   (car |lses_veOFCIrVj|)
                   (cdr |lses_veOFCIrVj|))))))))
(#%program
  ((|x_veQuw3tVj| . 2)
   (null? . 2)
   (|lag_veSjqquVj| . 1)
   (cdr . 3)
   (|lp_vearuwtVj| . 2)
   (|lag_veU8kNvVj| . 2)
   (|x_veycmkvVj| . 2)
   (eq? . 1)
   (not . 1)
   (|x_vecgoTuVj| . 3)
   (|x_vewnsZtVj| . 3)
   (pair? . 2))
  ((|lp_vearuwtVj| . 1))
  (pair? cdr eq? not null?)
  (#%define proper-list?
    (#%lambda #t
      (|x_veQuw3tVj|)
      ()
      ((#%letrec #t
         ((|lp_vearuwtVj|
            (#%lambda #t
              (|x_vewnsZtVj| |lag_veSjqquVj|)
              (|lp_vearuwtVj|)
              (#%if (pair? |x_vewnsZtVj|)
                ((#%lambda #t
                   (|x_vecgoTuVj|)
                   (|lag_veSjqquVj| |lp_vearuwtVj|)
                   (#%if (pair? |x_vecgoTuVj|)
                     ((#%lambda #t
                        (|x_veycmkvVj| |lag_veU8kNvVj|)
                        (|lp_vearuwtVj|)
                        (#%if (not (eq? |x_veycmkvVj| |lag_veU8kNvVj|))
                          (|lp_vearuwtVj| |x_veycmkvVj| |lag_veU8kNvVj|)
                          #f))
                      (cdr |x_vecgoTuVj|)
                      (cdr |lag_veSjqquVj|))
                     (null? |x_vecgoTuVj|)))
                 (cdr |x_vewnsZtVj|))
                (null? |x_vewnsZtVj|)))))
         ()
         |lp_vearuwtVj|)
       |x_veQuw3tVj|
       |x_veQuw3tVj|))))
(#%program
  ((proper-list? . 1))
  ()
  ()
  (#%define list? proper-list?))
(#%program
  ((|general-expt_vee5iewVj| . 1)
   (denominator . 1)
   (numerator . 1)
   (|rational-expt_veA1gHwVj| . 1)
   (integer? . 2)
   (not . 1)
   (rational? . 1)
   (|base_vegWbBxVj| . 9)
   (|exponent_veCS92yVj| . 8)
   (|squaring_veoeP0DVj| . 3)
   (odd? . 1)
   (quotient . 1)
   (|loop_vempVFBVj| . 2)
   (|result_ve2iRzCVj| . 3)
   (|rest_veIlT6CVj| . 3)
   (zero? . 3)
   (ashl . 1)
   (= . 1)
   (exact? . 5)
   (abs . 1)
   (|base_veGwZLAVj| . 4)
   (|integer-expt_veWZd8xVj| . 2)
   (|exponent_ve0tXcBVj| . 4)
   (negative? . 1)
   (|base-denominator_ve-D1SzVj| . 1)
   (|exponent_vekA_iAVj| . 2)
   (|base-numerator_veEH3pzVj| . 1)
   (expt . 2)
   (/ . 2)
   (|base_veYO7vyVj| . 1)
   (log . 1)
   (|exponent_veiL5YyVj| . 1)
   (* . 3)
   (exp . 1))
  ((|loop_vempVFBVj| . 1)
   (|integer-expt_veWZd8xVj| . 1)
   (|rational-expt_veA1gHwVj| . 1)
   (|general-expt_vee5iewVj| . 1))
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
      ((|general-expt_vee5iewVj|
         (#%lambda #t
           (|base_veYO7vyVj| |exponent_veiL5YyVj|)
           ()
           (exp (* |exponent_veiL5YyVj| (log |base_veYO7vyVj|)))))
       (|rational-expt_veA1gHwVj|
         (#%lambda #t
           (|base-numerator_veEH3pzVj|
             |base-denominator_ve-D1SzVj|
             |exponent_vekA_iAVj|)
           ()
           (/ (expt |base-numerator_veEH3pzVj|
                    |exponent_vekA_iAVj|)
              (expt |base-denominator_ve-D1SzVj|
                    |exponent_vekA_iAVj|))))
       (|integer-expt_veWZd8xVj|
         (#%lambda #t
           (|base_veGwZLAVj| |exponent_ve0tXcBVj|)
           (|integer-expt_veWZd8xVj|)
           (#%if (negative? |exponent_ve0tXcBVj|)
             (/ (|integer-expt_veWZd8xVj|
                  |base_veGwZLAVj|
                  (abs |exponent_ve0tXcBVj|)))
             (#%if (#%if (exact? |base_veGwZLAVj|)
                     (= |base_veGwZLAVj| 2)
                     #f)
               (ashl 1 |exponent_ve0tXcBVj|)
               ((#%letrec #t
                  ((|loop_vempVFBVj|
                     (#%lambda #t
                       (|rest_veIlT6CVj|
                         |result_ve2iRzCVj|
                         |squaring_veoeP0DVj|)
                       (|loop_vempVFBVj|)
                       (#%if (zero? |rest_veIlT6CVj|)
                         |result_ve2iRzCVj|
                         (|loop_vempVFBVj|
                           (quotient |rest_veIlT6CVj| 2)
                           (#%if (odd? |rest_veIlT6CVj|)
                             (* |result_ve2iRzCVj| |squaring_veoeP0DVj|)
                             |result_ve2iRzCVj|)
                           (* |squaring_veoeP0DVj| |squaring_veoeP0DVj|))))))
                  ()
                  |loop_vempVFBVj|)
                |exponent_ve0tXcBVj|
                1
                |base_veGwZLAVj|))))))
      ()
      (#%lambda #t
        (|base_vegWbBxVj| |exponent_veCS92yVj|)
        (|integer-expt_veWZd8xVj|
          |rational-expt_veA1gHwVj|
          |general-expt_vee5iewVj|)
        (#%if (zero? |exponent_veCS92yVj|)
          (#%if (exact? |exponent_veCS92yVj|) 1 1.0)
          (#%if (zero? |base_vegWbBxVj|)
            (#%if (exact? |exponent_veCS92yVj|)
              |base_vegWbBxVj|
              0.0)
            (#%if (#%if (exact? |base_vegWbBxVj|)
                    (#%if (rational? |base_vegWbBxVj|)
                      (not (integer? |base_vegWbBxVj|))
                      #f)
                    #f)
              (|rational-expt_veA1gHwVj|
                (numerator |base_vegWbBxVj|)
                (denominator |base_vegWbBxVj|)
                |exponent_veCS92yVj|)
              (#%if (#%if (exact? |exponent_veCS92yVj|)
                      (integer? |exponent_veCS92yVj|)
                      #f)
                (|integer-expt_veWZd8xVj|
                  |base_vegWbBxVj|
                  |exponent_veCS92yVj|)
                (|general-expt_vee5iewVj|
                  |base_vegWbBxVj|
                  |exponent_veCS92yVj|)))))))))
(#%program
  ((- . 1)
   (|tmp_veM_GQEVj| . 2)
   (/ . 2)
   (modpow . 2)
   (|tmp_ve6YEhFVj| . 2)
   (* . 3)
   (even? . 1)
   (|n_veq3JnEVj| . 6)
   (|x_veKaNtDVj| . 4)
   (modulo . 4)
   (|y_ve47LWDVj| . 4)
   (= . 1))
  ()
  (even? modpow / * - modulo =)
  (#%define modpow
    (#%lambda #t
      (|x_veKaNtDVj| |y_ve47LWDVj| |n_veq3JnEVj|)
      ()
      (#%if (= |y_ve47LWDVj| 1)
        (modulo |x_veKaNtDVj| |n_veq3JnEVj|)
        (#%if (even? |y_ve47LWDVj|)
          ((#%lambda #t
             (|tmp_ve6YEhFVj|)
             (|n_veq3JnEVj|)
             (modulo
               (* |tmp_ve6YEhFVj| |tmp_ve6YEhFVj|)
               |n_veq3JnEVj|))
           (modpow
             |x_veKaNtDVj|
             (/ |y_ve47LWDVj| 2)
             |n_veq3JnEVj|))
          ((#%lambda #t
             (|tmp_veM_GQEVj|)
             (|n_veq3JnEVj| |x_veKaNtDVj|)
             (modulo
               (* |x_veKaNtDVj|
                  (modulo
                    (* |tmp_veM_GQEVj| |tmp_veM_GQEVj|)
                    |n_veq3JnEVj|))
               |n_veq3JnEVj|))
           (modpow
             |x_veKaNtDVj|
             (/ (- |y_ve47LWDVj| 1) 2)
             |n_veq3JnEVj|)))))))
(#%program
  ((integer? . 1)
   (round . 1)
   (= . 1)
   (real? . 1)
   (|n_veOQAbGVj| . 4)
   (|oldint?_vesUCKFVj| . 1))
  ()
  (= round real?)
  (#%define integer?
    ((#%lambda #t
       (|oldint?_vesUCKFVj|)
       ()
       (#%lambda #t
         (|n_veOQAbGVj|)
         (|oldint?_vesUCKFVj|)
         (#%if (|oldint?_vesUCKFVj| |n_veOQAbGVj|)
           #t
           (#%if (real? |n_veOQAbGVj|)
             (= (round |n_veOQAbGVj|) |n_veOQAbGVj|)
             #f))))
     integer?)))
(#%program
  ((complex? . 1)
   (|oldcomp?_ve8NyEGVj| . 1)
   (not . 1)
   (|n_veuJw5HVj| . 2)
   (number? . 1))
  ()
  (number? not)
  (#%define real?
    ((#%lambda #t
       (|oldcomp?_ve8NyEGVj|)
       ()
       (#%lambda #t
         (|n_veuJw5HVj|)
         (|oldcomp?_ve8NyEGVj|)
         (#%if (number? |n_veuJw5HVj|)
           (not (|oldcomp?_ve8NyEGVj| |n_veuJw5HVj|))
           #f)))
     complex?)))
(#%program
  ((real? . 1))
  ()
  ()
  (#%define rational? real?))
(#%program
  ((number? . 1))
  ()
  ()
  (#%define complex? number?))
(#%program
  ((- . 1)
   (< . 1)
   (imag-part . 1)
   (real-part . 1)
   (|b_vewyqsIVj| . 2)
   (|a_veaCs_HVj| . 2)
   (* . 2)
   (+ . 1)
   (sqrt . 1)
   (|num_veQFuyHVj| . 6)
   (real? . 1)
   (not . 1))
  ()
  (< - + * sqrt real-part imag-part not real?)
  (#%define abs
    (#%lambda #t
      (|num_veQFuyHVj|)
      ()
      (#%if (not (real? |num_veQFuyHVj|))
        ((#%lambda #t
           (|a_veaCs_HVj| |b_vewyqsIVj|)
           ()
           (sqrt (+ (* |a_veaCs_HVj| |a_veaCs_HVj|)
                    (* |b_vewyqsIVj| |b_vewyqsIVj|))))
         (real-part |num_veQFuyHVj|)
         (imag-part |num_veQFuyHVj|))
        (#%if (< |num_veQFuyHVj| 0)
          (- |num_veQFuyHVj|)
          |num_veQFuyHVj|)))))
(#%program
  ((void . 1))
  ()
  ()
  (#%define min (void)))
(#%program
  ((void . 1))
  ()
  ()
  (#%define max (void)))
(#%program
  ((> . 1)
   (|x1_veeggJKVj| . 3)
   (|args_veUjigKVj| . 2)
   (max . 1)
   (< . 1)
   (|x1_veynkPJVj| . 3)
   (|args_vecrmmJVj| . 2)
   (min . 1)
   (inexact? . 3)
   (cdr . 2)
   (|_min_max_veSuoVIVj| . 4)
   (car . 3)
   (|proc_veAceaLVj| . 3)
   (exact->inexact . 1)
   (|mv_veW8cDLVj| . 5)
   (exact? . 1)
   (|inexact_veC18xMVj| . 3)
   (|args_veg5a4MVj| . 6)
   (null? . 3))
  ((max . 1) (min . 1) (|_min_max_veSuoVIVj| . 1))
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
    ((|_min_max_veSuoVIVj|
       (#%lambda #t
         (|proc_veAceaLVj|
           |mv_veW8cDLVj|
           |args_veg5a4MVj|
           |inexact_veC18xMVj|)
         (|_min_max_veSuoVIVj|)
         (#%if (null? |args_veg5a4MVj|)
           (#%if (#%if |inexact_veC18xMVj|
                   (exact? |mv_veW8cDLVj|)
                   #f)
             (exact->inexact |mv_veW8cDLVj|)
             |mv_veW8cDLVj|)
           (#%if (|proc_veAceaLVj|
                   (car |args_veg5a4MVj|)
                   |mv_veW8cDLVj|)
             (|_min_max_veSuoVIVj|
               |proc_veAceaLVj|
               (car |args_veg5a4MVj|)
               (cdr |args_veg5a4MVj|)
               (#%if |inexact_veC18xMVj|
                 #t
                 (inexact? (car |args_veg5a4MVj|))))
             (|_min_max_veSuoVIVj|
               |proc_veAceaLVj|
               |mv_veW8cDLVj|
               (cdr |args_veg5a4MVj|)
               |inexact_veC18xMVj|))))))
    ()
    (#%begin
      (#%set! min
        (#%lambda #t
          (|x1_veynkPJVj| . |args_vecrmmJVj|)
          (|_min_max_veSuoVIVj|)
          (#%if (null? |args_vecrmmJVj|)
            |x1_veynkPJVj|
            (|_min_max_veSuoVIVj|
              <
              |x1_veynkPJVj|
              |args_vecrmmJVj|
              (inexact? |x1_veynkPJVj|)))))
      (#%set! max
        (#%lambda #t
          (|x1_veeggJKVj| . |args_veUjigKVj|)
          (|_min_max_veSuoVIVj|)
          (#%if (null? |args_veUjigKVj|)
            |x1_veeggJKVj|
            (|_min_max_veSuoVIVj|
              >
              |x1_veeggJKVj|
              |args_veUjigKVj|
              (inexact? |x1_veeggJKVj|))))))))
(#%program
  ((|n_veYZ5-MVj| . 1) (< . 1))
  ()
  (<)
  (#%define negative?
    (#%lambda #t
      (|n_veYZ5-MVj|)
      ()
      (< |n_veYZ5-MVj| 0))))
(#%program
  ((|n_veiW3rNVj| . 1) (> . 1))
  ()
  (>)
  (#%define positive?
    (#%lambda #t
      (|n_veiW3rNVj|)
      ()
      (> |n_veiW3rNVj| 0))))
(#%program
  ((|n_veES1UNVj| . 1) (modulo . 1) (= . 1))
  ()
  (modulo =)
  (#%define even?
    (#%lambda #t
      (|n_veES1UNVj|)
      ()
      (= 0 (modulo |n_veES1UNVj| 2)))))
(#%program
  ((|n_ve-O_kOVj| . 1) (even? . 1) (not . 1))
  ()
  (even? not)
  (#%define odd?
    (#%lambda #t
      (|n_ve-O_kOVj|)
      ()
      (not (even? |n_ve-O_kOVj|)))))
(#%program
  ((|n_vekLZNOVj| . 1) (= . 1))
  ()
  (=)
  (#%define zero?
    (#%lambda #t
      (|n_vekLZNOVj|)
      ()
      (= |n_vekLZNOVj| 0))))
(#%program
  ((|n_veGHXePVj| . 1) (+ . 1))
  ()
  (+)
  (#%define add1
    (#%lambda #t
      (|n_veGHXePVj|)
      ()
      (+ |n_veGHXePVj| 1))))
(#%program
  ((|n_ve0EVHPVj| . 1) (- . 1))
  ()
  (-)
  (#%define sub1
    (#%lambda #t
      (|n_ve0EVHPVj|)
      ()
      (- |n_ve0EVHPVj| 1))))
(#%program
  ((void . 1))
  ()
  ()
  (#%define >= (void)))
(#%program
  ((void . 1))
  ()
  ()
  (#%define <= (void)))
(#%program
  ((|y_veQQs1WVj| . 1)
   (|x_veuUuAVVj| . 1)
   (|args_ves3BdUVj| . 1)
   (|loop_veO_yGUVj| . 2)
   (cadr . 1)
   (car . 1)
   (|comparator_veqeHSSVj| . 1)
   (|chainer_veMaFjTVj| . 1)
   (cdr . 2)
   (|endstate_ve67DMTVj| . 2)
   (|x_ve8Yw7VVj| . 5)
   (null? . 2)
   (|b_ve4iJpSVj| . 2)
   (|a_veKlLYRVj| . 2)
   (> . 1)
   (>= . 1)
   (|_and2_veIwRBQVj| . 2)
   (= . 2)
   (|b_veopNvRVj| . 2)
   (|a_ve2tP2RVj| . 2)
   (< . 1)
   (|_comp_help_vemAT8QVj| . 2)
   (<= . 1))
  ((|loop_veO_yGUVj| . 1) (>= . 1) (<= . 1))
  (null? cadr car cdr <= = < >= >)
  ((#%lambda #t
     (|_comp_help_vemAT8QVj| |_and2_veIwRBQVj|)
     ()
     (#%begin
       (#%set! <=
         (|_comp_help_vemAT8QVj|
           (#%lambda #t
             (|a_ve2tP2RVj| |b_veopNvRVj|)
             ()
             (#%if (< |a_ve2tP2RVj| |b_veopNvRVj|)
               #t
               (= |a_ve2tP2RVj| |b_veopNvRVj|)))
           |_and2_veIwRBQVj|
           #t))
       (#%set! >=
         (|_comp_help_vemAT8QVj|
           (#%lambda #t
             (|a_veKlLYRVj| |b_ve4iJpSVj|)
             ()
             (#%if (> |a_veKlLYRVj| |b_ve4iJpSVj|)
               #t
               (= |a_veKlLYRVj| |b_ve4iJpSVj|)))
           |_and2_veIwRBQVj|
           #t))))
   (#%lambda #t
     (|comparator_veqeHSSVj|
       |chainer_veMaFjTVj|
       |endstate_ve67DMTVj|)
     ()
     (#%lambda #t
       |args_ves3BdUVj|
       (|endstate_ve67DMTVj|
         |chainer_veMaFjTVj|
         |comparator_veqeHSSVj|)
       ((#%letrec #t
          ((|loop_veO_yGUVj|
             (#%lambda #t
               (|x_ve8Yw7VVj|)
               (|loop_veO_yGUVj|
                 |endstate_ve67DMTVj|
                 |chainer_veMaFjTVj|
                 |comparator_veqeHSSVj|)
               (#%if (null? |x_ve8Yw7VVj|)
                 |endstate_ve67DMTVj|
                 (#%if (null? (cdr |x_ve8Yw7VVj|))
                   |endstate_ve67DMTVj|
                   (|chainer_veMaFjTVj|
                     (|comparator_veqeHSSVj|
                       (car |x_ve8Yw7VVj|)
                       (cadr |x_ve8Yw7VVj|))
                     (|loop_veO_yGUVj| (cdr |x_ve8Yw7VVj|))))))))
          (|endstate_ve67DMTVj|
            |chainer_veMaFjTVj|
            |comparator_veqeHSSVj|)
          |loop_veO_yGUVj|)
        |args_ves3BdUVj|)))
   (#%lambda #t
     (|x_veuUuAVVj| |y_veQQs1WVj|)
     ()
     (#%if |x_veuUuAVVj| |y_veQQs1WVj| #f))))
(#%program
  ((|chainer_veSFmoXVj| . 1)
   (apply . 1)
   (|comparator_vewJoXWVj| . 1)
   (cadr . 2)
   (car . 2)
   (= . 1)
   (cdr . 2)
   (|args_vecCkRXVj| . 7)
   (null? . 2)
   (< . 1)
   (<= . 2)
   (> . 1)
   (|_?=_veaNquWVj| . 2)
   (>= . 2))
  ((<= . 1) (>= . 1))
  (< <= <= > >= >= null? = car cadr apply cdr)
  ((#%lambda #t
     (|_?=_veaNquWVj|)
     ()
     (#%begin
       (#%set! >= (|_?=_veaNquWVj| > >=))
       (#%set! <= (|_?=_veaNquWVj| < <=))))
   (#%lambda #t
     (|comparator_vewJoXWVj| |chainer_veSFmoXVj|)
     ()
     (#%lambda #t
       |args_vecCkRXVj|
       (|chainer_veSFmoXVj| |comparator_vewJoXWVj|)
       (#%if (null? |args_vecCkRXVj|)
         #t
         (#%if (null? (cdr |args_vecCkRXVj|))
           #t
           (#%if (#%if (= (car |args_vecCkRXVj|)
                          (cadr |args_vecCkRXVj|))
                   #t
                   (|comparator_vewJoXWVj|
                     (car |args_vecCkRXVj|)
                     (cadr |args_vecCkRXVj|)))
             (apply |chainer_veSFmoXVj|
                    (cdr |args_vecCkRXVj|))
             #f)))))))
(#%program
  ((cadr . 1)
   (_gcd . 1)
   (car . 2)
   (cdr . 1)
   (|args_veUugLYVj| . 5)
   (null? . 2))
  ()
  (cdr car cadr _gcd null?)
  (#%define gcd
    (#%lambda #t
      |args_veUugLYVj|
      ()
      (#%if (null? |args_veUugLYVj|)
        0
        (#%if (null? (cdr |args_veUugLYVj|))
          (car |args_veUugLYVj|)
          (_gcd (car |args_veUugLYVj|)
                (cadr |args_veUugLYVj|)))))))
(#%program
  ((cadr . 1)
   (_lcm . 1)
   (car . 2)
   (cdr . 1)
   (|args_veerecZVj| . 5)
   (null? . 2))
  ()
  (cdr car cadr _lcm null?)
  (#%define lcm
    (#%lambda #t
      |args_veerecZVj|
      ()
      (#%if (null? |args_veerecZVj|)
        1
        (#%if (null? (cdr |args_veerecZVj|))
          (car |args_veerecZVj|)
          (_lcm (car |args_veerecZVj|)
                (cadr |args_veerecZVj|)))))))
(#%program
  ((|x_veAncFZVj| . 1)
   (remainder . 1)
   (+ . 1)
   (|r_vegg8z-Vj| . 3)
   (positive? . 1)
   (|y_veWja6-Vj| . 3)
   (negative? . 2))
  ()
  (remainder positive? negative? +)
  (#%define modulo
    (#%lambda #t
      (|x_veAncFZVj| |y_veWja6-Vj|)
      ()
      ((#%lambda #t
         (|r_vegg8z-Vj|)
         (|y_veWja6-Vj|)
         (#%if ((#%if (negative? |y_veWja6-Vj|)
                  positive?
                  negative?)
                |r_vegg8z-Vj|)
           (+ |r_vegg8z-Vj| |y_veWja6-Vj|)
           |r_vegg8z-Vj|))
       (remainder |x_veAncFZVj| |y_veWja6-Vj|)))))
(#%program
  ((|args_veY84t_Vj| . 3)
   (cdr . 2)
   (car . 2)
   (_string-append . 1)
   (|string-append-helper_veCc60_Vj| . 2)
   (|acc_vei52W_Vj| . 2)
   (|args_veE10n0Wj| . 3)
   (null? . 2))
  ((|string-append-helper_veCc60_Vj| . 1))
  (car _string-append cdr null?)
  (#%define string-append
    (#%letrec #t
      ((|string-append-helper_veCc60_Vj|
         (#%lambda #t
           (|acc_vei52W_Vj| |args_veE10n0Wj|)
           (|string-append-helper_veCc60_Vj|)
           (#%if (null? |args_veE10n0Wj|)
             |acc_vei52W_Vj|
             (|string-append-helper_veCc60_Vj|
               (_string-append
                 |acc_vei52W_Vj|
                 (car |args_veE10n0Wj|))
               (cdr |args_veE10n0Wj|))))))
      ()
      (#%lambda #t
        |args_veY84t_Vj|
        (|string-append-helper_veCc60_Vj|)
        (#%if (null? |args_veY84t_Vj|)
          ""
          (|string-append-helper_veCc60_Vj|
            (car |args_veY84t_Vj|)
            (cdr |args_veY84t_Vj|)))))))
(#%program
  ((- . 1)
   (char->integer . 4)
   (|c_ve0PTa2Wj| . 2)
   (|lc-offset_veGSVJ1Wj| . 1)
   (+ . 1)
   (integer->char . 1)
   (|z_vekWXg1Wj| . 1)
   (<= . 1)
   (|a_ve-ZZP0Wj| . 2)
   (|cv_vemLRD2Wj| . 3)
   (>= . 1))
  ()
  (integer->char + >= <= char->integer -)
  (#%define char-downcase
    ((#%lambda #t
       (|a_ve-ZZP0Wj|)
       ()
       ((#%lambda #t
          (|z_vekWXg1Wj|)
          (|a_ve-ZZP0Wj|)
          ((#%lambda #t
             (|lc-offset_veGSVJ1Wj|)
             (|z_vekWXg1Wj| |a_ve-ZZP0Wj|)
             (#%lambda #t
               (|c_ve0PTa2Wj|)
               (|lc-offset_veGSVJ1Wj|
                 |z_vekWXg1Wj|
                 |a_ve-ZZP0Wj|)
               ((#%lambda #t
                  (|cv_vemLRD2Wj|)
                  (|c_ve0PTa2Wj|
                    |lc-offset_veGSVJ1Wj|
                    |z_vekWXg1Wj|
                    |a_ve-ZZP0Wj|)
                  (#%if (#%if (>= |cv_vemLRD2Wj| |a_ve-ZZP0Wj|)
                          (<= |cv_vemLRD2Wj| |z_vekWXg1Wj|)
                          #f)
                    (integer->char
                      (+ |cv_vemLRD2Wj| |lc-offset_veGSVJ1Wj|))
                    |c_ve0PTa2Wj|))
                (char->integer |c_ve0PTa2Wj|))))
           (- (char->integer #\a) |a_ve-ZZP0Wj|)))
        (char->integer #\Z)))
     (char->integer #\A))))
(#%program
  ((char->integer . 4)
   (|c_veKwJr4Wj| . 2)
   (|uc-offset_veoAL-3Wj| . 1)
   (- . 2)
   (integer->char . 1)
   (|z_ve2ENx3Wj| . 1)
   (<= . 1)
   (|a_veIHP43Wj| . 2)
   (|cv_ve4tHU4Wj| . 3)
   (>= . 1))
  ()
  (integer->char - >= <= char->integer)
  (#%define char-upcase
    ((#%lambda #t
       (|a_veIHP43Wj|)
       ()
       ((#%lambda #t
          (|z_ve2ENx3Wj|)
          (|a_veIHP43Wj|)
          ((#%lambda #t
             (|uc-offset_veoAL-3Wj|)
             (|z_ve2ENx3Wj| |a_veIHP43Wj|)
             (#%lambda #t
               (|c_veKwJr4Wj|)
               (|uc-offset_veoAL-3Wj|
                 |z_ve2ENx3Wj|
                 |a_veIHP43Wj|)
               ((#%lambda #t
                  (|cv_ve4tHU4Wj|)
                  (|c_veKwJr4Wj|
                    |uc-offset_veoAL-3Wj|
                    |z_ve2ENx3Wj|
                    |a_veIHP43Wj|)
                  (#%if (#%if (>= |cv_ve4tHU4Wj| |a_veIHP43Wj|)
                          (<= |cv_ve4tHU4Wj| |z_ve2ENx3Wj|)
                          #f)
                    (integer->char
                      (- |cv_ve4tHU4Wj| |uc-offset_veoAL-3Wj|))
                    |c_veKwJr4Wj|))
                (char->integer |c_veKwJr4Wj|))))
           (- |a_veIHP43Wj| (char->integer #\A))))
        (char->integer #\z)))
     (char->integer #\a))))
(#%program
  ((|args_veqpFl5Wj| . 1)
   (map . 1)
   (|c2_veMlDO5Wj| . 1)
   (|c1_ve6iBf6Wj| . 1)
   (char->integer . 3)
   (> . 1)
   (apply . 1))
  ()
  (map char->integer > apply)
  (#%define char>?
    (#%lambda #t
      (|c1_ve6iBf6Wj|
        |c2_veMlDO5Wj|
        .
        |args_veqpFl5Wj|)
      ()
      (apply >
             (char->integer |c1_ve6iBf6Wj|)
             (char->integer |c2_veMlDO5Wj|)
             (map char->integer |args_veqpFl5Wj|)))))
(#%program
  ((|args_vesezI6Wj| . 1)
   (map . 1)
   (|c2_veOax97Wj| . 1)
   (|c1_ve87vC7Wj| . 1)
   (char->integer . 3)
   (< . 1)
   (apply . 1))
  ()
  (map char->integer < apply)
  (#%define char<?
    (#%lambda #t
      (|c1_ve87vC7Wj|
        |c2_veOax97Wj|
        .
        |args_vesezI6Wj|)
      ()
      (apply <
             (char->integer |c1_ve87vC7Wj|)
             (char->integer |c2_veOax97Wj|)
             (map char->integer |args_vesezI6Wj|)))))
(#%program
  ((eqv? . 1))
  ()
  ()
  (#%define char=? eqv?))
(#%program
  ((char=? . 1)
   (|c2_veQ_qw8Wj| . 2)
   (|c1_veu3t38Wj| . 2)
   (char>? . 1))
  ()
  (char=? char>?)
  (#%define char>=?
    (#%lambda #t
      (|c1_veu3t38Wj| |c2_veQ_qw8Wj|)
      ()
      (#%if (char>? |c1_veu3t38Wj| |c2_veQ_qw8Wj|)
        #t
        (char=? |c1_veu3t38Wj| |c2_veQ_qw8Wj|)))))
(#%program
  ((char=? . 1)
   (|c2_vewUmq9Wj| . 2)
   (|c1_veaYoZ8Wj| . 2)
   (char<? . 1))
  ()
  (char=? char<?)
  (#%define char<=?
    (#%lambda #t
      (|c1_veaYoZ8Wj| |c2_vewUmq9Wj|)
      ()
      (#%if (char<? |c1_veaYoZ8Wj| |c2_vewUmq9Wj|)
        #t
        (char=? |c1_veaYoZ8Wj| |c2_vewUmq9Wj|)))))
(#%program
  ((|args_veSQkT9Wj| . 1)
   (map . 1)
   (|c2_vecNikaWj| . 1)
   (|c1_veyJgNaWj| . 1)
   (char-downcase . 3)
   (char>? . 1)
   (apply . 1))
  ()
  (map char-downcase char>? apply)
  (#%define char-ci>?
    (#%lambda #t
      (|c1_veyJgNaWj|
        |c2_vecNikaWj|
        .
        |args_veSQkT9Wj|)
      ()
      (apply char>?
             (char-downcase |c1_veyJgNaWj|)
             (char-downcase |c2_vecNikaWj|)
             (map char-downcase |args_veSQkT9Wj|)))))
(#%program
  ((|args_veUFeebWj| . 1)
   (map . 1)
   (|c2_veeCcHbWj| . 1)
   (|c1_veAya8cWj| . 1)
   (char-downcase . 3)
   (char<? . 1)
   (apply . 1))
  ()
  (map char-downcase char<? apply)
  (#%define char-ci<?
    (#%lambda #t
      (|c1_veAya8cWj|
        |c2_veeCcHbWj|
        .
        |args_veUFeebWj|)
      ()
      (apply char<?
             (char-downcase |c1_veAya8cWj|)
             (char-downcase |c2_veeCcHbWj|)
             (map char-downcase |args_veUFeebWj|)))))
(#%program
  ((|args_veWu8BcWj| . 1)
   (map . 1)
   (|c2_vegr62dWj| . 1)
   (|c1_veCn4vdWj| . 1)
   (char-downcase . 3)
   (char=? . 1)
   (apply . 1))
  ()
  (map char-downcase char=? apply)
  (#%define char-ci=?
    (#%lambda #t
      (|c1_veCn4vdWj|
        |c2_vegr62dWj|
        .
        |args_veWu8BcWj|)
      ()
      (apply char=?
             (char-downcase |c1_veCn4vdWj|)
             (char-downcase |c2_vegr62dWj|)
             (map char-downcase |args_veWu8BcWj|)))))
(#%program
  ((char-ci=? . 1)
   (|c2_veig0peWj| . 2)
   (|c1_veYj2YdWj| . 2)
   (char-ci>? . 1))
  ()
  (char-ci=? char-ci>?)
  (#%define char-ci>=?
    (#%lambda #t
      (|c1_veYj2YdWj| |c2_veig0peWj|)
      ()
      (#%if (char-ci>? |c1_veYj2YdWj| |c2_veig0peWj|)
        #t
        (char-ci=? |c1_veYj2YdWj| |c2_veig0peWj|)))))
(#%program
  ((char-ci=? . 1)
   (|c2_ve-8YifWj| . 2)
   (|c1_veEc-ReWj| . 2)
   (char-ci<? . 1))
  ()
  (char-ci=? char-ci<?)
  (#%define char-ci<=?
    (#%lambda #t
      (|c1_veEc-ReWj| |c2_ve-8YifWj|)
      ()
      (#%if (char-ci<? |c1_veEc-ReWj| |c2_ve-8YifWj|)
        #t
        (char-ci=? |c1_veEc-ReWj| |c2_ve-8YifWj|)))))
(#%program
  ((|c_vek5WLfWj| . 2) (char<? . 2))
  ()
  (char<?)
  (#%define char-alphabetic?
    (#%lambda #t
      (|c_vek5WLfWj|)
      ()
      (#%if (char<? #\@ |c_vek5WLfWj| #\[)
        #t
        (char<? #\` |c_vek5WLfWj| #\{)))))
(#%program
  ((|c_veG1UcgWj| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-numeric?
    (#%lambda #t
      (|c_veG1UcgWj|)
      ()
      (char<? #\/ |c_veG1UcgWj| #\:))))
(#%program
  ((|c_ve0-RFgWj| . 4) (char=? . 4))
  ()
  (char=?)
  (#%define char-whitespace?
    (#%lambda #t
      (|c_ve0-RFgWj|)
      ()
      (#%if (char=? |c_ve0-RFgWj| #\space)
        #t
        (#%if (char=? |c_ve0-RFgWj| #\tab)
          #t
          (#%if (char=? |c_ve0-RFgWj| #\newline)
            #t
            (char=? |c_ve0-RFgWj| #\return)))))))
(#%program
  ((|c_vemWP6hWj| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-upper-case?
    (#%lambda #t
      (|c_vemWP6hWj|)
      ()
      (char<? #\@ |c_vemWP6hWj| #\[))))
(#%program
  ((|c_veISNzhWj| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-lower-case?
    (#%lambda #t
      (|c_veISNzhWj|)
      ()
      (char<? #\` |c_veISNzhWj| #\{))))
(#%program
  ((void . 1))
  ()
  ()
  (#%define string-downcase (void)))
(#%program
  ((void . 1))
  ()
  ()
  (#%define string-upcase (void)))
(#%program
  ((char-upcase . 1)
   (|newstr_veqADQjWj| . 1)
   (|str_ve4EFnjWj| . 3)
   (string-upcase . 1)
   (make-string . 2)
   (string-length . 4)
   (char-downcase . 1)
   (|newstr_veKHHWiWj| . 1)
   (|str_veoLJtiWj| . 3)
   (string-downcase . 1)
   (+ . 1)
   (|string-map_ve2PL0iWj| . 3)
   (|strsrc_veMwBhkWj| . 2)
   (string-ref . 1)
   (|proc_vespxblWj| . 2)
   (|strdst_ve6tzKkWj| . 3)
   (string-set! . 1)
   (|l_ve8it5mWj| . 2)
   (|n_veOlvElWj| . 4)
   (< . 1))
  ((string-upcase . 1)
   (string-downcase . 1)
   (|string-map_ve2PL0iWj| . 1))
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
    ((|string-map_ve2PL0iWj|
       (#%lambda #t
         (|strsrc_veMwBhkWj|
           |strdst_ve6tzKkWj|
           |proc_vespxblWj|
           |n_veOlvElWj|
           |l_ve8it5mWj|)
         (|string-map_ve2PL0iWj|)
         (#%if (< |n_veOlvElWj| |l_ve8it5mWj|)
           (#%begin
             (string-set!
               |strdst_ve6tzKkWj|
               |n_veOlvElWj|
               (|proc_vespxblWj|
                 (string-ref |strsrc_veMwBhkWj| |n_veOlvElWj|)))
             (|string-map_ve2PL0iWj|
               |strsrc_veMwBhkWj|
               |strdst_ve6tzKkWj|
               |proc_vespxblWj|
               (+ |n_veOlvElWj| 1)
               |l_ve8it5mWj|))
           |strdst_ve6tzKkWj|))))
    ()
    (#%begin
      (#%set! string-downcase
        (#%lambda #t
          (|str_veoLJtiWj|)
          (|string-map_ve2PL0iWj|)
          ((#%lambda #t
             (|newstr_veKHHWiWj|)
             (|str_veoLJtiWj| |string-map_ve2PL0iWj|)
             (|string-map_ve2PL0iWj|
               |str_veoLJtiWj|
               |newstr_veKHHWiWj|
               char-downcase
               0
               (string-length |str_veoLJtiWj|)))
           (make-string (string-length |str_veoLJtiWj|)))))
      (#%set! string-upcase
        (#%lambda #t
          (|str_ve4EFnjWj|)
          (|string-map_ve2PL0iWj|)
          ((#%lambda #t
             (|newstr_veqADQjWj|)
             (|str_ve4EFnjWj| |string-map_ve2PL0iWj|)
             (|string-map_ve2PL0iWj|
               |str_ve4EFnjWj|
               |newstr_veqADQjWj|
               char-upcase
               0
               (string-length |str_ve4EFnjWj|)))
           (make-string (string-length |str_ve4EFnjWj|))))))))
(#%program
  ((equal? . 1))
  ()
  ()
  (#%define string=? equal?))
(#%program
  ((|s2_vea7nsnWj| . 1)
   (|s1_veQap_mWj| . 1)
   (string->list . 2)
   (car . 2)
   (cdr . 2)
   (|s<?_veuerymWj| . 2)
   (char>? . 1)
   (|c2_veyUegpWj| . 2)
   (|c1_vecYgPoWj| . 2)
   (char<? . 1)
   (|s2_veS_imoWj| . 4)
   (not . 1)
   (|s1_vew3lVnWj| . 3)
   (null? . 3))
  ((|s<?_veuerymWj| . 1))
  (string->list car char<? cdr char>? not null?)
  (#%define string<?
    (#%letrec #t
      ((|s<?_veuerymWj|
         (#%lambda #t
           (|s1_vew3lVnWj| |s2_veS_imoWj|)
           (|s<?_veuerymWj|)
           (#%if (null? |s1_vew3lVnWj|)
             (not (null? |s2_veS_imoWj|))
             (#%if (null? |s2_veS_imoWj|)
               #f
               ((#%lambda #t
                  (|c1_vecYgPoWj| |c2_veyUegpWj|)
                  (|s2_veS_imoWj| |s1_vew3lVnWj| |s<?_veuerymWj|)
                  (#%if (char<? |c1_vecYgPoWj| |c2_veyUegpWj|)
                    #t
                    (#%if (char>? |c1_vecYgPoWj| |c2_veyUegpWj|)
                      #f
                      (|s<?_veuerymWj|
                        (cdr |s1_vew3lVnWj|)
                        (cdr |s2_veS_imoWj|)))))
                (car |s1_vew3lVnWj|)
                (car |s2_veS_imoWj|)))))))
      ()
      (#%lambda #t
        (|s1_veQap_mWj| |s2_vea7nsnWj|)
        (|s<?_veuerymWj|)
        (|s<?_veuerymWj|
          (string->list |s1_veQap_mWj|)
          (string->list |s2_vea7nsnWj|))))))
(#%program
  ((|s2_veAJ8DqWj| . 1)
   (|s1_veeNaaqWj| . 1)
   (string->list . 2)
   (car . 2)
   (cdr . 2)
   (|s>?_veUQcJpWj| . 2)
   (char<? . 1)
   (|c2_veYu0rsWj| . 2)
   (|c1_veCy2-rWj| . 2)
   (char>? . 1)
   (|s1_veWF64rWj| . 4)
   (not . 1)
   (|s2_vegC4xrWj| . 3)
   (null? . 3))
  ((|s>?_veUQcJpWj| . 1))
  (string->list car char>? cdr char<? not null?)
  (#%define string>?
    (#%letrec #t
      ((|s>?_veUQcJpWj|
         (#%lambda #t
           (|s1_veWF64rWj| |s2_vegC4xrWj|)
           (|s>?_veUQcJpWj|)
           (#%if (null? |s2_vegC4xrWj|)
             (not (null? |s1_veWF64rWj|))
             (#%if (null? |s1_veWF64rWj|)
               #f
               ((#%lambda #t
                  (|c1_veCy2-rWj| |c2_veYu0rsWj|)
                  (|s2_vegC4xrWj| |s1_veWF64rWj| |s>?_veUQcJpWj|)
                  (#%if (char>? |c1_veCy2-rWj| |c2_veYu0rsWj|)
                    #t
                    (#%if (char<? |c1_veCy2-rWj| |c2_veYu0rsWj|)
                      #f
                      (|s>?_veUQcJpWj|
                        (cdr |s1_veWF64rWj|)
                        (cdr |s2_vegC4xrWj|)))))
                (car |s1_veWF64rWj|)
                (car |s2_vegC4xrWj|)))))))
      ()
      (#%lambda #t
        (|s1_veeNaaqWj| |s2_veAJ8DqWj|)
        (|s>?_veUQcJpWj|)
        (|s>?_veUQcJpWj|
          (string->list |s1_veeNaaqWj|)
          (string->list |s2_veAJ8DqWj|))))))
(#%program
  ((string=? . 1)
   (|s2_veEnYktWj| . 2)
   (|s1_veir-TsWj| . 2)
   (string<? . 1))
  ()
  (string=? string<?)
  (#%define string<=?
    (#%lambda #t
      (|s1_veir-TsWj| |s2_veEnYktWj|)
      ()
      (#%if (string<? |s1_veir-TsWj| |s2_veEnYktWj|)
        #t
        (string=? |s1_veir-TsWj| |s2_veEnYktWj|)))))
(#%program
  ((string=? . 1)
   (|s2_vekgUeuWj| . 2)
   (|s1_ve-jWNtWj| . 2)
   (string>? . 1))
  ()
  (string=? string>?)
  (#%define string>=?
    (#%lambda #t
      (|s1_ve-jWNtWj| |s2_vekgUeuWj|)
      ()
      (#%if (string>? |s1_ve-jWNtWj| |s2_vekgUeuWj|)
        #t
        (string=? |s1_ve-jWNtWj| |s2_vekgUeuWj|)))))
(#%program
  ((|s2_ve09Q8vWj| . 1)
   (|s1_veGcSHuWj| . 1)
   (string-downcase . 2)
   (string=? . 1))
  ()
  (string-downcase string=?)
  (#%define string-ci=?
    (#%lambda #t
      (|s1_veGcSHuWj| |s2_ve09Q8vWj|)
      ()
      (string=?
        (string-downcase |s1_veGcSHuWj|)
        (string-downcase |s2_ve09Q8vWj|)))))
(#%program
  ((|s2_veI1M2wWj| . 1)
   (|s1_vem5OBvWj| . 1)
   (string-downcase . 2)
   (string<? . 1))
  ()
  (string-downcase string<?)
  (#%define string-ci<?
    (#%lambda #t
      (|s1_vem5OBvWj| |s2_veI1M2wWj|)
      ()
      (string<?
        (string-downcase |s1_vem5OBvWj|)
        (string-downcase |s2_veI1M2wWj|)))))
(#%program
  ((|s2_veoWHYwWj| . 1)
   (|s1_ve2-JvwWj| . 1)
   (string-downcase . 2)
   (string>? . 1))
  ()
  (string-downcase string>?)
  (#%define string-ci>?
    (#%lambda #t
      (|s1_ve2-JvwWj| |s2_veoWHYwWj|)
      ()
      (string>?
        (string-downcase |s1_ve2-JvwWj|)
        (string-downcase |s2_veoWHYwWj|)))))
(#%program
  ((|s2_ve4PDSxWj| . 1)
   (|s1_veKSFpxWj| . 1)
   (string-downcase . 2)
   (string>=? . 1))
  ()
  (string-downcase string>=?)
  (#%define string-ci>=?
    (#%lambda #t
      (|s1_veKSFpxWj| |s2_ve4PDSxWj|)
      ()
      (string>=?
        (string-downcase |s1_veKSFpxWj|)
        (string-downcase |s2_ve4PDSxWj|)))))
(#%program
  ((|s2_veMHzMyWj| . 1)
   (|s1_veqLBjyWj| . 1)
   (string-downcase . 2)
   (string<=? . 1))
  ()
  (string-downcase string<=?)
  (#%define string-ci<=?
    (#%lambda #t
      (|s1_veqLBjyWj| |s2_veMHzMyWj|)
      ()
      (string<=?
        (string-downcase |s1_veqLBjyWj|)
        (string-downcase |s2_veMHzMyWj|)))))
(#%program
  ((- . 1)
   (make-string . 1)
   (|end_ve8trAAWj| . 2)
   (|start_veOwt7AWj| . 2)
   (|newstr_veupp1BWj| . 2)
   (|str_vesAvGzWj| . 1)
   (+ . 2)
   (|fill-string_ve6ExdzWj| . 2)
   (|sstr_veQlnuBWj| . 2)
   (string-ref . 1)
   (|n_vewejoCWj| . 2)
   (|dstr_veailXBWj| . 2)
   (string-set! . 1)
   (|e_vec7fiDWj| . 2)
   (|s_veSahRCWj| . 3)
   (< . 1))
  ((|fill-string_ve6ExdzWj| . 1))
  (make-string - string-ref string-set! + <)
  (#%define substring
    (#%letrec #t
      ((|fill-string_ve6ExdzWj|
         (#%lambda #t
           (|sstr_veQlnuBWj|
             |dstr_veailXBWj|
             |n_vewejoCWj|
             |s_veSahRCWj|
             |e_vec7fiDWj|)
           (|fill-string_ve6ExdzWj|)
           (#%if (< |s_veSahRCWj| |e_vec7fiDWj|)
             (#%begin
               (string-set!
                 |dstr_veailXBWj|
                 |n_vewejoCWj|
                 (string-ref |sstr_veQlnuBWj| |s_veSahRCWj|))
               (|fill-string_ve6ExdzWj|
                 |sstr_veQlnuBWj|
                 |dstr_veailXBWj|
                 (+ |n_vewejoCWj| 1)
                 (+ |s_veSahRCWj| 1)
                 |e_vec7fiDWj|))
             #!void))))
      ()
      (#%lambda #t
        (|str_vesAvGzWj|
          |start_veOwt7AWj|
          |end_ve8trAAWj|)
        (|fill-string_ve6ExdzWj|)
        ((#%lambda #t
           (|newstr_veupp1BWj|)
           (|end_ve8trAAWj|
             |start_veOwt7AWj|
             |str_vesAvGzWj|
             |fill-string_ve6ExdzWj|)
           (#%begin
             (|fill-string_ve6ExdzWj|
               |str_vesAvGzWj|
               |newstr_veupp1BWj|
               0
               |start_veOwt7AWj|
               |end_ve8trAAWj|)
             |newstr_veupp1BWj|))
         (make-string
           (- |end_ve8trAAWj| |start_veOwt7AWj|)))))))
(#%program
  ((- . 1)
   (cdr . 1)
   (list-ref . 1)
   (|list_vey3dLDWj| . 2)
   (car . 1)
   (|n_veU_acEWj| . 2)
   (zero? . 1))
  ()
  (list-ref cdr - car zero?)
  (#%define list-ref
    (#%lambda #t
      (|list_vey3dLDWj| |n_veU_acEWj|)
      ()
      (#%if (zero? |n_veU_acEWj|)
        (car |list_vey3dLDWj|)
        (list-ref
          (cdr |list_vey3dLDWj|)
          (- |n_veU_acEWj| 1))))))
(#%program
  ((|args_veeY8FEWj| . 1)
   (|k_veAU66FWj| . 1)
   (apply . 1)
   (call-with-current-continuation . 1))
  ()
  (apply call-with-current-continuation)
  (#%define values
    (#%lambda #t
      |args_veeY8FEWj|
      ()
      (call-with-current-continuation
        (#%lambda #t
          (|k_veAU66FWj|)
          (|args_veeY8FEWj|)
          (apply |k_veAU66FWj| |args_veeY8FEWj|))))))
