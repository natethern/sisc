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
   (|proc_sSUAxU9sw| . 2)
   (apply . 2)
   (cons . 1)
   (|lists_sScIB-8sw| . 4)
   (|ls1_sSyEzr9sw| . 2)
   (null? . 1))
  ((|lists_sScIB-8sw| . 1))
  (cons map-car apply map-cdr for-each null?)
  (#%define for-each
    (#%lambda #t
      (|proc_sSUAxU9sw|
        |ls1_sSyEzr9sw|
        .
        |lists_sScIB-8sw|)
      ()
      (#%if (null? |ls1_sSyEzr9sw|)
        #!void
        (#%begin
          (#%set! |lists_sScIB-8sw|
            (cons |ls1_sSyEzr9sw| |lists_sScIB-8sw|))
          (apply |proc_sSUAxU9sw|
                 (map-car |lists_sScIB-8sw|))
          (apply for-each
                 |proc_sSUAxU9sw|
                 (map-cdr |lists_sScIB-8sw|)))))))
(#%program
  ((|x_sSexvlasw| . 1) (eq? . 1))
  ()
  (eq?)
  (#%define eof-object?
    (#%lambda #t
      (|x_sSexvlasw|)
      ()
      (eq? |x_sSexvlasw| #!eof))))
(#%program
  ((|x_sSAttOasw| . 1))
  ()
  ()
  (#%define not
    (#%lambda #t
      (|x_sSAttOasw|)
      ()
      (#%if |x_sSAttOasw| #f #t))))
(#%program
  ((|port_sSWprfbsw| . 1)
   (|display| . 1)
   (apply . 1))
  ()
  (|display| apply)
  (#%define newline
    (#%lambda #t
      |port_sSWprfbsw|
      ()
      (apply |display|
             #\newline
             |port_sSWprfbsw|))))
(#%program
  ((|ls_sSCin9csw| . 1)
   (car . 1)
   (cons . 1)
   (cdr . 1)
   (|iter_sSgmpIbsw| . 2)
   (|acc_sSibj3dsw| . 2)
   (|ls_sSYelCcsw| . 3)
   (null? . 1))
  ((|iter_sSgmpIbsw| . 1))
  (cdr car cons null?)
  (#%define reverse
    (#%letrec #t
      ((|iter_sSgmpIbsw|
         (#%lambda #t
           (|ls_sSYelCcsw| |acc_sSibj3dsw|)
           (|iter_sSgmpIbsw|)
           (#%if (null? |ls_sSYelCcsw|)
             |acc_sSibj3dsw|
             (|iter_sSgmpIbsw|
               (cdr |ls_sSYelCcsw|)
               (cons (car |ls_sSYelCcsw|) |acc_sSibj3dsw|))))))
      ()
      (#%lambda #t
        (|ls_sSCin9csw|)
        (|iter_sSgmpIbsw|)
        (|iter_sSgmpIbsw| |ls_sSCin9csw| ())))))
(#%program
  ((|s_sS-3fZdsw| . 1)
   (cdr . 1)
   (|d_sS0V8kfsw| . 1)
   (|iter_sSE7hwdsw| . 2)
   (set-cdr! . 1)
   (|r_sSGYaTesw| . 2)
   (|s_sSk0dqesw| . 4)
   (null? . 1))
  ((|iter_sSE7hwdsw| . 1))
  (set-cdr! cdr null?)
  (#%define reverse!
    (#%letrec #t
      ((|iter_sSE7hwdsw|
         (#%lambda #t
           (|s_sSk0dqesw| |r_sSGYaTesw|)
           (|iter_sSE7hwdsw|)
           (#%if (null? |s_sSk0dqesw|)
             |r_sSGYaTesw|
             ((#%lambda #t
                (|d_sS0V8kfsw|)
                (|r_sSGYaTesw| |s_sSk0dqesw| |iter_sSE7hwdsw|)
                (#%begin
                  (set-cdr! |s_sSk0dqesw| |r_sSGYaTesw|)
                  (|iter_sSE7hwdsw| |d_sS0V8kfsw| |s_sSk0dqesw|)))
              (cdr |s_sSk0dqesw|))))))
      ()
      (#%lambda #t
        (|s_sS-3fZdsw|)
        (|iter_sSE7hwdsw|)
        (|iter_sSE7hwdsw| |s_sS-3fZdsw| ())))))
(#%program
  ((cdr . 1)
   (map-car . 1)
   (caar . 1)
   (cons . 1)
   (|ls_sSmR6Nfsw| . 3)
   (null? . 1))
  ()
  (cons caar cdr map-car null?)
  (#%define map-car
    (#%lambda #t
      (|ls_sSmR6Nfsw|)
      ()
      (#%if (null? |ls_sSmR6Nfsw|)
        ()
        (cons (caar |ls_sSmR6Nfsw|)
              (map-car (cdr |ls_sSmR6Nfsw|)))))))
(#%program
  ((cdr . 1)
   (map-cdr . 1)
   (cdar . 1)
   (cons . 1)
   (|ls_sSIN4egsw| . 3)
   (null? . 1))
  ()
  (cons cdar cdr map-cdr null?)
  (#%define map-cdr
    (#%lambda #t
      (|ls_sSIN4egsw|)
      ()
      (#%if (null? |ls_sSIN4egsw|)
        ()
        (cons (cdar |ls_sSIN4egsw|)
              (map-cdr (cdr |ls_sSIN4egsw|)))))))
(#%program
  ((|list1_sS4zY1isw| . 2)
   (|proc_sSqvWuisw| . 2)
   (|lists_sSKC-Ahsw| . 2)
   (map-car . 1)
   (apply . 1)
   (|lists_sSu9Kclsw| . 2)
   (map-cdr . 1)
   (|proc_sSOgOiksw| . 2)
   (|loop_sSoG08hsw| . 2)
   (|c_sSQ5IFlsw| . 2)
   (|list1_sS8dMLksw| . 3)
   (car . 2)
   (cons . 2)
   (cdr . 2)
   (|proc_sSMrUXisw| . 2)
   (|map1_sS2K2Hgsw| . 2)
   (|acc_sSskQRjsw| . 2)
   (reverse . 2)
   (|list_sS6oSojsw| . 3)
   (null? . 3))
  ((|loop_sSoG08hsw| . 1) (|map1_sS2K2Hgsw| . 1))
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
      ((|map1_sS2K2Hgsw|
         (#%lambda #t
           (|proc_sSMrUXisw|
             |list_sS6oSojsw|
             |acc_sSskQRjsw|)
           (|map1_sS2K2Hgsw|)
           (#%if (null? |list_sS6oSojsw|)
             (reverse |acc_sSskQRjsw|)
             (|map1_sS2K2Hgsw|
               |proc_sSMrUXisw|
               (cdr |list_sS6oSojsw|)
               (cons (|proc_sSMrUXisw| (car |list_sS6oSojsw|))
                     |acc_sSskQRjsw|)))))
       (|loop_sSoG08hsw|
         (#%lambda #t
           (|proc_sSOgOiksw|
             |list1_sS8dMLksw|
             |lists_sSu9Kclsw|
             |c_sSQ5IFlsw|)
           (|loop_sSoG08hsw|)
           (#%if (null? |list1_sS8dMLksw|)
             (reverse |c_sSQ5IFlsw|)
             (|loop_sSoG08hsw|
               |proc_sSOgOiksw|
               (cdr |list1_sS8dMLksw|)
               (map-cdr |lists_sSu9Kclsw|)
               (cons (apply |proc_sSOgOiksw|
                            (car |list1_sS8dMLksw|)
                            (map-car |lists_sSu9Kclsw|))
                     |c_sSQ5IFlsw|))))))
      ()
      (#%lambda #t
        (|proc_sSqvWuisw|
          |list1_sS4zY1isw|
          .
          |lists_sSKC-Ahsw|)
        (|loop_sSoG08hsw| |map1_sS2K2Hgsw|)
        (#%if (null? |lists_sSKC-Ahsw|)
          (|map1_sS2K2Hgsw|
            |proc_sSqvWuisw|
            |list1_sS4zY1isw|
            ())
          (|loop_sSoG08hsw|
            |proc_sSqvWuisw|
            |list1_sS4zY1isw|
            |lists_sSKC-Ahsw|
            ()))))))
(#%program
  ((|x_sSSWB0nsw| . 1)
   (|g_sSw-Dzmsw| . 1)
   (|f_sSa2G6msw| . 1))
  ()
  ()
  (#%define compose2
    (#%lambda #t
      (|f_sSa2G6msw| |g_sSw-Dzmsw|)
      ()
      (#%lambda #t
        (|x_sSSWB0nsw|)
        (|g_sSw-Dzmsw| |f_sSa2G6msw|)
        (|f_sSa2G6msw| (|g_sSw-Dzmsw| |x_sSSWB0nsw|))))))
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
  ((|list_sSG79mtsw| . 1)
   (|obj_sSkbbVssw| . 1)
   (member . 1)
   (|list_sS-edsssw| . 1)
   (|obj_sSEif_rsw| . 1)
   (memv . 1)
   (|list_sSimhyrsw| . 1)
   (|obj_sSYpj5rsw| . 1)
   (memq . 1)
   (|alist_sSCtlEqsw| . 1)
   (|obj_sSgxnbqsw| . 1)
   (equal? . 2)
   (assoc . 1)
   (|alist_sSWApKpsw| . 1)
   (|obj_sSAErhpsw| . 1)
   (eqv? . 2)
   (assv . 1)
   (|alist_sSeItQosw| . 1)
   (|obj_sSULvnosw| . 1)
   (eq? . 2)
   (assq . 1)
   (|memn_sSyPxWnsw| . 4)
   (|obj_sSoR-Cvsw| . 2)
   (|n_sS2V0avsw| . 2)
   (|list_sSKNY3wsw| . 4)
   (cdr . 2)
   (|assn_sScTztnsw| . 4)
   (car . 2)
   (|obj_sSm05gusw| . 2)
   (caar . 1)
   (|n_sS047Ptsw| . 2)
   (|alist_sSIY2Jusw| . 4)
   (null? . 2))
  ((member . 1)
   (memv . 1)
   (memq . 1)
   (assoc . 1)
   (assv . 1)
   (assq . 1)
   (|memn_sSyPxWnsw| . 1)
   (|assn_sScTztnsw| . 1))
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
    ((|assn_sScTztnsw|
       (#%lambda #t
         (|n_sS047Ptsw| |obj_sSm05gusw| |alist_sSIY2Jusw|)
         (|assn_sScTztnsw|)
         (#%if (null? |alist_sSIY2Jusw|)
           #f
           (#%if (|n_sS047Ptsw|
                   (caar |alist_sSIY2Jusw|)
                   |obj_sSm05gusw|)
             (car |alist_sSIY2Jusw|)
             (|assn_sScTztnsw|
               |n_sS047Ptsw|
               |obj_sSm05gusw|
               (cdr |alist_sSIY2Jusw|))))))
     (|memn_sSyPxWnsw|
       (#%lambda #t
         (|n_sS2V0avsw| |obj_sSoR-Cvsw| |list_sSKNY3wsw|)
         (|memn_sSyPxWnsw|)
         (#%if (null? |list_sSKNY3wsw|)
           #f
           (#%if (|n_sS2V0avsw|
                   (car |list_sSKNY3wsw|)
                   |obj_sSoR-Cvsw|)
             |list_sSKNY3wsw|
             (|memn_sSyPxWnsw|
               |n_sS2V0avsw|
               |obj_sSoR-Cvsw|
               (cdr |list_sSKNY3wsw|)))))))
    ()
    (#%begin
      (#%set! assq
        (#%lambda #t
          (|obj_sSULvnosw| |alist_sSeItQosw|)
          (|assn_sScTztnsw|)
          (|assn_sScTztnsw|
            eq?
            |obj_sSULvnosw|
            |alist_sSeItQosw|)))
      (#%set! assv
        (#%lambda #t
          (|obj_sSAErhpsw| |alist_sSWApKpsw|)
          (|assn_sScTztnsw|)
          (|assn_sScTztnsw|
            eqv?
            |obj_sSAErhpsw|
            |alist_sSWApKpsw|)))
      (#%set! assoc
        (#%lambda #t
          (|obj_sSgxnbqsw| |alist_sSCtlEqsw|)
          (|assn_sScTztnsw|)
          (|assn_sScTztnsw|
            equal?
            |obj_sSgxnbqsw|
            |alist_sSCtlEqsw|)))
      (#%set! memq
        (#%lambda #t
          (|obj_sSYpj5rsw| |list_sSimhyrsw|)
          (|memn_sSyPxWnsw|)
          (|memn_sSyPxWnsw|
            eq?
            |obj_sSYpj5rsw|
            |list_sSimhyrsw|)))
      (#%set! memv
        (#%lambda #t
          (|obj_sSEif_rsw| |list_sS-edsssw|)
          (|memn_sSyPxWnsw|)
          (|memn_sSyPxWnsw|
            eqv?
            |obj_sSEif_rsw|
            |list_sS-edsssw|)))
      (#%set! member
        (#%lambda #t
          (|obj_sSkbbVssw| |list_sSG79mtsw|)
          (|memn_sSyPxWnsw|)
          (|memn_sSyPxWnsw|
            equal?
            |obj_sSkbbVssw|
            |list_sSG79mtsw|))))))
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
   (|ls2_sSqGUZwsw| . 2)
   (|ls1_sS4KWwwsw| . 3)
   (null? . 1))
  ()
  (cons car cdr append2 null?)
  (#%define append2
    (#%lambda #t
      (|ls1_sS4KWwwsw| |ls2_sSqGUZwsw|)
      ()
      (#%if (null? |ls1_sS4KWwwsw|)
        |ls2_sSqGUZwsw|
        (cons (car |ls1_sS4KWwwsw|)
              (append2 (cdr |ls1_sS4KWwwsw|) |ls2_sSqGUZwsw|))))))
(#%program
  ((append2 . 1))
  ()
  (append2)
  (#%define append append2))
(#%program
  ((length . 1)
   (make-string . 1)
   (|l_sS6zQTxsw| . 2)
   (+ . 1)
   (cdr . 1)
   (|l2s_sSMCSqxsw| . 2)
   (car . 1)
   (|n_sS8oKezsw| . 2)
   (string-set! . 1)
   (|s_sSOrMNysw| . 3)
   (|l_sSsvOkysw| . 3)
   (null? . 1))
  ((|l2s_sSMCSqxsw| . 1))
  (make-string length car string-set! + cdr null?)
  (#%define list->string
    (#%letrec #t
      ((|l2s_sSMCSqxsw|
         (#%lambda #t
           (|l_sSsvOkysw| |s_sSOrMNysw| |n_sS8oKezsw|)
           (|l2s_sSMCSqxsw|)
           (#%if (null? |l_sSsvOkysw|)
             |s_sSOrMNysw|
             (#%begin
               (string-set!
                 |s_sSOrMNysw|
                 |n_sS8oKezsw|
                 (car |l_sSsvOkysw|))
               (|l2s_sSMCSqxsw|
                 (cdr |l_sSsvOkysw|)
                 |s_sSOrMNysw|
                 (+ |n_sS8oKezsw| 1)))))))
      ()
      (#%lambda #t
        (|l_sS6zQTxsw|)
        (|l2s_sSMCSqxsw|)
        (|l2s_sSMCSqxsw|
          |l_sS6zQTxsw|
          (make-string (length |l_sS6zQTxsw|))
          0)))))
(#%program
  ((string-length . 1)
   (|s_sSQgG8Asw| . 2)
   (- . 2)
   (string-ref . 1)
   (cons . 1)
   (|s_sSadEBAsw| . 2)
   (|s2l_sSukIHzsw| . 2)
   (|h_sSw9C2Bsw| . 2)
   (|n_sSS5AvBsw| . 3)
   (< . 1))
  ((|s2l_sSukIHzsw| . 1))
  (string-length string-ref cons - <)
  (#%define string->list
    (#%letrec #t
      ((|s2l_sSukIHzsw|
         (#%lambda #t
           (|s_sSadEBAsw| |h_sSw9C2Bsw| |n_sSS5AvBsw|)
           (|s2l_sSukIHzsw|)
           (#%if (< |n_sSS5AvBsw| 0)
             |h_sSw9C2Bsw|
             (|s2l_sSukIHzsw|
               |s_sSadEBAsw|
               (cons (string-ref |s_sSadEBAsw| |n_sSS5AvBsw|)
                     |h_sSw9C2Bsw|)
               (- |n_sSS5AvBsw| 1))))))
      ()
      (#%lambda #t
        (|s_sSQgG8Asw|)
        (|s2l_sSukIHzsw|)
        (|s2l_sSukIHzsw|
          |s_sSQgG8Asw|
          ()
          (- (string-length |s_sSQgG8Asw|) 1))))))
(#%program
  ((error . 1)
   (length . 1)
   (make-vector . 1)
   (|l_sSy-vpCsw| . 4)
   (proper-list? . 1)
   (+ . 1)
   (cdr . 1)
   (|l2v_sSc2yYBsw| . 2)
   (car . 1)
   (|n_sSAPpMDsw| . 2)
   (vector-set! . 1)
   (|v_sSeTrjDsw| . 3)
   (|l_sSUWtSCsw| . 3)
   (null? . 1))
  ((|l2v_sSc2yYBsw| . 1))
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
      ((|l2v_sSc2yYBsw|
         (#%lambda #t
           (|l_sSUWtSCsw| |v_sSeTrjDsw| |n_sSAPpMDsw|)
           (|l2v_sSc2yYBsw|)
           (#%if (null? |l_sSUWtSCsw|)
             |v_sSeTrjDsw|
             (#%begin
               (vector-set!
                 |v_sSeTrjDsw|
                 |n_sSAPpMDsw|
                 (car |l_sSUWtSCsw|))
               (|l2v_sSc2yYBsw|
                 (cdr |l_sSUWtSCsw|)
                 |v_sSeTrjDsw|
                 (+ |n_sSAPpMDsw| 1)))))))
      ()
      (#%lambda #t
        (|l_sSy-vpCsw|)
        (|l2v_sSc2yYBsw|)
        (#%if (proper-list? |l_sSy-vpCsw|)
          (|l2v_sSc2yYBsw|
            |l_sSy-vpCsw|
            (make-vector (length |l_sSy-vpCsw|))
            0)
          (error (#%quote list->vector)
                 "can only convert a proper list."
                 |l_sSy-vpCsw|))))))
(#%program
  ((|elems_sSWLndEsw| . 1) (list->vector . 1))
  ()
  (list->vector)
  (#%define vector
    (#%lambda #t
      |elems_sSWLndEsw|
      ()
      (list->vector |elems_sSWLndEsw|))))
(#%program
  ((|elems_sSgIlGEsw| . 1) (list->string . 1))
  ()
  (list->string)
  (#%define string
    (#%lambda #t
      |elems_sSgIlGEsw|
      ()
      (list->string |elems_sSgIlGEsw|))))
(#%program
  ((_make-parameter . 1))
  ()
  (_make-parameter)
  (#%define current-url (_make-parameter "file:.")))
(#%program
  ((car . 1)
   (string-length . 1)
   (string-append . 1)
   (|l_sSixf1Gsw| . 1)
   (- . 1)
   (|v_sSYAhAFsw| . 4)
   (string-ref . 1)
   (eqv? . 1)
   (current-url . 3)
   (normalize-url . 2)
   (|rest_sSCEj7Fsw| . 2)
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
      |rest_sSCEj7Fsw|
      ()
      (#%if (null? |rest_sSCEj7Fsw|)
        (normalize-url (current-url) ".")
        (current-url
          (normalize-url
            (current-url)
            ((#%lambda #t
               (|v_sSYAhAFsw|)
               ()
               ((#%lambda #t
                  (|l_sSixf1Gsw|)
                  (|v_sSYAhAFsw|)
                  (#%if (eqv? (string-ref |v_sSYAhAFsw| (- |l_sSixf1Gsw| 1))
                              #\/)
                    |v_sSYAhAFsw|
                    (string-append |v_sSYAhAFsw| "/")))
                (string-length |v_sSYAhAFsw|)))
             (car |rest_sSCEj7Fsw|))))))))
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
   (|extension_sS0f5iIsw| . 1)
   (string-downcase . 1)
   (string->symbol . 1)
   (|_load_sSGi7RHsw| . 1)
   (cdr . 1)
   (|t_sSmb3LIsw| . 2)
   (file-handler . 1)
   (|thunk_sSkm9oHsw| . 1)
   (cons . 2)
   (|*file-handlers*_sSEtduGsw| . 4)
   (|extension_sS-pbXGsw| . 2)
   (assq . 2)
   (not . 1)
   (add-file-handler . 1))
  ((file-handler . 1)
   (|*file-handlers*_sSEtduGsw| . 1)
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
     (|*file-handlers*_sSEtduGsw|)
     ()
     (#%begin
       (#%set! add-file-handler
         (#%lambda #t
           (|extension_sS-pbXGsw| |thunk_sSkm9oHsw|)
           (|*file-handlers*_sSEtduGsw|)
           (#%if (not (assq |extension_sS-pbXGsw|
                            |*file-handlers*_sSEtduGsw|))
             (#%set! |*file-handlers*_sSEtduGsw|
               (cons (cons |extension_sS-pbXGsw| |thunk_sSkm9oHsw|)
                     |*file-handlers*_sSEtduGsw|))
             #!void)))
       (#%set! file-handler
         ((#%lambda #t
            (|_load_sSGi7RHsw|)
            (|*file-handlers*_sSEtduGsw|)
            (#%lambda #t
              (|extension_sS0f5iIsw|)
              (|_load_sSGi7RHsw| |*file-handlers*_sSEtduGsw|)
              ((#%lambda #t
                 (|t_sSmb3LIsw|)
                 (|_load_sSGi7RHsw|)
                 (#%if |t_sSmb3LIsw|
                   (cdr |t_sSmb3LIsw|)
                   |_load_sSGi7RHsw|))
               (assq (string->symbol
                       (string-downcase |extension_sS0f5iIsw|))
                     |*file-handlers*_sSEtduGsw|))))
          load))))
   ()))
(#%program
  ((|rest_sS24_EJsw| . 1)
   (|file_sSo0Z5Ksw| . 1)
   (current-url . 1)
   (normalize-url . 1)
   (|proc_sSI71cJsw| . 1)
   (apply . 1))
  ()
  (apply current-url normalize-url)
  (#%define make-io-proc
    (#%lambda #t
      (|proc_sSI71cJsw|)
      ()
      (#%lambda #t
        (|file_sSo0Z5Ksw| . |rest_sS24_EJsw|)
        (|proc_sSI71cJsw|)
        (apply |proc_sSI71cJsw|
               (normalize-url (current-url) |file_sSo0Z5Ksw|)
               |rest_sS24_EJsw|)))))
(#%program
  ((|url_sS8zIJNsw| . 1)
   (string->list . 1)
   (reverse! . 1)
   (cons . 1)
   (cdr . 1)
   (|loop_sSuvGaOsw| . 2)
   (|acc_sSaoC4Psw| . 2)
   (list->string . 1)
   (car . 2)
   (equal? . 1)
   (|x_sSQrEDOsw| . 4)
   (null? . 1)
   (void . 1)
   (|file-extension_sSKYWyKsw| . 1)
   (|fe_sSOCKgNsw| . 2)
   (file-handler . 1)
   (|e_sS6KOmMsw| . 1)
   (|m_sSMNQVLsw| . 1)
   (|fk_sSsGMPMsw| . 1)
   (call-with-failure-continuation . 1)
   (with-failure-continuation . 1)
   (|file_sS4VU_Ksw| . 1)
   (|previous-url_sSqRSsLsw| . 3)
   (normalize-url . 1)
   (current-url . 6)
   (load . 1)
   (|open-output-file| . 2)
   (open-source-input-file . 2)
   (make-io-proc . 3)
   (|open-input-file| . 2))
  ((|loop_sSuvGaOsw| . 1)
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
     (|file-extension_sSKYWyKsw|)
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
           (|file_sS4VU_Ksw|)
           (|file-extension_sSKYWyKsw|)
           (#%begin
             ((#%lambda #t
                (|previous-url_sSqRSsLsw|)
                (|file_sS4VU_Ksw| |file-extension_sSKYWyKsw|)
                (#%begin
                  (current-url
                    (normalize-url
                      |previous-url_sSqRSsLsw|
                      |file_sS4VU_Ksw|))
                  (with-failure-continuation
                    (#%lambda #t
                      (|m_sSMNQVLsw| |e_sS6KOmMsw|)
                      (|previous-url_sSqRSsLsw|)
                      (#%begin
                        (current-url |previous-url_sSqRSsLsw|)
                        (call-with-failure-continuation
                          (#%lambda #t
                            (|fk_sSsGMPMsw|)
                            (|e_sS6KOmMsw| |m_sSMNQVLsw|)
                            (|fk_sSsGMPMsw| |m_sSMNQVLsw| |e_sS6KOmMsw|)))))
                    (#%lambda #t
                      ()
                      (|file-extension_sSKYWyKsw|)
                      ((#%lambda #t
                         (|fe_sSOCKgNsw|)
                         ()
                         ((file-handler
                            (#%if |fe_sSOCKgNsw| |fe_sSOCKgNsw| "scm"))
                          (current-url)))
                       (|file-extension_sSKYWyKsw| (current-url)))))
                  (current-url |previous-url_sSqRSsLsw|)))
              (current-url))
             (void))))))
   (#%lambda #t
     (|url_sS8zIJNsw|)
     ()
     ((#%letrec #t
        ((|loop_sSuvGaOsw|
           (#%lambda #t
             (|x_sSQrEDOsw| |acc_sSaoC4Psw|)
             (|loop_sSuvGaOsw|)
             (#%if (null? |x_sSQrEDOsw|)
               #f
               (#%if (equal? (car |x_sSQrEDOsw|) #\.)
                 (list->string |acc_sSaoC4Psw|)
                 (|loop_sSuvGaOsw|
                   (cdr |x_sSQrEDOsw|)
                   (cons (car |x_sSQrEDOsw|) |acc_sSaoC4Psw|)))))))
        ()
        |loop_sSuvGaOsw|)
      (reverse! (string->list |url_sS8zIJNsw|))
      ()))))
(#%program
  ((|str_sSwkAxPsw| . 1)
   (load-native-library . 1)
   (native-library-binding-names . 1)
   (|binding-names_sScdwrQsw| . 1)
   (|nl_sSSgy-Psw| . 2)
   (native-library-binding . 1)
   (|name_sSy9uUQsw| . 2)
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
      (|str_sSwkAxPsw|)
      ()
      ((#%lambda #t
         (|nl_sSSgy-Psw|)
         ()
         ((#%lambda #t
            (|binding-names_sScdwrQsw|)
            (|nl_sSSgy-Psw|)
            (for-each
              (#%lambda #t
                (|name_sSy9uUQsw|)
                (|nl_sSSgy-Psw|)
                (putprop
                  |name_sSy9uUQsw|
                  (native-library-binding
                    |nl_sSSgy-Psw|
                    |name_sSy9uUQsw|)))
              |binding-names_sScdwrQsw|))
          (native-library-binding-names |nl_sSSgy-Psw|)))
       (load-native-library |str_sSwkAxPsw|)))))
(#%program
  ((|lses_sSe2qORsw| . 5)
   (cdr . 3)
   (car . 3)
   (append2 . 1)
   (|real-append_sSU5slRsw| . 3)
   (apply . 3)
   (|ls1_sSWWlISsw| . 3)
   (|lses_sSA-nfSsw| . 4)
   (null? . 4))
  ((|real-append_sSU5slRsw| . 1))
  (apply cdr append2 car null?)
  (#%define append
    (#%letrec #t
      ((|real-append_sSU5slRsw|
         (#%lambda #t
           (|ls1_sSWWlISsw| . |lses_sSA-nfSsw|)
           (|real-append_sSU5slRsw|)
           (#%if (null? |lses_sSA-nfSsw|)
             |ls1_sSWWlISsw|
             (#%if (null? |ls1_sSWWlISsw|)
               (apply |real-append_sSU5slRsw| |lses_sSA-nfSsw|)
               (apply |real-append_sSU5slRsw|
                      (append2 |ls1_sSWWlISsw| (car |lses_sSA-nfSsw|))
                      (cdr |lses_sSA-nfSsw|)))))))
      ()
      (#%lambda #t
        |lses_sSe2qORsw|
        (|real-append_sSU5slRsw|)
        (#%if (null? |lses_sSe2qORsw|)
          ()
          (#%if (null? (cdr |lses_sSe2qORsw|))
            (car |lses_sSe2qORsw|)
            (apply |real-append_sSU5slRsw|
                   (car |lses_sSe2qORsw|)
                   (cdr |lses_sSe2qORsw|))))))))
(#%program
  ((|x_sSgTj9Tsw| . 2)
   (null? . 2)
   (|lag_sSiIdwUsw| . 1)
   (cdr . 3)
   (|lp_sSCPhCTsw| . 2)
   (|lag_sSkx7TVsw| . 2)
   (|x_sS-A9qVsw| . 2)
   (eq? . 1)
   (not . 1)
   (|x_sSEEbZUsw| . 3)
   (|x_sSYLf3Usw| . 3)
   (pair? . 2))
  ((|lp_sSCPhCTsw| . 1))
  (pair? cdr eq? not null?)
  (#%define proper-list?
    (#%lambda #t
      (|x_sSgTj9Tsw|)
      ()
      ((#%letrec #t
         ((|lp_sSCPhCTsw|
            (#%lambda #t
              (|x_sSYLf3Usw| |lag_sSiIdwUsw|)
              (|lp_sSCPhCTsw|)
              (#%if (pair? |x_sSYLf3Usw|)
                ((#%lambda #t
                   (|x_sSEEbZUsw|)
                   (|lag_sSiIdwUsw| |lp_sSCPhCTsw|)
                   (#%if (pair? |x_sSEEbZUsw|)
                     ((#%lambda #t
                        (|x_sS-A9qVsw| |lag_sSkx7TVsw|)
                        (|lp_sSCPhCTsw|)
                        (#%if (not (eq? |x_sS-A9qVsw| |lag_sSkx7TVsw|))
                          (|lp_sSCPhCTsw| |x_sS-A9qVsw| |lag_sSkx7TVsw|)
                          #f))
                      (cdr |x_sSEEbZUsw|)
                      (cdr |lag_sSiIdwUsw|))
                     (null? |x_sSEEbZUsw|)))
                 (cdr |x_sSYLf3Usw|))
                (null? |x_sSYLf3Usw|)))))
         ()
         |lp_sSCPhCTsw|)
       |x_sSgTj9Tsw|
       |x_sSgTj9Tsw|))))
(#%program
  ((proper-list? . 1))
  ()
  (proper-list?)
  (#%define list? proper-list?))
(#%program
  ((|general-expt_sSGt5kWsw| . 1)
   (denominator . 1)
   (numerator . 1)
   (|rational-expt_sS0q3NWsw| . 1)
   (integer? . 2)
   (not . 1)
   (rational? . 1)
   (|base_sSIi_GXsw| . 9)
   (|exponent_sS2fZ7Ysw| . 8)
   (|squaring_sSQCC61tw| . 3)
   (odd? . 1)
   (quotient . 1)
   (|loop_sSONIL_sw| . 2)
   (|result_sSuGEF0tw| . 3)
   (|rest_sS8KGc0tw| . 3)
   (zero? . 3)
   (ashl . 1)
   (= . 1)
   (exact? . 5)
   (abs . 1)
   (|base_sS6VMR-sw| . 4)
   (|integer-expt_sSmm1eXsw| . 2)
   (|exponent_sSsRKi_sw| . 4)
   (negative? . 1)
   (|base-denominator_sSq0RXZsw| . 1)
   (|exponent_sSMYOo-sw| . 2)
   (|base-numerator_sS44TuZsw| . 1)
   (expt . 2)
   (/ . 2)
   (|base_sSobXAYsw| . 1)
   (log . 1)
   (|exponent_sSK7V1Zsw| . 1)
   (* . 3)
   (exp . 1))
  ((|loop_sSONIL_sw| . 1)
   (|integer-expt_sSmm1eXsw| . 1)
   (|rational-expt_sS0q3NWsw| . 1)
   (|general-expt_sSGt5kWsw| . 1))
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
      ((|general-expt_sSGt5kWsw|
         (#%lambda #t
           (|base_sSobXAYsw| |exponent_sSK7V1Zsw|)
           ()
           (exp (* |exponent_sSK7V1Zsw| (log |base_sSobXAYsw|)))))
       (|rational-expt_sS0q3NWsw|
         (#%lambda #t
           (|base-numerator_sS44TuZsw|
             |base-denominator_sSq0RXZsw|
             |exponent_sSMYOo-sw|)
           ()
           (/ (expt |base-numerator_sS44TuZsw|
                    |exponent_sSMYOo-sw|)
              (expt |base-denominator_sSq0RXZsw|
                    |exponent_sSMYOo-sw|))))
       (|integer-expt_sSmm1eXsw|
         (#%lambda #t
           (|base_sS6VMR-sw| |exponent_sSsRKi_sw|)
           (|integer-expt_sSmm1eXsw|)
           (#%if (negative? |exponent_sSsRKi_sw|)
             (/ (|integer-expt_sSmm1eXsw|
                  |base_sS6VMR-sw|
                  (abs |exponent_sSsRKi_sw|)))
             (#%if (#%if (exact? |base_sS6VMR-sw|)
                     (= |base_sS6VMR-sw| 2)
                     #f)
               (ashl 1 |exponent_sSsRKi_sw|)
               ((#%letrec #t
                  ((|loop_sSONIL_sw|
                     (#%lambda #t
                       (|rest_sS8KGc0tw|
                         |result_sSuGEF0tw|
                         |squaring_sSQCC61tw|)
                       (|loop_sSONIL_sw|)
                       (#%if (zero? |rest_sS8KGc0tw|)
                         |result_sSuGEF0tw|
                         (|loop_sSONIL_sw|
                           (quotient |rest_sS8KGc0tw| 2)
                           (#%if (odd? |rest_sS8KGc0tw|)
                             (* |result_sSuGEF0tw| |squaring_sSQCC61tw|)
                             |result_sSuGEF0tw|)
                           (* |squaring_sSQCC61tw| |squaring_sSQCC61tw|))))))
                  ()
                  |loop_sSONIL_sw|)
                |exponent_sSsRKi_sw|
                1
                |base_sS6VMR-sw|))))))
      ()
      (#%lambda #t
        (|base_sSIi_GXsw| |exponent_sS2fZ7Ysw|)
        (|integer-expt_sSmm1eXsw|
          |rational-expt_sS0q3NWsw|
          |general-expt_sSGt5kWsw|)
        (#%if (zero? |exponent_sS2fZ7Ysw|)
          (#%if (exact? |exponent_sS2fZ7Ysw|) 1 1.0)
          (#%if (zero? |base_sSIi_GXsw|)
            (#%if (exact? |exponent_sS2fZ7Ysw|)
              |base_sSIi_GXsw|
              0.0)
            (#%if (#%if (exact? |base_sSIi_GXsw|)
                    (#%if (rational? |base_sSIi_GXsw|)
                      (not (integer? |base_sSIi_GXsw|))
                      #f)
                    #f)
              (|rational-expt_sS0q3NWsw|
                (numerator |base_sSIi_GXsw|)
                (denominator |base_sSIi_GXsw|)
                |exponent_sS2fZ7Ysw|)
              (#%if (#%if (exact? |exponent_sS2fZ7Ysw|)
                      (integer? |exponent_sS2fZ7Ysw|)
                      #f)
                (|integer-expt_sSmm1eXsw|
                  |base_sSIi_GXsw|
                  |exponent_sS2fZ7Ysw|)
                (|general-expt_sSGt5kWsw|
                  |base_sSIi_GXsw|
                  |exponent_sS2fZ7Ysw|)))))))))
(#%program
  ((- . 1)
   (|tmp_sScouW2tw| . 2)
   (/ . 2)
   (modpow . 2)
   (|tmp_sSyksn3tw| . 2)
   (* . 3)
   (even? . 1)
   (|n_sSSrwt2tw| . 6)
   (|x_sSazAz1tw| . 4)
   (modulo . 4)
   (|y_sSwvy02tw| . 4)
   (= . 1))
  ()
  (even? modpow / * - modulo =)
  (#%define modpow
    (#%lambda #t
      (|x_sSazAz1tw| |y_sSwvy02tw| |n_sSSrwt2tw|)
      ()
      (#%if (= |y_sSwvy02tw| 1)
        (modulo |x_sSazAz1tw| |n_sSSrwt2tw|)
        (#%if (even? |y_sSwvy02tw|)
          ((#%lambda #t
             (|tmp_sSyksn3tw|)
             (|n_sSSrwt2tw|)
             (modulo
               (* |tmp_sSyksn3tw| |tmp_sSyksn3tw|)
               |n_sSSrwt2tw|))
           (modpow
             |x_sSazAz1tw|
             (/ |y_sSwvy02tw| 2)
             |n_sSSrwt2tw|))
          ((#%lambda #t
             (|tmp_sScouW2tw|)
             (|n_sSSrwt2tw| |x_sSazAz1tw|)
             (modulo
               (* |x_sSazAz1tw|
                  (modulo
                    (* |tmp_sScouW2tw| |tmp_sScouW2tw|)
                    |n_sSSrwt2tw|))
               |n_sSSrwt2tw|))
           (modpow
             |x_sSazAz1tw|
             (/ (- |y_sSwvy02tw| 1) 2)
             |n_sSSrwt2tw|)))))))
(#%program
  ((integer? . 1)
   (round . 1)
   (= . 1)
   (real? . 1)
   (|n_sSedoh4tw| . 4)
   (|oldint?_sSUgqQ3tw| . 1))
  ()
  (integer? = round real?)
  (#%define integer?
    ((#%lambda #t
       (|oldint?_sSUgqQ3tw|)
       ()
       (#%lambda #t
         (|n_sSedoh4tw|)
         (|oldint?_sSUgqQ3tw|)
         (#%if (|oldint?_sSUgqQ3tw| |n_sSedoh4tw|)
           #t
           (#%if (real? |n_sSedoh4tw|)
             (= (round |n_sSedoh4tw|) |n_sSedoh4tw|)
             #f))))
     integer?)))
(#%program
  ((complex? . 1)
   (|oldcomp?_sSA9mK4tw| . 1)
   (not . 1)
   (|n_sSW5kb5tw| . 2)
   (number? . 1))
  ()
  (complex? number? not)
  (#%define real?
    ((#%lambda #t
       (|oldcomp?_sSA9mK4tw|)
       ()
       (#%lambda #t
         (|n_sSW5kb5tw|)
         (|oldcomp?_sSA9mK4tw|)
         (#%if (number? |n_sSW5kb5tw|)
           (not (|oldcomp?_sSA9mK4tw| |n_sSW5kb5tw|))
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
   (|b_sSYWdy6tw| . 2)
   (|a_sSC-f56tw| . 2)
   (* . 2)
   (+ . 1)
   (sqrt . 1)
   (|num_sSg2iE5tw| . 6)
   (real? . 1)
   (not . 1))
  ()
  (< - + * sqrt real-part imag-part not real?)
  (#%define abs
    (#%lambda #t
      (|num_sSg2iE5tw|)
      ()
      (#%if (not (real? |num_sSg2iE5tw|))
        ((#%lambda #t
           (|a_sSC-f56tw| |b_sSYWdy6tw|)
           ()
           (sqrt (+ (* |a_sSC-f56tw| |a_sSC-f56tw|)
                    (* |b_sSYWdy6tw| |b_sSYWdy6tw|))))
         (real-part |num_sSg2iE5tw|)
         (imag-part |num_sSg2iE5tw|))
        (#%if (< |num_sSg2iE5tw| 0)
          (- |num_sSg2iE5tw|)
          |num_sSg2iE5tw|)))))
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
   (|x1_sSGE3P8tw| . 3)
   (|args_sSkI5m8tw| . 2)
   (max . 1)
   (< . 1)
   (|x1_sS-L7V7tw| . 3)
   (|args_sSEP9s7tw| . 2)
   (min . 1)
   (inexact? . 3)
   (cdr . 2)
   (|_min_max_sSiTb_6tw| . 4)
   (car . 3)
   (|proc_sS0B1g9tw| . 3)
   (exact->inexact . 1)
   (|mv_sSmx_I9tw| . 5)
   (exact? . 1)
   (|inexact_sS2qXCatw| . 3)
   (|args_sSItZ9atw| . 6)
   (null? . 3))
  ((max . 1) (min . 1) (|_min_max_sSiTb_6tw| . 1))
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
    ((|_min_max_sSiTb_6tw|
       (#%lambda #t
         (|proc_sS0B1g9tw|
           |mv_sSmx_I9tw|
           |args_sSItZ9atw|
           |inexact_sS2qXCatw|)
         (|_min_max_sSiTb_6tw|)
         (#%if (null? |args_sSItZ9atw|)
           (#%if (#%if |inexact_sS2qXCatw|
                   (exact? |mv_sSmx_I9tw|)
                   #f)
             (exact->inexact |mv_sSmx_I9tw|)
             |mv_sSmx_I9tw|)
           (#%if (|proc_sS0B1g9tw|
                   (car |args_sSItZ9atw|)
                   |mv_sSmx_I9tw|)
             (|_min_max_sSiTb_6tw|
               |proc_sS0B1g9tw|
               (car |args_sSItZ9atw|)
               (cdr |args_sSItZ9atw|)
               (#%if |inexact_sS2qXCatw|
                 #t
                 (inexact? (car |args_sSItZ9atw|))))
             (|_min_max_sSiTb_6tw|
               |proc_sS0B1g9tw|
               |mv_sSmx_I9tw|
               (cdr |args_sSItZ9atw|)
               |inexact_sS2qXCatw|))))))
    ()
    (#%begin
      (#%set! min
        (#%lambda #t
          (|x1_sS-L7V7tw| . |args_sSEP9s7tw|)
          (|_min_max_sSiTb_6tw|)
          (#%if (null? |args_sSEP9s7tw|)
            |x1_sS-L7V7tw|
            (|_min_max_sSiTb_6tw|
              <
              |x1_sS-L7V7tw|
              |args_sSEP9s7tw|
              (inexact? |x1_sS-L7V7tw|)))))
      (#%set! max
        (#%lambda #t
          (|x1_sSGE3P8tw| . |args_sSkI5m8tw|)
          (|_min_max_sSiTb_6tw|)
          (#%if (null? |args_sSkI5m8tw|)
            |x1_sSGE3P8tw|
            (|_min_max_sSiTb_6tw|
              >
              |x1_sSGE3P8tw|
              |args_sSkI5m8tw|
              (inexact? |x1_sSGE3P8tw|))))))))
(#%program
  ((|n_sSomV3btw| . 1) (< . 1))
  ()
  (<)
  (#%define negative?
    (#%lambda #t
      (|n_sSomV3btw|)
      ()
      (< |n_sSomV3btw| 0))))
(#%program
  ((|n_sSKiTwbtw| . 1) (> . 1))
  ()
  (>)
  (#%define positive?
    (#%lambda #t
      (|n_sSKiTwbtw|)
      ()
      (> |n_sSKiTwbtw| 0))))
(#%program
  ((|n_sS4fRZbtw| . 1) (modulo . 1) (= . 1))
  ()
  (modulo =)
  (#%define even?
    (#%lambda #t
      (|n_sS4fRZbtw|)
      ()
      (= 0 (modulo |n_sS4fRZbtw| 2)))))
(#%program
  ((|n_sSqbPqctw| . 1) (even? . 1) (not . 1))
  ()
  (even? not)
  (#%define odd?
    (#%lambda #t
      (|n_sSqbPqctw|)
      ()
      (not (even? |n_sSqbPqctw|)))))
(#%program
  ((|n_sSM7NTctw| . 1) (= . 1))
  ()
  (=)
  (#%define zero?
    (#%lambda #t
      (|n_sSM7NTctw|)
      ()
      (= |n_sSM7NTctw| 0))))
(#%program
  ((|n_sS64Lkdtw| . 1) (+ . 1))
  ()
  (+)
  (#%define add1
    (#%lambda #t
      (|n_sS64Lkdtw|)
      ()
      (+ |n_sS64Lkdtw| 1))))
(#%program
  ((|n_sSs0JNdtw| . 1) (- . 1))
  ()
  (-)
  (#%define sub1
    (#%lambda #t
      (|n_sSs0JNdtw|)
      ()
      (- |n_sSs0JNdtw| 1))))
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
  ((|y_sSgdg7ktw| . 1)
   (|x_sSWgiGjtw| . 1)
   (|args_sSUrojitw| . 1)
   (|loop_sSeomMitw| . 2)
   (cadr . 1)
   (car . 1)
   (|comparator_sSSCuYgtw| . 1)
   (|chainer_sSczsphtw| . 1)
   (cdr . 2)
   (|endstate_sSyvqShtw| . 2)
   (|x_sSAkkdjtw| . 5)
   (null? . 2)
   (|b_sSwGwvgtw| . 2)
   (|a_sSaKy2gtw| . 2)
   (> . 1)
   (>= . 1)
   (|_and2_sS8VEHetw| . 2)
   (= . 2)
   (|b_sSQNABftw| . 2)
   (|a_sSuRC8ftw| . 2)
   (< . 1)
   (|_comp_help_sSOYGeetw| . 2)
   (<= . 1))
  ((|loop_sSeomMitw| . 1) (>= . 1) (<= . 1))
  (null? cadr car cdr <= = < >= >)
  ((#%lambda #t
     (|_comp_help_sSOYGeetw| |_and2_sS8VEHetw|)
     ()
     (#%begin
       (#%set! <=
         (|_comp_help_sSOYGeetw|
           (#%lambda #t
             (|a_sSuRC8ftw| |b_sSQNABftw|)
             ()
             (#%if (< |a_sSuRC8ftw| |b_sSQNABftw|)
               #t
               (= |a_sSuRC8ftw| |b_sSQNABftw|)))
           |_and2_sS8VEHetw|
           #t))
       (#%set! >=
         (|_comp_help_sSOYGeetw|
           (#%lambda #t
             (|a_sSaKy2gtw| |b_sSwGwvgtw|)
             ()
             (#%if (> |a_sSaKy2gtw| |b_sSwGwvgtw|)
               #t
               (= |a_sSaKy2gtw| |b_sSwGwvgtw|)))
           |_and2_sS8VEHetw|
           #t))))
   (#%lambda #t
     (|comparator_sSSCuYgtw|
       |chainer_sSczsphtw|
       |endstate_sSyvqShtw|)
     ()
     (#%lambda #t
       |args_sSUrojitw|
       (|endstate_sSyvqShtw|
         |chainer_sSczsphtw|
         |comparator_sSSCuYgtw|)
       ((#%letrec #t
          ((|loop_sSeomMitw|
             (#%lambda #t
               (|x_sSAkkdjtw|)
               (|loop_sSeomMitw|
                 |endstate_sSyvqShtw|
                 |chainer_sSczsphtw|
                 |comparator_sSSCuYgtw|)
               (#%if (null? |x_sSAkkdjtw|)
                 |endstate_sSyvqShtw|
                 (#%if (null? (cdr |x_sSAkkdjtw|))
                   |endstate_sSyvqShtw|
                   (|chainer_sSczsphtw|
                     (|comparator_sSSCuYgtw|
                       (car |x_sSAkkdjtw|)
                       (cadr |x_sSAkkdjtw|))
                     (|loop_sSeomMitw| (cdr |x_sSAkkdjtw|))))))))
          (|endstate_sSyvqShtw|
            |chainer_sSczsphtw|
            |comparator_sSSCuYgtw|)
          |loop_sSeomMitw|)
        |args_sSUrojitw|)))
   (#%lambda #t
     (|x_sSWgiGjtw| |y_sSgdg7ktw|)
     ()
     (#%if |x_sSWgiGjtw| |y_sSgdg7ktw| #f))))
(#%program
  ((|chainer_sSi2aultw| . 1)
   (apply . 1)
   (|comparator_sSY5c1ltw| . 1)
   (cadr . 2)
   (car . 2)
   (= . 1)
   (cdr . 2)
   (|args_sSE-7Xltw| . 7)
   (null? . 2)
   (< . 1)
   (<= . 2)
   (> . 1)
   (|_?=_sSC9eAktw| . 2)
   (>= . 2))
  ((<= . 1) (>= . 1))
  (< <= <= > >= >= null? = car cadr apply cdr)
  ((#%lambda #t
     (|_?=_sSC9eAktw|)
     ()
     (#%begin
       (#%set! >= (|_?=_sSC9eAktw| > >=))
       (#%set! <= (|_?=_sSC9eAktw| < <=))))
   (#%lambda #t
     (|comparator_sSY5c1ltw| |chainer_sSi2aultw|)
     ()
     (#%lambda #t
       |args_sSE-7Xltw|
       (|chainer_sSi2aultw| |comparator_sSY5c1ltw|)
       (#%if (null? |args_sSE-7Xltw|)
         #t
         (#%if (null? (cdr |args_sSE-7Xltw|))
           #t
           (#%if (#%if (= (car |args_sSE-7Xltw|)
                          (cadr |args_sSE-7Xltw|))
                   #t
                   (|comparator_sSY5c1ltw|
                     (car |args_sSE-7Xltw|)
                     (cadr |args_sSE-7Xltw|)))
             (apply |chainer_sSi2aultw|
                    (cdr |args_sSE-7Xltw|))
             #f)))))))
(#%program
  ((cadr . 1)
   (_gcd . 1)
   (car . 2)
   (cdr . 1)
   (|args_sSkT3Rmtw| . 5)
   (null? . 2))
  ()
  (cdr car cadr _gcd null?)
  (#%define gcd
    (#%lambda #t
      |args_sSkT3Rmtw|
      ()
      (#%if (null? |args_sSkT3Rmtw|)
        0
        (#%if (null? (cdr |args_sSkT3Rmtw|))
          (car |args_sSkT3Rmtw|)
          (_gcd (car |args_sSkT3Rmtw|)
                (cadr |args_sSkT3Rmtw|)))))))
(#%program
  ((cadr . 1)
   (_lcm . 1)
   (car . 2)
   (cdr . 1)
   (|args_sSGP1intw| . 5)
   (null? . 2))
  ()
  (cdr car cadr _lcm null?)
  (#%define lcm
    (#%lambda #t
      |args_sSGP1intw|
      ()
      (#%if (null? |args_sSGP1intw|)
        1
        (#%if (null? (cdr |args_sSGP1intw|))
          (car |args_sSGP1intw|)
          (_lcm (car |args_sSGP1intw|)
                (cadr |args_sSGP1intw|)))))))
(#%program
  ((|x_sS0M_Kntw| . 1)
   (remainder . 1)
   (+ . 1)
   (|r_sSIEXEotw| . 3)
   (positive? . 1)
   (|y_sSmIZbotw| . 3)
   (negative? . 2))
  ()
  (remainder positive? negative? +)
  (#%define modulo
    (#%lambda #t
      (|x_sS0M_Kntw| |y_sSmIZbotw|)
      ()
      ((#%lambda #t
         (|r_sSIEXEotw|)
         (|y_sSmIZbotw|)
         (#%if ((#%if (negative? |y_sSmIZbotw|)
                  positive?
                  negative?)
                |r_sSIEXEotw|)
           (+ |r_sSIEXEotw| |y_sSmIZbotw|)
           |r_sSIEXEotw|))
       (remainder |x_sS0M_Kntw| |y_sSmIZbotw|)))))
(#%program
  ((|args_sSoxTyptw| . 3)
   (cdr . 2)
   (car . 2)
   (_string-append . 1)
   (|string-append-helper_sS2BV5ptw| . 2)
   (|acc_sSKtR_ptw| . 2)
   (|args_sS4qPsqtw| . 3)
   (null? . 2))
  ((|string-append-helper_sS2BV5ptw| . 1))
  (car _string-append cdr null?)
  (#%define string-append
    (#%letrec #t
      ((|string-append-helper_sS2BV5ptw|
         (#%lambda #t
           (|acc_sSKtR_ptw| |args_sS4qPsqtw|)
           (|string-append-helper_sS2BV5ptw|)
           (#%if (null? |args_sS4qPsqtw|)
             |acc_sSKtR_ptw|
             (|string-append-helper_sS2BV5ptw|
               (_string-append
                 |acc_sSKtR_ptw|
                 (car |args_sS4qPsqtw|))
               (cdr |args_sS4qPsqtw|))))))
      ()
      (#%lambda #t
        |args_sSoxTyptw|
        (|string-append-helper_sS2BV5ptw|)
        (#%if (null? |args_sSoxTyptw|)
          ""
          (|string-append-helper_sS2BV5ptw|
            (car |args_sSoxTyptw|)
            (cdr |args_sSoxTyptw|)))))))
(#%program
  ((- . 1)
   (char->integer . 4)
   (|c_sSsbHgstw| . 2)
   (|lc-offset_sS6fJPrtw| . 1)
   (+ . 1)
   (integer->char . 1)
   (|z_sSMiLmrtw| . 1)
   (<= . 1)
   (|a_sSqmNVqtw| . 2)
   (|cv_sSO7FJstw| . 3)
   (>= . 1))
  ()
  (integer->char + >= <= char->integer -)
  (#%define char-downcase
    ((#%lambda #t
       (|a_sSqmNVqtw|)
       ()
       ((#%lambda #t
          (|z_sSMiLmrtw|)
          (|a_sSqmNVqtw|)
          ((#%lambda #t
             (|lc-offset_sS6fJPrtw|)
             (|z_sSMiLmrtw| |a_sSqmNVqtw|)
             (#%lambda #t
               (|c_sSsbHgstw|)
               (|lc-offset_sS6fJPrtw|
                 |z_sSMiLmrtw|
                 |a_sSqmNVqtw|)
               ((#%lambda #t
                  (|cv_sSO7FJstw|)
                  (|c_sSsbHgstw|
                    |lc-offset_sS6fJPrtw|
                    |z_sSMiLmrtw|
                    |a_sSqmNVqtw|)
                  (#%if (#%if (>= |cv_sSO7FJstw| |a_sSqmNVqtw|)
                          (<= |cv_sSO7FJstw| |z_sSMiLmrtw|)
                          #f)
                    (integer->char
                      (+ |cv_sSO7FJstw| |lc-offset_sS6fJPrtw|))
                    |c_sSsbHgstw|))
                (char->integer |c_sSsbHgstw|))))
           (- (char->integer #\a) |a_sSqmNVqtw|)))
        (char->integer #\Z)))
     (char->integer #\A))))
(#%program
  ((char->integer . 4)
   (|c_sSaVwxutw| . 2)
   (|uc-offset_sSQYy4utw| . 1)
   (- . 2)
   (integer->char . 1)
   (|z_sSu0BDttw| . 1)
   (<= . 1)
   (|a_sS84Dattw| . 2)
   (|cv_sSwRu-utw| . 3)
   (>= . 1))
  ()
  (integer->char - >= <= char->integer)
  (#%define char-upcase
    ((#%lambda #t
       (|a_sS84Dattw|)
       ()
       ((#%lambda #t
          (|z_sSu0BDttw|)
          (|a_sS84Dattw|)
          ((#%lambda #t
             (|uc-offset_sSQYy4utw|)
             (|z_sSu0BDttw| |a_sS84Dattw|)
             (#%lambda #t
               (|c_sSaVwxutw|)
               (|uc-offset_sSQYy4utw|
                 |z_sSu0BDttw|
                 |a_sS84Dattw|)
               ((#%lambda #t
                  (|cv_sSwRu-utw|)
                  (|c_sSaVwxutw|
                    |uc-offset_sSQYy4utw|
                    |z_sSu0BDttw|
                    |a_sS84Dattw|)
                  (#%if (#%if (>= |cv_sSwRu-utw| |a_sS84Dattw|)
                          (<= |cv_sSwRu-utw| |z_sSu0BDttw|)
                          #f)
                    (integer->char
                      (- |cv_sSwRu-utw| |uc-offset_sSQYy4utw|))
                    |c_sSaVwxutw|))
                (char->integer |c_sSaVwxutw|))))
           (- |a_sS84Dattw| (char->integer #\A))))
        (char->integer #\z)))
     (char->integer #\a))))
(#%program
  ((|args_sSSNsrvtw| . 1)
   (map . 1)
   (|c2_sScKqUvtw| . 1)
   (|c1_sSyGolwtw| . 1)
   (char->integer . 3)
   (> . 1)
   (apply . 1))
  ()
  (map char->integer > apply)
  (#%define char>?
    (#%lambda #t
      (|c1_sSyGolwtw|
        |c2_sScKqUvtw|
        .
        |args_sSSNsrvtw|)
      ()
      (apply >
             (char->integer |c1_sSyGolwtw|)
             (char->integer |c2_sScKqUvtw|)
             (map char->integer |args_sSSNsrvtw|)))))
(#%program
  ((|args_sSUCmOwtw| . 1)
   (map . 1)
   (|c2_sSezkfxtw| . 1)
   (|c1_sSAviIxtw| . 1)
   (char->integer . 3)
   (< . 1)
   (apply . 1))
  ()
  (map char->integer < apply)
  (#%define char<?
    (#%lambda #t
      (|c1_sSAviIxtw|
        |c2_sSezkfxtw|
        .
        |args_sSUCmOwtw|)
      ()
      (apply <
             (char->integer |c1_sSAviIxtw|)
             (char->integer |c2_sSezkfxtw|)
             (map char->integer |args_sSUCmOwtw|)))))
(#%program
  ((eqv? . 1))
  ()
  (eqv?)
  (#%define char=? eqv?))
(#%program
  ((char=? . 1)
   (|c2_sSgoeCytw| . 2)
   (|c1_sSWrg9ytw| . 2)
   (char>? . 1))
  ()
  (char=? char>?)
  (#%define char>=?
    (#%lambda #t
      (|c1_sSWrg9ytw| |c2_sSgoeCytw|)
      ()
      (#%if (char>? |c1_sSWrg9ytw| |c2_sSgoeCytw|)
        #t
        (char=? |c1_sSWrg9ytw| |c2_sSgoeCytw|)))))
(#%program
  ((char=? . 1)
   (|c2_sSYgawztw| . 2)
   (|c1_sSCkc3ztw| . 2)
   (char<? . 1))
  ()
  (char=? char<?)
  (#%define char<=?
    (#%lambda #t
      (|c1_sSCkc3ztw| |c2_sSYgawztw|)
      ()
      (#%if (char<? |c1_sSCkc3ztw| |c2_sSYgawztw|)
        #t
        (char=? |c1_sSCkc3ztw| |c2_sSYgawztw|)))))
(#%program
  ((|args_sSid8Zztw| . 1)
   (map . 1)
   (|c2_sSE96qAtw| . 1)
   (|c1_sS-54TAtw| . 1)
   (char-downcase . 3)
   (char>? . 1)
   (apply . 1))
  ()
  (map char-downcase char>? apply)
  (#%define char-ci>?
    (#%lambda #t
      (|c1_sS-54TAtw|
        |c2_sSE96qAtw|
        .
        |args_sSid8Zztw|)
      ()
      (apply char>?
             (char-downcase |c1_sS-54TAtw|)
             (char-downcase |c2_sSE96qAtw|)
             (map char-downcase |args_sSid8Zztw|)))))
(#%program
  ((|args_sSk22kBtw| . 1)
   (map . 1)
   (|c2_sSG-_MBtw| . 1)
   (|c1_sS0XZdCtw| . 1)
   (char-downcase . 3)
   (char<? . 1)
   (apply . 1))
  ()
  (map char-downcase char<? apply)
  (#%define char-ci<?
    (#%lambda #t
      (|c1_sS0XZdCtw|
        |c2_sSG-_MBtw|
        .
        |args_sSk22kBtw|)
      ()
      (apply char<?
             (char-downcase |c1_sS0XZdCtw|)
             (char-downcase |c2_sSG-_MBtw|)
             (map char-downcase |args_sSk22kBtw|)))))
(#%program
  ((|args_sSmTXGCtw| . 1)
   (map . 1)
   (|c2_sSIPV7Dtw| . 1)
   (|c1_sS2MTADtw| . 1)
   (char-downcase . 3)
   (char=? . 1)
   (apply . 1))
  ()
  (map char-downcase char=? apply)
  (#%define char-ci=?
    (#%lambda #t
      (|c1_sS2MTADtw|
        |c2_sSIPV7Dtw|
        .
        |args_sSmTXGCtw|)
      ()
      (apply char=?
             (char-downcase |c1_sS2MTADtw|)
             (char-downcase |c2_sSIPV7Dtw|)
             (map char-downcase |args_sSmTXGCtw|)))))
(#%program
  ((char-ci=? . 1)
   (|c2_sSKEPuEtw| . 2)
   (|c1_sSoIR1Etw| . 2)
   (char-ci>? . 1))
  ()
  (char-ci=? char-ci>?)
  (#%define char-ci>=?
    (#%lambda #t
      (|c1_sSoIR1Etw| |c2_sSKEPuEtw|)
      ()
      (#%if (char-ci>? |c1_sSoIR1Etw| |c2_sSKEPuEtw|)
        #t
        (char-ci=? |c1_sSoIR1Etw| |c2_sSKEPuEtw|)))))
(#%program
  ((char-ci=? . 1)
   (|c2_sSqxLoFtw| . 2)
   (|c1_sS4BNXEtw| . 2)
   (char-ci<? . 1))
  ()
  (char-ci=? char-ci<?)
  (#%define char-ci<=?
    (#%lambda #t
      (|c1_sS4BNXEtw| |c2_sSqxLoFtw|)
      ()
      (#%if (char-ci<? |c1_sS4BNXEtw| |c2_sSqxLoFtw|)
        #t
        (char-ci=? |c1_sS4BNXEtw| |c2_sSqxLoFtw|)))))
(#%program
  ((|c_sSMtJRFtw| . 2) (char<? . 2))
  ()
  (char<?)
  (#%define char-alphabetic?
    (#%lambda #t
      (|c_sSMtJRFtw|)
      ()
      (#%if (char<? #\@ |c_sSMtJRFtw| #\[)
        #t
        (char<? #\` |c_sSMtJRFtw| #\{)))))
(#%program
  ((|c_sS6qHiGtw| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-numeric?
    (#%lambda #t
      (|c_sS6qHiGtw|)
      ()
      (char<? #\/ |c_sS6qHiGtw| #\:))))
(#%program
  ((|c_sSsmFLGtw| . 4) (char=? . 4))
  ()
  (char=?)
  (#%define char-whitespace?
    (#%lambda #t
      (|c_sSsmFLGtw|)
      ()
      (#%if (char=? |c_sSsmFLGtw| #\space)
        #t
        (#%if (char=? |c_sSsmFLGtw| #\tab)
          #t
          (#%if (char=? |c_sSsmFLGtw| #\newline)
            #t
            (char=? |c_sSsmFLGtw| #\return)))))))
(#%program
  ((|c_sSOiDcHtw| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-upper-case?
    (#%lambda #t
      (|c_sSOiDcHtw|)
      ()
      (char<? #\@ |c_sSOiDcHtw| #\[))))
(#%program
  ((|c_sS8fBFHtw| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-lower-case?
    (#%lambda #t
      (|c_sS8fBFHtw|)
      ()
      (char<? #\` |c_sS8fBFHtw| #\{))))
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
   (|newstr_sSSYqWJtw| . 1)
   (|str_sSw0ttJtw| . 3)
   (string-upcase . 1)
   (make-string . 2)
   (string-length . 4)
   (char-downcase . 1)
   (|newstr_sSa4v0Jtw| . 1)
   (|str_sSQ7xzItw| . 3)
   (string-downcase . 1)
   (+ . 1)
   (|string-map_sSubz6Itw| . 3)
   (|strsrc_sScVonKtw| . 2)
   (string-ref . 1)
   (|proc_sSUNkhLtw| . 2)
   (|strdst_sSyRmQKtw| . 3)
   (string-set! . 1)
   (|l_sSAGgbMtw| . 2)
   (|n_sSeKiKLtw| . 4)
   (< . 1))
  ((string-upcase . 1)
   (string-downcase . 1)
   (|string-map_sSubz6Itw| . 1))
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
    ((|string-map_sSubz6Itw|
       (#%lambda #t
         (|strsrc_sScVonKtw|
           |strdst_sSyRmQKtw|
           |proc_sSUNkhLtw|
           |n_sSeKiKLtw|
           |l_sSAGgbMtw|)
         (|string-map_sSubz6Itw|)
         (#%if (< |n_sSeKiKLtw| |l_sSAGgbMtw|)
           (#%begin
             (string-set!
               |strdst_sSyRmQKtw|
               |n_sSeKiKLtw|
               (|proc_sSUNkhLtw|
                 (string-ref |strsrc_sScVonKtw| |n_sSeKiKLtw|)))
             (|string-map_sSubz6Itw|
               |strsrc_sScVonKtw|
               |strdst_sSyRmQKtw|
               |proc_sSUNkhLtw|
               (+ |n_sSeKiKLtw| 1)
               |l_sSAGgbMtw|))
           |strdst_sSyRmQKtw|))))
    ()
    (#%begin
      (#%set! string-downcase
        (#%lambda #t
          (|str_sSQ7xzItw|)
          (|string-map_sSubz6Itw|)
          ((#%lambda #t
             (|newstr_sSa4v0Jtw|)
             (|str_sSQ7xzItw| |string-map_sSubz6Itw|)
             (|string-map_sSubz6Itw|
               |str_sSQ7xzItw|
               |newstr_sSa4v0Jtw|
               char-downcase
               0
               (string-length |str_sSQ7xzItw|)))
           (make-string (string-length |str_sSQ7xzItw|)))))
      (#%set! string-upcase
        (#%lambda #t
          (|str_sSw0ttJtw|)
          (|string-map_sSubz6Itw|)
          ((#%lambda #t
             (|newstr_sSSYqWJtw|)
             (|str_sSw0ttJtw| |string-map_sSubz6Itw|)
             (|string-map_sSubz6Itw|
               |str_sSw0ttJtw|
               |newstr_sSSYqWJtw|
               char-upcase
               0
               (string-length |str_sSw0ttJtw|)))
           (make-string (string-length |str_sSw0ttJtw|))))))))
(#%program
  ((equal? . 1))
  ()
  (equal?)
  (#%define string=? equal?))
(#%program
  ((|s2_sSCvayNtw| . 1)
   (|s1_sSgzc5Ntw| . 1)
   (string->list . 2)
   (car . 2)
   (cdr . 2)
   (|s<?_sSWCeEMtw| . 2)
   (char>? . 1)
   (|c2_sS-g2mPtw| . 2)
   (|c1_sSEk4VOtw| . 2)
   (char<? . 1)
   (|s2_sSio6sOtw| . 4)
   (not . 1)
   (|s1_sSYr8_Ntw| . 3)
   (null? . 3))
  ((|s<?_sSWCeEMtw| . 1))
  (string->list car char<? cdr char>? not null?)
  (#%define string<?
    (#%letrec #t
      ((|s<?_sSWCeEMtw|
         (#%lambda #t
           (|s1_sSYr8_Ntw| |s2_sSio6sOtw|)
           (|s<?_sSWCeEMtw|)
           (#%if (null? |s1_sSYr8_Ntw|)
             (not (null? |s2_sSio6sOtw|))
             (#%if (null? |s2_sSio6sOtw|)
               #f
               ((#%lambda #t
                  (|c1_sSEk4VOtw| |c2_sS-g2mPtw|)
                  (|s2_sSio6sOtw| |s1_sSYr8_Ntw| |s<?_sSWCeEMtw|)
                  (#%if (char<? |c1_sSEk4VOtw| |c2_sS-g2mPtw|)
                    #t
                    (#%if (char>? |c1_sSEk4VOtw| |c2_sS-g2mPtw|)
                      #f
                      (|s<?_sSWCeEMtw|
                        (cdr |s1_sSYr8_Ntw|)
                        (cdr |s2_sSio6sOtw|)))))
                (car |s1_sSYr8_Ntw|)
                (car |s2_sSio6sOtw|)))))))
      ()
      (#%lambda #t
        (|s1_sSgzc5Ntw| |s2_sSCvayNtw|)
        (|s<?_sSWCeEMtw|)
        (|s<?_sSWCeEMtw|
          (string->list |s1_sSgzc5Ntw|)
          (string->list |s2_sSCvayNtw|))))))
(#%program
  ((|s2_sS06YIQtw| . 1)
   (|s1_sSG9-fQtw| . 1)
   (string->list . 2)
   (car . 2)
   (cdr . 2)
   (|s>?_sSkd0PPtw| . 2)
   (char<? . 1)
   (|c2_sSoTPwStw| . 2)
   (|c1_sS2XR3Stw| . 2)
   (char>? . 1)
   (|s1_sSm2W9Rtw| . 4)
   (not . 1)
   (|s2_sSI-TCRtw| . 3)
   (null? . 3))
  ((|s>?_sSkd0PPtw| . 1))
  (string->list car char>? cdr char<? not null?)
  (#%define string>?
    (#%letrec #t
      ((|s>?_sSkd0PPtw|
         (#%lambda #t
           (|s1_sSm2W9Rtw| |s2_sSI-TCRtw|)
           (|s>?_sSkd0PPtw|)
           (#%if (null? |s2_sSI-TCRtw|)
             (not (null? |s1_sSm2W9Rtw|))
             (#%if (null? |s1_sSm2W9Rtw|)
               #f
               ((#%lambda #t
                  (|c1_sS2XR3Stw| |c2_sSoTPwStw|)
                  (|s2_sSI-TCRtw| |s1_sSm2W9Rtw| |s>?_sSkd0PPtw|)
                  (#%if (char>? |c1_sS2XR3Stw| |c2_sSoTPwStw|)
                    #t
                    (#%if (char<? |c1_sS2XR3Stw| |c2_sSoTPwStw|)
                      #f
                      (|s>?_sSkd0PPtw|
                        (cdr |s1_sSm2W9Rtw|)
                        (cdr |s2_sSI-TCRtw|)))))
                (car |s1_sSm2W9Rtw|)
                (car |s2_sSI-TCRtw|)))))))
      ()
      (#%lambda #t
        (|s1_sSG9-fQtw| |s2_sS06YIQtw|)
        (|s>?_sSkd0PPtw|)
        (|s>?_sSkd0PPtw|
          (string->list |s1_sSG9-fQtw|)
          (string->list |s2_sS06YIQtw|))))))
(#%program
  ((string=? . 1)
   (|s2_sS4MLqTtw| . 2)
   (|s1_sSKPNZStw| . 2)
   (string<? . 1))
  ()
  (string=? string<?)
  (#%define string<=?
    (#%lambda #t
      (|s1_sSKPNZStw| |s2_sS4MLqTtw|)
      ()
      (#%if (string<? |s1_sSKPNZStw| |s2_sS4MLqTtw|)
        #t
        (string=? |s1_sSKPNZStw| |s2_sS4MLqTtw|)))))
(#%program
  ((string=? . 1)
   (|s2_sSMEHkUtw| . 2)
   (|s1_sSqIJTTtw| . 2)
   (string>? . 1))
  ()
  (string=? string>?)
  (#%define string>=?
    (#%lambda #t
      (|s1_sSqIJTTtw| |s2_sSMEHkUtw|)
      ()
      (#%if (string>? |s1_sSqIJTTtw| |s2_sSMEHkUtw|)
        #t
        (string=? |s1_sSqIJTTtw| |s2_sSMEHkUtw|)))))
(#%program
  ((|s2_sSsxDeVtw| . 1)
   (|s1_sS6BFNUtw| . 1)
   (string-downcase . 2)
   (string=? . 1))
  ()
  (string-downcase string=?)
  (#%define string-ci=?
    (#%lambda #t
      (|s1_sS6BFNUtw| |s2_sSsxDeVtw|)
      ()
      (string=?
        (string-downcase |s1_sS6BFNUtw|)
        (string-downcase |s2_sSsxDeVtw|)))))
(#%program
  ((|s2_sS8qz8Wtw| . 1)
   (|s1_sSOtBHVtw| . 1)
   (string-downcase . 2)
   (string<? . 1))
  ()
  (string-downcase string<?)
  (#%define string-ci<?
    (#%lambda #t
      (|s1_sSOtBHVtw| |s2_sS8qz8Wtw|)
      ()
      (string<?
        (string-downcase |s1_sSOtBHVtw|)
        (string-downcase |s2_sS8qz8Wtw|)))))
(#%program
  ((|s2_sSQiv2Xtw| . 1)
   (|s1_sSumxBWtw| . 1)
   (string-downcase . 2)
   (string>? . 1))
  ()
  (string-downcase string>?)
  (#%define string-ci>?
    (#%lambda #t
      (|s1_sSumxBWtw| |s2_sSQiv2Xtw|)
      ()
      (string>?
        (string-downcase |s1_sSumxBWtw|)
        (string-downcase |s2_sSQiv2Xtw|)))))
(#%program
  ((|s2_sSwbrYXtw| . 1)
   (|s1_sSaftvXtw| . 1)
   (string-downcase . 2)
   (string>=? . 1))
  ()
  (string-downcase string>=?)
  (#%define string-ci>=?
    (#%lambda #t
      (|s1_sSaftvXtw| |s2_sSwbrYXtw|)
      ()
      (string>=?
        (string-downcase |s1_sSaftvXtw|)
        (string-downcase |s2_sSwbrYXtw|)))))
(#%program
  ((|s2_sSc4nSYtw| . 1)
   (|s1_sSS7ppYtw| . 1)
   (string-downcase . 2)
   (string<=? . 1))
  ()
  (string-downcase string<=?)
  (#%define string-ci<=?
    (#%lambda #t
      (|s1_sSS7ppYtw| |s2_sSc4nSYtw|)
      ()
      (string<=?
        (string-downcase |s1_sSS7ppYtw|)
        (string-downcase |s2_sSc4nSYtw|)))))
(#%program
  ((- . 1)
   (make-string . 1)
   (|end_sSAReG-tw| . 2)
   (|start_sSeVgd-tw| . 2)
   (|newstr_sSWNc7_tw| . 2)
   (|str_sSUYiMZtw| . 1)
   (+ . 2)
   (|fill-string_sSy0ljZtw| . 2)
   (|sstr_sSgKaA_tw| . 2)
   (string-ref . 1)
   (|n_sSYC6u0uw| . 2)
   (|dstr_sSCG810uw| . 2)
   (string-set! . 1)
   (|e_sSEv2o1uw| . 2)
   (|s_sSiz4X0uw| . 3)
   (< . 1))
  ((|fill-string_sSy0ljZtw| . 1))
  (make-string - string-ref string-set! + <)
  (#%define substring
    (#%letrec #t
      ((|fill-string_sSy0ljZtw|
         (#%lambda #t
           (|sstr_sSgKaA_tw|
             |dstr_sSCG810uw|
             |n_sSYC6u0uw|
             |s_sSiz4X0uw|
             |e_sSEv2o1uw|)
           (|fill-string_sSy0ljZtw|)
           (#%if (< |s_sSiz4X0uw| |e_sSEv2o1uw|)
             (#%begin
               (string-set!
                 |dstr_sSCG810uw|
                 |n_sSYC6u0uw|
                 (string-ref |sstr_sSgKaA_tw| |s_sSiz4X0uw|))
               (|fill-string_sSy0ljZtw|
                 |sstr_sSgKaA_tw|
                 |dstr_sSCG810uw|
                 (+ |n_sSYC6u0uw| 1)
                 (+ |s_sSiz4X0uw| 1)
                 |e_sSEv2o1uw|))
             #!void))))
      ()
      (#%lambda #t
        (|str_sSUYiMZtw|
          |start_sSeVgd-tw|
          |end_sSAReG-tw|)
        (|fill-string_sSy0ljZtw|)
        ((#%lambda #t
           (|newstr_sSWNc7_tw|)
           (|end_sSAReG-tw|
             |start_sSeVgd-tw|
             |str_sSUYiMZtw|
             |fill-string_sSy0ljZtw|)
           (#%begin
             (|fill-string_sSy0ljZtw|
               |str_sSUYiMZtw|
               |newstr_sSWNc7_tw|
               0
               |start_sSeVgd-tw|
               |end_sSAReG-tw|)
             |newstr_sSWNc7_tw|))
         (make-string
           (- |end_sSAReG-tw| |start_sSeVgd-tw|)))))))
(#%program
  ((- . 1)
   (cdr . 1)
   (list-ref . 1)
   (|list_sS-r0R1uw| . 2)
   (car . 1)
   (|n_sSko-h2uw| . 2)
   (zero? . 1))
  ()
  (list-ref cdr - car zero?)
  (#%define list-ref
    (#%lambda #t
      (|list_sS-r0R1uw| |n_sSko-h2uw|)
      ()
      (#%if (zero? |n_sSko-h2uw|)
        (car |list_sS-r0R1uw|)
        (list-ref
          (cdr |list_sS-r0R1uw|)
          (- |n_sSko-h2uw| 1))))))
(#%program
  ((|args_sSGkYK2uw| . 1)
   (|k_sS0hWb3uw| . 1)
   (apply . 1)
   (call-with-current-continuation . 1))
  ()
  (apply call-with-current-continuation)
  (#%define values
    (#%lambda #t
      |args_sSGkYK2uw|
      ()
      (call-with-current-continuation
        (#%lambda #t
          (|k_sS0hWb3uw|)
          (|args_sSGkYK2uw|)
          (apply |k_sS0hWb3uw| |args_sSGkYK2uw|))))))
