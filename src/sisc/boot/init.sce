(#%program () () () #!void)
(#%program
  ((map-cdr . 1)
   (for-each . 1)
   (map-car . 1)
   (|proc_XiIqzFWWd| . 2)
   (apply . 2)
   (cons . 1)
   (|lists_Xi0yDLVWd| . 4)
   (|ls1_XimuBcWWd| . 2)
   (null? . 1))
  ((|lists_Xi0yDLVWd| . 1))
  (cons map-car apply map-cdr for-each null?)
  (#%define for-each
    (#%lambda #t
      (|proc_XiIqzFWWd|
        |ls1_XimuBcWWd|
        .
        |lists_Xi0yDLVWd|)
      ()
      (#%if (null? |ls1_XimuBcWWd|)
        #!void
        (#%begin
          (#%set! |lists_Xi0yDLVWd|
            (cons |ls1_XimuBcWWd| |lists_Xi0yDLVWd|))
          (apply |proc_XiIqzFWWd|
                 (map-car |lists_Xi0yDLVWd|))
          (apply for-each
                 |proc_XiIqzFWWd|
                 (map-cdr |lists_Xi0yDLVWd|)))))))
(#%program
  ((|x_Xi2nx6XWd| . 1) (eq? . 1))
  ()
  (eq?)
  (#%define eof-object?
    (#%lambda #t
      (|x_Xi2nx6XWd|)
      ()
      (eq? |x_Xi2nx6XWd| #!eof))))
(#%program
  ((|x_XiojvzXWd| . 1))
  ()
  ()
  (#%define not
    (#%lambda #t
      (|x_XiojvzXWd|)
      ()
      (#%if |x_XiojvzXWd| #f #t))))
(#%program
  ((|port_XiKft0YWd| . 1)
   (display . 1)
   (apply . 1))
  ()
  (display apply)
  (#%define newline
    (#%lambda #t
      |port_XiKft0YWd|
      ()
      (apply display #\newline |port_XiKft0YWd|))))
(#%program
  ((|ls_Xiq8pWYWd| . 1)
   (car . 1)
   (cons . 1)
   (cdr . 1)
   (|iter_Xi4crtYWd| . 2)
   (|acc_Xi61lQZWd| . 2)
   (|ls_XiM4nnZWd| . 3)
   (null? . 1))
  ((|iter_Xi4crtYWd| . 1))
  (cdr car cons null?)
  (#%define reverse
    (#%letrec #t
      ((|iter_Xi4crtYWd|
         (#%lambda #t
           (|ls_XiM4nnZWd| |acc_Xi61lQZWd|)
           (|iter_Xi4crtYWd|)
           (#%if (null? |ls_XiM4nnZWd|)
             |acc_Xi61lQZWd|
             (|iter_Xi4crtYWd|
               (cdr |ls_XiM4nnZWd|)
               (cons (car |ls_XiM4nnZWd|) |acc_Xi61lQZWd|))))))
      ()
      (#%lambda #t
        (|ls_Xiq8pWYWd|)
        (|iter_Xi4crtYWd|)
        (|iter_Xi4crtYWd| |ls_Xiq8pWYWd| ())))))
(#%program
  ((|s_XiOVgK-Wd| . 1)
   (cdr . 1)
   (|d_XiQKa50Xd| . 1)
   (|iter_XisZih-Wd| . 2)
   (set-cdr! . 1)
   (|r_XiuOcE_Wd| . 2)
   (|s_Xi8Seb_Wd| . 4)
   (null? . 1))
  ((|iter_XisZih-Wd| . 1))
  (set-cdr! cdr null?)
  (#%define reverse!
    (#%letrec #t
      ((|iter_XisZih-Wd|
         (#%lambda #t
           (|s_Xi8Seb_Wd| |r_XiuOcE_Wd|)
           (|iter_XisZih-Wd|)
           (#%if (null? |s_Xi8Seb_Wd|)
             |r_XiuOcE_Wd|
             ((#%lambda #t
                (|d_XiQKa50Xd|)
                (|r_XiuOcE_Wd| |s_Xi8Seb_Wd| |iter_XisZih-Wd|)
                (#%begin
                  (set-cdr! |s_Xi8Seb_Wd| |r_XiuOcE_Wd|)
                  (|iter_XisZih-Wd| |d_XiQKa50Xd| |s_Xi8Seb_Wd|)))
              (cdr |s_Xi8Seb_Wd|))))))
      ()
      (#%lambda #t
        (|s_XiOVgK-Wd|)
        (|iter_XisZih-Wd|)
        (|iter_XisZih-Wd| |s_XiOVgK-Wd| ())))))
(#%program
  ((cdr . 1)
   (map-car . 1)
   (caar . 1)
   (cons . 1)
   (|ls_XiaH8y0Xd| . 3)
   (null? . 1))
  ()
  (cons caar cdr map-car null?)
  (#%define map-car
    (#%lambda #t
      (|ls_XiaH8y0Xd|)
      ()
      (#%if (null? |ls_XiaH8y0Xd|)
        ()
        (cons (caar |ls_XiaH8y0Xd|)
              (map-car (cdr |ls_XiaH8y0Xd|)))))))
(#%program
  ((cdr . 1)
   (map-cdr . 1)
   (cdar . 1)
   (cons . 1)
   (|ls_XiwD6_0Xd| . 3)
   (null? . 1))
  ()
  (cons cdar cdr map-cdr null?)
  (#%define map-cdr
    (#%lambda #t
      (|ls_XiwD6_0Xd|)
      ()
      (#%if (null? |ls_XiwD6_0Xd|)
        ()
        (cons (cdar |ls_XiwD6_0Xd|)
              (map-cdr (cdr |ls_XiwD6_0Xd|)))))))
(#%program
  ((|list1_XiUo-O2Xd| . 2)
   (|proc_XielYf3Xd| . 2)
   (|lists_Xiys0m2Xd| . 2)
   (map-car . 1)
   (apply . 1)
   (|lists_Xii_LZ5Xd| . 2)
   (map-cdr . 1)
   (|proc_XiC6Q35Xd| . 2)
   (|loop_Xicw2V1Xd| . 2)
   (|c_XiEXJq6Xd| . 2)
   (|list1_XiY2Ow5Xd| . 3)
   (car . 2)
   (cons . 2)
   (cdr . 2)
   (|proc_XiAhWI3Xd| . 2)
   (|map1_XiSz4s1Xd| . 2)
   (|acc_XigaSC4Xd| . 2)
   (reverse . 2)
   (|list_XiWdU94Xd| . 3)
   (null? . 3))
  ((|loop_Xicw2V1Xd| . 1) (|map1_XiSz4s1Xd| . 1))
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
      ((|map1_XiSz4s1Xd|
         (#%lambda #t
           (|proc_XiAhWI3Xd|
             |list_XiWdU94Xd|
             |acc_XigaSC4Xd|)
           (|map1_XiSz4s1Xd|)
           (#%if (null? |list_XiWdU94Xd|)
             (reverse |acc_XigaSC4Xd|)
             (|map1_XiSz4s1Xd|
               |proc_XiAhWI3Xd|
               (cdr |list_XiWdU94Xd|)
               (cons (|proc_XiAhWI3Xd| (car |list_XiWdU94Xd|))
                     |acc_XigaSC4Xd|)))))
       (|loop_Xicw2V1Xd|
         (#%lambda #t
           (|proc_XiC6Q35Xd|
             |list1_XiY2Ow5Xd|
             |lists_Xii_LZ5Xd|
             |c_XiEXJq6Xd|)
           (|loop_Xicw2V1Xd|)
           (#%if (null? |list1_XiY2Ow5Xd|)
             (reverse |c_XiEXJq6Xd|)
             (|loop_Xicw2V1Xd|
               |proc_XiC6Q35Xd|
               (cdr |list1_XiY2Ow5Xd|)
               (map-cdr |lists_Xii_LZ5Xd|)
               (cons (apply |proc_XiC6Q35Xd|
                            (car |list1_XiY2Ow5Xd|)
                            (map-car |lists_Xii_LZ5Xd|))
                     |c_XiEXJq6Xd|))))))
      ()
      (#%lambda #t
        (|proc_XielYf3Xd|
          |list1_XiUo-O2Xd|
          .
          |lists_Xiys0m2Xd|)
        (|loop_Xicw2V1Xd| |map1_XiSz4s1Xd|)
        (#%if (null? |lists_Xiys0m2Xd|)
          (|map1_XiSz4s1Xd|
            |proc_XielYf3Xd|
            |list1_XiUo-O2Xd|
            ())
          (|loop_Xicw2V1Xd|
            |proc_XielYf3Xd|
            |list1_XiUo-O2Xd|
            |lists_Xiys0m2Xd|
            ()))))))
(#%program
  ((|x_XiGMDN7Xd| . 1)
   (|g_XikQFk7Xd| . 1)
   (|f_Xi-THT6Xd| . 1))
  ()
  ()
  (#%define compose2
    (#%lambda #t
      (|f_Xi-THT6Xd| |g_XikQFk7Xd|)
      ()
      (#%lambda #t
        (|x_XiGMDN7Xd|)
        (|g_XikQFk7Xd| |f_Xi-THT6Xd|)
        (|f_Xi-THT6Xd| (|g_XikQFk7Xd| |x_XiGMDN7Xd|))))))
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
  ((|list_XiuZa7eXd| . 1)
   (|obj_Xi81dGdXd| . 1)
   (member . 1)
   (|list_XiO4fddXd| . 1)
   (|obj_Xis8hMcXd| . 1)
   (memv . 1)
   (|list_Xi6cjjcXd| . 1)
   (|obj_XiMflSbXd| . 1)
   (memq . 1)
   (|alist_XiqjnpbXd| . 1)
   (|obj_Xi4npYaXd| . 1)
   (equal? . 2)
   (assoc . 1)
   (|alist_XiKqrvaXd| . 1)
   (|obj_Xiout2aXd| . 1)
   (eqv? . 2)
   (assv . 1)
   (|alist_Xi2yvB9Xd| . 1)
   (|obj_XiIBx89Xd| . 1)
   (eq? . 2)
   (assq . 1)
   (|memn_XimFzH8Xd| . 4)
   (|obj_XicH0ogXd| . 2)
   (|n_XiSK2XfXd| . 2)
   (|list_XiyD-QgXd| . 4)
   (cdr . 2)
   (|assn_Xi0JBe8Xd| . 4)
   (car . 2)
   (|obj_XiaS61fXd| . 2)
   (caar . 1)
   (|n_XiQV8AeXd| . 2)
   (|alist_XiwO4ufXd| . 4)
   (null? . 2))
  ((member . 1)
   (memv . 1)
   (memq . 1)
   (assoc . 1)
   (assv . 1)
   (assq . 1)
   (|memn_XimFzH8Xd| . 1)
   (|assn_Xi0JBe8Xd| . 1))
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
    ((|assn_Xi0JBe8Xd|
       (#%lambda #t
         (|n_XiQV8AeXd| |obj_XiaS61fXd| |alist_XiwO4ufXd|)
         (|assn_Xi0JBe8Xd|)
         (#%if (null? |alist_XiwO4ufXd|)
           #f
           (#%if (|n_XiQV8AeXd|
                   (caar |alist_XiwO4ufXd|)
                   |obj_XiaS61fXd|)
             (car |alist_XiwO4ufXd|)
             (|assn_Xi0JBe8Xd|
               |n_XiQV8AeXd|
               |obj_XiaS61fXd|
               (cdr |alist_XiwO4ufXd|))))))
     (|memn_XimFzH8Xd|
       (#%lambda #t
         (|n_XiSK2XfXd| |obj_XicH0ogXd| |list_XiyD-QgXd|)
         (|memn_XimFzH8Xd|)
         (#%if (null? |list_XiyD-QgXd|)
           #f
           (#%if (|n_XiSK2XfXd|
                   (car |list_XiyD-QgXd|)
                   |obj_XicH0ogXd|)
             |list_XiyD-QgXd|
             (|memn_XimFzH8Xd|
               |n_XiSK2XfXd|
               |obj_XicH0ogXd|
               (cdr |list_XiyD-QgXd|)))))))
    ()
    (#%begin
      (#%set! assq
        (#%lambda #t
          (|obj_XiIBx89Xd| |alist_Xi2yvB9Xd|)
          (|assn_Xi0JBe8Xd|)
          (|assn_Xi0JBe8Xd|
            eq?
            |obj_XiIBx89Xd|
            |alist_Xi2yvB9Xd|)))
      (#%set! assv
        (#%lambda #t
          (|obj_Xiout2aXd| |alist_XiKqrvaXd|)
          (|assn_Xi0JBe8Xd|)
          (|assn_Xi0JBe8Xd|
            eqv?
            |obj_Xiout2aXd|
            |alist_XiKqrvaXd|)))
      (#%set! assoc
        (#%lambda #t
          (|obj_Xi4npYaXd| |alist_XiqjnpbXd|)
          (|assn_Xi0JBe8Xd|)
          (|assn_Xi0JBe8Xd|
            equal?
            |obj_Xi4npYaXd|
            |alist_XiqjnpbXd|)))
      (#%set! memq
        (#%lambda #t
          (|obj_XiMflSbXd| |list_Xi6cjjcXd|)
          (|memn_XimFzH8Xd|)
          (|memn_XimFzH8Xd|
            eq?
            |obj_XiMflSbXd|
            |list_Xi6cjjcXd|)))
      (#%set! memv
        (#%lambda #t
          (|obj_Xis8hMcXd| |list_XiO4fddXd|)
          (|memn_XimFzH8Xd|)
          (|memn_XimFzH8Xd|
            eqv?
            |obj_Xis8hMcXd|
            |list_XiO4fddXd|)))
      (#%set! member
        (#%lambda #t
          (|obj_Xi81dGdXd| |list_XiuZa7eXd|)
          (|memn_XimFzH8Xd|)
          (|memn_XimFzH8Xd|
            equal?
            |obj_Xi81dGdXd|
            |list_XiuZa7eXd|))))))
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
   (|ls2_XiewWKhXd| . 2)
   (|ls1_XiUzYhhXd| . 3)
   (null? . 1))
  ()
  (cons car cdr append2 null?)
  (#%define append2
    (#%lambda #t
      (|ls1_XiUzYhhXd| |ls2_XiewWKhXd|)
      ()
      (#%if (null? |ls1_XiUzYhhXd|)
        |ls2_XiewWKhXd|
        (cons (car |ls1_XiUzYhhXd|)
              (append2 (cdr |ls1_XiUzYhhXd|) |ls2_XiewWKhXd|))))))
(#%program
  ((append2 . 1))
  ()
  ()
  (#%define append append2))
(#%program
  ((length . 1)
   (make-string . 1)
   (|l_XiWoSEiXd| . 2)
   (+ . 1)
   (cdr . 1)
   (|l2s_XiAsUbiXd| . 2)
   (car . 1)
   (|n_XiYdM_jXd| . 2)
   (string-set! . 1)
   (|s_XiChOyjXd| . 3)
   (|l_XiglQ5jXd| . 3)
   (null? . 1))
  ((|l2s_XiAsUbiXd| . 1))
  (make-string length car string-set! + cdr null?)
  (#%define list->string
    (#%letrec #t
      ((|l2s_XiAsUbiXd|
         (#%lambda #t
           (|l_XiglQ5jXd| |s_XiChOyjXd| |n_XiYdM_jXd|)
           (|l2s_XiAsUbiXd|)
           (#%if (null? |l_XiglQ5jXd|)
             |s_XiChOyjXd|
             (#%begin
               (string-set!
                 |s_XiChOyjXd|
                 |n_XiYdM_jXd|
                 (car |l_XiglQ5jXd|))
               (|l2s_XiAsUbiXd|
                 (cdr |l_XiglQ5jXd|)
                 |s_XiChOyjXd|
                 (+ |n_XiYdM_jXd| 1)))))))
      ()
      (#%lambda #t
        (|l_XiWoSEiXd|)
        (|l2s_XiAsUbiXd|)
        (|l2s_XiAsUbiXd|
          |l_XiWoSEiXd|
          (make-string (length |l_XiWoSEiXd|))
          0)))))
(#%program
  ((string-length . 1)
   (|s_XiE6IVkXd| . 2)
   (- . 2)
   (string-ref . 1)
   (cons . 1)
   (|s_Xi-2GmlXd| . 2)
   (|s2l_XiiaKskXd| . 2)
   (|h_Xik_DPlXd| . 2)
   (|n_XiGXBgmXd| . 3)
   (< . 1))
  ((|s2l_XiiaKskXd| . 1))
  (string-length string-ref cons - <)
  (#%define string->list
    (#%letrec #t
      ((|s2l_XiiaKskXd|
         (#%lambda #t
           (|s_Xi-2GmlXd| |h_Xik_DPlXd| |n_XiGXBgmXd|)
           (|s2l_XiiaKskXd|)
           (#%if (< |n_XiGXBgmXd| 0)
             |h_Xik_DPlXd|
             (|s2l_XiiaKskXd|
               |s_Xi-2GmlXd|
               (cons (string-ref |s_Xi-2GmlXd| |n_XiGXBgmXd|)
                     |h_Xik_DPlXd|)
               (- |n_XiGXBgmXd| 1))))))
      ()
      (#%lambda #t
        (|s_XiE6IVkXd|)
        (|s2l_XiiaKskXd|)
        (|s2l_XiiaKskXd|
          |s_XiE6IVkXd|
          ()
          (- (string-length |s_XiE6IVkXd|) 1))))))
(#%program
  ((error . 1)
   (length . 1)
   (make-vector . 1)
   (|l_XimQxanXd| . 4)
   (proper-list? . 1)
   (+ . 1)
   (cdr . 1)
   (|l2v_Xi0UzJmXd| . 2)
   (car . 1)
   (|n_XioFrxoXd| . 2)
   (vector-set! . 1)
   (|v_Xi2Jt4oXd| . 3)
   (|l_XiIMvDnXd| . 3)
   (null? . 1))
  ((|l2v_Xi0UzJmXd| . 1))
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
      ((|l2v_Xi0UzJmXd|
         (#%lambda #t
           (|l_XiIMvDnXd| |v_Xi2Jt4oXd| |n_XioFrxoXd|)
           (|l2v_Xi0UzJmXd|)
           (#%if (null? |l_XiIMvDnXd|)
             |v_Xi2Jt4oXd|
             (#%begin
               (vector-set!
                 |v_Xi2Jt4oXd|
                 |n_XioFrxoXd|
                 (car |l_XiIMvDnXd|))
               (|l2v_Xi0UzJmXd|
                 (cdr |l_XiIMvDnXd|)
                 |v_Xi2Jt4oXd|
                 (+ |n_XioFrxoXd| 1)))))))
      ()
      (#%lambda #t
        (|l_XimQxanXd|)
        (|l2v_Xi0UzJmXd|)
        (#%if (proper-list? |l_XimQxanXd|)
          (|l2v_Xi0UzJmXd|
            |l_XimQxanXd|
            (make-vector (length |l_XimQxanXd|))
            0)
          (error (#%quote list->vector)
                 "can only convert a proper list."
                 |l_XimQxanXd|))))))
(#%program
  ((|elems_XiKBp-oXd| . 1) (list->vector . 1))
  ()
  (list->vector)
  (#%define vector
    (#%lambda #t
      |elems_XiKBp-oXd|
      ()
      (list->vector |elems_XiKBp-oXd|))))
(#%program
  ((|elems_Xi4ynrpXd| . 1) (list->string . 1))
  ()
  (list->string)
  (#%define string
    (#%lambda #t
      |elems_Xi4ynrpXd|
      ()
      (list->string |elems_Xi4ynrpXd|))))
(#%program
  ((_make-parameter . 1))
  ()
  ()
  (#%define current-url (_make-parameter "file:.")))
(#%program
  ((car . 1)
   (string-length . 1)
   (string-append . 1)
   (|l_Xi6nhOqXd| . 1)
   (- . 1)
   (|v_XiMqjlqXd| . 4)
   (string-ref . 1)
   (eqv? . 1)
   (current-url . 3)
   (normalize-url . 2)
   (|rest_XiqulUpXd| . 2)
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
      |rest_XiqulUpXd|
      ()
      (#%if (null? |rest_XiqulUpXd|)
        (normalize-url (current-url) ".")
        (current-url
          (normalize-url
            (current-url)
            ((#%lambda #t
               (|v_XiMqjlqXd|)
               ()
               ((#%lambda #t
                  (|l_Xi6nhOqXd|)
                  (|v_XiMqjlqXd|)
                  (#%if (eqv? (string-ref |v_XiMqjlqXd| (- |l_Xi6nhOqXd| 1))
                              #\/)
                    |v_XiMqjlqXd|
                    (string-append |v_XiMqjlqXd| "/")))
                (string-length |v_XiMqjlqXd|)))
             (car |rest_XiqulUpXd|))))))))
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
   (|extension_XiQ473tXd| . 1)
   (string-downcase . 1)
   (string->symbol . 1)
   (|_load_Xiu89CsXd| . 1)
   (cdr . 1)
   (|t_Xia15wtXd| . 2)
   (file-handler . 1)
   (|thunk_Xi8cb9sXd| . 1)
   (cons . 2)
   (|*file-handlers*_XisjffrXd| . 4)
   (|extension_XiOfdIrXd| . 2)
   (assq . 2)
   (not . 1)
   (add-file-handler . 1))
  ((file-handler . 1)
   (|*file-handlers*_XisjffrXd| . 1)
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
     (|*file-handlers*_XisjffrXd|)
     ()
     (#%begin
       (#%set! add-file-handler
         (#%lambda #t
           (|extension_XiOfdIrXd| |thunk_Xi8cb9sXd|)
           (|*file-handlers*_XisjffrXd|)
           (#%if (not (assq |extension_XiOfdIrXd|
                            |*file-handlers*_XisjffrXd|))
             (#%set! |*file-handlers*_XisjffrXd|
               (cons (cons |extension_XiOfdIrXd| |thunk_Xi8cb9sXd|)
                     |*file-handlers*_XisjffrXd|))
             #!void)))
       (#%set! file-handler
         ((#%lambda #t
            (|_load_Xiu89CsXd|)
            (|*file-handlers*_XisjffrXd|)
            (#%lambda #t
              (|extension_XiQ473tXd|)
              (|_load_Xiu89CsXd| |*file-handlers*_XisjffrXd|)
              ((#%lambda #t
                 (|t_Xia15wtXd|)
                 (|_load_Xiu89CsXd|)
                 (#%if |t_Xia15wtXd|
                   (cdr |t_Xia15wtXd|)
                   |_load_Xiu89CsXd|))
               (assq (string->symbol
                       (string-downcase |extension_XiQ473tXd|))
                     |*file-handlers*_XisjffrXd|))))
          load))))
   ()))
(#%program
  ((|rest_XiSV0quXd| . 1)
   (|file_XicS-SuXd| . 1)
   (current-url . 1)
   (normalize-url . 1)
   (|proc_XiwZ2ZtXd| . 1)
   (apply . 1))
  ()
  (apply current-url normalize-url)
  (#%define make-io-proc
    (#%lambda #t
      (|proc_XiwZ2ZtXd|)
      ()
      (#%lambda #t
        (|file_XicS-SuXd| . |rest_XiSV0quXd|)
        (|proc_XiwZ2ZtXd|)
        (apply |proc_XiwZ2ZtXd|
               (normalize-url (current-url) |file_XicS-SuXd|)
               |rest_XiSV0quXd|)))))
(#%program
  ((|url_XiYoKuyXd| . 1)
   (string->list . 1)
   (reverse! . 1)
   (cons . 1)
   (cdr . 1)
   (|loop_XiilIXyXd| . 2)
   (|acc_Xi-dERzXd| . 2)
   (list->string . 1)
   (car . 2)
   (equal? . 1)
   (|x_XiEhGozXd| . 4)
   (null? . 1)
   (void . 1)
   (|file-extension_XiyOYjvXd| . 1)
   (|fe_XiCsM1yXd| . 2)
   (file-handler . 1)
   (|e_XiWzQ7xXd| . 1)
   (|m_XiADSGwXd| . 1)
   (|fk_XigwOAxXd| . 1)
   (call-with-failure-continuation . 1)
   (with-failure-continuation . 1)
   (|file_XiUKWMvXd| . 1)
   (|previous-url_XieHUdwXd| . 3)
   (normalize-url . 1)
   (current-url . 6)
   (load . 1)
   (open-output-file . 2)
   (open-source-input-file . 2)
   (make-io-proc . 3)
   (open-input-file . 2))
  ((|loop_XiilIXyXd| . 1)
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
     (|file-extension_XiyOYjvXd|)
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
           (|file_XiUKWMvXd|)
           (|file-extension_XiyOYjvXd|)
           (#%begin
             ((#%lambda #t
                (|previous-url_XieHUdwXd|)
                (|file_XiUKWMvXd| |file-extension_XiyOYjvXd|)
                (#%begin
                  (current-url
                    (normalize-url
                      |previous-url_XieHUdwXd|
                      |file_XiUKWMvXd|))
                  (with-failure-continuation
                    (#%lambda #t
                      (|m_XiADSGwXd| |e_XiWzQ7xXd|)
                      (|previous-url_XieHUdwXd|)
                      (#%begin
                        (current-url |previous-url_XieHUdwXd|)
                        (call-with-failure-continuation
                          (#%lambda #t
                            (|fk_XigwOAxXd|)
                            (|e_XiWzQ7xXd| |m_XiADSGwXd|)
                            (|fk_XigwOAxXd| |m_XiADSGwXd| |e_XiWzQ7xXd|)))))
                    (#%lambda #t
                      ()
                      (|file-extension_XiyOYjvXd|)
                      ((#%lambda #t
                         (|fe_XiCsM1yXd|)
                         ()
                         ((file-handler
                            (#%if |fe_XiCsM1yXd| |fe_XiCsM1yXd| "scm"))
                          (current-url)))
                       (|file-extension_XiyOYjvXd| (current-url)))))
                  (current-url |previous-url_XieHUdwXd|)))
              (current-url))
             (void))))))
   (#%lambda #t
     (|url_XiYoKuyXd|)
     ()
     ((#%letrec #t
        ((|loop_XiilIXyXd|
           (#%lambda #t
             (|x_XiEhGozXd| |acc_Xi-dERzXd|)
             (|loop_XiilIXyXd|)
             (#%if (null? |x_XiEhGozXd|)
               #f
               (#%if (equal? (car |x_XiEhGozXd|) #\.)
                 (list->string |acc_Xi-dERzXd|)
                 (|loop_XiilIXyXd|
                   (cdr |x_XiEhGozXd|)
                   (cons (car |x_XiEhGozXd|) |acc_Xi-dERzXd|)))))))
        ()
        |loop_XiilIXyXd|)
      (reverse! (string->list |url_XiYoKuyXd|))
      ()))))
(#%program
  ((|str_XikaCiAXd| . 1)
   (load-native-library . 1)
   (native-library-binding-names . 1)
   (|binding-names_Xi03ycBXd| . 1)
   (|nl_XiG6ALAXd| . 2)
   (native-library-binding . 1)
   (|name_Xim_vFBXd| . 2)
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
      (|str_XikaCiAXd|)
      ()
      ((#%lambda #t
         (|nl_XiG6ALAXd|)
         ()
         ((#%lambda #t
            (|binding-names_Xi03ycBXd|)
            (|nl_XiG6ALAXd|)
            (for-each
              (#%lambda #t
                (|name_Xim_vFBXd|)
                (|nl_XiG6ALAXd|)
                (putprop
                  |name_Xim_vFBXd|
                  (native-library-binding
                    |nl_XiG6ALAXd|
                    |name_Xim_vFBXd|)))
              |binding-names_Xi03ycBXd|))
          (native-library-binding-names |nl_XiG6ALAXd|)))
       (load-native-library |str_XikaCiAXd|)))))
(#%program
  ((|lses_Xi2UrzCXd| . 5)
   (cdr . 3)
   (car . 3)
   (append2 . 1)
   (|real-append_XiIXt6CXd| . 3)
   (apply . 3)
   (|ls1_XiKMntDXd| . 3)
   (|lses_XioQp0DXd| . 4)
   (null? . 4))
  ((|real-append_XiIXt6CXd| . 1))
  (apply cdr append2 car null?)
  (#%define append
    (#%letrec #t
      ((|real-append_XiIXt6CXd|
         (#%lambda #t
           (|ls1_XiKMntDXd| . |lses_XioQp0DXd|)
           (|real-append_XiIXt6CXd|)
           (#%if (null? |lses_XioQp0DXd|)
             |ls1_XiKMntDXd|
             (#%if (null? |ls1_XiKMntDXd|)
               (apply |real-append_XiIXt6CXd| |lses_XioQp0DXd|)
               (apply |real-append_XiIXt6CXd|
                      (append2 |ls1_XiKMntDXd| (car |lses_XioQp0DXd|))
                      (cdr |lses_XioQp0DXd|)))))))
      ()
      (#%lambda #t
        |lses_Xi2UrzCXd|
        (|real-append_XiIXt6CXd|)
        (#%if (null? |lses_Xi2UrzCXd|)
          ()
          (#%if (null? (cdr |lses_Xi2UrzCXd|))
            (car |lses_Xi2UrzCXd|)
            (apply |real-append_XiIXt6CXd|
                   (car |lses_Xi2UrzCXd|)
                   (cdr |lses_Xi2UrzCXd|))))))))
(#%program
  ((|x_Xi4JlWDXd| . 2)
   (null? . 2)
   (|lag_Xi6yfhFXd| . 1)
   (cdr . 3)
   (|lp_XiqFjnEXd| . 2)
   (|lag_Xi8n9EGXd| . 2)
   (|x_XiOqbbGXd| . 2)
   (eq? . 1)
   (not . 1)
   (|x_XisudKFXd| . 3)
   (|x_XiMBhQEXd| . 3)
   (pair? . 2))
  ((|lp_XiqFjnEXd| . 1))
  (pair? cdr eq? not null?)
  (#%define proper-list?
    (#%lambda #t
      (|x_Xi4JlWDXd|)
      ()
      ((#%letrec #t
         ((|lp_XiqFjnEXd|
            (#%lambda #t
              (|x_XiMBhQEXd| |lag_Xi6yfhFXd|)
              (|lp_XiqFjnEXd|)
              (#%if (pair? |x_XiMBhQEXd|)
                ((#%lambda #t
                   (|x_XisudKFXd|)
                   (|lag_Xi6yfhFXd| |lp_XiqFjnEXd|)
                   (#%if (pair? |x_XisudKFXd|)
                     ((#%lambda #t
                        (|x_XiOqbbGXd| |lag_Xi8n9EGXd|)
                        (|lp_XiqFjnEXd|)
                        (#%if (not (eq? |x_XiOqbbGXd| |lag_Xi8n9EGXd|))
                          (|lp_XiqFjnEXd| |x_XiOqbbGXd| |lag_Xi8n9EGXd|)
                          #f))
                      (cdr |x_XisudKFXd|)
                      (cdr |lag_Xi6yfhFXd|))
                     (null? |x_XisudKFXd|)))
                 (cdr |x_XiMBhQEXd|))
                (null? |x_XiMBhQEXd|)))))
         ()
         |lp_XiqFjnEXd|)
       |x_Xi4JlWDXd|
       |x_Xi4JlWDXd|))))
(#%program
  ((proper-list? . 1))
  ()
  ()
  (#%define list? proper-list?))
(#%program
  ((|general-expt_Xiuj75HXd| . 1)
   (denominator . 1)
   (numerator . 1)
   (|rational-expt_XiQf5yHXd| . 1)
   (integer? . 2)
   (not . 1)
   (rational? . 1)
   (|base_Xiw81sIXd| . 9)
   (|exponent_XiS4_UIXd| . 8)
   (|squaring_XiEsETNXd| . 3)
   (odd? . 1)
   (quotient . 1)
   (|loop_XiCDKwMXd| . 2)
   (|result_XiiwGqNXd| . 3)
   (|rest_XiYzIZMXd| . 3)
   (zero? . 3)
   (ashl . 1)
   (= . 1)
   (exact? . 5)
   (abs . 1)
   (|base_XiWKOCLXd| . 4)
   (|integer-expt_Xiac3_HXd| . 2)
   (|exponent_XigHM3MXd| . 4)
   (negative? . 1)
   (|base-denominator_XieSSIKXd| . 1)
   (|exponent_XiAOQ9LXd| . 2)
   (|base-numerator_XiUVUfKXd| . 1)
   (expt . 2)
   (/ . 2)
   (|base_Xic1ZlJXd| . 1)
   (log . 1)
   (|exponent_XiyZWOJXd| . 1)
   (* . 3)
   (exp . 1))
  ((|loop_XiCDKwMXd| . 1)
   (|integer-expt_Xiac3_HXd| . 1)
   (|rational-expt_XiQf5yHXd| . 1)
   (|general-expt_Xiuj75HXd| . 1))
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
      ((|general-expt_Xiuj75HXd|
         (#%lambda #t
           (|base_Xic1ZlJXd| |exponent_XiyZWOJXd|)
           ()
           (exp (* |exponent_XiyZWOJXd| (log |base_Xic1ZlJXd|)))))
       (|rational-expt_XiQf5yHXd|
         (#%lambda #t
           (|base-numerator_XiUVUfKXd|
             |base-denominator_XieSSIKXd|
             |exponent_XiAOQ9LXd|)
           ()
           (/ (expt |base-numerator_XiUVUfKXd|
                    |exponent_XiAOQ9LXd|)
              (expt |base-denominator_XieSSIKXd|
                    |exponent_XiAOQ9LXd|))))
       (|integer-expt_Xiac3_HXd|
         (#%lambda #t
           (|base_XiWKOCLXd| |exponent_XigHM3MXd|)
           (|integer-expt_Xiac3_HXd|)
           (#%if (negative? |exponent_XigHM3MXd|)
             (/ (|integer-expt_Xiac3_HXd|
                  |base_XiWKOCLXd|
                  (abs |exponent_XigHM3MXd|)))
             (#%if (#%if (exact? |base_XiWKOCLXd|)
                     (= |base_XiWKOCLXd| 2)
                     #f)
               (ashl 1 |exponent_XigHM3MXd|)
               ((#%letrec #t
                  ((|loop_XiCDKwMXd|
                     (#%lambda #t
                       (|rest_XiYzIZMXd|
                         |result_XiiwGqNXd|
                         |squaring_XiEsETNXd|)
                       (|loop_XiCDKwMXd|)
                       (#%if (zero? |rest_XiYzIZMXd|)
                         |result_XiiwGqNXd|
                         (|loop_XiCDKwMXd|
                           (quotient |rest_XiYzIZMXd| 2)
                           (#%if (odd? |rest_XiYzIZMXd|)
                             (* |result_XiiwGqNXd| |squaring_XiEsETNXd|)
                             |result_XiiwGqNXd|)
                           (* |squaring_XiEsETNXd| |squaring_XiEsETNXd|))))))
                  ()
                  |loop_XiCDKwMXd|)
                |exponent_XigHM3MXd|
                1
                |base_XiWKOCLXd|))))))
      ()
      (#%lambda #t
        (|base_Xiw81sIXd| |exponent_XiS4_UIXd|)
        (|integer-expt_Xiac3_HXd|
          |rational-expt_XiQf5yHXd|
          |general-expt_Xiuj75HXd|)
        (#%if (zero? |exponent_XiS4_UIXd|)
          (#%if (exact? |exponent_XiS4_UIXd|) 1 1.0)
          (#%if (zero? |base_Xiw81sIXd|)
            (#%if (exact? |exponent_XiS4_UIXd|)
              |base_Xiw81sIXd|
              0.0)
            (#%if (#%if (exact? |base_Xiw81sIXd|)
                    (#%if (rational? |base_Xiw81sIXd|)
                      (not (integer? |base_Xiw81sIXd|))
                      #f)
                    #f)
              (|rational-expt_XiQf5yHXd|
                (numerator |base_Xiw81sIXd|)
                (denominator |base_Xiw81sIXd|)
                |exponent_XiS4_UIXd|)
              (#%if (#%if (exact? |exponent_XiS4_UIXd|)
                      (integer? |exponent_XiS4_UIXd|)
                      #f)
                (|integer-expt_Xiac3_HXd|
                  |base_Xiw81sIXd|
                  |exponent_XiS4_UIXd|)
                (|general-expt_Xiuj75HXd|
                  |base_Xiw81sIXd|
                  |exponent_XiS4_UIXd|)))))))))
(#%program
  ((- . 1)
   (|tmp_Xi0ewHPXd| . 2)
   (/ . 2)
   (modpow . 2)
   (|tmp_Ximau8QXd| . 2)
   (* . 3)
   (even? . 1)
   (|n_XiGhyePXd| . 6)
   (|x_Xi-oCkOXd| . 4)
   (modulo . 4)
   (|y_XiklANOXd| . 4)
   (= . 1))
  ()
  (even? modpow / * - modulo =)
  (#%define modpow
    (#%lambda #t
      (|x_Xi-oCkOXd| |y_XiklANOXd| |n_XiGhyePXd|)
      ()
      (#%if (= |y_XiklANOXd| 1)
        (modulo |x_Xi-oCkOXd| |n_XiGhyePXd|)
        (#%if (even? |y_XiklANOXd|)
          ((#%lambda #t
             (|tmp_Ximau8QXd|)
             (|n_XiGhyePXd|)
             (modulo
               (* |tmp_Ximau8QXd| |tmp_Ximau8QXd|)
               |n_XiGhyePXd|))
           (modpow
             |x_Xi-oCkOXd|
             (/ |y_XiklANOXd| 2)
             |n_XiGhyePXd|))
          ((#%lambda #t
             (|tmp_Xi0ewHPXd|)
             (|n_XiGhyePXd| |x_Xi-oCkOXd|)
             (modulo
               (* |x_Xi-oCkOXd|
                  (modulo
                    (* |tmp_Xi0ewHPXd| |tmp_Xi0ewHPXd|)
                    |n_XiGhyePXd|))
               |n_XiGhyePXd|))
           (modpow
             |x_Xi-oCkOXd|
             (/ (- |y_XiklANOXd| 1) 2)
             |n_XiGhyePXd|)))))))
(#%program
  ((integer? . 1)
   (round . 1)
   (= . 1)
   (real? . 1)
   (|n_Xi23q2RXd| . 4)
   (|oldint?_XiI6sBQXd| . 1))
  ()
  (= round real?)
  (#%define integer?
    ((#%lambda #t
       (|oldint?_XiI6sBQXd|)
       ()
       (#%lambda #t
         (|n_Xi23q2RXd|)
         (|oldint?_XiI6sBQXd|)
         (#%if (|oldint?_XiI6sBQXd| |n_Xi23q2RXd|)
           #t
           (#%if (real? |n_Xi23q2RXd|)
             (= (round |n_Xi23q2RXd|) |n_Xi23q2RXd|)
             #f))))
     integer?)))
(#%program
  ((complex? . 1)
   (|oldcomp?_Xio_nvRXd| . 1)
   (not . 1)
   (|n_XiKXlYRXd| . 2)
   (number? . 1))
  ()
  (number? not)
  (#%define real?
    ((#%lambda #t
       (|oldcomp?_Xio_nvRXd|)
       ()
       (#%lambda #t
         (|n_XiKXlYRXd|)
         (|oldcomp?_Xio_nvRXd|)
         (#%if (number? |n_XiKXlYRXd|)
           (not (|oldcomp?_Xio_nvRXd| |n_XiKXlYRXd|))
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
   (|b_XiMMfjTXd| . 2)
   (|a_XiqQhSSXd| . 2)
   (* . 2)
   (+ . 1)
   (sqrt . 1)
   (|num_Xi4UjpSXd| . 6)
   (real? . 1)
   (not . 1))
  ()
  (< - + * sqrt real-part imag-part not real?)
  (#%define abs
    (#%lambda #t
      (|num_Xi4UjpSXd|)
      ()
      (#%if (not (real? |num_Xi4UjpSXd|))
        ((#%lambda #t
           (|a_XiqQhSSXd| |b_XiMMfjTXd|)
           ()
           (sqrt (+ (* |a_XiqQhSSXd| |a_XiqQhSSXd|)
                    (* |b_XiMMfjTXd| |b_XiMMfjTXd|))))
         (real-part |num_Xi4UjpSXd|)
         (imag-part |num_Xi4UjpSXd|))
        (#%if (< |num_Xi4UjpSXd| 0)
          (- |num_Xi4UjpSXd|)
          |num_Xi4UjpSXd|)))))
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
   (|x1_Xiuu5AVXd| . 3)
   (|args_Xi8y77VXd| . 2)
   (max . 1)
   (< . 1)
   (|x1_XiOB9GUXd| . 3)
   (|args_XisFbdUXd| . 2)
   (min . 1)
   (inexact? . 3)
   (cdr . 2)
   (|_min_max_Xi6JdMTXd| . 4)
   (car . 3)
   (|proc_XiQq31WXd| . 3)
   (exact->inexact . 1)
   (|mv_Xian1uWXd| . 5)
   (exact? . 1)
   (|inexact_XiSfZnXXd| . 3)
   (|args_Xiwj_WWXd| . 6)
   (null? . 3))
  ((max . 1) (min . 1) (|_min_max_Xi6JdMTXd| . 1))
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
    ((|_min_max_Xi6JdMTXd|
       (#%lambda #t
         (|proc_XiQq31WXd|
           |mv_Xian1uWXd|
           |args_Xiwj_WWXd|
           |inexact_XiSfZnXXd|)
         (|_min_max_Xi6JdMTXd|)
         (#%if (null? |args_Xiwj_WWXd|)
           (#%if (#%if |inexact_XiSfZnXXd|
                   (exact? |mv_Xian1uWXd|)
                   #f)
             (exact->inexact |mv_Xian1uWXd|)
             |mv_Xian1uWXd|)
           (#%if (|proc_XiQq31WXd|
                   (car |args_Xiwj_WWXd|)
                   |mv_Xian1uWXd|)
             (|_min_max_Xi6JdMTXd|
               |proc_XiQq31WXd|
               (car |args_Xiwj_WWXd|)
               (cdr |args_Xiwj_WWXd|)
               (#%if |inexact_XiSfZnXXd|
                 #t
                 (inexact? (car |args_Xiwj_WWXd|))))
             (|_min_max_Xi6JdMTXd|
               |proc_XiQq31WXd|
               |mv_Xian1uWXd|
               (cdr |args_Xiwj_WWXd|)
               |inexact_XiSfZnXXd|))))))
    ()
    (#%begin
      (#%set! min
        (#%lambda #t
          (|x1_XiOB9GUXd| . |args_XisFbdUXd|)
          (|_min_max_Xi6JdMTXd|)
          (#%if (null? |args_XisFbdUXd|)
            |x1_XiOB9GUXd|
            (|_min_max_Xi6JdMTXd|
              <
              |x1_XiOB9GUXd|
              |args_XisFbdUXd|
              (inexact? |x1_XiOB9GUXd|)))))
      (#%set! max
        (#%lambda #t
          (|x1_Xiuu5AVXd| . |args_Xi8y77VXd|)
          (|_min_max_Xi6JdMTXd|)
          (#%if (null? |args_Xi8y77VXd|)
            |x1_Xiuu5AVXd|
            (|_min_max_Xi6JdMTXd|
              >
              |x1_Xiuu5AVXd|
              |args_Xi8y77VXd|
              (inexact? |x1_Xiuu5AVXd|))))))))
(#%program
  ((|n_XiccXQXXd| . 1) (< . 1))
  ()
  (<)
  (#%define negative?
    (#%lambda #t
      (|n_XiccXQXXd|)
      ()
      (< |n_XiccXQXXd| 0))))
(#%program
  ((|n_Xiy8VhYXd| . 1) (> . 1))
  ()
  (>)
  (#%define positive?
    (#%lambda #t
      (|n_Xiy8VhYXd|)
      ()
      (> |n_Xiy8VhYXd| 0))))
(#%program
  ((|n_XiU4TKYXd| . 1) (modulo . 1) (= . 1))
  ()
  (modulo =)
  (#%define even?
    (#%lambda #t
      (|n_XiU4TKYXd|)
      ()
      (= 0 (modulo |n_XiU4TKYXd| 2)))))
(#%program
  ((|n_Xie1RbZXd| . 1) (even? . 1) (not . 1))
  ()
  (even? not)
  (#%define odd?
    (#%lambda #t
      (|n_Xie1RbZXd|)
      ()
      (not (even? |n_Xie1RbZXd|)))))
(#%program
  ((|n_XiAZOEZXd| . 1) (= . 1))
  ()
  (=)
  (#%define zero?
    (#%lambda #t
      (|n_XiAZOEZXd|)
      ()
      (= |n_XiAZOEZXd| 0))))
(#%program
  ((|n_XiWVM5-Xd| . 1) (+ . 1))
  ()
  (+)
  (#%define add1
    (#%lambda #t
      (|n_XiWVM5-Xd|)
      ()
      (+ |n_XiWVM5-Xd| 1))))
(#%program
  ((|n_XigSKy-Xd| . 1) (- . 1))
  ()
  (-)
  (#%define sub1
    (#%lambda #t
      (|n_XigSKy-Xd|)
      ()
      (- |n_XigSKy-Xd| 1))))
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
  ((|y_Xi43iU4Yd| . 1)
   (|x_XiK6kr4Yd| . 1)
   (|args_XiIhq43Yd| . 1)
   (|loop_Xi2eox3Yd| . 2)
   (cadr . 1)
   (car . 1)
   (|comparator_XiGswJ1Yd| . 1)
   (|chainer_Xi0pua2Yd| . 1)
   (cdr . 2)
   (|endstate_XimlsD2Yd| . 2)
   (|x_Xioam-3Yd| . 5)
   (null? . 2)
   (|b_Xikwyg1Yd| . 2)
   (|a_Xi-zAP0Yd| . 2)
   (> . 1)
   (>= . 1)
   (|_and2_XiYKGs_Xd| . 2)
   (= . 2)
   (|b_XiEDCm0Yd| . 2)
   (|a_XiiHEV_Xd| . 2)
   (< . 1)
   (|_comp_help_XiCOI_-Xd| . 2)
   (<= . 1))
  ((|loop_Xi2eox3Yd| . 1) (>= . 1) (<= . 1))
  (null? cadr car cdr <= = < >= >)
  ((#%lambda #t
     (|_comp_help_XiCOI_-Xd| |_and2_XiYKGs_Xd|)
     ()
     (#%begin
       (#%set! <=
         (|_comp_help_XiCOI_-Xd|
           (#%lambda #t
             (|a_XiiHEV_Xd| |b_XiEDCm0Yd|)
             ()
             (#%if (< |a_XiiHEV_Xd| |b_XiEDCm0Yd|)
               #t
               (= |a_XiiHEV_Xd| |b_XiEDCm0Yd|)))
           |_and2_XiYKGs_Xd|
           #t))
       (#%set! >=
         (|_comp_help_XiCOI_-Xd|
           (#%lambda #t
             (|a_Xi-zAP0Yd| |b_Xikwyg1Yd|)
             ()
             (#%if (> |a_Xi-zAP0Yd| |b_Xikwyg1Yd|)
               #t
               (= |a_Xi-zAP0Yd| |b_Xikwyg1Yd|)))
           |_and2_XiYKGs_Xd|
           #t))))
   (#%lambda #t
     (|comparator_XiGswJ1Yd|
       |chainer_Xi0pua2Yd|
       |endstate_XimlsD2Yd|)
     ()
     (#%lambda #t
       |args_XiIhq43Yd|
       (|endstate_XimlsD2Yd|
         |chainer_Xi0pua2Yd|
         |comparator_XiGswJ1Yd|)
       ((#%letrec #t
          ((|loop_Xi2eox3Yd|
             (#%lambda #t
               (|x_Xioam-3Yd|)
               (|loop_Xi2eox3Yd|
                 |endstate_XimlsD2Yd|
                 |chainer_Xi0pua2Yd|
                 |comparator_XiGswJ1Yd|)
               (#%if (null? |x_Xioam-3Yd|)
                 |endstate_XimlsD2Yd|
                 (#%if (null? (cdr |x_Xioam-3Yd|))
                   |endstate_XimlsD2Yd|
                   (|chainer_Xi0pua2Yd|
                     (|comparator_XiGswJ1Yd|
                       (car |x_Xioam-3Yd|)
                       (cadr |x_Xioam-3Yd|))
                     (|loop_Xi2eox3Yd| (cdr |x_Xioam-3Yd|))))))))
          (|endstate_XimlsD2Yd|
            |chainer_Xi0pua2Yd|
            |comparator_XiGswJ1Yd|)
          |loop_Xi2eox3Yd|)
        |args_XiIhq43Yd|)))
   (#%lambda #t
     (|x_XiK6kr4Yd| |y_Xi43iU4Yd|)
     ()
     (#%if |x_XiK6kr4Yd| |y_Xi43iU4Yd| #f))))
(#%program
  ((|chainer_Xi6Ubf6Yd| . 1)
   (apply . 1)
   (|comparator_XiMXdO5Yd| . 1)
   (cadr . 2)
   (car . 2)
   (= . 1)
   (cdr . 2)
   (|args_XisQ9I6Yd| . 7)
   (null? . 2)
   (< . 1)
   (<= . 2)
   (> . 1)
   (|_?=_Xiq_fl5Yd| . 2)
   (>= . 2))
  ((<= . 1) (>= . 1))
  (< <= <= > >= >= null? = car cadr apply cdr)
  ((#%lambda #t
     (|_?=_Xiq_fl5Yd|)
     ()
     (#%begin
       (#%set! >= (|_?=_Xiq_fl5Yd| > >=))
       (#%set! <= (|_?=_Xiq_fl5Yd| < <=))))
   (#%lambda #t
     (|comparator_XiMXdO5Yd| |chainer_Xi6Ubf6Yd|)
     ()
     (#%lambda #t
       |args_XisQ9I6Yd|
       (|chainer_Xi6Ubf6Yd| |comparator_XiMXdO5Yd|)
       (#%if (null? |args_XisQ9I6Yd|)
         #t
         (#%if (null? (cdr |args_XisQ9I6Yd|))
           #t
           (#%if (#%if (= (car |args_XisQ9I6Yd|)
                          (cadr |args_XisQ9I6Yd|))
                   #t
                   (|comparator_XiMXdO5Yd|
                     (car |args_XisQ9I6Yd|)
                     (cadr |args_XisQ9I6Yd|)))
             (apply |chainer_Xi6Ubf6Yd|
                    (cdr |args_XisQ9I6Yd|))
             #f)))))))
(#%program
  ((cadr . 1)
   (_gcd . 1)
   (car . 2)
   (cdr . 1)
   (|args_Xi8J5C7Yd| . 5)
   (null? . 2))
  ()
  (cdr car cadr _gcd null?)
  (#%define gcd
    (#%lambda #t
      |args_Xi8J5C7Yd|
      ()
      (#%if (null? |args_Xi8J5C7Yd|)
        0
        (#%if (null? (cdr |args_Xi8J5C7Yd|))
          (car |args_Xi8J5C7Yd|)
          (_gcd (car |args_Xi8J5C7Yd|)
                (cadr |args_Xi8J5C7Yd|)))))))
(#%program
  ((cadr . 1)
   (_lcm . 1)
   (car . 2)
   (cdr . 1)
   (|args_XiuF338Yd| . 5)
   (null? . 2))
  ()
  (cdr car cadr _lcm null?)
  (#%define lcm
    (#%lambda #t
      |args_XiuF338Yd|
      ()
      (#%if (null? |args_XiuF338Yd|)
        1
        (#%if (null? (cdr |args_XiuF338Yd|))
          (car |args_XiuF338Yd|)
          (_lcm (car |args_XiuF338Yd|)
                (cadr |args_XiuF338Yd|)))))))
(#%program
  ((|x_XiQB1w8Yd| . 1)
   (remainder . 1)
   (+ . 1)
   (|r_XiwuZp9Yd| . 3)
   (positive? . 1)
   (|y_Xiay_Y8Yd| . 3)
   (negative? . 2))
  ()
  (remainder positive? negative? +)
  (#%define modulo
    (#%lambda #t
      (|x_XiQB1w8Yd| |y_Xiay_Y8Yd|)
      ()
      ((#%lambda #t
         (|r_XiwuZp9Yd|)
         (|y_Xiay_Y8Yd|)
         (#%if ((#%if (negative? |y_Xiay_Y8Yd|)
                  positive?
                  negative?)
                |r_XiwuZp9Yd|)
           (+ |r_XiwuZp9Yd| |y_Xiay_Y8Yd|)
           |r_XiwuZp9Yd|))
       (remainder |x_XiQB1w8Yd| |y_Xiay_Y8Yd|)))))
(#%program
  ((|args_XicnVjaYd| . 3)
   (cdr . 2)
   (car . 2)
   (_string-append . 1)
   (|string-append-helper_XiSqXS9Yd| . 2)
   (|acc_XiyjTMaYd| . 2)
   (|args_XiUfRdbYd| . 3)
   (null? . 2))
  ((|string-append-helper_XiSqXS9Yd| . 1))
  (car _string-append cdr null?)
  (#%define string-append
    (#%letrec #t
      ((|string-append-helper_XiSqXS9Yd|
         (#%lambda #t
           (|acc_XiyjTMaYd| |args_XiUfRdbYd|)
           (|string-append-helper_XiSqXS9Yd|)
           (#%if (null? |args_XiUfRdbYd|)
             |acc_XiyjTMaYd|
             (|string-append-helper_XiSqXS9Yd|
               (_string-append
                 |acc_XiyjTMaYd|
                 (car |args_XiUfRdbYd|))
               (cdr |args_XiUfRdbYd|))))))
      ()
      (#%lambda #t
        |args_XicnVjaYd|
        (|string-append-helper_XiSqXS9Yd|)
        (#%if (null? |args_XicnVjaYd|)
          ""
          (|string-append-helper_XiSqXS9Yd|
            (car |args_XicnVjaYd|)
            (cdr |args_XicnVjaYd|)))))))
(#%program
  ((- . 1)
   (char->integer . 4)
   (|c_Xig1J1dYd| . 2)
   (|lc-offset_XiW4LAcYd| . 1)
   (+ . 1)
   (integer->char . 1)
   (|z_XiA8N7cYd| . 1)
   (<= . 1)
   (|a_XiecPGbYd| . 2)
   (|cv_XiCZGudYd| . 3)
   (>= . 1))
  ()
  (integer->char + >= <= char->integer -)
  (#%define char-downcase
    ((#%lambda #t
       (|a_XiecPGbYd|)
       ()
       ((#%lambda #t
          (|z_XiA8N7cYd|)
          (|a_XiecPGbYd|)
          ((#%lambda #t
             (|lc-offset_XiW4LAcYd|)
             (|z_XiA8N7cYd| |a_XiecPGbYd|)
             (#%lambda #t
               (|c_Xig1J1dYd|)
               (|lc-offset_XiW4LAcYd|
                 |z_XiA8N7cYd|
                 |a_XiecPGbYd|)
               ((#%lambda #t
                  (|cv_XiCZGudYd|)
                  (|c_Xig1J1dYd|
                    |lc-offset_XiW4LAcYd|
                    |z_XiA8N7cYd|
                    |a_XiecPGbYd|)
                  (#%if (#%if (>= |cv_XiCZGudYd| |a_XiecPGbYd|)
                          (<= |cv_XiCZGudYd| |z_XiA8N7cYd|)
                          #f)
                    (integer->char
                      (+ |cv_XiCZGudYd| |lc-offset_XiW4LAcYd|))
                    |c_Xig1J1dYd|))
                (char->integer |c_Xig1J1dYd|))))
           (- (char->integer #\a) |a_XiecPGbYd|)))
        (char->integer #\Z)))
     (char->integer #\A))))
(#%program
  ((char->integer . 4)
   (|c_Xi-KyifYd| . 2)
   (|uc-offset_XiEOAReYd| . 1)
   (- . 2)
   (integer->char . 1)
   (|z_XiiSCoeYd| . 1)
   (<= . 1)
   (|a_XiYVEXdYd| . 2)
   (|cv_XikHwLfYd| . 3)
   (>= . 1))
  ()
  (integer->char - >= <= char->integer)
  (#%define char-upcase
    ((#%lambda #t
       (|a_XiYVEXdYd|)
       ()
       ((#%lambda #t
          (|z_XiiSCoeYd|)
          (|a_XiYVEXdYd|)
          ((#%lambda #t
             (|uc-offset_XiEOAReYd|)
             (|z_XiiSCoeYd| |a_XiYVEXdYd|)
             (#%lambda #t
               (|c_Xi-KyifYd|)
               (|uc-offset_XiEOAReYd|
                 |z_XiiSCoeYd|
                 |a_XiYVEXdYd|)
               ((#%lambda #t
                  (|cv_XikHwLfYd|)
                  (|c_Xi-KyifYd|
                    |uc-offset_XiEOAReYd|
                    |z_XiiSCoeYd|
                    |a_XiYVEXdYd|)
                  (#%if (#%if (>= |cv_XikHwLfYd| |a_XiYVEXdYd|)
                          (<= |cv_XikHwLfYd| |z_XiiSCoeYd|)
                          #f)
                    (integer->char
                      (- |cv_XikHwLfYd| |uc-offset_XiEOAReYd|))
                    |c_Xi-KyifYd|))
                (char->integer |c_Xi-KyifYd|))))
           (- |a_XiYVEXdYd| (char->integer #\A))))
        (char->integer #\z)))
     (char->integer #\a))))
(#%program
  ((|args_XiGDucgYd| . 1)
   (map . 1)
   (|c2_Xi0AsFgYd| . 1)
   (|c1_Ximwq6hYd| . 1)
   (char->integer . 3)
   (> . 1)
   (apply . 1))
  ()
  (map char->integer > apply)
  (#%define char>?
    (#%lambda #t
      (|c1_Ximwq6hYd|
        |c2_Xi0AsFgYd|
        .
        |args_XiGDucgYd|)
      ()
      (apply >
             (char->integer |c1_Ximwq6hYd|)
             (char->integer |c2_Xi0AsFgYd|)
             (map char->integer |args_XiGDucgYd|)))))
(#%program
  ((|args_XiIsozhYd| . 1)
   (map . 1)
   (|c2_Xi2pm0iYd| . 1)
   (|c1_XiolktiYd| . 1)
   (char->integer . 3)
   (< . 1)
   (apply . 1))
  ()
  (map char->integer < apply)
  (#%define char<?
    (#%lambda #t
      (|c1_XiolktiYd|
        |c2_Xi2pm0iYd|
        .
        |args_XiIsozhYd|)
      ()
      (apply <
             (char->integer |c1_XiolktiYd|)
             (char->integer |c2_Xi2pm0iYd|)
             (map char->integer |args_XiIsozhYd|)))))
(#%program
  ((eqv? . 1))
  ()
  ()
  (#%define char=? eqv?))
(#%program
  ((char=? . 1)
   (|c2_Xi4egnjYd| . 2)
   (|c1_XiKhiWiYd| . 2)
   (char>? . 1))
  ()
  (char=? char>?)
  (#%define char>=?
    (#%lambda #t
      (|c1_XiKhiWiYd| |c2_Xi4egnjYd|)
      ()
      (#%if (char>? |c1_XiKhiWiYd| |c2_Xi4egnjYd|)
        #t
        (char=? |c1_XiKhiWiYd| |c2_Xi4egnjYd|)))))
(#%program
  ((char=? . 1)
   (|c2_XiM6chkYd| . 2)
   (|c1_XiqaeQjYd| . 2)
   (char<? . 1))
  ()
  (char=? char<?)
  (#%define char<=?
    (#%lambda #t
      (|c1_XiqaeQjYd| |c2_XiM6chkYd|)
      ()
      (#%if (char<? |c1_XiqaeQjYd| |c2_XiM6chkYd|)
        #t
        (char=? |c1_XiqaeQjYd| |c2_XiM6chkYd|)))))
(#%program
  ((|args_Xi63aKkYd| . 1)
   (map . 1)
   (|c2_Xis_7blYd| . 1)
   (|c1_XiOX5ElYd| . 1)
   (char-downcase . 3)
   (char>? . 1)
   (apply . 1))
  ()
  (map char-downcase char>? apply)
  (#%define char-ci>?
    (#%lambda #t
      (|c1_XiOX5ElYd|
        |c2_Xis_7blYd|
        .
        |args_Xi63aKkYd|)
      ()
      (apply char>?
             (char-downcase |c1_XiOX5ElYd|)
             (char-downcase |c2_Xis_7blYd|)
             (map char-downcase |args_Xi63aKkYd|)))))
(#%program
  ((|args_Xi8U35mYd| . 1)
   (map . 1)
   (|c2_XiuQ1ymYd| . 1)
   (|c1_XiQM_-mYd| . 1)
   (char-downcase . 3)
   (char<? . 1)
   (apply . 1))
  ()
  (map char-downcase char<? apply)
  (#%define char-ci<?
    (#%lambda #t
      (|c1_XiQM_-mYd|
        |c2_XiuQ1ymYd|
        .
        |args_Xi8U35mYd|)
      ()
      (apply char<?
             (char-downcase |c1_XiQM_-mYd|)
             (char-downcase |c2_XiuQ1ymYd|)
             (map char-downcase |args_Xi8U35mYd|)))))
(#%program
  ((|args_XiaJZrnYd| . 1)
   (map . 1)
   (|c2_XiwFXUnYd| . 1)
   (|c1_XiSBVloYd| . 1)
   (char-downcase . 3)
   (char=? . 1)
   (apply . 1))
  ()
  (map char-downcase char=? apply)
  (#%define char-ci=?
    (#%lambda #t
      (|c1_XiSBVloYd|
        |c2_XiwFXUnYd|
        .
        |args_XiaJZrnYd|)
      ()
      (apply char=?
             (char-downcase |c1_XiSBVloYd|)
             (char-downcase |c2_XiwFXUnYd|)
             (map char-downcase |args_XiaJZrnYd|)))))
(#%program
  ((char-ci=? . 1)
   (|c2_XiyuRfpYd| . 2)
   (|c1_XicyTOoYd| . 2)
   (char-ci>? . 1))
  ()
  (char-ci=? char-ci>?)
  (#%define char-ci>=?
    (#%lambda #t
      (|c1_XicyTOoYd| |c2_XiyuRfpYd|)
      ()
      (#%if (char-ci>? |c1_XicyTOoYd| |c2_XiyuRfpYd|)
        #t
        (char-ci=? |c1_XicyTOoYd| |c2_XiyuRfpYd|)))))
(#%program
  ((char-ci=? . 1)
   (|c2_XienN9qYd| . 2)
   (|c1_XiUqPIpYd| . 2)
   (char-ci<? . 1))
  ()
  (char-ci=? char-ci<?)
  (#%define char-ci<=?
    (#%lambda #t
      (|c1_XiUqPIpYd| |c2_XienN9qYd|)
      ()
      (#%if (char-ci<? |c1_XiUqPIpYd| |c2_XienN9qYd|)
        #t
        (char-ci=? |c1_XiUqPIpYd| |c2_XienN9qYd|)))))
(#%program
  ((|c_XiAjLCqYd| . 2) (char<? . 2))
  ()
  (char<?)
  (#%define char-alphabetic?
    (#%lambda #t
      (|c_XiAjLCqYd|)
      ()
      (#%if (char<? #\@ |c_XiAjLCqYd| #\[)
        #t
        (char<? #\` |c_XiAjLCqYd| #\{)))))
(#%program
  ((|c_XiWfJ3rYd| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-numeric?
    (#%lambda #t
      (|c_XiWfJ3rYd|)
      ()
      (char<? #\/ |c_XiWfJ3rYd| #\:))))
(#%program
  ((|c_XigcHwrYd| . 4) (char=? . 4))
  ()
  (char=?)
  (#%define char-whitespace?
    (#%lambda #t
      (|c_XigcHwrYd|)
      ()
      (#%if (char=? |c_XigcHwrYd| #\space)
        #t
        (#%if (char=? |c_XigcHwrYd| #\tab)
          #t
          (#%if (char=? |c_XigcHwrYd| #\newline)
            #t
            (char=? |c_XigcHwrYd| #\return)))))))
(#%program
  ((|c_XiC8FZrYd| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-upper-case?
    (#%lambda #t
      (|c_XiC8FZrYd|)
      ()
      (char<? #\@ |c_XiC8FZrYd| #\[))))
(#%program
  ((|c_XiY4DqsYd| . 1) (char<? . 1))
  ()
  (char<?)
  (#%define char-lower-case?
    (#%lambda #t
      (|c_XiY4DqsYd|)
      ()
      (char<? #\` |c_XiY4DqsYd| #\{))))
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
   (|newstr_XiGOsHuYd| . 1)
   (|str_XikSueuYd| . 3)
   (string-upcase . 1)
   (make-string . 2)
   (string-length . 4)
   (char-downcase . 1)
   (|newstr_Xi-VwNtYd| . 1)
   (|str_XiEZyktYd| . 3)
   (string-downcase . 1)
   (+ . 1)
   (|string-map_Xii1BTsYd| . 3)
   (|strsrc_Xi0Lq8vYd| . 2)
   (string-ref . 1)
   (|proc_XiIDm2wYd| . 2)
   (|strdst_XimHoBvYd| . 3)
   (string-set! . 1)
   (|l_XiowiYwYd| . 2)
   (|n_Xi2AkvwYd| . 4)
   (< . 1))
  ((string-upcase . 1)
   (string-downcase . 1)
   (|string-map_Xii1BTsYd| . 1))
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
    ((|string-map_Xii1BTsYd|
       (#%lambda #t
         (|strsrc_Xi0Lq8vYd|
           |strdst_XimHoBvYd|
           |proc_XiIDm2wYd|
           |n_Xi2AkvwYd|
           |l_XiowiYwYd|)
         (|string-map_Xii1BTsYd|)
         (#%if (< |n_Xi2AkvwYd| |l_XiowiYwYd|)
           (#%begin
             (string-set!
               |strdst_XimHoBvYd|
               |n_Xi2AkvwYd|
               (|proc_XiIDm2wYd|
                 (string-ref |strsrc_Xi0Lq8vYd| |n_Xi2AkvwYd|)))
             (|string-map_Xii1BTsYd|
               |strsrc_Xi0Lq8vYd|
               |strdst_XimHoBvYd|
               |proc_XiIDm2wYd|
               (+ |n_Xi2AkvwYd| 1)
               |l_XiowiYwYd|))
           |strdst_XimHoBvYd|))))
    ()
    (#%begin
      (#%set! string-downcase
        (#%lambda #t
          (|str_XiEZyktYd|)
          (|string-map_Xii1BTsYd|)
          ((#%lambda #t
             (|newstr_Xi-VwNtYd|)
             (|str_XiEZyktYd| |string-map_Xii1BTsYd|)
             (|string-map_Xii1BTsYd|
               |str_XiEZyktYd|
               |newstr_Xi-VwNtYd|
               char-downcase
               0
               (string-length |str_XiEZyktYd|)))
           (make-string (string-length |str_XiEZyktYd|)))))
      (#%set! string-upcase
        (#%lambda #t
          (|str_XikSueuYd|)
          (|string-map_Xii1BTsYd|)
          ((#%lambda #t
             (|newstr_XiGOsHuYd|)
             (|str_XikSueuYd| |string-map_Xii1BTsYd|)
             (|string-map_Xii1BTsYd|
               |str_XikSueuYd|
               |newstr_XiGOsHuYd|
               char-upcase
               0
               (string-length |str_XikSueuYd|)))
           (make-string (string-length |str_XikSueuYd|))))))))
(#%program
  ((equal? . 1))
  ()
  ()
  (#%define string=? equal?))
(#%program
  ((|s2_XiqlcjyYd| . 1)
   (|s1_Xi4peSxYd| . 1)
   (string->list . 2)
   (car . 2)
   (cdr . 2)
   (|s<?_XiKsgpxYd| . 2)
   (char>? . 1)
   (|c2_XiO647AYd| . 2)
   (|c1_Xisa6GzYd| . 2)
   (char<? . 1)
   (|s2_Xi6e8dzYd| . 4)
   (not . 1)
   (|s1_XiMhaMyYd| . 3)
   (null? . 3))
  ((|s<?_XiKsgpxYd| . 1))
  (string->list car char<? cdr char>? not null?)
  (#%define string<?
    (#%letrec #t
      ((|s<?_XiKsgpxYd|
         (#%lambda #t
           (|s1_XiMhaMyYd| |s2_Xi6e8dzYd|)
           (|s<?_XiKsgpxYd|)
           (#%if (null? |s1_XiMhaMyYd|)
             (not (null? |s2_Xi6e8dzYd|))
             (#%if (null? |s2_Xi6e8dzYd|)
               #f
               ((#%lambda #t
                  (|c1_Xisa6GzYd| |c2_XiO647AYd|)
                  (|s2_Xi6e8dzYd| |s1_XiMhaMyYd| |s<?_XiKsgpxYd|)
                  (#%if (char<? |c1_Xisa6GzYd| |c2_XiO647AYd|)
                    #t
                    (#%if (char>? |c1_Xisa6GzYd| |c2_XiO647AYd|)
                      #f
                      (|s<?_XiKsgpxYd|
                        (cdr |s1_XiMhaMyYd|)
                        (cdr |s2_Xi6e8dzYd|)))))
                (car |s1_XiMhaMyYd|)
                (car |s2_Xi6e8dzYd|)))))))
      ()
      (#%lambda #t
        (|s1_Xi4peSxYd| |s2_XiqlcjyYd|)
        (|s<?_XiKsgpxYd|)
        (|s<?_XiKsgpxYd|
          (string->list |s1_Xi4peSxYd|)
          (string->list |s2_XiqlcjyYd|))))))
(#%program
  ((|s2_XiQXZtBYd| . 1)
   (|s1_Xiu__0BYd| . 1)
   (string->list . 2)
   (car . 2)
   (cdr . 2)
   (|s>?_Xi832AAYd| . 2)
   (char<? . 1)
   (|c2_XicJRhDYd| . 2)
   (|c1_XiSMTQCYd| . 2)
   (char>? . 1)
   (|s1_XiaUXWBYd| . 4)
   (not . 1)
   (|s2_XiwQVnCYd| . 3)
   (null? . 3))
  ((|s>?_Xi832AAYd| . 1))
  (string->list car char>? cdr char<? not null?)
  (#%define string>?
    (#%letrec #t
      ((|s>?_Xi832AAYd|
         (#%lambda #t
           (|s1_XiaUXWBYd| |s2_XiwQVnCYd|)
           (|s>?_Xi832AAYd|)
           (#%if (null? |s2_XiwQVnCYd|)
             (not (null? |s1_XiaUXWBYd|))
             (#%if (null? |s1_XiaUXWBYd|)
               #f
               ((#%lambda #t
                  (|c1_XiSMTQCYd| |c2_XicJRhDYd|)
                  (|s2_XiwQVnCYd| |s1_XiaUXWBYd| |s>?_Xi832AAYd|)
                  (#%if (char>? |c1_XiSMTQCYd| |c2_XicJRhDYd|)
                    #t
                    (#%if (char<? |c1_XiSMTQCYd| |c2_XicJRhDYd|)
                      #f
                      (|s>?_Xi832AAYd|
                        (cdr |s1_XiaUXWBYd|)
                        (cdr |s2_XiwQVnCYd|)))))
                (car |s1_XiaUXWBYd|)
                (car |s2_XiwQVnCYd|)))))))
      ()
      (#%lambda #t
        (|s1_Xiu__0BYd| |s2_XiQXZtBYd|)
        (|s>?_Xi832AAYd|)
        (|s>?_Xi832AAYd|
          (string->list |s1_Xiu__0BYd|)
          (string->list |s2_XiQXZtBYd|))))))
(#%program
  ((string=? . 1)
   (|s2_XiUBNbEYd| . 2)
   (|s1_XiyFPKDYd| . 2)
   (string<? . 1))
  ()
  (string=? string<?)
  (#%define string<=?
    (#%lambda #t
      (|s1_XiyFPKDYd| |s2_XiUBNbEYd|)
      ()
      (#%if (string<? |s1_XiyFPKDYd| |s2_XiUBNbEYd|)
        #t
        (string=? |s1_XiyFPKDYd| |s2_XiUBNbEYd|)))))
(#%program
  ((string=? . 1)
   (|s2_XiAuJ5FYd| . 2)
   (|s1_XieyLEEYd| . 2)
   (string>? . 1))
  ()
  (string=? string>?)
  (#%define string>=?
    (#%lambda #t
      (|s1_XieyLEEYd| |s2_XiAuJ5FYd|)
      ()
      (#%if (string>? |s1_XieyLEEYd| |s2_XiAuJ5FYd|)
        #t
        (string=? |s1_XieyLEEYd| |s2_XiAuJ5FYd|)))))
(#%program
  ((|s2_XignF_FYd| . 1)
   (|s1_XiWqHyFYd| . 1)
   (string-downcase . 2)
   (string=? . 1))
  ()
  (string-downcase string=?)
  (#%define string-ci=?
    (#%lambda #t
      (|s1_XiWqHyFYd| |s2_XignF_FYd|)
      ()
      (string=?
        (string-downcase |s1_XiWqHyFYd|)
        (string-downcase |s2_XignF_FYd|)))))
(#%program
  ((|s2_XiYfBVGYd| . 1)
   (|s1_XiCjDsGYd| . 1)
   (string-downcase . 2)
   (string<? . 1))
  ()
  (string-downcase string<?)
  (#%define string-ci<?
    (#%lambda #t
      (|s1_XiCjDsGYd| |s2_XiYfBVGYd|)
      ()
      (string<?
        (string-downcase |s1_XiCjDsGYd|)
        (string-downcase |s2_XiYfBVGYd|)))))
(#%program
  ((|s2_XiE8xPHYd| . 1)
   (|s1_XiiczmHYd| . 1)
   (string-downcase . 2)
   (string>? . 1))
  ()
  (string-downcase string>?)
  (#%define string-ci>?
    (#%lambda #t
      (|s1_XiiczmHYd| |s2_XiE8xPHYd|)
      ()
      (string>?
        (string-downcase |s1_XiiczmHYd|)
        (string-downcase |s2_XiE8xPHYd|)))))
(#%program
  ((|s2_Xik1tJIYd| . 1)
   (|s1_Xi-4vgIYd| . 1)
   (string-downcase . 2)
   (string>=? . 1))
  ()
  (string-downcase string>=?)
  (#%define string-ci>=?
    (#%lambda #t
      (|s1_Xi-4vgIYd| |s2_Xik1tJIYd|)
      ()
      (string>=?
        (string-downcase |s1_Xi-4vgIYd|)
        (string-downcase |s2_Xik1tJIYd|)))))
(#%program
  ((|s2_Xi0WoDJYd| . 1)
   (|s1_XiGZqaJYd| . 1)
   (string-downcase . 2)
   (string<=? . 1))
  ()
  (string-downcase string<=?)
  (#%define string-ci<=?
    (#%lambda #t
      (|s1_XiGZqaJYd| |s2_Xi0WoDJYd|)
      ()
      (string<=?
        (string-downcase |s1_XiGZqaJYd|)
        (string-downcase |s2_Xi0WoDJYd|)))))
(#%program
  ((- . 1)
   (make-string . 1)
   (|end_XioHgrLYd| . 2)
   (|start_Xi2Li-KYd| . 2)
   (|newstr_XiKDeULYd| . 2)
   (|str_XiIOkxKYd| . 1)
   (+ . 2)
   (|fill-string_XimSm4KYd| . 2)
   (|sstr_Xi4AclMYd| . 2)
   (string-ref . 1)
   (|n_XiMs8fNYd| . 2)
   (|dstr_XiqwaOMYd| . 2)
   (string-set! . 1)
   (|e_Xisl49OYd| . 2)
   (|s_Xi6p6INYd| . 3)
   (< . 1))
  ((|fill-string_XimSm4KYd| . 1))
  (make-string - string-ref string-set! + <)
  (#%define substring
    (#%letrec #t
      ((|fill-string_XimSm4KYd|
         (#%lambda #t
           (|sstr_Xi4AclMYd|
             |dstr_XiqwaOMYd|
             |n_XiMs8fNYd|
             |s_Xi6p6INYd|
             |e_Xisl49OYd|)
           (|fill-string_XimSm4KYd|)
           (#%if (< |s_Xi6p6INYd| |e_Xisl49OYd|)
             (#%begin
               (string-set!
                 |dstr_XiqwaOMYd|
                 |n_XiMs8fNYd|
                 (string-ref |sstr_Xi4AclMYd| |s_Xi6p6INYd|))
               (|fill-string_XimSm4KYd|
                 |sstr_Xi4AclMYd|
                 |dstr_XiqwaOMYd|
                 (+ |n_XiMs8fNYd| 1)
                 (+ |s_Xi6p6INYd| 1)
                 |e_Xisl49OYd|))
             #!void))))
      ()
      (#%lambda #t
        (|str_XiIOkxKYd|
          |start_Xi2Li-KYd|
          |end_XioHgrLYd|)
        (|fill-string_XimSm4KYd|)
        ((#%lambda #t
           (|newstr_XiKDeULYd|)
           (|end_XioHgrLYd|
             |start_Xi2Li-KYd|
             |str_XiIOkxKYd|
             |fill-string_XimSm4KYd|)
           (#%begin
             (|fill-string_XimSm4KYd|
               |str_XiIOkxKYd|
               |newstr_XiKDeULYd|
               0
               |start_Xi2Li-KYd|
               |end_XioHgrLYd|)
             |newstr_XiKDeULYd|))
         (make-string
           (- |end_XioHgrLYd| |start_Xi2Li-KYd|)))))))
(#%program
  ((- . 1)
   (cdr . 1)
   (list-ref . 1)
   (|list_XiOh2COYd| . 2)
   (car . 1)
   (|n_Xi8e03PYd| . 2)
   (zero? . 1))
  ()
  (list-ref cdr - car zero?)
  (#%define list-ref
    (#%lambda #t
      (|list_XiOh2COYd| |n_Xi8e03PYd|)
      ()
      (#%if (zero? |n_Xi8e03PYd|)
        (car |list_XiOh2COYd|)
        (list-ref
          (cdr |list_XiOh2COYd|)
          (- |n_Xi8e03PYd| 1))))))
(#%program
  ((|args_Xiua-vPYd| . 1)
   (|k_XiQ6YYPYd| . 1)
   (apply . 1)
   (call-with-current-continuation . 1))
  ()
  (apply call-with-current-continuation)
  (#%define values
    (#%lambda #t
      |args_Xiua-vPYd|
      ()
      (call-with-current-continuation
        (#%lambda #t
          (|k_XiQ6YYPYd|)
          (|args_Xiua-vPYd|)
          (apply |k_XiQ6YYPYd| |args_Xiua-vPYd|))))))
