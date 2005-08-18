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
   (|%%_LB3tQIsOS_proc| . 2)
   (apply . 2)
   (cons . 1)
   (|%%_LBnAUOrOS_lists| . 4)
   (|%%_LBJwSfsOS_ls1| . 2)
   (null? . 1))
  ((|%%_LBnAUOrOS_lists| . 1))
  (cons map-car apply map-cdr for-each null?)
  (#%define for-each
    (#%lambda #t
      (|%%_LB3tQIsOS_proc|
        |%%_LBJwSfsOS_ls1|
        .
        |%%_LBnAUOrOS_lists|)
      ()
      (#%if (null? |%%_LBJwSfsOS_ls1|)
        #!void
        (#%begin
          (#%set! |%%_LBnAUOrOS_lists|
            (cons |%%_LBJwSfsOS_ls1| |%%_LBnAUOrOS_lists|))
          (apply |%%_LB3tQIsOS_proc|
                 (map-car |%%_LBnAUOrOS_lists|))
          (apply for-each
                 |%%_LB3tQIsOS_proc|
                 (map-cdr |%%_LBnAUOrOS_lists|)))))))
(#%program
  ((|%%_LBppO9tOS_x| . 1) (eq? . 1))
  ()
  (eq?)
  (#%define eof-object?
    (#%lambda #t
      (|%%_LBppO9tOS_x|)
      ()
      (eq? |%%_LBppO9tOS_x| #!eof))))
(#%program
  ((|%%_LBLlMCtOS_x| . 1))
  ()
  ()
  (#%define not
    (#%lambda #t
      (|%%_LBLlMCtOS_x|)
      ()
      (#%if |%%_LBLlMCtOS_x| #f #t))))
(#%program
  ((|%%_LB5iK3uOS_port| . 1)
   (display . 1)
   (apply . 1))
  ()
  (display apply)
  (#%define newline
    (#%lambda #t
      |%%_LB5iK3uOS_port|
      ()
      (apply display #\newline |%%_LB5iK3uOS_port|))))
(#%program
  ((|%%_LBNaGZuOS_ls| . 1)
   (car . 1)
   (cons . 1)
   (cdr . 1)
   (|%%_LBreIwuOS_iter| . 2)
   (|%%_LBt3CTvOS_acc| . 2)
   (|%%_LB77EqvOS_ls| . 3)
   (null? . 1))
  ((|%%_LBreIwuOS_iter| . 1))
  (cdr car cons null?)
  (#%define reverse
    (#%letrec #t
      ((|%%_LBreIwuOS_iter|
         (#%lambda #t
           (|%%_LB77EqvOS_ls| |%%_LBt3CTvOS_acc|)
           (|%%_LBreIwuOS_iter|)
           (#%if (null? |%%_LB77EqvOS_ls|)
             |%%_LBt3CTvOS_acc|
             (|%%_LBreIwuOS_iter|
               (cdr |%%_LB77EqvOS_ls|)
               (cons (car |%%_LB77EqvOS_ls|) |%%_LBt3CTvOS_acc|))))))
      ()
      (#%lambda #t
        (|%%_LBNaGZuOS_ls|)
        (|%%_LBreIwuOS_iter|)
        (|%%_LBreIwuOS_iter| |%%_LBNaGZuOS_ls| ())))))
(#%program
  ((|%%_LB9YxNwOS_s| . 1)
   (cdr . 1)
   (|%%_LBbNr8yOS_d| . 1)
   (|%%_LBP_zkwOS_iter| . 2)
   (set-cdr! . 1)
   (|%%_LBRQtHxOS_r| . 2)
   (|%%_LBvUvexOS_s| . 4)
   (null? . 1))
  ((|%%_LBP_zkwOS_iter| . 1))
  (set-cdr! cdr null?)
  (#%define reverse!
    (#%letrec #t
      ((|%%_LBP_zkwOS_iter|
         (#%lambda #t
           (|%%_LBvUvexOS_s| |%%_LBRQtHxOS_r|)
           (|%%_LBP_zkwOS_iter|)
           (#%if (null? |%%_LBvUvexOS_s|)
             |%%_LBRQtHxOS_r|
             ((#%lambda #t
                (|%%_LBbNr8yOS_d|)
                (|%%_LBRQtHxOS_r|
                  |%%_LBvUvexOS_s|
                  |%%_LBP_zkwOS_iter|)
                (#%begin
                  (set-cdr! |%%_LBvUvexOS_s| |%%_LBRQtHxOS_r|)
                  (|%%_LBP_zkwOS_iter|
                    |%%_LBbNr8yOS_d|
                    |%%_LBvUvexOS_s|)))
              (cdr |%%_LBvUvexOS_s|))))))
      ()
      (#%lambda #t
        (|%%_LB9YxNwOS_s|)
        (|%%_LBP_zkwOS_iter|)
        (|%%_LBP_zkwOS_iter| |%%_LB9YxNwOS_s| ())))))
(#%program
  ((cdr . 1)
   (map-car . 1)
   (caar . 1)
   (cons . 1)
   (|%%_LBxJpByOS_ls| . 3)
   (null? . 1))
  ()
  (cons caar cdr map-car null?)
  (#%define map-car
    (#%lambda #t
      (|%%_LBxJpByOS_ls|)
      ()
      (#%if (null? |%%_LBxJpByOS_ls|)
        ()
        (cons (caar |%%_LBxJpByOS_ls|)
              (map-car (cdr |%%_LBxJpByOS_ls|)))))))
(#%program
  ((cdr . 1)
   (map-cdr . 1)
   (cdar . 1)
   (cons . 1)
   (|%%_LBTFn2zOS_ls| . 3)
   (null? . 1))
  ()
  (cons cdar cdr map-cdr null?)
  (#%define map-cdr
    (#%lambda #t
      (|%%_LBTFn2zOS_ls|)
      ()
      (#%if (null? |%%_LBTFn2zOS_ls|)
        ()
        (cons (cdar |%%_LBTFn2zOS_ls|)
              (map-cdr (cdr |%%_LBTFn2zOS_ls|)))))))
(#%program
  ((|%%_LBfrfSAOS_list1| . 2)
   (|%%_LBBndjBOS_proc| . 2)
   (|%%_LBVuhpAOS_lists| . 2)
   (map-car . 1)
   (apply . 1)
   (|%%_LBF111EOS_lists| . 2)
   (map-cdr . 1)
   (|%%_LBZ857DOS_proc| . 2)
   (|%%_LBzyjYzOS_loop| . 2)
   (|%%_LB_Z-tEOS_c| . 2)
   (|%%_LBj53ADOS_list1| . 3)
   (car . 2)
   (cons . 2)
   (cdr . 2)
   (|%%_LBXjbMBOS_proc| . 2)
   (|%%_LBdClvzOS_map1| . 2)
   (|%%_LBDc7GCOS_acc| . 2)
   (reverse . 2)
   (|%%_LBhg9dCOS_list| . 3)
   (null? . 3))
  ((|%%_LBzyjYzOS_loop| . 1)
   (|%%_LBdClvzOS_map1| . 1))
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
      ((|%%_LBdClvzOS_map1|
         (#%lambda #t
           (|%%_LBXjbMBOS_proc|
             |%%_LBhg9dCOS_list|
             |%%_LBDc7GCOS_acc|)
           (|%%_LBdClvzOS_map1|)
           (#%if (null? |%%_LBhg9dCOS_list|)
             (reverse |%%_LBDc7GCOS_acc|)
             (|%%_LBdClvzOS_map1|
               |%%_LBXjbMBOS_proc|
               (cdr |%%_LBhg9dCOS_list|)
               (cons (|%%_LBXjbMBOS_proc| (car |%%_LBhg9dCOS_list|))
                     |%%_LBDc7GCOS_acc|)))))
       (|%%_LBzyjYzOS_loop|
         (#%lambda #t
           (|%%_LBZ857DOS_proc|
             |%%_LBj53ADOS_list1|
             |%%_LBF111EOS_lists|
             |%%_LB_Z-tEOS_c|)
           (|%%_LBzyjYzOS_loop|)
           (#%if (null? |%%_LBj53ADOS_list1|)
             (reverse |%%_LB_Z-tEOS_c|)
             (|%%_LBzyjYzOS_loop|
               |%%_LBZ857DOS_proc|
               (cdr |%%_LBj53ADOS_list1|)
               (map-cdr |%%_LBF111EOS_lists|)
               (cons (apply |%%_LBZ857DOS_proc|
                            (car |%%_LBj53ADOS_list1|)
                            (map-car |%%_LBF111EOS_lists|))
                     |%%_LB_Z-tEOS_c|))))))
      ()
      (#%lambda #t
        (|%%_LBBndjBOS_proc|
          |%%_LBfrfSAOS_list1|
          .
          |%%_LBVuhpAOS_lists|)
        (|%%_LBzyjYzOS_loop| |%%_LBdClvzOS_map1|)
        (#%if (null? |%%_LBVuhpAOS_lists|)
          (|%%_LBdClvzOS_map1|
            |%%_LBBndjBOS_proc|
            |%%_LBfrfSAOS_list1|
            ())
          (|%%_LBzyjYzOS_loop|
            |%%_LBBndjBOS_proc|
            |%%_LBfrfSAOS_list1|
            |%%_LBVuhpAOS_lists|
            ()))))))
(#%program
  ((|%%_LB1PUQFOS_x| . 1)
   (|%%_LBHSWnFOS_g| . 1)
   (|%%_LBlWYWEOS_f| . 1))
  ()
  ()
  (#%define compose2
    (#%lambda #t
      (|%%_LBlWYWEOS_f| |%%_LBHSWnFOS_g|)
      ()
      (#%lambda #t
        (|%%_LB1PUQFOS_x|)
        (|%%_LBHSWnFOS_g| |%%_LBlWYWEOS_f|)
        (|%%_LBlWYWEOS_f|
          (|%%_LBHSWnFOS_g| |%%_LB1PUQFOS_x|))))))
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
  ((|%%_LBR_raMOS_list| . 1)
   (|%%_LBv3uJLOS_obj| . 1)
   (member . 1)
   (|%%_LB97wgLOS_list| . 1)
   (|%%_LBPayPKOS_obj| . 1)
   (memv . 1)
   (|%%_LBteAmKOS_list| . 1)
   (|%%_LB7iCVJOS_obj| . 1)
   (memq . 1)
   (|%%_LBNlEsJOS_alist| . 1)
   (|%%_LBrpG_IOS_obj| . 1)
   (equal? . 2)
   (assoc . 1)
   (|%%_LB5tIyIOS_alist| . 1)
   (|%%_LBLwK5IOS_obj| . 1)
   (eqv? . 2)
   (assv . 1)
   (|%%_LBpAMEHOS_alist| . 1)
   (|%%_LB3EObHOS_obj| . 1)
   (eq? . 2)
   (assq . 1)
   (|%%_LBJHQKGOS_memn| . 4)
   (|%%_LBzJhrOOS_obj| . 2)
   (|%%_LBdNj-NOS_n| . 2)
   (|%%_LBVFfUOOS_list| . 4)
   (cdr . 2)
   (|%%_LBnLShGOS_assn| . 4)
   (car . 2)
   (|%%_LBxUn4NOS_obj| . 2)
   (caar . 1)
   (|%%_LBbYpDMOS_n| . 2)
   (|%%_LBTQlxNOS_alist| . 4)
   (null? . 2))
  ((member . 1)
   (memv . 1)
   (memq . 1)
   (assoc . 1)
   (assv . 1)
   (assq . 1)
   (|%%_LBJHQKGOS_memn| . 1)
   (|%%_LBnLShGOS_assn| . 1))
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
    ((|%%_LBnLShGOS_assn|
       (#%lambda #t
         (|%%_LBbYpDMOS_n|
           |%%_LBxUn4NOS_obj|
           |%%_LBTQlxNOS_alist|)
         (|%%_LBnLShGOS_assn|)
         (#%if (null? |%%_LBTQlxNOS_alist|)
           #f
           (#%if (|%%_LBbYpDMOS_n|
                   (caar |%%_LBTQlxNOS_alist|)
                   |%%_LBxUn4NOS_obj|)
             (car |%%_LBTQlxNOS_alist|)
             (|%%_LBnLShGOS_assn|
               |%%_LBbYpDMOS_n|
               |%%_LBxUn4NOS_obj|
               (cdr |%%_LBTQlxNOS_alist|))))))
     (|%%_LBJHQKGOS_memn|
       (#%lambda #t
         (|%%_LBdNj-NOS_n|
           |%%_LBzJhrOOS_obj|
           |%%_LBVFfUOOS_list|)
         (|%%_LBJHQKGOS_memn|)
         (#%if (null? |%%_LBVFfUOOS_list|)
           #f
           (#%if (|%%_LBdNj-NOS_n|
                   (car |%%_LBVFfUOOS_list|)
                   |%%_LBzJhrOOS_obj|)
             |%%_LBVFfUOOS_list|
             (|%%_LBJHQKGOS_memn|
               |%%_LBdNj-NOS_n|
               |%%_LBzJhrOOS_obj|
               (cdr |%%_LBVFfUOOS_list|)))))))
    ()
    (#%begin
      (#%set! assq
        (#%lambda #t
          (|%%_LB3EObHOS_obj| |%%_LBpAMEHOS_alist|)
          (|%%_LBnLShGOS_assn|)
          (|%%_LBnLShGOS_assn|
            eq?
            |%%_LB3EObHOS_obj|
            |%%_LBpAMEHOS_alist|)))
      (#%set! assv
        (#%lambda #t
          (|%%_LBLwK5IOS_obj| |%%_LB5tIyIOS_alist|)
          (|%%_LBnLShGOS_assn|)
          (|%%_LBnLShGOS_assn|
            eqv?
            |%%_LBLwK5IOS_obj|
            |%%_LB5tIyIOS_alist|)))
      (#%set! assoc
        (#%lambda #t
          (|%%_LBrpG_IOS_obj| |%%_LBNlEsJOS_alist|)
          (|%%_LBnLShGOS_assn|)
          (|%%_LBnLShGOS_assn|
            equal?
            |%%_LBrpG_IOS_obj|
            |%%_LBNlEsJOS_alist|)))
      (#%set! memq
        (#%lambda #t
          (|%%_LB7iCVJOS_obj| |%%_LBteAmKOS_list|)
          (|%%_LBJHQKGOS_memn|)
          (|%%_LBJHQKGOS_memn|
            eq?
            |%%_LB7iCVJOS_obj|
            |%%_LBteAmKOS_list|)))
      (#%set! memv
        (#%lambda #t
          (|%%_LBPayPKOS_obj| |%%_LB97wgLOS_list|)
          (|%%_LBJHQKGOS_memn|)
          (|%%_LBJHQKGOS_memn|
            eqv?
            |%%_LBPayPKOS_obj|
            |%%_LB97wgLOS_list|)))
      (#%set! member
        (#%lambda #t
          (|%%_LBv3uJLOS_obj| |%%_LBR_raMOS_list|)
          (|%%_LBJHQKGOS_memn|)
          (|%%_LBJHQKGOS_memn|
            equal?
            |%%_LBv3uJLOS_obj|
            |%%_LBR_raMOS_list|))))))
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
   (|%%_LBBybOPOS_ls2| . 2)
   (|%%_LBfCdlPOS_ls1| . 3)
   (null? . 1))
  ()
  (cons car cdr append2 null?)
  (#%define append2
    (#%lambda #t
      (|%%_LBfCdlPOS_ls1| |%%_LBBybOPOS_ls2|)
      ()
      (#%if (null? |%%_LBfCdlPOS_ls1|)
        |%%_LBBybOPOS_ls2|
        (cons (car |%%_LBfCdlPOS_ls1|)
              (append2
                (cdr |%%_LBfCdlPOS_ls1|)
                |%%_LBBybOPOS_ls2|))))))
(#%program
  ((append2 . 1))
  ()
  (append2)
  (#%define append append2))
(#%program
  ((|%%_LBhr7IQOS_base-case| . 1)
   (|%%_LBZj3CROS_args| . 3)
   (cdr . 2)
   (car . 2)
   (|%%_LBXu9fQOS_proc| . 1)
   (|%%_LBDn59ROS_helper| . 2)
   (|%%_LBjg13SOS_acc| . 2)
   (|%%_LBFc_vSOS_argls| . 3)
   (null? . 2))
  ((|%%_LBDn59ROS_helper| . 1))
  (null? cdr car)
  (#%define _make-left-pairwise-nary
    (#%lambda #t
      (|%%_LBXu9fQOS_proc| |%%_LBhr7IQOS_base-case|)
      ()
      (#%letrec #t
        ((|%%_LBDn59ROS_helper|
           (#%lambda #t
             (|%%_LBjg13SOS_acc| |%%_LBFc_vSOS_argls|)
             (|%%_LBDn59ROS_helper| |%%_LBXu9fQOS_proc|)
             (#%if (null? |%%_LBFc_vSOS_argls|)
               |%%_LBjg13SOS_acc|
               (|%%_LBDn59ROS_helper|
                 (|%%_LBXu9fQOS_proc|
                   |%%_LBjg13SOS_acc|
                   (car |%%_LBFc_vSOS_argls|))
                 (cdr |%%_LBFc_vSOS_argls|))))))
        (|%%_LBhr7IQOS_base-case| |%%_LBXu9fQOS_proc|)
        (#%lambda #t
          |%%_LBZj3CROS_args|
          (|%%_LBDn59ROS_helper| |%%_LBhr7IQOS_base-case|)
          (#%if (null? |%%_LBZj3CROS_args|)
            |%%_LBhr7IQOS_base-case|
            (|%%_LBDn59ROS_helper|
              (car |%%_LBZj3CROS_args|)
              (cdr |%%_LBZj3CROS_args|))))))))
(#%program
  ((|%%_LBl5XpTOS_base-case| . 1)
   (|%%_LB1-SjUOS_args| . 3)
   (cdr . 2)
   (car . 2)
   (|%%_LB_8ZYSOS_proc| . 1)
   (helper . 2)
   (|%%_LBnWQMUOS_acc| . 2)
   (|%%_LBJSOdVOS_argls| . 3)
   (null? . 2))
  ()
  (helper car cdr null?)
  (#%define _make-right-pairwise-nary
    (#%lambda #t
      (|%%_LB_8ZYSOS_proc| |%%_LBl5XpTOS_base-case|)
      ()
      (#%begin
        (#%lambda #t
          (|%%_LBnWQMUOS_acc| |%%_LBJSOdVOS_argls|)
          (|%%_LB_8ZYSOS_proc|)
          (#%if (null? |%%_LBJSOdVOS_argls|)
            |%%_LBnWQMUOS_acc|
            (helper
              (|%%_LB_8ZYSOS_proc|
                (car |%%_LBJSOdVOS_argls|)
                |%%_LBnWQMUOS_acc|)
              (cdr |%%_LBJSOdVOS_argls|))))
        (#%lambda #t
          |%%_LB1-SjUOS_args|
          (|%%_LBl5XpTOS_base-case|)
          (#%if (null? |%%_LB1-SjUOS_args|)
            |%%_LBl5XpTOS_base-case|
            (helper
              (car |%%_LB1-SjUOS_args|)
              (cdr |%%_LB1-SjUOS_args|))))))))
(#%program
  ((length . 1)
   (make-string . 1)
   (|%%_LBpLK7WOS_l| . 2)
   (+ . 1)
   (cdr . 1)
   (|%%_LB3PMGVOS_l2s| . 2)
   (car . 1)
   (|%%_LBrAEuXOS_n| . 2)
   (string-set! . 1)
   (|%%_LB5EG1XOS_s| . 3)
   (|%%_LBLHIAWOS_l| . 3)
   (null? . 1))
  ((|%%_LB3PMGVOS_l2s| . 1))
  (make-string length car string-set! + cdr null?)
  (#%define list->string
    (#%letrec #t
      ((|%%_LB3PMGVOS_l2s|
         (#%lambda #t
           (|%%_LBLHIAWOS_l|
             |%%_LB5EG1XOS_s|
             |%%_LBrAEuXOS_n|)
           (|%%_LB3PMGVOS_l2s|)
           (#%if (null? |%%_LBLHIAWOS_l|)
             |%%_LB5EG1XOS_s|
             (#%begin
               (string-set!
                 |%%_LB5EG1XOS_s|
                 |%%_LBrAEuXOS_n|
                 (car |%%_LBLHIAWOS_l|))
               (|%%_LB3PMGVOS_l2s|
                 (cdr |%%_LBLHIAWOS_l|)
                 |%%_LB5EG1XOS_s|
                 (+ |%%_LBrAEuXOS_n| 1)))))))
      ()
      (#%lambda #t
        (|%%_LBpLK7WOS_l|)
        (|%%_LB3PMGVOS_l2s|)
        (|%%_LB3PMGVOS_l2s|
          |%%_LBpLK7WOS_l|
          (make-string (length |%%_LBpLK7WOS_l|))
          0)))))
(#%program
  ((string-length . 1)
   (|%%_LB7tAoYOS_s| . 2)
   (- . 2)
   (string-ref . 1)
   (cons . 1)
   (|%%_LBtpyRYOS_s| . 2)
   (|%%_LBNwCXXOS_s2l| . 2)
   (|%%_LBPlwiZOS_h| . 2)
   (|%%_LB9iuLZOS_n| . 3)
   (< . 1))
  ((|%%_LBNwCXXOS_s2l| . 1))
  (string-length string-ref cons - <)
  (#%define string->list
    (#%letrec #t
      ((|%%_LBNwCXXOS_s2l|
         (#%lambda #t
           (|%%_LBtpyRYOS_s|
             |%%_LBPlwiZOS_h|
             |%%_LB9iuLZOS_n|)
           (|%%_LBNwCXXOS_s2l|)
           (#%if (< |%%_LB9iuLZOS_n| 0)
             |%%_LBPlwiZOS_h|
             (|%%_LBNwCXXOS_s2l|
               |%%_LBtpyRYOS_s|
               (cons (string-ref |%%_LBtpyRYOS_s| |%%_LB9iuLZOS_n|)
                     |%%_LBPlwiZOS_h|)
               (- |%%_LB9iuLZOS_n| 1))))))
      ()
      (#%lambda #t
        (|%%_LB7tAoYOS_s|)
        (|%%_LBNwCXXOS_s2l|)
        (|%%_LBNwCXXOS_s2l|
          |%%_LB7tAoYOS_s|
          ()
          (- (string-length |%%_LB7tAoYOS_s|) 1))))))
(#%program
  ((|%%_LBvesc-OS_elems| . 1) (list->vector . 1))
  ()
  (list->vector)
  (#%define vector
    (#%lambda #t
      |%%_LBvesc-OS_elems|
      ()
      (list->vector |%%_LBvesc-OS_elems|))))
(#%program
  ((|%%_LBRaqF-OS_elems| . 1) (list->string . 1))
  ()
  (list->string)
  (#%define string
    (#%lambda #t
      |%%_LBRaqF-OS_elems|
      ()
      (list->string |%%_LBRaqF-OS_elems|))))
(#%program
  ((_make-parameter . 1))
  ()
  (_make-parameter)
  (#%define current-url (_make-parameter "file:.")))
(#%program
  ((car . 1)
   (string-length . 1)
   (string-append . 1)
   (|%%_LBT_j00PS_l| . 1)
   (- . 1)
   (|%%_LBx3mz_OS_v| . 4)
   (string-ref . 1)
   (eqv? . 1)
   (current-url . 3)
   (normalize-url . 2)
   (|%%_LBb7o6_OS_rest| . 2)
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
      |%%_LBb7o6_OS_rest|
      ()
      (#%if (null? |%%_LBb7o6_OS_rest|)
        (normalize-url (current-url) ".")
        (current-url
          (normalize-url
            (current-url)
            ((#%lambda #t
               (|%%_LBx3mz_OS_v|)
               ()
               ((#%lambda #t
                  (|%%_LBT_j00PS_l|)
                  (|%%_LBx3mz_OS_v|)
                  (#%if (eqv? (string-ref
                                |%%_LBx3mz_OS_v|
                                (- |%%_LBT_j00PS_l| 1))
                              #\/)
                    |%%_LBx3mz_OS_v|
                    (string-append |%%_LBx3mz_OS_v| "/")))
                (string-length |%%_LBx3mz_OS_v|)))
             (car |%%_LBb7o6_OS_rest|))))))))
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
   (|%%_LBBJ9h2PS_extension| . 1)
   (string-downcase . 1)
   (string->symbol . 1)
   (|%%_LBfNbQ1PS__load| . 1)
   (cdr . 1)
   (|%%_LBXF7K2PS_t| . 2)
   (file-handler . 1)
   (|%%_LBVQdn1PS_thunk| . 1)
   (cons . 2)
   (|%%_LBdYht0PS_*file-handlers*| . 4)
   (|%%_LBzUfW0PS_extension| . 2)
   (assq . 2)
   (not . 1)
   (add-file-handler . 1))
  ((file-handler . 1)
   (|%%_LBdYht0PS_*file-handlers*| . 1)
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
     (|%%_LBdYht0PS_*file-handlers*|)
     ()
     (#%begin
       (#%set! add-file-handler
         (#%lambda #t
           (|%%_LBzUfW0PS_extension| |%%_LBVQdn1PS_thunk|)
           (|%%_LBdYht0PS_*file-handlers*|)
           (#%if (not (assq |%%_LBzUfW0PS_extension|
                            |%%_LBdYht0PS_*file-handlers*|))
             (#%set! |%%_LBdYht0PS_*file-handlers*|
               (cons (cons |%%_LBzUfW0PS_extension|
                           |%%_LBVQdn1PS_thunk|)
                     |%%_LBdYht0PS_*file-handlers*|))
             #!void)))
       (#%set! file-handler
         ((#%lambda #t
            (|%%_LBfNbQ1PS__load|)
            (|%%_LBdYht0PS_*file-handlers*|)
            (#%lambda #t
              (|%%_LBBJ9h2PS_extension|)
              (|%%_LBfNbQ1PS__load|
                |%%_LBdYht0PS_*file-handlers*|)
              ((#%lambda #t
                 (|%%_LBXF7K2PS_t|)
                 (|%%_LBfNbQ1PS__load|)
                 (#%if |%%_LBXF7K2PS_t|
                   (cdr |%%_LBXF7K2PS_t|)
                   |%%_LBfNbQ1PS__load|))
               (assq (string->symbol
                       (string-downcase |%%_LBBJ9h2PS_extension|))
                     |%%_LBdYht0PS_*file-handlers*|))))
          load))))
   ()))
(#%program
  ((|%%_LBDy3E3PS_rest| . 1)
   (|%%_LBZu154PS_file| . 1)
   (current-url . 1)
   (normalize-url . 1)
   (|%%_LBhC5b3PS_proc| . 1)
   (apply . 1))
  ()
  (apply current-url normalize-url)
  (#%define make-io-proc
    (#%lambda #t
      (|%%_LBhC5b3PS_proc|)
      ()
      (#%lambda #t
        (|%%_LBZu154PS_file| . |%%_LBDy3E3PS_rest|)
        (|%%_LBhC5b3PS_proc|)
        (apply |%%_LBhC5b3PS_proc|
               (normalize-url (current-url) |%%_LBZu154PS_file|)
               |%%_LBDy3E3PS_rest|)))))
(#%program
  ((|%%_LBJ1NI7PS_url| . 1)
   (string->list . 1)
   (reverse! . 1)
   (cons . 1)
   (cdr . 1)
   (|%%_LB3-K98PS_loop| . 2)
   (|%%_LBLSG39PS_acc| . 2)
   (list->string . 1)
   (car . 2)
   (equal? . 1)
   (|%%_LBpWIC8PS_x| . 4)
   (null? . 1)
   (void . 1)
   (|%%_LBjr_x4PS_file-extension| . 1)
   (|%%_LBn5Pf7PS_fe| . 2)
   (file-handler . 1)
   (|%%_LBHcTl6PS_e| . 1)
   (|%%_LBlgVU5PS_m| . 1)
   (|%%_LB19RO6PS_fk| . 1)
   (call-with-failure-continuation . 1)
   (with-failure-continuation . 1)
   (|%%_LBFnZ-4PS_file| . 1)
   (|%%_LB_jXr5PS_previous-url| . 3)
   (normalize-url . 1)
   (current-url . 6)
   (load . 1)
   (open-output-file . 2)
   (open-source-input-file . 2)
   (make-io-proc . 3)
   (open-input-file . 2))
  ((|%%_LB3-K98PS_loop| . 1)
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
     (|%%_LBjr_x4PS_file-extension|)
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
           (|%%_LBFnZ-4PS_file|)
           (|%%_LBjr_x4PS_file-extension|)
           (#%begin
             ((#%lambda #t
                (|%%_LB_jXr5PS_previous-url|)
                (|%%_LBFnZ-4PS_file|
                  |%%_LBjr_x4PS_file-extension|)
                (#%begin
                  (current-url
                    (normalize-url
                      |%%_LB_jXr5PS_previous-url|
                      |%%_LBFnZ-4PS_file|))
                  (with-failure-continuation
                    (#%lambda #t
                      (|%%_LBlgVU5PS_m| |%%_LBHcTl6PS_e|)
                      (|%%_LB_jXr5PS_previous-url|)
                      (#%begin
                        (current-url |%%_LB_jXr5PS_previous-url|)
                        (call-with-failure-continuation
                          (#%lambda #t
                            (|%%_LB19RO6PS_fk|)
                            (|%%_LBHcTl6PS_e| |%%_LBlgVU5PS_m|)
                            (|%%_LB19RO6PS_fk|
                              |%%_LBlgVU5PS_m|
                              |%%_LBHcTl6PS_e|)))))
                    (#%lambda #t
                      ()
                      (|%%_LBjr_x4PS_file-extension|)
                      ((#%lambda #t
                         (|%%_LBn5Pf7PS_fe|)
                         ()
                         ((file-handler
                            (#%if |%%_LBn5Pf7PS_fe| |%%_LBn5Pf7PS_fe| "scm"))
                          (current-url)))
                       (|%%_LBjr_x4PS_file-extension| (current-url)))))
                  (current-url |%%_LB_jXr5PS_previous-url|)))
              (current-url))
             (void))))))
   (#%lambda #t
     (|%%_LBJ1NI7PS_url|)
     ()
     ((#%letrec #t
        ((|%%_LB3-K98PS_loop|
           (#%lambda #t
             (|%%_LBpWIC8PS_x| |%%_LBLSG39PS_acc|)
             (|%%_LB3-K98PS_loop|)
             (#%if (null? |%%_LBpWIC8PS_x|)
               #f
               (#%if (equal? (car |%%_LBpWIC8PS_x|) #\.)
                 (list->string |%%_LBLSG39PS_acc|)
                 (|%%_LB3-K98PS_loop|
                   (cdr |%%_LBpWIC8PS_x|)
                   (cons (car |%%_LBpWIC8PS_x|) |%%_LBLSG39PS_acc|)))))))
        ()
        |%%_LB3-K98PS_loop|)
      (reverse! (string->list |%%_LBJ1NI7PS_url|))
      ()))))
(#%program
  ((|%%_LB5PEw9PS_str| . 1)
   (load-native-library . 1)
   (native-library-binding-names . 1)
   (|%%_LBNHAqaPS_binding-names| . 1)
   (|%%_LBrLCZ9PS_nl| . 2)
   (native-library-binding . 1)
   (|%%_LB7EyTaPS_name| . 2)
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
      (|%%_LB5PEw9PS_str|)
      ()
      ((#%lambda #t
         (|%%_LBrLCZ9PS_nl|)
         ()
         ((#%lambda #t
            (|%%_LBNHAqaPS_binding-names|)
            (|%%_LBrLCZ9PS_nl|)
            (for-each
              (#%lambda #t
                (|%%_LB7EyTaPS_name|)
                (|%%_LBrLCZ9PS_nl|)
                (putprop
                  |%%_LB7EyTaPS_name|
                  (native-library-binding
                    |%%_LBrLCZ9PS_nl|
                    |%%_LB7EyTaPS_name|)))
              |%%_LBNHAqaPS_binding-names|))
          (native-library-binding-names |%%_LBrLCZ9PS_nl|)))
       (load-native-library |%%_LB5PEw9PS_str|)))))
(#%program
  ((append2 . 1) (_make-left-pairwise-nary . 1))
  ()
  (append2 _make-left-pairwise-nary)
  (#%define append
    (_make-left-pairwise-nary append2 ())))
(#%program
  ((|%%_LBtAwkbPS_x| . 2)
   (null? . 2)
   (|%%_LBvpqHcPS_lag| . 1)
   (cdr . 3)
   (|%%_LBPwuNbPS_lp| . 2)
   (|%%_LBxek2ePS_lag| . 2)
   (|%%_LBbimBdPS_x| . 2)
   (eq? . 1)
   (not . 1)
   (|%%_LBRlo8dPS_x| . 3)
   (|%%_LB9tsecPS_x| . 3)
   (pair? . 2))
  ((|%%_LBPwuNbPS_lp| . 1))
  (pair? cdr eq? not null?)
  (#%define proper-list?
    (#%lambda #t
      (|%%_LBtAwkbPS_x|)
      ()
      ((#%letrec #t
         ((|%%_LBPwuNbPS_lp|
            (#%lambda #t
              (|%%_LB9tsecPS_x| |%%_LBvpqHcPS_lag|)
              (|%%_LBPwuNbPS_lp|)
              (#%if (pair? |%%_LB9tsecPS_x|)
                ((#%lambda #t
                   (|%%_LBRlo8dPS_x|)
                   (|%%_LBvpqHcPS_lag| |%%_LBPwuNbPS_lp|)
                   (#%if (pair? |%%_LBRlo8dPS_x|)
                     ((#%lambda #t
                        (|%%_LBbimBdPS_x| |%%_LBxek2ePS_lag|)
                        (|%%_LBPwuNbPS_lp|)
                        (#%if (not (eq? |%%_LBbimBdPS_x| |%%_LBxek2ePS_lag|))
                          (|%%_LBPwuNbPS_lp|
                            |%%_LBbimBdPS_x|
                            |%%_LBxek2ePS_lag|)
                          #f))
                      (cdr |%%_LBRlo8dPS_x|)
                      (cdr |%%_LBvpqHcPS_lag|))
                     (null? |%%_LBRlo8dPS_x|)))
                 (cdr |%%_LB9tsecPS_x|))
                (null? |%%_LB9tsecPS_x|)))))
         ()
         |%%_LBPwuNbPS_lp|)
       |%%_LBtAwkbPS_x|
       |%%_LBtAwkbPS_x|))))
(#%program
  ((proper-list? . 1))
  ()
  (proper-list?)
  (#%define list? proper-list?))
(#%program
  ((|%%_LBTaivePS_general-expt| . 1)
   (|%%_LBz3epfPS_integer-expt| . 1)
   (denominator . 1)
   (numerator . 1)
   (|%%_LBd7gYePS_rational-expt| . 1)
   (integer? . 2)
   (not . 1)
   (rational? . 1)
   (|%%_LBV_bSfPS_base| . 9)
   (|%%_LBfY9jgPS_exponent| . 8)
   (|%%_LB1kPhlPS_squaring| . 3)
   (odd? . 1)
   (quotient . 1)
   (|%%_LB_uVWjPS_loop| . 2)
   (|%%_LBHnRQkPS_result| . 3)
   (|%%_LBlrTnkPS_rest| . 3)
   (zero? . 3)
   (abs . 2)
   (ashl . 2)
   (|%%_LBFyXtjPS_exponent| . 7)
   (negative? . 3)
   (= . 1)
   (|%%_LBjCZ0jPS_base| . 4)
   (exact? . 5)
   (|%%_LBDJ17iPS_base-denominator| . 1)
   (|%%_LBZF_ziPS_exponent| . 2)
   (|%%_LBhN3GhPS_base-numerator| . 1)
   (expt . 2)
   (/ . 3)
   (|%%_LBBU7MgPS_base| . 1)
   (log . 1)
   (|%%_LBXQ5dhPS_exponent| . 1)
   (* . 3)
   (exp . 1))
  ((|%%_LB_uVWjPS_loop| . 1)
   (|%%_LBz3epfPS_integer-expt| . 1)
   (|%%_LBd7gYePS_rational-expt| . 1)
   (|%%_LBTaivePS_general-expt| . 1))
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
      ((|%%_LBTaivePS_general-expt|
         (#%lambda #t
           (|%%_LBBU7MgPS_base| |%%_LBXQ5dhPS_exponent|)
           ()
           (exp (* |%%_LBXQ5dhPS_exponent|
                   (log |%%_LBBU7MgPS_base|)))))
       (|%%_LBd7gYePS_rational-expt|
         (#%lambda #t
           (|%%_LBhN3GhPS_base-numerator|
             |%%_LBDJ17iPS_base-denominator|
             |%%_LBZF_ziPS_exponent|)
           ()
           (/ (expt |%%_LBhN3GhPS_base-numerator|
                    |%%_LBZF_ziPS_exponent|)
              (expt |%%_LBDJ17iPS_base-denominator|
                    |%%_LBZF_ziPS_exponent|))))
       (|%%_LBz3epfPS_integer-expt|
         (#%lambda #t
           (|%%_LBjCZ0jPS_base| |%%_LBFyXtjPS_exponent|)
           ()
           (#%if (#%if (exact? |%%_LBjCZ0jPS_base|)
                   (= |%%_LBjCZ0jPS_base| 2)
                   #f)
             (#%if (negative? |%%_LBFyXtjPS_exponent|)
               (/ (ashl 1 (abs |%%_LBFyXtjPS_exponent|)))
               (ashl 1 |%%_LBFyXtjPS_exponent|))
             ((#%letrec #t
                ((|%%_LB_uVWjPS_loop|
                   (#%lambda #t
                     (|%%_LBlrTnkPS_rest|
                       |%%_LBHnRQkPS_result|
                       |%%_LB1kPhlPS_squaring|)
                     (|%%_LB_uVWjPS_loop|)
                     (#%if (zero? |%%_LBlrTnkPS_rest|)
                       |%%_LBHnRQkPS_result|
                       (|%%_LB_uVWjPS_loop|
                         (quotient |%%_LBlrTnkPS_rest| 2)
                         (#%if (odd? |%%_LBlrTnkPS_rest|)
                           (* |%%_LBHnRQkPS_result| |%%_LB1kPhlPS_squaring|)
                           |%%_LBHnRQkPS_result|)
                         (* |%%_LB1kPhlPS_squaring|
                            |%%_LB1kPhlPS_squaring|))))))
                ()
                |%%_LB_uVWjPS_loop|)
              (#%if (negative? |%%_LBFyXtjPS_exponent|)
                (abs |%%_LBFyXtjPS_exponent|)
                |%%_LBFyXtjPS_exponent|)
              1
              (#%if (negative? |%%_LBFyXtjPS_exponent|)
                (/ |%%_LBjCZ0jPS_base|)
                |%%_LBjCZ0jPS_base|))))))
      ()
      (#%lambda #t
        (|%%_LBV_bSfPS_base| |%%_LBfY9jgPS_exponent|)
        (|%%_LBz3epfPS_integer-expt|
          |%%_LBd7gYePS_rational-expt|
          |%%_LBTaivePS_general-expt|)
        (#%if (zero? |%%_LBfY9jgPS_exponent|)
          (#%if (exact? |%%_LBfY9jgPS_exponent|) 1 1.0)
          (#%if (zero? |%%_LBV_bSfPS_base|)
            (#%if (exact? |%%_LBfY9jgPS_exponent|)
              |%%_LBV_bSfPS_base|
              0.0)
            (#%if (#%if (exact? |%%_LBV_bSfPS_base|)
                    (#%if (rational? |%%_LBV_bSfPS_base|)
                      (not (integer? |%%_LBV_bSfPS_base|))
                      #f)
                    #f)
              (|%%_LBd7gYePS_rational-expt|
                (numerator |%%_LBV_bSfPS_base|)
                (denominator |%%_LBV_bSfPS_base|)
                |%%_LBfY9jgPS_exponent|)
              (#%if (#%if (exact? |%%_LBfY9jgPS_exponent|)
                      (integer? |%%_LBfY9jgPS_exponent|)
                      #f)
                (|%%_LBz3epfPS_integer-expt|
                  |%%_LBV_bSfPS_base|
                  |%%_LBfY9jgPS_exponent|)
                (|%%_LBTaivePS_general-expt|
                  |%%_LBV_bSfPS_base|
                  |%%_LBfY9jgPS_exponent|)))))))))
(#%program
  ((- . 1)
   (|%%_LBp5H5nPS_tmp| . 2)
   (/ . 2)
   (modpow . 2)
   (|%%_LBL1FynPS_tmp| . 2)
   (* . 3)
   (even? . 1)
   (|%%_LB39JEmPS_n| . 6)
   (|%%_LBngNKlPS_x| . 4)
   (modulo . 4)
   (|%%_LBJcLbmPS_y| . 4)
   (= . 1))
  ()
  (even? modpow / * - modulo =)
  (#%define modpow
    (#%lambda #t
      (|%%_LBngNKlPS_x|
        |%%_LBJcLbmPS_y|
        |%%_LB39JEmPS_n|)
      ()
      (#%if (= |%%_LBJcLbmPS_y| 1)
        (modulo |%%_LBngNKlPS_x| |%%_LB39JEmPS_n|)
        (#%if (even? |%%_LBJcLbmPS_y|)
          ((#%lambda #t
             (|%%_LBL1FynPS_tmp|)
             (|%%_LB39JEmPS_n|)
             (modulo
               (* |%%_LBL1FynPS_tmp| |%%_LBL1FynPS_tmp|)
               |%%_LB39JEmPS_n|))
           (modpow
             |%%_LBngNKlPS_x|
             (/ |%%_LBJcLbmPS_y| 2)
             |%%_LB39JEmPS_n|))
          ((#%lambda #t
             (|%%_LBp5H5nPS_tmp|)
             (|%%_LB39JEmPS_n| |%%_LBngNKlPS_x|)
             (modulo
               (* |%%_LBngNKlPS_x|
                  (modulo
                    (* |%%_LBp5H5nPS_tmp| |%%_LBp5H5nPS_tmp|)
                    |%%_LB39JEmPS_n|))
               |%%_LB39JEmPS_n|))
           (modpow
             |%%_LBngNKlPS_x|
             (/ (- |%%_LBJcLbmPS_y| 1) 2)
             |%%_LB39JEmPS_n|)))))))
(#%program
  ((round . 1)
   (= . 1)
   (real? . 1)
   (|%%_LB5-C_nPS_n| . 4)
   (_integer? . 1))
  ()
  (real? round = _integer?)
  (#%define integer?
    (#%lambda #t
      (|%%_LB5-C_nPS_n|)
      ()
      (#%if (_integer? |%%_LB5-C_nPS_n|)
        #t
        (#%if (real? |%%_LB5-C_nPS_n|)
          (= (round |%%_LB5-C_nPS_n|) |%%_LB5-C_nPS_n|)
          #f)))))
(#%program
  ((complex? . 1)
   (|%%_LBrWAsoPS_oldcomp?| . 1)
   (not . 1)
   (|%%_LBNSyVoPS_n| . 2)
   (number? . 1))
  ()
  (complex? number? not)
  (#%define real?
    ((#%lambda #t
       (|%%_LBrWAsoPS_oldcomp?|)
       ()
       (#%lambda #t
         (|%%_LBNSyVoPS_n|)
         (|%%_LBrWAsoPS_oldcomp?|)
         (#%if (number? |%%_LBNSyVoPS_n|)
           (not (|%%_LBrWAsoPS_oldcomp?| |%%_LBNSyVoPS_n|))
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
   (|%%_LBPHsgqPS_b| . 2)
   (|%%_LBtLuPpPS_a| . 2)
   (* . 2)
   (+ . 1)
   (sqrt . 1)
   (|%%_LB7PwmpPS_num| . 6)
   (real? . 1)
   (not . 1))
  ()
  (< - + * sqrt real-part imag-part not real?)
  (#%define abs
    (#%lambda #t
      (|%%_LB7PwmpPS_num|)
      ()
      (#%if (not (real? |%%_LB7PwmpPS_num|))
        ((#%lambda #t
           (|%%_LBtLuPpPS_a| |%%_LBPHsgqPS_b|)
           ()
           (sqrt (+ (* |%%_LBtLuPpPS_a| |%%_LBtLuPpPS_a|)
                    (* |%%_LBPHsgqPS_b| |%%_LBPHsgqPS_b|))))
         (real-part |%%_LB7PwmpPS_num|)
         (imag-part |%%_LB7PwmpPS_num|))
        (#%if (< |%%_LB7PwmpPS_num| 0)
          (- |%%_LB7PwmpPS_num|)
          |%%_LB7PwmpPS_num|)))))
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
   (|%%_LBxpixsPS_x1| . 3)
   (|%%_LBbtk4sPS_args| . 2)
   (max . 1)
   (< . 1)
   (|%%_LBRwmDrPS_x1| . 3)
   (|%%_LBvAoarPS_args| . 2)
   (min . 1)
   (inexact? . 3)
   (cdr . 2)
   (|%%_LB9EqJqPS__min_max| . 4)
   (car . 3)
   (|%%_LBTlg-sPS_proc| . 3)
   (exact->inexact . 1)
   (|%%_LBdiertPS_mv| . 5)
   (exact? . 1)
   (|%%_LBVaaluPS_inexact| . 3)
   (|%%_LBzecUtPS_args| . 6)
   (null? . 3))
  ((max . 1)
   (min . 1)
   (|%%_LB9EqJqPS__min_max| . 1))
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
    ((|%%_LB9EqJqPS__min_max|
       (#%lambda #t
         (|%%_LBTlg-sPS_proc|
           |%%_LBdiertPS_mv|
           |%%_LBzecUtPS_args|
           |%%_LBVaaluPS_inexact|)
         (|%%_LB9EqJqPS__min_max|)
         (#%if (null? |%%_LBzecUtPS_args|)
           (#%if (#%if |%%_LBVaaluPS_inexact|
                   (exact? |%%_LBdiertPS_mv|)
                   #f)
             (exact->inexact |%%_LBdiertPS_mv|)
             |%%_LBdiertPS_mv|)
           (#%if (|%%_LBTlg-sPS_proc|
                   (car |%%_LBzecUtPS_args|)
                   |%%_LBdiertPS_mv|)
             (|%%_LB9EqJqPS__min_max|
               |%%_LBTlg-sPS_proc|
               (car |%%_LBzecUtPS_args|)
               (cdr |%%_LBzecUtPS_args|)
               (#%if |%%_LBVaaluPS_inexact|
                 #t
                 (inexact? (car |%%_LBzecUtPS_args|))))
             (|%%_LB9EqJqPS__min_max|
               |%%_LBTlg-sPS_proc|
               |%%_LBdiertPS_mv|
               (cdr |%%_LBzecUtPS_args|)
               |%%_LBVaaluPS_inexact|))))))
    ()
    (#%begin
      (#%set! min
        (#%lambda #t
          (|%%_LBRwmDrPS_x1| . |%%_LBvAoarPS_args|)
          (|%%_LB9EqJqPS__min_max|)
          (#%if (null? |%%_LBvAoarPS_args|)
            |%%_LBRwmDrPS_x1|
            (|%%_LB9EqJqPS__min_max|
              <
              |%%_LBRwmDrPS_x1|
              |%%_LBvAoarPS_args|
              (inexact? |%%_LBRwmDrPS_x1|)))))
      (#%set! max
        (#%lambda #t
          (|%%_LBxpixsPS_x1| . |%%_LBbtk4sPS_args|)
          (|%%_LB9EqJqPS__min_max|)
          (#%if (null? |%%_LBbtk4sPS_args|)
            |%%_LBxpixsPS_x1|
            (|%%_LB9EqJqPS__min_max|
              >
              |%%_LBxpixsPS_x1|
              |%%_LBbtk4sPS_args|
              (inexact? |%%_LBxpixsPS_x1|))))))))
(#%program
  ((|%%_LBf78OuPS_n| . 1) (< . 1))
  ()
  (<)
  (#%define negative?
    (#%lambda #t
      (|%%_LBf78OuPS_n|)
      ()
      (< |%%_LBf78OuPS_n| 0))))
(#%program
  ((|%%_LBB36fvPS_n| . 1) (> . 1))
  ()
  (>)
  (#%define positive?
    (#%lambda #t
      (|%%_LBB36fvPS_n|)
      ()
      (> |%%_LBB36fvPS_n| 0))))
(#%program
  ((|%%_LBX_3IvPS_n| . 1) (modulo . 1) (= . 1))
  ()
  (modulo =)
  (#%define even?
    (#%lambda #t
      (|%%_LBX_3IvPS_n|)
      ()
      (= 0 (modulo |%%_LBX_3IvPS_n| 2)))))
(#%program
  ((|%%_LBhY19wPS_n| . 1) (even? . 1) (not . 1))
  ()
  (even? not)
  (#%define odd?
    (#%lambda #t
      (|%%_LBhY19wPS_n|)
      ()
      (not (even? |%%_LBhY19wPS_n|)))))
(#%program
  ((|%%_LBDU_BwPS_n| . 1) (= . 1))
  ()
  (=)
  (#%define zero?
    (#%lambda #t
      (|%%_LBDU_BwPS_n|)
      ()
      (= |%%_LBDU_BwPS_n| 0))))
(#%program
  ((|%%_LBZQZ2xPS_n| . 1) (+ . 1))
  ()
  (+)
  (#%define add1
    (#%lambda #t
      (|%%_LBZQZ2xPS_n|)
      ()
      (+ |%%_LBZQZ2xPS_n| 1))))
(#%program
  ((|%%_LBjNXvxPS_n| . 1) (- . 1))
  ()
  (-)
  (#%define sub1
    (#%lambda #t
      (|%%_LBjNXvxPS_n|)
      ()
      (- |%%_LBjNXvxPS_n| 1))))
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
  ((|%%_LB7-uRDPS_y| . 1)
   (|%%_LBN1xoDPS_x| . 1)
   (|%%_LBLcD1CPS_args| . 1)
   (|%%_LB59BuCPS_loop| . 2)
   (cadr . 1)
   (car . 1)
   (|%%_LBJnJGAPS_comparator| . 1)
   (|%%_LB3kH7BPS_chainer| . 1)
   (cdr . 2)
   (|%%_LBpgFABPS_endstate| . 2)
   (|%%_LBr5zXCPS_x| . 5)
   (null? . 2)
   (|%%_LBnrLdAPS_b| . 2)
   (|%%_LB1vNMzPS_a| . 2)
   (> . 1)
   (>= . 1)
   (|%%_LB_FTpyPS__and2| . 2)
   (= . 2)
   (|%%_LBHyPjzPS_b| . 2)
   (|%%_LBlCRSyPS_a| . 2)
   (< . 1)
   (|%%_LBFJVYxPS__comp_help| . 2)
   (<= . 1))
  ((|%%_LB59BuCPS_loop| . 1) (>= . 1) (<= . 1))
  (null? cadr car cdr <= = < >= >)
  ((#%lambda #t
     (|%%_LBFJVYxPS__comp_help| |%%_LB_FTpyPS__and2|)
     ()
     (#%begin
       (#%set! <=
         (|%%_LBFJVYxPS__comp_help|
           (#%lambda #t
             (|%%_LBlCRSyPS_a| |%%_LBHyPjzPS_b|)
             ()
             (#%if (< |%%_LBlCRSyPS_a| |%%_LBHyPjzPS_b|)
               #t
               (= |%%_LBlCRSyPS_a| |%%_LBHyPjzPS_b|)))
           |%%_LB_FTpyPS__and2|
           #t))
       (#%set! >=
         (|%%_LBFJVYxPS__comp_help|
           (#%lambda #t
             (|%%_LB1vNMzPS_a| |%%_LBnrLdAPS_b|)
             ()
             (#%if (> |%%_LB1vNMzPS_a| |%%_LBnrLdAPS_b|)
               #t
               (= |%%_LB1vNMzPS_a| |%%_LBnrLdAPS_b|)))
           |%%_LB_FTpyPS__and2|
           #t))))
   (#%lambda #t
     (|%%_LBJnJGAPS_comparator|
       |%%_LB3kH7BPS_chainer|
       |%%_LBpgFABPS_endstate|)
     ()
     (#%lambda #t
       |%%_LBLcD1CPS_args|
       (|%%_LBpgFABPS_endstate|
         |%%_LB3kH7BPS_chainer|
         |%%_LBJnJGAPS_comparator|)
       ((#%letrec #t
          ((|%%_LB59BuCPS_loop|
             (#%lambda #t
               (|%%_LBr5zXCPS_x|)
               (|%%_LB59BuCPS_loop|
                 |%%_LBpgFABPS_endstate|
                 |%%_LB3kH7BPS_chainer|
                 |%%_LBJnJGAPS_comparator|)
               (#%if (null? |%%_LBr5zXCPS_x|)
                 |%%_LBpgFABPS_endstate|
                 (#%if (null? (cdr |%%_LBr5zXCPS_x|))
                   |%%_LBpgFABPS_endstate|
                   (|%%_LB3kH7BPS_chainer|
                     (|%%_LBJnJGAPS_comparator|
                       (car |%%_LBr5zXCPS_x|)
                       (cadr |%%_LBr5zXCPS_x|))
                     (|%%_LB59BuCPS_loop| (cdr |%%_LBr5zXCPS_x|))))))))
          (|%%_LBpgFABPS_endstate|
            |%%_LB3kH7BPS_chainer|
            |%%_LBJnJGAPS_comparator|)
          |%%_LB59BuCPS_loop|)
        |%%_LBLcD1CPS_args|)))
   (#%lambda #t
     (|%%_LBN1xoDPS_x| |%%_LB7-uRDPS_y|)
     ()
     (#%if |%%_LBN1xoDPS_x| |%%_LB7-uRDPS_y| #f))))
(#%program
  ((|%%_LB9PocFPS_chainer| . 1)
   (apply . 1)
   (|%%_LBPSqLEPS_comparator| . 1)
   (cadr . 2)
   (car . 2)
   (= . 1)
   (cdr . 2)
   (|%%_LBvLmFFPS_args| . 7)
   (null? . 2)
   (< . 1)
   (<= . 2)
   (> . 1)
   (|%%_LBtWsiEPS__?=| . 2)
   (>= . 2))
  ((<= . 1) (>= . 1))
  (< <= <= > >= >= null? = car cadr apply cdr)
  ((#%lambda #t
     (|%%_LBtWsiEPS__?=|)
     ()
     (#%begin
       (#%set! >= (|%%_LBtWsiEPS__?=| > >=))
       (#%set! <= (|%%_LBtWsiEPS__?=| < <=))))
   (#%lambda #t
     (|%%_LBPSqLEPS_comparator|
       |%%_LB9PocFPS_chainer|)
     ()
     (#%lambda #t
       |%%_LBvLmFFPS_args|
       (|%%_LB9PocFPS_chainer|
         |%%_LBPSqLEPS_comparator|)
       (#%if (null? |%%_LBvLmFFPS_args|)
         #t
         (#%if (null? (cdr |%%_LBvLmFFPS_args|))
           #t
           (#%if (#%if (= (car |%%_LBvLmFFPS_args|)
                          (cadr |%%_LBvLmFFPS_args|))
                   #t
                   (|%%_LBPSqLEPS_comparator|
                     (car |%%_LBvLmFFPS_args|)
                     (cadr |%%_LBvLmFFPS_args|)))
             (apply |%%_LB9PocFPS_chainer|
                    (cdr |%%_LBvLmFFPS_args|))
             #f)))))))
(#%program
  ((cadr . 1)
   (_gcd . 1)
   (car . 2)
   (cdr . 1)
   (|%%_LBbEizGPS_args| . 5)
   (null? . 2))
  ()
  (cdr car cadr _gcd null?)
  (#%define gcd
    (#%lambda #t
      |%%_LBbEizGPS_args|
      ()
      (#%if (null? |%%_LBbEizGPS_args|)
        0
        (#%if (null? (cdr |%%_LBbEizGPS_args|))
          (car |%%_LBbEizGPS_args|)
          (_gcd (car |%%_LBbEizGPS_args|)
                (cadr |%%_LBbEizGPS_args|)))))))
(#%program
  ((cadr . 1)
   (_lcm . 1)
   (car . 2)
   (cdr . 1)
   (|%%_LBxAg0HPS_args| . 5)
   (null? . 2))
  ()
  (cdr car cadr _lcm null?)
  (#%define lcm
    (#%lambda #t
      |%%_LBxAg0HPS_args|
      ()
      (#%if (null? |%%_LBxAg0HPS_args|)
        1
        (#%if (null? (cdr |%%_LBxAg0HPS_args|))
          (car |%%_LBxAg0HPS_args|)
          (_lcm (car |%%_LBxAg0HPS_args|)
                (cadr |%%_LBxAg0HPS_args|)))))))
(#%program
  ((|%%_LBTwetHPS_x| . 1)
   (remainder . 1)
   (+ . 1)
   (|%%_LBzpanIPS_r| . 3)
   (positive? . 1)
   (|%%_LBdtcWHPS_y| . 3)
   (negative? . 2))
  ()
  (remainder positive? negative? +)
  (#%define modulo
    (#%lambda #t
      (|%%_LBTwetHPS_x| |%%_LBdtcWHPS_y|)
      ()
      ((#%lambda #t
         (|%%_LBzpanIPS_r|)
         (|%%_LBdtcWHPS_y|)
         (#%if ((#%if (negative? |%%_LBdtcWHPS_y|)
                  positive?
                  negative?)
                |%%_LBzpanIPS_r|)
           (+ |%%_LBzpanIPS_r| |%%_LBdtcWHPS_y|)
           |%%_LBzpanIPS_r|))
       (remainder |%%_LBTwetHPS_x| |%%_LBdtcWHPS_y|)))))
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
   (|%%_LBXa2bKPS_c| . 2)
   (|%%_LBBe4KJPS_lc-offset| . 1)
   (+ . 1)
   (integer->char . 1)
   (|%%_LBfi6hJPS_z| . 1)
   (<= . 1)
   (|%%_LBVl8QIPS_a| . 2)
   (|%%_LBh70EKPS_cv| . 3)
   (>= . 1))
  ()
  (integer->char + >= <= char->integer -)
  (#%define char-downcase
    ((#%lambda #t
       (|%%_LBVl8QIPS_a|)
       ()
       ((#%lambda #t
          (|%%_LBfi6hJPS_z|)
          (|%%_LBVl8QIPS_a|)
          ((#%lambda #t
             (|%%_LBBe4KJPS_lc-offset|)
             (|%%_LBfi6hJPS_z| |%%_LBVl8QIPS_a|)
             (#%lambda #t
               (|%%_LBXa2bKPS_c|)
               (|%%_LBBe4KJPS_lc-offset|
                 |%%_LBfi6hJPS_z|
                 |%%_LBVl8QIPS_a|)
               ((#%lambda #t
                  (|%%_LBh70EKPS_cv|)
                  (|%%_LBXa2bKPS_c|
                    |%%_LBBe4KJPS_lc-offset|
                    |%%_LBfi6hJPS_z|
                    |%%_LBVl8QIPS_a|)
                  (#%if (#%if (>= |%%_LBh70EKPS_cv| |%%_LBVl8QIPS_a|)
                          (<= |%%_LBh70EKPS_cv| |%%_LBfi6hJPS_z|)
                          #f)
                    (integer->char
                      (+ |%%_LBh70EKPS_cv| |%%_LBBe4KJPS_lc-offset|))
                    |%%_LBXa2bKPS_c|))
                (char->integer |%%_LBXa2bKPS_c|))))
           (- (char->integer #\a) |%%_LBVl8QIPS_a|)))
        (char->integer #\Z)))
     (char->integer #\A))))
(#%program
  ((char->integer . 4)
   (|%%_LBFUTrMPS_c| . 2)
   (|%%_LBjYV-LPS_uc-offset| . 1)
   (- . 2)
   (integer->char . 1)
   (|%%_LBZ_XxLPS_z| . 1)
   (<= . 1)
   (|%%_LBD3-4LPS_a| . 2)
   (|%%_LB_QRUMPS_cv| . 3)
   (>= . 1))
  ()
  (integer->char - >= <= char->integer)
  (#%define char-upcase
    ((#%lambda #t
       (|%%_LBD3-4LPS_a|)
       ()
       ((#%lambda #t
          (|%%_LBZ_XxLPS_z|)
          (|%%_LBD3-4LPS_a|)
          ((#%lambda #t
             (|%%_LBjYV-LPS_uc-offset|)
             (|%%_LBZ_XxLPS_z| |%%_LBD3-4LPS_a|)
             (#%lambda #t
               (|%%_LBFUTrMPS_c|)
               (|%%_LBjYV-LPS_uc-offset|
                 |%%_LBZ_XxLPS_z|
                 |%%_LBD3-4LPS_a|)
               ((#%lambda #t
                  (|%%_LB_QRUMPS_cv|)
                  (|%%_LBFUTrMPS_c|
                    |%%_LBjYV-LPS_uc-offset|
                    |%%_LBZ_XxLPS_z|
                    |%%_LBD3-4LPS_a|)
                  (#%if (#%if (>= |%%_LB_QRUMPS_cv| |%%_LBD3-4LPS_a|)
                          (<= |%%_LB_QRUMPS_cv| |%%_LBZ_XxLPS_z|)
                          #f)
                    (integer->char
                      (- |%%_LB_QRUMPS_cv| |%%_LBjYV-LPS_uc-offset|))
                    |%%_LBFUTrMPS_c|))
                (char->integer |%%_LBFUTrMPS_c|))))
           (- |%%_LBD3-4LPS_a| (char->integer #\A))))
        (char->integer #\z)))
     (char->integer #\a))))
(#%program
  ((|%%_LBlNPlNPS_args| . 1)
   (map . 1)
   (|%%_LBHJNONPS_c2| . 1)
   (|%%_LB1GLfOPS_c1| . 1)
   (char->integer . 3)
   (> . 1)
   (apply . 1))
  ()
  (map char->integer > apply)
  (#%define char>?
    (#%lambda #t
      (|%%_LB1GLfOPS_c1|
        |%%_LBHJNONPS_c2|
        .
        |%%_LBlNPlNPS_args|)
      ()
      (apply >
             (char->integer |%%_LB1GLfOPS_c1|)
             (char->integer |%%_LBHJNONPS_c2|)
             (map char->integer |%%_LBlNPlNPS_args|)))))
(#%program
  ((|%%_LBnCJIOPS_args| . 1)
   (map . 1)
   (|%%_LBJyH9PPS_c2| . 1)
   (|%%_LB3vFCPPS_c1| . 1)
   (char->integer . 3)
   (< . 1)
   (apply . 1))
  ()
  (map char->integer < apply)
  (#%define char<?
    (#%lambda #t
      (|%%_LB3vFCPPS_c1|
        |%%_LBJyH9PPS_c2|
        .
        |%%_LBnCJIOPS_args|)
      ()
      (apply <
             (char->integer |%%_LB3vFCPPS_c1|)
             (char->integer |%%_LBJyH9PPS_c2|)
             (map char->integer |%%_LBnCJIOPS_args|)))))
(#%program
  ((eqv? . 1))
  ()
  (eqv?)
  (#%define char=? eqv?))
(#%program
  ((char=? . 1)
   (|%%_LBLnBwQPS_c2| . 2)
   (|%%_LBprD3QPS_c1| . 2)
   (char>? . 1))
  ()
  (char=? char>?)
  (#%define char>=?
    (#%lambda #t
      (|%%_LBprD3QPS_c1| |%%_LBLnBwQPS_c2|)
      ()
      (#%if (char>? |%%_LBprD3QPS_c1| |%%_LBLnBwQPS_c2|)
        #t
        (char=? |%%_LBprD3QPS_c1| |%%_LBLnBwQPS_c2|)))))
(#%program
  ((char=? . 1)
   (|%%_LBrgxqRPS_c2| . 2)
   (|%%_LB5kzZQPS_c1| . 2)
   (char<? . 1))
  ()
  (char=? char<?)
  (#%define char<=?
    (#%lambda #t
      (|%%_LB5kzZQPS_c1| |%%_LBrgxqRPS_c2|)
      ()
      (#%if (char<? |%%_LB5kzZQPS_c1| |%%_LBrgxqRPS_c2|)
        #t
        (char=? |%%_LB5kzZQPS_c1| |%%_LBrgxqRPS_c2|)))))
(#%program
  ((|%%_LBNcvTRPS_args| . 1)
   (map . 1)
   (|%%_LB79tkSPS_c2| . 1)
   (|%%_LBt5rNSPS_c1| . 1)
   (char-downcase . 3)
   (char>? . 1)
   (apply . 1))
  ()
  (map char-downcase char>? apply)
  (#%define char-ci>?
    (#%lambda #t
      (|%%_LBt5rNSPS_c1|
        |%%_LB79tkSPS_c2|
        .
        |%%_LBNcvTRPS_args|)
      ()
      (apply char>?
             (char-downcase |%%_LBt5rNSPS_c1|)
             (char-downcase |%%_LB79tkSPS_c2|)
             (map char-downcase |%%_LBNcvTRPS_args|)))))
(#%program
  ((|%%_LBP1peTPS_args| . 1)
   (map . 1)
   (|%%_LB9-mHTPS_c2| . 1)
   (|%%_LBvWk8UPS_c1| . 1)
   (char-downcase . 3)
   (char<? . 1)
   (apply . 1))
  ()
  (map char-downcase char<? apply)
  (#%define char-ci<?
    (#%lambda #t
      (|%%_LBvWk8UPS_c1|
        |%%_LB9-mHTPS_c2|
        .
        |%%_LBP1peTPS_args|)
      ()
      (apply char<?
             (char-downcase |%%_LBvWk8UPS_c1|)
             (char-downcase |%%_LB9-mHTPS_c2|)
             (map char-downcase |%%_LBP1peTPS_args|)))))
(#%program
  ((|%%_LBRSiBUPS_args| . 1)
   (map . 1)
   (|%%_LBbPg2VPS_c2| . 1)
   (|%%_LBxLevVPS_c1| . 1)
   (char-downcase . 3)
   (char=? . 1)
   (apply . 1))
  ()
  (map char-downcase char=? apply)
  (#%define char-ci=?
    (#%lambda #t
      (|%%_LBxLevVPS_c1|
        |%%_LBbPg2VPS_c2|
        .
        |%%_LBRSiBUPS_args|)
      ()
      (apply char=?
             (char-downcase |%%_LBxLevVPS_c1|)
             (char-downcase |%%_LBbPg2VPS_c2|)
             (map char-downcase |%%_LBRSiBUPS_args|)))))
(#%program
  ((char-ci=? . 1)
   (|%%_LBdEapWPS_c2| . 2)
   (|%%_LBTHcYVPS_c1| . 2)
   (char-ci>? . 1))
  ()
  (char-ci=? char-ci>?)
  (#%define char-ci>=?
    (#%lambda #t
      (|%%_LBTHcYVPS_c1| |%%_LBdEapWPS_c2|)
      ()
      (#%if (char-ci>? |%%_LBTHcYVPS_c1| |%%_LBdEapWPS_c2|)
        #t
        (char-ci=? |%%_LBTHcYVPS_c1| |%%_LBdEapWPS_c2|)))))
(#%program
  ((char-ci=? . 1)
   (|%%_LBVw6jXPS_c2| . 2)
   (|%%_LBzA8SWPS_c1| . 2)
   (char-ci<? . 1))
  ()
  (char-ci=? char-ci<?)
  (#%define char-ci<=?
    (#%lambda #t
      (|%%_LBzA8SWPS_c1| |%%_LBVw6jXPS_c2|)
      ()
      (#%if (char-ci<? |%%_LBzA8SWPS_c1| |%%_LBVw6jXPS_c2|)
        #t
        (char-ci=? |%%_LBzA8SWPS_c1| |%%_LBVw6jXPS_c2|)))))
(#%program
  ((|%%_LBft4MXPS_c| . 2) (char<? . 2))
  ()
  (char<?)
  (#%define char-alphabetic?
    (#%lambda #t
      (|%%_LBft4MXPS_c|)
      ()
      (#%if (char<? #\@ |%%_LBft4MXPS_c| #\[)
        #t
        (char<? #\` |%%_LBft4MXPS_c| #\{)))))
(#%program
  ((|%%_LBBp2dYPS_c| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-numeric?
    (#%lambda #t
      (|%%_LBBp2dYPS_c|)
      ()
      (char<? #\/ |%%_LBBp2dYPS_c| #\:))))
(#%program
  ((|%%_LBXl0GYPS_c| . 4) (char=? . 4))
  ()
  (char=?)
  (#%define char-whitespace?
    (#%lambda #t
      (|%%_LBXl0GYPS_c|)
      ()
      (#%if (char=? |%%_LBXl0GYPS_c| #\space)
        #t
        (#%if (char=? |%%_LBXl0GYPS_c| #\tab)
          #t
          (#%if (char=? |%%_LBXl0GYPS_c| #\newline)
            #t
            (char=? |%%_LBXl0GYPS_c| #\return)))))))
(#%program
  ((|%%_LBhi-6ZPS_c| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-upper-case?
    (#%lambda #t
      (|%%_LBhi-6ZPS_c|)
      ()
      (char<? #\@ |%%_LBhi-6ZPS_c| #\[))))
(#%program
  ((|%%_LBDeYzZPS_c| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-lower-case?
    (#%lambda #t
      (|%%_LBDeYzZPS_c|)
      ()
      (char<? #\` |%%_LBDeYzZPS_c| #\{))))
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
   (|%%_LBlYNQ_PS_newstr| . 1)
   (|%%_LB__Pn_PS_str| . 3)
   (string-upcase . 1)
   (make-string . 2)
   (string-length . 4)
   (char-downcase . 1)
   (|%%_LBF3SW-PS_newstr| . 1)
   (|%%_LBj7Ut-PS_str| . 3)
   (string-downcase . 1)
   (+ . 1)
   (|%%_LBZaW0-PS_string-map| . 3)
   (|%%_LBHULh0QS_strsrc| . 2)
   (string-ref . 1)
   (|%%_LBnNHb1QS_proc| . 2)
   (|%%_LB1RJK0QS_strdst| . 3)
   (string-set! . 1)
   (|%%_LB3GD52QS_l| . 2)
   (|%%_LBJJFE1QS_n| . 4)
   (< . 1))
  ((string-upcase . 1)
   (string-downcase . 1)
   (|%%_LBZaW0-PS_string-map| . 1))
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
    ((|%%_LBZaW0-PS_string-map|
       (#%lambda #t
         (|%%_LBHULh0QS_strsrc|
           |%%_LB1RJK0QS_strdst|
           |%%_LBnNHb1QS_proc|
           |%%_LBJJFE1QS_n|
           |%%_LB3GD52QS_l|)
         (|%%_LBZaW0-PS_string-map|)
         (#%if (< |%%_LBJJFE1QS_n| |%%_LB3GD52QS_l|)
           (#%begin
             (string-set!
               |%%_LB1RJK0QS_strdst|
               |%%_LBJJFE1QS_n|
               (|%%_LBnNHb1QS_proc|
                 (string-ref
                   |%%_LBHULh0QS_strsrc|
                   |%%_LBJJFE1QS_n|)))
             (|%%_LBZaW0-PS_string-map|
               |%%_LBHULh0QS_strsrc|
               |%%_LB1RJK0QS_strdst|
               |%%_LBnNHb1QS_proc|
               (+ |%%_LBJJFE1QS_n| 1)
               |%%_LB3GD52QS_l|))
           |%%_LB1RJK0QS_strdst|))))
    ()
    (#%begin
      (#%set! string-downcase
        (#%lambda #t
          (|%%_LBj7Ut-PS_str|)
          (|%%_LBZaW0-PS_string-map|)
          ((#%lambda #t
             (|%%_LBF3SW-PS_newstr|)
             (|%%_LBj7Ut-PS_str| |%%_LBZaW0-PS_string-map|)
             (|%%_LBZaW0-PS_string-map|
               |%%_LBj7Ut-PS_str|
               |%%_LBF3SW-PS_newstr|
               char-downcase
               0
               (string-length |%%_LBj7Ut-PS_str|)))
           (make-string (string-length |%%_LBj7Ut-PS_str|)))))
      (#%set! string-upcase
        (#%lambda #t
          (|%%_LB__Pn_PS_str|)
          (|%%_LBZaW0-PS_string-map|)
          ((#%lambda #t
             (|%%_LBlYNQ_PS_newstr|)
             (|%%_LB__Pn_PS_str| |%%_LBZaW0-PS_string-map|)
             (|%%_LBZaW0-PS_string-map|
               |%%_LB__Pn_PS_str|
               |%%_LBlYNQ_PS_newstr|
               char-upcase
               0
               (string-length |%%_LB__Pn_PS_str|)))
           (make-string (string-length |%%_LB__Pn_PS_str|))))))))
(#%program
  ((equal? . 1))
  ()
  (equal?)
  (#%define string=? equal?))
(#%program
  ((|%%_LB5vxs3QS_s2| . 1)
   (|%%_LBLyz_2QS_s1| . 1)
   (string->list . 2)
   (car . 2)
   (cdr . 2)
   (|%%_LBpCBy2QS_s<?| . 2)
   (char>? . 1)
   (|%%_LBtgpg5QS_c2| . 2)
   (|%%_LB7krP4QS_c1| . 2)
   (char<? . 1)
   (|%%_LBNntm4QS_s2| . 4)
   (not . 1)
   (|%%_LBrrvV3QS_s1| . 3)
   (null? . 3))
  ((|%%_LBpCBy2QS_s<?| . 1))
  (string->list car char<? cdr char>? not null?)
  (#%define string<?
    (#%letrec #t
      ((|%%_LBpCBy2QS_s<?|
         (#%lambda #t
           (|%%_LBrrvV3QS_s1| |%%_LBNntm4QS_s2|)
           (|%%_LBpCBy2QS_s<?|)
           (#%if (null? |%%_LBrrvV3QS_s1|)
             (not (null? |%%_LBNntm4QS_s2|))
             (#%if (null? |%%_LBNntm4QS_s2|)
               #f
               ((#%lambda #t
                  (|%%_LB7krP4QS_c1| |%%_LBtgpg5QS_c2|)
                  (|%%_LBNntm4QS_s2|
                    |%%_LBrrvV3QS_s1|
                    |%%_LBpCBy2QS_s<?|)
                  (#%if (char<? |%%_LB7krP4QS_c1| |%%_LBtgpg5QS_c2|)
                    #t
                    (#%if (char>? |%%_LB7krP4QS_c1| |%%_LBtgpg5QS_c2|)
                      #f
                      (|%%_LBpCBy2QS_s<?|
                        (cdr |%%_LBrrvV3QS_s1|)
                        (cdr |%%_LBNntm4QS_s2|)))))
                (car |%%_LBrrvV3QS_s1|)
                (car |%%_LBNntm4QS_s2|)))))))
      ()
      (#%lambda #t
        (|%%_LBLyz_2QS_s1| |%%_LB5vxs3QS_s2|)
        (|%%_LBpCBy2QS_s<?|)
        (|%%_LBpCBy2QS_s<?|
          (string->list |%%_LBLyz_2QS_s1|)
          (string->list |%%_LB5vxs3QS_s2|))))))
(#%program
  ((|%%_LBv5jD6QS_s2| . 1)
   (|%%_LB99la6QS_s1| . 1)
   (string->list . 2)
   (car . 2)
   (cdr . 2)
   (|%%_LBPcnJ5QS_s>?| . 2)
   (char<? . 1)
   (|%%_LBTSar8QS_c2| . 2)
   (|%%_LBxWc-7QS_c1| . 2)
   (char>? . 1)
   (|%%_LBR1h47QS_s1| . 4)
   (not . 1)
   (|%%_LBb-ex7QS_s2| . 3)
   (null? . 3))
  ((|%%_LBPcnJ5QS_s>?| . 1))
  (string->list car char>? cdr char<? not null?)
  (#%define string>?
    (#%letrec #t
      ((|%%_LBPcnJ5QS_s>?|
         (#%lambda #t
           (|%%_LBR1h47QS_s1| |%%_LBb-ex7QS_s2|)
           (|%%_LBPcnJ5QS_s>?|)
           (#%if (null? |%%_LBb-ex7QS_s2|)
             (not (null? |%%_LBR1h47QS_s1|))
             (#%if (null? |%%_LBR1h47QS_s1|)
               #f
               ((#%lambda #t
                  (|%%_LBxWc-7QS_c1| |%%_LBTSar8QS_c2|)
                  (|%%_LBb-ex7QS_s2|
                    |%%_LBR1h47QS_s1|
                    |%%_LBPcnJ5QS_s>?|)
                  (#%if (char>? |%%_LBxWc-7QS_c1| |%%_LBTSar8QS_c2|)
                    #t
                    (#%if (char<? |%%_LBxWc-7QS_c1| |%%_LBTSar8QS_c2|)
                      #f
                      (|%%_LBPcnJ5QS_s>?|
                        (cdr |%%_LBR1h47QS_s1|)
                        (cdr |%%_LBb-ex7QS_s2|)))))
                (car |%%_LBR1h47QS_s1|)
                (car |%%_LBb-ex7QS_s2|)))))))
      ()
      (#%lambda #t
        (|%%_LB99la6QS_s1| |%%_LBv5jD6QS_s2|)
        (|%%_LBPcnJ5QS_s>?|)
        (|%%_LBPcnJ5QS_s>?|
          (string->list |%%_LB99la6QS_s1|)
          (string->list |%%_LBv5jD6QS_s2|))))))
(#%program
  ((string=? . 1)
   (|%%_LBzL6l9QS_s2| . 2)
   (|%%_LBdP8U8QS_s1| . 2)
   (string<? . 1))
  ()
  (string=? string<?)
  (#%define string<=?
    (#%lambda #t
      (|%%_LBdP8U8QS_s1| |%%_LBzL6l9QS_s2|)
      ()
      (#%if (string<? |%%_LBdP8U8QS_s1| |%%_LBzL6l9QS_s2|)
        #t
        (string=? |%%_LBdP8U8QS_s1| |%%_LBzL6l9QS_s2|)))))
(#%program
  ((string=? . 1)
   (|%%_LBfE2faQS_s2| . 2)
   (|%%_LBVH4O9QS_s1| . 2)
   (string>? . 1))
  ()
  (string=? string>?)
  (#%define string>=?
    (#%lambda #t
      (|%%_LBVH4O9QS_s1| |%%_LBfE2faQS_s2|)
      ()
      (#%if (string>? |%%_LBVH4O9QS_s1| |%%_LBfE2faQS_s2|)
        #t
        (string=? |%%_LBVH4O9QS_s1| |%%_LBfE2faQS_s2|)))))
(#%program
  ((|%%_LBXw-8bQS_s2| . 1)
   (|%%_LBBA0IaQS_s1| . 1)
   (string-downcase . 2)
   (string=? . 1))
  ()
  (string-downcase string=?)
  (#%define string-ci=?
    (#%lambda #t
      (|%%_LBBA0IaQS_s1| |%%_LBXw-8bQS_s2|)
      ()
      (string=?
        (string-downcase |%%_LBBA0IaQS_s1|)
        (string-downcase |%%_LBXw-8bQS_s2|)))))
(#%program
  ((|%%_LBDpW2cQS_s2| . 1)
   (|%%_LBhtYBbQS_s1| . 1)
   (string-downcase . 2)
   (string<? . 1))
  ()
  (string-downcase string<?)
  (#%define string-ci<?
    (#%lambda #t
      (|%%_LBhtYBbQS_s1| |%%_LBDpW2cQS_s2|)
      ()
      (string<?
        (string-downcase |%%_LBhtYBbQS_s1|)
        (string-downcase |%%_LBDpW2cQS_s2|)))))
(#%program
  ((|%%_LBjiSYcQS_s2| . 1)
   (|%%_LBZlUvcQS_s1| . 1)
   (string-downcase . 2)
   (string>? . 1))
  ()
  (string-downcase string>?)
  (#%define string-ci>?
    (#%lambda #t
      (|%%_LBZlUvcQS_s1| |%%_LBjiSYcQS_s2|)
      ()
      (string>?
        (string-downcase |%%_LBZlUvcQS_s1|)
        (string-downcase |%%_LBjiSYcQS_s2|)))))
(#%program
  ((|%%_LB_aOSdQS_s2| . 1)
   (|%%_LBFeQpdQS_s1| . 1)
   (string-downcase . 2)
   (string>=? . 1))
  ()
  (string-downcase string>=?)
  (#%define string-ci>=?
    (#%lambda #t
      (|%%_LBFeQpdQS_s1| |%%_LB_aOSdQS_s2|)
      ()
      (string>=?
        (string-downcase |%%_LBFeQpdQS_s1|)
        (string-downcase |%%_LB_aOSdQS_s2|)))))
(#%program
  ((|%%_LBH3KMeQS_s2| . 1)
   (|%%_LBl7MjeQS_s1| . 1)
   (string-downcase . 2)
   (string<=? . 1))
  ()
  (string-downcase string<=?)
  (#%define string-ci<=?
    (#%lambda #t
      (|%%_LBl7MjeQS_s1| |%%_LBH3KMeQS_s2|)
      ()
      (string<=?
        (string-downcase |%%_LBl7MjeQS_s1|)
        (string-downcase |%%_LBH3KMeQS_s2|)))))
(#%program
  ((- . 1)
   (make-string . 1)
   (|%%_LB3RBAgQS_end| . 2)
   (|%%_LBJUD7gQS_start| . 2)
   (|%%_LBpNz1hQS_newstr| . 2)
   (|%%_LBnYFGfQS_str| . 1)
   (+ . 2)
   (|%%_LB10IdfQS_fill-string| . 2)
   (|%%_LBLJxuhQS_sstr| . 2)
   (string-ref . 1)
   (|%%_LBrCtoiQS_n| . 2)
   (|%%_LB5GvXhQS_dstr| . 2)
   (string-set! . 1)
   (|%%_LB7vpijQS_e| . 2)
   (|%%_LBNyrRiQS_s| . 3)
   (< . 1))
  ((|%%_LB10IdfQS_fill-string| . 1))
  (make-string - string-ref string-set! + <)
  (#%define substring
    (#%letrec #t
      ((|%%_LB10IdfQS_fill-string|
         (#%lambda #t
           (|%%_LBLJxuhQS_sstr|
             |%%_LB5GvXhQS_dstr|
             |%%_LBrCtoiQS_n|
             |%%_LBNyrRiQS_s|
             |%%_LB7vpijQS_e|)
           (|%%_LB10IdfQS_fill-string|)
           (#%if (< |%%_LBNyrRiQS_s| |%%_LB7vpijQS_e|)
             (#%begin
               (string-set!
                 |%%_LB5GvXhQS_dstr|
                 |%%_LBrCtoiQS_n|
                 (string-ref |%%_LBLJxuhQS_sstr| |%%_LBNyrRiQS_s|))
               (|%%_LB10IdfQS_fill-string|
                 |%%_LBLJxuhQS_sstr|
                 |%%_LB5GvXhQS_dstr|
                 (+ |%%_LBrCtoiQS_n| 1)
                 (+ |%%_LBNyrRiQS_s| 1)
                 |%%_LB7vpijQS_e|))
             #!void))))
      ()
      (#%lambda #t
        (|%%_LBnYFGfQS_str|
          |%%_LBJUD7gQS_start|
          |%%_LB3RBAgQS_end|)
        (|%%_LB10IdfQS_fill-string|)
        ((#%lambda #t
           (|%%_LBpNz1hQS_newstr|)
           (|%%_LB3RBAgQS_end|
             |%%_LBJUD7gQS_start|
             |%%_LBnYFGfQS_str|
             |%%_LB10IdfQS_fill-string|)
           (#%begin
             (|%%_LB10IdfQS_fill-string|
               |%%_LBnYFGfQS_str|
               |%%_LBpNz1hQS_newstr|
               0
               |%%_LBJUD7gQS_start|
               |%%_LB3RBAgQS_end|)
             |%%_LBpNz1hQS_newstr|))
         (make-string
           (- |%%_LB3RBAgQS_end| |%%_LBJUD7gQS_start|)))))))
(#%program
  ((- . 1)
   (cdr . 1)
   (list-ref . 1)
   (|%%_LBtrnLjQS_list| . 2)
   (car . 1)
   (|%%_LBPnlckQS_n| . 2)
   (zero? . 1))
  ()
  (list-ref cdr - car zero?)
  (#%define list-ref
    (#%lambda #t
      (|%%_LBtrnLjQS_list| |%%_LBPnlckQS_n|)
      ()
      (#%if (zero? |%%_LBPnlckQS_n|)
        (car |%%_LBtrnLjQS_list|)
        (list-ref
          (cdr |%%_LBtrnLjQS_list|)
          (- |%%_LBPnlckQS_n| 1))))))
(#%program
  ((|%%_LB9kjFkQS_args| . 1)
   (|%%_LBvgh6lQS_k| . 1)
   (apply . 1)
   (call-with-current-continuation . 1))
  ()
  (apply call-with-current-continuation)
  (#%define values
    (#%lambda #t
      |%%_LB9kjFkQS_args|
      ()
      (call-with-current-continuation
        (#%lambda #t
          (|%%_LBvgh6lQS_k|)
          (|%%_LB9kjFkQS_args|)
          (apply |%%_LBvgh6lQS_k| |%%_LB9kjFkQS_args|))))))
