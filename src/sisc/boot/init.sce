#!void
(#%define for-each
  (#%lambda (|proc__BXHzfx1m|
             |ls1__BBLBOw1m|
             .
             |lists__BfPDlw1m|)
    (#%if (null? |ls1__BBLBOw1m|)
      #!void
      (#%begin
        (#%set! |lists__BfPDlw1m|
          (cons |ls1__BBLBOw1m| |lists__BfPDlw1m|))
        (apply |proc__BXHzfx1m|
               (map-car |lists__BfPDlw1m|))
        (apply for-each
               |proc__BXHzfx1m|
               (map-cdr |lists__BfPDlw1m|))))))
(#%define eof-object?
  (#%lambda (|x__BhExIx1m|)
    (eq? |x__BhExIx1m| #!eof)))
(#%define not
  (#%lambda (|x__BDAv9y1m|)
    (#%if |x__BDAv9y1m| #f #t)))
(#%define newline
  (#%lambda |port__BZwtCy1m|
    (apply display #\newline |port__BZwtCy1m|)))
(#%define reverse
  (#%letrec ((|iter__Bjtr3z1m|
               (#%lambda (|ls__B_lnZz1m| |acc__BlilqA1m|)
                 (#%if (null? |ls__B_lnZz1m|)
                   |acc__BlilqA1m|
                   (|iter__Bjtr3z1m|
                     (cdr |ls__B_lnZz1m|)
                     (cons (car |ls__B_lnZz1m|) |acc__BlilqA1m|))))))
    (#%lambda (|ls__BFppwz1m|)
      (|iter__Bjtr3z1m| |ls__BFppwz1m| ()))))
(#%define reverse!
  (#%letrec ((|iter__BHejTA1m|
               (#%lambda (|s__Bn7fNB1m| |r__BJ3deC1m|)
                 (#%if (null? |s__Bn7fNB1m|)
                   |r__BJ3deC1m|
                   ((#%lambda (|d__B30bHC1m|)
                      (#%begin
                        (set-cdr! |s__Bn7fNB1m| |r__BJ3deC1m|)
                        (|iter__BHejTA1m| |d__B30bHC1m| |s__Bn7fNB1m|)))
                    (cdr |s__Bn7fNB1m|))))))
    (#%lambda (|s__B1bhkB1m|)
      (|iter__BHejTA1m| |s__B1bhkB1m| ()))))
(#%define map-car
  (#%lambda (|ls__BpY88D1m|)
    (#%if (null? |ls__BpY88D1m|)
      ()
      (cons (caar |ls__BpY88D1m|)
            (map-car (cdr |ls__BpY88D1m|))))))
(#%define map-cdr
  (#%lambda (|ls__BLU6BD1m|)
    (#%if (null? |ls__BLU6BD1m|)
      ()
      (cons (cdar |ls__BLU6BD1m|)
            (map-cdr (cdr |ls__BLU6BD1m|))))))
(#%define map
  (#%letrec ((|map1__B5R42E1m|
               (#%lambda (|proc__BPyWiG1m|
                          |list__B9vULG1m|
                          |acc__BvrScH1m|)
                 (#%if (null? |list__B9vULG1m|)
                   (reverse |acc__BvrScH1m|)
                   (|map1__B5R42E1m|
                     |proc__BPyWiG1m|
                     (cdr |list__B9vULG1m|)
                     (cons (|proc__BPyWiG1m| (car |list__B9vULG1m|))
                           |acc__BvrScH1m|)))))
             (|loop__BrN2vE1m|
               (#%lambda (|proc__BRnQFH1m|
                          |list1__BbkO6I1m|
                          |lists__BxgMzI1m|
                          |c__BTcK0J1m|)
                 (#%if (null? |list1__BbkO6I1m|)
                   (reverse |c__BTcK0J1m|)
                   (|loop__BrN2vE1m|
                     |proc__BRnQFH1m|
                     (cdr |list1__BbkO6I1m|)
                     (map-cdr |lists__BxgMzI1m|)
                     (cons (apply |proc__BRnQFH1m|
                                  (car |list1__BbkO6I1m|)
                                  (map-car |lists__BxgMzI1m|))
                           |c__BTcK0J1m|))))))
    (#%lambda (|proc__BtCYRF1m|
               |list1__B7G-oF1m|
               .
               |lists__BNJ0YE1m|)
      (#%if (null? |lists__BNJ0YE1m|)
        (|map1__B5R42E1m|
          |proc__BtCYRF1m|
          |list1__B7G-oF1m|
          ())
        (|loop__BrN2vE1m|
          |proc__BtCYRF1m|
          |list1__B7G-oF1m|
          |lists__BNJ0YE1m|
          ())))))
(#%define compose2
  (#%lambda (|f__Bd9ItJ1m| |g__Bz5GWJ1m|)
    (#%lambda (|x__BV1EnK1m|)
      (|f__Bd9ItJ1m| (|g__Bz5GWJ1m| |x__BV1EnK1m|)))))
(#%define assq (void))
(#%define assv (void))
(#%define assoc (void))
(#%define memq (void))
(#%define memv (void))
(#%define member (void))
(#%letrec ((|assn__Bf-BQK1m|
             (#%lambda (|n__B3b9aR1m| |obj__Bp77DR1m| |alist__BL354S1m|)
               (#%if (null? |alist__BL354S1m|)
                 #f
                 (#%if (|n__B3b9aR1m|
                         (caar |alist__BL354S1m|)
                         |obj__Bp77DR1m|)
                   (car |alist__BL354S1m|)
                   (|assn__Bf-BQK1m|
                     |n__B3b9aR1m|
                     |obj__Bp77DR1m|
                     (cdr |alist__BL354S1m|))))))
           (|memn__BBWzhL1m|
             (#%lambda (|n__B503xS1m| |obj__BrY0-S1m| |list__BNU-qT1m|)
               (#%if (null? |list__BNU-qT1m|)
                 #f
                 (#%if (|n__B503xS1m|
                         (car |list__BNU-qT1m|)
                         |obj__BrY0-S1m|)
                   |list__BNU-qT1m|
                   (|memn__BBWzhL1m|
                     |n__B503xS1m|
                     |obj__BrY0-S1m|
                     (cdr |list__BNU-qT1m|)))))))
  (#%begin
    (#%set! assq
      (#%lambda (|obj__BXSxKL1m| |alist__BhPvbM1m|)
        (|assn__Bf-BQK1m|
          eq?
          |obj__BXSxKL1m|
          |alist__BhPvbM1m|)))
    (#%set! assv
      (#%lambda (|obj__BDLtEM1m| |alist__BZHr5N1m|)
        (|assn__Bf-BQK1m|
          eqv?
          |obj__BDLtEM1m|
          |alist__BZHr5N1m|)))
    (#%set! assoc
      (#%lambda (|obj__BjEpyN1m| |alist__BFAn_N1m|)
        (|assn__Bf-BQK1m|
          equal?
          |obj__BjEpyN1m|
          |alist__BFAn_N1m|)))
    (#%set! memq
      (#%lambda (|obj__B_wlsO1m| |list__BltjVO1m|)
        (|memn__BBWzhL1m|
          eq?
          |obj__B_wlsO1m|
          |list__BltjVO1m|)))
    (#%set! memv
      (#%lambda (|obj__BHphmP1m| |list__B1mfPP1m|)
        (|memn__BBWzhL1m|
          eqv?
          |obj__BHphmP1m|
          |list__B1mfPP1m|)))
    (#%set! member
      (#%lambda (|obj__BnidgQ1m| |list__BJebJQ1m|)
        (|memn__BBWzhL1m|
          equal?
          |obj__BnidgQ1m|
          |list__BJebJQ1m|)))))
(#%define cadr (compose2 car cdr))
(#%define cdar (compose2 cdr car))
(#%define cddr (compose2 cdr cdr))
(#%define caar (compose2 car car))
(#%define caaar (compose2 car caar))
(#%define caadr (compose2 car cadr))
(#%define cadar (compose2 car cdar))
(#%define caddr (compose2 car cddr))
(#%define cdaar (compose2 cdr caar))
(#%define cdadr (compose2 cdr cadr))
(#%define cddar (compose2 cdr cdar))
(#%define cdddr (compose2 cdr cddr))
(#%define caaaar (compose2 car caaar))
(#%define caaadr (compose2 car caadr))
(#%define caadar (compose2 car cadar))
(#%define caaddr (compose2 car caddr))
(#%define cadaar (compose2 car cdaar))
(#%define cadadr (compose2 car cdadr))
(#%define caddar (compose2 car cddar))
(#%define cadddr (compose2 car cdddr))
(#%define cdaaar (compose2 cdr caaar))
(#%define cdaadr (compose2 cdr caadr))
(#%define cdadar (compose2 cdr cadar))
(#%define cdaddr (compose2 cdr caddr))
(#%define cddaar (compose2 cdr cdaar))
(#%define cddadr (compose2 cdr cdadr))
(#%define cdddar (compose2 cdr cddar))
(#%define cddddr (compose2 cdr cdddr))
(#%define append2
  (#%lambda (|ls1__B7RYTT1m| |ls2__BtNWkU1m|)
    (#%if (null? |ls1__B7RYTT1m|)
      |ls2__BtNWkU1m|
      (cons (car |ls1__B7RYTT1m|)
            (append2 (cdr |ls1__B7RYTT1m|) |ls2__BtNWkU1m|)))))
(#%define append append2)
(#%define list->string
  (#%letrec ((|l2s__BPJUNU1m|
               (#%lambda (|l__BvCQHV1m| |s__BRyO8W1m| |n__BbvMBW1m|)
                 (#%if (null? |l__BvCQHV1m|)
                   |s__BRyO8W1m|
                   (#%begin
                     (string-set!
                       |s__BRyO8W1m|
                       |n__BbvMBW1m|
                       (car |l__BvCQHV1m|))
                     (|l2s__BPJUNU1m|
                       (cdr |l__BvCQHV1m|)
                       |s__BRyO8W1m|
                       (+ |n__BbvMBW1m| 1)))))))
    (#%lambda (|l__B9GSeV1m|)
      (|l2s__BPJUNU1m|
        |l__B9GSeV1m|
        (make-string (length |l__B9GSeV1m|))
        0))))
(#%define string->list
  (#%letrec ((|s2l__BxrK2X1m|
               (#%lambda (|s__BdkGYX1m| |h__BzgEpY1m| |n__BVcCSY1m|)
                 (#%if (< |n__BVcCSY1m| 0)
                   |h__BzgEpY1m|
                   (|s2l__BxrK2X1m|
                     |s__BdkGYX1m|
                     (cons (string-ref |s__BdkGYX1m| |n__BVcCSY1m|)
                           |h__BzgEpY1m|)
                     (- |n__BVcCSY1m| 1))))))
    (#%lambda (|s__BTnIvX1m|)
      (|s2l__BxrK2X1m|
        |s__BTnIvX1m|
        ()
        (- (string-length |s__BTnIvX1m|) 1)))))
(#%define list->vector
  (#%letrec ((|l2v__Bf9AjZ1m|
               (#%lambda (|l__BX1wd-1m| |v__Bh-tG-1m| |n__BDWr7_1m|)
                 (#%if (null? |l__BX1wd-1m|)
                   |v__Bh-tG-1m|
                   (#%begin
                     (vector-set!
                       |v__Bh-tG-1m|
                       |n__BDWr7_1m|
                       (car |l__BX1wd-1m|))
                     (|l2v__Bf9AjZ1m|
                       (cdr |l__BX1wd-1m|)
                       |v__Bh-tG-1m|
                       (+ |n__BDWr7_1m| 1)))))))
    (#%lambda (|l__BB5yMZ1m|)
      (#%if (proper-list? |l__BB5yMZ1m|)
        (|l2v__Bf9AjZ1m|
          |l__BB5yMZ1m|
          (make-vector (length |l__BB5yMZ1m|))
          0)
        (error (#%quote list->vector)
               "can only convert a proper list."
               |l__BB5yMZ1m|)))))
(#%define vector
  (#%lambda |elems__BZSpA_1m|
    (list->vector |elems__BZSpA_1m|)))
(#%define string
  (#%lambda |elems__BjPn102m|
    (list->string |elems__BjPn102m|)))
(#%define current-url (_make-parameter "file:."))
(#%define current-directory
  (#%lambda |rest__BFLlu02m|
    (#%if (null? |rest__BFLlu02m|)
      (normalize-url (current-url) ".")
      (current-url
        (normalize-url
          (current-url)
          ((#%lambda (|v__B_HjX02m|)
             ((#%lambda (|l__BlEho12m|)
                (#%if (eqv? (string-ref |v__B_HjX02m| (- |l__BlEho12m| 1))
                            #\/)
                  |v__B_HjX02m|
                  (string-append |v__B_HjX02m| "/")))
              (string-length |v__B_HjX02m|)))
           (car |rest__BFLlu02m|)))))))
(#%define file-handler (void))
(#%define add-file-handler (void))
((#%lambda (|*file-handlers*__BHAfR12m|)
   (#%begin
     (#%set! add-file-handler
       (#%lambda (|extension__B1xdi22m| |thunk__BntbL22m|)
         (#%if (assq |extension__B1xdi22m|
                     |*file-handlers*__BHAfR12m|)
           #!void
           (#%set! |*file-handlers*__BHAfR12m|
             (cons (cons |extension__B1xdi22m| |thunk__BntbL22m|)
                   |*file-handlers*__BHAfR12m|)))))
     (#%set! file-handler
       ((#%lambda (|_load__BJp9c32m|)
          (#%lambda (|extension__B3m7F32m|)
            ((#%lambda (|t__Bpi5642m|)
               (#%if |t__Bpi5642m|
                 (cdr |t__Bpi5642m|)
                 |_load__BJp9c32m|))
             (assq (string->symbol
                     (string-downcase |extension__B3m7F32m|))
                   |*file-handlers*__BHAfR12m|))))
        load))))
 ())
(#%define make-io-proc
  (#%lambda (|proc__BLe3z42m|)
    (#%lambda (|file__Br7_s52m| . |rest__B5b1052m|)
      (apply |proc__BLe3z42m|
             (normalize-url (current-url) |file__Br7_s52m|)
             |rest__B5b1052m|))))
((#%lambda (|file-extension__BN3ZV52m|)
   (#%begin
     (#%set! open-input-file
       (make-io-proc open-input-file))
     (#%set! open-source-input-file
       (make-io-proc open-source-input-file))
     (#%set! open-output-file
       (make-io-proc open-output-file))
     (#%set! load
       (#%lambda (|file__B70Xm62m|)
         (#%begin
           ((#%lambda (|previous-url__BtYUP62m|)
              (#%begin
                (current-url
                  (normalize-url
                    |previous-url__BtYUP62m|
                    |file__B70Xm62m|))
                (with-failure-continuation
                  (#%lambda (|m__BPUSg72m| |e__B9RQJ72m|)
                    (#%begin
                      (current-url |previous-url__BtYUP62m|)
                      (call-with-failure-continuation
                        (#%lambda (|fk__BvNOa82m|)
                          (|fk__BvNOa82m| |m__BPUSg72m| |e__B9RQJ72m|)))))
                  (#%lambda ()
                    ((#%lambda (|fe__BRJMD82m|)
                       ((file-handler
                          (#%if |fe__BRJMD82m| |fe__BRJMD82m| "scm"))
                        (current-url)))
                     (|file-extension__BN3ZV52m| (current-url)))))
                (current-url |previous-url__BtYUP62m|)))
            (current-url))
           (void))))))
 (#%lambda (|url__BbGK492m|)
   ((#%letrec ((|loop__BxCIx92m|
                 (#%lambda (|x__BTyG-92m| |acc__BdvEra2m|)
                   (#%if (null? |x__BTyG-92m|)
                     #f
                     (#%if (equal? (car |x__BTyG-92m|) #\.)
                       (list->string |acc__BdvEra2m|)
                       (|loop__BxCIx92m|
                         (cdr |x__BTyG-92m|)
                         (cons (car |x__BTyG-92m|) |acc__BdvEra2m|)))))))
      |loop__BxCIx92m|)
    (reverse! (string->list |url__BbGK492m|))
    ())))
(#%define load-module
  (#%lambda (|str__BzrCUa2m|)
    ((#%lambda (|nl__BVnAlb2m|)
       ((#%lambda (|binding-names__BfkyOb2m|)
          (for-each
            (#%lambda (|name__BBgwfc2m|)
              (putprop
                |name__BBgwfc2m|
                (native-library-binding
                  |nl__BVnAlb2m|
                  |name__BBgwfc2m|)))
            |binding-names__BfkyOb2m|))
        (native-library-binding-names |nl__BVnAlb2m|)))
     (load-native-library |str__BzrCUa2m|))))
(#%define append
  (#%letrec ((|real-append__BXcuIc2m|
               (#%lambda (|ls1__BZ1o3e2m| . |lses__BD5qCd2m|)
                 (#%if (null? |lses__BD5qCd2m|)
                   |ls1__BZ1o3e2m|
                   (#%if (null? |ls1__BZ1o3e2m|)
                     (apply |real-append__BXcuIc2m| |lses__BD5qCd2m|)
                     (apply |real-append__BXcuIc2m|
                            (append2 |ls1__BZ1o3e2m| (car |lses__BD5qCd2m|))
                            (cdr |lses__BD5qCd2m|)))))))
    (#%lambda |lses__Bh9s9d2m|
      (#%if (null? |lses__Bh9s9d2m|)
        ()
        (#%if (null? (cdr |lses__Bh9s9d2m|))
          (car |lses__Bh9s9d2m|)
          (apply |real-append__BXcuIc2m|
                 (car |lses__Bh9s9d2m|)
                 (cdr |lses__Bh9s9d2m|)))))))
(#%define proper-list?
  (#%lambda (|x__Bj-lwe2m|)
    ((#%letrec ((|lp__BFWjZe2m|
                  (#%lambda (|x__B_Shqf2m| |lag__BlPfTf2m|)
                    (#%if (pair? |x__B_Shqf2m|)
                      ((#%lambda (|x__BHLdkg2m|)
                         (#%if (pair? |x__BHLdkg2m|)
                           ((#%lambda (|x__B1IbNg2m| |lag__BnE9eh2m|)
                              (#%if (eq? |x__B1IbNg2m| |lag__BnE9eh2m|)
                                #f
                                (|lp__BFWjZe2m|
                                  |x__B1IbNg2m|
                                  |lag__BnE9eh2m|)))
                            (cdr |x__BHLdkg2m|)
                            (cdr |lag__BlPfTf2m|))
                           (null? |x__BHLdkg2m|)))
                       (cdr |x__B_Shqf2m|))
                      (null? |x__B_Shqf2m|)))))
       |lp__BFWjZe2m|)
     |x__Bj-lwe2m|
     |x__Bj-lwe2m|)))
(#%define list? proper-list?)
(#%define expt
  (#%letrec ((|general-expt__BJA7Hh2m|
               (#%lambda (|base__BriZXj2m| |exponent__BNeXok2m|)
                 (exp (* |exponent__BNeXok2m| (log |base__BriZXj2m|)))))
             (|rational-expt__B3x58i2m|
               (#%lambda (|base-numerator__B7bVRk2m|
                          |base-denominator__Bt7Til2m|
                          |exponent__BP3RLl2m|)
                 (/ (expt |base-numerator__B7bVRk2m|
                          |exponent__BP3RLl2m|)
                    (expt |base-denominator__Bt7Til2m|
                          |exponent__BP3RLl2m|))))
             (|integer-expt__Bpt3Bi2m|
               (#%lambda (|base__B90Pcm2m| |exponent__BvYMFm2m|)
                 (#%if (negative? |exponent__BvYMFm2m|)
                   (/ (|integer-expt__Bpt3Bi2m|
                        |base__B90Pcm2m|
                        (abs |exponent__BvYMFm2m|)))
                   (#%if (#%if (exact? |base__B90Pcm2m|)
                           (= |base__B90Pcm2m| 2)
                           #f)
                     (ashl 1 |exponent__BvYMFm2m|)
                     ((#%letrec ((|loop__BRUK6n2m|
                                   (#%lambda (|rest__BbRIzn2m|
                                              |result__BxNG0o2m|
                                              |squaring__BTJEto2m|)
                                     (#%if (zero? |rest__BbRIzn2m|)
                                       |result__BxNG0o2m|
                                       (|loop__BRUK6n2m|
                                         (quotient |rest__BbRIzn2m| 2)
                                         (#%if (odd? |rest__BbRIzn2m|)
                                           (* |result__BxNG0o2m|
                                              |squaring__BTJEto2m|)
                                           |result__BxNG0o2m|)
                                         (* |squaring__BTJEto2m|
                                            |squaring__BTJEto2m|))))))
                        |loop__BRUK6n2m|)
                      |exponent__BvYMFm2m|
                      1
                      |base__B90Pcm2m|))))))
    (#%lambda (|base__BLp12j2m| |exponent__B5m_uj2m|)
      (#%if (zero? |exponent__B5m_uj2m|)
        (#%if (exact? |exponent__B5m_uj2m|) 1 1.0)
        (#%if (zero? |base__BLp12j2m|)
          (#%if (exact? |exponent__B5m_uj2m|)
            |base__BLp12j2m|
            0.0)
          (#%if (#%if (exact? |base__BLp12j2m|)
                  (#%if (rational? |base__BLp12j2m|)
                    (#%if (integer? |base__BLp12j2m|) #f #t)
                    #f)
                  #f)
            (|rational-expt__B3x58i2m|
              (numerator |base__BLp12j2m|)
              (denominator |base__BLp12j2m|)
              |exponent__B5m_uj2m|)
            (#%if (#%if (exact? |exponent__B5m_uj2m|)
                    (integer? |exponent__B5m_uj2m|)
                    #f)
              (|integer-expt__Bpt3Bi2m|
                |base__BLp12j2m|
                |exponent__B5m_uj2m|)
              (|general-expt__BJA7Hh2m|
                |base__BLp12j2m|
                |exponent__B5m_uj2m|))))))))
(#%define modpow
  (#%lambda (|x__BdGCWo2m| |y__BzCAnp2m| |n__BVyyQp2m|)
    (#%if (= |y__BzCAnp2m| 1)
      (modulo |x__BdGCWo2m| |n__BVyyQp2m|)
      (#%if (even? |y__BzCAnp2m|)
        ((#%lambda (|tmp__BXnsbr2m|)
           (modulo
             (* |tmp__BXnsbr2m| |tmp__BXnsbr2m|)
             |n__BVyyQp2m|))
         (modpow
           |x__BdGCWo2m|
           (/ |y__BzCAnp2m| 2)
           |n__BVyyQp2m|))
        ((#%lambda (|tmp__BBruKq2m|)
           (#%begin
             (#%set! |tmp__BBruKq2m|
               (modulo
                 (* |tmp__BBruKq2m| |tmp__BBruKq2m|)
                 |n__BVyyQp2m|))
             (modulo
               (* |x__BdGCWo2m| |tmp__BBruKq2m|)
               |n__BVyyQp2m|)))
         (modpow
           |x__BdGCWo2m|
           (/ (- |y__BzCAnp2m| 1) 2)
           |n__BVyyQp2m|))))))
(#%define integer?
  ((#%lambda (|oldint?__BhkqEr2m|)
     (#%lambda (|n__BDgo5s2m|)
       (#%if (|oldint?__BhkqEr2m| |n__BDgo5s2m|)
         #t
         (#%if (real? |n__BDgo5s2m|)
           (= (round |n__BDgo5s2m|) |n__BDgo5s2m|)
           #f))))
   integer?))
(#%define real?
  ((#%lambda (|oldcomp?__BZcmys2m|)
     (#%lambda (|n__Bj9k_s2m|)
       (#%if (number? |n__Bj9k_s2m|)
         (#%if (|oldcomp?__BZcmys2m| |n__Bj9k_s2m|) #f #t)
         #f)))
   complex?))
(#%define rational? real?)
(#%define complex? number?)
(#%define abs
  (#%lambda (|num__BF5ist2m|)
    (#%if (real? |num__BF5ist2m|)
      (#%if (< |num__BF5ist2m| 0)
        (- |num__BF5ist2m|)
        |num__BF5ist2m|)
      ((#%lambda (|a__B_1gVt2m| |b__Bl-dmu2m|)
         (sqrt (+ (* |a__B_1gVt2m| |a__B_1gVt2m|)
                  (* |b__Bl-dmu2m| |b__Bl-dmu2m|))))
       (real-part |num__BF5ist2m|)
       (imag-part |num__BF5ist2m|)))))
(#%define min (void))
(#%define max (void))
(#%letrec ((|_min_max__BHWbPu2m|
             (#%lambda (|proc__BpE14x2m|
                        |mv__BLA_wx2m|
                        |args__B5xZZx2m|
                        |inexact__BrtXqy2m|)
               (#%if (null? |args__B5xZZx2m|)
                 (#%if (#%if |inexact__BrtXqy2m|
                         (exact? |mv__BLA_wx2m|)
                         #f)
                   (exact->inexact |mv__BLA_wx2m|)
                   |mv__BLA_wx2m|)
                 (#%if (|proc__BpE14x2m|
                         (car |args__B5xZZx2m|)
                         |mv__BLA_wx2m|)
                   (|_min_max__BHWbPu2m|
                     |proc__BpE14x2m|
                     (car |args__B5xZZx2m|)
                     (cdr |args__B5xZZx2m|)
                     (#%if |inexact__BrtXqy2m|
                       #t
                       (inexact? (car |args__B5xZZx2m|))))
                   (|_min_max__BHWbPu2m|
                     |proc__BpE14x2m|
                     |mv__BLA_wx2m|
                     (cdr |args__B5xZZx2m|)
                     |inexact__BrtXqy2m|))))))
  (#%begin
    (#%set! min
      (#%lambda (|x1__BnP7Jv2m| . |args__B1T9gv2m|)
        (#%if (null? |args__B1T9gv2m|)
          |x1__BnP7Jv2m|
          (|_min_max__BHWbPu2m|
            <
            |x1__BnP7Jv2m|
            |args__B1T9gv2m|
            (inexact? |x1__BnP7Jv2m|)))))
    (#%set! max
      (#%lambda (|x1__B3I3Dw2m| . |args__BJL5aw2m|)
        (#%if (null? |args__BJL5aw2m|)
          |x1__B3I3Dw2m|
          (|_min_max__BHWbPu2m|
            >
            |x1__B3I3Dw2m|
            |args__BJL5aw2m|
            (inexact? |x1__B3I3Dw2m|)))))))
(#%define negative?
  (#%lambda (|n__BNpVTy2m|) (< |n__BNpVTy2m| 0)))
(#%define positive?
  (#%lambda (|n__B7mTkz2m|) (> |n__B7mTkz2m| 0)))
(#%define even?
  (#%lambda (|n__BtiRNz2m|)
    (= 0 (modulo |n__BtiRNz2m| 2))))
(#%define odd?
  (#%lambda (|n__BPePeA2m|)
    (#%if (even? |n__BPePeA2m|) #f #t)))
(#%define zero?
  (#%lambda (|n__B9bNHA2m|) (= |n__B9bNHA2m| 0)))
(#%define add1
  (#%lambda (|n__Bv7L8B2m|) (+ |n__Bv7L8B2m| 1)))
(#%define sub1
  (#%lambda (|n__BR3JBB2m|) (- |n__BR3JBB2m| 1)))
(#%define >= (void))
(#%define <= (void))
((#%lambda (|_comp_help__Bb0H2C2m| |_and2__BxYEvC2m|)
   (#%begin
     (#%set! <=
       (|_comp_help__Bb0H2C2m|
         (#%lambda (|a__BTUCYC2m| |b__BdRApD2m|)
           (#%if (< |a__BTUCYC2m| |b__BdRApD2m|)
             #t
             (= |a__BTUCYC2m| |b__BdRApD2m|)))
         |_and2__BxYEvC2m|
         #t))
     (#%set! >=
       (|_comp_help__Bb0H2C2m|
         (#%lambda (|a__BzNySD2m| |b__BVJwjE2m|)
           (#%if (> |a__BzNySD2m| |b__BVJwjE2m|)
             #t
             (= |a__BzNySD2m| |b__BVJwjE2m|)))
         |_and2__BxYEvC2m|
         #t))))
 (#%lambda (|comparator__BfGuME2m|
            |chainer__BBCsdF2m|
            |endstate__BXyqGF2m|)
   (#%lambda |args__Bhvo7G2m|
     ((#%letrec ((|loop__BDrmAG2m|
                   (#%lambda (|x__BZnk1H2m|)
                     (#%if (null? |x__BZnk1H2m|)
                       |endstate__BXyqGF2m|
                       (#%if (null? (cdr |x__BZnk1H2m|))
                         |endstate__BXyqGF2m|
                         (|chainer__BBCsdF2m|
                           (|comparator__BfGuME2m|
                             (car |x__BZnk1H2m|)
                             (cadr |x__BZnk1H2m|))
                           (|loop__BDrmAG2m| (cdr |x__BZnk1H2m|))))))))
        |loop__BDrmAG2m|)
      |args__Bhvo7G2m|)))
 (#%lambda (|x__BjkiuH2m| |y__BFggXH2m|)
   (#%if |x__BjkiuH2m| |y__BFggXH2m| #f)))
((#%lambda (|_?=__B_ceoI2m|)
   (#%begin
     (#%set! >= (|_?=__B_ceoI2m| > >=))
     (#%set! <= (|_?=__B_ceoI2m| < <=))))
 (#%lambda (|comparator__Bl9cRI2m| |chainer__BH5aiJ2m|)
   (#%lambda |args__B128LJ2m|
     (#%if (null? |args__B128LJ2m|)
       #t
       (#%if (null? (cdr |args__B128LJ2m|))
         #t
         (#%if (#%if (= (car |args__B128LJ2m|)
                        (cadr |args__B128LJ2m|))
                 #t
                 (|comparator__Bl9cRI2m|
                   (car |args__B128LJ2m|)
                   (cadr |args__B128LJ2m|)))
           (apply |chainer__BH5aiJ2m|
                  (cdr |args__B128LJ2m|))
           #f))))))
(#%define gcd
  (#%lambda |args__Bn-5cK2m|
    (#%if (null? |args__Bn-5cK2m|)
      0
      (#%if (null? (cdr |args__Bn-5cK2m|))
        (car |args__Bn-5cK2m|)
        (_gcd (car |args__Bn-5cK2m|)
              (cadr |args__Bn-5cK2m|))))))
(#%define lcm
  (#%lambda |args__BJW3FK2m|
    (#%if (null? |args__BJW3FK2m|)
      1
      (#%if (null? (cdr |args__BJW3FK2m|))
        (car |args__BJW3FK2m|)
        (_lcm (car |args__BJW3FK2m|)
              (cadr |args__BJW3FK2m|))))))
(#%define modulo
  (#%lambda (|x__B3T16L2m| |y__BpP_yL2m|)
    ((#%lambda (|r__BLLZ_L2m|)
       (#%if (#%if (negative? |y__BpP_yL2m|)
               (positive? |r__BLLZ_L2m|)
               (negative? |r__BLLZ_L2m|))
         (+ |r__BLLZ_L2m| |y__BpP_yL2m|)
         |r__BLLZ_L2m|))
     (remainder |x__B3T16L2m| |y__BpP_yL2m|))))
(#%define string-append
  (#%lambda |args__B5IXsM2m|
    (#%if (null? |args__B5IXsM2m|)
      ""
      (#%if (null? (cdr |args__B5IXsM2m|))
        (car |args__B5IXsM2m|)
        (apply string-append
               (_string-append
                 (car |args__B5IXsM2m|)
                 (cadr |args__B5IXsM2m|))
               (cddr |args__B5IXsM2m|))))))
(#%define char-downcase
  ((#%lambda (|a__BrEVVM2m|)
     ((#%lambda (|z__BNATmN2m|)
        ((#%lambda (|lc-offset__B7xRPN2m|)
           (#%lambda (|c__BttPgO2m|)
             ((#%lambda (|cv__BPpNJO2m|)
                (#%if (#%if (>= |cv__BPpNJO2m| |a__BrEVVM2m|)
                        (<= |cv__BPpNJO2m| |z__BNATmN2m|)
                        #f)
                  (integer->char
                    (+ |cv__BPpNJO2m| |lc-offset__B7xRPN2m|))
                  |c__BttPgO2m|))
              (char->integer |c__BttPgO2m|))))
         (- (char->integer #\a) |a__BrEVVM2m|)))
      (char->integer #\Z)))
   (char->integer #\A)))
(#%define char-upcase
  ((#%lambda (|a__B9mLaP2m|)
     ((#%lambda (|z__BviJDP2m|)
        ((#%lambda (|uc-offset__BReH4Q2m|)
           (#%lambda (|c__BbbFxQ2m|)
             ((#%lambda (|cv__Bx7D-Q2m|)
                (#%if (#%if (>= |cv__Bx7D-Q2m| |a__B9mLaP2m|)
                        (<= |cv__Bx7D-Q2m| |z__BviJDP2m|)
                        #f)
                  (integer->char
                    (- |cv__Bx7D-Q2m| |uc-offset__BReH4Q2m|))
                  |c__BbbFxQ2m|))
              (char->integer |c__BbbFxQ2m|))))
         (- |a__B9mLaP2m| (char->integer #\A))))
      (char->integer #\z)))
   (char->integer #\a)))
(#%define char>?
  (#%lambda (|c1__BzYwlS2m|
             |c2__Bd0zUR2m|
             .
             |args__BT3BrR2m|)
    (apply >
           (char->integer |c1__BzYwlS2m|)
           (char->integer |c2__Bd0zUR2m|)
           (map char->integer |args__BT3BrR2m|))))
(#%define char<?
  (#%lambda (|c1__BBNqIT2m|
             |c2__BfRsfT2m|
             .
             |args__BVUuOS2m|)
    (apply <
           (char->integer |c1__BBNqIT2m|)
           (char->integer |c2__BfRsfT2m|)
           (map char->integer |args__BVUuOS2m|))))
(#%define char=? eqv?)
(#%define char>=?
  (#%lambda (|c1__BXJo9U2m| |c2__BhGmCU2m|)
    (#%if (char>? |c1__BXJo9U2m| |c2__BhGmCU2m|)
      #t
      (char=? |c1__BXJo9U2m| |c2__BhGmCU2m|))))
(#%define char<=?
  (#%lambda (|c1__BDCk3V2m| |c2__BZyiwV2m|)
    (#%if (char<? |c1__BDCk3V2m| |c2__BZyiwV2m|)
      #t
      (char=? |c1__BDCk3V2m| |c2__BZyiwV2m|))))
(#%define char-ci>?
  (#%lambda (|c1__B_ncTW2m|
             |c2__BFreqW2m|
             .
             |args__BjvgZV2m|)
    (apply char>?
           (char-downcase |c1__B_ncTW2m|)
           (char-downcase |c2__BFreqW2m|)
           (map char-downcase |args__BjvgZV2m|))))
(#%define char-ci<?
  (#%lambda (|c1__B1d6eY2m|
             |c2__BHg8NX2m|
             .
             |args__BlkakX2m|)
    (apply char<?
           (char-downcase |c1__B1d6eY2m|)
           (char-downcase |c2__BHg8NX2m|)
           (map char-downcase |args__BlkakX2m|))))
(#%define char-ci=?
  (#%lambda (|c1__B320BZ2m|
             |c2__BJ528Z2m|
             .
             |args__Bn94HY2m|)
    (apply char=?
           (char-downcase |c1__B320BZ2m|)
           (char-downcase |c2__BJ528Z2m|)
           (map char-downcase |args__Bn94HY2m|))))
(#%define char-ci>=?
  (#%lambda (|c1__Bp-Z1-2m| |c2__BLWXu-2m|)
    (#%if (char-ci>? |c1__Bp-Z1-2m| |c2__BLWXu-2m|)
      #t
      (char-ci=? |c1__Bp-Z1-2m| |c2__BLWXu-2m|))))
(#%define char-ci<=?
  (#%lambda (|c1__B5TVX-2m| |c2__BrPTo_2m|)
    (#%if (char-ci<? |c1__B5TVX-2m| |c2__BrPTo_2m|)
      #t
      (char-ci=? |c1__B5TVX-2m| |c2__BrPTo_2m|))))
(#%define char-alphabetic?
  (#%lambda (|c__BNLRR_2m|)
    (#%if (char<? #\@ |c__BNLRR_2m| #\[)
      #t
      (char<? #\` |c__BNLRR_2m| #\{))))
(#%define char-numeric?
  (#%lambda (|c__B7IPi03m|)
    (char<? #\/ |c__B7IPi03m| #\:)))
(#%define char-whitespace?
  (#%lambda (|c__BtENL03m|)
    (#%if (char=? |c__BtENL03m| #\space)
      #t
      (#%if (char=? |c__BtENL03m| #\tab)
        #t
        (#%if (char=? |c__BtENL03m| #\newline)
          #t
          (char=? |c__BtENL03m| #\return))))))
(#%define char-upper-case?
  (#%lambda (|c__BPALc13m|)
    (char<? #\@ |c__BPALc13m| #\[)))
(#%define char-lower-case?
  (#%lambda (|c__B9xJF13m|)
    (char<? #\` |c__B9xJF13m| #\{)))
(#%define string-downcase (void))
(#%define string-upcase (void))
(#%letrec ((|string-map__BvtH623m|
             (#%lambda (|strsrc__Bdbxn43m|
                        |strdst__Bz7vQ43m|
                        |proc__BV3th53m|
                        |n__Bf0rK53m|
                        |l__BBYob63m|)
               (#%if (< |n__Bf0rK53m| |l__BBYob63m|)
                 (#%begin
                   (string-set!
                     |strdst__Bz7vQ43m|
                     |n__Bf0rK53m|
                     (|proc__BV3th53m|
                       (string-ref |strsrc__Bdbxn43m| |n__Bf0rK53m|)))
                   (|string-map__BvtH623m|
                     |strsrc__Bdbxn43m|
                     |strdst__Bz7vQ43m|
                     |proc__BV3th53m|
                     (+ |n__Bf0rK53m| 1)
                     |l__BBYob63m|))
                 |strdst__Bz7vQ43m|))))
  (#%begin
    (#%set! string-downcase
      (#%lambda (|str__BRpFz23m|)
        ((#%lambda (|newstr__BbmD033m|)
           (|string-map__BvtH623m|
             |str__BRpFz23m|
             |newstr__BbmD033m|
             char-downcase
             0
             (string-length |str__BRpFz23m|)))
         (make-string (string-length |str__BRpFz23m|)))))
    (#%set! string-upcase
      (#%lambda (|str__BxiBt33m|)
        ((#%lambda (|newstr__BTezW33m|)
           (|string-map__BvtH623m|
             |str__BxiBt33m|
             |newstr__BTezW33m|
             char-upcase
             0
             (string-length |str__BxiBt33m|)))
         (make-string (string-length |str__BxiBt33m|)))))))
(#%define string=? equal?)
(#%define string<?
  (#%letrec ((|s<?__BXUmE63m|
               (#%lambda (|s1__BZJg_73m| |s2__BjGes83m|)
                 (#%if (null? |s1__BZJg_73m|)
                   (#%if (null? |s2__BjGes83m|) #f #t)
                   (#%if (null? |s2__BjGes83m|)
                     #f
                     ((#%lambda (|c1__BFCcV83m| |c2__B_yam93m|)
                        (#%if (char<? |c1__BFCcV83m| |c2__B_yam93m|)
                          #t
                          (#%if (char>? |c1__BFCcV83m| |c2__B_yam93m|)
                            #f
                            (|s<?__BXUmE63m|
                              (cdr |s1__BZJg_73m|)
                              (cdr |s2__BjGes83m|)))))
                      (car |s1__BZJg_73m|)
                      (car |s2__BjGes83m|)))))))
    (#%lambda (|s1__BhRk573m| |s2__BDNiy73m|)
      (|s<?__BXUmE63m|
        (string->list |s1__BhRk573m|)
        (string->list |s2__BDNiy73m|)))))
(#%define string>?
  (#%letrec ((|s>?__Blv8P93m|
               (#%lambda (|s1__Bnk2ab3m| |s2__BJg0Db3m|)
                 (#%if (null? |s2__BJg0Db3m|)
                   (#%if (null? |s1__Bnk2ab3m|) #f #t)
                   (#%if (null? |s1__Bnk2ab3m|)
                     #f
                     ((#%lambda (|c1__B3d-3c3m| |c2__Bp9Ywc3m|)
                        (#%if (char>? |c1__B3d-3c3m| |c2__Bp9Ywc3m|)
                          #t
                          (#%if (char<? |c1__B3d-3c3m| |c2__Bp9Ywc3m|)
                            #f
                            (|s>?__Blv8P93m|
                              (cdr |s1__Bnk2ab3m|)
                              (cdr |s2__BJg0Db3m|)))))
                      (car |s1__Bnk2ab3m|)
                      (car |s2__BJg0Db3m|)))))))
    (#%lambda (|s1__BHr6ga3m| |s2__B1o4Ja3m|)
      (|s>?__Blv8P93m|
        (string->list |s1__BHr6ga3m|)
        (string->list |s2__B1o4Ja3m|)))))
(#%define string<=?
  (#%lambda (|s1__BL5WZc3m| |s2__B52Uqd3m|)
    (#%if (string<? |s1__BL5WZc3m| |s2__B52Uqd3m|)
      #t
      (string=? |s1__BL5WZc3m| |s2__B52Uqd3m|))))
(#%define string>=?
  (#%lambda (|s1__Br-RTd3m| |s2__BNWPke3m|)
    (#%if (string>? |s1__Br-RTd3m| |s2__BNWPke3m|)
      #t
      (string=? |s1__Br-RTd3m| |s2__BNWPke3m|))))
(#%define string-ci=?
  (#%lambda (|s1__B7TNNe3m| |s2__BtPLef3m|)
    (string=?
      (string-downcase |s1__B7TNNe3m|)
      (string-downcase |s2__BtPLef3m|))))
(#%define string-ci<?
  (#%lambda (|s1__BPLJHf3m| |s2__B9IH8g3m|)
    (string<?
      (string-downcase |s1__BPLJHf3m|)
      (string-downcase |s2__B9IH8g3m|))))
(#%define string-ci>?
  (#%lambda (|s1__BvEFBg3m| |s2__BRAD2h3m|)
    (string>?
      (string-downcase |s1__BvEFBg3m|)
      (string-downcase |s2__BRAD2h3m|))))
(#%define string-ci>=?
  (#%lambda (|s1__BbxBvh3m| |s2__BxtzYh3m|)
    (string>=?
      (string-downcase |s1__BbxBvh3m|)
      (string-downcase |s2__BxtzYh3m|))))
(#%define string-ci<=?
  (#%lambda (|s1__BTpxpi3m| |s2__BdmvSi3m|)
    (string<=?
      (string-downcase |s1__BTpxpi3m|)
      (string-downcase |s2__BdmvSi3m|))))
(#%define substring
  (#%letrec ((|fill-string__Bzitjj3m|
               (#%lambda (|sstr__Bh0jAl3m|
                          |dstr__BDYg1m3m|
                          |n__BZUeum3m|
                          |s__BjRcXm3m|
                          |e__BFNaon3m|)
                 (#%if (< |s__BjRcXm3m| |e__BFNaon3m|)
                   (#%begin
                     (string-set!
                       |dstr__BDYg1m3m|
                       |n__BZUeum3m|
                       (string-ref |sstr__Bh0jAl3m| |s__BjRcXm3m|))
                     (|fill-string__Bzitjj3m|
                       |sstr__Bh0jAl3m|
                       |dstr__BDYg1m3m|
                       (+ |n__BZUeum3m| 1)
                       (+ |s__BjRcXm3m| 1)
                       |e__BFNaon3m|))
                   #!void))))
    (#%lambda (|str__BVerMj3m|
               |start__Bfbpdk3m|
               |end__BB7nGk3m|)
      ((#%lambda (|newstr__BX3l7l3m|)
         (#%begin
           (|fill-string__Bzitjj3m|
             |str__BVerMj3m|
             |newstr__BX3l7l3m|
             0
             |start__Bfbpdk3m|
             |end__BB7nGk3m|)
           |newstr__BX3l7l3m|))
       (make-string
         (- |end__BB7nGk3m| |start__Bfbpdk3m|))))))
(#%define list-ref
  (#%lambda (|list__B_J8Rn3m| |n__BlG6io3m|)
    (#%if (zero? |n__BlG6io3m|)
      (car |list__B_J8Rn3m|)
      (list-ref
        (cdr |list__B_J8Rn3m|)
        (- |n__BlG6io3m| 1)))))
(#%define values
  (#%lambda |args__BHC4Lo3m|
    (call-with-current-continuation
      (#%lambda (|k__B1z2cp3m|)
        (apply |k__B1z2cp3m| |args__BHC4Lo3m|)))))
