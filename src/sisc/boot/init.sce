(#%program () () () #!void)
(#%program
  ((for-each . 1)
   (|proc_xtH8cI7yE| . 2)
   (map-cdr . 1)
   (|lists_xt_fgO6yE| . 4)
   (map-car . 1)
   (|ls1_xtlcef7yE| . 2)
   (cons . 1)
   (null? . 1)
   (apply . 2))
  ((|lists_xt_fgO6yE| . 1))
  (for-each map-cdr map-car cons null? apply)
  (#%define for-each
    (#%lambda #t
      (|proc_xtH8cI7yE|
        |ls1_xtlcef7yE|
        .
        |lists_xt_fgO6yE|)
      ()
      (#%if (null? |ls1_xtlcef7yE|)
        #!void
        (#%begin
          (#%set! |lists_xt_fgO6yE|
            (cons |ls1_xtlcef7yE| |lists_xt_fgO6yE|))
          (apply |proc_xtH8cI7yE|
                 (map-car |lists_xt_fgO6yE|))
          (apply for-each
                 |proc_xtH8cI7yE|
                 (map-cdr |lists_xt_fgO6yE|)))))))
(#%program
  ((eq? . 1) (|x_xt15a98yE| . 1))
  ()
  (eq?)
  (#%define eof-object?
    (#%lambda #t
      (|x_xt15a98yE|)
      ()
      (eq? |x_xt15a98yE| #!eof))))
(#%program
  ((|x_xtn18C8yE| . 1))
  ()
  ()
  (#%define not
    (#%lambda #t
      (|x_xtn18C8yE|)
      ()
      (#%if |x_xtn18C8yE| #f #t))))
(#%program
  ((|port_xtJZ539yE| . 1)
   (display . 1)
   (apply . 1))
  ()
  (display apply)
  (#%define newline
    (#%lambda #t
      |port_xtJZ539yE|
      ()
      (apply display #\newline |port_xtJZ539yE|))))
(#%program
  ((|ls_xtpS1Z9yE| . 1)
   (cdr . 1)
   (|acc_xt5LZSayE| . 2)
   (|iter_xt3W3w9yE| . 2)
   (car . 1)
   (|ls_xtLO_payE| . 3)
   (cons . 1)
   (null? . 1))
  ((|iter_xt3W3w9yE| . 1))
  (cdr car cons null?)
  (#%define reverse
    (#%letrec #t
      ((|iter_xt3W3w9yE|
         (#%lambda #t
           (|ls_xtLO_payE| |acc_xt5LZSayE|)
           (|iter_xt3W3w9yE|)
           (#%if (null? |ls_xtLO_payE|)
             |acc_xt5LZSayE|
             (|iter_xt3W3w9yE|
               (cdr |ls_xtLO_payE|)
               (cons (car |ls_xtLO_payE|) |acc_xt5LZSayE|))))))
      ()
      (#%lambda #t
        (|ls_xtpS1Z9yE|)
        (|iter_xt3W3w9yE|)
        (|iter_xt3W3w9yE| |ls_xtpS1Z9yE| ())))))
(#%program
  ((cdr . 1)
   (|r_xttwRGcyE| . 2)
   (|s_xtNDVMbyE| . 1)
   (set-cdr! . 1)
   (|iter_xtrHXjbyE| . 2)
   (|s_xt7ATdcyE| . 4)
   (|d_xtPsP7dyE| . 1)
   (null? . 1))
  ((|iter_xtrHXjbyE| . 1))
  (cdr set-cdr! null?)
  (#%define reverse!
    (#%letrec #t
      ((|iter_xtrHXjbyE|
         (#%lambda #t
           (|s_xt7ATdcyE| |r_xttwRGcyE|)
           (|iter_xtrHXjbyE|)
           (#%if (null? |s_xt7ATdcyE|)
             |r_xttwRGcyE|
             ((#%lambda #t
                (|d_xtPsP7dyE|)
                (|s_xt7ATdcyE| |r_xttwRGcyE| |iter_xtrHXjbyE|)
                (#%begin
                  (set-cdr! |s_xt7ATdcyE| |r_xttwRGcyE|)
                  (|iter_xtrHXjbyE| |d_xtPsP7dyE| |s_xt7ATdcyE|)))
              (cdr |s_xt7ATdcyE|))))))
      ()
      (#%lambda #t
        (|s_xtNDVMbyE|)
        (|iter_xtrHXjbyE|)
        (|iter_xtrHXjbyE| |s_xtNDVMbyE| ())))))
(#%program
  ((cdr . 1)
   (|ls_xt9pNAdyE| . 3)
   (caar . 1)
   (map-car . 1)
   (cons . 1)
   (null? . 1))
  ()
  (cdr caar map-car cons null?)
  (#%define map-car
    (#%lambda #t
      (|ls_xt9pNAdyE|)
      ()
      (#%if (null? |ls_xt9pNAdyE|)
        ()
        (cons (caar |ls_xt9pNAdyE|)
              (map-car (cdr |ls_xt9pNAdyE|)))))))
(#%program
  ((cdr . 1)
   (cdar . 1)
   (map-cdr . 1)
   (|ls_xtvlL1eyE| . 3)
   (cons . 1)
   (null? . 1))
  ()
  (cdr cdar map-cdr cons null?)
  (#%define map-cdr
    (#%lambda #t
      (|ls_xtvlL1eyE|)
      ()
      (#%if (null? |ls_xtvlL1eyE|)
        ()
        (cons (cdar |ls_xtvlL1eyE|)
              (map-cdr (cdr |ls_xtvlL1eyE|)))))))
(#%program
  ((|list1_xtXMqziyE| . 3)
   (|map1_xtRhJueyE| . 2)
   (|proc_xtBQs6iyE| . 2)
   (map-cdr . 1)
   (|lists_xthJo0jyE| . 2)
   (|proc_xtd3BigyE| . 2)
   (|list1_xtT6DRfyE| . 2)
   (|proc_xtz_yLgyE| . 2)
   (apply . 1)
   (cdr . 2)
   (|list_xtVXwchyE| . 3)
   (|lists_xtxaFofyE| . 2)
   (|loop_xtbeHXeyE| . 2)
   (|c_xtDFmtjyE| . 2)
   (|acc_xtfUuFhyE| . 2)
   (map-car . 1)
   (car . 2)
   (reverse . 2)
   (cons . 2)
   (null? . 3))
  ((|map1_xtRhJueyE| . 1) (|loop_xtbeHXeyE| . 1))
  (cdr map-cdr
       map-car
       car
       reverse
       cons
       null?
       apply)
  (#%define map
    (#%letrec #t
      ((|map1_xtRhJueyE|
         (#%lambda #t
           (|proc_xtz_yLgyE|
             |list_xtVXwchyE|
             |acc_xtfUuFhyE|)
           (|map1_xtRhJueyE|)
           (#%if (null? |list_xtVXwchyE|)
             (reverse |acc_xtfUuFhyE|)
             (|map1_xtRhJueyE|
               |proc_xtz_yLgyE|
               (cdr |list_xtVXwchyE|)
               (cons (|proc_xtz_yLgyE| (car |list_xtVXwchyE|))
                     |acc_xtfUuFhyE|)))))
       (|loop_xtbeHXeyE|
         (#%lambda #t
           (|proc_xtBQs6iyE|
             |list1_xtXMqziyE|
             |lists_xthJo0jyE|
             |c_xtDFmtjyE|)
           (|loop_xtbeHXeyE|)
           (#%if (null? |list1_xtXMqziyE|)
             (reverse |c_xtDFmtjyE|)
             (|loop_xtbeHXeyE|
               |proc_xtBQs6iyE|
               (cdr |list1_xtXMqziyE|)
               (map-cdr |lists_xthJo0jyE|)
               (cons (apply |proc_xtBQs6iyE|
                            (car |list1_xtXMqziyE|)
                            (map-car |lists_xthJo0jyE|))
                     |c_xtDFmtjyE|))))))
      ()
      (#%lambda #t
        (|proc_xtd3BigyE|
          |list1_xtT6DRfyE|
          .
          |lists_xtxaFofyE|)
        (|map1_xtRhJueyE| |loop_xtbeHXeyE|)
        (#%if (null? |lists_xtxaFofyE|)
          (|map1_xtRhJueyE|
            |proc_xtd3BigyE|
            |list1_xtT6DRfyE|
            ())
          (|loop_xtbeHXeyE|
            |proc_xtd3BigyE|
            |list1_xtT6DRfyE|
            |lists_xtxaFofyE|
            ()))))))
(#%program
  ((|g_xtjyinkyE| . 1)
   (|f_xtZBkWjyE| . 1)
   (|x_xtFugQkyE| . 1))
  ()
  ()
  (#%define compose2
    (#%lambda #t
      (|f_xtZBkWjyE| |g_xtjyinkyE|)
      ()
      (#%lambda #t
        (|x_xtFugQkyE|)
        (|f_xtZBkWjyE| |g_xtjyinkyE|)
        (|f_xtZBkWjyE| (|g_xtjyinkyE| |x_xtFugQkyE|))))))
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
  ((eq? . 2)
   (|assn_xt_qehlyE| . 4)
   (|obj_xtbpFqtyE| . 2)
   (assoc . 1)
   (|alist_xtvwJwsyE| . 4)
   (memv . 1)
   (equal? . 2)
   (|list_xt5WXlpyE| . 1)
   (member . 1)
   (assq . 1)
   (|list_xttHP9ryE| . 1)
   (caar . 1)
   (memq . 1)
   (car . 2)
   (|obj_xtrSVOpyE| . 1)
   (|memn_xtlncKlyE| . 4)
   (|alist_xtJ84ynyE| . 1)
   (eqv? . 2)
   (|obj_xt9AL3syE| . 2)
   (assv . 1)
   (|n_xtRsHZsyE| . 2)
   (|list_xtxlDTtyE| . 4)
   (|obj_xt352_nyE| . 1)
   (|obj_xt7LRIqyE| . 1)
   (|alist_xt1g8EmyE| . 1)
   (cdr . 2)
   (|obj_xtHjabmyE| . 1)
   (|obj_xtLZZUoyE| . 1)
   (|n_xtPDNCryE| . 2)
   (|alist_xtp10soyE| . 1)
   (|list_xtNOTfqyE| . 1)
   (|obj_xtnc65nyE| . 1)
   (null? . 2))
  ((|assn_xt_qehlyE| . 1)
   (member . 1)
   (assq . 1)
   (assv . 1)
   (assoc . 1)
   (memq . 1)
   (|memn_xtlncKlyE| . 1)
   (memv . 1))
  (eq? assoc
       assv
       memv
       equal?
       member
       cdr
       assq
       caar
       memq
       car
       null?
       eqv?)
  (#%letrec #t
    ((|assn_xt_qehlyE|
       (#%lambda #t
         (|n_xtPDNCryE| |obj_xt9AL3syE| |alist_xtvwJwsyE|)
         (|assn_xt_qehlyE|)
         (#%if (null? |alist_xtvwJwsyE|)
           #f
           (#%if (|n_xtPDNCryE|
                   (caar |alist_xtvwJwsyE|)
                   |obj_xt9AL3syE|)
             (car |alist_xtvwJwsyE|)
             (|assn_xt_qehlyE|
               |n_xtPDNCryE|
               |obj_xt9AL3syE|
               (cdr |alist_xtvwJwsyE|))))))
     (|memn_xtlncKlyE|
       (#%lambda #t
         (|n_xtRsHZsyE| |obj_xtbpFqtyE| |list_xtxlDTtyE|)
         (|memn_xtlncKlyE|)
         (#%if (null? |list_xtxlDTtyE|)
           #f
           (#%if (|n_xtRsHZsyE|
                   (car |list_xtxlDTtyE|)
                   |obj_xtbpFqtyE|)
             |list_xtxlDTtyE|
             (|memn_xtlncKlyE|
               |n_xtRsHZsyE|
               |obj_xtbpFqtyE|
               (cdr |list_xtxlDTtyE|)))))))
    ()
    (#%begin
      (#%set! assq
        (#%lambda #t
          (|obj_xtHjabmyE| |alist_xt1g8EmyE|)
          (|assn_xt_qehlyE|)
          (|assn_xt_qehlyE|
            eq?
            |obj_xtHjabmyE|
            |alist_xt1g8EmyE|)))
      (#%set! assv
        (#%lambda #t
          (|obj_xtnc65nyE| |alist_xtJ84ynyE|)
          (|assn_xt_qehlyE|)
          (|assn_xt_qehlyE|
            eqv?
            |obj_xtnc65nyE|
            |alist_xtJ84ynyE|)))
      (#%set! assoc
        (#%lambda #t
          (|obj_xt352_nyE| |alist_xtp10soyE|)
          (|assn_xt_qehlyE|)
          (|assn_xt_qehlyE|
            equal?
            |obj_xt352_nyE|
            |alist_xtp10soyE|)))
      (#%set! memq
        (#%lambda #t
          (|obj_xtLZZUoyE| |list_xt5WXlpyE|)
          (|memn_xtlncKlyE|)
          (|memn_xtlncKlyE|
            eq?
            |obj_xtLZZUoyE|
            |list_xt5WXlpyE|)))
      (#%set! memv
        (#%lambda #t
          (|obj_xtrSVOpyE| |list_xtNOTfqyE|)
          (|memn_xtlncKlyE|)
          (|memn_xtlncKlyE|
            eqv?
            |obj_xtrSVOpyE|
            |list_xtNOTfqyE|)))
      (#%set! member
        (#%lambda #t
          (|obj_xt7LRIqyE| |list_xttHP9ryE|)
          (|memn_xtlncKlyE|)
          (|memn_xtlncKlyE|
            equal?
            |obj_xt7LRIqyE|
            |list_xttHP9ryE|))))))
(#%program
  ((cdr . 1) (compose2 . 1) (car . 1))
  ()
  ()
  (#%define cadr (compose2 car cdr)))
(#%program
  ((cdr . 1) (compose2 . 1) (car . 1))
  ()
  ()
  (#%define cdar (compose2 cdr car)))
(#%program
  ((cdr . 2) (compose2 . 1))
  ()
  ()
  (#%define cddr (compose2 cdr cdr)))
(#%program
  ((compose2 . 1) (car . 2))
  ()
  ()
  (#%define caar (compose2 car car)))
(#%program
  ((caar . 1) (compose2 . 1) (car . 1))
  ()
  ()
  (#%define caaar (compose2 car caar)))
(#%program
  ((compose2 . 1) (cadr . 1) (car . 1))
  ()
  ()
  (#%define caadr (compose2 car cadr)))
(#%program
  ((cdar . 1) (compose2 . 1) (car . 1))
  ()
  ()
  (#%define cadar (compose2 car cdar)))
(#%program
  ((compose2 . 1) (car . 1) (cddr . 1))
  ()
  ()
  (#%define caddr (compose2 car cddr)))
(#%program
  ((cdr . 1) (caar . 1) (compose2 . 1))
  ()
  ()
  (#%define cdaar (compose2 cdr caar)))
(#%program
  ((cdr . 1) (compose2 . 1) (cadr . 1))
  ()
  ()
  (#%define cdadr (compose2 cdr cadr)))
(#%program
  ((cdr . 1) (cdar . 1) (compose2 . 1))
  ()
  ()
  (#%define cddar (compose2 cdr cdar)))
(#%program
  ((cdr . 1) (compose2 . 1) (cddr . 1))
  ()
  ()
  (#%define cdddr (compose2 cdr cddr)))
(#%program
  ((caaar . 1) (compose2 . 1) (car . 1))
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
  ((compose2 . 1) (car . 1) (caddr . 1))
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
  ((compose2 . 1) (car . 1) (cddar . 1))
  ()
  ()
  (#%define caddar (compose2 car cddar)))
(#%program
  ((cdddr . 1) (compose2 . 1) (car . 1))
  ()
  ()
  (#%define cadddr (compose2 car cdddr)))
(#%program
  ((cdr . 1) (caaar . 1) (compose2 . 1))
  ()
  ()
  (#%define cdaaar (compose2 cdr caaar)))
(#%program
  ((cdr . 1) (compose2 . 1) (caadr . 1))
  ()
  ()
  (#%define cdaadr (compose2 cdr caadr)))
(#%program
  ((cdr . 1) (compose2 . 1) (cadar . 1))
  ()
  ()
  (#%define cdadar (compose2 cdr cadar)))
(#%program
  ((cdr . 1) (compose2 . 1) (caddr . 1))
  ()
  ()
  (#%define cdaddr (compose2 cdr caddr)))
(#%program
  ((cdr . 1) (compose2 . 1) (cdaar . 1))
  ()
  ()
  (#%define cddaar (compose2 cdr cdaar)))
(#%program
  ((cdr . 1) (compose2 . 1) (cdadr . 1))
  ()
  ()
  (#%define cddadr (compose2 cdr cdadr)))
(#%program
  ((cdr . 1) (compose2 . 1) (cddar . 1))
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
   (|ls1_xtThBkuyE| . 3)
   (|ls2_xtdezNuyE| . 2)
   (car . 1)
   (cons . 1)
   (null? . 1))
  ()
  (cdr append2 car cons null?)
  (#%define append2
    (#%lambda #t
      (|ls1_xtThBkuyE| |ls2_xtdezNuyE|)
      ()
      (#%if (null? |ls1_xtThBkuyE|)
        |ls2_xtdezNuyE|
        (cons (car |ls1_xtThBkuyE|)
              (append2 (cdr |ls1_xtThBkuyE|) |ls2_xtdezNuyE|))))))
(#%program
  ((append2 . 1))
  ()
  ()
  (#%define append append2))
(#%program
  ((|l2s_xtzaxevyE| . 2)
   (cdr . 1)
   (string-set! . 1)
   (+ . 1)
   (|l_xtf3t8wyE| . 3)
   (|n_xtXXo2xyE| . 2)
   (|s_xtB_qBwyE| . 3)
   (car . 1)
   (length . 1)
   (null? . 1)
   (|l_xtV6vHvyE| . 2)
   (make-string . 1))
  ((|l2s_xtzaxevyE| . 1))
  (cdr string-set! + car length null? make-string)
  (#%define list->string
    (#%letrec #t
      ((|l2s_xtzaxevyE|
         (#%lambda #t
           (|l_xtf3t8wyE| |s_xtB_qBwyE| |n_xtXXo2xyE|)
           (|l2s_xtzaxevyE|)
           (#%if (null? |l_xtf3t8wyE|)
             |s_xtB_qBwyE|
             (#%begin
               (string-set!
                 |s_xtB_qBwyE|
                 |n_xtXXo2xyE|
                 (car |l_xtf3t8wyE|))
               (|l2s_xtzaxevyE|
                 (cdr |l_xtf3t8wyE|)
                 |s_xtB_qBwyE|
                 (+ |n_xtXXo2xyE| 1)))))))
      ()
      (#%lambda #t
        (|l_xtV6vHvyE|)
        (|l2s_xtzaxevyE|)
        (|l2s_xtzaxevyE|
          |l_xtV6vHvyE|
          (make-string (length |l_xtV6vHvyE|))
          0)))))
(#%program
  ((|s_xtZMipyyE| . 2)
   (string-ref . 1)
   (- . 2)
   (|s_xtDQkYxyE| . 2)
   (|h_xtjJgSyyE| . 2)
   (|s2l_xthUmvxyE| . 2)
   (< . 1)
   (|n_xtFFejzyE| . 3)
   (cons . 1)
   (string-length . 1))
  ((|s2l_xthUmvxyE| . 1))
  (string-ref - < cons string-length)
  (#%define string->list
    (#%letrec #t
      ((|s2l_xthUmvxyE|
         (#%lambda #t
           (|s_xtZMipyyE| |h_xtjJgSyyE| |n_xtFFejzyE|)
           (|s2l_xthUmvxyE|)
           (#%if (< |n_xtFFejzyE| 0)
             |h_xtjJgSyyE|
             (|s2l_xthUmvxyE|
               |s_xtZMipyyE|
               (cons (string-ref |s_xtZMipyyE| |n_xtFFejzyE|)
                     |h_xtjJgSyyE|)
               (- |n_xtFFejzyE| 1))))))
      ()
      (#%lambda #t
        (|s_xtDQkYxyE|)
        (|s2l_xthUmvxyE|)
        (|s2l_xthUmvxyE|
          |s_xtDQkYxyE|
          ()
          (- (string-length |s_xtDQkYxyE|) 1))))))
(#%program
  ((|l2v_xt_BcMzyE| . 2)
   (+ . 1)
   (length . 1)
   (vector-set! . 1)
   (|l_xtlyadAyE| . 4)
   (cdr . 1)
   (make-vector . 1)
   (car . 1)
   (error . 1)
   (|n_xtnn4AByE| . 2)
   (|v_xt1r67ByE| . 3)
   (|l_xtHu8GAyE| . 3)
   (null? . 1)
   (proper-list? . 1))
  ((|l2v_xt_BcMzyE| . 1))
  (cdr +
       make-vector
       car
       error
       length
       null?
       vector-set!
       proper-list?)
  (#%define list->vector
    (#%letrec #t
      ((|l2v_xt_BcMzyE|
         (#%lambda #t
           (|l_xtHu8GAyE| |v_xt1r67ByE| |n_xtnn4AByE|)
           (|l2v_xt_BcMzyE|)
           (#%if (null? |l_xtHu8GAyE|)
             |v_xt1r67ByE|
             (#%begin
               (vector-set!
                 |v_xt1r67ByE|
                 |n_xtnn4AByE|
                 (car |l_xtHu8GAyE|))
               (|l2v_xt_BcMzyE|
                 (cdr |l_xtHu8GAyE|)
                 |v_xt1r67ByE|
                 (+ |n_xtnn4AByE| 1)))))))
      ()
      (#%lambda #t
        (|l_xtlyadAyE|)
        (|l2v_xt_BcMzyE|)
        (#%if (proper-list? |l_xtlyadAyE|)
          (|l2v_xt_BcMzyE|
            |l_xtlyadAyE|
            (make-vector (length |l_xtlyadAyE|))
            0)
          (error (#%quote list->vector)
                 "can only convert a proper list."
                 |l_xtlyadAyE|))))))
(#%program
  ((|elems_xtJj21CyE| . 1) (list->vector . 1))
  ()
  (list->vector)
  (#%define vector
    (#%lambda #t
      |elems_xtJj21CyE|
      ()
      (list->vector |elems_xtJj21CyE|))))
(#%program
  ((list->string . 1) (|elems_xt3g0uCyE| . 1))
  ()
  (list->string)
  (#%define string
    (#%lambda #t
      |elems_xt3g0uCyE|
      ()
      (list->string |elems_xt3g0uCyE|))))
(#%program
  ((_make-parameter . 1))
  ()
  ()
  (#%define current-url (_make-parameter "file:.")))
(#%program
  ((current-url . 3)
   (|rest_xtpc-WCyE| . 2)
   (string-append . 1)
   (normalize-url . 2)
   (string-ref . 1)
   (- . 1)
   (|v_xtL8YnDyE| . 4)
   (car . 1)
   (|l_xt55WQDyE| . 1)
   (string-length . 1)
   (null? . 1)
   (eqv? . 1))
  ()
  (current-url
    string-append
    normalize-url
    -
    string-ref
    car
    string-length
    null?
    eqv?)
  (#%define current-directory
    (#%lambda #t
      |rest_xtpc-WCyE|
      ()
      (#%if (null? |rest_xtpc-WCyE|)
        (normalize-url (current-url) ".")
        (current-url
          (normalize-url
            (current-url)
            ((#%lambda #t
               (|v_xtL8YnDyE|)
               ()
               ((#%lambda #t
                  (|l_xt55WQDyE|)
                  (|v_xtL8YnDyE|)
                  (#%if (eqv? (string-ref |v_xtL8YnDyE| (- |l_xt55WQDyE| 1))
                              #\/)
                    |v_xtL8YnDyE|
                    (string-append |v_xtL8YnDyE| "/")))
                (string-length |v_xtL8YnDyE|)))
             (car |rest_xtpc-WCyE|))))))))
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
  ((string-downcase . 1)
   (|*file-handlers*_xtr1UhEyE| . 4)
   (|extension_xtNZRKEyE| . 2)
   (load . 1)
   (not . 1)
   (|_load_xttSNEFyE| . 1)
   (cdr . 1)
   (assq . 2)
   (add-file-handler . 1)
   (|thunk_xt7WPbFyE| . 1)
   (|extension_xtPOL5GyE| . 1)
   (string->symbol . 1)
   (cons . 2)
   (file-handler . 1)
   (|t_xt9LJyGyE| . 2))
  ((|*file-handlers*_xtr1UhEyE| . 1)
   (add-file-handler . 1)
   (file-handler . 1))
  (cdr string-downcase
       assq
       add-file-handler
       load
       string->symbol
       cons
       not
       file-handler)
  ((#%lambda #t
     (|*file-handlers*_xtr1UhEyE|)
     ()
     (#%begin
       (#%set! add-file-handler
         (#%lambda #t
           (|extension_xtNZRKEyE| |thunk_xt7WPbFyE|)
           (|*file-handlers*_xtr1UhEyE|)
           (#%if (assq |extension_xtNZRKEyE|
                       |*file-handlers*_xtr1UhEyE|)
             #!void
             (#%set! |*file-handlers*_xtr1UhEyE|
               (cons (cons |extension_xtNZRKEyE| |thunk_xt7WPbFyE|)
                     |*file-handlers*_xtr1UhEyE|)))))
       (#%set! file-handler
         ((#%lambda #t
            (|_load_xttSNEFyE|)
            (|*file-handlers*_xtr1UhEyE|)
            (#%lambda #t
              (|extension_xtPOL5GyE|)
              (|_load_xttSNEFyE| |*file-handlers*_xtr1UhEyE|)
              ((#%lambda #t
                 (|t_xt9LJyGyE|)
                 (|_load_xttSNEFyE|)
                 (#%if |t_xt9LJyGyE|
                   (cdr |t_xt9LJyGyE|)
                   |_load_xttSNEFyE|))
               (assq (string->symbol
                       (string-downcase |extension_xtPOL5GyE|))
                     |*file-handlers*_xtr1UhEyE|))))
          load))))
   ()))
(#%program
  ((current-url . 1)
   (|file_xtbADVHyE| . 1)
   (normalize-url . 1)
   (|proc_xtvHH_GyE| . 1)
   (|rest_xtRDFsHyE| . 1)
   (apply . 1))
  ()
  (current-url normalize-url apply)
  (#%define make-io-proc
    (#%lambda #t
      (|proc_xtvHH_GyE|)
      ()
      (#%lambda #t
        (|file_xtbADVHyE| . |rest_xtRDFsHyE|)
        (|proc_xtvHH_GyE|)
        (apply |proc_xtvHH_GyE|
               (normalize-url (current-url) |file_xtbADVHyE|)
               |rest_xtRDFsHyE|)))))
(#%program
  ((reverse! . 1)
   (|url_xtX6nxLyE| . 1)
   (|loop_xth3l-LyE| . 2)
   (with-failure-continuation . 1)
   (equal? . 1)
   (current-url . 6)
   (string->list . 1)
   (|fk_xtferDKyE| . 1)
   (|m_xtzlvJJyE| . 1)
   (car . 2)
   (|x_xtD_irMyE| . 4)
   (void . 1)
   (cons . 1)
   (file-handler . 1)
   (open-source-input-file . 2)
   (|previous-url_xtdpxgJyE| . 3)
   (call-with-failure-continuation . 1)
   (|file_xtTszPIyE| . 1)
   (list->string . 1)
   (|acc_xtZXgUMyE| . 2)
   (load . 1)
   (|file-extension_xtxwBmIyE| . 1)
   (cdr . 1)
   (|e_xtVhtaKyE| . 1)
   (open-input-file . 2)
   (normalize-url . 1)
   (make-io-proc . 3)
   (|fe_xtBap4LyE| . 2)
   (null? . 1)
   (open-output-file . 2))
  ((open-input-file . 1)
   (|loop_xth3l-LyE| . 1)
   (load . 1)
   (open-source-input-file . 1)
   (open-output-file . 1))
  (reverse!
    call-with-failure-continuation
    list->string
    with-failure-continuation
    load
    equal?
    current-url
    cdr
    string->list
    open-input-file
    normalize-url
    car
    make-io-proc
    void
    cons
    open-source-input-file
    file-handler
    null?
    open-output-file)
  ((#%lambda #t
     (|file-extension_xtxwBmIyE|)
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
           (|file_xtTszPIyE|)
           (|file-extension_xtxwBmIyE|)
           (#%begin
             ((#%lambda #t
                (|previous-url_xtdpxgJyE|)
                (|file_xtTszPIyE| |file-extension_xtxwBmIyE|)
                (#%begin
                  (current-url
                    (normalize-url
                      |previous-url_xtdpxgJyE|
                      |file_xtTszPIyE|))
                  (with-failure-continuation
                    (#%lambda #t
                      (|m_xtzlvJJyE| |e_xtVhtaKyE|)
                      (|previous-url_xtdpxgJyE|)
                      (#%begin
                        (current-url |previous-url_xtdpxgJyE|)
                        (call-with-failure-continuation
                          (#%lambda #t
                            (|fk_xtferDKyE|)
                            (|m_xtzlvJJyE| |e_xtVhtaKyE|)
                            (|fk_xtferDKyE| |m_xtzlvJJyE| |e_xtVhtaKyE|)))))
                    (#%lambda #t
                      ()
                      (|file-extension_xtxwBmIyE|)
                      ((#%lambda #t
                         (|fe_xtBap4LyE|)
                         ()
                         ((file-handler
                            (#%if |fe_xtBap4LyE| |fe_xtBap4LyE| "scm"))
                          (current-url)))
                       (|file-extension_xtxwBmIyE| (current-url)))))
                  (current-url |previous-url_xtdpxgJyE|)))
              (current-url))
             (void))))))
   (#%lambda #t
     (|url_xtX6nxLyE|)
     ()
     ((#%letrec #t
        ((|loop_xth3l-LyE|
           (#%lambda #t
             (|x_xtD_irMyE| |acc_xtZXgUMyE|)
             (|loop_xth3l-LyE|)
             (#%if (null? |x_xtD_irMyE|)
               #f
               (#%if (equal? (car |x_xtD_irMyE|) #\.)
                 (list->string |acc_xtZXgUMyE|)
                 (|loop_xth3l-LyE|
                   (cdr |x_xtD_irMyE|)
                   (cons (car |x_xtD_irMyE|) |acc_xtZXgUMyE|)))))))
        ()
        |loop_xth3l-LyE|)
      (reverse! (string->list |url_xtX6nxLyE|))
      ()))))
(#%program
  ((for-each . 1)
   (native-library-binding . 1)
   (load-native-library . 1)
   (|str_xtjUelNyE| . 1)
   (putprop . 1)
   (|nl_xtFQcONyE| . 2)
   (|binding-names_xt_MafOyE| . 1)
   (native-library-binding-names . 1)
   (|name_xtlJ8IOyE| . 2))
  ()
  (native-library-binding
    for-each
    load-native-library
    putprop
    native-library-binding-names)
  (#%define load-module
    (#%lambda #t
      (|str_xtjUelNyE|)
      ()
      ((#%lambda #t
         (|nl_xtFQcONyE|)
         ()
         ((#%lambda #t
            (|binding-names_xt_MafOyE|)
            (|nl_xtFQcONyE|)
            (for-each
              (#%lambda #t
                (|name_xtlJ8IOyE|)
                (|nl_xtFQcONyE|)
                (putprop
                  |name_xtlJ8IOyE|
                  (native-library-binding
                    |nl_xtFQcONyE|
                    |name_xtlJ8IOyE|)))
              |binding-names_xt_MafOyE|))
          (native-library-binding-names |nl_xtFQcONyE|)))
       (load-native-library |str_xtjUelNyE|)))))
(#%program
  ((cdr . 3)
   (|lses_xtny23QyE| . 4)
   (append2 . 1)
   (|real-append_xtHF69PyE| . 3)
   (car . 3)
   (|lses_xt1C4CPyE| . 5)
   (null? . 4)
   (|ls1_xtJu0wQyE| . 3)
   (apply . 3))
  ((|real-append_xtHF69PyE| . 1))
  (cdr append2 car null? apply)
  (#%define append
    (#%letrec #t
      ((|real-append_xtHF69PyE|
         (#%lambda #t
           (|ls1_xtJu0wQyE| . |lses_xtny23QyE|)
           (|real-append_xtHF69PyE|)
           (#%if (null? |lses_xtny23QyE|)
             |ls1_xtJu0wQyE|
             (#%if (null? |ls1_xtJu0wQyE|)
               (apply |real-append_xtHF69PyE| |lses_xtny23QyE|)
               (apply |real-append_xtHF69PyE|
                      (append2 |ls1_xtJu0wQyE| (car |lses_xtny23QyE|))
                      (cdr |lses_xtny23QyE|)))))))
      ()
      (#%lambda #t
        |lses_xt1C4CPyE|
        (|real-append_xtHF69PyE|)
        (#%if (null? |lses_xt1C4CPyE|)
          ()
          (#%if (null? (cdr |lses_xt1C4CPyE|))
            (car |lses_xt1C4CPyE|)
            (apply |real-append_xtHF69PyE|
                   (car |lses_xt1C4CPyE|)
                   (cdr |lses_xt1C4CPyE|))))))))
(#%program
  ((eq? . 1)
   (cdr . 3)
   (|lag_xt75OGTyE| . 2)
   (pair? . 2)
   (|x_xtrcSMSyE| . 3)
   (|x_xtN8QdTyE| . 2)
   (|lag_xt5gUjSyE| . 1)
   (|lp_xtpnYpRyE| . 2)
   (|x_xtLjWSRyE| . 3)
   (not . 1)
   (|x_xt3r-YQyE| . 2)
   (null? . 2))
  ((|lp_xtpnYpRyE| . 1))
  (eq? cdr pair? not null?)
  (#%define proper-list?
    (#%lambda #t
      (|x_xt3r-YQyE|)
      ()
      ((#%letrec #t
         ((|lp_xtpnYpRyE|
            (#%lambda #t
              (|x_xtLjWSRyE| |lag_xt5gUjSyE|)
              (|lp_xtpnYpRyE|)
              (#%if (pair? |x_xtLjWSRyE|)
                ((#%lambda #t
                   (|x_xtrcSMSyE|)
                   (|lag_xt5gUjSyE| |lp_xtpnYpRyE|)
                   (#%if (pair? |x_xtrcSMSyE|)
                     ((#%lambda #t
                        (|x_xtN8QdTyE| |lag_xt75OGTyE|)
                        (|lp_xtpnYpRyE|)
                        (#%if (eq? |x_xtN8QdTyE| |lag_xt75OGTyE|)
                          #f
                          (|lp_xtpnYpRyE| |x_xtN8QdTyE| |lag_xt75OGTyE|)))
                      (cdr |x_xtrcSMSyE|)
                      (cdr |lag_xt5gUjSyE|))
                     (null? |x_xtrcSMSyE|)))
                 (cdr |x_xtLjWSRyE|))
                (null? |x_xtLjWSRyE|)))))
         ()
         |lp_xtpnYpRyE|)
       |x_xt3r-YQyE|
       |x_xt3r-YQyE|))))
(#%program
  ((proper-list? . 1))
  ()
  ()
  (#%define list? proper-list?))
(#%program
  ((|result_xthejt-yE| . 3)
   (exp . 1)
   (|base_xtVsrFYyE| . 4)
   (ashl . 1)
   (|base_xtbLBoWyE| . 1)
   (zero? . 3)
   (|exponent_xtxHzRWyE| . 1)
   (negative? . 1)
   (|base-numerator_xtTDxiXyE| . 1)
   (|loop_xtBlnzZyE| . 2)
   (odd? . 1)
   (abs . 1)
   (|general-expt_xtt1M7UyE| . 1)
   (/ . 2)
   (expt . 2)
   (|base_xtvSFuVyE| . 9)
   (|exponent_xtRODXVyE| . 8)
   (denominator . 1)
   (|rest_xtXhl0-yE| . 3)
   (|base-denominator_xtdAvLXyE| . 1)
   (numerator . 1)
   (= . 1)
   (* . 3)
   (|exponent_xtfpp6ZyE| . 4)
   (|integer-expt_xt9WH1VyE| . 2)
   (not . 1)
   (|exponent_xtzwtcYyE| . 2)
   (log . 1)
   (quotient . 1)
   (integer? . 2)
   (exact? . 5)
   (|squaring_xtDahW-yE| . 3)
   (rational? . 1)
   (|rational-expt_xtPZJAUyE| . 1))
  ((|loop_xtBlnzZyE| . 1)
   (|integer-expt_xt9WH1VyE| . 1)
   (|general-expt_xtt1M7UyE| . 1)
   (|rational-expt_xtPZJAUyE| . 1))
  (expt exp
        denominator
        numerator
        =
        *
        ashl
        not
        negative?
        zero?
        log
        quotient
        integer?
        odd?
        exact?
        abs
        rational?
        /)
  (#%define expt
    (#%letrec #t
      ((|general-expt_xtt1M7UyE|
         (#%lambda #t
           (|base_xtbLBoWyE| |exponent_xtxHzRWyE|)
           ()
           (exp (* |exponent_xtxHzRWyE| (log |base_xtbLBoWyE|)))))
       (|rational-expt_xtPZJAUyE|
         (#%lambda #t
           (|base-numerator_xtTDxiXyE|
             |base-denominator_xtdAvLXyE|
             |exponent_xtzwtcYyE|)
           ()
           (/ (expt |base-numerator_xtTDxiXyE|
                    |exponent_xtzwtcYyE|)
              (expt |base-denominator_xtdAvLXyE|
                    |exponent_xtzwtcYyE|))))
       (|integer-expt_xt9WH1VyE|
         (#%lambda #t
           (|base_xtVsrFYyE| |exponent_xtfpp6ZyE|)
           (|integer-expt_xt9WH1VyE|)
           (#%if (negative? |exponent_xtfpp6ZyE|)
             (/ (|integer-expt_xt9WH1VyE|
                  |base_xtVsrFYyE|
                  (abs |exponent_xtfpp6ZyE|)))
             (#%if (#%if (exact? |base_xtVsrFYyE|)
                     (= |base_xtVsrFYyE| 2)
                     #f)
               (ashl 1 |exponent_xtfpp6ZyE|)
               ((#%letrec #t
                  ((|loop_xtBlnzZyE|
                     (#%lambda #t
                       (|rest_xtXhl0-yE|
                         |result_xthejt-yE|
                         |squaring_xtDahW-yE|)
                       (|loop_xtBlnzZyE|)
                       (#%if (zero? |rest_xtXhl0-yE|)
                         |result_xthejt-yE|
                         (|loop_xtBlnzZyE|
                           (quotient |rest_xtXhl0-yE| 2)
                           (#%if (odd? |rest_xtXhl0-yE|)
                             (* |result_xthejt-yE| |squaring_xtDahW-yE|)
                             |result_xthejt-yE|)
                           (* |squaring_xtDahW-yE| |squaring_xtDahW-yE|))))))
                  ()
                  |loop_xtBlnzZyE|)
                |exponent_xtfpp6ZyE|
                1
                |base_xtVsrFYyE|))))))
      ()
      (#%lambda #t
        (|base_xtvSFuVyE| |exponent_xtRODXVyE|)
        (|general-expt_xtt1M7UyE|
          |rational-expt_xtPZJAUyE|
          |integer-expt_xt9WH1VyE|)
        (#%if (zero? |exponent_xtRODXVyE|)
          (#%if (exact? |exponent_xtRODXVyE|) 1 1.0)
          (#%if (zero? |base_xtvSFuVyE|)
            (#%if (exact? |exponent_xtRODXVyE|)
              |base_xtvSFuVyE|
              0.0)
            (#%if (#%if (exact? |base_xtvSFuVyE|)
                    (#%if (rational? |base_xtvSFuVyE|)
                      (#%if (integer? |base_xtvSFuVyE|) #f #t)
                      #f)
                    #f)
              (|rational-expt_xtPZJAUyE|
                (numerator |base_xtvSFuVyE|)
                (denominator |base_xtvSFuVyE|)
                |exponent_xtRODXVyE|)
              (#%if (#%if (exact? |exponent_xtRODXVyE|)
                      (integer? |exponent_xtRODXVyE|)
                      #f)
                (|integer-expt_xt9WH1VyE|
                  |base_xtvSFuVyE|
                  |exponent_xtRODXVyE|)
                (|general-expt_xtt1M7UyE|
                  |base_xtvSFuVyE|
                  |exponent_xtRODXVyE|)))))))))
(#%program
  ((|y_xtj3dQ_yE| . 4)
   (modpow . 2)
   (= . 1)
   (even? . 1)
   (* . 3)
   (- . 1)
   (|n_xtF_ah0zE| . 6)
   (|tmp_xt_X8K0zE| . 2)
   (|x_xtZ6fn_yE| . 4)
   (|tmp_xtlU6b1zE| . 2)
   (modulo . 4)
   (/ . 2))
  ()
  (modpow * even? = - modulo /)
  (#%define modpow
    (#%lambda #t
      (|x_xtZ6fn_yE| |y_xtj3dQ_yE| |n_xtF_ah0zE|)
      ()
      (#%if (= |y_xtj3dQ_yE| 1)
        (modulo |x_xtZ6fn_yE| |n_xtF_ah0zE|)
        (#%if (even? |y_xtj3dQ_yE|)
          ((#%lambda #t
             (|tmp_xtlU6b1zE|)
             (|n_xtF_ah0zE|)
             (modulo
               (* |tmp_xtlU6b1zE| |tmp_xtlU6b1zE|)
               |n_xtF_ah0zE|))
           (modpow
             |x_xtZ6fn_yE|
             (/ |y_xtj3dQ_yE| 2)
             |n_xtF_ah0zE|))
          ((#%lambda #t
             (|tmp_xt_X8K0zE|)
             (|x_xtZ6fn_yE| |n_xtF_ah0zE|)
             (modulo
               (* |x_xtZ6fn_yE|
                  (modulo
                    (* |tmp_xt_X8K0zE| |tmp_xt_X8K0zE|)
                    |n_xtF_ah0zE|))
               |n_xtF_ah0zE|))
           (modpow
             |x_xtZ6fn_yE|
             (/ (- |y_xtj3dQ_yE| 1) 2)
             |n_xtF_ah0zE|)))))))
(#%program
  ((real? . 1)
   (integer? . 1)
   (= . 1)
   (round . 1)
   (|oldint?_xtHQ4E1zE| . 1)
   (|n_xt1N252zE| . 4))
  ()
  (real? = round)
  (#%define integer?
    (#%lambda #t
      (|n_xt1N252zE|)
      (|oldint?_xtHQ4E1zE|)
      (#%if (integer? |n_xt1N252zE|)
        #t
        (#%if (real? |n_xt1N252zE|)
          (= (round |n_xt1N252zE|) |n_xt1N252zE|)
          #f)))))
(#%program
  ((|n_xtJF--2zE| . 2)
   (number? . 1)
   (|oldcomp?_xtnJ0y2zE| . 1)
   (not . 1)
   (complex? . 1))
  ()
  (number? not)
  (#%define real?
    (#%lambda #t
      (|n_xtJF--2zE|)
      (|oldcomp?_xtnJ0y2zE|)
      (#%if (number? |n_xtJF--2zE|)
        (#%if (complex? |n_xtJF--2zE|) #f #t)
        #f))))
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
  ((real? . 1)
   (real-part . 1)
   (+ . 1)
   (* . 2)
   (- . 1)
   (< . 1)
   (not . 1)
   (|b_xtLuUl4zE| . 2)
   (imag-part . 1)
   (|num_xt3CYr3zE| . 6)
   (sqrt . 1)
   (|a_xtpyWU3zE| . 2))
  ()
  (real-part real? + * - < not imag-part sqrt)
  (#%define abs
    (#%lambda #t
      (|num_xt3CYr3zE|)
      ()
      (#%if (real? |num_xt3CYr3zE|)
        (#%if (< |num_xt3CYr3zE| 0)
          (- |num_xt3CYr3zE|)
          |num_xt3CYr3zE|)
        ((#%lambda #t
           (|a_xtpyWU3zE| |b_xtLuUl4zE|)
           ()
           (sqrt (+ (* |a_xtpyWU3zE| |a_xtpyWU3zE|)
                    (* |b_xtLuUl4zE| |b_xtLuUl4zE|))))
         (real-part |num_xt3CYr3zE|)
         (imag-part |num_xt3CYr3zE|))))))
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
  ((|x1_xttcKC6zE| . 3)
   (min . 1)
   (|inexact_xtRZBq8zE| . 3)
   (|x1_xtNjOI5zE| . 3)
   (|args_xtrnQf5zE| . 2)
   (inexact? . 3)
   (< . 1)
   (|args_xt7gM96zE| . 2)
   (|mv_xt95Gw7zE| . 5)
   (|proc_xtP8I37zE| . 3)
   (cdr . 2)
   (|_min_max_xt5rSO4zE| . 4)
   (max . 1)
   (> . 1)
   (exact? . 1)
   (car . 3)
   (exact->inexact . 1)
   (|args_xtv1EZ7zE| . 6)
   (null? . 3))
  ((|_min_max_xt5rSO4zE| . 1) (min . 1) (max . 1))
  (cdr min
       max
       inexact?
       >
       exact?
       car
       exact->inexact
       <
       null?)
  (#%letrec #t
    ((|_min_max_xt5rSO4zE|
       (#%lambda #t
         (|proc_xtP8I37zE|
           |mv_xt95Gw7zE|
           |args_xtv1EZ7zE|
           |inexact_xtRZBq8zE|)
         (|_min_max_xt5rSO4zE|)
         (#%if (null? |args_xtv1EZ7zE|)
           (#%if (#%if |inexact_xtRZBq8zE|
                   (exact? |mv_xt95Gw7zE|)
                   #f)
             (exact->inexact |mv_xt95Gw7zE|)
             |mv_xt95Gw7zE|)
           (#%if (|proc_xtP8I37zE|
                   (car |args_xtv1EZ7zE|)
                   |mv_xt95Gw7zE|)
             (|_min_max_xt5rSO4zE|
               |proc_xtP8I37zE|
               (car |args_xtv1EZ7zE|)
               (cdr |args_xtv1EZ7zE|)
               (#%if |inexact_xtRZBq8zE|
                 #t
                 (inexact? (car |args_xtv1EZ7zE|))))
             (|_min_max_xt5rSO4zE|
               |proc_xtP8I37zE|
               |mv_xt95Gw7zE|
               (cdr |args_xtv1EZ7zE|)
               |inexact_xtRZBq8zE|))))))
    ()
    (#%begin
      (#%set! min
        (#%lambda #t
          (|x1_xtNjOI5zE| . |args_xtrnQf5zE|)
          (|_min_max_xt5rSO4zE|)
          (#%if (null? |args_xtrnQf5zE|)
            |x1_xtNjOI5zE|
            (|_min_max_xt5rSO4zE|
              <
              |x1_xtNjOI5zE|
              |args_xtrnQf5zE|
              (inexact? |x1_xtNjOI5zE|)))))
      (#%set! max
        (#%lambda #t
          (|x1_xttcKC6zE| . |args_xt7gM96zE|)
          (|_min_max_xt5rSO4zE|)
          (#%if (null? |args_xt7gM96zE|)
            |x1_xttcKC6zE|
            (|_min_max_xt5rSO4zE|
              >
              |x1_xttcKC6zE|
              |args_xt7gM96zE|
              (inexact? |x1_xttcKC6zE|))))))))
(#%program
  ((|n_xtbWzT8zE| . 1) (< . 1))
  ()
  (<)
  (#%define negative?
    (#%lambda #t
      (|n_xtbWzT8zE|)
      ()
      (< |n_xtbWzT8zE| 0))))
(#%program
  ((> . 1) (|n_xtxSxk9zE| . 1))
  ()
  (>)
  (#%define positive?
    (#%lambda #t
      (|n_xtxSxk9zE|)
      ()
      (> |n_xtxSxk9zE| 0))))
(#%program
  ((|n_xtTOvN9zE| . 1) (= . 1) (modulo . 1))
  ()
  (= modulo)
  (#%define even?
    (#%lambda #t
      (|n_xtTOvN9zE|)
      ()
      (= 0 (modulo |n_xtTOvN9zE| 2)))))
(#%program
  ((even? . 1) (not . 1) (|n_xtdLteazE| . 1))
  ()
  (even? not)
  (#%define odd?
    (#%lambda #t
      (|n_xtdLteazE|)
      ()
      (#%if (even? |n_xtdLteazE|) #f #t))))
(#%program
  ((= . 1) (|n_xtzHrHazE| . 1))
  ()
  (=)
  (#%define zero?
    (#%lambda #t
      (|n_xtzHrHazE|)
      ()
      (= |n_xtzHrHazE| 0))))
(#%program
  ((+ . 1) (|n_xtVDp8bzE| . 1))
  ()
  (+)
  (#%define add1
    (#%lambda #t
      (|n_xtVDp8bzE|)
      ()
      (+ |n_xtVDp8bzE| 1))))
(#%program
  ((|n_xtfAnBbzE| . 1) (- . 1))
  ()
  (-)
  (#%define sub1
    (#%lambda #t
      (|n_xtfAnBbzE|)
      ()
      (- |n_xtfAnBbzE| 1))))
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
  ((>= . 1)
   (|b_xtDlfpdzE| . 2)
   (= . 2)
   (|endstate_xtl35GfzE| . 2)
   (|chainer_xt_67dfzE| . 1)
   (|a_xtZhdSdzE| . 2)
   (|b_xtjebjezE| . 2)
   (< . 1)
   (|a_xthphYczE| . 2)
   (cdr . 2)
   (|x_xtnU-0hzE| . 5)
   (> . 1)
   (|_comp_help_xtBwl2czE| . 2)
   (|comparator_xtFa9MezE| . 1)
   (cadr . 1)
   (|_and2_xtXsjvczE| . 2)
   (car . 1)
   (|y_xt3NWWhzE| . 1)
   (|loop_xt1Y0AgzE| . 2)
   (|x_xtJQYthzE| . 1)
   (null? . 2)
   (<= . 1)
   (|args_xtH_27gzE| . 1))
  ((>= . 1) (|loop_xt1Y0AgzE| . 1) (<= . 1))
  (>= cdr = > cadr car < <= null?)
  ((#%lambda #t
     (|_comp_help_xtBwl2czE| |_and2_xtXsjvczE|)
     ()
     (#%begin
       (#%set! <=
         (|_comp_help_xtBwl2czE|
           (#%lambda #t
             (|a_xthphYczE| |b_xtDlfpdzE|)
             ()
             (#%if (< |a_xthphYczE| |b_xtDlfpdzE|)
               #t
               (= |a_xthphYczE| |b_xtDlfpdzE|)))
           |_and2_xtXsjvczE|
           #t))
       (#%set! >=
         (|_comp_help_xtBwl2czE|
           (#%lambda #t
             (|a_xtZhdSdzE| |b_xtjebjezE|)
             ()
             (#%if (> |a_xtZhdSdzE| |b_xtjebjezE|)
               #t
               (= |a_xtZhdSdzE| |b_xtjebjezE|)))
           |_and2_xtXsjvczE|
           #t))))
   (#%lambda #t
     (|comparator_xtFa9MezE|
       |chainer_xt_67dfzE|
       |endstate_xtl35GfzE|)
     ()
     (#%lambda #t
       |args_xtH_27gzE|
       (|comparator_xtFa9MezE|
         |chainer_xt_67dfzE|
         |endstate_xtl35GfzE|)
       ((#%letrec #t
          ((|loop_xt1Y0AgzE|
             (#%lambda #t
               (|x_xtnU-0hzE|)
               (|loop_xt1Y0AgzE|
                 |comparator_xtFa9MezE|
                 |chainer_xt_67dfzE|
                 |endstate_xtl35GfzE|)
               (#%if (null? |x_xtnU-0hzE|)
                 |endstate_xtl35GfzE|
                 (#%if (null? (cdr |x_xtnU-0hzE|))
                   |endstate_xtl35GfzE|
                   (|chainer_xt_67dfzE|
                     (|comparator_xtFa9MezE|
                       (car |x_xtnU-0hzE|)
                       (cadr |x_xtnU-0hzE|))
                     (|loop_xt1Y0AgzE| (cdr |x_xtnU-0hzE|))))))))
          (|comparator_xtFa9MezE|
            |chainer_xt_67dfzE|
            |endstate_xtl35GfzE|)
          |loop_xt1Y0AgzE|)
        |args_xtH_27gzE|)))
   (#%lambda #t
     (|x_xtJQYthzE| |y_xt3NWWhzE|)
     ()
     (#%if |x_xtJQYthzE| |y_xt3NWWhzE| #f))))
(#%program
  ((>= . 2)
   (= . 1)
   (< . 1)
   (apply . 1)
   (|comparator_xtLFSQizE| . 1)
   (cdr . 2)
   (> . 1)
   (cadr . 2)
   (car . 2)
   (|args_xtryOKjzE| . 7)
   (|chainer_xt5CQhjzE| . 1)
   (|t_xtNuMbkzE| . 2)
   (|_?=_xtpJUnizE| . 2)
   (null? . 2)
   (<= . 2))
  ((>= . 1) (<= . 1))
  (>= cdr > = cadr car < <= null? apply)
  ((#%lambda #t
     (|_?=_xtpJUnizE|)
     ()
     (#%begin
       (#%set! >= (|_?=_xtpJUnizE| > >=))
       (#%set! <= (|_?=_xtpJUnizE| < <=))))
   (#%lambda #t
     (|comparator_xtLFSQizE| |chainer_xt5CQhjzE|)
     ()
     (#%lambda #t
       |args_xtryOKjzE|
       (|comparator_xtLFSQizE| |chainer_xt5CQhjzE|)
       (#%if (null? |args_xtryOKjzE|)
         #t
         (#%if (null? (cdr |args_xtryOKjzE|))
           #t
           (#%if ((#%lambda #t
                    (|t_xtNuMbkzE|)
                    (|args_xtryOKjzE| |comparator_xtLFSQizE|)
                    (#%if |t_xtNuMbkzE|
                      |t_xtNuMbkzE|
                      (|comparator_xtLFSQizE|
                        (car |args_xtryOKjzE|)
                        (cadr |args_xtryOKjzE|))))
                  (= (car |args_xtryOKjzE|)
                     (cadr |args_xtryOKjzE|)))
             (apply |chainer_xt5CQhjzE|
                    (cdr |args_xtryOKjzE|))
             #f)))))))
(#%program
  ((cdr . 1)
   (|args_xt7rKEkzE| . 5)
   (cadr . 1)
   (car . 2)
   (_gcd . 1)
   (null? . 2))
  ()
  (cdr cadr car _gcd null?)
  (#%define gcd
    (#%lambda #t
      |args_xt7rKEkzE|
      ()
      (#%if (null? |args_xt7rKEkzE|)
        0
        (#%if (null? (cdr |args_xt7rKEkzE|))
          (car |args_xt7rKEkzE|)
          (_gcd (car |args_xt7rKEkzE|)
                (cadr |args_xt7rKEkzE|)))))))
(#%program
  ((cdr . 1)
   (_lcm . 1)
   (cadr . 1)
   (|args_xttnI5lzE| . 5)
   (car . 2)
   (null? . 2))
  ()
  (cdr _lcm cadr car null?)
  (#%define lcm
    (#%lambda #t
      |args_xttnI5lzE|
      ()
      (#%if (null? |args_xttnI5lzE|)
        1
        (#%if (null? (cdr |args_xttnI5lzE|))
          (car |args_xttnI5lzE|)
          (_lcm (car |args_xttnI5lzE|)
                (cadr |args_xttnI5lzE|)))))))
(#%program
  ((positive? . 1)
   (+ . 1)
   (|r_xtvcCsmzE| . 3)
   (|x_xtPjGylzE| . 1)
   (negative? . 2)
   (|y_xt9gE_lzE| . 3)
   (remainder . 1))
  ()
  (+ positive? negative? remainder)
  (#%define modulo
    (#%lambda #t
      (|x_xtPjGylzE| |y_xt9gE_lzE|)
      ()
      ((#%lambda #t
         (|r_xtvcCsmzE|)
         (|y_xt9gE_lzE|)
         (#%if ((#%if (negative? |y_xt9gE_lzE|)
                  positive?
                  negative?)
                |r_xtvcCsmzE|)
           (+ |r_xtvcCsmzE| |y_xt9gE_lzE|)
           |r_xtvcCsmzE|))
       (remainder |x_xtPjGylzE| |y_xt9gE_lzE|)))))
(#%program
  ((|string-append-helper_xtR8AVmzE| . 2)
   (cdr . 2)
   (|args_xtb5ymnzE| . 3)
   (car . 2)
   (_string-append . 1)
   (|args_xtTZtgozE| . 3)
   (null? . 2)
   (|acc_xtx1wPnzE| . 2))
  ((|string-append-helper_xtR8AVmzE| . 1))
  (cdr car _string-append null?)
  (#%define string-append
    (#%letrec #t
      ((|string-append-helper_xtR8AVmzE|
         (#%lambda #t
           (|acc_xtx1wPnzE| |args_xtTZtgozE|)
           (|string-append-helper_xtR8AVmzE|)
           (#%if (null? |args_xtTZtgozE|)
             |acc_xtx1wPnzE|
             (|string-append-helper_xtR8AVmzE|
               (_string-append
                 |acc_xtx1wPnzE|
                 (car |args_xtTZtgozE|))
               (cdr |args_xtTZtgozE|))))))
      ()
      (#%lambda #t
        |args_xtb5ymnzE|
        (|string-append-helper_xtR8AVmzE|)
        (#%if (null? |args_xtb5ymnzE|)
          ""
          (|string-append-helper_xtR8AVmzE|
            (car |args_xtb5ymnzE|)
            (cdr |args_xtb5ymnzE|)))))))
(#%program
  ((>= . 1)
   (|lc-offset_xtVOnDpzE| . 1)
   (+ . 1)
   (|a_xtdWrJozE| . 2)
   (integer->char . 1)
   (- . 1)
   (char->integer . 4)
   (|cv_xtBHjxqzE| . 3)
   (|z_xtzSpapzE| . 1)
   (|c_xtfLl4qzE| . 2)
   (<= . 1))
  ()
  (>= + integer->char - char->integer <=)
  (#%define char-downcase
    ((#%lambda #t
       (|a_xtdWrJozE|)
       ()
       ((#%lambda #t
          (|z_xtzSpapzE|)
          (|a_xtdWrJozE|)
          ((#%lambda #t
             (|lc-offset_xtVOnDpzE|)
             (|z_xtzSpapzE| |a_xtdWrJozE|)
             (#%lambda #t
               (|c_xtfLl4qzE|)
               (|lc-offset_xtVOnDpzE|
                 |z_xtzSpapzE|
                 |a_xtdWrJozE|)
               ((#%lambda #t
                  (|cv_xtBHjxqzE|)
                  (|c_xtfLl4qzE|
                    |lc-offset_xtVOnDpzE|
                    |z_xtzSpapzE|
                    |a_xtdWrJozE|)
                  (#%if (#%if (>= |cv_xtBHjxqzE| |a_xtdWrJozE|)
                          (<= |cv_xtBHjxqzE| |z_xtzSpapzE|)
                          #f)
                    (integer->char
                      (+ |cv_xtBHjxqzE| |lc-offset_xtVOnDpzE|))
                    |c_xtfLl4qzE|))
                (char->integer |c_xtfLl4qzE|))))
           (- (char->integer #\a) |a_xtdWrJozE|)))
        (char->integer #\Z)))
     (char->integer #\A))))
(#%program
  ((|z_xthAfrrzE| . 1)
   (>= . 1)
   (|cv_xtjp9OszE| . 3)
   (|a_xtXDh-qzE| . 2)
   (integer->char . 1)
   (|c_xtZsblszE| . 2)
   (- . 2)
   (char->integer . 4)
   (|uc-offset_xtDwdUrzE| . 1)
   (<= . 1))
  ()
  (>= integer->char - char->integer <=)
  (#%define char-upcase
    ((#%lambda #t
       (|a_xtXDh-qzE|)
       ()
       ((#%lambda #t
          (|z_xthAfrrzE|)
          (|a_xtXDh-qzE|)
          ((#%lambda #t
             (|uc-offset_xtDwdUrzE|)
             (|z_xthAfrrzE| |a_xtXDh-qzE|)
             (#%lambda #t
               (|c_xtZsblszE|)
               (|uc-offset_xtDwdUrzE|
                 |z_xthAfrrzE|
                 |a_xtXDh-qzE|)
               ((#%lambda #t
                  (|cv_xtjp9OszE|)
                  (|c_xtZsblszE|
                    |uc-offset_xtDwdUrzE|
                    |z_xthAfrrzE|
                    |a_xtXDh-qzE|)
                  (#%if (#%if (>= |cv_xtjp9OszE| |a_xtXDh-qzE|)
                          (<= |cv_xtjp9OszE| |z_xthAfrrzE|)
                          #f)
                    (integer->char
                      (- |cv_xtjp9OszE| |uc-offset_xtDwdUrzE|))
                    |c_xtZsblszE|))
                (char->integer |c_xtZsblszE|))))
           (- |a_xtXDh-qzE| (char->integer #\A))))
        (char->integer #\z)))
     (char->integer #\a))))
(#%program
  ((> . 1)
   (map . 1)
   (char->integer . 3)
   (|c2_xt_h5ItzE| . 1)
   (|c1_xtle39uzE| . 1)
   (|args_xtFl7ftzE| . 1)
   (apply . 1))
  ()
  (map > char->integer apply)
  (#%define char>?
    (#%lambda #t
      (|c1_xtle39uzE|
        |c2_xt_h5ItzE|
        .
        |args_xtFl7ftzE|)
      ()
      (apply >
             (char->integer |c1_xtle39uzE|)
             (char->integer |c2_xt_h5ItzE|)
             (map char->integer |args_xtFl7ftzE|)))))
(#%program
  ((|args_xtHa1CuzE| . 1)
   (map . 1)
   (|c1_xtn3ZvvzE| . 1)
   (char->integer . 3)
   (< . 1)
   (|c2_xt17_2vzE| . 1)
   (apply . 1))
  ()
  (map char->integer < apply)
  (#%define char<?
    (#%lambda #t
      (|c1_xtn3ZvvzE|
        |c2_xt17_2vzE|
        .
        |args_xtHa1CuzE|)
      ()
      (apply <
             (char->integer |c1_xtn3ZvvzE|)
             (char->integer |c2_xt17_2vzE|)
             (map char->integer |args_xtHa1CuzE|)))))
(#%program
  ((eqv? . 1))
  ()
  ()
  (#%define char=? eqv?))
(#%program
  ((|c2_xt3YUpwzE| . 2)
   (|c1_xtJ_WYvzE| . 2)
   (char=? . 1)
   (char>? . 1))
  ()
  (char=? char>?)
  (#%define char>=?
    (#%lambda #t
      (|c1_xtJ_WYvzE| |c2_xt3YUpwzE|)
      ()
      (#%if (char>? |c1_xtJ_WYvzE| |c2_xt3YUpwzE|)
        #t
        (char=? |c1_xtJ_WYvzE| |c2_xt3YUpwzE|)))))
(#%program
  ((char<? . 1)
   (char=? . 1)
   (|c2_xtLQQjxzE| . 2)
   (|c1_xtpUSSwzE| . 2))
  ()
  (char=? char<?)
  (#%define char<=?
    (#%lambda #t
      (|c1_xtpUSSwzE| |c2_xtLQQjxzE|)
      ()
      (#%if (char<? |c1_xtpUSSwzE| |c2_xtLQQjxzE|)
        #t
        (char=? |c1_xtpUSSwzE| |c2_xtLQQjxzE|)))))
(#%program
  ((char>? . 1)
   (map . 1)
   (|c2_xtrJMdyzE| . 1)
   (|c1_xtNFKGyzE| . 1)
   (char-downcase . 3)
   (|args_xt5NOMxzE| . 1)
   (apply . 1))
  ()
  (map char>? char-downcase apply)
  (#%define char-ci>?
    (#%lambda #t
      (|c1_xtNFKGyzE|
        |c2_xtrJMdyzE|
        .
        |args_xt5NOMxzE|)
      ()
      (apply char>?
             (char-downcase |c1_xtNFKGyzE|)
             (char-downcase |c2_xtrJMdyzE|)
             (map char-downcase |args_xt5NOMxzE|)))))
(#%program
  ((|c1_xtPuE1AzE| . 1)
   (|args_xt7CI7zzE| . 1)
   (|c2_xttyGAzzE| . 1)
   (char<? . 1)
   (map . 1)
   (char-downcase . 3)
   (apply . 1))
  ()
  (char<? map char-downcase apply)
  (#%define char-ci<?
    (#%lambda #t
      (|c1_xtPuE1AzE|
        |c2_xttyGAzzE|
        .
        |args_xt7CI7zzE|)
      ()
      (apply char<?
             (char-downcase |c1_xtPuE1AzE|)
             (char-downcase |c2_xttyGAzzE|)
             (map char-downcase |args_xt7CI7zzE|)))))
(#%program
  ((|c2_xtvnAXAzE| . 1)
   (char=? . 1)
   (|c1_xtRjyoBzE| . 1)
   (map . 1)
   (|args_xt9rCuAzE| . 1)
   (char-downcase . 3)
   (apply . 1))
  ()
  (char=? map char-downcase apply)
  (#%define char-ci=?
    (#%lambda #t
      (|c1_xtRjyoBzE|
        |c2_xtvnAXAzE|
        .
        |args_xt9rCuAzE|)
      ()
      (apply char=?
             (char-downcase |c1_xtRjyoBzE|)
             (char-downcase |c2_xtvnAXAzE|)
             (map char-downcase |args_xt9rCuAzE|)))))
(#%program
  ((|c1_xtbgwRBzE| . 2)
   (char-ci>? . 1)
   (char-ci=? . 1)
   (|c2_xtxcuiCzE| . 2))
  ()
  (char-ci>? char-ci=?)
  (#%define char-ci>=?
    (#%lambda #t
      (|c1_xtbgwRBzE| |c2_xtxcuiCzE|)
      ()
      (#%if (char-ci>? |c1_xtbgwRBzE| |c2_xtxcuiCzE|)
        #t
        (char-ci=? |c1_xtbgwRBzE| |c2_xtxcuiCzE|)))))
(#%program
  ((|c2_xtd5qcDzE| . 2)
   (char-ci=? . 1)
   (char-ci<? . 1)
   (|c1_xtT8sLCzE| . 2))
  ()
  (char-ci=? char-ci<?)
  (#%define char-ci<=?
    (#%lambda #t
      (|c1_xtT8sLCzE| |c2_xtd5qcDzE|)
      ()
      (#%if (char-ci<? |c1_xtT8sLCzE| |c2_xtd5qcDzE|)
        #t
        (char-ci=? |c1_xtT8sLCzE| |c2_xtd5qcDzE|)))))
(#%program
  ((|c_xtz1oFDzE| . 2) (char<? . 2))
  ()
  (char<?)
  (#%define char-alphabetic?
    (#%lambda #t
      (|c_xtz1oFDzE|)
      ()
      (#%if (char<? #\@ |c_xtz1oFDzE| #\[)
        #t
        (char<? #\` |c_xtz1oFDzE| #\{)))))
(#%program
  ((char<? . 1) (|c_xtVZl6EzE| . 1))
  ()
  (char<?)
  (#%define char-numeric?
    (#%lambda #t
      (|c_xtVZl6EzE|)
      ()
      (char<? #\/ |c_xtVZl6EzE| #\:))))
(#%program
  ((|c_xtfWjzEzE| . 4) (char=? . 4))
  ()
  (char=?)
  (#%define char-whitespace?
    (#%lambda #t
      (|c_xtfWjzEzE|)
      ()
      (#%if (char=? |c_xtfWjzEzE| #\space)
        #t
        (#%if (char=? |c_xtfWjzEzE| #\tab)
          #t
          (#%if (char=? |c_xtfWjzEzE| #\newline)
            #t
            (char=? |c_xtfWjzEzE| #\return)))))))
(#%program
  ((char<? . 1) (|c_xtBSh0FzE| . 1))
  ()
  (char<?)
  (#%define char-upper-case?
    (#%lambda #t
      (|c_xtBSh0FzE|)
      ()
      (char<? #\@ |c_xtBSh0FzE| #\[))))
(#%program
  ((|c_xtXOftFzE| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-lower-case?
    (#%lambda #t
      (|c_xtXOftFzE|)
      ()
      (char<? #\` |c_xtXOftFzE| #\{))))
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
  ((|newstr_xtZD9QGzE| . 1)
   (string-downcase . 1)
   (+ . 1)
   (|str_xtDHbnGzE| . 3)
   (string-upcase . 1)
   (|n_xt1iZxJzE| . 4)
   (char-upcase . 1)
   (< . 1)
   (char-downcase . 1)
   (|l_xtneX-JzE| . 2)
   (make-string . 2)
   (|newstr_xtFw5KHzE| . 1)
   (|proc_xtHl_4JzE| . 2)
   (string-set! . 1)
   (|string-map_xthLdWFzE| . 3)
   (|strsrc_xt_s3bIzE| . 2)
   (string-ref . 1)
   (|str_xtjA7hHzE| . 3)
   (string-length . 4)
   (|strdst_xtlp1EIzE| . 3))
  ((string-downcase . 1)
   (|string-map_xthLdWFzE| . 1)
   (string-upcase . 1))
  (string-downcase
    string-set!
    +
    string-upcase
    string-ref
    char-upcase
    <
    string-length
    char-downcase
    make-string)
  (#%letrec #t
    ((|string-map_xthLdWFzE|
       (#%lambda #t
         (|strsrc_xt_s3bIzE|
           |strdst_xtlp1EIzE|
           |proc_xtHl_4JzE|
           |n_xt1iZxJzE|
           |l_xtneX-JzE|)
         (|string-map_xthLdWFzE|)
         (#%if (< |n_xt1iZxJzE| |l_xtneX-JzE|)
           (#%begin
             (string-set!
               |strdst_xtlp1EIzE|
               |n_xt1iZxJzE|
               (|proc_xtHl_4JzE|
                 (string-ref |strsrc_xt_s3bIzE| |n_xt1iZxJzE|)))
             (|string-map_xthLdWFzE|
               |strsrc_xt_s3bIzE|
               |strdst_xtlp1EIzE|
               |proc_xtHl_4JzE|
               (+ |n_xt1iZxJzE| 1)
               |l_xtneX-JzE|))
           |strdst_xtlp1EIzE|))))
    ()
    (#%begin
      (#%set! string-downcase
        (#%lambda #t
          (|str_xtDHbnGzE|)
          (|string-map_xthLdWFzE|)
          ((#%lambda #t
             (|newstr_xtZD9QGzE|)
             (|str_xtDHbnGzE| |string-map_xthLdWFzE|)
             (|string-map_xthLdWFzE|
               |str_xtDHbnGzE|
               |newstr_xtZD9QGzE|
               char-downcase
               0
               (string-length |str_xtDHbnGzE|)))
           (make-string (string-length |str_xtDHbnGzE|)))))
      (#%set! string-upcase
        (#%lambda #t
          (|str_xtjA7hHzE|)
          (|string-map_xthLdWFzE|)
          ((#%lambda #t
             (|newstr_xtFw5KHzE|)
             (|str_xtjA7hHzE| |string-map_xthLdWFzE|)
             (|string-map_xthLdWFzE|
               |str_xtjA7hHzE|
               |newstr_xtFw5KHzE|
               char-upcase
               0
               (string-length |str_xtjA7hHzE|)))
           (make-string (string-length |str_xtjA7hHzE|))))))))
(#%program
  ((equal? . 1))
  ()
  ()
  (#%define string=? equal?))
(#%program
  ((char>? . 1)
   (|s2_xt5YMfMzE| . 4)
   (not . 1)
   (|s1_xtL_OOLzE| . 3)
   (cdr . 2)
   (|s1_xt37TUKzE| . 1)
   (string->list . 2)
   (|c1_xtrUKIMzE| . 2)
   (char<? . 1)
   (|c2_xtNQI9NzE| . 2)
   (car . 2)
   (|s<?_xtJaVrKzE| . 2)
   (null? . 3)
   (|s2_xtp3RlLzE| . 1))
  ((|s<?_xtJaVrKzE| . 1))
  (cdr string->list char<? char>? car not null?)
  (#%define string<?
    (#%letrec #t
      ((|s<?_xtJaVrKzE|
         (#%lambda #t
           (|s1_xtL_OOLzE| |s2_xt5YMfMzE|)
           (|s<?_xtJaVrKzE|)
           (#%if (null? |s1_xtL_OOLzE|)
             (#%if (null? |s2_xt5YMfMzE|) #f #t)
             (#%if (null? |s2_xt5YMfMzE|)
               #f
               ((#%lambda #t
                  (|c1_xtrUKIMzE| |c2_xtNQI9NzE|)
                  (|s1_xtL_OOLzE| |s2_xt5YMfMzE| |s<?_xtJaVrKzE|)
                  (#%if (char<? |c1_xtrUKIMzE| |c2_xtNQI9NzE|)
                    #t
                    (#%if (char>? |c1_xtrUKIMzE| |c2_xtNQI9NzE|)
                      #f
                      (|s<?_xtJaVrKzE|
                        (cdr |s1_xtL_OOLzE|)
                        (cdr |s2_xt5YMfMzE|)))))
                (car |s1_xtL_OOLzE|)
                (car |s2_xt5YMfMzE|)))))))
      ()
      (#%lambda #t
        (|s1_xt37TUKzE| |s2_xtp3RlLzE|)
        (|s<?_xtJaVrKzE|)
        (|s<?_xtJaVrKzE|
          (string->list |s1_xt37TUKzE|)
          (string->list |s2_xtp3RlLzE|))))))
(#%program
  ((|s1_xttJE3OzE| . 1)
   (|c2_xtbrukQzE| . 2)
   (char>? . 1)
   (|s2_xtvyyqPzE| . 3)
   (not . 1)
   (|s>?_xt7NGCNzE| . 2)
   (cdr . 2)
   (string->list . 2)
   (char<? . 1)
   (|c1_xtRuwTPzE| . 2)
   (|s1_xt9CAZOzE| . 4)
   (car . 2)
   (|s2_xtPFCwOzE| . 1)
   (null? . 3))
  ((|s>?_xt7NGCNzE| . 1))
  (cdr string->list char<? char>? car not null?)
  (#%define string>?
    (#%letrec #t
      ((|s>?_xt7NGCNzE|
         (#%lambda #t
           (|s1_xt9CAZOzE| |s2_xtvyyqPzE|)
           (|s>?_xt7NGCNzE|)
           (#%if (null? |s2_xtvyyqPzE|)
             (#%if (null? |s1_xt9CAZOzE|) #f #t)
             (#%if (null? |s1_xt9CAZOzE|)
               #f
               ((#%lambda #t
                  (|c1_xtRuwTPzE| |c2_xtbrukQzE|)
                  (|s1_xt9CAZOzE| |s2_xtvyyqPzE| |s>?_xt7NGCNzE|)
                  (#%if (char>? |c1_xtRuwTPzE| |c2_xtbrukQzE|)
                    #t
                    (#%if (char<? |c1_xtRuwTPzE| |c2_xtbrukQzE|)
                      #f
                      (|s>?_xt7NGCNzE|
                        (cdr |s1_xt9CAZOzE|)
                        (cdr |s2_xtvyyqPzE|)))))
                (car |s1_xt9CAZOzE|)
                (car |s2_xtvyyqPzE|)))))))
      ()
      (#%lambda #t
        (|s1_xttJE3OzE| |s2_xtPFCwOzE|)
        (|s>?_xt7NGCNzE|)
        (|s>?_xt7NGCNzE|
          (string->list |s1_xttJE3OzE|)
          (string->list |s2_xtPFCwOzE|))))))
(#%program
  ((string=? . 1)
   (string<? . 1)
   (|s1_xtxnsNQzE| . 2)
   (|s2_xtTjqeRzE| . 2))
  ()
  (string=? string<?)
  (#%define string<=?
    (#%lambda #t
      (|s1_xtxnsNQzE| |s2_xtTjqeRzE|)
      ()
      (#%if (string<? |s1_xtxnsNQzE| |s2_xtTjqeRzE|)
        #t
        (string=? |s1_xtxnsNQzE| |s2_xtTjqeRzE|)))))
(#%program
  ((|s2_xtzcm8SzE| . 2)
   (string=? . 1)
   (|s1_xtdgoHRzE| . 2)
   (string>? . 1))
  ()
  (string=? string>?)
  (#%define string>=?
    (#%lambda #t
      (|s1_xtdgoHRzE| |s2_xtzcm8SzE|)
      ()
      (#%if (string>? |s1_xtdgoHRzE| |s2_xtzcm8SzE|)
        #t
        (string=? |s1_xtdgoHRzE| |s2_xtzcm8SzE|)))))
(#%program
  ((string-downcase . 2)
   (string=? . 1)
   (|s1_xtV8kBSzE| . 1)
   (|s2_xtf5i2TzE| . 1))
  ()
  (string-downcase string=?)
  (#%define string-ci=?
    (#%lambda #t
      (|s1_xtV8kBSzE| |s2_xtf5i2TzE|)
      ()
      (string=?
        (string-downcase |s1_xtV8kBSzE|)
        (string-downcase |s2_xtf5i2TzE|)))))
(#%program
  ((string-downcase . 2)
   (|s1_xtB1gvTzE| . 1)
   (string<? . 1)
   (|s2_xtXZdYTzE| . 1))
  ()
  (string-downcase string<?)
  (#%define string-ci<?
    (#%lambda #t
      (|s1_xtB1gvTzE| |s2_xtXZdYTzE|)
      ()
      (string<?
        (string-downcase |s1_xtB1gvTzE|)
        (string-downcase |s2_xtXZdYTzE|)))))
(#%program
  ((string-downcase . 2)
   (|s1_xthWbpUzE| . 1)
   (string>? . 1)
   (|s2_xtDS9SUzE| . 1))
  ()
  (string-downcase string>?)
  (#%define string-ci>?
    (#%lambda #t
      (|s1_xthWbpUzE| |s2_xtDS9SUzE|)
      ()
      (string>?
        (string-downcase |s1_xthWbpUzE|)
        (string-downcase |s2_xtDS9SUzE|)))))
(#%program
  ((string-downcase . 2)
   (|s2_xtjL5MVzE| . 1)
   (string>=? . 1)
   (|s1_xtZO7jVzE| . 1))
  ()
  (string-downcase string>=?)
  (#%define string-ci>=?
    (#%lambda #t
      (|s1_xtZO7jVzE| |s2_xtjL5MVzE|)
      ()
      (string>=?
        (string-downcase |s1_xtZO7jVzE|)
        (string-downcase |s2_xtjL5MVzE|)))))
(#%program
  ((string-downcase . 2)
   (|s2_xt_D1GWzE| . 1)
   (|s1_xtFH3dWzE| . 1)
   (string<=? . 1))
  ()
  (string-downcase string<=?)
  (#%define string-ci<=?
    (#%lambda #t
      (|s1_xtFH3dWzE| |s2_xt_D1GWzE|)
      ()
      (string<=?
        (string-downcase |s1_xtFH3dWzE|)
        (string-downcase |s2_xt_D1GWzE|)))))
(#%program
  ((|start_xt1tX0YzE| . 2)
   (+ . 2)
   (|newstr_xtJlTWYzE| . 2)
   (|str_xtHwZzXzE| . 1)
   (< . 1)
   (|end_xtnpVtYzE| . 2)
   (make-string . 1)
   (|fill-string_xtlA_6XzE| . 2)
   (string-set! . 1)
   (|s_xt57LK-zE| . 3)
   (|e_xtr3Jb_zE| . 2)
   (|sstr_xt3iRnZzE| . 2)
   (|dstr_xtpePQZzE| . 2)
   (string-ref . 1)
   (|n_xtLaNh-zE| . 2)
   (- . 1))
  ((|fill-string_xtlA_6XzE| . 1))
  (string-set! + string-ref - < make-string)
  (#%define substring
    (#%letrec #t
      ((|fill-string_xtlA_6XzE|
         (#%lambda #t
           (|sstr_xt3iRnZzE|
             |dstr_xtpePQZzE|
             |n_xtLaNh-zE|
             |s_xt57LK-zE|
             |e_xtr3Jb_zE|)
           (|fill-string_xtlA_6XzE|)
           (#%if (< |s_xt57LK-zE| |e_xtr3Jb_zE|)
             (#%begin
               (string-set!
                 |dstr_xtpePQZzE|
                 |n_xtLaNh-zE|
                 (string-ref |sstr_xt3iRnZzE| |s_xt57LK-zE|))
               (|fill-string_xtlA_6XzE|
                 |sstr_xt3iRnZzE|
                 |dstr_xtpePQZzE|
                 (+ |n_xtLaNh-zE| 1)
                 (+ |s_xt57LK-zE| 1)
                 |e_xtr3Jb_zE|))
             #!void))))
      ()
      (#%lambda #t
        (|str_xtHwZzXzE|
          |start_xt1tX0YzE|
          |end_xtnpVtYzE|)
        (|fill-string_xtlA_6XzE|)
        ((#%lambda #t
           (|newstr_xtJlTWYzE|)
           (|str_xtHwZzXzE|
             |start_xt1tX0YzE|
             |end_xtnpVtYzE|
             |fill-string_xtlA_6XzE|)
           (#%begin
             (|fill-string_xtlA_6XzE|
               |str_xtHwZzXzE|
               |newstr_xtJlTWYzE|
               0
               |start_xt1tX0YzE|
               |end_xtnpVtYzE|)
             |newstr_xtJlTWYzE|))
         (make-string
           (- |end_xtnpVtYzE| |start_xt1tX0YzE|)))))))
(#%program
  ((cdr . 1)
   (|n_xt7YE50AE| . 2)
   (|list_xtN_GE_zE| . 2)
   (- . 1)
   (car . 1)
   (zero? . 1)
   (list-ref . 1))
  ()
  (cdr - car list-ref zero?)
  (#%define list-ref
    (#%lambda #t
      (|list_xtN_GE_zE| |n_xt7YE50AE|)
      ()
      (#%if (zero? |n_xt7YE50AE|)
        (car |list_xtN_GE_zE|)
        (list-ref
          (cdr |list_xtN_GE_zE|)
          (- |n_xt7YE50AE| 1))))))
(#%program
  ((|args_xttUCy0AE| . 1)
   (call-with-current-continuation . 1)
   (apply . 1)
   (|k_xtPQA_0AE| . 1))
  ()
  (call-with-current-continuation apply)
  (#%define values
    (#%lambda #t
      |args_xttUCy0AE|
      ()
      (call-with-current-continuation
        (#%lambda #t
          (|k_xtPQA_0AE|)
          (|args_xttUCy0AE|)
          (apply |k_xtPQA_0AE| |args_xttUCy0AE|))))))
