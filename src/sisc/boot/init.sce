(#%program () () () #!void)
(#%program
  ((for-each . 1)
   (|ls1_PihuxtPLw| . 2)
   (|proc_PiDqvWPLw| . 2)
   (cons . 1)
   (null? . 1)
   (map-car . 1)
   (|lists_PiXxz0PLw| . 4)
   (map-cdr . 1)
   (apply . 2))
  ((|lists_PiXxz0PLw| . 1))
  (for-each cons map-car null? map-cdr apply)
  (#%define for-each
    (#%lambda #t
      (|proc_PiDqvWPLw|
        |ls1_PihuxtPLw|
        .
        |lists_PiXxz0PLw|)
      ()
      (#%if (null? |ls1_PihuxtPLw|)
        #!void
        (#%begin
          (#%set! |lists_PiXxz0PLw|
            (cons |ls1_PihuxtPLw| |lists_PiXxz0PLw|))
          (apply |proc_PiDqvWPLw|
                 (map-car |lists_PiXxz0PLw|))
          (apply for-each
                 |proc_PiDqvWPLw|
                 (map-cdr |lists_PiXxz0PLw|)))))))
(#%program
  ((|x_PiZmtnQLw| . 1) (eq? . 1))
  ()
  (eq?)
  (#%define eof-object?
    (#%lambda #t
      (|x_PiZmtnQLw|)
      ()
      (eq? |x_PiZmtnQLw| #!eof))))
(#%program
  ((|x_PijjrQQLw| . 1))
  ()
  ()
  (#%define not
    (#%lambda #t
      (|x_PijjrQQLw|)
      ()
      (#%if |x_PijjrQQLw| #f #t))))
(#%program
  ((|port_PiFfphRLw| . 1)
   (display . 1)
   (apply . 1))
  ()
  (display apply)
  (#%define newline
    (#%lambda #t
      |port_PiFfphRLw|
      ()
      (apply display #\newline |port_PiFfphRLw|))))
(#%program
  ((|acc_Pi11h5TLw| . 2)
   (cdr . 1)
   (cons . 1)
   (null? . 1)
   (|ls_PiH4jESLw| . 3)
   (car . 1)
   (|ls_Pil8lbSLw| . 1)
   (|iter_Pi_bnKRLw| . 2))
  ((|iter_Pi_bnKRLw| . 1))
  (cdr cons null? car)
  (#%define reverse
    (#%letrec #t
      ((|iter_Pi_bnKRLw|
         (#%lambda #t
           (|ls_PiH4jESLw| |acc_Pi11h5TLw|)
           (|iter_Pi_bnKRLw|)
           (#%if (null? |ls_PiH4jESLw|)
             |acc_Pi11h5TLw|
             (|iter_Pi_bnKRLw|
               (cdr |ls_PiH4jESLw|)
               (cons (car |ls_PiH4jESLw|) |acc_Pi11h5TLw|))))))
      ()
      (#%lambda #t
        (|ls_Pil8lbSLw|)
        (|iter_Pi_bnKRLw|)
        (|iter_Pi_bnKRLw| |ls_Pil8lbSLw| ())))))
(#%program
  ((|iter_PinZeyTLw| . 2)
   (|d_PiLK6mVLw| . 1)
   (|r_PipO8VULw| . 2)
   (cdr . 1)
   (|s_PiJVc_TLw| . 1)
   (set-cdr! . 1)
   (|s_Pi3SasULw| . 4)
   (null? . 1))
  ((|iter_PinZeyTLw| . 1))
  (cdr set-cdr! null?)
  (#%define reverse!
    (#%letrec #t
      ((|iter_PinZeyTLw|
         (#%lambda #t
           (|s_Pi3SasULw| |r_PipO8VULw|)
           (|iter_PinZeyTLw|)
           (#%if (null? |s_Pi3SasULw|)
             |r_PipO8VULw|
             ((#%lambda #t
                (|d_PiLK6mVLw|)
                (|s_Pi3SasULw| |r_PipO8VULw| |iter_PinZeyTLw|)
                (#%begin
                  (set-cdr! |s_Pi3SasULw| |r_PipO8VULw|)
                  (|iter_PinZeyTLw| |d_PiLK6mVLw| |s_Pi3SasULw|)))
              (cdr |s_Pi3SasULw|))))))
      ()
      (#%lambda #t
        (|s_PiJVc_TLw|)
        (|iter_PinZeyTLw|)
        (|iter_PinZeyTLw| |s_PiJVc_TLw| ())))))
(#%program
  ((cdr . 1)
   (cons . 1)
   (null? . 1)
   (map-car . 1)
   (caar . 1)
   (|ls_Pi5H4PVLw| . 3))
  ()
  (cdr cons map-car null? caar)
  (#%define map-car
    (#%lambda #t
      (|ls_Pi5H4PVLw|)
      ()
      (#%if (null? |ls_Pi5H4PVLw|)
        ()
        (cons (caar |ls_Pi5H4PVLw|)
              (map-car (cdr |ls_Pi5H4PVLw|)))))))
(#%program
  ((cdr . 1)
   (cons . 1)
   (null? . 1)
   (map-cdr . 1)
   (|ls_PirD2gWLw| . 3)
   (cdar . 1))
  ()
  (cdr cons null? map-cdr cdar)
  (#%define map-cdr
    (#%lambda #t
      (|ls_PirD2gWLw|)
      ()
      (#%if (null? |ls_PirD2gWLw|)
        ()
        (cons (cdar |ls_PirD2gWLw|)
              (map-cdr (cdr |ls_PirD2gWLw|)))))))
(#%program
  ((reverse . 2)
   (|list_PiRdQqZLw| . 3)
   (|proc_Pix6Mk-Lw| . 2)
   (|proc_Pi9lUwYLw| . 2)
   (map-car . 1)
   (map-cdr . 1)
   (|loop_Pi7w-9XLw| . 2)
   (car . 2)
   (apply . 1)
   (cdr . 2)
   (cons . 2)
   (|proc_PivhSZYLw| . 2)
   (|c_PizXFH_Lw| . 2)
   (null? . 3)
   (|list1_PiT2KN-Lw| . 3)
   (|lists_Pid_He_Lw| . 2)
   (|acc_PibaOTZLw| . 2)
   (|lists_PitsYCXLw| . 2)
   (|map1_PiNz0JWLw| . 2)
   (|list1_PiPoW3YLw| . 2))
  ((|loop_Pi7w-9XLw| . 1) (|map1_PiNz0JWLw| . 1))
  (reverse
    cdr
    cons
    null?
    map-car
    map-cdr
    car
    apply)
  (#%define map
    (#%letrec #t
      ((|map1_PiNz0JWLw|
         (#%lambda #t
           (|proc_PivhSZYLw|
             |list_PiRdQqZLw|
             |acc_PibaOTZLw|)
           (|map1_PiNz0JWLw|)
           (#%if (null? |list_PiRdQqZLw|)
             (reverse |acc_PibaOTZLw|)
             (|map1_PiNz0JWLw|
               |proc_PivhSZYLw|
               (cdr |list_PiRdQqZLw|)
               (cons (|proc_PivhSZYLw| (car |list_PiRdQqZLw|))
                     |acc_PibaOTZLw|)))))
       (|loop_Pi7w-9XLw|
         (#%lambda #t
           (|proc_Pix6Mk-Lw|
             |list1_PiT2KN-Lw|
             |lists_Pid_He_Lw|
             |c_PizXFH_Lw|)
           (|loop_Pi7w-9XLw|)
           (#%if (null? |list1_PiT2KN-Lw|)
             (reverse |c_PizXFH_Lw|)
             (|loop_Pi7w-9XLw|
               |proc_Pix6Mk-Lw|
               (cdr |list1_PiT2KN-Lw|)
               (map-cdr |lists_Pid_He_Lw|)
               (cons (apply |proc_Pix6Mk-Lw|
                            (car |list1_PiT2KN-Lw|)
                            (map-car |lists_Pid_He_Lw|))
                     |c_PizXFH_Lw|))))))
      ()
      (#%lambda #t
        (|proc_Pi9lUwYLw|
          |list1_PiPoW3YLw|
          .
          |lists_PitsYCXLw|)
        (|map1_PiNz0JWLw| |loop_Pi7w-9XLw|)
        (#%if (null? |lists_PitsYCXLw|)
          (|map1_PiNz0JWLw|
            |proc_Pi9lUwYLw|
            |list1_PiPoW3YLw|
            ())
          (|loop_Pi7w-9XLw|
            |proc_Pi9lUwYLw|
            |list1_PiPoW3YLw|
            |lists_PitsYCXLw|
            ()))))))
(#%program
  ((|f_PiVTD80Mw| . 1)
   (|g_PifQBB0Mw| . 1)
   (|x_PiBMz21Mw| . 1))
  ()
  ()
  (#%define compose2
    (#%lambda #t
      (|f_PiVTD80Mw| |g_PifQBB0Mw|)
      ()
      (#%lambda #t
        (|x_PiBMz21Mw|)
        (|f_PiVTD80Mw| |g_PifQBB0Mw|)
        (|f_PiVTD80Mw| (|g_PifQBB0Mw| |x_PiBMz21Mw|))))))
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
  ((|obj_Pijupj3Mw| . 1)
   (|list_PiJ4bu6Mw| . 1)
   (|alist_PirO0L8Mw| . 4)
   (|obj_Pi5S2i8Mw| . 2)
   (|obj_Pi_mld4Mw| . 1)
   (caar . 1)
   (car . 2)
   (assq . 1)
   (|obj_PiDBtp2Mw| . 1)
   (memq . 1)
   (cdr . 2)
   (null? . 2)
   (|alist_PiFqnM3Mw| . 1)
   (|n_PiNK-b9Mw| . 2)
   (|obj_PiHfh75Mw| . 1)
   (assv . 1)
   (equal? . 2)
   (|alist_PiZxrS2Mw| . 1)
   (eqv? . 2)
   (|list_PitDW5aMw| . 4)
   (|obj_Pin8d16Mw| . 1)
   (|assn_PiXIxv1Mw| . 4)
   (|list_Pi1cfA5Mw| . 1)
   (eq? . 2)
   (assoc . 1)
   (|list_PipZ6o7Mw| . 1)
   (member . 1)
   (|memn_PihFvY1Mw| . 4)
   (|obj_Pi319X6Mw| . 1)
   (|n_PiLV4R7Mw| . 2)
   (|alist_PiljjG4Mw| . 1)
   (memv . 1)
   (|obj_Pi7HYE9Mw| . 2))
  ((assv . 1)
   (memq . 1)
   (member . 1)
   (|memn_PihFvY1Mw| . 1)
   (|assn_PiXIxv1Mw| . 1)
   (memv . 1)
   (assq . 1)
   (assoc . 1))
  (assv equal?
        eqv?
        eq?
        car
        caar
        assq
        assoc
        member
        memq
        cdr
        null?
        memv)
  (#%letrec #t
    ((|assn_PiXIxv1Mw|
       (#%lambda #t
         (|n_PiLV4R7Mw| |obj_Pi5S2i8Mw| |alist_PirO0L8Mw|)
         (|assn_PiXIxv1Mw|)
         (#%if (null? |alist_PirO0L8Mw|)
           #f
           (#%if (|n_PiLV4R7Mw|
                   (caar |alist_PirO0L8Mw|)
                   |obj_Pi5S2i8Mw|)
             (car |alist_PirO0L8Mw|)
             (|assn_PiXIxv1Mw|
               |n_PiLV4R7Mw|
               |obj_Pi5S2i8Mw|
               (cdr |alist_PirO0L8Mw|))))))
     (|memn_PihFvY1Mw|
       (#%lambda #t
         (|n_PiNK-b9Mw| |obj_Pi7HYE9Mw| |list_PitDW5aMw|)
         (|memn_PihFvY1Mw|)
         (#%if (null? |list_PitDW5aMw|)
           #f
           (#%if (|n_PiNK-b9Mw|
                   (car |list_PitDW5aMw|)
                   |obj_Pi7HYE9Mw|)
             |list_PitDW5aMw|
             (|memn_PihFvY1Mw|
               |n_PiNK-b9Mw|
               |obj_Pi7HYE9Mw|
               (cdr |list_PitDW5aMw|)))))))
    ()
    (#%begin
      (#%set! assq
        (#%lambda #t
          (|obj_PiDBtp2Mw| |alist_PiZxrS2Mw|)
          (|assn_PiXIxv1Mw|)
          (|assn_PiXIxv1Mw|
            eq?
            |obj_PiDBtp2Mw|
            |alist_PiZxrS2Mw|)))
      (#%set! assv
        (#%lambda #t
          (|obj_Pijupj3Mw| |alist_PiFqnM3Mw|)
          (|assn_PiXIxv1Mw|)
          (|assn_PiXIxv1Mw|
            eqv?
            |obj_Pijupj3Mw|
            |alist_PiFqnM3Mw|)))
      (#%set! assoc
        (#%lambda #t
          (|obj_Pi_mld4Mw| |alist_PiljjG4Mw|)
          (|assn_PiXIxv1Mw|)
          (|assn_PiXIxv1Mw|
            equal?
            |obj_Pi_mld4Mw|
            |alist_PiljjG4Mw|)))
      (#%set! memq
        (#%lambda #t
          (|obj_PiHfh75Mw| |list_Pi1cfA5Mw|)
          (|memn_PihFvY1Mw|)
          (|memn_PihFvY1Mw|
            eq?
            |obj_PiHfh75Mw|
            |list_Pi1cfA5Mw|)))
      (#%set! memv
        (#%lambda #t
          (|obj_Pin8d16Mw| |list_PiJ4bu6Mw|)
          (|memn_PihFvY1Mw|)
          (|memn_PihFvY1Mw|
            eqv?
            |obj_Pin8d16Mw|
            |list_PiJ4bu6Mw|)))
      (#%set! member
        (#%lambda #t
          (|obj_Pi319X6Mw| |list_PipZ6o7Mw|)
          (|memn_PihFvY1Mw|)
          (|memn_PihFvY1Mw|
            equal?
            |obj_Pi319X6Mw|
            |list_PipZ6o7Mw|))))))
(#%program
  ((compose2 . 1) (cdr . 1) (car . 1))
  ()
  ()
  (#%define cadr (compose2 car cdr)))
(#%program
  ((compose2 . 1) (cdr . 1) (car . 1))
  ()
  ()
  (#%define cdar (compose2 cdr car)))
(#%program
  ((compose2 . 1) (cdr . 2))
  ()
  ()
  (#%define cddr (compose2 cdr cdr)))
(#%program
  ((compose2 . 1) (car . 2))
  ()
  ()
  (#%define caar (compose2 car car)))
(#%program
  ((compose2 . 1) (car . 1) (caar . 1))
  ()
  ()
  (#%define caaar (compose2 car caar)))
(#%program
  ((compose2 . 1) (car . 1) (cadr . 1))
  ()
  ()
  (#%define caadr (compose2 car cadr)))
(#%program
  ((compose2 . 1) (car . 1) (cdar . 1))
  ()
  ()
  (#%define cadar (compose2 car cdar)))
(#%program
  ((compose2 . 1) (car . 1) (cddr . 1))
  ()
  ()
  (#%define caddr (compose2 car cddr)))
(#%program
  ((compose2 . 1) (cdr . 1) (caar . 1))
  ()
  ()
  (#%define cdaar (compose2 cdr caar)))
(#%program
  ((compose2 . 1) (cdr . 1) (cadr . 1))
  ()
  ()
  (#%define cdadr (compose2 cdr cadr)))
(#%program
  ((compose2 . 1) (cdr . 1) (cdar . 1))
  ()
  ()
  (#%define cddar (compose2 cdr cdar)))
(#%program
  ((compose2 . 1) (cdr . 1) (cddr . 1))
  ()
  ()
  (#%define cdddr (compose2 cdr cddr)))
(#%program
  ((compose2 . 1) (caaar . 1) (car . 1))
  ()
  ()
  (#%define caaaar (compose2 car caaar)))
(#%program
  ((compose2 . 1) (car . 1) (caadr . 1))
  ()
  ()
  (#%define caaadr (compose2 car caadr)))
(#%program
  ((compose2 . 1) (car . 1) (cadar . 1))
  ()
  ()
  (#%define caadar (compose2 car cadar)))
(#%program
  ((compose2 . 1) (caddr . 1) (car . 1))
  ()
  ()
  (#%define caaddr (compose2 car caddr)))
(#%program
  ((compose2 . 1) (car . 1) (cdaar . 1))
  ()
  ()
  (#%define cadaar (compose2 car cdaar)))
(#%program
  ((compose2 . 1) (car . 1) (cdadr . 1))
  ()
  ()
  (#%define cadadr (compose2 car cdadr)))
(#%program
  ((compose2 . 1) (cddar . 1) (car . 1))
  ()
  ()
  (#%define caddar (compose2 car cddar)))
(#%program
  ((compose2 . 1) (car . 1) (cdddr . 1))
  ()
  ()
  (#%define cadddr (compose2 car cdddr)))
(#%program
  ((compose2 . 1) (cdr . 1) (caaar . 1))
  ()
  ()
  (#%define cdaaar (compose2 cdr caaar)))
(#%program
  ((compose2 . 1) (cdr . 1) (caadr . 1))
  ()
  ()
  (#%define cdaadr (compose2 cdr caadr)))
(#%program
  ((compose2 . 1) (cdr . 1) (cadar . 1))
  ()
  ()
  (#%define cdadar (compose2 cdr cadar)))
(#%program
  ((compose2 . 1) (cdr . 1) (caddr . 1))
  ()
  ()
  (#%define cdaddr (compose2 cdr caddr)))
(#%program
  ((compose2 . 1) (cdr . 1) (cdaar . 1))
  ()
  ()
  (#%define cddaar (compose2 cdr cdaar)))
(#%program
  ((compose2 . 1) (cdr . 1) (cdadr . 1))
  ()
  ()
  (#%define cddadr (compose2 cdr cdadr)))
(#%program
  ((compose2 . 1) (cddar . 1) (cdr . 1))
  ()
  ()
  (#%define cdddar (compose2 cdr cddar)))
(#%program
  ((compose2 . 1) (cdr . 1) (cdddr . 1))
  ()
  ()
  (#%define cddddr (compose2 cdr cdddr)))
(#%program
  ((|ls2_Pi9wS_aMw| . 2)
   (cdr . 1)
   (|ls1_PiPzUyaMw| . 3)
   (cons . 1)
   (null? . 1)
   (car . 1)
   (append2 . 1))
  ()
  (cdr cons null? car append2)
  (#%define append2
    (#%lambda #t
      (|ls1_PiPzUyaMw| |ls2_Pi9wS_aMw|)
      ()
      (#%if (null? |ls1_PiPzUyaMw|)
        |ls2_Pi9wS_aMw|
        (cons (car |ls1_PiPzUyaMw|)
              (append2 (cdr |ls1_PiPzUyaMw|) |ls2_Pi9wS_aMw|))))))
(#%program
  ((append2 . 1))
  ()
  ()
  (#%define append append2))
(#%program
  ((|l_PiRoOVbMw| . 2)
   (string-set! . 1)
   (cdr . 1)
   (length . 1)
   (null? . 1)
   (|l_PiblMmcMw| . 3)
   (|n_PiTdIgdMw| . 2)
   (make-string . 1)
   (car . 1)
   (+ . 1)
   (|l2s_PivsQsbMw| . 2)
   (|s_PixhKPcMw| . 3))
  ((|l2s_PivsQsbMw| . 1))
  (string-set! cdr length null? make-string car +)
  (#%define list->string
    (#%letrec #t
      ((|l2s_PivsQsbMw|
         (#%lambda #t
           (|l_PiblMmcMw| |s_PixhKPcMw| |n_PiTdIgdMw|)
           (|l2s_PivsQsbMw|)
           (#%if (null? |l_PiblMmcMw|)
             |s_PixhKPcMw|
             (#%begin
               (string-set!
                 |s_PixhKPcMw|
                 |n_PiTdIgdMw|
                 (car |l_PiblMmcMw|))
               (|l2s_PivsQsbMw|
                 (cdr |l_PiblMmcMw|)
                 |s_PixhKPcMw|
                 (+ |n_PiTdIgdMw| 1)))))))
      ()
      (#%lambda #t
        (|l_PiRoOVbMw|)
        (|l2s_PivsQsbMw|)
        (|l2s_PivsQsbMw|
          |l_PiRoOVbMw|
          (make-string (length |l_PiRoOVbMw|))
          0)))))
(#%program
  ((|s_PiV2CDeMw| . 2)
   (string-ref . 1)
   (|s_Piz6EaeMw| . 2)
   (|h_Pif_z4fMw| . 2)
   (cons . 1)
   (|n_PiBXxxfMw| . 3)
   (< . 1)
   (- . 2)
   (string-length . 1)
   (|s2l_PidaGJdMw| . 2))
  ((|s2l_PidaGJdMw| . 1))
  (string-ref cons - < string-length)
  (#%define string->list
    (#%letrec #t
      ((|s2l_PidaGJdMw|
         (#%lambda #t
           (|s_PiV2CDeMw| |h_Pif_z4fMw| |n_PiBXxxfMw|)
           (|s2l_PidaGJdMw|)
           (#%if (< |n_PiBXxxfMw| 0)
             |h_Pif_z4fMw|
             (|s2l_PidaGJdMw|
               |s_PiV2CDeMw|
               (cons (string-ref |s_PiV2CDeMw| |n_PiBXxxfMw|)
                     |h_Pif_z4fMw|)
               (- |n_PiBXxxfMw| 1))))))
      ()
      (#%lambda #t
        (|s_Piz6EaeMw|)
        (|s2l_PidaGJdMw|)
        (|s2l_PidaGJdMw|
          |s_Piz6EaeMw|
          ()
          (- (string-length |s_Piz6EaeMw|) 1))))))
(#%program
  ((vector-set! . 1)
   (length . 1)
   (|l_PihQtrgMw| . 4)
   (car . 1)
   (+ . 1)
   (|l2v_PiXTv-fMw| . 2)
   (|v_PiZIplhMw| . 3)
   (proper-list? . 1)
   (make-vector . 1)
   (|n_PijFnOhMw| . 2)
   (cdr . 1)
   (null? . 1)
   (error . 1)
   (|l_PiDMrUgMw| . 3))
  ((|l2v_PiXTv-fMw| . 1))
  (proper-list?
    make-vector
    vector-set!
    cdr
    length
    null?
    error
    car
    +)
  (#%define list->vector
    (#%letrec #t
      ((|l2v_PiXTv-fMw|
         (#%lambda #t
           (|l_PiDMrUgMw| |v_PiZIplhMw| |n_PijFnOhMw|)
           (|l2v_PiXTv-fMw|)
           (#%if (null? |l_PiDMrUgMw|)
             |v_PiZIplhMw|
             (#%begin
               (vector-set!
                 |v_PiZIplhMw|
                 |n_PijFnOhMw|
                 (car |l_PiDMrUgMw|))
               (|l2v_PiXTv-fMw|
                 (cdr |l_PiDMrUgMw|)
                 |v_PiZIplhMw|
                 (+ |n_PijFnOhMw| 1)))))))
      ()
      (#%lambda #t
        (|l_PihQtrgMw|)
        (|l2v_PiXTv-fMw|)
        (#%if (proper-list? |l_PihQtrgMw|)
          (|l2v_PiXTv-fMw|
            |l_PihQtrgMw|
            (make-vector (length |l_PihQtrgMw|))
            0)
          (error (#%quote list->vector)
                 "can only convert a proper list."
                 |l_PihQtrgMw|))))))
(#%program
  ((|elems_PiFBlfiMw| . 1) (list->vector . 1))
  ()
  (list->vector)
  (#%define vector
    (#%lambda #t
      |elems_PiFBlfiMw|
      ()
      (list->vector |elems_PiFBlfiMw|))))
(#%program
  ((list->string . 1) (|elems_Pi_xjIiMw| . 1))
  ()
  (list->string)
  (#%define string
    (#%lambda #t
      |elems_Pi_xjIiMw|
      ()
      (list->string |elems_Pi_xjIiMw|))))
(#%program
  ((_make-parameter . 1))
  ()
  ()
  (#%define current-url (_make-parameter "file:.")))
(#%program
  ((eqv? . 1)
   (string-ref . 1)
   (current-url . 3)
   (normalize-url . 2)
   (null? . 1)
   (string-append . 1)
   (car . 1)
   (|rest_Piluh9jMw| . 2)
   (- . 1)
   (|l_Pi1nd3kMw| . 1)
   (string-length . 1)
   (|v_PiHqfCjMw| . 4))
  ()
  (eqv? string-ref
        current-url
        normalize-url
        null?
        string-append
        car
        -
        string-length)
  (#%define current-directory
    (#%lambda #t
      |rest_Piluh9jMw|
      ()
      (#%if (null? |rest_Piluh9jMw|)
        (normalize-url (current-url) ".")
        (current-url
          (normalize-url
            (current-url)
            ((#%lambda #t
               (|v_PiHqfCjMw|)
               ()
               ((#%lambda #t
                  (|l_Pi1nd3kMw|)
                  (|v_PiHqfCjMw|)
                  (#%if (eqv? (string-ref |v_PiHqfCjMw| (- |l_Pi1nd3kMw| 1))
                              #\/)
                    |v_PiHqfCjMw|
                    (string-append |v_PiHqfCjMw| "/")))
                (string-length |v_PiHqfCjMw|)))
             (car |rest_Piluh9jMw|))))))))
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
  ((|*file-handlers*_PinjbwkMw| . 4)
   (not . 1)
   (assq . 2)
   (|extension_PiL43kmMw| . 1)
   (cdr . 1)
   (|_load_Pip85TlMw| . 1)
   (|thunk_Pi3c7qlMw| . 1)
   (cons . 2)
   (string->symbol . 1)
   (|t_Pi511NmMw| . 2)
   (load . 1)
   (|extension_PiJf9ZkMw| . 2)
   (string-downcase . 1)
   (file-handler . 1)
   (add-file-handler . 1))
  ((|*file-handlers*_PinjbwkMw| . 1)
   (file-handler . 1)
   (add-file-handler . 1))
  (not cdr
       cons
       string->symbol
       load
       assq
       string-downcase
       file-handler
       add-file-handler)
  ((#%lambda #t
     (|*file-handlers*_PinjbwkMw|)
     ()
     (#%begin
       (#%set! add-file-handler
         (#%lambda #t
           (|extension_PiJf9ZkMw| |thunk_Pi3c7qlMw|)
           (|*file-handlers*_PinjbwkMw|)
           (#%if (assq |extension_PiJf9ZkMw|
                       |*file-handlers*_PinjbwkMw|)
             #!void
             (#%set! |*file-handlers*_PinjbwkMw|
               (cons (cons |extension_PiJf9ZkMw| |thunk_Pi3c7qlMw|)
                     |*file-handlers*_PinjbwkMw|)))))
       (#%set! file-handler
         ((#%lambda #t
            (|_load_Pip85TlMw|)
            (|*file-handlers*_PinjbwkMw|)
            (#%lambda #t
              (|extension_PiL43kmMw|)
              (|_load_Pip85TlMw| |*file-handlers*_PinjbwkMw|)
              ((#%lambda #t
                 (|t_Pi511NmMw|)
                 (|_load_Pip85TlMw|)
                 (#%if |t_Pi511NmMw|
                   (cdr |t_Pi511NmMw|)
                   |_load_Pip85TlMw|))
               (assq (string->symbol
                       (string-downcase |extension_PiL43kmMw|))
                     |*file-handlers*_PinjbwkMw|))))
          load))))
   ()))
(#%program
  ((|file_Pi7SW7oMw| . 1)
   (current-url . 1)
   (normalize-url . 1)
   (|proc_PirZ-dnMw| . 1)
   (apply . 1)
   (|rest_PiNVYGnMw| . 1))
  ()
  (current-url normalize-url apply)
  (#%define make-io-proc
    (#%lambda #t
      (|proc_PirZ-dnMw|)
      ()
      (#%lambda #t
        (|file_Pi7SW7oMw| . |rest_PiNVYGnMw|)
        (|proc_PirZ-dnMw|)
        (apply |proc_PirZ-dnMw|
               (normalize-url (current-url) |file_Pi7SW7oMw|)
               |rest_PiNVYGnMw|)))))
(#%program
  ((|file_PiPKS1pMw| . 1)
   (with-failure-continuation . 1)
   (|e_PiRzMoqMw| . 1)
   (car . 2)
   (reverse! . 1)
   (|previous-url_Pi9HQupMw| . 3)
   (call-with-failure-continuation . 1)
   (|file-extension_PitOUAoMw| . 1)
   (cdr . 1)
   (cons . 1)
   (open-output-file . 2)
   (normalize-url . 1)
   (|url_PiToGLrMw| . 1)
   (null? . 1)
   (load . 1)
   (|loop_PidlEcsMw| . 2)
   (string->list . 1)
   (file-handler . 1)
   (|x_PizhCFsMw| . 4)
   (|acc_PiVdA6tMw| . 2)
   (list->string . 1)
   (equal? . 1)
   (open-source-input-file . 2)
   (current-url . 6)
   (make-io-proc . 3)
   (open-input-file . 2)
   (|fk_PibwKRqMw| . 1)
   (void . 1)
   (|m_PivDOXpMw| . 1)
   (|fe_PixsIirMw| . 2))
  ((open-source-input-file . 1)
   (open-output-file . 1)
   (load . 1)
   (|loop_PidlEcsMw| . 1)
   (open-input-file . 1))
  (equal?
    list->string
    with-failure-continuation
    open-source-input-file
    current-url
    car
    reverse!
    make-io-proc
    open-input-file
    call-with-failure-continuation
    cdr
    cons
    open-output-file
    void
    normalize-url
    load
    null?
    string->list
    file-handler)
  ((#%lambda #t
     (|file-extension_PitOUAoMw|)
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
           (|file_PiPKS1pMw|)
           (|file-extension_PitOUAoMw|)
           (#%begin
             ((#%lambda #t
                (|previous-url_Pi9HQupMw|)
                (|file_PiPKS1pMw| |file-extension_PitOUAoMw|)
                (#%begin
                  (current-url
                    (normalize-url
                      |previous-url_Pi9HQupMw|
                      |file_PiPKS1pMw|))
                  (with-failure-continuation
                    (#%lambda #t
                      (|m_PivDOXpMw| |e_PiRzMoqMw|)
                      (|previous-url_Pi9HQupMw|)
                      (#%begin
                        (current-url |previous-url_Pi9HQupMw|)
                        (call-with-failure-continuation
                          (#%lambda #t
                            (|fk_PibwKRqMw|)
                            (|m_PivDOXpMw| |e_PiRzMoqMw|)
                            (|fk_PibwKRqMw| |m_PivDOXpMw| |e_PiRzMoqMw|)))))
                    (#%lambda #t
                      ()
                      (|file-extension_PitOUAoMw|)
                      ((#%lambda #t
                         (|fe_PixsIirMw|)
                         ()
                         ((file-handler
                            (#%if |fe_PixsIirMw| |fe_PixsIirMw| "scm"))
                          (current-url)))
                       (|file-extension_PitOUAoMw| (current-url)))))
                  (current-url |previous-url_Pi9HQupMw|)))
              (current-url))
             (void))))))
   (#%lambda #t
     (|url_PiToGLrMw|)
     ()
     ((#%letrec #t
        ((|loop_PidlEcsMw|
           (#%lambda #t
             (|x_PizhCFsMw| |acc_PiVdA6tMw|)
             (|loop_PidlEcsMw|)
             (#%if (null? |x_PizhCFsMw|)
               #f
               (#%if (equal? (car |x_PizhCFsMw|) #\.)
                 (list->string |acc_PiVdA6tMw|)
                 (|loop_PidlEcsMw|
                   (cdr |x_PizhCFsMw|)
                   (cons (car |x_PizhCFsMw|) |acc_PiVdA6tMw|)))))))
        ()
        |loop_PidlEcsMw|)
      (reverse! (string->list |url_PiToGLrMw|))
      ()))))
(#%program
  ((|name_Pih_rWuMw| . 2)
   (for-each . 1)
   (|nl_PiB6w0uMw| . 2)
   (native-library-binding-names . 1)
   (native-library-binding . 1)
   (putprop . 1)
   (|str_PifayztMw| . 1)
   (|binding-names_PiX2utuMw| . 1)
   (load-native-library . 1))
  ()
  (for-each
    native-library-binding-names
    native-library-binding
    putprop
    load-native-library)
  (#%define load-module
    (#%lambda #t
      (|str_PifayztMw|)
      ()
      ((#%lambda #t
         (|nl_PiB6w0uMw|)
         ()
         ((#%lambda #t
            (|binding-names_PiX2utuMw|)
            (|nl_PiB6w0uMw|)
            (for-each
              (#%lambda #t
                (|name_Pih_rWuMw|)
                (|nl_PiB6w0uMw|)
                (putprop
                  |name_Pih_rWuMw|
                  (native-library-binding
                    |nl_PiB6w0uMw|
                    |name_Pih_rWuMw|)))
              |binding-names_PiX2utuMw|))
          (native-library-binding-names |nl_PiB6w0uMw|)))
       (load-native-library |str_PifayztMw|)))))
(#%program
  ((|lses_PijQlhwMw| . 4)
   (|real-append_PiDXpnvMw| . 3)
   (cdr . 3)
   (|lses_PiZTnQvMw| . 5)
   (null? . 4)
   (|ls1_PiFMjKwMw| . 3)
   (car . 3)
   (append2 . 1)
   (apply . 3))
  ((|real-append_PiDXpnvMw| . 1))
  (cdr null? car append2 apply)
  (#%define append
    (#%letrec #t
      ((|real-append_PiDXpnvMw|
         (#%lambda #t
           (|ls1_PiFMjKwMw| . |lses_PijQlhwMw|)
           (|real-append_PiDXpnvMw|)
           (#%if (null? |lses_PijQlhwMw|)
             |ls1_PiFMjKwMw|
             (#%if (null? |ls1_PiFMjKwMw|)
               (apply |real-append_PiDXpnvMw| |lses_PijQlhwMw|)
               (apply |real-append_PiDXpnvMw|
                      (append2 |ls1_PiFMjKwMw| (car |lses_PijQlhwMw|))
                      (cdr |lses_PijQlhwMw|)))))))
      ()
      (#%lambda #t
        |lses_PiZTnQvMw|
        (|real-append_PiDXpnvMw|)
        (#%if (null? |lses_PiZTnQvMw|)
          ()
          (#%if (null? (cdr |lses_PiZTnQvMw|))
            (car |lses_PiZTnQvMw|)
            (apply |real-append_PiDXpnvMw|
                   (car |lses_PiZTnQvMw|)
                   (cdr |lses_PiZTnQvMw|))))))))
(#%program
  ((not . 1)
   (|lp_PilFfExMw| . 2)
   (pair? . 2)
   (cdr . 3)
   (|lag_Pi1ybyyMw| . 1)
   (|x_PiJq7szMw| . 2)
   (|x_PiHBd5yMw| . 3)
   (|lag_Pi3n5VzMw| . 2)
   (null? . 2)
   (|x_Pi_IhbxMw| . 2)
   (|x_Pinu9_yMw| . 3)
   (eq? . 1))
  ((|lp_PilFfExMw| . 1))
  (not pair? cdr null? eq?)
  (#%define proper-list?
    (#%lambda #t
      (|x_Pi_IhbxMw|)
      ()
      ((#%letrec #t
         ((|lp_PilFfExMw|
            (#%lambda #t
              (|x_PiHBd5yMw| |lag_Pi1ybyyMw|)
              (|lp_PilFfExMw|)
              (#%if (pair? |x_PiHBd5yMw|)
                ((#%lambda #t
                   (|x_Pinu9_yMw|)
                   (|lag_Pi1ybyyMw| |lp_PilFfExMw|)
                   (#%if (pair? |x_Pinu9_yMw|)
                     ((#%lambda #t
                        (|x_PiJq7szMw| |lag_Pi3n5VzMw|)
                        (|lp_PilFfExMw|)
                        (#%if (eq? |x_PiJq7szMw| |lag_Pi3n5VzMw|)
                          #f
                          (|lp_PilFfExMw| |x_PiJq7szMw| |lag_Pi3n5VzMw|)))
                      (cdr |x_Pinu9_yMw|)
                      (cdr |lag_Pi1ybyyMw|))
                     (null? |x_Pinu9_yMw|)))
                 (cdr |x_PiHBd5yMw|))
                (null? |x_PiHBd5yMw|)))))
         ()
         |lp_PilFfExMw|)
       |x_Pi_IhbxMw|
       |x_Pi_IhbxMw|))))
(#%program
  ((proper-list? . 1))
  ()
  ()
  (#%define list? proper-list?))
(#%program
  ((not . 1)
   (rational? . 1)
   (|integer-expt_Pi5c_fBMw| . 2)
   (denominator . 1)
   (|exponent_PitZS3DMw| . 1)
   (|exponent_PivOMqEMw| . 2)
   (|result_PidwCHGMw| . 3)
   (integer? . 2)
   (|rest_PiTzEeGMw| . 3)
   (expt . 2)
   (|squaring_PizsA8HMw| . 3)
   (/ . 2)
   (quotient . 1)
   (zero? . 3)
   (abs . 1)
   (negative? . 1)
   (odd? . 1)
   (ashl . 1)
   (|exponent_PibHIkFMw| . 4)
   (exp . 1)
   (* . 3)
   (|base_Pir8ZIBMw| . 9)
   (|loop_PixDGNFMw| . 2)
   (|base-numerator_PiPVQwDMw| . 1)
   (|base_Pi71VCCMw| . 1)
   (|base-denominator_Pi9SOZDMw| . 1)
   (|general-expt_Pipj3mAMw| . 1)
   (|exponent_PiN4X9CMw| . 8)
   (numerator . 1)
   (log . 1)
   (exact? . 5)
   (|rational-expt_PiLf1PAMw| . 1)
   (= . 1)
   (|base_PiRKKTEMw| . 4))
  ((|integer-expt_Pi5c_fBMw| . 1)
   (|loop_PixDGNFMw| . 1)
   (|rational-expt_PiLf1PAMw| . 1)
   (|general-expt_Pipj3mAMw| . 1))
  (exp not
       *
       rational?
       denominator
       integer?
       expt
       numerator
       /
       zero?
       quotient
       log
       negative?
       abs
       odd?
       exact?
       ashl
       =)
  (#%define expt
    (#%letrec #t
      ((|general-expt_Pipj3mAMw|
         (#%lambda #t
           (|base_Pi71VCCMw| |exponent_PitZS3DMw|)
           ()
           (exp (* |exponent_PitZS3DMw| (log |base_Pi71VCCMw|)))))
       (|rational-expt_PiLf1PAMw|
         (#%lambda #t
           (|base-numerator_PiPVQwDMw|
             |base-denominator_Pi9SOZDMw|
             |exponent_PivOMqEMw|)
           ()
           (/ (expt |base-numerator_PiPVQwDMw|
                    |exponent_PivOMqEMw|)
              (expt |base-denominator_Pi9SOZDMw|
                    |exponent_PivOMqEMw|))))
       (|integer-expt_Pi5c_fBMw|
         (#%lambda #t
           (|base_PiRKKTEMw| |exponent_PibHIkFMw|)
           (|integer-expt_Pi5c_fBMw|)
           (#%if (negative? |exponent_PibHIkFMw|)
             (/ (|integer-expt_Pi5c_fBMw|
                  |base_PiRKKTEMw|
                  (abs |exponent_PibHIkFMw|)))
             (#%if (#%if (exact? |base_PiRKKTEMw|)
                     (= |base_PiRKKTEMw| 2)
                     #f)
               (ashl 1 |exponent_PibHIkFMw|)
               ((#%letrec #t
                  ((|loop_PixDGNFMw|
                     (#%lambda #t
                       (|rest_PiTzEeGMw|
                         |result_PidwCHGMw|
                         |squaring_PizsA8HMw|)
                       (|loop_PixDGNFMw|)
                       (#%if (zero? |rest_PiTzEeGMw|)
                         |result_PidwCHGMw|
                         (|loop_PixDGNFMw|
                           (quotient |rest_PiTzEeGMw| 2)
                           (#%if (odd? |rest_PiTzEeGMw|)
                             (* |result_PidwCHGMw| |squaring_PizsA8HMw|)
                             |result_PidwCHGMw|)
                           (* |squaring_PizsA8HMw| |squaring_PizsA8HMw|))))))
                  ()
                  |loop_PixDGNFMw|)
                |exponent_PibHIkFMw|
                1
                |base_PiRKKTEMw|))))))
      ()
      (#%lambda #t
        (|base_Pir8ZIBMw| |exponent_PiN4X9CMw|)
        (|general-expt_Pipj3mAMw|
          |rational-expt_PiLf1PAMw|
          |integer-expt_Pi5c_fBMw|)
        (#%if (zero? |exponent_PiN4X9CMw|)
          (#%if (exact? |exponent_PiN4X9CMw|) 1 1.0)
          (#%if (zero? |base_Pir8ZIBMw|)
            (#%if (exact? |exponent_PiN4X9CMw|)
              |base_Pir8ZIBMw|
              0.0)
            (#%if (#%if (exact? |base_Pir8ZIBMw|)
                    (#%if (rational? |base_Pir8ZIBMw|)
                      (#%if (integer? |base_Pir8ZIBMw|) #f #t)
                      #f)
                    #f)
              (|rational-expt_PiLf1PAMw|
                (numerator |base_Pir8ZIBMw|)
                (denominator |base_Pir8ZIBMw|)
                |exponent_PiN4X9CMw|)
              (#%if (#%if (exact? |exponent_PiN4X9CMw|)
                      (integer? |exponent_PiN4X9CMw|)
                      #f)
                (|integer-expt_Pi5c_fBMw|
                  |base_Pir8ZIBMw|
                  |exponent_PiN4X9CMw|)
                (|general-expt_Pipj3mAMw|
                  |base_Pir8ZIBMw|
                  |exponent_PiN4X9CMw|)))))))))
(#%program
  ((|tmp_PiXdsYIMw| . 2)
   (* . 3)
   (/ . 2)
   (modulo . 4)
   (|tmp_PihaqpJMw| . 2)
   (|x_PiVoyBHMw| . 4)
   (modpow . 2)
   (- . 1)
   (= . 1)
   (|y_Piflw2IMw| . 4)
   (even? . 1)
   (|n_PiBhuvIMw| . 6))
  ()
  (* / modulo modpow - even? =)
  (#%define modpow
    (#%lambda #t
      (|x_PiVoyBHMw| |y_Piflw2IMw| |n_PiBhuvIMw|)
      ()
      (#%if (= |y_Piflw2IMw| 1)
        (modulo |x_PiVoyBHMw| |n_PiBhuvIMw|)
        (#%if (even? |y_Piflw2IMw|)
          ((#%lambda #t
             (|tmp_PihaqpJMw|)
             (|n_PiBhuvIMw|)
             (modulo
               (* |tmp_PihaqpJMw| |tmp_PihaqpJMw|)
               |n_PiBhuvIMw|))
           (modpow
             |x_PiVoyBHMw|
             (/ |y_Piflw2IMw| 2)
             |n_PiBhuvIMw|))
          ((#%lambda #t
             (|tmp_PiXdsYIMw|)
             (|x_PiVoyBHMw| |n_PiBhuvIMw|)
             (modulo
               (* |x_PiVoyBHMw|
                  (modulo
                    (* |tmp_PiXdsYIMw| |tmp_PiXdsYIMw|)
                    |n_PiBhuvIMw|))
               |n_PiBhuvIMw|))
           (modpow
             |x_PiVoyBHMw|
             (/ (- |y_Piflw2IMw| 1) 2)
             |n_PiBhuvIMw|)))))))
(#%program
  ((|oldint?_PiD6oSJMw| . 1)
   (|n_PiZ2mjKMw| . 4)
   (integer? . 1)
   (real? . 1)
   (round . 1)
   (= . 1))
  ()
  (real? round =)
  (#%define integer?
    ((#%lambda #t
       (|oldint?_PiD6oSJMw|)
       ()
       (#%lambda #t
         (|n_PiZ2mjKMw|)
         (|oldint?_PiD6oSJMw|)
         (#%if (|oldint?_PiD6oSJMw| |n_PiZ2mjKMw|)
           #t
           (#%if (real? |n_PiZ2mjKMw|)
             (= (round |n_PiZ2mjKMw|) |n_PiZ2mjKMw|)
             #f))))
     integer?)))
(#%program
  ((|n_PiFXhdLMw| . 2)
   (not . 1)
   (|oldcomp?_Pij_jMKMw| . 1)
   (complex? . 1)
   (number? . 1))
  ()
  (not number?)
  (#%define real?
    ((#%lambda #t
       (|oldcomp?_Pij_jMKMw|)
       ()
       (#%lambda #t
         (|n_PiFXhdLMw|)
         (|oldcomp?_Pij_jMKMw|)
         (#%if (number? |n_PiFXhdLMw|)
           (#%if (|oldcomp?_Pij_jMKMw| |n_PiFXhdLMw|) #f #t)
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
  ((not . 1)
   (sqrt . 1)
   (* . 2)
   (|b_PiHMbAMMw| . 2)
   (|num_Pi_TfGLMw| . 6)
   (|a_PilQd7MMw| . 2)
   (real-part . 1)
   (imag-part . 1)
   (+ . 1)
   (< . 1)
   (- . 1)
   (real? . 1))
  ()
  (not * sqrt real-part imag-part + < - real?)
  (#%define abs
    (#%lambda #t
      (|num_Pi_TfGLMw|)
      ()
      (#%if (real? |num_Pi_TfGLMw|)
        (#%if (< |num_Pi_TfGLMw| 0)
          (- |num_Pi_TfGLMw|)
          |num_Pi_TfGLMw|)
        ((#%lambda #t
           (|a_PilQd7MMw| |b_PiHMbAMMw|)
           ()
           (sqrt (+ (* |a_PilQd7MMw| |a_PilQd7MMw|)
                    (* |b_PiHMbAMMw| |b_PiHMbAMMw|))))
         (real-part |num_Pi_TfGLMw|)
         (imag-part |num_Pi_TfGLMw|))))))
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
  ((|proc_PiLq_hPMw| . 3)
   (> . 1)
   (exact->inexact . 1)
   (|_min_max_Pi1J91NMw| . 4)
   (max . 1)
   (car . 3)
   (|mv_Pi5nZKPMw| . 5)
   (|x1_PiJB5XNMw| . 3)
   (inexact? . 3)
   (|args_PinF7uNMw| . 2)
   (|x1_Pipu1ROMw| . 3)
   (cdr . 2)
   (|args_PirjXbQMw| . 6)
   (|args_Pi3y3oOMw| . 2)
   (|inexact_PiNfVEQMw| . 3)
   (null? . 3)
   (exact? . 1)
   (min . 1)
   (< . 1))
  ((|_min_max_Pi1J91NMw| . 1) (max . 1) (min . 1))
  (> cdr
     exact->inexact
     max
     null?
     exact?
     min
     car
     <
     inexact?)
  (#%letrec #t
    ((|_min_max_Pi1J91NMw|
       (#%lambda #t
         (|proc_PiLq_hPMw|
           |mv_Pi5nZKPMw|
           |args_PirjXbQMw|
           |inexact_PiNfVEQMw|)
         (|_min_max_Pi1J91NMw|)
         (#%if (null? |args_PirjXbQMw|)
           (#%if (#%if |inexact_PiNfVEQMw|
                   (exact? |mv_Pi5nZKPMw|)
                   #f)
             (exact->inexact |mv_Pi5nZKPMw|)
             |mv_Pi5nZKPMw|)
           (#%if (|proc_PiLq_hPMw|
                   (car |args_PirjXbQMw|)
                   |mv_Pi5nZKPMw|)
             (|_min_max_Pi1J91NMw|
               |proc_PiLq_hPMw|
               (car |args_PirjXbQMw|)
               (cdr |args_PirjXbQMw|)
               (#%if |inexact_PiNfVEQMw|
                 #t
                 (inexact? (car |args_PirjXbQMw|))))
             (|_min_max_Pi1J91NMw|
               |proc_PiLq_hPMw|
               |mv_Pi5nZKPMw|
               (cdr |args_PirjXbQMw|)
               |inexact_PiNfVEQMw|))))))
    ()
    (#%begin
      (#%set! min
        (#%lambda #t
          (|x1_PiJB5XNMw| . |args_PinF7uNMw|)
          (|_min_max_Pi1J91NMw|)
          (#%if (null? |args_PinF7uNMw|)
            |x1_PiJB5XNMw|
            (|_min_max_Pi1J91NMw|
              <
              |x1_PiJB5XNMw|
              |args_PinF7uNMw|
              (inexact? |x1_PiJB5XNMw|)))))
      (#%set! max
        (#%lambda #t
          (|x1_Pipu1ROMw| . |args_Pi3y3oOMw|)
          (|_min_max_Pi1J91NMw|)
          (#%if (null? |args_Pi3y3oOMw|)
            |x1_Pipu1ROMw|
            (|_min_max_Pi1J91NMw|
              >
              |x1_Pipu1ROMw|
              |args_Pi3y3oOMw|
              (inexact? |x1_Pipu1ROMw|))))))))
(#%program
  ((|n_Pi7cT5RMw| . 1) (< . 1))
  ()
  (<)
  (#%define negative?
    (#%lambda #t
      (|n_Pi7cT5RMw|)
      ()
      (< |n_Pi7cT5RMw| 0))))
(#%program
  ((> . 1) (|n_Pit8RyRMw| . 1))
  ()
  (>)
  (#%define positive?
    (#%lambda #t
      (|n_Pit8RyRMw|)
      ()
      (> |n_Pit8RyRMw| 0))))
(#%program
  ((modulo . 1) (|n_PiP4P_RMw| . 1) (= . 1))
  ()
  (modulo =)
  (#%define even?
    (#%lambda #t
      (|n_PiP4P_RMw|)
      ()
      (= 0 (modulo |n_PiP4P_RMw| 2)))))
(#%program
  ((not . 1) (|n_Pi91NsSMw| . 1) (even? . 1))
  ()
  (not even?)
  (#%define odd?
    (#%lambda #t
      (|n_Pi91NsSMw|)
      ()
      (#%if (even? |n_Pi91NsSMw|) #f #t))))
(#%program
  ((= . 1) (|n_PivZKVSMw| . 1))
  ()
  (=)
  (#%define zero?
    (#%lambda #t
      (|n_PivZKVSMw|)
      ()
      (= |n_PivZKVSMw| 0))))
(#%program
  ((|n_PiRVImTMw| . 1) (+ . 1))
  ()
  (+)
  (#%define add1
    (#%lambda #t
      (|n_PiRVImTMw|)
      ()
      (+ |n_PiRVImTMw| 1))))
(#%program
  ((|n_PibSGPTMw| . 1) (- . 1))
  ()
  (-)
  (#%define sub1
    (#%lambda #t
      (|n_PibSGPTMw|)
      ()
      (- |n_PibSGPTMw| 1))))
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
  ((> . 1)
   (|b_PizDyDVMw| . 2)
   (|b_PifwuxWMw| . 2)
   (|comparator_PiBss-WMw| . 1)
   (car . 1)
   (cadr . 1)
   (|args_PiDhmlYMw| . 1)
   (|a_PiVzw4WMw| . 2)
   (>= . 1)
   (|loop_PiZdkOYMw| . 2)
   (|x_PiF6gIZMw| . 1)
   (|_comp_help_PixOEgUMw| . 2)
   (|a_PidHAaVMw| . 2)
   (cdr . 2)
   (|endstate_PihloUXMw| . 2)
   (|chainer_PiXoqrXMw| . 1)
   (|x_PijaifZMw| . 5)
   (|_and2_PiTKCJUMw| . 2)
   (|y_Pi_2e9-Mw| . 1)
   (null? . 2)
   (<= . 1)
   (< . 1)
   (= . 2))
  ((<= . 1) (>= . 1) (|loop_PiZdkOYMw| . 1))
  (> cdr <= null? car cadr < = >=)
  ((#%lambda #t
     (|_comp_help_PixOEgUMw| |_and2_PiTKCJUMw|)
     ()
     (#%begin
       (#%set! <=
         (|_comp_help_PixOEgUMw|
           (#%lambda #t
             (|a_PidHAaVMw| |b_PizDyDVMw|)
             ()
             (#%if (< |a_PidHAaVMw| |b_PizDyDVMw|)
               #t
               (= |a_PidHAaVMw| |b_PizDyDVMw|)))
           |_and2_PiTKCJUMw|
           #t))
       (#%set! >=
         (|_comp_help_PixOEgUMw|
           (#%lambda #t
             (|a_PiVzw4WMw| |b_PifwuxWMw|)
             ()
             (#%if (> |a_PiVzw4WMw| |b_PifwuxWMw|)
               #t
               (= |a_PiVzw4WMw| |b_PifwuxWMw|)))
           |_and2_PiTKCJUMw|
           #t))))
   (#%lambda #t
     (|comparator_PiBss-WMw|
       |chainer_PiXoqrXMw|
       |endstate_PihloUXMw|)
     ()
     (#%lambda #t
       |args_PiDhmlYMw|
       (|comparator_PiBss-WMw|
         |chainer_PiXoqrXMw|
         |endstate_PihloUXMw|)
       ((#%letrec #t
          ((|loop_PiZdkOYMw|
             (#%lambda #t
               (|x_PijaifZMw|)
               (|loop_PiZdkOYMw|
                 |comparator_PiBss-WMw|
                 |chainer_PiXoqrXMw|
                 |endstate_PihloUXMw|)
               (#%if (null? |x_PijaifZMw|)
                 |endstate_PihloUXMw|
                 (#%if (null? (cdr |x_PijaifZMw|))
                   |endstate_PihloUXMw|
                   (|chainer_PiXoqrXMw|
                     (|comparator_PiBss-WMw|
                       (car |x_PijaifZMw|)
                       (cadr |x_PijaifZMw|))
                     (|loop_PiZdkOYMw| (cdr |x_PijaifZMw|))))))))
          (|comparator_PiBss-WMw|
            |chainer_PiXoqrXMw|
            |endstate_PihloUXMw|)
          |loop_PiZdkOYMw|)
        |args_PiDhmlYMw|)))
   (#%lambda #t
     (|x_PiF6gIZMw| |y_Pi_2e9-Mw|)
     ()
     (#%if |x_PiF6gIZMw| |y_Pi_2e9-Mw| #f))))
(#%program
  ((> . 1)
   (|_?=_Pil_bC-Mw| . 2)
   (|comparator_PiHX93_Mw| . 1)
   (car . 2)
   (cadr . 2)
   (apply . 1)
   (>= . 2)
   (cdr . 2)
   (|args_PinQ5Z_Mw| . 7)
   (null? . 2)
   (<= . 2)
   (< . 1)
   (|chainer_Pi1U7w_Mw| . 1)
   (= . 1)
   (|t_PiJM3q0Nw| . 2))
  ((<= . 1) (>= . 1))
  (> cdr <= null? car cadr < apply >= =)
  ((#%lambda #t
     (|_?=_Pil_bC-Mw|)
     ()
     (#%begin
       (#%set! >= (|_?=_Pil_bC-Mw| > >=))
       (#%set! <= (|_?=_Pil_bC-Mw| < <=))))
   (#%lambda #t
     (|comparator_PiHX93_Mw| |chainer_Pi1U7w_Mw|)
     ()
     (#%lambda #t
       |args_PinQ5Z_Mw|
       (|comparator_PiHX93_Mw| |chainer_Pi1U7w_Mw|)
       (#%if (null? |args_PinQ5Z_Mw|)
         #t
         (#%if (null? (cdr |args_PinQ5Z_Mw|))
           #t
           (#%if ((#%lambda #t
                    (|t_PiJM3q0Nw|)
                    (|args_PinQ5Z_Mw| |comparator_PiHX93_Mw|)
                    (#%if |t_PiJM3q0Nw|
                      |t_PiJM3q0Nw|
                      (|comparator_PiHX93_Mw|
                        (car |args_PinQ5Z_Mw|)
                        (cadr |args_PinQ5Z_Mw|))))
                  (= (car |args_PinQ5Z_Mw|)
                     (cadr |args_PinQ5Z_Mw|)))
             (apply |chainer_Pi1U7w_Mw|
                    (cdr |args_PinQ5Z_Mw|))
             #f)))))))
(#%program
  ((cdr . 1)
   (_gcd . 1)
   (null? . 2)
   (|args_Pi3J1T0Nw| . 5)
   (car . 2)
   (cadr . 1))
  ()
  (cdr _gcd null? car cadr)
  (#%define gcd
    (#%lambda #t
      |args_Pi3J1T0Nw|
      ()
      (#%if (null? |args_Pi3J1T0Nw|)
        0
        (#%if (null? (cdr |args_Pi3J1T0Nw|))
          (car |args_Pi3J1T0Nw|)
          (_gcd (car |args_Pi3J1T0Nw|)
                (cadr |args_Pi3J1T0Nw|)))))))
(#%program
  ((_lcm . 1)
   (cdr . 1)
   (null? . 2)
   (|args_PipF_j1Nw| . 5)
   (car . 2)
   (cadr . 1))
  ()
  (_lcm cdr null? car cadr)
  (#%define lcm
    (#%lambda #t
      |args_PipF_j1Nw|
      ()
      (#%if (null? |args_PipF_j1Nw|)
        1
        (#%if (null? (cdr |args_PipF_j1Nw|))
          (car |args_PipF_j1Nw|)
          (_lcm (car |args_PipF_j1Nw|)
                (cadr |args_PipF_j1Nw|)))))))
(#%program
  ((remainder . 1)
   (negative? . 2)
   (positive? . 1)
   (|y_Pi5yXd2Nw| . 3)
   (+ . 1)
   (|x_PiLBZM1Nw| . 1)
   (|r_PiruVG2Nw| . 3))
  ()
  (remainder negative? positive? +)
  (#%define modulo
    (#%lambda #t
      (|x_PiLBZM1Nw| |y_Pi5yXd2Nw|)
      ()
      ((#%lambda #t
         (|r_PiruVG2Nw|)
         (|y_Pi5yXd2Nw|)
         (#%if ((#%if (negative? |y_Pi5yXd2Nw|)
                  positive?
                  negative?)
                |r_PiruVG2Nw|)
           (+ |r_PiruVG2Nw| |y_Pi5yXd2Nw|)
           |r_PiruVG2Nw|))
       (remainder |x_PiLBZM1Nw| |y_Pi5yXd2Nw|)))))
(#%program
  ((_string-append . 1)
   (cdr . 2)
   (|args_PiPfNu4Nw| . 3)
   (null? . 2)
   (|string-append-helper_PiNqT73Nw| . 2)
   (|args_Pi7nRA3Nw| . 3)
   (car . 2)
   (|acc_PitjP14Nw| . 2))
  ((|string-append-helper_PiNqT73Nw| . 1))
  (_string-append cdr null? car)
  (#%define string-append
    (#%letrec #t
      ((|string-append-helper_PiNqT73Nw|
         (#%lambda #t
           (|acc_PitjP14Nw| |args_PiPfNu4Nw|)
           (|string-append-helper_PiNqT73Nw|)
           (#%if (null? |args_PiPfNu4Nw|)
             |acc_PitjP14Nw|
             (|string-append-helper_PiNqT73Nw|
               (_string-append
                 |acc_PitjP14Nw|
                 (car |args_PiPfNu4Nw|))
               (cdr |args_PiPfNu4Nw|))))))
      ()
      (#%lambda #t
        |args_Pi7nRA3Nw|
        (|string-append-helper_PiNqT73Nw|)
        (#%if (null? |args_Pi7nRA3Nw|)
          ""
          (|string-append-helper_PiNqT73Nw|
            (car |args_Pi7nRA3Nw|)
            (cdr |args_Pi7nRA3Nw|)))))))
(#%program
  ((|z_Piv8Jo5Nw| . 1)
   (|lc-offset_PiR4HR5Nw| . 1)
   (|c_Pib1Fi6Nw| . 2)
   (|cv_PixZCL6Nw| . 3)
   (<= . 1)
   (char->integer . 4)
   (|a_Pi9cLX4Nw| . 2)
   (+ . 1)
   (- . 1)
   (>= . 1)
   (integer->char . 1))
  ()
  (<= char->integer + - >= integer->char)
  (#%define char-downcase
    ((#%lambda #t
       (|a_Pi9cLX4Nw|)
       ()
       ((#%lambda #t
          (|z_Piv8Jo5Nw|)
          (|a_Pi9cLX4Nw|)
          ((#%lambda #t
             (|lc-offset_PiR4HR5Nw|)
             (|z_Piv8Jo5Nw| |a_Pi9cLX4Nw|)
             (#%lambda #t
               (|c_Pib1Fi6Nw|)
               (|lc-offset_PiR4HR5Nw|
                 |z_Piv8Jo5Nw|
                 |a_Pi9cLX4Nw|)
               ((#%lambda #t
                  (|cv_PixZCL6Nw|)
                  (|c_Pib1Fi6Nw|
                    |lc-offset_PiR4HR5Nw|
                    |z_Piv8Jo5Nw|
                    |a_Pi9cLX4Nw|)
                  (#%if (#%if (>= |cv_PixZCL6Nw| |a_Pi9cLX4Nw|)
                          (<= |cv_PixZCL6Nw| |z_Piv8Jo5Nw|)
                          #f)
                    (integer->char
                      (+ |cv_PixZCL6Nw| |lc-offset_PiR4HR5Nw|))
                    |c_Pib1Fi6Nw|))
                (char->integer |c_Pib1Fi6Nw|))))
           (- (char->integer #\a) |a_Pi9cLX4Nw|)))
        (char->integer #\Z)))
     (char->integer #\A))))
(#%program
  ((|c_PiVKuz8Nw| . 2)
   (|z_PidSyF7Nw| . 1)
   (|cv_PifHs09Nw| . 3)
   (<= . 1)
   (char->integer . 4)
   (|a_PiTVAc7Nw| . 2)
   (- . 2)
   (>= . 1)
   (|uc-offset_PizOw68Nw| . 1)
   (integer->char . 1))
  ()
  (<= char->integer - >= integer->char)
  (#%define char-upcase
    ((#%lambda #t
       (|a_PiTVAc7Nw|)
       ()
       ((#%lambda #t
          (|z_PidSyF7Nw|)
          (|a_PiTVAc7Nw|)
          ((#%lambda #t
             (|uc-offset_PizOw68Nw|)
             (|z_PidSyF7Nw| |a_PiTVAc7Nw|)
             (#%lambda #t
               (|c_PiVKuz8Nw|)
               (|uc-offset_PizOw68Nw|
                 |z_PidSyF7Nw|
                 |a_PiTVAc7Nw|)
               ((#%lambda #t
                  (|cv_PifHs09Nw|)
                  (|c_PiVKuz8Nw|
                    |uc-offset_PizOw68Nw|
                    |z_PidSyF7Nw|
                    |a_PiTVAc7Nw|)
                  (#%if (#%if (>= |cv_PifHs09Nw| |a_PiTVAc7Nw|)
                          (<= |cv_PifHs09Nw| |z_PidSyF7Nw|)
                          #f)
                    (integer->char
                      (- |cv_PifHs09Nw| |uc-offset_PizOw68Nw|))
                    |c_PiVKuz8Nw|))
                (char->integer |c_PiVKuz8Nw|))))
           (- |a_PiTVAc7Nw| (char->integer #\A))))
        (char->integer #\z)))
     (char->integer #\a))))
(#%program
  ((|c1_PihwmnaNw| . 1)
   (> . 1)
   (|c2_PiXzoW9Nw| . 1)
   (map . 1)
   (char->integer . 3)
   (|args_PiBDqt9Nw| . 1)
   (apply . 1))
  ()
  (> map char->integer apply)
  (#%define char>?
    (#%lambda #t
      (|c1_PihwmnaNw|
        |c2_PiXzoW9Nw|
        .
        |args_PiBDqt9Nw|)
      ()
      (apply >
             (char->integer |c1_PihwmnaNw|)
             (char->integer |c2_PiXzoW9Nw|)
             (map char->integer |args_PiBDqt9Nw|)))))
(#%program
  ((|c2_PiZoihbNw| . 1)
   (map . 1)
   (char->integer . 3)
   (|args_PiDskQaNw| . 1)
   (< . 1)
   (|c1_PijlgKbNw| . 1)
   (apply . 1))
  ()
  (map char->integer < apply)
  (#%define char<?
    (#%lambda #t
      (|c1_PijlgKbNw|
        |c2_PiZoihbNw|
        .
        |args_PiDskQaNw|)
      ()
      (apply <
             (char->integer |c1_PijlgKbNw|)
             (char->integer |c2_PiZoihbNw|)
             (map char->integer |args_PiDskQaNw|)))))
(#%program
  ((eqv? . 1))
  ()
  ()
  (#%define char=? eqv?))
(#%program
  ((char>? . 1)
   (|c2_Pi_dcEcNw| . 2)
   (|c1_PiFhebcNw| . 2)
   (char=? . 1))
  ()
  (char>? char=?)
  (#%define char>=?
    (#%lambda #t
      (|c1_PiFhebcNw| |c2_Pi_dcEcNw|)
      ()
      (#%if (char>? |c1_PiFhebcNw| |c2_Pi_dcEcNw|)
        #t
        (char=? |c1_PiFhebcNw| |c2_Pi_dcEcNw|)))))
(#%program
  ((|c1_Pilaa5dNw| . 2)
   (|c2_PiH68ydNw| . 2)
   (char=? . 1)
   (char<? . 1))
  ()
  (char=? char<?)
  (#%define char<=?
    (#%lambda #t
      (|c1_Pilaa5dNw| |c2_PiH68ydNw|)
      ()
      (#%if (char<? |c1_Pilaa5dNw| |c2_PiH68ydNw|)
        #t
        (char=? |c1_Pilaa5dNw| |c2_PiH68ydNw|)))))
(#%program
  ((char>? . 1)
   (|c1_PiJX1VeNw| . 1)
   (|args_Pi136_dNw| . 1)
   (map . 1)
   (char-downcase . 3)
   (apply . 1)
   (|c2_Pin_3seNw| . 1))
  ()
  (char>? map char-downcase apply)
  (#%define char-ci>?
    (#%lambda #t
      (|c1_PiJX1VeNw|
        |c2_Pin_3seNw|
        .
        |args_Pi136_dNw|)
      ()
      (apply char>?
             (char-downcase |c1_PiJX1VeNw|)
             (char-downcase |c2_Pin_3seNw|)
             (map char-downcase |args_Pi136_dNw|)))))
(#%program
  ((|c2_PipQZOfNw| . 1)
   (|args_Pi3U_lfNw| . 1)
   (map . 1)
   (char<? . 1)
   (char-downcase . 3)
   (|c1_PiLMXfgNw| . 1)
   (apply . 1))
  ()
  (map char-downcase char<? apply)
  (#%define char-ci<?
    (#%lambda #t
      (|c1_PiLMXfgNw|
        |c2_PipQZOfNw|
        .
        |args_Pi3U_lfNw|)
      ()
      (apply char<?
             (char-downcase |c1_PiLMXfgNw|)
             (char-downcase |c2_PipQZOfNw|)
             (map char-downcase |args_Pi3U_lfNw|)))))
(#%program
  ((|args_Pi5JVIgNw| . 1)
   (|c2_PirFT9hNw| . 1)
   (map . 1)
   (char=? . 1)
   (char-downcase . 3)
   (|c1_PiNBRChNw| . 1)
   (apply . 1))
  ()
  (map char=? char-downcase apply)
  (#%define char-ci=?
    (#%lambda #t
      (|c1_PiNBRChNw|
        |c2_PirFT9hNw|
        .
        |args_Pi5JVIgNw|)
      ()
      (apply char=?
             (char-downcase |c1_PiNBRChNw|)
             (char-downcase |c2_PirFT9hNw|)
             (map char-downcase |args_Pi5JVIgNw|)))))
(#%program
  ((char-ci>? . 1)
   (|c1_Pi7yP3iNw| . 2)
   (char-ci=? . 1)
   (|c2_PituNwiNw| . 2))
  ()
  (char-ci>? char-ci=?)
  (#%define char-ci>=?
    (#%lambda #t
      (|c1_Pi7yP3iNw| |c2_PituNwiNw|)
      ()
      (#%if (char-ci>? |c1_Pi7yP3iNw| |c2_PituNwiNw|)
        #t
        (char-ci=? |c1_Pi7yP3iNw| |c2_PituNwiNw|)))))
(#%program
  ((|c2_Pi9nJqjNw| . 2)
   (char-ci=? . 1)
   (char-ci<? . 1)
   (|c1_PiPqLZiNw| . 2))
  ()
  (char-ci=? char-ci<?)
  (#%define char-ci<=?
    (#%lambda #t
      (|c1_PiPqLZiNw| |c2_Pi9nJqjNw|)
      ()
      (#%if (char-ci<? |c1_PiPqLZiNw| |c2_Pi9nJqjNw|)
        #t
        (char-ci=? |c1_PiPqLZiNw| |c2_Pi9nJqjNw|)))))
(#%program
  ((|c_PivjHTjNw| . 2) (char<? . 2))
  ()
  (char<?)
  (#%define char-alphabetic?
    (#%lambda #t
      (|c_PivjHTjNw|)
      ()
      (#%if (char<? #\@ |c_PivjHTjNw| #\[)
        #t
        (char<? #\` |c_PivjHTjNw| #\{)))))
(#%program
  ((|c_PiRfFkkNw| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-numeric?
    (#%lambda #t
      (|c_PiRfFkkNw|)
      ()
      (char<? #\/ |c_PiRfFkkNw| #\:))))
(#%program
  ((|c_PibcDNkNw| . 4) (char=? . 4))
  ()
  (char=?)
  (#%define char-whitespace?
    (#%lambda #t
      (|c_PibcDNkNw|)
      ()
      (#%if (char=? |c_PibcDNkNw| #\space)
        #t
        (#%if (char=? |c_PibcDNkNw| #\tab)
          #t
          (#%if (char=? |c_PibcDNkNw| #\newline)
            #t
            (char=? |c_PibcDNkNw| #\return)))))))
(#%program
  ((|c_Pix8BelNw| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-upper-case?
    (#%lambda #t
      (|c_Pix8BelNw|)
      ()
      (char<? #\@ |c_Pix8BelNw| #\[))))
(#%program
  ((|c_PiT4zHlNw| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-lower-case?
    (#%lambda #t
      (|c_PiT4zHlNw|)
      ()
      (char<? #\` |c_PiT4zHlNw| #\{))))
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
  ((|proc_PiDDijpNw| . 2)
   (string-ref . 1)
   (|n_PiZzgMpNw| . 4)
   (string-upcase . 1)
   (|str_PizZuBmNw| . 3)
   (char-downcase . 1)
   (|str_PifSqvnNw| . 3)
   (+ . 1)
   (|newstr_PiVVs2nNw| . 1)
   (string-set! . 1)
   (|newstr_PiBOoYnNw| . 1)
   (|l_PijwedqNw| . 2)
   (make-string . 2)
   (|strsrc_PiXKmpoNw| . 2)
   (|string-map_Pid1x8mNw| . 3)
   (< . 1)
   (string-length . 4)
   (string-downcase . 1)
   (|strdst_PihHkSoNw| . 3)
   (char-upcase . 1))
  ((string-upcase . 1)
   (|string-map_Pid1x8mNw| . 1)
   (string-downcase . 1))
  (string-set!
    string-ref
    make-string
    string-upcase
    char-downcase
    +
    <
    string-length
    string-downcase
    char-upcase)
  (#%letrec #t
    ((|string-map_Pid1x8mNw|
       (#%lambda #t
         (|strsrc_PiXKmpoNw|
           |strdst_PihHkSoNw|
           |proc_PiDDijpNw|
           |n_PiZzgMpNw|
           |l_PijwedqNw|)
         (|string-map_Pid1x8mNw|)
         (#%if (< |n_PiZzgMpNw| |l_PijwedqNw|)
           (#%begin
             (string-set!
               |strdst_PihHkSoNw|
               |n_PiZzgMpNw|
               (|proc_PiDDijpNw|
                 (string-ref |strsrc_PiXKmpoNw| |n_PiZzgMpNw|)))
             (|string-map_Pid1x8mNw|
               |strsrc_PiXKmpoNw|
               |strdst_PihHkSoNw|
               |proc_PiDDijpNw|
               (+ |n_PiZzgMpNw| 1)
               |l_PijwedqNw|))
           |strdst_PihHkSoNw|))))
    ()
    (#%begin
      (#%set! string-downcase
        (#%lambda #t
          (|str_PizZuBmNw|)
          (|string-map_Pid1x8mNw|)
          ((#%lambda #t
             (|newstr_PiVVs2nNw|)
             (|str_PizZuBmNw| |string-map_Pid1x8mNw|)
             (|string-map_Pid1x8mNw|
               |str_PizZuBmNw|
               |newstr_PiVVs2nNw|
               char-downcase
               0
               (string-length |str_PizZuBmNw|)))
           (make-string (string-length |str_PizZuBmNw|)))))
      (#%set! string-upcase
        (#%lambda #t
          (|str_PifSqvnNw|)
          (|string-map_Pid1x8mNw|)
          ((#%lambda #t
             (|newstr_PiBOoYnNw|)
             (|str_PifSqvnNw| |string-map_Pid1x8mNw|)
             (|string-map_Pid1x8mNw|
               |str_PifSqvnNw|
               |newstr_PiBOoYnNw|
               char-upcase
               0
               (string-length |str_PifSqvnNw|)))
           (make-string (string-length |str_PifSqvnNw|))))))))
(#%program
  ((equal? . 1))
  ()
  ()
  (#%define string=? equal?))
(#%program
  ((not . 1)
   (char>? . 1)
   (|s<?_PiFscGqNw| . 2)
   (|s1_PiHh61sNw| . 3)
   (car . 2)
   (|s1_Pi_oa7rNw| . 1)
   (cdr . 2)
   (|c2_PiJ60otNw| . 2)
   (|c1_Pina2XsNw| . 2)
   (null? . 3)
   (string->list . 2)
   (char<? . 1)
   (|s2_Pi1e4usNw| . 4)
   (|s2_Pill8ArNw| . 1))
  ((|s<?_PiFscGqNw| . 1))
  (not char>? cdr null? car char<? string->list)
  (#%define string<?
    (#%letrec #t
      ((|s<?_PiFscGqNw|
         (#%lambda #t
           (|s1_PiHh61sNw| |s2_Pi1e4usNw|)
           (|s<?_PiFscGqNw|)
           (#%if (null? |s1_PiHh61sNw|)
             (#%if (null? |s2_Pi1e4usNw|) #f #t)
             (#%if (null? |s2_Pi1e4usNw|)
               #f
               ((#%lambda #t
                  (|c1_Pina2XsNw| |c2_PiJ60otNw|)
                  (|s1_PiHh61sNw| |s2_Pi1e4usNw| |s<?_PiFscGqNw|)
                  (#%if (char<? |c1_Pina2XsNw| |c2_PiJ60otNw|)
                    #t
                    (#%if (char>? |c1_Pina2XsNw| |c2_PiJ60otNw|)
                      #f
                      (|s<?_PiFscGqNw|
                        (cdr |s1_PiHh61sNw|)
                        (cdr |s2_Pi1e4usNw|)))))
                (car |s1_PiHh61sNw|)
                (car |s2_Pi1e4usNw|)))))))
      ()
      (#%lambda #t
        (|s1_Pi_oa7rNw| |s2_Pill8ArNw|)
        (|s<?_PiFscGqNw|)
        (|s<?_PiFscGqNw|
          (string->list |s1_Pi_oa7rNw|)
          (string->list |s2_Pill8ArNw|))))))
(#%program
  ((not . 1)
   (|s2_PiLXVKuNw| . 1)
   (char>? . 1)
   (car . 2)
   (|s1_Pi5UTbvNw| . 4)
   (|c1_PiNMP5wNw| . 2)
   (|s>?_Pi33-QtNw| . 2)
   (cdr . 2)
   (|s2_PirQREvNw| . 3)
   (null? . 3)
   (|c2_Pi7JNywNw| . 2)
   (string->list . 2)
   (char<? . 1)
   (|s1_Pip_XhuNw| . 1))
  ((|s>?_Pi33-QtNw| . 1))
  (not char>? cdr null? car char<? string->list)
  (#%define string>?
    (#%letrec #t
      ((|s>?_Pi33-QtNw|
         (#%lambda #t
           (|s1_Pi5UTbvNw| |s2_PirQREvNw|)
           (|s>?_Pi33-QtNw|)
           (#%if (null? |s2_PirQREvNw|)
             (#%if (null? |s1_Pi5UTbvNw|) #f #t)
             (#%if (null? |s1_Pi5UTbvNw|)
               #f
               ((#%lambda #t
                  (|c1_PiNMP5wNw| |c2_Pi7JNywNw|)
                  (|s1_Pi5UTbvNw| |s2_PirQREvNw| |s>?_Pi33-QtNw|)
                  (#%if (char>? |c1_PiNMP5wNw| |c2_Pi7JNywNw|)
                    #t
                    (#%if (char<? |c1_PiNMP5wNw| |c2_Pi7JNywNw|)
                      #f
                      (|s>?_Pi33-QtNw|
                        (cdr |s1_Pi5UTbvNw|)
                        (cdr |s2_PirQREvNw|)))))
                (car |s1_Pi5UTbvNw|)
                (car |s2_PirQREvNw|)))))))
      ()
      (#%lambda #t
        (|s1_Pip_XhuNw| |s2_PiLXVKuNw|)
        (|s>?_Pi33-QtNw|)
        (|s>?_Pi33-QtNw|
          (string->list |s1_Pip_XhuNw|)
          (string->list |s2_PiLXVKuNw|))))))
(#%program
  ((string=? . 1)
   (|s1_PitFL_wNw| . 2)
   (string<? . 1)
   (|s2_PiPBJsxNw| . 2))
  ()
  (string=? string<?)
  (#%define string<=?
    (#%lambda #t
      (|s1_PitFL_wNw| |s2_PiPBJsxNw|)
      ()
      (#%if (string<? |s1_PitFL_wNw| |s2_PiPBJsxNw|)
        #t
        (string=? |s1_PitFL_wNw| |s2_PiPBJsxNw|)))))
(#%program
  ((string=? . 1)
   (|s2_PivuFmyNw| . 2)
   (|s1_Pi9yHVxNw| . 2)
   (string>? . 1))
  ()
  (string=? string>?)
  (#%define string>=?
    (#%lambda #t
      (|s1_Pi9yHVxNw| |s2_PivuFmyNw|)
      ()
      (#%if (string>? |s1_Pi9yHVxNw| |s2_PivuFmyNw|)
        #t
        (string=? |s1_Pi9yHVxNw| |s2_PivuFmyNw|)))))
(#%program
  ((|s1_PiRqDPyNw| . 1)
   (string=? . 1)
   (string-downcase . 2)
   (|s2_PibnBgzNw| . 1))
  ()
  (string=? string-downcase)
  (#%define string-ci=?
    (#%lambda #t
      (|s1_PiRqDPyNw| |s2_PibnBgzNw|)
      ()
      (string=?
        (string-downcase |s1_PiRqDPyNw|)
        (string-downcase |s2_PibnBgzNw|)))))
(#%program
  ((|s1_PixjzJzNw| . 1)
   (string-downcase . 2)
   (string<? . 1)
   (|s2_PiTfxaANw| . 1))
  ()
  (string-downcase string<?)
  (#%define string-ci<?
    (#%lambda #t
      (|s1_PixjzJzNw| |s2_PiTfxaANw|)
      ()
      (string<?
        (string-downcase |s1_PixjzJzNw|)
        (string-downcase |s2_PiTfxaANw|)))))
(#%program
  ((string>? . 1)
   (|s1_PidcvDANw| . 1)
   (string-downcase . 2)
   (|s2_Piz8t4BNw| . 1))
  ()
  (string>? string-downcase)
  (#%define string-ci>?
    (#%lambda #t
      (|s1_PidcvDANw| |s2_Piz8t4BNw|)
      ()
      (string>?
        (string-downcase |s1_PidcvDANw|)
        (string-downcase |s2_Piz8t4BNw|)))))
(#%program
  ((string>=? . 1)
   (|s2_Pif1p-BNw| . 1)
   (string-downcase . 2)
   (|s1_PiV4rxBNw| . 1))
  ()
  (string>=? string-downcase)
  (#%define string-ci>=?
    (#%lambda #t
      (|s1_PiV4rxBNw| |s2_Pif1p-BNw|)
      ()
      (string>=?
        (string-downcase |s1_PiV4rxBNw|)
        (string-downcase |s2_Pif1p-BNw|)))))
(#%program
  ((string<=? . 1)
   (|s1_PiBZmrCNw| . 1)
   (|s2_PiXVkUCNw| . 1)
   (string-downcase . 2))
  ()
  (string<=? string-downcase)
  (#%define string-ci<=?
    (#%lambda #t
      (|s1_PiBZmrCNw| |s2_PiXVkUCNw|)
      ()
      (string<=?
        (string-downcase |s1_PiBZmrCNw|)
        (string-downcase |s2_PiXVkUCNw|)))))
(#%program
  ((|str_PiDOgODNw| . 1)
   (string-ref . 1)
   (|s_Pi1p2ZGNw| . 3)
   (+ . 2)
   (- . 1)
   (|start_PiZKefENw| . 2)
   (|dstr_Pilw63GNw| . 2)
   (string-set! . 1)
   (|e_Pinl0qHNw| . 2)
   (|fill-string_PihSilDNw| . 2)
   (make-string . 1)
   (|newstr_PiFDa9FNw| . 2)
   (< . 1)
   (|sstr_Pi_z8CFNw| . 2)
   (|n_PiHs4wGNw| . 2)
   (|end_PijHcIENw| . 2))
  ((|fill-string_PihSilDNw| . 1))
  (string-set! string-ref make-string + < -)
  (#%define substring
    (#%letrec #t
      ((|fill-string_PihSilDNw|
         (#%lambda #t
           (|sstr_Pi_z8CFNw|
             |dstr_Pilw63GNw|
             |n_PiHs4wGNw|
             |s_Pi1p2ZGNw|
             |e_Pinl0qHNw|)
           (|fill-string_PihSilDNw|)
           (#%if (< |s_Pi1p2ZGNw| |e_Pinl0qHNw|)
             (#%begin
               (string-set!
                 |dstr_Pilw63GNw|
                 |n_PiHs4wGNw|
                 (string-ref |sstr_Pi_z8CFNw| |s_Pi1p2ZGNw|))
               (|fill-string_PihSilDNw|
                 |sstr_Pi_z8CFNw|
                 |dstr_Pilw63GNw|
                 (+ |n_PiHs4wGNw| 1)
                 (+ |s_Pi1p2ZGNw| 1)
                 |e_Pinl0qHNw|))
             #!void))))
      ()
      (#%lambda #t
        (|str_PiDOgODNw|
          |start_PiZKefENw|
          |end_PijHcIENw|)
        (|fill-string_PihSilDNw|)
        ((#%lambda #t
           (|newstr_PiFDa9FNw|)
           (|str_PiDOgODNw|
             |start_PiZKefENw|
             |end_PijHcIENw|
             |fill-string_PihSilDNw|)
           (#%begin
             (|fill-string_PihSilDNw|
               |str_PiDOgODNw|
               |newstr_PiFDa9FNw|
               0
               |start_PiZKefENw|
               |end_PijHcIENw|)
             |newstr_PiFDa9FNw|))
         (make-string
           (- |end_PijHcIENw| |start_PiZKefENw|)))))))
(#%program
  ((zero? . 1)
   (cdr . 1)
   (|n_Pi3eYjINw| . 2)
   (car . 1)
   (- . 1)
   (|list_PiJh-SHNw| . 2)
   (list-ref . 1))
  ()
  (cdr zero? car - list-ref)
  (#%define list-ref
    (#%lambda #t
      (|list_PiJh-SHNw| |n_Pi3eYjINw|)
      ()
      (#%if (zero? |n_Pi3eYjINw|)
        (car |list_PiJh-SHNw|)
        (list-ref
          (cdr |list_PiJh-SHNw|)
          (- |n_Pi3eYjINw| 1))))))
(#%program
  ((call-with-current-continuation . 1)
   (apply . 1)
   (|k_PiL6UdJNw| . 1)
   (|args_PipaWMINw| . 1))
  ()
  (call-with-current-continuation apply)
  (#%define values
    (#%lambda #t
      |args_PipaWMINw|
      ()
      (call-with-current-continuation
        (#%lambda #t
          (|k_PiL6UdJNw|)
          (|args_PipaWMINw|)
          (apply |k_PiL6UdJNw| |args_PipaWMINw|))))))
