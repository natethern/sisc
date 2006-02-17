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
   (|%%_C1BzaJkb41_proc| . 2)
   (apply . 2)
   (cons . 1)
   (|%%_C1VGePjb41_lists| . 4)
   (|%%_C1fDcgkb41_ls1| . 2)
   (null? . 1))
  ((|%%_C1VGePjb41_lists| . 1))
  (cons map-car apply map-cdr for-each null?)
  (#%define for-each
    (#%lambda #t
      (|%%_C1BzaJkb41_proc|
        |%%_C1fDcgkb41_ls1|
        .
        |%%_C1VGePjb41_lists|)
      ()
      (#%if (null? |%%_C1fDcgkb41_ls1|)
        #!void
        (#%begin
          (#%set! |%%_C1VGePjb41_lists|
            (cons |%%_C1fDcgkb41_ls1| |%%_C1VGePjb41_lists|))
          (apply |%%_C1BzaJkb41_proc|
                 (map-car |%%_C1VGePjb41_lists|))
          (apply for-each
                 |%%_C1BzaJkb41_proc|
                 (map-cdr |%%_C1VGePjb41_lists|)))))))
(#%program
  ((|%%_C1Xv8alb41_x| . 1) (eq? . 1))
  ()
  (eq?)
  (#%define eof-object?
    (#%lambda #t
      (|%%_C1Xv8alb41_x|)
      ()
      (eq? |%%_C1Xv8alb41_x| #!eof))))
(#%program
  ((|%%_C1hs6Dlb41_x| . 1))
  ()
  ()
  (#%define not
    (#%lambda #t
      (|%%_C1hs6Dlb41_x|)
      ()
      (#%if |%%_C1hs6Dlb41_x| #f #t))))
(#%program
  ((|%%_C1Do44mb41_port| . 1)
   (display . 1)
   (apply . 1))
  ()
  (display apply)
  (#%define newline
    (#%lambda #t
      |%%_C1Do44mb41_port|
      ()
      (apply display #\newline |%%_C1Do44mb41_port|))))
(#%program
  ((|%%_C1jh0-mb41_ls| . 1)
   (car . 1)
   (cons . 1)
   (cdr . 1)
   (|%%_C1Zk2xmb41_iter| . 2)
   (|%%_C1_9YTnb41_acc| . 2)
   (|%%_C1Fd-qnb41_ls| . 3)
   (null? . 1))
  ((|%%_C1Zk2xmb41_iter| . 1))
  (cdr car cons null?)
  (#%define reverse
    (#%letrec #t
      ((|%%_C1Zk2xmb41_iter|
         (#%lambda #t
           (|%%_C1Fd-qnb41_ls| |%%_C1_9YTnb41_acc|)
           (|%%_C1Zk2xmb41_iter|)
           (#%if (null? |%%_C1Fd-qnb41_ls|)
             |%%_C1_9YTnb41_acc|
             (|%%_C1Zk2xmb41_iter|
               (cdr |%%_C1Fd-qnb41_ls|)
               (cons (car |%%_C1Fd-qnb41_ls|)
                     |%%_C1_9YTnb41_acc|))))))
      ()
      (#%lambda #t
        (|%%_C1jh0-mb41_ls|)
        (|%%_C1Zk2xmb41_iter|)
        (|%%_C1Zk2xmb41_iter| |%%_C1jh0-mb41_ls| ())))))
(#%program
  ((|%%_C1H2UNob41_s| . 1)
   (cdr . 1)
   (|%%_C1JTN8qb41_d| . 1)
   (|%%_C1l6Wkob41_iter| . 2)
   (set-cdr! . 1)
   (|%%_C1nXPHpb41_r| . 2)
   (|%%_C11_Repb41_s| . 4)
   (null? . 1))
  ((|%%_C1l6Wkob41_iter| . 1))
  (set-cdr! cdr null?)
  (#%define reverse!
    (#%letrec #t
      ((|%%_C1l6Wkob41_iter|
         (#%lambda #t
           (|%%_C11_Repb41_s| |%%_C1nXPHpb41_r|)
           (|%%_C1l6Wkob41_iter|)
           (#%if (null? |%%_C11_Repb41_s|)
             |%%_C1nXPHpb41_r|
             ((#%lambda #t
                (|%%_C1JTN8qb41_d|)
                (|%%_C1nXPHpb41_r|
                  |%%_C11_Repb41_s|
                  |%%_C1l6Wkob41_iter|)
                (#%begin
                  (set-cdr! |%%_C11_Repb41_s| |%%_C1nXPHpb41_r|)
                  (|%%_C1l6Wkob41_iter|
                    |%%_C1JTN8qb41_d|
                    |%%_C11_Repb41_s|)))
              (cdr |%%_C11_Repb41_s|))))))
      ()
      (#%lambda #t
        (|%%_C1H2UNob41_s|)
        (|%%_C1l6Wkob41_iter|)
        (|%%_C1l6Wkob41_iter| |%%_C1H2UNob41_s| ())))))
(#%program
  ((cdr . 1)
   (map-car . 1)
   (caar . 1)
   (cons . 1)
   (|%%_C13QLBqb41_ls| . 3)
   (null? . 1))
  ()
  (cons caar cdr map-car null?)
  (#%define map-car
    (#%lambda #t
      (|%%_C13QLBqb41_ls|)
      ()
      (#%if (null? |%%_C13QLBqb41_ls|)
        ()
        (cons (caar |%%_C13QLBqb41_ls|)
              (map-car (cdr |%%_C13QLBqb41_ls|)))))))
(#%program
  ((cdr . 1)
   (map-cdr . 1)
   (cdar . 1)
   (cons . 1)
   (|%%_C1pMJ2rb41_ls| . 3)
   (null? . 1))
  ()
  (cons cdar cdr map-cdr null?)
  (#%define map-cdr
    (#%lambda #t
      (|%%_C1pMJ2rb41_ls|)
      ()
      (#%if (null? |%%_C1pMJ2rb41_ls|)
        ()
        (cons (cdar |%%_C1pMJ2rb41_ls|)
              (map-cdr (cdr |%%_C1pMJ2rb41_ls|)))))))
(#%program
  ((|%%_C1NxBSsb41_list1| . 2)
   (|%%_C17uzjtb41_proc| . 2)
   (|%%_C1rBDpsb41_lists| . 2)
   (map-car . 1)
   (apply . 1)
   (|%%_C1b8n1wb41_lists| . 2)
   (map-cdr . 1)
   (|%%_C1vfr7vb41_proc| . 2)
   (|%%_C15FFYrb41_loop| . 2)
   (|%%_C1x4luwb41_c| . 2)
   (|%%_C1RbpAvb41_list1| . 3)
   (car . 2)
   (cons . 2)
   (cdr . 2)
   (|%%_C1tqxMtb41_proc| . 2)
   (|%%_C1LIHvrb41_map1| . 2)
   (|%%_C19jtGub41_acc| . 2)
   (reverse . 2)
   (|%%_C1Pmvdub41_list| . 3)
   (null? . 3))
  ((|%%_C15FFYrb41_loop| . 1)
   (|%%_C1LIHvrb41_map1| . 1))
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
      ((|%%_C1LIHvrb41_map1|
         (#%lambda #t
           (|%%_C1tqxMtb41_proc|
             |%%_C1Pmvdub41_list|
             |%%_C19jtGub41_acc|)
           (|%%_C1LIHvrb41_map1|)
           (#%if (null? |%%_C1Pmvdub41_list|)
             (reverse |%%_C19jtGub41_acc|)
             (|%%_C1LIHvrb41_map1|
               |%%_C1tqxMtb41_proc|
               (cdr |%%_C1Pmvdub41_list|)
               (cons (|%%_C1tqxMtb41_proc| (car |%%_C1Pmvdub41_list|))
                     |%%_C19jtGub41_acc|)))))
       (|%%_C15FFYrb41_loop|
         (#%lambda #t
           (|%%_C1vfr7vb41_proc|
             |%%_C1RbpAvb41_list1|
             |%%_C1b8n1wb41_lists|
             |%%_C1x4luwb41_c|)
           (|%%_C15FFYrb41_loop|)
           (#%if (null? |%%_C1RbpAvb41_list1|)
             (reverse |%%_C1x4luwb41_c|)
             (|%%_C15FFYrb41_loop|
               |%%_C1vfr7vb41_proc|
               (cdr |%%_C1RbpAvb41_list1|)
               (map-cdr |%%_C1b8n1wb41_lists|)
               (cons (apply |%%_C1vfr7vb41_proc|
                            (car |%%_C1RbpAvb41_list1|)
                            (map-car |%%_C1b8n1wb41_lists|))
                     |%%_C1x4luwb41_c|))))))
      ()
      (#%lambda #t
        (|%%_C17uzjtb41_proc|
          |%%_C1NxBSsb41_list1|
          .
          |%%_C1rBDpsb41_lists|)
        (|%%_C15FFYrb41_loop| |%%_C1LIHvrb41_map1|)
        (#%if (null? |%%_C1rBDpsb41_lists|)
          (|%%_C1LIHvrb41_map1|
            |%%_C17uzjtb41_proc|
            |%%_C1NxBSsb41_list1|
            ())
          (|%%_C15FFYrb41_loop|
            |%%_C17uzjtb41_proc|
            |%%_C1NxBSsb41_list1|
            |%%_C1rBDpsb41_lists|
            ()))))))
(#%program
  ((|%%_C1zVeRxb41_x| . 1)
   (|%%_C1dZgoxb41_g| . 1)
   (|%%_C1T0jXwb41_f| . 1))
  ()
  ()
  (#%define compose2
    (#%lambda #t
      (|%%_C1T0jXwb41_f| |%%_C1dZgoxb41_g|)
      ()
      (#%lambda #t
        (|%%_C1zVeRxb41_x|)
        (|%%_C1dZgoxb41_g| |%%_C1T0jXwb41_f|)
        (|%%_C1T0jXwb41_f|
          (|%%_C1dZgoxb41_g| |%%_C1zVeRxb41_x|))))))
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
  ((|%%_C1n6OaEb41_list| . 1)
   (|%%_C11aQJDb41_obj| . 1)
   (member . 1)
   (|%%_C1HdSgDb41_list| . 1)
   (|%%_C1lhUPCb41_obj| . 1)
   (memv . 1)
   (|%%_C1_kWmCb41_list| . 1)
   (|%%_C1FoYVBb41_obj| . 1)
   (memq . 1)
   (|%%_C1js-sBb41_alist| . 1)
   (|%%_C1Zv00Bb41_obj| . 1)
   (equal? . 2)
   (assoc . 1)
   (|%%_C1Dz2zAb41_alist| . 1)
   (|%%_C1hD46Ab41_obj| . 1)
   (eqv? . 2)
   (assv . 1)
   (|%%_C1XG6Fzb41_alist| . 1)
   (|%%_C1BK8czb41_obj| . 1)
   (eq? . 2)
   (assq . 1)
   (|%%_C1fOaLyb41_memn| . 4)
   (|%%_C15QDrGb41_obj| . 2)
   (|%%_C1LTF-Fb41_n| . 2)
   (|%%_C1rMBUGb41_list| . 4)
   (cdr . 2)
   (|%%_C1VRciyb41_assn| . 4)
   (car . 2)
   (|%%_C13_J4Fb41_obj| . 2)
   (caar . 1)
   (|%%_C1J2MDEb41_n| . 2)
   (|%%_C1pXHxFb41_alist| . 4)
   (null? . 2))
  ((member . 1)
   (memv . 1)
   (memq . 1)
   (assoc . 1)
   (assv . 1)
   (assq . 1)
   (|%%_C1fOaLyb41_memn| . 1)
   (|%%_C1VRciyb41_assn| . 1))
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
    ((|%%_C1VRciyb41_assn|
       (#%lambda #t
         (|%%_C1J2MDEb41_n|
           |%%_C13_J4Fb41_obj|
           |%%_C1pXHxFb41_alist|)
         (|%%_C1VRciyb41_assn|)
         (#%if (null? |%%_C1pXHxFb41_alist|)
           #f
           (#%if (|%%_C1J2MDEb41_n|
                   (caar |%%_C1pXHxFb41_alist|)
                   |%%_C13_J4Fb41_obj|)
             (car |%%_C1pXHxFb41_alist|)
             (|%%_C1VRciyb41_assn|
               |%%_C1J2MDEb41_n|
               |%%_C13_J4Fb41_obj|
               (cdr |%%_C1pXHxFb41_alist|))))))
     (|%%_C1fOaLyb41_memn|
       (#%lambda #t
         (|%%_C1LTF-Fb41_n|
           |%%_C15QDrGb41_obj|
           |%%_C1rMBUGb41_list|)
         (|%%_C1fOaLyb41_memn|)
         (#%if (null? |%%_C1rMBUGb41_list|)
           #f
           (#%if (|%%_C1LTF-Fb41_n|
                   (car |%%_C1rMBUGb41_list|)
                   |%%_C15QDrGb41_obj|)
             |%%_C1rMBUGb41_list|
             (|%%_C1fOaLyb41_memn|
               |%%_C1LTF-Fb41_n|
               |%%_C15QDrGb41_obj|
               (cdr |%%_C1rMBUGb41_list|)))))))
    ()
    (#%begin
      (#%set! assq
        (#%lambda #t
          (|%%_C1BK8czb41_obj| |%%_C1XG6Fzb41_alist|)
          (|%%_C1VRciyb41_assn|)
          (|%%_C1VRciyb41_assn|
            eq?
            |%%_C1BK8czb41_obj|
            |%%_C1XG6Fzb41_alist|)))
      (#%set! assv
        (#%lambda #t
          (|%%_C1hD46Ab41_obj| |%%_C1Dz2zAb41_alist|)
          (|%%_C1VRciyb41_assn|)
          (|%%_C1VRciyb41_assn|
            eqv?
            |%%_C1hD46Ab41_obj|
            |%%_C1Dz2zAb41_alist|)))
      (#%set! assoc
        (#%lambda #t
          (|%%_C1Zv00Bb41_obj| |%%_C1js-sBb41_alist|)
          (|%%_C1VRciyb41_assn|)
          (|%%_C1VRciyb41_assn|
            equal?
            |%%_C1Zv00Bb41_obj|
            |%%_C1js-sBb41_alist|)))
      (#%set! memq
        (#%lambda #t
          (|%%_C1FoYVBb41_obj| |%%_C1_kWmCb41_list|)
          (|%%_C1fOaLyb41_memn|)
          (|%%_C1fOaLyb41_memn|
            eq?
            |%%_C1FoYVBb41_obj|
            |%%_C1_kWmCb41_list|)))
      (#%set! memv
        (#%lambda #t
          (|%%_C1lhUPCb41_obj| |%%_C1HdSgDb41_list|)
          (|%%_C1fOaLyb41_memn|)
          (|%%_C1fOaLyb41_memn|
            eqv?
            |%%_C1lhUPCb41_obj|
            |%%_C1HdSgDb41_list|)))
      (#%set! member
        (#%lambda #t
          (|%%_C11aQJDb41_obj| |%%_C1n6OaEb41_list|)
          (|%%_C1fOaLyb41_memn|)
          (|%%_C1fOaLyb41_memn|
            equal?
            |%%_C11aQJDb41_obj|
            |%%_C1n6OaEb41_list|))))))
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
   (|%%_C17FxOHb41_ls2| . 2)
   (|%%_C1NIzlHb41_ls1| . 3)
   (null? . 1))
  ()
  (cons car cdr append2 null?)
  (#%define append2
    (#%lambda #t
      (|%%_C1NIzlHb41_ls1| |%%_C17FxOHb41_ls2|)
      ()
      (#%if (null? |%%_C1NIzlHb41_ls1|)
        |%%_C17FxOHb41_ls2|
        (cons (car |%%_C1NIzlHb41_ls1|)
              (append2
                (cdr |%%_C1NIzlHb41_ls1|)
                |%%_C17FxOHb41_ls2|))))))
(#%program
  ((append2 . 1))
  ()
  (append2)
  (#%define append append2))
(#%program
  ((|%%_C1PxtIIb41_base-case| . 1)
   (|%%_C1vqpCJb41_args| . 3)
   (cdr . 2)
   (car . 2)
   (|%%_C1tBvfIb41_proc| . 1)
   (|%%_C19ur9Jb41_helper| . 2)
   (|%%_C1Rmn3Kb41_acc| . 2)
   (|%%_C1bjlwKb41_argls| . 3)
   (null? . 2))
  ((|%%_C19ur9Jb41_helper| . 1))
  (null? cdr car)
  (#%define _make-left-pairwise-nary
    (#%lambda #t
      (|%%_C1tBvfIb41_proc| |%%_C1PxtIIb41_base-case|)
      ()
      (#%letrec #t
        ((|%%_C19ur9Jb41_helper|
           (#%lambda #t
             (|%%_C1Rmn3Kb41_acc| |%%_C1bjlwKb41_argls|)
             (|%%_C19ur9Jb41_helper| |%%_C1tBvfIb41_proc|)
             (#%if (null? |%%_C1bjlwKb41_argls|)
               |%%_C1Rmn3Kb41_acc|
               (|%%_C19ur9Jb41_helper|
                 (|%%_C1tBvfIb41_proc|
                   |%%_C1Rmn3Kb41_acc|
                   (car |%%_C1bjlwKb41_argls|))
                 (cdr |%%_C1bjlwKb41_argls|))))))
        (|%%_C1PxtIIb41_base-case| |%%_C1tBvfIb41_proc|)
        (#%lambda #t
          |%%_C1vqpCJb41_args|
          (|%%_C19ur9Jb41_helper|
            |%%_C1PxtIIb41_base-case|)
          (#%if (null? |%%_C1vqpCJb41_args|)
            |%%_C1PxtIIb41_base-case|
            (|%%_C19ur9Jb41_helper|
              (car |%%_C1vqpCJb41_args|)
              (cdr |%%_C1vqpCJb41_args|))))))))
(#%program
  ((length . 1)
   (make-string . 1)
   (|%%_C1TbhqLb41_l| . 2)
   (+ . 1)
   (cdr . 1)
   (|%%_C1xfjZKb41_l2s| . 2)
   (car . 1)
   (|%%_C1V0bNMb41_n| . 2)
   (string-set! . 1)
   (|%%_C1z4dkMb41_s| . 3)
   (|%%_C1d8fTLb41_l| . 3)
   (null? . 1))
  ((|%%_C1xfjZKb41_l2s| . 1))
  (make-string length car string-set! + cdr null?)
  (#%define list->string
    (#%letrec #t
      ((|%%_C1xfjZKb41_l2s|
         (#%lambda #t
           (|%%_C1d8fTLb41_l|
             |%%_C1z4dkMb41_s|
             |%%_C1V0bNMb41_n|)
           (|%%_C1xfjZKb41_l2s|)
           (#%if (null? |%%_C1d8fTLb41_l|)
             |%%_C1z4dkMb41_s|
             (#%begin
               (string-set!
                 |%%_C1z4dkMb41_s|
                 |%%_C1V0bNMb41_n|
                 (car |%%_C1d8fTLb41_l|))
               (|%%_C1xfjZKb41_l2s|
                 (cdr |%%_C1d8fTLb41_l|)
                 |%%_C1z4dkMb41_s|
                 (+ |%%_C1V0bNMb41_n| 1)))))))
      ()
      (#%lambda #t
        (|%%_C1TbhqLb41_l|)
        (|%%_C1xfjZKb41_l2s|)
        (|%%_C1xfjZKb41_l2s|
          |%%_C1TbhqLb41_l|
          (make-string (length |%%_C1TbhqLb41_l|))
          0)))))
(#%program
  ((string-length . 1)
   (|%%_C1BV6HNb41_s| . 2)
   (- . 2)
   (string-ref . 1)
   (cons . 1)
   (|%%_C1XR48Ob41_s| . 2)
   (|%%_C1fZ8eNb41_s2l| . 2)
   (|%%_C1hO2BOb41_h| . 2)
   (|%%_C1DK02Pb41_n| . 3)
   (< . 1))
  ((|%%_C1fZ8eNb41_s2l| . 1))
  (string-length string-ref cons - <)
  (#%define string->list
    (#%letrec #t
      ((|%%_C1fZ8eNb41_s2l|
         (#%lambda #t
           (|%%_C1XR48Ob41_s|
             |%%_C1hO2BOb41_h|
             |%%_C1DK02Pb41_n|)
           (|%%_C1fZ8eNb41_s2l|)
           (#%if (< |%%_C1DK02Pb41_n| 0)
             |%%_C1hO2BOb41_h|
             (|%%_C1fZ8eNb41_s2l|
               |%%_C1XR48Ob41_s|
               (cons (string-ref |%%_C1XR48Ob41_s| |%%_C1DK02Pb41_n|)
                     |%%_C1hO2BOb41_h|)
               (- |%%_C1DK02Pb41_n| 1))))))
      ()
      (#%lambda #t
        (|%%_C1BV6HNb41_s|)
        (|%%_C1fZ8eNb41_s2l|)
        (|%%_C1fZ8eNb41_s2l|
          |%%_C1BV6HNb41_s|
          ()
          (- (string-length |%%_C1BV6HNb41_s|) 1))))))
(#%program
  ((|%%_C1ZG-uPb41_elems| . 1) (list->vector . 1))
  ()
  (list->vector)
  (#%define vector
    (#%lambda #t
      |%%_C1ZG-uPb41_elems|
      ()
      (list->vector |%%_C1ZG-uPb41_elems|))))
(#%program
  ((|%%_C1jDYXPb41_elems| . 1) (list->string . 1))
  ()
  (list->string)
  (#%define string
    (#%lambda #t
      |%%_C1jDYXPb41_elems|
      ()
      (list->string |%%_C1jDYXPb41_elems|))))
(#%program
  ((_make-parameter . 1))
  ()
  (_make-parameter)
  (#%define current-url (_make-parameter "file:.")))
(#%program
  ((car . 1)
   (string-length . 1)
   (string-append . 1)
   (|%%_C1lsSiRb41_l| . 1)
   (- . 1)
   (|%%_C1_vURQb41_v| . 4)
   (string-ref . 1)
   (eqv? . 1)
   (current-url . 3)
   (normalize-url . 2)
   (|%%_C1FzWoQb41_rest| . 2)
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
      |%%_C1FzWoQb41_rest|
      ()
      (#%if (null? |%%_C1FzWoQb41_rest|)
        (normalize-url (current-url) ".")
        (current-url
          (normalize-url
            (current-url)
            ((#%lambda #t
               (|%%_C1_vURQb41_v|)
               ()
               ((#%lambda #t
                  (|%%_C1lsSiRb41_l|)
                  (|%%_C1_vURQb41_v|)
                  (#%if (eqv? (string-ref
                                |%%_C1_vURQb41_v|
                                (- |%%_C1lsSiRb41_l| 1))
                              #\/)
                    |%%_C1_vURQb41_v|
                    (string-append |%%_C1_vURQb41_v| "/")))
                (string-length |%%_C1_vURQb41_v|)))
             (car |%%_C1FzWoQb41_rest|))))))))
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
   (|%%_C13aIzTb41_extension| . 1)
   (string-downcase . 1)
   (string->symbol . 1)
   (|%%_C1JdK6Tb41__load| . 1)
   (cdr . 1)
   (|%%_C1p6G0Ub41_t| . 2)
   (file-handler . 1)
   (|%%_C1nhMFSb41_thunk| . 1)
   (cons . 2)
   (|%%_C1HoQLRb41_*file-handlers*| . 4)
   (|%%_C11lOcSb41_extension| . 2)
   (assq . 2)
   (not . 1)
   (add-file-handler . 1))
  ((file-handler . 1)
   (|%%_C1HoQLRb41_*file-handlers*| . 1)
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
     (|%%_C1HoQLRb41_*file-handlers*|)
     ()
     (#%begin
       (#%set! add-file-handler
         (#%lambda #t
           (|%%_C11lOcSb41_extension| |%%_C1nhMFSb41_thunk|)
           (|%%_C1HoQLRb41_*file-handlers*|)
           (#%if (not (assq |%%_C11lOcSb41_extension|
                            |%%_C1HoQLRb41_*file-handlers*|))
             (#%set! |%%_C1HoQLRb41_*file-handlers*|
               (cons (cons |%%_C11lOcSb41_extension|
                           |%%_C1nhMFSb41_thunk|)
                     |%%_C1HoQLRb41_*file-handlers*|))
             #!void)))
       (#%set! file-handler
         ((#%lambda #t
            (|%%_C1JdK6Tb41__load|)
            (|%%_C1HoQLRb41_*file-handlers*|)
            (#%lambda #t
              (|%%_C13aIzTb41_extension|)
              (|%%_C1JdK6Tb41__load|
                |%%_C1HoQLRb41_*file-handlers*|)
              ((#%lambda #t
                 (|%%_C1p6G0Ub41_t|)
                 (|%%_C1JdK6Tb41__load|)
                 (#%if |%%_C1p6G0Ub41_t|
                   (cdr |%%_C1p6G0Ub41_t|)
                   |%%_C1JdK6Tb41__load|))
               (assq (string->symbol
                       (string-downcase |%%_C13aIzTb41_extension|))
                     |%%_C1HoQLRb41_*file-handlers*|))))
          load))))
   ()))
(#%program
  ((|%%_C15_BWUb41_rest| . 1)
   (|%%_C1rXznVb41_file| . 1)
   (current-url . 1)
   (normalize-url . 1)
   (|%%_C1L2EtUb41_proc| . 1)
   (apply . 1))
  ()
  (apply current-url normalize-url)
  (#%define make-io-proc
    (#%lambda #t
      (|%%_C1L2EtUb41_proc|)
      ()
      (#%lambda #t
        (|%%_C1rXznVb41_file| . |%%_C15_BWUb41_rest|)
        (|%%_C1L2EtUb41_proc|)
        (apply |%%_C1L2EtUb41_proc|
               (normalize-url
                 (current-url)
                 |%%_C1rXznVb41_file|)
               |%%_C15_BWUb41_rest|)))))
(#%program
  ((|%%_C1buj_Yb41_url| . 1)
   (string->list . 1)
   (reverse! . 1)
   (cons . 1)
   (cdr . 1)
   (|%%_C1xqhsZb41_loop| . 2)
   (|%%_C1djdm-b41_acc| . 2)
   (list->string . 1)
   (car . 2)
   (equal? . 1)
   (|%%_C1TmfVZb41_x| . 4)
   (null? . 1)
   (void . 1)
   (|%%_C1NTxQVb41_file-extension| . 1)
   (|%%_C1RxlyYb41_fe| . 2)
   (file-handler . 1)
   (|%%_C19FpEXb41_e| . 1)
   (|%%_C1PIrbXb41_m| . 1)
   (|%%_C1vBn5Yb41_fk| . 1)
   (call-with-failure-continuation . 1)
   (with-failure-continuation . 1)
   (|%%_C17QvhWb41_file| . 1)
   (|%%_C1tMtKWb41_previous-url| . 3)
   (normalize-url . 1)
   (current-url . 6)
   (load . 1)
   (open-output-file . 2)
   (open-source-input-file . 2)
   (make-io-proc . 3)
   (open-input-file . 2))
  ((|%%_C1xqhsZb41_loop| . 1)
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
     (|%%_C1NTxQVb41_file-extension|)
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
           (|%%_C17QvhWb41_file|)
           (|%%_C1NTxQVb41_file-extension|)
           (#%begin
             ((#%lambda #t
                (|%%_C1tMtKWb41_previous-url|)
                (|%%_C17QvhWb41_file|
                  |%%_C1NTxQVb41_file-extension|)
                (#%begin
                  (current-url
                    (normalize-url
                      |%%_C1tMtKWb41_previous-url|
                      |%%_C17QvhWb41_file|))
                  (with-failure-continuation
                    (#%lambda #t
                      (|%%_C1PIrbXb41_m| |%%_C19FpEXb41_e|)
                      (|%%_C1tMtKWb41_previous-url|)
                      (#%begin
                        (current-url |%%_C1tMtKWb41_previous-url|)
                        (call-with-failure-continuation
                          (#%lambda #t
                            (|%%_C1vBn5Yb41_fk|)
                            (|%%_C19FpEXb41_e| |%%_C1PIrbXb41_m|)
                            (|%%_C1vBn5Yb41_fk|
                              |%%_C1PIrbXb41_m|
                              |%%_C19FpEXb41_e|)))))
                    (#%lambda #t
                      ()
                      (|%%_C1NTxQVb41_file-extension|)
                      ((#%lambda #t
                         (|%%_C1RxlyYb41_fe|)
                         ()
                         ((file-handler
                            (#%if |%%_C1RxlyYb41_fe|
                              |%%_C1RxlyYb41_fe|
                              "scm"))
                          (current-url)))
                       (|%%_C1NTxQVb41_file-extension| (current-url)))))
                  (current-url |%%_C1tMtKWb41_previous-url|)))
              (current-url))
             (void))))))
   (#%lambda #t
     (|%%_C1buj_Yb41_url|)
     ()
     ((#%letrec #t
        ((|%%_C1xqhsZb41_loop|
           (#%lambda #t
             (|%%_C1TmfVZb41_x| |%%_C1djdm-b41_acc|)
             (|%%_C1xqhsZb41_loop|)
             (#%if (null? |%%_C1TmfVZb41_x|)
               #f
               (#%if (equal? (car |%%_C1TmfVZb41_x|) #\.)
                 (list->string |%%_C1djdm-b41_acc|)
                 (|%%_C1xqhsZb41_loop|
                   (cdr |%%_C1TmfVZb41_x|)
                   (cons (car |%%_C1TmfVZb41_x|)
                         |%%_C1djdm-b41_acc|)))))))
        ()
        |%%_C1xqhsZb41_loop|)
      (reverse! (string->list |%%_C1buj_Yb41_url|))
      ()))))
(#%program
  ((|%%_C1zfbP-b41_str| . 1)
   (load-native-library . 1)
   (native-library-binding-names . 1)
   (|%%_C1f87J_b41_binding-names| . 1)
   (|%%_C1Vb9g_b41_nl| . 2)
   (native-library-binding . 1)
   (|%%_C1B45a0c41_name| . 2)
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
      (|%%_C1zfbP-b41_str|)
      ()
      ((#%lambda #t
         (|%%_C1Vb9g_b41_nl|)
         ()
         ((#%lambda #t
            (|%%_C1f87J_b41_binding-names|)
            (|%%_C1Vb9g_b41_nl|)
            (for-each
              (#%lambda #t
                (|%%_C1B45a0c41_name|)
                (|%%_C1Vb9g_b41_nl|)
                (putprop
                  |%%_C1B45a0c41_name|
                  (native-library-binding
                    |%%_C1Vb9g_b41_nl|
                    |%%_C1B45a0c41_name|)))
              |%%_C1f87J_b41_binding-names|))
          (native-library-binding-names |%%_C1Vb9g_b41_nl|)))
       (load-native-library |%%_C1zfbP-b41_str|)))))
(#%program
  ((append2 . 1) (_make-left-pairwise-nary . 1))
  ()
  (append2 _make-left-pairwise-nary)
  (#%define append
    (_make-left-pairwise-nary append2 ())))
(#%program
  ((|%%_C1X03D0c41_x| . 2)
   (null? . 2)
   (|%%_C1ZRYZ1c41_lag| . 1)
   (cdr . 3)
   (|%%_C1hZ041c41_lp| . 2)
   (|%%_C1_GSk3c41_lag| . 2)
   (|%%_C1FKUT2c41_x| . 2)
   (eq? . 1)
   (not . 1)
   (|%%_C1jOWq2c41_x| . 3)
   (|%%_C1DV-w1c41_x| . 3)
   (pair? . 2))
  ((|%%_C1hZ041c41_lp| . 1))
  (pair? cdr eq? not null?)
  (#%define proper-list?
    (#%lambda #t
      (|%%_C1X03D0c41_x|)
      ()
      ((#%letrec #t
         ((|%%_C1hZ041c41_lp|
            (#%lambda #t
              (|%%_C1DV-w1c41_x| |%%_C1ZRYZ1c41_lag|)
              (|%%_C1hZ041c41_lp|)
              (#%if (pair? |%%_C1DV-w1c41_x|)
                ((#%lambda #t
                   (|%%_C1jOWq2c41_x|)
                   (|%%_C1ZRYZ1c41_lag| |%%_C1hZ041c41_lp|)
                   (#%if (pair? |%%_C1jOWq2c41_x|)
                     ((#%lambda #t
                        (|%%_C1FKUT2c41_x| |%%_C1_GSk3c41_lag|)
                        (|%%_C1hZ041c41_lp|)
                        (#%if (not (eq? |%%_C1FKUT2c41_x| |%%_C1_GSk3c41_lag|))
                          (|%%_C1hZ041c41_lp|
                            |%%_C1FKUT2c41_x|
                            |%%_C1_GSk3c41_lag|)
                          #f))
                      (cdr |%%_C1jOWq2c41_x|)
                      (cdr |%%_C1ZRYZ1c41_lag|))
                     (null? |%%_C1jOWq2c41_x|)))
                 (cdr |%%_C1DV-w1c41_x|))
                (null? |%%_C1DV-w1c41_x|)))))
         ()
         |%%_C1hZ041c41_lp|)
       |%%_C1X03D0c41_x|
       |%%_C1X03D0c41_x|))))
(#%program
  ((proper-list? . 1))
  ()
  (proper-list?)
  (#%define list? proper-list?))
(#%program
  ((|%%_C1lDQN3c41_general-expt| . 1)
   (|%%_C11wMH4c41_integer-expt| . 1)
   (denominator . 1)
   (numerator . 1)
   (|%%_C1HzOe4c41_rational-expt| . 1)
   (integer? . 2)
   (not . 1)
   (rational? . 1)
   (|%%_C1nsK85c41_base| . 9)
   (|%%_C1JoIB5c41_exponent| . 8)
   (|%%_C1vMlAac41_squaring| . 3)
   (odd? . 1)
   (quotient . 1)
   (|%%_C1tXrd9c41_loop| . 2)
   (|%%_C19Qn7ac41_result| . 3)
   (|%%_C1PTpG9c41_rest| . 3)
   (zero? . 3)
   (abs . 2)
   (ashl . 2)
   (|%%_C17_tM8c41_exponent| . 7)
   (negative? . 3)
   (= . 1)
   (|%%_C1N2wj8c41_base| . 4)
   (exact? . 5)
   (|%%_C15aAp7c41_base-denominator| . 1)
   (|%%_C1r6yS7c41_exponent| . 2)
   (|%%_C1LdCY6c41_base-numerator| . 1)
   (expt . 2)
   (/ . 3)
   (|%%_C13lG26c41_base| . 1)
   (log . 1)
   (|%%_C1phEv6c41_exponent| . 1)
   (* . 3)
   (exp . 1))
  ((|%%_C1tXrd9c41_loop| . 1)
   (|%%_C11wMH4c41_integer-expt| . 1)
   (|%%_C1HzOe4c41_rational-expt| . 1)
   (|%%_C1lDQN3c41_general-expt| . 1))
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
      ((|%%_C1lDQN3c41_general-expt|
         (#%lambda #t
           (|%%_C13lG26c41_base| |%%_C1phEv6c41_exponent|)
           ()
           (exp (* |%%_C1phEv6c41_exponent|
                   (log |%%_C13lG26c41_base|)))))
       (|%%_C1HzOe4c41_rational-expt|
         (#%lambda #t
           (|%%_C1LdCY6c41_base-numerator|
             |%%_C15aAp7c41_base-denominator|
             |%%_C1r6yS7c41_exponent|)
           ()
           (/ (expt |%%_C1LdCY6c41_base-numerator|
                    |%%_C1r6yS7c41_exponent|)
              (expt |%%_C15aAp7c41_base-denominator|
                    |%%_C1r6yS7c41_exponent|))))
       (|%%_C11wMH4c41_integer-expt|
         (#%lambda #t
           (|%%_C1N2wj8c41_base| |%%_C17_tM8c41_exponent|)
           ()
           (#%if (#%if (exact? |%%_C1N2wj8c41_base|)
                   (= |%%_C1N2wj8c41_base| 2)
                   #f)
             (#%if (negative? |%%_C17_tM8c41_exponent|)
               (/ (ashl 1 (abs |%%_C17_tM8c41_exponent|)))
               (ashl 1 |%%_C17_tM8c41_exponent|))
             ((#%letrec #t
                ((|%%_C1tXrd9c41_loop|
                   (#%lambda #t
                     (|%%_C1PTpG9c41_rest|
                       |%%_C19Qn7ac41_result|
                       |%%_C1vMlAac41_squaring|)
                     (|%%_C1tXrd9c41_loop|)
                     (#%if (zero? |%%_C1PTpG9c41_rest|)
                       |%%_C19Qn7ac41_result|
                       (|%%_C1tXrd9c41_loop|
                         (quotient |%%_C1PTpG9c41_rest| 2)
                         (#%if (odd? |%%_C1PTpG9c41_rest|)
                           (* |%%_C19Qn7ac41_result|
                              |%%_C1vMlAac41_squaring|)
                           |%%_C19Qn7ac41_result|)
                         (* |%%_C1vMlAac41_squaring|
                            |%%_C1vMlAac41_squaring|))))))
                ()
                |%%_C1tXrd9c41_loop|)
              (#%if (negative? |%%_C17_tM8c41_exponent|)
                (abs |%%_C17_tM8c41_exponent|)
                |%%_C17_tM8c41_exponent|)
              1
              (#%if (negative? |%%_C17_tM8c41_exponent|)
                (/ |%%_C1N2wj8c41_base|)
                |%%_C1N2wj8c41_base|))))))
      ()
      (#%lambda #t
        (|%%_C1nsK85c41_base| |%%_C1JoIB5c41_exponent|)
        (|%%_C11wMH4c41_integer-expt|
          |%%_C1HzOe4c41_rational-expt|
          |%%_C1lDQN3c41_general-expt|)
        (#%if (zero? |%%_C1JoIB5c41_exponent|)
          (#%if (exact? |%%_C1JoIB5c41_exponent|) 1 1.0)
          (#%if (zero? |%%_C1nsK85c41_base|)
            (#%if (exact? |%%_C1JoIB5c41_exponent|)
              |%%_C1nsK85c41_base|
              0.0)
            (#%if (#%if (exact? |%%_C1nsK85c41_base|)
                    (#%if (rational? |%%_C1nsK85c41_base|)
                      (not (integer? |%%_C1nsK85c41_base|))
                      #f)
                    #f)
              (|%%_C1HzOe4c41_rational-expt|
                (numerator |%%_C1nsK85c41_base|)
                (denominator |%%_C1nsK85c41_base|)
                |%%_C1JoIB5c41_exponent|)
              (#%if (#%if (exact? |%%_C1JoIB5c41_exponent|)
                      (integer? |%%_C1JoIB5c41_exponent|)
                      #f)
                (|%%_C11wMH4c41_integer-expt|
                  |%%_C1nsK85c41_base|
                  |%%_C1JoIB5c41_exponent|)
                (|%%_C1lDQN3c41_general-expt|
                  |%%_C1nsK85c41_base|
                  |%%_C1JoIB5c41_exponent|)))))))))
(#%program
  ((- . 1)
   (|%%_C1Txdocc41_tmp| . 2)
   (/ . 2)
   (modpow . 2)
   (|%%_C1dubRcc41_tmp| . 2)
   (* . 3)
   (even? . 1)
   (|%%_C1xBfXbc41_n| . 6)
   (|%%_C1RIj1bc41_x| . 4)
   (modulo . 4)
   (|%%_C1bFhubc41_y| . 4)
   (= . 1))
  ()
  (even? modpow / * - modulo =)
  (#%define modpow
    (#%lambda #t
      (|%%_C1RIj1bc41_x|
        |%%_C1bFhubc41_y|
        |%%_C1xBfXbc41_n|)
      ()
      (#%if (= |%%_C1bFhubc41_y| 1)
        (modulo |%%_C1RIj1bc41_x| |%%_C1xBfXbc41_n|)
        (#%if (even? |%%_C1bFhubc41_y|)
          ((#%lambda #t
             (|%%_C1dubRcc41_tmp|)
             (|%%_C1xBfXbc41_n|)
             (modulo
               (* |%%_C1dubRcc41_tmp| |%%_C1dubRcc41_tmp|)
               |%%_C1xBfXbc41_n|))
           (modpow
             |%%_C1RIj1bc41_x|
             (/ |%%_C1bFhubc41_y| 2)
             |%%_C1xBfXbc41_n|))
          ((#%lambda #t
             (|%%_C1Txdocc41_tmp|)
             (|%%_C1xBfXbc41_n| |%%_C1RIj1bc41_x|)
             (modulo
               (* |%%_C1RIj1bc41_x|
                  (modulo
                    (* |%%_C1Txdocc41_tmp| |%%_C1Txdocc41_tmp|)
                    |%%_C1xBfXbc41_n|))
               |%%_C1xBfXbc41_n|))
           (modpow
             |%%_C1RIj1bc41_x|
             (/ (- |%%_C1bFhubc41_y| 1) 2)
             |%%_C1xBfXbc41_n|)))))))
(#%program
  ((round . 1)
   (= . 1)
   (real? . 1)
   (|%%_C1zq9idc41_n| . 4)
   (_integer? . 1))
  ()
  (real? round = _integer?)
  (#%define integer?
    (#%lambda #t
      (|%%_C1zq9idc41_n|)
      ()
      (#%if (_integer? |%%_C1zq9idc41_n|)
        #t
        (#%if (real? |%%_C1zq9idc41_n|)
          (= (round |%%_C1zq9idc41_n|) |%%_C1zq9idc41_n|)
          #f)))))
(#%program
  ((complex? . 1)
   (|%%_C1Vm7Ldc41_oldcomp?| . 1)
   (not . 1)
   (|%%_C1fj5cec41_n| . 2)
   (number? . 1))
  ()
  (complex? number? not)
  (#%define real?
    ((#%lambda #t
       (|%%_C1Vm7Ldc41_oldcomp?|)
       ()
       (#%lambda #t
         (|%%_C1fj5cec41_n|)
         (|%%_C1Vm7Ldc41_oldcomp?|)
         (#%if (number? |%%_C1fj5cec41_n|)
           (not (|%%_C1Vm7Ldc41_oldcomp?| |%%_C1fj5cec41_n|))
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
   (|%%_C1h8_yfc41_b| . 2)
   (|%%_C1Xb16fc41_a| . 2)
   (* . 2)
   (+ . 1)
   (sqrt . 1)
   (|%%_C1Bf3Fec41_num| . 6)
   (real? . 1)
   (not . 1))
  ()
  (< - + * sqrt real-part imag-part not real?)
  (#%define abs
    (#%lambda #t
      (|%%_C1Bf3Fec41_num|)
      ()
      (#%if (not (real? |%%_C1Bf3Fec41_num|))
        ((#%lambda #t
           (|%%_C1Xb16fc41_a| |%%_C1h8_yfc41_b|)
           ()
           (sqrt (+ (* |%%_C1Xb16fc41_a| |%%_C1Xb16fc41_a|)
                    (* |%%_C1h8_yfc41_b| |%%_C1h8_yfc41_b|))))
         (real-part |%%_C1Bf3Fec41_num|)
         (imag-part |%%_C1Bf3Fec41_num|))
        (#%if (< |%%_C1Bf3Fec41_num| 0)
          (- |%%_C1Bf3Fec41_num|)
          |%%_C1Bf3Fec41_num|)))))
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
   (|%%_C1_RQPhc41_x1| . 3)
   (|%%_C1FVSmhc41_args| . 2)
   (max . 1)
   (< . 1)
   (|%%_C1jZUVgc41_x1| . 3)
   (|%%_C1Z0Xsgc41_args| . 2)
   (min . 1)
   (inexact? . 3)
   (cdr . 2)
   (|%%_C1D4Z_fc41__min_max| . 4)
   (car . 3)
   (|%%_C1lOOgic41_proc| . 3)
   (exact->inexact . 1)
   (|%%_C1HKMJic41_mv| . 5)
   (exact? . 1)
   (|%%_C1nDIDjc41_inexact| . 3)
   (|%%_C11HKajc41_args| . 6)
   (null? . 3))
  ((max . 1)
   (min . 1)
   (|%%_C1D4Z_fc41__min_max| . 1))
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
    ((|%%_C1D4Z_fc41__min_max|
       (#%lambda #t
         (|%%_C1lOOgic41_proc|
           |%%_C1HKMJic41_mv|
           |%%_C11HKajc41_args|
           |%%_C1nDIDjc41_inexact|)
         (|%%_C1D4Z_fc41__min_max|)
         (#%if (null? |%%_C11HKajc41_args|)
           (#%if (#%if |%%_C1nDIDjc41_inexact|
                   (exact? |%%_C1HKMJic41_mv|)
                   #f)
             (exact->inexact |%%_C1HKMJic41_mv|)
             |%%_C1HKMJic41_mv|)
           (#%if (|%%_C1lOOgic41_proc|
                   (car |%%_C11HKajc41_args|)
                   |%%_C1HKMJic41_mv|)
             (|%%_C1D4Z_fc41__min_max|
               |%%_C1lOOgic41_proc|
               (car |%%_C11HKajc41_args|)
               (cdr |%%_C11HKajc41_args|)
               (#%if |%%_C1nDIDjc41_inexact|
                 #t
                 (inexact? (car |%%_C11HKajc41_args|))))
             (|%%_C1D4Z_fc41__min_max|
               |%%_C1lOOgic41_proc|
               |%%_C1HKMJic41_mv|
               (cdr |%%_C11HKajc41_args|)
               |%%_C1nDIDjc41_inexact|))))))
    ()
    (#%begin
      (#%set! min
        (#%lambda #t
          (|%%_C1jZUVgc41_x1| . |%%_C1Z0Xsgc41_args|)
          (|%%_C1D4Z_fc41__min_max|)
          (#%if (null? |%%_C1Z0Xsgc41_args|)
            |%%_C1jZUVgc41_x1|
            (|%%_C1D4Z_fc41__min_max|
              <
              |%%_C1jZUVgc41_x1|
              |%%_C1Z0Xsgc41_args|
              (inexact? |%%_C1jZUVgc41_x1|)))))
      (#%set! max
        (#%lambda #t
          (|%%_C1_RQPhc41_x1| . |%%_C1FVSmhc41_args|)
          (|%%_C1D4Z_fc41__min_max|)
          (#%if (null? |%%_C1FVSmhc41_args|)
            |%%_C1_RQPhc41_x1|
            (|%%_C1D4Z_fc41__min_max|
              >
              |%%_C1_RQPhc41_x1|
              |%%_C1FVSmhc41_args|
              (inexact? |%%_C1_RQPhc41_x1|))))))))
(#%program
  ((|%%_C1JzG4kc41_n| . 1) (< . 1))
  ()
  (<)
  (#%define negative?
    (#%lambda #t
      (|%%_C1JzG4kc41_n|)
      ()
      (< |%%_C1JzG4kc41_n| 0))))
(#%program
  ((|%%_C13wExkc41_n| . 1) (> . 1))
  ()
  (>)
  (#%define positive?
    (#%lambda #t
      (|%%_C13wExkc41_n|)
      ()
      (> |%%_C13wExkc41_n| 0))))
(#%program
  ((|%%_C1psC-kc41_n| . 1) (modulo . 1) (= . 1))
  ()
  (modulo =)
  (#%define even?
    (#%lambda #t
      (|%%_C1psC-kc41_n|)
      ()
      (= 0 (modulo |%%_C1psC-kc41_n| 2)))))
(#%program
  ((|%%_C1LoArlc41_n| . 1) (even? . 1) (not . 1))
  ()
  (even? not)
  (#%define odd?
    (#%lambda #t
      (|%%_C1LoArlc41_n|)
      ()
      (not (even? |%%_C1LoArlc41_n|)))))
(#%program
  ((|%%_C15lyUlc41_n| . 1) (= . 1))
  ()
  (=)
  (#%define zero?
    (#%lambda #t
      (|%%_C15lyUlc41_n|)
      ()
      (= |%%_C15lyUlc41_n| 0))))
(#%program
  ((|%%_C1rhwlmc41_n| . 1) (+ . 1))
  ()
  (+)
  (#%define add1
    (#%lambda #t
      (|%%_C1rhwlmc41_n|)
      ()
      (+ |%%_C1rhwlmc41_n| 1))))
(#%program
  ((|%%_C1NduOmc41_n| . 1) (- . 1))
  ()
  (-)
  (#%define sub1
    (#%lambda #t
      (|%%_C1NduOmc41_n|)
      ()
      (- |%%_C1NduOmc41_n| 1))))
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
  ((|%%_C1Bq18tc41_y| . 1)
   (|%%_C1fu3Hsc41_x| . 1)
   (|%%_C1dF9krc41_args| . 1)
   (|%%_C1zB7Nrc41_loop| . 2)
   (cadr . 1)
   (car . 1)
   (|%%_C1bQfZpc41_comparator| . 1)
   (|%%_C1xMdqqc41_chainer| . 1)
   (cdr . 2)
   (|%%_C1TIbTqc41_endstate| . 2)
   (|%%_C1Vx5esc41_x| . 5)
   (null? . 2)
   (|%%_C1RThwpc41_b| . 2)
   (|%%_C1vXj3pc41_a| . 2)
   (> . 1)
   (>= . 1)
   (|%%_C1t6qInc41__and2| . 2)
   (= . 2)
   (|%%_C19_lCoc41_b| . 2)
   (|%%_C1P2o9oc41_a| . 2)
   (< . 1)
   (|%%_C17asfnc41__comp_help| . 2)
   (<= . 1))
  ((|%%_C1zB7Nrc41_loop| . 1) (>= . 1) (<= . 1))
  (null? cadr car cdr <= = < >= >)
  ((#%lambda #t
     (|%%_C17asfnc41__comp_help|
       |%%_C1t6qInc41__and2|)
     ()
     (#%begin
       (#%set! <=
         (|%%_C17asfnc41__comp_help|
           (#%lambda #t
             (|%%_C1P2o9oc41_a| |%%_C19_lCoc41_b|)
             ()
             (#%if (< |%%_C1P2o9oc41_a| |%%_C19_lCoc41_b|)
               #t
               (= |%%_C1P2o9oc41_a| |%%_C19_lCoc41_b|)))
           |%%_C1t6qInc41__and2|
           #t))
       (#%set! >=
         (|%%_C17asfnc41__comp_help|
           (#%lambda #t
             (|%%_C1vXj3pc41_a| |%%_C1RThwpc41_b|)
             ()
             (#%if (> |%%_C1vXj3pc41_a| |%%_C1RThwpc41_b|)
               #t
               (= |%%_C1vXj3pc41_a| |%%_C1RThwpc41_b|)))
           |%%_C1t6qInc41__and2|
           #t))))
   (#%lambda #t
     (|%%_C1bQfZpc41_comparator|
       |%%_C1xMdqqc41_chainer|
       |%%_C1TIbTqc41_endstate|)
     ()
     (#%lambda #t
       |%%_C1dF9krc41_args|
       (|%%_C1TIbTqc41_endstate|
         |%%_C1xMdqqc41_chainer|
         |%%_C1bQfZpc41_comparator|)
       ((#%letrec #t
          ((|%%_C1zB7Nrc41_loop|
             (#%lambda #t
               (|%%_C1Vx5esc41_x|)
               (|%%_C1zB7Nrc41_loop|
                 |%%_C1TIbTqc41_endstate|
                 |%%_C1xMdqqc41_chainer|
                 |%%_C1bQfZpc41_comparator|)
               (#%if (null? |%%_C1Vx5esc41_x|)
                 |%%_C1TIbTqc41_endstate|
                 (#%if (null? (cdr |%%_C1Vx5esc41_x|))
                   |%%_C1TIbTqc41_endstate|
                   (|%%_C1xMdqqc41_chainer|
                     (|%%_C1bQfZpc41_comparator|
                       (car |%%_C1Vx5esc41_x|)
                       (cadr |%%_C1Vx5esc41_x|))
                     (|%%_C1zB7Nrc41_loop| (cdr |%%_C1Vx5esc41_x|))))))))
          (|%%_C1TIbTqc41_endstate|
            |%%_C1xMdqqc41_chainer|
            |%%_C1bQfZpc41_comparator|)
          |%%_C1zB7Nrc41_loop|)
        |%%_C1dF9krc41_args|)))
   (#%lambda #t
     (|%%_C1fu3Hsc41_x| |%%_C1Bq18tc41_y|)
     ()
     (#%if |%%_C1fu3Hsc41_x| |%%_C1Bq18tc41_y| #f))))
(#%program
  ((|%%_C1DfXuuc41_chainer| . 1)
   (apply . 1)
   (|%%_C1hjZ1uc41_comparator| . 1)
   (cadr . 2)
   (car . 2)
   (= . 1)
   (cdr . 2)
   (|%%_C1ZbVXuc41_args| . 7)
   (null? . 2)
   (< . 1)
   (<= . 2)
   (> . 1)
   (|%%_C1Xm_Atc41__?=| . 2)
   (>= . 2))
  ((<= . 1) (>= . 1))
  (< <= <= > >= >= null? = car cadr apply cdr)
  ((#%lambda #t
     (|%%_C1Xm_Atc41__?=|)
     ()
     (#%begin
       (#%set! >= (|%%_C1Xm_Atc41__?=| > >=))
       (#%set! <= (|%%_C1Xm_Atc41__?=| < <=))))
   (#%lambda #t
     (|%%_C1hjZ1uc41_comparator|
       |%%_C1DfXuuc41_chainer|)
     ()
     (#%lambda #t
       |%%_C1ZbVXuc41_args|
       (|%%_C1DfXuuc41_chainer|
         |%%_C1hjZ1uc41_comparator|)
       (#%if (null? |%%_C1ZbVXuc41_args|)
         #t
         (#%if (null? (cdr |%%_C1ZbVXuc41_args|))
           #t
           (#%if (#%if (= (car |%%_C1ZbVXuc41_args|)
                          (cadr |%%_C1ZbVXuc41_args|))
                   #t
                   (|%%_C1hjZ1uc41_comparator|
                     (car |%%_C1ZbVXuc41_args|)
                     (cadr |%%_C1ZbVXuc41_args|)))
             (apply |%%_C1DfXuuc41_chainer|
                    (cdr |%%_C1ZbVXuc41_args|))
             #f)))))))
(#%program
  ((cadr . 1)
   (_gcd . 1)
   (car . 2)
   (cdr . 1)
   (|%%_C1F4RRvc41_args| . 5)
   (null? . 2))
  ()
  (cdr car cadr _gcd null?)
  (#%define gcd
    (#%lambda #t
      |%%_C1F4RRvc41_args|
      ()
      (#%if (null? |%%_C1F4RRvc41_args|)
        0
        (#%if (null? (cdr |%%_C1F4RRvc41_args|))
          (car |%%_C1F4RRvc41_args|)
          (_gcd (car |%%_C1F4RRvc41_args|)
                (cadr |%%_C1F4RRvc41_args|)))))))
(#%program
  ((cadr . 1)
   (_lcm . 1)
   (car . 2)
   (cdr . 1)
   (|%%_C1_0Piwc41_args| . 5)
   (null? . 2))
  ()
  (cdr car cadr _lcm null?)
  (#%define lcm
    (#%lambda #t
      |%%_C1_0Piwc41_args|
      ()
      (#%if (null? |%%_C1_0Piwc41_args|)
        1
        (#%if (null? (cdr |%%_C1_0Piwc41_args|))
          (car |%%_C1_0Piwc41_args|)
          (_lcm (car |%%_C1_0Piwc41_args|)
                (cadr |%%_C1_0Piwc41_args|)))))))
(#%program
  ((|%%_C1lZMLwc41_x| . 1)
   (remainder . 1)
   (+ . 1)
   (|%%_C11SIFxc41_r| . 3)
   (positive? . 1)
   (|%%_C1HVKcxc41_y| . 3)
   (negative? . 2))
  ()
  (remainder positive? negative? +)
  (#%define modulo
    (#%lambda #t
      (|%%_C1lZMLwc41_x| |%%_C1HVKcxc41_y|)
      ()
      ((#%lambda #t
         (|%%_C11SIFxc41_r|)
         (|%%_C1HVKcxc41_y|)
         (#%if ((#%if (negative? |%%_C1HVKcxc41_y|)
                  positive?
                  negative?)
                |%%_C11SIFxc41_r|)
           (+ |%%_C11SIFxc41_r| |%%_C1HVKcxc41_y|)
           |%%_C11SIFxc41_r|))
       (remainder |%%_C1lZMLwc41_x| |%%_C1HVKcxc41_y|)))))
(#%program
  ((- . 1)
   (char->integer . 4)
   (|%%_C1pDAtzc41_c| . 2)
   (|%%_C13HC0zc41_lc-offset| . 1)
   (+ . 1)
   (integer->char . 1)
   (|%%_C1JKEzyc41_z| . 1)
   (<= . 1)
   (|%%_C1nOG6yc41_a| . 2)
   (|%%_C1LzyWzc41_cv| . 3)
   (>= . 1))
  ()
  (integer->char + >= <= char->integer -)
  (#%define char-downcase
    ((#%lambda #t
       (|%%_C1nOG6yc41_a|)
       ()
       ((#%lambda #t
          (|%%_C1JKEzyc41_z|)
          (|%%_C1nOG6yc41_a|)
          ((#%lambda #t
             (|%%_C13HC0zc41_lc-offset|)
             (|%%_C1JKEzyc41_z| |%%_C1nOG6yc41_a|)
             (#%lambda #t
               (|%%_C1pDAtzc41_c|)
               (|%%_C13HC0zc41_lc-offset|
                 |%%_C1JKEzyc41_z|
                 |%%_C1nOG6yc41_a|)
               ((#%lambda #t
                  (|%%_C1LzyWzc41_cv|)
                  (|%%_C1pDAtzc41_c|
                    |%%_C13HC0zc41_lc-offset|
                    |%%_C1JKEzyc41_z|
                    |%%_C1nOG6yc41_a|)
                  (#%if (#%if (>= |%%_C1LzyWzc41_cv| |%%_C1nOG6yc41_a|)
                          (<= |%%_C1LzyWzc41_cv| |%%_C1JKEzyc41_z|)
                          #f)
                    (integer->char
                      (+ |%%_C1LzyWzc41_cv| |%%_C13HC0zc41_lc-offset|))
                    |%%_C1pDAtzc41_c|))
                (char->integer |%%_C1pDAtzc41_c|))))
           (- (char->integer #\a) |%%_C1nOG6yc41_a|)))
        (char->integer #\Z)))
     (char->integer #\A))))
(#%program
  ((char->integer . 4)
   (|%%_C17lqKBc41_c| . 2)
   (|%%_C1NoshBc41_uc-offset| . 1)
   (- . 2)
   (integer->char . 1)
   (|%%_C1rsuQAc41_z| . 1)
   (<= . 1)
   (|%%_C15wwnAc41_a| . 2)
   (|%%_C1thobCc41_cv| . 3)
   (>= . 1))
  ()
  (integer->char - >= <= char->integer)
  (#%define char-upcase
    ((#%lambda #t
       (|%%_C15wwnAc41_a|)
       ()
       ((#%lambda #t
          (|%%_C1rsuQAc41_z|)
          (|%%_C15wwnAc41_a|)
          ((#%lambda #t
             (|%%_C1NoshBc41_uc-offset|)
             (|%%_C1rsuQAc41_z| |%%_C15wwnAc41_a|)
             (#%lambda #t
               (|%%_C17lqKBc41_c|)
               (|%%_C1NoshBc41_uc-offset|
                 |%%_C1rsuQAc41_z|
                 |%%_C15wwnAc41_a|)
               ((#%lambda #t
                  (|%%_C1thobCc41_cv|)
                  (|%%_C17lqKBc41_c|
                    |%%_C1NoshBc41_uc-offset|
                    |%%_C1rsuQAc41_z|
                    |%%_C15wwnAc41_a|)
                  (#%if (#%if (>= |%%_C1thobCc41_cv| |%%_C15wwnAc41_a|)
                          (<= |%%_C1thobCc41_cv| |%%_C1rsuQAc41_z|)
                          #f)
                    (integer->char
                      (- |%%_C1thobCc41_cv| |%%_C1NoshBc41_uc-offset|))
                    |%%_C17lqKBc41_c|))
                (char->integer |%%_C17lqKBc41_c|))))
           (- |%%_C15wwnAc41_a| (char->integer #\A))))
        (char->integer #\z)))
     (char->integer #\a))))
(#%program
  ((|%%_C1PdmECc41_args| . 1)
   (map . 1)
   (|%%_C19ak5Dc41_c2| . 1)
   (|%%_C1v6iyDc41_c1| . 1)
   (char->integer . 3)
   (> . 1)
   (apply . 1))
  ()
  (map char->integer > apply)
  (#%define char>?
    (#%lambda #t
      (|%%_C1v6iyDc41_c1|
        |%%_C19ak5Dc41_c2|
        .
        |%%_C1PdmECc41_args|)
      ()
      (apply >
             (char->integer |%%_C1v6iyDc41_c1|)
             (char->integer |%%_C19ak5Dc41_c2|)
             (map char->integer |%%_C1PdmECc41_args|)))))
(#%program
  ((|%%_C1R2g_Dc41_args| . 1)
   (map . 1)
   (|%%_C1b_dsEc41_c2| . 1)
   (|%%_C1xXbVEc41_c1| . 1)
   (char->integer . 3)
   (< . 1)
   (apply . 1))
  ()
  (map char->integer < apply)
  (#%define char<?
    (#%lambda #t
      (|%%_C1xXbVEc41_c1|
        |%%_C1b_dsEc41_c2|
        .
        |%%_C1R2g_Dc41_args|)
      ()
      (apply <
             (char->integer |%%_C1xXbVEc41_c1|)
             (char->integer |%%_C1b_dsEc41_c2|)
             (map char->integer |%%_C1R2g_Dc41_args|)))))
(#%program
  ((char=? . 1)
   (|%%_C1dQ7PFc41_c2| . 2)
   (|%%_C1TT9mFc41_c1| . 2)
   (char>? . 1))
  ()
  (char=? char>?)
  (#%define char>=?
    (#%lambda #t
      (|%%_C1TT9mFc41_c1| |%%_C1dQ7PFc41_c2|)
      ()
      (#%if (char>? |%%_C1TT9mFc41_c1| |%%_C1dQ7PFc41_c2|)
        #t
        (char=? |%%_C1TT9mFc41_c1| |%%_C1dQ7PFc41_c2|)))))
(#%program
  ((char=? . 1)
   (|%%_C1VI3JGc41_c2| . 2)
   (|%%_C1zM5gGc41_c1| . 2)
   (char<? . 1))
  ()
  (char=? char<?)
  (#%define char<=?
    (#%lambda #t
      (|%%_C1zM5gGc41_c1| |%%_C1VI3JGc41_c2|)
      ()
      (#%if (char<? |%%_C1zM5gGc41_c1| |%%_C1VI3JGc41_c2|)
        #t
        (char=? |%%_C1zM5gGc41_c1| |%%_C1VI3JGc41_c2|)))))
(#%program
  ((|%%_C1fF1aHc41_args| . 1)
   (map . 1)
   (|%%_C1BB_CHc41_c2| . 1)
   (|%%_C1XxZ3Ic41_c1| . 1)
   (char-downcase . 3)
   (char>? . 1)
   (apply . 1))
  ()
  (map char-downcase char>? apply)
  (#%define char-ci>?
    (#%lambda #t
      (|%%_C1XxZ3Ic41_c1|
        |%%_C1BB_CHc41_c2|
        .
        |%%_C1fF1aHc41_args|)
      ()
      (apply char>?
             (char-downcase |%%_C1XxZ3Ic41_c1|)
             (char-downcase |%%_C1BB_CHc41_c2|)
             (map char-downcase |%%_C1fF1aHc41_args|)))))
(#%program
  ((|%%_C1huXwIc41_args| . 1)
   (map . 1)
   (|%%_C1DqVZIc41_c2| . 1)
   (|%%_C1ZmTqJc41_c1| . 1)
   (char-downcase . 3)
   (char<? . 1)
   (apply . 1))
  ()
  (map char-downcase char<? apply)
  (#%define char-ci<?
    (#%lambda #t
      (|%%_C1ZmTqJc41_c1|
        |%%_C1DqVZIc41_c2|
        .
        |%%_C1huXwIc41_args|)
      ()
      (apply char<?
             (char-downcase |%%_C1ZmTqJc41_c1|)
             (char-downcase |%%_C1DqVZIc41_c2|)
             (map char-downcase |%%_C1huXwIc41_args|)))))
(#%program
  ((|%%_C1jjRTJc41_args| . 1)
   (map . 1)
   (|%%_C1FfPkKc41_c2| . 1)
   (|%%_C1_bNNKc41_c1| . 1)
   (char-downcase . 3)
   (char=? . 1)
   (apply . 1))
  ()
  (map char-downcase char=? apply)
  (#%define char-ci=?
    (#%lambda #t
      (|%%_C1_bNNKc41_c1|
        |%%_C1FfPkKc41_c2|
        .
        |%%_C1jjRTJc41_args|)
      ()
      (apply char=?
             (char-downcase |%%_C1_bNNKc41_c1|)
             (char-downcase |%%_C1FfPkKc41_c2|)
             (map char-downcase |%%_C1jjRTJc41_args|)))))
(#%program
  ((char-ci=? . 1)
   (|%%_C1H4JHLc41_c2| . 2)
   (|%%_C1l8LeLc41_c1| . 2)
   (char-ci>? . 1))
  ()
  (char-ci=? char-ci>?)
  (#%define char-ci>=?
    (#%lambda #t
      (|%%_C1l8LeLc41_c1| |%%_C1H4JHLc41_c2|)
      ()
      (#%if (char-ci>? |%%_C1l8LeLc41_c1| |%%_C1H4JHLc41_c2|)
        #t
        (char-ci=? |%%_C1l8LeLc41_c1| |%%_C1H4JHLc41_c2|)))))
(#%program
  ((char-ci=? . 1)
   (|%%_C1nZEBMc41_c2| . 2)
   (|%%_C111H8Mc41_c1| . 2)
   (char-ci<? . 1))
  ()
  (char-ci=? char-ci<?)
  (#%define char-ci<=?
    (#%lambda #t
      (|%%_C111H8Mc41_c1| |%%_C1nZEBMc41_c2|)
      ()
      (#%if (char-ci<? |%%_C111H8Mc41_c1| |%%_C1nZEBMc41_c2|)
        #t
        (char-ci=? |%%_C111H8Mc41_c1| |%%_C1nZEBMc41_c2|)))))
(#%program
  ((|%%_C1JVC2Nc41_c| . 2) (char<? . 2))
  ()
  (char<?)
  (#%define char-alphabetic?
    (#%lambda #t
      (|%%_C1JVC2Nc41_c|)
      ()
      (#%if (char<? #\@ |%%_C1JVC2Nc41_c| #\[)
        #t
        (char<? #\` |%%_C1JVC2Nc41_c| #\{)))))
(#%program
  ((|%%_C13SAvNc41_c| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-numeric?
    (#%lambda #t
      (|%%_C13SAvNc41_c|)
      ()
      (char<? #\/ |%%_C13SAvNc41_c| #\:))))
(#%program
  ((|%%_C1pOyYNc41_c| . 4) (char=? . 4))
  ()
  (char=?)
  (#%define char-whitespace?
    (#%lambda #t
      (|%%_C1pOyYNc41_c|)
      ()
      (#%if (char=? |%%_C1pOyYNc41_c| #\space)
        #t
        (#%if (char=? |%%_C1pOyYNc41_c| #\tab)
          #t
          (#%if (char=? |%%_C1pOyYNc41_c| #\newline)
            #t
            (char=? |%%_C1pOyYNc41_c| #\return)))))))
(#%program
  ((|%%_C1LKwpOc41_c| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-upper-case?
    (#%lambda #t
      (|%%_C1LKwpOc41_c|)
      ()
      (char<? #\@ |%%_C1LKwpOc41_c| #\[))))
(#%program
  ((|%%_C15HuSOc41_c| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-lower-case?
    (#%lambda #t
      (|%%_C15HuSOc41_c|)
      ()
      (char<? #\` |%%_C15HuSOc41_c| #\{))))
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
   (|%%_C1Pok7Rc41_newstr| . 1)
   (|%%_C1tsmGQc41_str| . 3)
   (string-upcase . 1)
   (make-string . 2)
   (string-length . 4)
   (char-downcase . 1)
   (|%%_C17wodQc41_newstr| . 1)
   (|%%_C1NzqMPc41_str| . 3)
   (string-downcase . 1)
   (+ . 1)
   (|%%_C1rDsjPc41_string-map| . 3)
   (|%%_C19liARc41_strsrc| . 2)
   (string-ref . 1)
   (|%%_C1RdeuSc41_proc| . 2)
   (|%%_C1vhg1Sc41_strdst| . 3)
   (string-set! . 1)
   (|%%_C1x6aoTc41_l| . 2)
   (|%%_C1bacXSc41_n| . 4)
   (< . 1))
  ((string-upcase . 1)
   (string-downcase . 1)
   (|%%_C1rDsjPc41_string-map| . 1))
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
    ((|%%_C1rDsjPc41_string-map|
       (#%lambda #t
         (|%%_C19liARc41_strsrc|
           |%%_C1vhg1Sc41_strdst|
           |%%_C1RdeuSc41_proc|
           |%%_C1bacXSc41_n|
           |%%_C1x6aoTc41_l|)
         (|%%_C1rDsjPc41_string-map|)
         (#%if (< |%%_C1bacXSc41_n| |%%_C1x6aoTc41_l|)
           (#%begin
             (string-set!
               |%%_C1vhg1Sc41_strdst|
               |%%_C1bacXSc41_n|
               (|%%_C1RdeuSc41_proc|
                 (string-ref
                   |%%_C19liARc41_strsrc|
                   |%%_C1bacXSc41_n|)))
             (|%%_C1rDsjPc41_string-map|
               |%%_C19liARc41_strsrc|
               |%%_C1vhg1Sc41_strdst|
               |%%_C1RdeuSc41_proc|
               (+ |%%_C1bacXSc41_n| 1)
               |%%_C1x6aoTc41_l|))
           |%%_C1vhg1Sc41_strdst|))))
    ()
    (#%begin
      (#%set! string-downcase
        (#%lambda #t
          (|%%_C1NzqMPc41_str|)
          (|%%_C1rDsjPc41_string-map|)
          ((#%lambda #t
             (|%%_C17wodQc41_newstr|)
             (|%%_C1NzqMPc41_str| |%%_C1rDsjPc41_string-map|)
             (|%%_C1rDsjPc41_string-map|
               |%%_C1NzqMPc41_str|
               |%%_C17wodQc41_newstr|
               char-downcase
               0
               (string-length |%%_C1NzqMPc41_str|)))
           (make-string (string-length |%%_C1NzqMPc41_str|)))))
      (#%set! string-upcase
        (#%lambda #t
          (|%%_C1tsmGQc41_str|)
          (|%%_C1rDsjPc41_string-map|)
          ((#%lambda #t
             (|%%_C1Pok7Rc41_newstr|)
             (|%%_C1tsmGQc41_str| |%%_C1rDsjPc41_string-map|)
             (|%%_C1rDsjPc41_string-map|
               |%%_C1tsmGQc41_str|
               |%%_C1Pok7Rc41_newstr|
               char-upcase
               0
               (string-length |%%_C1tsmGQc41_str|)))
           (make-string (string-length |%%_C1tsmGQc41_str|))))))))
(#%program
  ((|%%_C1zX3LUc41_s2| . 1)
   (|%%_C1d_5iUc41_s1| . 1)
   (string->list . 2)
   (car . 2)
   (cdr . 2)
   (|%%_C1T28RTc41_s<?| . 2)
   (char>? . 1)
   (|%%_C1XIXyWc41_c2| . 2)
   (|%%_C1BMZ5Wc41_c1| . 2)
   (char<? . 1)
   (|%%_C1fQ_EVc41_s2| . 4)
   (not . 1)
   (|%%_C1VT1cVc41_s1| . 3)
   (null? . 3))
  ((|%%_C1T28RTc41_s<?| . 1))
  (string->list car char<? cdr char>? not null?)
  (#%define string<?
    (#%letrec #t
      ((|%%_C1T28RTc41_s<?|
         (#%lambda #t
           (|%%_C1VT1cVc41_s1| |%%_C1fQ_EVc41_s2|)
           (|%%_C1T28RTc41_s<?|)
           (#%if (null? |%%_C1VT1cVc41_s1|)
             (not (null? |%%_C1fQ_EVc41_s2|))
             (#%if (null? |%%_C1fQ_EVc41_s2|)
               #f
               ((#%lambda #t
                  (|%%_C1BMZ5Wc41_c1| |%%_C1XIXyWc41_c2|)
                  (|%%_C1fQ_EVc41_s2|
                    |%%_C1VT1cVc41_s1|
                    |%%_C1T28RTc41_s<?|)
                  (#%if (char<? |%%_C1BMZ5Wc41_c1| |%%_C1XIXyWc41_c2|)
                    #t
                    (#%if (char>? |%%_C1BMZ5Wc41_c1| |%%_C1XIXyWc41_c2|)
                      #f
                      (|%%_C1T28RTc41_s<?|
                        (cdr |%%_C1VT1cVc41_s1|)
                        (cdr |%%_C1fQ_EVc41_s2|)))))
                (car |%%_C1VT1cVc41_s1|)
                (car |%%_C1fQ_EVc41_s2|)))))))
      ()
      (#%lambda #t
        (|%%_C1d_5iUc41_s1| |%%_C1zX3LUc41_s2|)
        (|%%_C1T28RTc41_s<?|)
        (|%%_C1T28RTc41_s<?|
          (string->list |%%_C1d_5iUc41_s1|)
          (string->list |%%_C1zX3LUc41_s2|))))))
(#%program
  ((|%%_C1ZxRVXc41_s2| . 1)
   (|%%_C1DBTsXc41_s1| . 1)
   (string->list . 2)
   (car . 2)
   (cdr . 2)
   (|%%_C1hFV_Wc41_s>?| . 2)
   (char<? . 1)
   (|%%_C1ljJJZc41_c2| . 2)
   (|%%_C1_mLgZc41_c1| . 2)
   (char>? . 1)
   (|%%_C1juPmYc41_s1| . 4)
   (not . 1)
   (|%%_C1FqNPYc41_s2| . 3)
   (null? . 3))
  ((|%%_C1hFV_Wc41_s>?| . 1))
  (string->list car char>? cdr char<? not null?)
  (#%define string>?
    (#%letrec #t
      ((|%%_C1hFV_Wc41_s>?|
         (#%lambda #t
           (|%%_C1juPmYc41_s1| |%%_C1FqNPYc41_s2|)
           (|%%_C1hFV_Wc41_s>?|)
           (#%if (null? |%%_C1FqNPYc41_s2|)
             (not (null? |%%_C1juPmYc41_s1|))
             (#%if (null? |%%_C1juPmYc41_s1|)
               #f
               ((#%lambda #t
                  (|%%_C1_mLgZc41_c1| |%%_C1ljJJZc41_c2|)
                  (|%%_C1FqNPYc41_s2|
                    |%%_C1juPmYc41_s1|
                    |%%_C1hFV_Wc41_s>?|)
                  (#%if (char>? |%%_C1_mLgZc41_c1| |%%_C1ljJJZc41_c2|)
                    #t
                    (#%if (char<? |%%_C1_mLgZc41_c1| |%%_C1ljJJZc41_c2|)
                      #f
                      (|%%_C1hFV_Wc41_s>?|
                        (cdr |%%_C1juPmYc41_s1|)
                        (cdr |%%_C1FqNPYc41_s2|)))))
                (car |%%_C1juPmYc41_s1|)
                (car |%%_C1FqNPYc41_s2|)))))))
      ()
      (#%lambda #t
        (|%%_C1DBTsXc41_s1| |%%_C1ZxRVXc41_s2|)
        (|%%_C1hFV_Wc41_s>?|)
        (|%%_C1hFV_Wc41_s>?|
          (string->list |%%_C1DBTsXc41_s1|)
          (string->list |%%_C1ZxRVXc41_s2|))))))
(#%program
  ((string=? . 1)
   (|%%_C11cFD-c41_s2| . 2)
   (|%%_C1HfHa-c41_s1| . 2)
   (string<? . 1))
  ()
  (string=? string<?)
  (#%define string<=?
    (#%lambda #t
      (|%%_C1HfHa-c41_s1| |%%_C11cFD-c41_s2|)
      ()
      (#%if (string<? |%%_C1HfHa-c41_s1| |%%_C11cFD-c41_s2|)
        #t
        (string=? |%%_C1HfHa-c41_s1| |%%_C11cFD-c41_s2|)))))
(#%program
  ((string=? . 1)
   (|%%_C1J4Bx_c41_s2| . 2)
   (|%%_C1n8D4_c41_s1| . 2)
   (string>? . 1))
  ()
  (string=? string>?)
  (#%define string>=?
    (#%lambda #t
      (|%%_C1n8D4_c41_s1| |%%_C1J4Bx_c41_s2|)
      ()
      (#%if (string>? |%%_C1n8D4_c41_s1| |%%_C1J4Bx_c41_s2|)
        #t
        (string=? |%%_C1n8D4_c41_s1| |%%_C1J4Bx_c41_s2|)))))
(#%program
  ((|%%_C1pZwr0d41_s2| . 1)
   (|%%_C131z-_c41_s1| . 1)
   (string-downcase . 2)
   (string=? . 1))
  ()
  (string-downcase string=?)
  (#%define string-ci=?
    (#%lambda #t
      (|%%_C131z-_c41_s1| |%%_C1pZwr0d41_s2|)
      ()
      (string=?
        (string-downcase |%%_C131z-_c41_s1|)
        (string-downcase |%%_C1pZwr0d41_s2|)))))
(#%program
  ((|%%_C15Ssl1d41_s2| . 1)
   (|%%_C1LVuU0d41_s1| . 1)
   (string-downcase . 2)
   (string<? . 1))
  ()
  (string-downcase string<?)
  (#%define string-ci<?
    (#%lambda #t
      (|%%_C1LVuU0d41_s1| |%%_C15Ssl1d41_s2|)
      ()
      (string<?
        (string-downcase |%%_C1LVuU0d41_s1|)
        (string-downcase |%%_C15Ssl1d41_s2|)))))
(#%program
  ((|%%_C1NKof2d41_s2| . 1)
   (|%%_C1rOqO1d41_s1| . 1)
   (string-downcase . 2)
   (string>? . 1))
  ()
  (string-downcase string>?)
  (#%define string-ci>?
    (#%lambda #t
      (|%%_C1rOqO1d41_s1| |%%_C1NKof2d41_s2|)
      ()
      (string>?
        (string-downcase |%%_C1rOqO1d41_s1|)
        (string-downcase |%%_C1NKof2d41_s2|)))))
(#%program
  ((|%%_C1tDk93d41_s2| . 1)
   (|%%_C17HmI2d41_s1| . 1)
   (string-downcase . 2)
   (string>=? . 1))
  ()
  (string-downcase string>=?)
  (#%define string-ci>=?
    (#%lambda #t
      (|%%_C17HmI2d41_s1| |%%_C1tDk93d41_s2|)
      ()
      (string>=?
        (string-downcase |%%_C17HmI2d41_s1|)
        (string-downcase |%%_C1tDk93d41_s2|)))))
(#%program
  ((|%%_C19wg34d41_s2| . 1)
   (|%%_C1PziC3d41_s1| . 1)
   (string-downcase . 2)
   (string<=? . 1))
  ()
  (string-downcase string<=?)
  (#%define string-ci<=?
    (#%lambda #t
      (|%%_C1PziC3d41_s1| |%%_C19wg34d41_s2|)
      ()
      (string<=?
        (string-downcase |%%_C1PziC3d41_s1|)
        (string-downcase |%%_C19wg34d41_s2|)))))
(#%program
  ((- . 1)
   (make-string . 1)
   (|%%_C1xh8T5d41_end| . 2)
   (|%%_C1blaq5d41_start| . 2)
   (|%%_C1Td6k6d41_newstr| . 2)
   (|%%_C1RocZ4d41_str| . 1)
   (+ . 2)
   (|%%_C1vsew4d41_fill-string| . 2)
   (|%%_C1da4N6d41_sstr| . 2)
   (string-ref . 1)
   (|%%_C1V20H7d41_n| . 2)
   (|%%_C1z62e7d41_dstr| . 2)
   (string-set! . 1)
   (|%%_C1BXXA8d41_e| . 2)
   (|%%_C1f_Z78d41_s| . 3)
   (< . 1))
  ((|%%_C1vsew4d41_fill-string| . 1))
  (make-string - string-ref string-set! + <)
  (#%define substring
    (#%letrec #t
      ((|%%_C1vsew4d41_fill-string|
         (#%lambda #t
           (|%%_C1da4N6d41_sstr|
             |%%_C1z62e7d41_dstr|
             |%%_C1V20H7d41_n|
             |%%_C1f_Z78d41_s|
             |%%_C1BXXA8d41_e|)
           (|%%_C1vsew4d41_fill-string|)
           (#%if (< |%%_C1f_Z78d41_s| |%%_C1BXXA8d41_e|)
             (#%begin
               (string-set!
                 |%%_C1z62e7d41_dstr|
                 |%%_C1V20H7d41_n|
                 (string-ref
                   |%%_C1da4N6d41_sstr|
                   |%%_C1f_Z78d41_s|))
               (|%%_C1vsew4d41_fill-string|
                 |%%_C1da4N6d41_sstr|
                 |%%_C1z62e7d41_dstr|
                 (+ |%%_C1V20H7d41_n| 1)
                 (+ |%%_C1f_Z78d41_s| 1)
                 |%%_C1BXXA8d41_e|))
             #!void))))
      ()
      (#%lambda #t
        (|%%_C1RocZ4d41_str|
          |%%_C1blaq5d41_start|
          |%%_C1xh8T5d41_end|)
        (|%%_C1vsew4d41_fill-string|)
        ((#%lambda #t
           (|%%_C1Td6k6d41_newstr|)
           (|%%_C1xh8T5d41_end|
             |%%_C1blaq5d41_start|
             |%%_C1RocZ4d41_str|
             |%%_C1vsew4d41_fill-string|)
           (#%begin
             (|%%_C1vsew4d41_fill-string|
               |%%_C1RocZ4d41_str|
               |%%_C1Td6k6d41_newstr|
               0
               |%%_C1blaq5d41_start|
               |%%_C1xh8T5d41_end|)
             |%%_C1Td6k6d41_newstr|))
         (make-string
           (- |%%_C1xh8T5d41_end| |%%_C1blaq5d41_start|)))))))
(#%program
  ((- . 1)
   (cdr . 1)
   (list-ref . 1)
   (|%%_C1XTV19d41_list| . 2)
   (car . 1)
   (|%%_C1hQTu9d41_n| . 2)
   (zero? . 1))
  ()
  (list-ref cdr - car zero?)
  (#%define list-ref
    (#%lambda #t
      (|%%_C1XTV19d41_list| |%%_C1hQTu9d41_n|)
      ()
      (#%if (zero? |%%_C1hQTu9d41_n|)
        (car |%%_C1XTV19d41_list|)
        (list-ref
          (cdr |%%_C1XTV19d41_list|)
          (- |%%_C1hQTu9d41_n| 1))))))
(#%program
  ((|%%_C1DMRX9d41_args| . 1)
   (|%%_C1ZIPoad41_k| . 1)
   (apply . 1)
   (call-with-current-continuation . 1))
  ()
  (apply call-with-current-continuation)
  (#%define values
    (#%lambda #t
      |%%_C1DMRX9d41_args|
      ()
      (call-with-current-continuation
        (#%lambda #t
          (|%%_C1ZIPoad41_k|)
          (|%%_C1DMRX9d41_args|)
          (apply |%%_C1ZIPoad41_k| |%%_C1DMRX9d41_args|))))))
